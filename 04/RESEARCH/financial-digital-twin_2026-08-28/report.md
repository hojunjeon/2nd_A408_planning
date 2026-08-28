# 금융 디지털 트윈 — 리서치 리포트

조사일: 2026-08-28 · 세션: `04/RESEARCH/financial-digital-twin_2026-08-28`
대상 프로젝트: 셋업(Setup) — 소비 관리 게이미피케이션 앱 (`04/개선된_기획_게이미피케이션_v4.md`)

## 조사 범위와 방법

8개 축을 병렬 스카우트로 조사했다. 각 축은 자기 파일만 쓰고, 이 리포트는 부모가 단독으로 종합했다.

| 축 | 파일 | 소스 | 상태 |
| --- | --- | --- | --- |
| A 표준·규제·공식 정의 | `worker-A-official.md` | 18 | 완료 (NIST 정의 BLOCKED) |
| B 학술·알고리즘 | `worker-B-academic.md` | 22 | 완료 (정기결제 탐지 논문 BLOCKED) |
| C 산업 사례·벤더 | `worker-C-industry.md` | 20 | 부분 (국내·DToC 벤더 BLOCKED) |
| D 국내 뉴스·정책 | `worker-D-korea.md` | 34 | 완료 (본문 인용구 미확보) |
| E 커뮤니티·OSS | `worker-E-community.md` | 7 | 부분 (분류·시각화·ABM BLOCKED) |
| F 위키·영상·SNS | `worker-F-wiki-video-social.md` | 8 | 부분 (위키·영상 BLOCKED) |
| G 데이터셋·시각화 | `worker-G-datasets-viz.md` | 15 | 부분 (시각화 전량 BLOCKED) |
| H 자동저축 선례 | `worker-H-autosave-dtoc.md` | 12 | 부분 (DToC·국내 BLOCKED) |
| I·J 기획서 수치 검증 | `worker-I/J-stat-verification*.md` | — | 6항목 전수 판정 완료 |

등급: A=표준·peer-reviewed·규제기관·특허·법정공시 / B=공식 제품·정책 문서 / C=업계·언론 / D=preprint·2차분석 / E=홍보·일화.
검색 예산 소진이 반복돼 여러 축이 부분 완료다. 공백은 추정으로 채우지 않고 BLOCKED로 남겼다.

---

## 결론 먼저

**1. 기능의 선례는 풍부하고, 용어의 선례는 없다.**
셋업이 하려는 일(거래 분류 → 정기결제 탐지 → 현금흐름 예측 → 출금 전 자금 이동)은 상용 구현이 확실히 존재한다.
그런데 그 제품들은 자기 기능을 **'디지털 트윈'이라 부르지 않는다.** 반대로 '디지털 트윈'이라 불리는 금융권 사례는
전부 물리·인프라 자산(데이터센터, 영업점 공간, 토큰화 자산)이다. **개인 소비·자금흐름을 트윈으로 구현한 사례는 국내외 조사 범위에서 0건.**

**2. 그래도 용어는 방어된다 — 단 정의를 먼저 못 박아야 한다.**
Digital Twin Consortium의 공식 정의가 대상을 `real-world entities **and processes**`로 규정하고,
동기화를 `at a **specified** frequency`로 규정한다. 개인의 자금흐름은 real-world process이고, 데모 데이터·배치 동기화는 정의 위반이 아니다.
여기에 Gartner의 **Digital Twin of a Customer(DToC)** 정의가 `개인`과 `anticipate behavior`를 명시한다. 우리 '페이스' 예측이 정확히 여기 대응한다.

**3. 차별점을 '예측'에 두면 안 된다.**
Plaid가 이미 정기 유입·유출 스트림 분리, 주기 추정, 다음 결제일·금액 예측을 API로 판다. 예측을 내세우면 기성 제품과 겹친다.
고유한 지점은 예측 **이후의 실행**(출금 전 자금 준비)과 **건 단위 귀속**('이 이체는 8/25 통신비 건')이다.

**4. 가장 중요한 발견은 성공 사례가 아니라 규제 제재다.**
자동 저축 앱 Digit은 '오버드래프트 무발생 보장'을 광고했고, CFPB가 이를 허위로 판정했다(2022-08-10, 배상 최소 $68,145 + 벌금 $2.7M).
실제로 자동 이체가 오버드래프트를 유발했다. **셋업의 난이도는 '이체 구현'이 아니라 '지금 옮겨도 안전한가 판정'에 있다.**

**5. 기획서 수치 6건 중 그대로 쓸 수 있는 것은 1건뿐이다.** (아래 §수치 검증 — 발표 전 필수 수정)

---

## 1. 개념 — 인용 가능한 정의

### 1-1. Digital Twin Consortium (2020) ★ 슬라이드 1순위

> "A digital twin is a virtual representation of real-world entities and processes, synchronized at a specified frequency and fidelity."

— Digital Twin Consortium, "Digital Twin Consortium Defines Digital Twin", 2020-12.
https://www.digitaltwinconsortium.org/2020/12/digital-twin-consortium-defines-digital-twin/ (등급 A, 원문 확인)

이 정의가 1순위인 이유는 두 단어다. **`and processes`** — 물리자산이 아니어도 된다. **`specified` frequency** — 실시간을 요구하지 않는다.
현행 확장 문구는 `integrated data-driven`이 추가돼 있다(https://www.digitaltwinconsortium.org/initiatives/the-definition-of-a-digital-twin/, 개정일자 미확인 → 연도가 확실한 2020년 판을 쓸 것).

### 1-2. Gartner — Digital Twin of a Customer ★ 개념적으로 가장 결정적

> "A dynamic virtual representation of a customer that organizations can use to simulate, as well as to emulate and anticipate, behavior and/or fit."

— Gartner 보도자료, 2025-10-30.
https://www.gartner.com/en/newsroom/press-releases/2025-10-30-gartner-hype-cycle-reveals-how-ai-and-digital-advancements-are-primed-to-aid-sales-transformations (등급 B, gartner.com 1차 확인)

Gartner 용법의 `customer`에는 **개인(individual)**이 포함된다. 정의에 `anticipate behavior`가 들어 있어
"트윈은 물리자산에만 쓰는 말"이라는 반박을 정면으로 무력화하는 유일한 근거다.
귀속은 `Gartner glossary`가 아니라 **`Gartner(2025-10-30 보도자료)`**로 정확히 표기하라.

정직성 보강: Gartner 공개 자료는 DToC를 아직 **초기·미성숙**하며 가치가 use case에 좌우된다고 기술한다
(https://www.gartner.com/en/podcasts/thinkcast/how-digital-twins-will-upend-the-customer-experience). 이걸 우리가 먼저 인정하면 과장 지적이 봉쇄된다.

### 1-3. ISO 23247-1:2021 — 구조만 차용

정확한 서지: **ISO 23247-1:2021, "Automation systems and integration — Digital twin framework for manufacturing — Part 1: Overview and general principles"**, 발행 2021-10-22.
4부 구성(Overview / Reference architecture / Digital representation / Information exchange). 적용 범위는 `observable manufacturing elements`.

차용 가능한 것은 **연결 구조 4단**이다: 물리 환경 → 데이터 수집·센싱 → 디지털 표현 → 모니터링·분석·예측·최적화 애플리케이션.
셋업 대응: (실제 소비·자금흐름) → (거래내역 자동 수집·분류) → (가상 예산·도시 시각화) → ('페이스' 예측 판정·자금 자동 준비).

**금지**: 표준 본문이 페이월이라 clause 3 정의 조항 원문을 읽지 못했다. `ISO 23247 준수/기반` 주장 금지, 정의 문구 따옴표 인용 금지.

### 1-4. NIST

**BLOCKED.** NIST 자체 정의를 확보하지 못했다. `NIST 정의에 따르면`은 절대 인용하지 말 것.

---

## 2. 용어 리스크 — 심사에서 "이게 왜 디지털 트윈이냐"에 답하는 법

### 방어 스크립트 (물리자산 트윈과 먼저 선을 긋는다)

> 국내 금융권의 디지털 트윈은 데이터센터·영업점 같은 물리 자산에 적용돼 왔습니다.
> 하지만 Digital Twin Consortium의 공식 정의는 대상을 'real-world entities **and processes**'로 규정합니다(2020).
> 저희는 그중 **process** 쪽, 즉 개인의 소비·자금흐름을 트윈의 대상으로 삼았습니다.
> 업계 용어로는 Gartner가 정의한 **Digital Twin of a Customer** 계열이며, 그 정의에는 개인과 '행동의 예측(anticipate behavior)'이 명시돼 있습니다.
> Gartner도 이 개념이 아직 초기라고 말합니다. 그래서 저희는 이를 소비관리라는 구체적 use case로 좁혀 구현했습니다.

### 정의 요소 매핑표 (슬라이드용)

| 정의 요소 (DTC) | 셋업의 대응 |
| --- | --- |
| real-world **process** | 개인의 소비·자금흐름 (물리자산이 아니어도 정의에 포함) |
| virtual representation | 카테고리별 가상 예산 + 도시 게임 시각화 |
| integrated data-driven | 여러 계좌·카드 거래내역 자동 수집·분류 통합 |
| synchronized at specified **frequency** | 거래내역 수집 주기 (실시간 불필요) |
| specified **fidelity** | 카테고리 분류 충실도를 명시적으로 선언 |

### 주장하면 위험한 것

| 금지 주장 | 이유 |
| --- | --- |
| "ISO 23247 준수/기반" | 제조 표준 + 정의 조항 원문 미확인 |
| "NIST 정의에 따르면" | 정의 미확보 (BLOCKED) |
| "국가 디지털 트윈 정책과 연계" | 국내 정책 범주는 공간정보·국토·시설물·제조. 개인 금융 없음 → 범주 오류로 지적당한다 |
| "마이데이터 2.0이 금융 디지털 트윈을 추진" | 해당 문서는 디지털 트윈 용어를 쓰지 않는다 |
| "BIS/FSB/IMF가 금융 디지털 트윈을 논의 중" | 근거 없음. BIS 관련 1건은 기후 데이터 갭 한정 기고 |
| "국내 금융권 최초의 디지털 트윈" | 부재증명 불가 + 범주가 달라 역공당한다 |
| "실시간 동기화되는 트윈" | 데모 데이터라 즉시 반박. `specified frequency`를 쓰는 편이 유리 |

대안 표현: "개인 소비·자금흐름을 트윈으로 다룬 사례를 **조사 범위에서** 찾지 못했다"로 조사 한계를 함께 밝힌다.

### 데모 데이터 방어

영국 FCA가 금융서비스 모델 개발·테스트 목적의 합성데이터 활용과 거버넌스를 공식 발간물로 다룬다(2024-03-08, 2025-08-19).
즉 합성·데모 데이터로 모델을 검증하는 것은 **규제기관도 문서화한 정상 절차**이며 트윈의 결격 사유가 아니다.

---

## 3. 구현 방식 — 아키텍처

### 3-1. Tao Fei 5차원 모델을 개인 금융에 매핑

디지털 트윈의 표준적 아키텍처 골격은 5차원 모델이다. **DT = (PE, VE, Ss, DD, CN)**
— Tao et al., 2019, *Computer Integrated Manufacturing Systems* 25(1):1-18, DOI `10.13196/j.cims.2019.01.001` (등급 A).
기존 physical-virtual-connection 3분 구조에 **twin data와 services를 1급 차원으로 추가**한 것이 핵심 기여다.

| 차원 | 원 정의 | 셋업의 대응 | 산출물 |
| --- | --- | --- | --- |
| **PE** Physical Entity | 물리적 실체 | 사용자 본인: 소득 이벤트, 계좌·카드, 고정 지출 의무, 실제 소비 행동 | 계좌/카드/거래 엔티티 스키마 |
| **VE** Virtual Entity | 가상 모델 | 행동·재무 모델: 카테고리별 소비 분포, 정기결제 모델, 잔액 동역학 → what-if 시뮬레이터 | 예측 모델 + 시뮬레이션 엔진 |
| **DD** Twin Data | 4원 융합 데이터 | 실거래 이력 + **VE 시뮬레이션 출력** + 판정 로그 + 사용자 상호작용 | 거래 테이블 + 시나리오 결과 테이블 |
| **Ss** Services | 서비스 | 모니터링(소진률) · 예측(월말 잔액) · 진단(어느 카테고리가 깨졌나) · 최적화(예산 재배분) · what-if | 페이스 판정 API, 자금 준비 API |
| **CN** Connection | 양방향 연결 | 수집 → DD/VE, 그리고 서비스 결과의 **사용자 피드백 반영** | 동기화 스케줄러 + 알림/넛지 |

이 표를 기획서에 넣으면 "금융 디지털 트윈"이 마케팅 수사가 아니라 아키텍처 선택임을 보일 수 있다.

### 3-2. 트윈이라 부르기 위한 최소 조건 3가지

1. **정적 프로필 화면은 트윈이 아니다.** PE와 VE가 동적으로 결합돼야 한다.
2. **DD가 시뮬레이션 결과를 보존해야 한다.** 관측 데이터와 나란히 저장해야 what-if 분기의 재생·비교가 가능하다. 이것이 '시나리오 저장·비교' 기능의 이론적 근거다.
3. **피드백 루프를 닫아야 한다.** 읽기 전용 대시보드는 트윈이라 부를 수 없다. **도시 건설 시각화가 바로 이 피드백 채널의 UI 구현**이며, 이렇게 포지셔닝하면 게임 요소가 컨셉과 정합해진다.

추가로 **충실도(fidelity) 지표와 동기화 주기를 정의**해야 한다. 예: 시뮬레이션 월말 잔액 대 실제 월말 잔액의 오차.
단 `twin fidelity`의 형식적 정의를 담은 논문은 확보 실패 → 이 지표는 **우리 설계이며 문헌 인용이 아니다.**

### 3-3. 권장 파이프라인 (문헌 정합 순서)

| 단계 | 내용 |
| --- | --- |
| 1 수집 | 내부 API / 합성 데이터 생성기 |
| 2 정규화 | 설명문 클린징 · **자기 계좌 간 이체 분리** · 중복·취소 처리 |
| 3 분류 | 규칙 우선 → ML 폴백 → 신뢰도 게이트 |
| 4 분해 | 정기 컴포넌트 / 비정기 컴포넌트 분리 |
| 5 예측 | 카테고리별 유입·유출 → 누적하여 잔액 경로 |
| 6 판정 | 페이스 = 소진률 ÷ 월진행률 |
| 7 확률 | 초과·저잔액을 별도 분류 타깃으로 |
| 8 서비스 | 자금 준비 / 예산 재배분 / what-if |
| 9 피드백 | 넛지 · 도시 시각화 → 행동 변화 |

---

## 4. 구현 방식 — 기능별 알고리즘

### 4-1. 거래 자동 분류

**핵심 수치 (발표 시 반드시 반영):** 실제 은행 거래 분류의 전체 정확도는 **약 73%**, 고신뢰 구간만 **약 90%**다
(arXiv 2508.05425). **"100% 자동 분류"로 발표하면 안 되고, 신뢰도 게이트가 UX 요구사항이다.**
고신뢰는 자동 확정, 저신뢰는 사용자 확인으로 라우팅한다.

| 기법 | 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 규칙 + 가맹점 별칭 테이블 | arXiv 2504.12319, 2305.18430 | ★ | **1차 채택.** 급여·이체·공과금·ATM·월세는 규칙이 ML보다 정확하고 설명가능 |
| SVM/선형 short-text | arXiv 2404.08664 | ★ | **베이스라인.** CPU만으로 동작 |
| Weak supervision | arXiv 2305.18430 | ★★ | **채택 권장.** 한국어 라벨 코퍼스가 없는 우리 상황의 정답 |
| Active learning (사용자 수정 → 라벨 큐) | — | ★★ | 카테고리 변경 탭을 학습 신호로. "트윈이 학습한다" 서사의 실제 구현체 |
| Transformer + taxonomy-aware attention | arXiv 2312.07730 (F1 93/95%) | ★★★ | 대분류→소분류 2단 구조와 일치하나 **데모 범위 초과** |

**MCC(ISO 18245)는 가계부 카테고리와 동일하지 않다.** 별도 taxonomy와 매핑 테이블이 필요하다
(Mastercard Developers MCC 문서). 피드에 MCC가 있으면 강력한 무료 피처지만 카테고리로 직결 금지.

**Plaid PFC 택소노미를 골격으로 차용할 것** (https://plaid.com/docs/transactions/pfc-migration/, 등급 A).
PRIMARY 19종에서 `INCOME` / `TRANSFER_IN` / `TRANSFER_OUT` / `RENT_AND_UTILITIES` / `LOAN_PAYMENTS`를
소비 카테고리와 **같은 레벨에서 분리**해 둔 구조가 결정적이다. 페이스 분자는 소비만 세야 하므로 이 분리가 그대로 필요하다.
한국화 시 부족한 것(배달앱, 교통카드 충전, 통신비, 편의점)은 DETAILED를 자체 정의해 메운다.

### 4-2. 정기결제·구독·할부 탐지 — ML 없이 끝난다

이 기능은 **오픈소스 구현을 그대로 이식하면 된다.** Actual Budget의 `find-schedules.ts` 알고리즘:

1. 6패턴 열거 (주간 / 격주 / 매월 1~28일 / 말일 / 첫째·셋째 요일 / 둘째·넷째 요일)
2. RSchedule로 **첫 3회 발생만** 전개
3. `예상일 ±2일` 창 매칭 + 금액 의존 임계값 + 거래처 exact 매칭
4. `rank = 1/(|실제-예상|+1)` 랭킹 → 거래처별 1개만 남김

계산량이 (6 × ≤62 × 3)으로 묶여 서버 배치에 그대로 맞는다. Firefly III의 반복거래 스키마는
`repetition_type` / `repetition_moment` / `repetition_skip` / `weekend` 4필드로 정규화돼 있어 RRULE 파서가 불필요하다.

**이식 시 반드시 손봐야 할 3곳:**

- 거래처 exact 매칭 앞에 **한국어 가맹점명 정규화**(`(주)`·㈜·지점명·PG 접두어 제거)가 없으면 탐지율이 붕괴한다
- 중복 제거 키를 `(merchant_key, 금액대)`로 확장
- **`weekend` 필드를 초기 스키마부터 포함.** 주말 이연이 '필요 잔액 시점'을 바꾼다

부수 효과 둘: Actual이 이체를 후보에서 제외하는 규칙은 **우리가 만든 자금 이동이 다시 구독으로 오탐되는 것을 막아준다.**
그리고 `exactAmount` 플래그로 확정 금액(구독·할부)과 변동 청구(공과금)를 갈라 예측 정확도 경계를 만들 수 있다.

> **what-if는 별도 엔진이 필요 없다.** 탐지된 스케줄 목록에서 항목 하나를 빼고 재전개하면 그게 곧 "이 구독 해지하면 6개월 뒤" 시뮬레이션이다.

주의: 정기결제 탐지 **전용 알고리즘 논문**은 URL 확인 0건(BLOCKED). 구현 근거는 위 OSS와 arXiv 1806.05362의 recurring 추출이며,
탐지 로직 자체에 문헌 근거를 주장하지 말 것.

### 4-3. 현금흐름·잔액 예측

**가장 중요한 설계 규칙: 잔액을 직접 회귀하지 마라.**

> **B(t+h) = B(t) + Σ(예측 유입 − 예측 유출)**

흐름을 예측해 누적하는 방식이 문헌 합의다 (TU Delft 학위논문 + *Journal of Big Data* 2022).
같은 구조가 특허로도 공개돼 있다 — **US11803793B2**: 유입/유출 분리 예측 → 미래 잔액 궤적 구성 → 예측오차로 재학습
(https://patents.google.com/patent/US11803793B2/en, 등급 A). **단 양수인은 Citizens Financial Group이며 Digit/Oportun이 아니다.**

| 규칙 | 근거 |
| --- | --- |
| **나이브 베이스라인을 먼저 이겨라** (직전 잔액 유지, seasonal naive, 지난주 동일 요일, 이동평균, 지수평활). 딥러닝이 잔액 예측에서 자동으로 우월하지 않다 | TU Delft, arXiv 1806.05362 |
| 모델 사다리: seasonal naive/ETS → SARIMA → LightGBM/XGBoost → TFT/LSTM(데이터 충분할 때만) | TU Delft, arXiv 2108.02853 |
| **정기 / 비정기(예상 외) 지출을 별도 컴포넌트로** 모델링 + 달력 피처(요일·월중일·급여일·월말·청구예정일) | arXiv 1806.05362 |
| 검증은 **시간 기반 rolling-origin + 지평별(1/7/14/30일)**. 무작위 거래 분할은 누수. 계정 단위 분할로 사용자 간 누수 차단 | TU Delft |
| 초과·저잔액은 회귀 출력에서 읽지 말고 **별도 확률 분류 타깃**으로 | TU Delft |
| 단일 숫자 대신 **범위 + 초과확률**로 제시 | Microsoft ProbTS |
| 해석가능 모델(LightGBM) 우선 — 사용자에게 근거를 설명해야 하는 제품 | arXiv 2410.14416 |
| **콜드스타트(이력 1~2개월) 경로 설계 필수** | arXiv 2511.03631 |

**데이터 위생이 1급 과제다.** 마감 후 기표 제외, 대기·취소·중복 행 처리, 그리고 **자기 계좌 간 이체를 실제 소득·지출과 분리** —
이걸 안 하면 모든 지표가 왜곡된다. 첫 스프린트에 넣어야 한다.

주의: 페이스(소진률÷월진행률) 자체는 **우리 정의이며 논문 근거가 없다.** 설명가능하고 즉시 구현 가능한 것이 장점이지 학술 근거로 포장할 대상이 아니다.
N-BEATS·DeepAR·TFT·Prophet·Croston·M4/M5 원논문은 URL 확인 실패(BLOCKED) → **원 논문 인용 금지.**

---

## 5. 사례 — 누가 무엇을 만들었나

### 5-1. "디지털 트윈"이라 불리는 금융 사례 (= 전부 물리·인프라)

| 주체 | 무엇을 트윈 | 공개된 구현 단서 | 성과 | 등급 |
| --- | --- | --- | --- | --- |
| Goldman Sachs | 전사 네트워크 15,000+ 장비 | Forward Networks의 Forward Enterprise. 배포 전 설정·보안 변경 가상 검증 | **수치 없음** (벤더 사례집 서술) | E |
| 대형 은행 1곳 | 정상 사용자·앱 **행위** | AI digital twin + digital fingerprint로 위협 헌팅 (2026-03 보도) | **수치 없음** | C |
| HSBC | 실물 금괴, 은행 예금 | Tokenised Deposit Service = 예금 1:1 토큰화. **자체 문서에서 digital twin을 '전통 원장에 여전히 존재하는 자산의 병렬 블록체인 기록'으로 정의** | 2025 홍콩 출시. 미국·UAE 확대는 2026 상반기 **예정** | B |
| 신한금융 × NC AI (국내) | **영업점 물리 공간** (창구·키오스크·상담공간 배치) | 협약 2026-03-24. **영상 데이터 비식별화**로 고객 이동·체류·대기 패턴 수집. VLA(시각언어행동) 모델 + 월드모델 | 발표 단계, 검증 보도 없음 | C |
| 위엠비 (국내) | 데이터센터 전력·냉각·서버 | IBSilon 3D 디지털트윈 + AI 이상 감지. **금융권 납품 실적 언급** (전자신문 2025-11-13) | 벤더 자체 주장, 금융그룹명 비공개 | C |

한국경제는 신한 사례를 **"금융권 피지컬 AI 첫 도입"**으로 규정했다. 즉 종합지가 스스로 국내 선례 없음을 인정한 사안이고,
**그 첫 사례조차 물리 공간이었다.** 고객·자금흐름을 트윈으로 구현한 국내 보도는 0건이다.

### 5-2. 셋업의 기능을 이미 구현한 제품 (= 트윈이라 부르지 않는다)

| 제품 | 기능 | 셋업의 어떤 기능에 대응 |
| --- | --- | --- |
| **Plaid Recurring Transactions** | 정기 유입/유출 스트림 자동 식별, 주기 추정, **다음 결제일·금액 예측**, 금액 변동 감지. `/transactions/recurring/get` | **정기결제 탐지 + 자금 준비 트리거의 정확한 선례.** 셋업의 탐지는 신규 발명이 아니다 |
| **Plaid Transactions** | 거래내역 동기화 + PFC 카테고리 분류 | 거래내역 자동 수집·분류. 내부 API 참조 스키마 |
| **Plaid Check (Cash Flow Insights)** | 거래내역 기반 소득 추정 + 현금흐름 지표 | 페이스 예측의 상위 개념 (단 목적이 대출 언더라이팅) |
| **Digit → Oportun "Set & Save"** | 잔액·현금흐름 분석 후 여유 시점에 소액 자동 이체. 빡빡하면 축소·중단 | **자동 준비 판정 로직 전체** |
| **Qapital** Round Up / Guilty Pleasure / Set & Forget | 결정론적 규칙 트리거. **주간은 일요일 트리거 → 월요일 이체** (트리거/정산 분리 배치) | 자금 준비 스케줄러 아키텍처 |

Digit의 공개된 입력변수 목록은 셋업이 쓰려는 것과 사실상 겹친다: 현재 잔액·현금흐름 패턴, 예상 유입(급여),
**반복 청구서·예정 출금**, 최근 지출, 저축 목표·과거 이체 이력. **정확한 공식은 비공개**(Oportun 명시).
SEC 10-K에 이 목적으로 머신러닝을 사용한다고 명시돼 있다.

### 5-3. ★ 규제 제재 — 이 조사에서 가장 중요한 자료

**CFPB vs Hello Digit (2022-08-10)**

- Digit은 "오버드래프트 무발생 보장"을 광고했고, **CFPB가 이를 허위로 판정**했다.
- 실제로 **자동 저축 이체가 오버드래프트를 유발**했고, 관련 수수료를 항상 환급하지도 않았다.
- 소비자 배상 최소 **$68,145** + 민사벌금 **$2.7M**.
- https://www.consumerfinance.gov/enforcement/actions/hello-digit-llc/ (등급 A)

**현행 Oportun 약관은 보장을 철회했다.** 연결 계좌가 때때로 마이너스가 될 수 있음을 경고하고,
거래 거절·연체·제3자 수수료에 책임지지 않는다고 규정한다. 사유로 **은행 데이터 지연·부정확, ACH 정산 지연,
모든 거래·은행 판단의 예측 불가능성**을 든다.

> **함의:** 셋업의 진짜 난이도는 "계좌 간 이체 구현"이 아니라 **"지금 옮겨도 안전한가 판정"**이다.
> 그리고 데모 데이터 환경에서는 이 판정의 정확도를 **검증할 수 없다.**
> 발표에서 "안전하게 옮긴다"를 성과로 주장하면 근거가 없다. 주장 가능한 것은 판정 로직의 설계와 실패 처리 방식까지다.

### 5-4. 부정 결과 (인용 금지)

| 주장 | 판정 |
| --- | --- |
| JPMorgan "디지털 트윈 뱅크" 2025 출시 | **근거 없음.** 180억 달러는 전체 기술 예산이며 트윈과 무관 |
| Goldman이 트레이딩·포트폴리오·리스크를 트윈했다 | 2차 소스만. grade E / UNVERIFIED |
| 개인 재무 제품이 자기 기능을 "디지털 트윈"으로 마케팅 | **한 건도 확인 안 됨** |
| 확인된 디지털 트윈 **성과 수치** | **0건.** ROI·정확도 수치를 발표에 넣으려면 새 출처가 필요하다 |
| "Digit 알고리즘은 X 공식을 쓴다" | 인용 불가. 특허 US11803793B2는 **Citizens Financial Group** 소유 |

---

## 6. 데모 데이터 — 프로젝트 성패를 좌우하는 부분

실제 금융기관 미연동이므로 **데모 데이터셋이 곧 테스트 픽스처**다. 라이선스를 실제 확인한 결과:

| 이름 | 라이선스 (확인됨) | 우리에게 유용한가 |
| --- | --- | --- |
| **Kaggle `kartik2112/fraud-detection`** | **CC0 (퍼블릭 도메인)** | ★ 즉시 사용 가능. 24개월(2019-01~2020-12), **23컬럼 실물**. 리포 커밋·개조 자유 |
| **Sparkov Data Generation** | **MIT** | ★ 생성기가 필요할 때 유일하게 마찰 없는 선택. 프로파일 기반이라 페르소나 개념 내장 |
| **PaySim** | 코드 **GPL-3.0** / 데이터 **CC BY-SA 4.0** (분리) | △ 리포 내장 시 GPL 전염 위험. 가맹점명·카테고리·MCC 없음 |
| **BankSim** | **미확인** | ✗ **확인 전 리포 커밋 금지.** 카테고리 축은 있으나 유럽 소매 기준 |
| **Plaid Sandbox** (`user_custom`) | 데이터셋 아님 | ★ **우리 데모 API 설계의 참조 모델.** "고정 초기 이력 + 동적 추가 + 웹훅" 3분할 구조 |

### ★ 결정적 발견: 기존 데이터셋으로는 우리 기능을 검증할 수 없다

Kaggle 23컬럼에는 다음 7개가 **전부 없다.** 사기탐지용 스키마이기 때문이다.

1. 승인 / 청구 / 출금 **시각 분리**
2. 환불의 **원거래 참조**
3. **할부 회차**
4. **정기결제 그룹**
5. **다계좌 ID**
6. 카테고리 예산 대응 체계
7. 한국 가맹점명 노이즈

이 격차가 **생성기를 자체 작성해야 하는 실질적 이유**이고, 동시에 그냥 쓰면 페이스·자금준비 검증이 불가능해지는 지점이다.
권장 조합: **스키마는 CC0 배포본에서, 택소노미는 Plaid PFC에서, 데모 API 형태는 Plaid Sandbox 3분할에서** 차용.

### 데모 데이터셋 설계 (외부 소스 불필요, 확정 권고)

**규모: 페르소나 5명 × 13개월 × 월 60~120건 = 약 4,000~8,000건.**
13개월인 이유는 12개월 할부가 '완결 케이스'와 '진행 중 케이스'로 동시에 존재해야 하고, 연간 결제 1회 재출현을 관측해야 하기 때문이다.

| ID | 성격 | 이 페르소나가 없으면 검증 못 하는 것 |
| --- | --- | --- |
| P1 | 안정형 (페이스 0.9~1.1) | **정상 경로.** 없으면 "항상 경고하는 앱"과 구분이 안 된다 |
| P2 | 월초 폭주형 | **페이스 분모 폭발.** 3일차 소진률 20% → 페이스 2.0. 월초 판정 유예/클램프 필요성을 이 페르소나만이 드러낸다 |
| P3 | 고정비 과중형 (구독 7 + 할부 3) | 정기결제·할부 탐지 재현율, 고정비를 페이스에 포함할지 정책 |
| P4 | 잔액 부족형 | **자금 자동 준비 본 시나리오.** 이중 실패(원천계좌도 부족) + 부분 충전 포함 |
| P5 | 불규칙 소득형 | **월진행률 정의를 강제 확정**시킨다 (달력월 vs 급여주기) |

**반드시 넣어야 할 함정:** 구독료 인상(동일 구독 유지 인식), 말일 결제의 2월 드리프트, 무료체험 0원 → 유료 전환,
기간 시작 전 이미 진행 중인 할부(첫 회차 없음), 월 경계를 넘는 환불, 취소 후 재승인,
그리고 **`authorized_at` / `posted_at` / `settlement_date` 3개 시각 필드 분리**(체크카드 0일, 신용카드 1~3일, 해외 3~7일 + 승인≠청구).
이 필드 분리가 없으면 페이스와 자금준비 두 기능이 통째로 검증 불가다.

**남길 검증 하나** (프레임워크 없이 assert 5종): 잔액 정합성(P4 화이트리스트), 페르소나×월 기대 판정 일치,
정기결제·할부 정답 건수 일치, 자금준비 트리거 P4≥1회·P1=0회, 환불의 원거래 존재·시각 순서.

미해결 변수 하나: **한국 카테고리 분포 캘리브레이션.** 통계청 가계동향조사 마이크로데이터가 후보이나 미확인(BLOCKED).

---

## 7. ★ 기획서 수치 검증 — 발표 전 필수 수정

v4 기획서에 인용된 수치 6건을 1차 출처로 추적했다. **그대로 인용 가능한 것은 1건뿐이다.**

| # | 기획서 주장 | 판정 | 실제 확인 |
| --- | --- | --- | --- |
| 1 | 금융앱 D30 리텐션 **4.2%** (Business of Apps) | **partial — 이상치** | 같은 매체 다른 페이지가 금융 D30을 **11.6%**로 제시(자기모순). Adjust 약 **9%**, AppsFlyer Android **9.27%**/iOS **10.74%**. 4.2%는 동종 벤치마크 중 최저 이상치 |
| 2 | 리볼빙 이월잔액 **6조 7,288억** (2026.6) | **verified** ✅ | 표 원값 6,728,839백만. 전월 6조 6,972억 → **+316억**. 단 기준이 **전업 8개사 말잔**(NH 포함 시 6조 8,321억) |
| 3 | 청년 리볼빙 **25만 6,906명**, 월평균 **326만 원** | **partial — 단위 오기** | 인원수는 맞으나 연령이 **만 19~34세**. 326만 원은 "이용금액"이 아니라 **월평균 이월 금액(다음 달로 넘긴 잔액)** |
| 4 | 구독 **94.8%**, 1인당 **3~4개**, 월5만원↑ **46.7%** | **partial — 출처 오귀속 + 오독** | 발표 주체는 **대한상공회의소**(엠브레인은 조사 수행). 3~4개는 평균이 아니라 **최다 응답 구간 39.8%**. 46.7% → 원문 **46.6%** |
| 5 | 해지 절차 **40.5%** (한국소비자원) | **partial — 출처·연도 오기** | 수치·순위는 맞음. 그러나 발행은 **방송통신위원회**(2022-01-05), 원데이터는 소비자원 **앱 민원 분석**(설문 아님). **2025년이 아니라 2022년 자료** |
| 6 | 리볼빙 수수료율 **15.1~18.3%** | **refuted (현행 기준)** | 현행 **13.23~18.40%** (2026년 7월 말 기준, 17개사). 15.1~18.3%는 2026년 4월 공시(2026-03-31 기준) 실측 15.03~18.35%의 반올림 → **기준월 없이 현재형으로 쓰면 오류** |

### 그대로 인용 가능한 문장 (1차 출처 확인 완료)

1. 여신금융협회 공시에 따르면 전업 8개 카드사의 결제성 리볼빙 이월잔액은 2026년 6월 말 기준 **6조 7,288억 원**으로, 전월(6조 6,972억 원) 대비 316억 원 늘었다.
2. 리볼빙 수수료율은 여신금융협회 공시 기준 **2026년 7월 말 현재 카드사별로 연 13.23~18.40%**다(17개사, 2026-08-20 게시).
3. 서민금융진흥원 「2025년 청년금융 실태조사」(2026-04-13 발표)에 따르면 **만 19~34세 청년 중 리볼빙 이용자는 25만 6,906명**이며, 이들의 **월평균 이월잔액은 326만 원**이다.
4. 같은 조사에서 리볼빙 이용 청년의 약 20%는 월 500만 원 이상을 이월했고, 적용 평균 금리는 약 17.3%였다.
5. 대한상공회의소가 마크로밀 엠브레인에 의뢰해 2025년 1월 성인 1,000명을 조사한 결과, **94.8%**가 구독 서비스 이용 경험이 있었고 구독 개수는 **3~4개가 39.8%로 최다**, 월 5만 원 이상 지출자는 **46.6%**였다.
6. 방송통신위원회가 2022년 1월 5일 발표한 자료에서 한국소비자원 앱 민원 분석 결과 구독서비스 개선 요구 1위는 **'어려운 해지 절차'(40.5%)**, 2위는 '청약철회·취소 어려움'(23.3%)이었다.

### 리텐션 수치 권고

D30 4.2%는 방어하기 어렵다. **Adjust 약 9% 기준으로 "30일 내 약 90%가 이탈한다"로 바꾸면 논지는 그대로 유지되고 반박 위험이 사라진다.**
기획서의 "D30 리텐션 10% 이상 목표"는 4.2% 대비로 설정된 값이므로, 기준선을 9%로 바꾸면 목표치도 재설정이 필요하다.

### 추가로 쓸 수 있는, 검증된 대체 통계

- 청년 월평균 카드 사용액 **188만 3,000원** vs 평균 연소득 3,184만 원(월 약 265만 원) — 서민금융진흥원 2025년 청년금융 실태조사
- 청년 대출 경험자 **44.5%**(약 418만 명), 대출 보유자 평균 잔액 **3,440만 원** — 동일 조사
- 리볼빙 이월잔액 추세: 2026년 5월 6조 6,972억 → 6월 6조 7,288억 → **7월 6조 7,733억** (3월 이후 연속 증가)
- 구독 상세: 동영상 스트리밍 60.8%, 쇼핑 멤버십 52.4%, 월 3만원 미만 30.5%(최다), 15만원 초과 14.9%

주의: 여신금융협회는 사후 오류 정정으로 공시 수치가 변경될 수 있다고 안내한다. **발표 직전 재확인 권장.**

---

## 8. ★ Fortune City 주장 — 근거 없음, 수정 필요

기획서는 Fortune City를 두 가지로 규정하고 있다. **둘 다 근거가 확인되지 않았다.**

| 기획서 서술 | 검증 결과 |
| --- | --- |
| "도시를 키우려 지출하는 부작용이 **사용자 리뷰로 실재 확인**" | **UNVERIFIED.** 검색 결과가 이를 명시적으로 "a plausible behavioral risk, **not** a documented finding that Fortune City causes overspending"으로 규정. 즉 이론적 위험이지 문서화된 사실이 아니다 |
| "**기록 행위**에 보상: 많이 쓰고 기록할수록 성장" | **부분 반증.** 벤더 문서에 예산·카테고리·wants vs needs 기능이 존재한다. "기록량만 보상한다"는 단정은 정확하지 않다 |
| 2017 구글플레이 올해의 앱 / 2018 레드닷 수상 | **BLOCKED — 미확인.** 발표 사용 금지 |

확보된 인접 근거는 **기록 습관 형성에 효과적**이라는 리텐션 방향의 반응(r/androidapps, r/adhdwomen, r/AskReddit)과
**"game first, expense tracker second"**라는 비판(r/ADHD)이다. 다만 모두 검색 요약 경유이며 원 댓글을 직접 읽지 못해 **인용문으로 승격 불가**(grade E).

### 권고 수정 문장

기존: "Fortune City에서 확인된 '도시를 키우려 지출하는' 부작용을 구조적으로 차단하기 위함이다."

대안 A (안전): "지출을 기록할수록 도시가 성장하는 구조에는 **논리적으로** 지출을 조장할 위험이 내재한다. 셋업은 보상 기준을 계획 준수로 두어 이 위험을 구조적으로 차단한다."

대안 B (정직): "선행 사례에서 이 부작용이 실제로 발생했다는 문서화된 근거는 확인하지 못했다. 다만 기록량 보상 구조의 내재적 위험이므로 셋업은 설계 단계에서 이를 배제했다."

어느 쪽이든 **"사용자 리뷰로 확인됐다"는 표현은 삭제해야 한다.** 심사에서 근거를 요구하면 제시할 수 없다.

---

## 9. 차별성 냉정 평가

### 이미 존재하는 것 (셋업의 신규성이 아님)

1. **소액 자동 이체 자체** — Digit(2010년대), Qapital이 상용화. "앱이 알아서 돈을 옮겨준다"는 새롭지 않다.
2. **거래·현금흐름으로 여유 자금을 판단하는 발상** — Digit의 공개 입력변수에 **"반복 청구서·예정 출금"이 이미 포함**돼 있다. 우리가 고유 아이디어로 여길 수 있는 지점인데 이미 공개돼 있다.
3. **잔액 예측 파이프라인** — 유입/유출 분리 → 잔액 궤적 → 오차 재학습은 특허로 공개(US11803793B2).
4. **트리거와 실제 이체의 시간 분리** — Qapital이 이미 배치로 운영.
5. **정기결제 탐지·다음 결제일 예측** — Plaid API 상품.

### 실제로 새로울 가능성이 있는 것

1. **최적화 목표 함수의 방향이 반대다.** Digit·Qapital은 *잉여를 저축으로 축적*한다 — 목적지가 goal이고 성공 지표는 모인 금액이다. 셋업은 *특정 날짜의 출금 채무를 커버하기 위해 유동성을 배치*한다 — 목적지가 결제 계좌이고 성공 지표는 **결제 실패 0건**이다. UX 카피 차이가 아니라 목적 함수가 다르다.
2. **건 단위 귀속** — "이 이체는 8/25 통신비 건을 위한 것". 확보된 선례는 전부 총액 기반이거나 가맹점 트리거다. 단 Monzo Pots·Revolut Pockets·Starling Spaces 미확인이므로 **확인 전에는 주장하지 말 것.**
3. **소비 게임화의 재료가 실제 소비라는 점** — 국내 앱테크(만보기·돈나무)는 게임과 소비가 무관하다. 단 이 대조의 사용자 반응 근거는 미확보(BLOCKED).
4. **CFPB 사례를 알고 설계한다는 점** — 역설적으로 가장 방어 가능한 차별점이다. "예측은 틀릴 수 있다"를 제품에 내장하고 실패 시나리오를 UX로 노출하면 선례를 학습한 설계다.

### 위험 신호

- **차별점을 예측 정확도에 두면 Plaid와 겹친다.** 실행 자동화를 강조해야 한다.
- **국내 선례 미확인이 차별성 주장 전체를 흔든다.** 토스의 "이번 달 쓸 수 있는 돈"류가 이미 유사 판정을 제공하면 페이스의 신규성이 크게 줄어든다. **이 조사에서 가장 큰 미해결 리스크.**
- **데모 데이터로는 자금 준비 판정의 정확도를 검증할 수 없다.** 성과가 아니라 설계로만 주장하라.

---

## 10. 다음에 채워야 할 공백 (우선순위)

| 순위 | 항목 | 왜 중요한가 |
| --- | --- | --- |
| 1 | **국내 선례** — 토스/뱅크샐러드/카카오페이 기술블로그, 토스 "이번 달 쓸 수 있는 돈" 공식 설명 | 차별성 주장의 전제. 미확인 상태로는 신규성을 확정할 수 없다 |
| 2 | **Monzo Pots / Revolut Pockets / Starling Spaces** | '건 단위 귀속' 차별점의 성립 여부를 결정 |
| 3 | **통계청 가계동향조사 마이크로데이터** | 데모 데이터 카테고리 분포 캘리브레이션의 유일한 미해결 변수 |
| 4 | **한국어 가맹점명 정규화 패턴** | 정기결제 탐지 이식의 성패를 좌우. 데모 데이터에 일부러 넣어야 하는 노이즈 |
| 5 | 인간·소비자 트윈 서베이 논문 4건 (제목만 노출, URL 미확보) | 컨셉의 가장 직접적인 선행연구 |
| 6 | NIST digital twin 정의 | 정의 근거 1건 추가 |
| 7 | Fortune City 수상 이력 검증 | 발표에서 쓰려면 필수 |
| 8 | 2D 아이소메트릭 시각화 (전량 BLOCKED) | 프론트 스택 확정 후에 조사하는 것이 효율적 |
| 9 | 게이미피케이션 효과 학술 근거 | 게임 요소 정당화의 학술 축이 비어 있다 |

---

## 부록: 등급 분포와 정직성 경고

- 축 B의 근거는 **preprint 편중**이다(A급 3건, D급 12건). "peer-reviewed 논문 기반"이라고 말하면 과장이다.
  정확한 표현: **"A급 저널 1건(Journal of Big Data)과 디지털 트윈 5차원 모델(CIMS 2019)을 골격으로, 최신 arXiv 프리프린트로 구현 세부를 보강했다."**
- 국내 축(D)은 **본문 확인 0건**이다. NC AI 서술은 5~6개 매체 스니펫의 상호 일치에 기반하며 원문 인용구가 아니다.
- **인용 금지 URL**: `etnews.com/20251002000202`(위엠비 벤더 콘텐츠와 혼동), `etnews.com/20250619000447`(미확인), 디지털데일리 2023-12-12건(제목·내용 불일치).
  확인된 전자신문 위엠비 기사는 `20251113000345`(2025-11-13)뿐이다.
- 국내 언론의 "디지털 트윈 = 버즈워드" 비판 기사는 4턴 검색 끝까지 **0건**이다. 회의론의 국내 근거는 언론이 아니라
  **과기정통부 2026년 지출구조조정 목록의 '디지털 트윈 경쟁력 강화' 사업**과 보험연구원의 가상 고객 단서에 있다.


---

## 참고문헌 (주요 소스)

### 정의·표준

- Digital Twin Consortium, "Digital Twin Consortium Defines Digital Twin" (2020-12) — https://www.digitaltwinconsortium.org/2020/12/digital-twin-consortium-defines-digital-twin/
- Digital Twin Consortium, "The Definition of a Digital Twin" — https://www.digitaltwinconsortium.org/initiatives/the-definition-of-a-digital-twin/
- Gartner 보도자료 (2025-10-30), DToC 정의 — https://www.gartner.com/en/newsroom/press-releases/2025-10-30-gartner-hype-cycle-reveals-how-ai-and-digital-advancements-are-primed-to-aid-sales-transformations
- ISO 23247-1:2021 — https://www.iso.org/standard/75066.html
- Tao et al. (2019), Five-dimension digital twin model, CIMS 25(1):1-18 — DOI 10.13196/j.cims.2019.01.001

### 학술 — 분류·예측

- Deep learning enhancing banking services: hybrid transaction classification and cash flow prediction, *Journal of Big Data* (2022) — https://link.springer.com/article/10.1186/s40537-022-00651-x
- Categorising SME Bank Transactions with ML and Synthetic Data Generation (2025) — https://arxiv.org/abs/2508.05425
- Hierarchical Classification of Financial Transactions (2023) — https://arxiv.org/abs/2312.07730
- Scalable and Weakly Supervised Bank Transaction Classification (2023) — https://arxiv.org/abs/2305.18430
- Identifying Banking Transaction Descriptions via SVM (2024) — https://arxiv.org/abs/2404.08664
- An Approach to Classifying Open Banking Transactions (2025) — https://arxiv.org/html/2504.12319v1
- Merchant Category Identification Using Credit Card Transactions (2020) — https://arxiv.org/abs/2011.02602
- Financial Forecasting and Analysis for Low-Wage Workers (2018) — https://arxiv.org/html/1806.05362v3
- Supervised Neural Networks for Cash Flow Forecasting (2021) — https://arxiv.org/abs/2108.02853
- Financial Management System for SMEs: Real-World Deployment (2025) — https://arxiv.org/abs/2511.03631
- Explainable ML for Household-Level Forecasting (2024) — https://arxiv.org/html/2410.14416v1
- Time series predictions for bank account balances (TU Delft) — https://repository.tudelft.nl/file/File_dae488e4-2b63-4620-b250-c325dc53a13d

### 제품·API·특허

- Plaid Recurring Transactions — https://plaid.com/products/recurring-transactions/
- Plaid Transactions API — https://plaid.com/docs/api/products/transactions/
- Plaid PFC taxonomy — https://plaid.com/docs/transactions/pfc-migration/
- Plaid Sandbox custom user — https://plaid.com/docs/sandbox/user-custom/
- Plaid Check / Cash Flow Insights — https://plaid.com/products/plaid-check/
- US11803793B2 (Citizens Financial Group) — https://patents.google.com/patent/US11803793B2/en
- Oportun Digital Banking & Savings Terms — https://oportun.com/terms/digital-banking-and-savings/
- Qapital Round Up Rule — https://help.qapital.com/en/articles/10245400-round-up-rule
- Mastercard MCC Lookup (ISO 18245) — https://developer.mastercard.com/locations-merchants/documentation/use-cases/merchant-category-code-lookup/

### 규제·제재

- CFPB, Hello Digit LLC enforcement action (2022-08) — https://www.consumerfinance.gov/enforcement/actions/hello-digit-llc/
- CFPB 보도자료 (2022-08-10) — https://www.consumerfinance.gov/archive/newsroom/cfpb-takes-action-against-hello-digit-for-lying-to-consumers-about-its-automated-savings-algorithm/
- CFPB consent order (PDF) — https://files.consumerfinance.gov/f/documents/cfpb_hello-digit-llc_consent-order_2022-08.pdf
- Oportun 10-K (FY2022) — https://www.sec.gov/Archives/edgar/data/1538716/000153871623000035/oprt-20221231.htm

### 데이터셋

- Kaggle `kartik2112/fraud-detection` (CC0) — https://www.kaggle.com/datasets/kartik2112/fraud-detection/data
- Sparkov Data Generation (MIT) — https://github.com/namebrandon/Sparkov_Data_Generation
- PaySim — https://github.com/EdgarLopezPhD/PaySim
- BankSim (Kaggle) — https://www.kaggle.com/datasets/ealaxi/banksim1

### 국내

- 여신금융협회 카드사 월별 실적 공시 — https://www.crefia.or.kr/portal/infocenter/statistics/creditcardMonthResultUpdateView.xx
- 여신금융협회 리볼빙 수수료율 비교공시 — https://gongsi.crefia.or.kr/portal/creditcard/creditcardDisclosureDetail31?cgcMode=31
- 서민금융진흥원 발간자료 — https://www.kinfa.or.kr/notificationPromotion/publication.do
- 대한상공회의소 구독서비스 이용실태 (KDI 재수록) — https://eiec.kdi.re.kr/policy/domesticView.do?ac=0000192531
- 방송통신위원회 보도자료 (2022-01-05) — https://www.korea.kr/briefing/pressReleaseView.do?newsId=156490270
- 금융위원회 마이데이터 2.0 — https://www.fsc.go.kr/po010105/82061
- 전자신문, 위엠비 디지털트윈 (2025-11-13) — https://www.etnews.com/20251113000345
- 지디넷코리아, 신한금융×NC AI (2026-03-25) — https://zdnet.co.kr/view/?no=20260325101338
- 한국경제, 금융권 피지컬 AI 첫 도입 (2026-03-25) — https://www.hankyung.com/article/202603255149i

### 커뮤니티·OSS

- Actual Budget (`find-schedules.ts` 반복거래 탐지) — https://github.com/actualbudget/actual
- Firefly III (반복거래 스키마) — https://github.com/firefly-iii/firefly-iii

