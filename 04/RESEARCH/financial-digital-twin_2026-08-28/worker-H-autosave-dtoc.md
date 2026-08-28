# worker-H — 자동 저축·자금이동 상용 선례 / DToC 담론 / 국내 현황

생성일: 2026-08-28
담당 축: GAP1 자동 저축·자금 이동 상용 선례 (최우선) / GAP2 DToC 벤더 담론 / GAP3 국내

> **예산 경고**: 이 워커는 검색 예산이 GAP1 중반에서 소진되었다. GAP1은 Digit/Oportun·Qapital만
> 1차 소스로 확보했고, GAP2·GAP3는 **검색을 단 한 건도 수행하지 못했다**. 아래 unverified_or_blocked
> 절에 미수행 항목을 전부 명시했다. 확보 소스 12건 — 목표(15건) 미달.

## axis

셋업(Setup)의 핵심 차별 기능 = **정기결제·할부 출금 전에 사용자 본인 계좌 사이에서 필요 금액을 미리 옮겨두는 자동 준비**.
이 축의 목적은 두 가지다.

1. 이 기능이 상용 제품에서 이미 존재하는가, 존재한다면 어떤 형태이고 공개된 구현 단서는 무엇인가.
2. "금융 디지털 트윈" 컨셉이 벤더·컨설팅 담론에서 실제로 어떻게 정의되고, 어떤 비판을 받는가.

검증된 결론을 먼저 적는다: **"규칙 기반으로 소액을 자동 이체한다"는 부분은 상용 선례가 명확히 존재한다.
반면 "출금 예정 정기결제를 특정해, 그 건을 커버할 금액을 기한 전에 계좌 간 이동한다"는 형태는
이번 조사 범위에서 동일한 제품을 확인하지 못했다.** 그리고 이 축에서 가장 중요한 발견은
성공 사례가 아니라 **규제 제재 사례**다 (아래 CFPB 항목).

## queries_run

| # | 쿼리 | 결과 |
|---|---|---|
| 1 | Digit savings app algorithm how it decides how much to save safe to save overdraft guarantee | 성공 — 1차 소스 5건 (Oportun 공식 2건, CFPB 3건) |
| 2 | Oportun Digit automatic savings algorithm patent machine learning cash flow | 성공 — 특허 1건(단, 타사 귀속) + SEC 10-K + Oportun IR 2건 |
| 3 | Qapital rules Roundup Guilty Pleasure Set and Forget Spend Less how it works | 성공 — Qapital 공식 헬프센터 3건 (출력 일부 절단) |
| 4 | Monzo Salary Sorter Pots automatic committed spending left to spend | **결과 미수신** — 예산 소진으로 응답 확인 못함. BLOCKED |
| — | GAP2 (Gartner DToC, 컨설팅 백서, Salesforce/Adobe/SAS/Pega, 비판론) | **미수행. BLOCKED** |
| — | GAP3 (토스·뱅크샐러드·카카오페이·네이버페이 기술블로그, 국내 은행 디지털트윈, SI 사업, 국내 세이프투스펜드) | **미수행. BLOCKED** |

## sources

| # | title | URL | date | domain | type | grade |
|---|---|---|---|---|---|---|
| S1 | CFPB Takes Action Against Hello Digit for Lying to Consumers About Its Automated Savings Algorithm | https://www.consumerfinance.gov/archive/newsroom/cfpb-takes-action-against-hello-digit-for-lying-to-consumers-about-its-automated-savings-algorithm/ | 2022-08-10 | consumerfinance.gov | 규제기관 보도자료 | **A** |
| S2 | Hello Digit, LLC — enforcement action | https://www.consumerfinance.gov/enforcement/actions/hello-digit-llc/ | 2022-08 | consumerfinance.gov | 규제기관 집행기록 | **A** |
| S3 | CFPB Hello Digit consent order (PDF) | https://files.consumerfinance.gov/f/documents/cfpb_hello-digit-llc_consent-order_2022-08.pdf | 2022-08 | consumerfinance.gov | 행정처분 원문 | **A** |
| S4 | Oportun 10-K (FY2022, oprt-20221231) | https://www.sec.gov/Archives/edgar/data/1538716/000153871623000035/oprt-20221231.htm | 2023 | sec.gov | 법정 공시 | **A** |
| S5 | US11803793B2 — Automated data forecasting using machine learning | https://patents.google.com/patent/US11803793B2/en | 우선일 2020-11-06 / 등록 2023-10-31 | patents.google.com | 특허 원문 | **A** |
| S6 | Oportun Digital Banking & Savings Terms | https://oportun.com/terms/digital-banking-and-savings/ | 접근 2026-08 | oportun.com | 제품 약관 | **B** |
| S7 | Qapital — Round Up Rule (help article 10245400) | https://help.qapital.com/en/articles/10245400-round-up-rule | 접근 2026-08 | help.qapital.com | 제품 공식 문서 | **B** |
| S8 | Qapital — Guilty Pleasure Rule (help article 10245399) | https://help.qapital.com/en/articles/10245399-guilty-pleasure-rule | 접근 2026-08 | help.qapital.com | 제품 공식 문서 | **B** |
| S9 | Qapital — Set & Forget Rule (help article 10245402) | https://help.qapital.com/en/articles/10245402-set-forget-rule | 접근 2026-08 | help.qapital.com | 제품 공식 문서 | **B** (URL 슬러그 절단, 아래 참조) |
| S10 | Oportun — The savings app built around you | https://oportun.com/savings/ | 접근 2026-08 | oportun.com | 제품 마케팅 | **E** |
| S11 | Oportun completes acquisition of Digit | https://oportun.com/news/oportun-completes-acquisition-of-digit-a-neobanking-company-and-platform/ | 2021-12경 | oportun.com | 기업 보도자료 | **D** |
| S12 | Fintech Innovations Like Digit May Boost Consumer Savings | https://investor.oportun.com/news-events/press-releases/detail/11/fintech-innovations-like-digit-may-boost-consumer-savings | 미확인 | investor.oportun.com | IR 보도자료 (마케팅 주장) | **E** |

등급 기준: A=규제기관·법정공시·특허 원문 / B=벤더 공식 기술·제품 문서 / D=기업 보도자료 / E=마케팅 문구(성과로 승격 금지)

## autosave_precedents

### GAP1 표

| 제품 | 기능 정의 | 공개된 계산/구현 단서 | 셋업의 어떤 기능에 대응 | URL | grade |
|---|---|---|---|---|---|
| **Digit → Oportun "Set & Save"** | 연결된 입출금 계좌를 분석해 "여유가 있다"고 판단되는 시점에 소액을 자동으로 저축 계좌로 이체. 자금이 빡빡해 보이면 이체를 줄이거나 중단 | 공식 입력변수 목록만 공개: (1) 현재 잔액·현금흐름 패턴 (2) 급여 등 예상 유입 (3) 반복 청구서·예정 출금 (4) 최근 지출 및 거래 타이밍 (5) 저축 목표와 과거 이체 이력. **정확한 공식은 비공개(Oportun 명시)**. SEC 10-K에서 이 목적에 머신러닝을 사용했다고 명시 | 셋업의 "자동 준비" 판단 로직 전체. 특히 "지금 옮겨도 안전한가" 판정 | S10, S4, S6 | B/A 혼합 |
| **Digit "no overdraft guarantee" (폐지된 주장)** | 과거 "오버드래프트 무발생 보장"을 광고 | **CFPB가 허위로 판정.** 실제로 자동 저축 이체가 오버드래프트를 유발했고 관련 수수료를 항상 환급하지도 않았음. 2022-08-10, 소비자 배상 최소 **$68,145** + 민사벌금 **$2.7M** | 셋업이 절대 따라 하면 안 되는 UX·문구 선례 | S1, S2, S3 | **A** |
| **Oportun 현행 약관** | 보장을 철회하고 리스크를 명시 | 연결 계좌가 때때로 마이너스가 될 수 있음을 경고하고, 거래 거절·연체·제3자 수수료에 대해 책임지지 않는다고 규정. 사유: 은행 데이터 지연·부정확, ACH 정산 지연, 모든 거래·은행 판단 예측 불가 | 셋업 약관·고지 설계의 직접 참고 | S6 | B |
| **Qapital — Round Up** | 결제 건마다 지정 단위($1~$5)로 올림하고 차액을 목표로 이체 | 예: $4.60 결제 + $2 Round Up → $6으로 올림, $1.40 저축. **이체는 배치 처리, 주 최대 4회** | 셋업의 잔돈 기반 적립(있다면). 예측 없는 순수 규칙 | S7 | B |
| **Qapital — Guilty Pleasure** | 특정 가맹점 결제 시 고정액 이체 | 가맹점 + 고정 금액 지정. 예: 스타벅스 결제마다 $3 | 셋업의 카테고리/가맹점 트리거 규칙 | S8 | B |
| **Qapital — Set & Forget** | 일/주/월 주기로 고정액 자동 이체 | 주간은 **일요일 트리거 → 월요일 이체**, 월간은 **1일 트리거 → 다음 배치일 이체**. 즉 트리거 시점과 실제 이체 시점이 분리된 배치 아키텍처 | 셋업의 정기 준비 스케줄러. **트리거/정산 분리 설계는 그대로 참고 가치 있음** | S9 | B |
| **US11803793B2 (Citizens Financial Group)** | 머신러닝 기반 계좌 예측 | (1) 다수 사용자 과거 계좌 활동 수집 (2) 금융활동을 **유입/유출로 분리** (3) 결합 예측 모델로 향후 유입·유출 각각 예측 (4) **예측 미래 잔액 구성** (5) 예측 정확도로 모델 재학습·가중치 조정 (6) 현재 잔액 + 제3자 계좌 데이터를 입력으로 사용 | 셋업 잔액 예측 파이프라인의 **가장 구체적인 공개 청구항**. 유입/유출 분리 → 잔액 궤적 재구성 구조는 셋업 설계에 직접 매핑 | S5 | **A** |

### 중요한 반증: Digit 특허는 확인되지 않았다

검색 결과가 명시적으로 밝힌 사실: **US11803793B2는 Digit/Oportun 소유가 아니다.**
Google Patents상 최초·현재 양수인은 **Citizens Financial Group, Inc.** 이다 (S5).
Digit/Oportun에 귀속되어 자동 저축 이체 알고리즘을 공개하는 특허는 **찾지 못했다**.
Oportun은 제품 동작만 공개하며, 안전 버퍼 계산식·이체 타이밍·모델 종류·저축 금액 공식 같은
구체적 의사결정 로직은 확보된 자료에 나타나지 않는다. 영업비밀·미공개 출원·다른 법인 명의 출원
가능성이 있으나 이는 **추정이며 UNVERIFIED**다.

따라서 "Digit 알고리즘"을 셋업 문서에서 인용할 때는
"머신러닝 기반 현금흐름 예측이라고 공개적으로 서술됨" 수준까지만 쓸 수 있고,
"Digit은 X 공식을 쓴다"는 어떤 형태로도 쓸 수 없다.

## dtoc_discourse

**전 항목 BLOCKED.** 검색 예산 소진으로 GAP2 쿼리를 단 한 건도 실행하지 못했다.

정의 원문 인용도, 비판론 수집도 수행하지 못했다. 구체적으로 미확인 상태인 항목:

- Gartner의 "Digital Twin of a Customer(DToC)" 공식 glossary/press 정의 원문 — **미확인**
- Accenture / Deloitte / McKinsey / EY / KPMG / Capgemini / Cognizant / Infosys / TCS 의 금융권 digital twin·DToC 백서 — **미확인**
- Salesforce / Adobe / SAS / Pega 의 고객 트윈·시뮬레이션 제품 주장 — **미확인**
- DToC 용어에 대한 애널리스트 반박·실무자 회의론 — **미확인**

이 절에 임의로 정의문을 쓰지 않는다. Gartner 정의는 인용 원문 없이 재구성하면
그 자체가 조작이 되므로, 후속 워커가 gartner.com 1차 소스로 채워야 한다.

한 가지만 방법론적으로 지적해 둔다: 팀이 "금융 디지털 트윈"을 컨셉으로 쓰려 한다면,
이 축에서 **비판론을 반드시 같이 확보해야 한다.** 벤더 백서만 모으면 과대포장 주장을
그대로 승계하게 된다. GAP2 재실행 시 긍정 소스와 회의론 소스를 같은 비중으로 요구할 것.

## korea_findings

**전 항목 BLOCKED.** 검색 예산 소진으로 GAP3 쿼리를 단 한 건도 실행하지 못했다.
원 지시의 우선순위(GAP1 > GAP3 > GAP2)를 지키려 했으나 GAP1 4번째 쿼리에서 예산이 끊겼다.

미확인 항목:

- 토스 / 뱅크샐러드 / 카카오페이 / 네이버페이 기술블로그의 소비 예측·정기결제 탐지·자금 이동 관련 글 — **미확인**
- 신한 / KB / 하나 / 우리 / NH, 카카오뱅크 / 토스뱅크 / 케이뱅크의 "디지털 트윈"·시뮬레이션 공식 발표 — **미확인**
- 삼성SDS / LG CNS / SK C&C / 코스콤 / 금융결제원의 금융 디지털 트윈 사업 — **미확인**
- 국내 "세이프 투 스펜드"류 기능(토스 "이번 달 쓸 수 있는 돈" 등) 공식 설명 — **미확인**

국내 축은 선행 워커도 "완전 공백"으로 표기했으므로, **이 프로젝트에서 가장 큰 미해결 리스크**다.
국내 경쟁 제품에 이미 동일 기능이 있는지 모르는 상태에서는 셋업의 차별성 주장을 확정할 수 없다.
참고: 같은 디렉터리의 worker-D-korea.md 가 국내 축을 별도로 담당한 것으로 보이므로,
GAP3 재실행 전에 그 파일과 중복 여부를 먼저 확인할 것.

## claims

| # | claim | URLs | confidence |
|---|---|---|---|
| C1 | 자동 저축 앱이 사용자 잔액·현금흐름을 분석해 소액을 자동 이체하는 기능은 상용 선례가 확실히 존재한다 (Digit/Oportun, Qapital) | S10, S7, S8, S9 | **High** |
| C2 | Digit/Oportun은 정확한 이체 금액 산정 공식을 공개하지 않는다. 공개된 것은 입력변수 목록과 "머신러닝 사용" 수준이다 | S10, S4, S6 | **High** |
| C3 | Digit의 "오버드래프트 무발생 보장"은 CFPB에 의해 허위로 판정되었고, 실제로 자동 이체가 오버드래프트를 유발했다 | S1, S2, S3 | **High** |
| C4 | 해당 제재는 2022-08-10, 소비자 배상 최소 $68,145 및 민사벌금 $2.7M 규모다 | S1, S3 | **High** |
| C5 | Oportun 현행 약관은 보장을 하지 않고, 은행 데이터 지연·ACH 정산 지연 등으로 계좌가 마이너스가 될 수 있음을 명시한다 | S6 | **High** |
| C6 | 유입/유출을 분리 예측해 미래 잔액 궤적을 구성하고 예측오차로 재학습하는 방식은 특허로 공개되어 있다 (US11803793B2) | S5 | **High** |
| C7 | 단, US11803793B2의 양수인은 Citizens Financial Group이며 Digit/Oportun이 아니다 | S5 | **High** |
| C8 | Digit/Oportun에 귀속되며 자동 저축 알고리즘을 공개하는 특허는 이번 조사에서 발견되지 않았다 | S2 검색결과 명시 | **Medium** (부재 증명의 한계) |
| C9 | Qapital의 규칙형 자동 이체는 예측 모델이 아니라 결정론적 트리거이며, 이체는 배치로 지연 실행된다 (주간: 일요일 트리거 → 월요일 이체) | S7, S9 | **High** |
| C10 | "출금 예정 정기결제를 특정해 그 건을 커버할 금액을 기한 전에 본인 계좌 간 이동"하는 제품은 이번 조사 범위에서 확인되지 않았다 | (부재) | **Low** — GAP1 4번 쿼리 및 GAP3 미수행. 차별성 주장 근거로 쓰기 부적합 |
| C11 | Monzo·Starling·Revolut·Chime·Cleo의 해당 기능 명세 | — | **UNVERIFIED / BLOCKED** |
| C12 | Gartner DToC 정의 및 그에 대한 비판 | — | **UNVERIFIED / BLOCKED** |
| C13 | 국내 제품·기관의 유사 기능 및 디지털 트윈 발표 | — | **UNVERIFIED / BLOCKED** |

## differentiation_analysis

냉정하게 쓴다. 확보된 근거 기준이며, GAP1 일부·GAP3 전체가 비어 있어 **결론은 잠정**이다.

### 이미 존재하는 부분 (셋업의 신규성이 아님)

1. **소액 자동 이체 자체** — Digit이 2010년대부터, Qapital이 규칙형으로 상용화했다 (C1).
   "앱이 알아서 돈을 옮겨준다"는 것은 새롭지 않다. 이 문장을 차별점으로 내세우면 즉시 반박된다.
2. **거래·현금흐름 데이터로 여유 자금을 판단하는 발상** — Digit의 공개 입력변수 목록이
   셋업이 쓰려는 입력과 사실상 겹친다: 현재 잔액, 예상 유입(급여), **반복 청구서·예정 출금**,
   최근 지출, 과거 이체 이력 (S10). 특히 "반복 청구서와 예정 출금을 입력으로 쓴다"는 점은
   셋업이 자기 고유 아이디어로 여길 수 있는 지점인데, **이미 Digit 공식 설명에 들어 있다.**
3. **잔액 예측 파이프라인** — 유입/유출 분리 → 미래 잔액 궤적 → 예측오차 재학습 구조는
   특허로 공개되어 있다 (C6). 셋업이 이 구조를 쓰는 것은 정당하지만 신규 기여가 아니다.
4. **트리거와 실제 이체의 시간 분리** — Qapital이 이미 배치 아키텍처로 운영한다 (C9).

### 실제로 새로울 가능성이 있는 부분

1. **자금 이동의 방향과 목적이 반대다.** Digit·Qapital은 *잉여를 저축으로 축적*한다 —
   목적지가 목표(goal)이고, 성공 지표는 모인 금액이다. 셋업은 *특정 날짜에 발생할 출금 채무를
   커버하기 위해 유동성을 배치*한다 — 목적지가 결제 계좌이고, 성공 지표는 결제 실패 0건이다.
   이건 UX 카피 차이가 아니라 최적화 목표 함수가 다른 것이다. 저축 앱은 "얼마나 더 옮길 수 있나"를
   최대화하고, 셋업은 "부족분이 발생할 확률"을 최소화한다.
2. **개별 정기결제·할부 건에 이동을 귀속시키는 것.** 확보된 선례는 전부 총액 기반이거나
   가맹점 트리거(Qapital Guilty Pleasure)다. "이 이체는 8/25 통신비 건을 위한 것"이라는
   **건 단위 추적성**은 확인된 선례에 없다. 단 C10 신뢰도가 Low이므로 Monzo Pots·Revolut
   Pockets·Starling Spaces 확인 전에는 주장하지 말 것.
3. **CFPB 사례를 알고 설계한다는 점** — 역설적으로 여기가 가장 방어 가능한 차별점이다.
   Digit은 보장을 광고하고 제재받았다 (C3, C4). 셋업이 처음부터 "예측은 틀릴 수 있다"를
   제품에 내장하고, 이동 실패·부족 시나리오를 UX로 노출하면 그건 선례를 학습한 설계다.

### 위험 신호

- **가장 어려운 부분은 이체가 아니라 안전성 판정이다.** Digit은 자금이 있는지 판단하는 데 실패해서
  제재받았다 (C3). 셋업의 난이도도 "계좌 간 이동 구현"이 아니라 "지금 옮겨도 안전한지 판정"에 있다.
  실제 금융기관 미연동·데모 데이터 환경에서는 이 판정의 정확도를 **검증할 수 없다.**
  따라서 발표에서 "안전하게 옮긴다"를 성과로 주장하면 근거가 없다.
  주장 가능한 것은 판정 로직의 설계와 실패 처리 방식까지다.
- **"금융 디지털 트윈" 컨셉의 근거가 현재 0이다.** GAP2가 전부 BLOCKED이므로,
  이 용어를 쓸 정당성도 과대포장 리스크도 아직 평가되지 않았다. 정의 원문 확보 전에
  기획서 제목이나 핵심 컨셉으로 확정하는 것은 권하지 않는다.
- **국내 선례 미확인이 차별성 주장 전체를 흔든다.** 토스의 "이번 달 쓸 수 있는 돈"류 기능이
  이미 유사 판정을 제공한다면 "페이스" 기능의 신규성이 크게 줄어든다. GAP3를 먼저 채워야 한다.

## unverified_or_blocked

### 완전 미수행 (BLOCKED)

- **GAP2 전체** — Gartner DToC 정의 원문, 컨설팅사 9곳 백서, 벤더 4곳 제품 주장, 비판·과대포장 논쟁
- **GAP3 전체** — 국내 핀테크 기술블로그, 은행·인터넷은행 디지털 트윈 발표, SI·인프라 기관 사업,
  국내 세이프투스펜드류 기능 공식 설명
- **GAP1 잔여** — Monzo(Salary Sorter, Pots, IFTTT형 규칙, committed spending / left to spend 계산식),
  Starling Spaces, Revolut Pockets(정기결제용 자금 분리), Chime(Get Paid Early, SpotMe),
  Cleo(Cover me, 자동 저축), Plaid Signal, Plaid Balance / Cash Flow Insights, Nova Credit, Trustly

### 부분 확인 / 주의

- **S9 URL 슬러그**: Qapital Set & Forget 문서의 URL이 검색 출력에서 절단되었다.
  아티클 ID 10245402 는 확실하나 슬러그 뒷부분은 재구성한 것이다. 인용 전 실제 접속으로 확인 필요.
- **C8(Digit 특허 부재)**: 부재 증명이므로 확정 불가. 다른 법인 명의 출원 가능성 미조사.
- **S12**: IR 보도자료의 "Digit이 소비자 저축을 늘릴 수 있다"는 주장은 마케팅 문구다.
  grade E, 성과로 승격 금지. 특히 CFPB 제재(C3)와 나란히 읽어야 한다.
- **S10**: 제품 페이지의 입력변수 목록은 벤더 자기서술이다. 독립 검증된 바 없다.
- **Oportun 리브랜딩**: Digit이 "Set & Save"로 브랜드 변경되었다는 서술은 검색 요약에서 왔고
  공식 리브랜딩 공지 원문은 확인하지 못했다. 제품명 표기 시 주의.

### 재실행 권고 순서

1. GAP3 (국내) — 차별성 주장의 성립 여부를 직접 결정. worker-D-korea.md 중복 확인 먼저.
2. GAP1 잔여 중 Monzo·Starling·Revolut — C10(건 단위 자금 분리 선례 부재)을 확정하거나 반증.
3. GAP2 — Gartner 정의 원문 + 비판론을 같은 비중으로.
