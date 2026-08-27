# 청년층 AI 금융 자립 & 지출 케어 내비게이션 — 설득력 리서치 보고

## 1. 범위·방법
- 주제: 대학생·취준생·사회초년생의 AI 기반 금융 자립/지출 케어
- 목표 산출: 문제 정의 → 개념적 솔루션 → 핵심 기능 → 구현 기술의 '왜' 체인
- 방법: 병렬 리서치 워커(공식 지표 / 기존 솔루션+기술 / 커뮤니티 / SNS·영상) + 부모 직접 검색 보완
- 소스 등급: A 원전/공식 통계, B 공식 문서, C 전문 매체, D 2차 분석, E 체험·SNS 신호

## 2. 요약 답
청년층 문제는 "돈이 없어서"만이 아니라 **(1) 관리 행동이 습관화되지 않았고, (2) 소득이 불규칙해 고정예산 모델이 안 맞으며, (3) 소액 반복 소비·구독이 눈에 안 보이게 누적**되는 데 있다.
기존 앱은 데이터 수집과 단순 리포트까지는 잘하지만, **불규칙 소득에 맞춘 실행 가능한 다음 행동 제안**이 약하다.
따라서 개념적 솔루션은 "자동 수집 → AI 진단 → 작은 실행(행동 개입)" 루프이며, 핵심은 예산표가 아니라 **주간 케어 사이클**이다.

## 3. 문제 정의 근거 (A~C 중심)
| 근거 | 수치/내용 | 출처 |
|---|---|---|
| 20대 금융이해력 | 62.6점, 전체 평균 65.7점보다 낮음, 2022년 대비 -3.2점 | 한국은행 2024 전국민 금융이해력 조사 |
| 취약 영역 | 지식보다 '금융행위/재무관리 실천'이 약함 | 한국은행/KDI 동일 조사 해설 |
| 구독 지출 | 20대 월 평균 44,428원, 연환산 약 53만원, 이용률 OTT 90.1%/쇼핑 멤버십 83.8% | 서울시 실태조사 보도(etnews) |
| 구독 피로 | 전체 규모 공식통계 부재, 소액 구독 누적으로 비용 축적 | 연합뉴스 팩트체크 |
| 외식/배달 | 2026년 소비 부담 1순위 카테고리이자 절감 1순위 | 트렌드모니터 조사 |
| 무현금 소비 | 카드/간편결제 중심 소비로 자동 추적 가능성 상승 | 신한카드 2026 트렌드, 통계청 온라인지출 nowcast |

커뮤니티(E, demand signal): 가계부 실패 = 수기 입력 번거로움 + 자동분류 오류 + 유료 게이트. 도움됐던 방식 = '받자마자 선분배'와 주간 단위 관리.

## 4. 개념적 솔루션: 왜 B인가
### B1. AI 지출 케어 코파일럿(자동 수집 + 진단 + 행동 제안)
- 왜: 이미 토스 20대 가입률 ~95%, MZ 금융앱 사용 97.6%로 데이터 수집 인프라는 익숙. 부족한 건 '다음 행동' 제안.
- 왜 기존 앱으로 부족: 토스는 조회·분류 중심(구 잔소리봇 종료), 뱅크샐러드는 분류 오류 시 사용자 수정 부담 명시. Rocket Money는 구독 해지를 대행하지만 유료 프리미엄.
- 결론: 수집은 빌리고, 차별화는 '진단→행동' 루프에서 나온다.

### B2. 불규칙 소득 적응형 버짓 엔진(선할당 버킷)
- 왜: 알바/프리랜서/조건수당 등 변동소득에서 고정월예산은 즉시 깨진다. 커뮤니티 검증 포맷이 '받는 순간 필수/여가/저축/비상금 선분배'.
- 왜 AI 필요: 과거 소득·지출 패턴에서 안전 배분율을 계산해야 사람이 감으로 정하는 걸 줄일 수 있음.

### B3. 구독·반복결제 컨트롤 타워
- 왜: 구독은 소액 다건이라 누적 피해가 크고, 해지 마찰이 높아 방치된다.
- 기존 격차: 국내 주류 앱은 '보여주기'까지만 하고 해지 액션까지 끌어가는 경우가 드묾.

## 5. 핵심 기능(C)과 '왜'
### F1. 거래내역 자동 수집·정규화
- 왜: 수기 입력은 최대 이탈 원인. 카드사 CSV 업로드가 현실적 1순위(법적/기술적 마찰 최소), 오픈뱅킹 테스트베드는 데모용 병행.
- 산출물: 표준 트랜잭션 스키마(날짜/가맹점/금액/채널).

### F2. LLM 기반 자동 분류 + 사용자 교정 학습
- 왜: 가맹점명 노이즈 때문에 rule-only 분류는 한계. LLM function calling으로 후보 카테고리 + 근거를 같이 내보면 오류 수정 비용을 줄일 수 있음.
- 보완: 사용자 수정 로그를 few-shot 예시로 재사용.

### F3. 주간 지출 진단 리포트(소액 반복·카테고리 이탈 감지)
- 왜: 청년 소비 실패는 소액 반복 누적이므로 '월 말 폭탄'보다 주간 인터벌이 행동 개입에 유리.
- 기술: 카테고리별 주간 합계 + IsolationForest 이상 점수 + 간단한 설명 생성(LLM).

### F4. 다음 행동 카드(Next Best Action)
- 왜: 리포트만으로는 행동이 안 바뀜. "이번 주 배달 -2회", "구독 X 해지"처럼 실행 가능한 1개 제안만 노출.
- 기술: rule + LLM function calling(안전한 제안만 허용), 유사 소비자 패턴 참고는 stretch(pgvector/HNSW).

### F5. 구독 자동 탐지 + 해지 플레이북
- 왜: 반복 결제 탐지는 deterministic하게 가능(주기·금액 유사성), 해지는 서비스별 절차가 달라 LLM RAG로 가이드 생성.
- 기존 대비: 무료 사용자도 '해지 가이드'까지는 무료로 제공해 Rocket Money식 유료 게이트와 차별화.

### F6. 목표 선할당 버킷 + 진행 시각화
- 왜: '받자마자 분배'는 커뮤니티 검증 멘탈 모델. 목표(비상금 100만 등) 시각화가 동기 유지에 도움.
- 기술: 단순 CRUD + 상태 머신, AI는 배분율 추천 보조.

## 6. 기술 매핑(D/E)과 '왜 이것인가'
| 기능 | 채택 기술 | 왜 D+E인가 / 대안 F+G가 아닌 이유 | 구현 가능성 |
|---|---|---|---|
| F1 수집·정규화 | 카드사 CSV 파서(Pandas) + KFTC 오픈뱅킹 테스트베드 | 실계좌 운영 API는 이용기관 승인·보안점검 필요 → 5주 프로젝트 범위 밖. CSV는 법적 마찰 최소 | 높음(형식 3~4개 카드사 우선) |
| F2 분류 | LLM structured output(function calling) + few-shot | rule-only는 신규 가맹점 취약, full fine-tuning은 데이터 부족·비용 과잉 | 높음(스키마 강제 + 재시도) |
| F3 진단 | statsmodels ARIMA(주간 예측) + sklearn IsolationForest | Prophet은 유지보수 모드(v1.4.0)로 신기능 중단 위험. 딥러닝 시계열은 5주 내 튜닝·해석 부담 | 높음(문서·예제 풍부) |
| F4 NBA | rule engine + LLM function calling | 순수 LLM 자유생성은 금융 조언 리스크, rule-first로 안전 경계 설정 | 높음 |
| F5 구독 탐지·해지 | 주기성 탐지(rule/clustering) + LLM RAG(공식 해지 문서 검색) | 해지 절차는 자주 바뀌므로 fine-tune보다 RAG가 유지보수 유리 | 중상(문서 크롤링 범위 제한 필요) |
| F6 버킷 | PostgreSQL + 상태머신, (선택)pgvector | 벡터검색은 stretch. RA 선택 가이드 기준 RAM 여유·고차원 벡터면 HNSW가 1차 후보 | 매우 높음 |

## 7. 5주 실행 스코프(6인)
- W1: 표준 트랜잭션 스키마 확정, 카드사 3종 CSV 파서, 더미 데이터셋
- W2: LLM 분류 파이프라인 + 사용자 교정 UI
- W3: ARIMA/IsolationForest 진단 + 주간 리포트 생성
- W4: NBA 카드 + 구독 탐지/해지 가이드(RAG)
- W5: 버킷 UX + E2E 시나리오(업로드→진단→행동) QA

## 8. 미확인/한계
- 청년층 소득-부채 세부 통계는 이번 패스 미확보(가계금융복지조사 원문 확인 필요)
- 에브리타임/블라인드 원문은 로그인 제약으로 2차 인용만
- Instagram/TikTok/X 원문 접근 제약, YouTube 조회수는 인덱스 시점 기준
- 카드사별 CSV 스펙은 공식 헬프 문서 추가 확인 필요

## 9. 참고 문헌(주요)
- 한국은행 2024 전국민 금융이해력 조사: https://www.bok.or.kr/portal/bbs/B0000502/view.do?menuNo=201265&nttId=10091152
- KDI 경제교육·정보센터 해설: https://eiec.kdi.re.kr/policy/materialView.do?num=266065
- 서울시 구독 실태조사 보도(etnews): https://www.etnews.com/20250416000319
- 연합뉴스 구독 팩트체크: https://www.yna.co.kr/view/AKR20251021080900518
- 트렌드모니터 2026 소비 전망: https://www.trendmonitor.co.kr/tmweb/trend/allTrend/detail.do?bIdx=3319&code=0401&trendType=CKOREA
- 신한카드 2026 트렌드: https://www.shinhangroup.com/kr/archive/press/detail/600
- MZ 금융앱 사용(etnews): https://www.etnews.com/20240927000308
- 토스 3000만: https://toss.im/tossfeed/article/RU3000
- 뱅크샐러드 가계부 가이드: https://www.banksalad.com/articles/%EA%B0%80%EA%B3%84%EB%B6%80%EC%96%B4%ED%94%8C-%EC%B6%9C%ED%94%8C-%EC%93%B0%EB%8A%94%EB%B2%95-%EB%8F%88%EA%B4%80%EB%A6%AC
- Rocket Money FAQ/help: https://www.rocketmoney.com/faq , https://help.rocketmoney.com/en/articles/934402-how-do-i-cancel-a-subscription-on-rocket-money
- 토스 마이데이터 안내: https://toss.im/tossfeed/article/mydata-register
- KFTC 오픈뱅킹 개발자사이트: https://developers.kftc.or.kr/
- KFTC 이용기관 요건: https://openapi.kftc.or.kr/service/openBanking
- 금융위 보안요건: https://www.fsc.go.kr/po010101/73746
- Prophet README(유지보수 모드): https://github.com/facebook/prophet/blob/main/README.md
- statsmodels ARIMA: https://www.statsmodels.org/stable/generated/statsmodels.tsa.arima.model.ARIMA.html
- sklearn IsolationForest: https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.IsolationForest.html
- RA 선택 가이드(ANN): C:/Users/SSAFY/Desktop/RA/docs/10-selection-guide.md

