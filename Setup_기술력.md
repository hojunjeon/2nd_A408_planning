# Setup — 기술력 검증 문서

> 이 문서는 `Setup_기획.md`(설득력)와 별개로, 선택한 기술이 **정말 구현 가능한가**를 검증합니다.
> 평가 기준: 적합성 / 구현 가능성 / 난이도 / 대안 비교 / 고도화 방안 / 사전 검증(PoC)

---

## 1. 요약 매트릭스: 기능 × 기술 × 기술력 평가

| # | 기능 | 채택 기술 | 적합성 | 5주 내 구현 | 난이도 | 대안 배제 이유 | 고도화 트리거 | PoC 상태 |
|---|---|---|---|---|---|---|---|---|
| F1 | 거래내역 수집 | Pandas + openpyxl (CP949/EUC-KR) | ✅ 카드사 XLSX/CSV 다운로드 지원 확인 | ✅ W1 | 낮음 | 웹 스크래핑(약관 위반), SMS 파싱(법적 미확인) | KFTC 오픈뱅킹 운영 전환(이용기관 승인 시) | ✅ 로컬 PoC 완료 |
| F2 | LLM 자동 분류 | rule-first → LLM fallback (OpenAI structured output strict:true) | ✅ 스키마 준수 100% 보장(A) | ✅ W2 | 중간 | rule-only(신규 가맹점 취약), full fine-tuning(데이터 부족·비용 과잉) | 사용자 교정 데이터 5k+ 축적 시 KLUE-RoBERTa fine-tune | ⏳ W2 시작 시 50건 실측 필요 |
| F3 | 이상 탐지 | Rolling z-score (주 단위, 카테고리별) | ✅ n≈100에서 IsolationForest보다 안정적(A) | ✅ W3-W4 | 낮음 | IsolationForest(Liu et al. 2008: n≥128 필요), ARIMA(baseline엔 과함) | 사용자 >5000 & FP>30% 시 IsolationForest 재도입 | ✅ 공식 문서 근거 확보 |
| C1 | 인과 서사 생성 | Pandas 집계 feature → LLM structured output | ✅ 통계가 사실 근거 강제 → hallucination 방지 | ✅ W3 | 중간 | 순수 LLM(hallucination), 복잡 인과추론 ML(5주 밖) | feature 종류 확대(시간대 클러스터, 버킷 잔액 변화율 등) | ⏳ W3 프롬프트 설계 필요 |
| C2/C4 | 미래 궤적 계산 | numpy-financial fv() — deterministic | ✅ 예적금은 고정금리+매칭이므로 결정론적이 정확(A) | ✅ W3 (검증 완료) | 낮음 | Monte Carlo(투자용, 오버엔지니어링), ARIMA(불확실성 모델링 불필요) | 투자형 도약계좌 도입 시 Monte Carlo 추가 | ✅ fv() = 45,942,121원 검증 |
| C3 | 정책 매칭 | JSON-based condition evaluator + 온통청년 API | ✅ 연령·소득·거주지는 결정론적 판정이 안전(B) | ✅ W4 | 중간 | LLM 자격 판정(오류 위험), sklearn decision tree(과설계) | 정책 수 >50종 시 rule engine 프레임워크화 | ⏳ API 가입 후 응답 필드 확인 필요 |
| C5 | if-then 계획 | Template engine + LLM rewriting | ✅ Template이 안전 경계, LLM은 멘탈 라벨 번역만 | ✅ W5 | 낮음 | LLM 단독 자유생성(금융 조언 리스크) | 사용자 멘탈 라벨 학습(온보딩 질문 vs 패턴 추론 A/B) | 설계 완료 |
| UI | 궤적 차트 | Recharts(React) 또는 fl_chart(Flutter) | ✅ baseline+scenario 겹치기 + 슬라이더 = 기본 기능 | ✅ W4-W5 | 낮음 | D3.js(러닝커브), 커스텀 Canvas(불필요) | 데이터 >10K 포인트 시 viewport 렌더링 최적화 | 설계 완료 |

---

## 2. 항목별 상세 검증

### 2-1. CSV 파싱 (F1)

| 항목 | 결과 | 출처 |
|---|---|---|
| 카드사 다운로드 형식 | 신한·KB·삼성 모두 XLSX/CSV 제공 | 블로그(C), 공식 헬프(B) |
| 인코딩 | CP949/EUC-KR 표준 (UTF-8 시도 시 UnicodeDecodeError) | 로컬 PoC + 블로그(C) |
| Merged cell | skiprows=1 처리 성공 | 로컬 PoC(pandas 3.0.5 + openpyxl 3.1.5) |
| Footer 합계 행 | '합계' 문자열 필터링 성공 | 로컬 PoC |
| 컬럼명 매핑 | 카드사·메뉴별로 상이 → 헤더 매핑 레이어 필수 | 블로그(C), 추정 |
| Fallback chain | utf-8-sig → cp949 → euc-kr 순서로 시도 | 로컬 PoC(chardet confidence 0.24 → fallback 필수) |
| KFTC 테스트베드 | 더미 데이터 제공, OAuth 흐름 데모 가능; 운영은 이용기관 승인 필요 | [developers.kftc.or.kr](https://developers.kftc.or.kr/)(B) |

**PoC 결과**: pandas 3.0.5 + openpyxl 3.1.5 환경에서 merged cell 처리, footer 필터링, CP949 감지 모두 동작 확인.

### 2-2. LLM 분류 (F2)

| 항목 | 결과 | 출처 |
|---|---|---|
| Schema adherence | gpt-4o-2024-08-06 with strict:true = 100% (gpt-4-0613 <40%) | [OpenAI 공식](https://openai.com/index/introducing-structured-outputs-in-the-api/)(A) |
| Schema ≠ semantic correctness | 유효 JSON 내 잘못된 값 가능 → 앱 레벨 enum 검증 필수 | OpenAI(A) + [JSONSchemaBench](https://arxiv.org/abs/2501.10868)(B) |
| Rule-first coverage | Top ~200 반복 가맹점 사전으로 60-80% 무비용 처리 | 업계 관행(low confidence, 벤치마크 부재) |
| LLM fallback accuracy | Non-Korean SME bank study: 68%→73.4% after calibration | [arXiv 2508.05425](https://arxiv.org/html/2508.05425v1)(C) |
| Korean merchant benchmark | 공개 벤치마크 없음 → 팀 자체 100+ 레이블 세트 필요 | [KFinEval-Pilot](https://arxiv.org/abs/2504.13216)(B): categorization 평가 없음 명시 |
| Fine-tuning 대안 | KLUE-RoBERTa 500-5,000 examples, single GPU, <10ms/sample | 일반 ML 지식(low confidence, 특정 논문 미확인) |
| Cost estimate | gpt-4o-mini ~$0.03 per 1k transactions (20 tx/batch) | 추산, 실측 필요 |

**PoC 계획(W2 시작)**: 50건 실제 한국 카드 CSV → rules-only vs rules+LLM 비교 (accuracy %, cost, latency).

### 2-3. 이상 탐지 (F3)

| 항목 | 결과 | 출처 |
|---|---|---|
| IsolationForest 수렴 조건 | n≥128 sub-sample size에서 path length 수렴 | [Liu et al. 2008 ICDM](https://cs.nju.edu.cn/zhouzh/zhouzh.files/publication/icdm08b.pdf)(A) |
| 청년 1인 데이터량 | ~100건/3-6개월 → IsolationForest 불안정 | Liu et al.(A) 유추 |
| 대안: rolling z-score | 주 단위 카테고리 합계에 mean+2σ → 소표본에 적합 | 통계 표준 |
| contamination tuning | IsolationForest 사용 시 0.05-0.15 권장 | [scikit-learn 공식](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html)(A) |
| 고도화 트리거 | user >5000 AND labeled FP >30% OR sequence pattern 필요 시 LSTM/Transformer | 설계 판단(low confidence) |

**결론**: MVP는 rolling z-score로 시작. IsolationForest는 stretch(W4 go/no-go).

### 2-4. 미래 자산 계산 (C2/C4)

| 항목 | 결과 | 출처 |
|---|---|---|
| fv() 공식 | pv*(1+r)^n + pmt*((1+r)^n - 1)/r (when=0 ordinary annuity) | [numpy-financial 공식 문서](https://numpy.org/numpy-financial/latest/fv.html)(A) |
| 검증 | fv(0.036/12, 60, -700000, 0) = 45,942,121원 | 로컬 실행(numpy-financial 1.0.0) |
| edge cases | rate=0 → 단순합; pmt<0 = 입금; when=1 annuity-due | numpy-financial(A) |
| Monte Carlo 배제 | 예적금·소비는 변동성 없음 → deterministic이 해석 가능성 우위 | 설계 원칙 |
| 고도화 | 투자형 도약계좌 도입 시 Monte Carlo/scipy 추가 | 설계 판단 |

### 2-5. 정책 매칭 (C3)

| 항목 | 결과 | 출처 |
|---|---|---|
| API 존재 | 온통청년 REST API: policy name, age, income, region, period 필드 | [youthcenter.go.kr](https://www.youthcenter.go.kr/opi/quickSearchList.do)(B) |
| Auth key | 필요; rate limit 미확인 | youthcenter.go.kr(B) |
| Rule engine | JSON condition evaluator(age/income/region check)가 5주 내 가장 빠름 | 설계 판단(medium confidence) |
| LLM 역할 | 자격 판정 금지; 출처 기반 설명만 | 설계 원칙 |
| 고도화 | 정책 >50종 시 decision tree framework 고려 | 설계 판단 |

**미확인**: API 실제 응답 스키마·pagination — W1에 가입 후 샘플 호출 필수.

### 2-6. if-then 계획 (C5)

| 항목 | 결과 |
|---|---|
| Template engine | Jinja2 or simple string format — 안전 경계(금융 조언 아님) |
| LLM rewriting | Template 출력을 사용자 멘탈 라벨("여가비","월급루틴")로 번역 |
| 근거 | Gollwitzer & Sheeran d=0.65: 구체 계획만 행동 변화 효과 |
| 고도화 | 멘탈 라벨 학습: 온보딩 질문 vs 거래 패턴 추론 A/B 실험 |

---

## 3. 개발 공수 추정

| 컴포넌트 | 예상 dev hours | 우선순위 |
|---|---|---|
| CSV 파서 + 인코딩 fallback | 8h | W1 필수 |
| 헤더 매핑 레이어(카드사 3종) | 6h | W1 필수 |
| Rule-first 분류기(top 200 merchant dict) | 4h | W2 필수 |
| LLM structured output pipeline | 8h | W2 필수 |
| Rolling z-score anomaly detector | 4h | W3 필수 |
| fv() baseline projection API | 4h | W3 필수 |
| 인과 feature extraction(빈도·시간대) | 8h | W3 필수 |
| 인과 서사 LLM prompt v1 | 6h | W3-W4 |
| 온통청년 API 연동 + JSON rule evaluator | 8h | W4 |
| Scenario delta calculation(slider) | 4h | W4 |
| Recharts/fl_chart 궤적 차트 | 8h | W4-W5 |
| if-then template + LLM rewrite | 4h | W5 |
| E2E QA + 발표 준비 | 16h | W5 |
| **합계** | **88h ≈ 11일(1인 기준)** | **6인 × 5주 = 150인시 충분** |

---

## 4. 리스크 및 대응

| 리스크 | 영향 | 확률 | 대응 |
|---|---|---|---|
| 카드사 CSV 컬럼 예상과 다름 | 파서 재작성 | 높음 | W1에서 실제 파일 3종 입수 후 즉시 검증; 실패 시 붙여넣기 입력 fallback |
| 온통청년 API auth/rate limit | 정책 매칭 불가 | 중 | W1 가입 + 샘플 호출; 실패 시 하드코딩된 정책 2-3종 |
| LLM semantic error(스키마는 맞지만 값이 틀림) | 잘못된 카테고리 할당 | 중 | 앱 레벨 enum validation + 사용자 교정 UI + few-shot 축적 |
| 한국 가맹점 벤치마크 부재 | 정확도 검증 곤란 | 높음 | 팀 내부 100+ 레이블 세트 직접 구축 |
| IsolationForest 소표본 불안정 | false positive 과다 | 높음 | rolling z-score로 먼저; IsoForest는 stretch |
| 5주 내 기능 과다 | 데모 품질 저하 | 높음 | MVP 엄격; "가능하면"은 W4 시작 시 go/no-go |

---

## 5. 미확인 항목 (구현 전 해소 필요)

| 항목 | 언제 확인 | 방법 |
|---|---|---|
| 실제 카드사 CSV 컬럼명·순서 | W1 Day 1-2 | 팀원 각자 카드 다운로드 → 스키마 비교 |
| 온통청년 API auth key 발급 + 응답 필드 | W1 | 가입 후 quickSearchList.do 호출 |
| LLM 한국 가맹점 분류 실측 정확도 | W2 시작 | 50건 실제 데이터 rules vs rules+LLM A/B |
| gpt-4o-mini token cost per batch | W2 | API 사용량 리포트 확인 |
| KFTC 테스트베드 dummy response schema | W4(선택) | 개발자사이트 가입 후 테스트 서비스 신청 |
