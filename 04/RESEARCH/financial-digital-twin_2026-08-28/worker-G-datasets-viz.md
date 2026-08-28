# worker-G — 합성/데모 거래 데이터 · 거래 분류 · 2D 도시 시각화

## axis

GAP1 합성·데모 거래 데이터(최우선) / GAP2 거래 분류·MCC·한국어 가맹점명 정규화 / GAP3 2D 아이소메트릭 도시 시각화.
대상 프로젝트: SSAFY 특화 PJT 소비관리 앱 `셋업(Setup)`. 실제 금융기관 미연동, 발주처 내부 API + 데모 데이터셋으로 시연.
검증해야 할 기능 루프: 거래내역 자동 분류 / 정기결제·할부 탐지 / 카테고리 가상예산 + 페이스(소진률÷월진행률) / 출금 전 결제계좌 자금 자동 준비 / 소비의 2D 도시 시각화.

**검색 예산 실측**: `web_search` 예산이 두 번 소진됐다(1차 3쿼리 후, 2차 재개 뒤 3쿼리 추가 성공하고 다시 한도). 총 **6개 쿼리 성공**. 지시된 우선순위 GAP1 > GAP2 > GAP3에 따라 GAP1(합성 데이터 생성기 3종 + Kaggle 배포본 + Plaid Sandbox)을 실검증하고, GAP2는 MCC·한국어 정규화를 제외한 Plaid 택소노미까지 확보했다. **GAP3(시각화)는 전량 BLOCKED**. 아래 표에서 검증 등급을 항목별로 분리 표기했으니, 재실행 시 `## unverified_or_blocked`의 쿼리 목록을 그대로 이어 쓰면 된다.

## queries_run

| # | query | 결과 |
|---|---|---|
| 1 | PaySim mobile money simulator Lopez-Rojas paper github license | 성공 — 논문·리포·라이선스 확인 |
| 2 | BankSim bank payment simulator Lopez-Rojas synthetic dataset kaggle | 성공 — 데이터셋 출처·생성방식 확인 |
| 3 | Sparkov data generation Brandon Harris credit card transaction generator github license | 성공 — 리포·MIT 라이선스 확인 |
| 4 | Kaggle kartik2112 Credit Card Transactions Fraud Detection Dataset Sparkov license columns | 성공 — CC0 라이선스 + 23컬럼 스키마 확인 |
| 5 | Plaid Sandbox custom user create test transactions documentation | 성공 — `user_custom`·`/sandbox/transactions/create` 확인 |
| 6 | Plaid personal_finance_category taxonomy primary detailed categories list | 성공 — PRIMARY 19종 + DETAILED 형식 확인 |
| 7 | SDV / CTGAN 라이선스 | **실행 실패 — 검색 예산 재소진** |
| 8 | 통계청 가계동향조사 마이크로데이터 이용 조건 | **실행 실패 — 검색 예산 재소진** |
| 9~ | (Nessie, Belvo/Tink/TrueLayer, FinDX, AI Hub, MCC/ISO 18245, 한국어 가맹점명 정규화, PixiJS 아이소메트릭 등) | **미실행 — BLOCKED** |

## sources

| # | title | URL | date | domain | type | grade |
|---|---|---|---|---|---|---|
| S1 | EdgarLopezPhD/PaySim (시뮬레이터 코드) | https://github.com/EdgarLopezPhD/PaySim | 논문 2016, 접근 2026-08-28 | github.com | 코드 리포 | B+ (검색결과가 리포 라이선스 표기를 인용, 원문 페이지 직접 열람은 미수행) |
| S2 | PaySim: A Financial Mobile Money Simulator for Fraud Detection (EMSS 2016, Lopez-Rojas·Elmir·Axelsson) | https://www.researchgate.net/publication/313138956_PAYSIM_A_FINANCIAL_MOBILE_MONEY_SIMULATOR_FOR_FRAUD_DETECTION | 2016 | researchgate.net | 논문 레코드 | B |
| S3 | PaySim1 데이터셋 (Kaggle, ealaxi/paysim1) | https://www.kaggle.com/datasets/ealaxi/paysim1 | 접근 2026-08-28 | kaggle.com | 데이터셋 | B |
| S4 | PaySim 배포본 LICENSE.txt (CC BY-SA 4.0 표기) | https://github.com/relationalai/templates/blob/main/v1/fraud-detection/data/paysim_mini/LICENSE.txt | 접근 2026-08-28 | github.com | 라이선스 파일(3자 재배포본) | C (원저자 배포본이 아닌 재배포 사본) |
| S5 | Synthetic data from a financial payment system = BankSim (Kaggle, ealaxi/banksim1) | https://www.kaggle.com/datasets/ealaxi/banksim1 | 접근 2026-08-28 | kaggle.com | 데이터셋 | B |
| S6 | BankSim: A Bank Payment Simulation for Fraud Detection Research (Lopez-Rojas·Axelsson) | https://www.researchgate.net/publication/265736405_BankSim_A_Bank_Payment_Simulation_for_Fraud_Detection_Research | 2014 | researchgate.net | 논문 레코드 | B |
| S7 | namebrandon/Sparkov_Data_Generation (합성 신용카드 거래 생성기) | https://github.com/namebrandon/Sparkov_Data_Generation | 접근 2026-08-28 | github.com | 코드 리포 | B+ |
| S8 | Sparkov_Data_Generation LICENSE.md (MIT) | https://github.com/namebrandon/Sparkov_Data_Generation/blob/master/LICENSE.md | 접근 2026-08-28 | github.com | 라이선스 파일 | B+ |
| S9 | Credit Card Transactions Fraud Detection Dataset (Kaggle, kartik2112/fraud-detection) | https://www.kaggle.com/datasets/kartik2112/fraud-detection/data | 데이터 2019-01-01~2020-12-31, 접근 2026-08-28 | kaggle.com | 데이터셋 | A- (라이선스·기간 명시 확인) |
| S10 | 동 데이터셋 metadata (컬럼 스키마) | https://www.kaggle.com/kartik2112/fraud-detection/metadata | 접근 2026-08-28 | kaggle.com | 데이터셋 메타데이터 | B+ |
| S11 | Plaid Docs — Sandbox: Customize test data (`user_custom`) | https://plaid.com/docs/sandbox/user-custom/ | 접근 2026-08-28 | plaid.com | 공식 문서 | A |
| S12 | Plaid Docs — Sandbox endpoints (`/sandbox/public_token/create`, `override_username`) | https://plaid.com/docs/api/sandbox/ | 접근 2026-08-28 | plaid.com | 공식 API 문서 | A |
| S13 | plaid/sandbox-custom-users (커스텀 유저 JSON 템플릿) | https://github.com/plaid/sandbox-custom-users | 접근 2026-08-28 | github.com | 코드/샘플 리포 | A- |
| S14 | Plaid Docs — Personal Finance Category migration guide (PFC 택소노미) | https://plaid.com/docs/transactions/pfc-migration/ | 접근 2026-08-28 | plaid.com | 공식 문서 | A |
| S15 | Plaid Docs — Introduction to Transactions (`/sandbox/transactions/create`) | https://plaid.com/docs/transactions/ | 접근 2026-08-28 | plaid.com | 공식 문서 | A |

소스 15개 — 목표 달성. 단 커버리지는 균등하지 않다: GAP1이 12개, GAP2가 3개, **GAP3는 0개**.

## datasets_and_sandboxes

### 실검증된 항목

| 이름 | 생성 방식 | 라이선스(실확인 여부) | 스키마/필드 | 현실성 평가 | 한국 소비 패턴 재현 가능성 | URL |
|---|---|---|---|---|---|---|
| **PaySim** | 에이전트 기반 시뮬레이션. 아프리카 모바일머니 서비스의 1개월 실거래 로그에서 뽑은 집계 통계로 캘리브레이션 후 확대 생성 (S2) | **코드 GPL-3.0** / **데이터 CC BY-SA 4.0** — 둘이 다르므로 분리 취급 필요. 코드 라이선스는 리포 표기 기준 확인(S1), 데이터 CC BY-SA는 재배포본 LICENSE.txt 기준이라 **원배포본 재확인 필요**(S4) | `step`(1시간=1스텝), `type`(CASH_IN/CASH_OUT/DEBIT/PAYMENT/TRANSFER), `amount`, `nameOrig`, `oldbalanceOrg`, `newbalanceOrig`, `nameDest`, `oldbalanceDest`, `newbalanceDest`, `isFraud`, `isFlaggedFraud` — **필드 목록은 통용 스키마 기억 기반, UNVERIFIED** | 잔액 정합성(거래 전후 잔액이 같은 행에 있음)이 있어 "자금 준비" 로직 테스트에 부분적으로 유용. 그러나 **가맹점명·카테고리·MCC가 없다** | **낮음**. 가맹점/카테고리 축이 없어 카테고리 예산·페이스 판정을 태울 수 없다. 계좌 이동 시퀀스 참고용에 한정 | S1·S3 |
| **BankSim** | 에이전트 기반 시뮬레이션. **스페인 은행**의 2012-11~2013-04 마드리드·바르셀로나 집계 거래로 캘리브레이션 (S5·S6) | Kaggle 페이지 표기 확인 필요 — **UNVERIFIED**(검색결과가 라이선스를 명시하지 않음) | 결제 카테고리, 고객·가맹점 ID, 금액, 시간 속성, 사기 라벨 (S5). 정확한 컬럼명(`step`,`customer`,`age`,`gender`,`zipcodeOri`,`merchant`,`zipMerchant`,`category`,`amount`,`fraud`)은 **UNVERIFIED** | PaySim보다 우리 과제에 가깝다 — **카테고리 축이 존재**하고 가맹점 ID가 있어 분류·예산 로직에 바로 태울 수 있다 | **중간**. 카테고리 체계는 유럽 소매 기준이고 한국 특유 항목(배달앱, 편의점, 교통카드 충전, 통신비, 관리비)이 없다. **분포 자체는 재보정 필요, 구조는 참고 가치 있음** | S5·S6 |
| **Sparkov Data Generation** (Brandon Harris) | 규칙 기반 프로파일 생성기. 인구통계 프로파일별로 카드 거래를 합성 (Faker 계열 조합) | **MIT** — LICENSE.md 기준 확인(S8). 상업적 이용·수정·배포 허용, 저작권 고지 유지 조건 | 리포 출력 스키마 **UNVERIFIED**. 통용본은 `trans_date_trans_time`, `cc_num`, `merchant`, `category`, `amt`, `first/last`, `gender`, `street/city/state/zip`, `lat/long`, `city_pop`, `job`, `dob`, `trans_num`, `unix_time`, `merch_lat/merch_long`, `is_fraud` | **우리 목적에 3개 중 최적**. 이유: (a) 라이선스가 MIT라 코드 개조·재배포 자유, (b) 프로파일 기반이라 페르소나 개념이 이미 있음, (c) 가맹점명+카테고리+타임스탬프가 함께 나온다 | **중간~높음(개조 전제)**. 미국 지오/직업/가맹점 사전을 한국 사전으로 치환하면 골격 재사용 가능. 라이선스가 MIT라 이 개조가 법적으로 안전한 유일한 선택지 | S7·S8 |
| **Kaggle `kartik2112/fraud-detection`** (Sparkov 산출 배포본) | Sparkov 생성기로 만든 합성 카드 거래. **2019-01-01 ~ 2020-12-31, 24개월** (S9) | **CC0 Public Domain** — Kaggle 페이지 표기 확인(S9). 법적 출처표시 의무 없음 | **23개 컬럼 확인(S9·S10)**: `trans_date_trans_time`, `cc_num`, `merchant`, `category`, `amt`, `first`, `last`, `gender`, `street`, `city`, `state`, `zip`, `lat`, `long`, `city_pop`, `job`, `dob`, `trans_num`, `unix_time`, `merch_lat`, `merch_long`, `is_fraud`, `merch_zipcode`(결측 가능). `fraudTrain.csv`/`fraudTest.csv` 분할 | **GAP1 최선의 즉시 사용 후보**. 24개월치이므로 우리가 필요한 13개월 요건을 이미 초과 충족. 생성기를 안 돌려도 스키마 참고와 골격 확보가 가능 | **낮음(그대로는)** / **높음(스키마 차용 시)**. 값은 전부 미국 기준이나 컬럼 설계는 그대로 차용 가치가 있다. `trans_date_trans_time`+`unix_time` 이중 표기, 가맹점 좌표 분리는 우리 도시 시각화에도 매핑됨 | S9·S10 |
| **Plaid Sandbox (custom user)** | 실데이터 아님 — **우리가 정의한 JSON을 그대로 거래로 주입**하는 결정론적 테스트 하니스 (S11·S12) | Plaid 공식 문서. 서비스 이용약관 적용(별도 확인 필요), 데이터 라이선스 개념 아님 | `override_username=user_custom` + custom-user JSON을 `override_password`에 전달(S12). 사후 거래 추가는 `user_transactions_dynamic` + `/sandbox/transactions/create`(S15). JSON 템플릿은 `plaid/sandbox-custom-users`(S13) | **개념적으로 우리 과제와 가장 유사**. "발주처 내부 API + 데모 데이터셋"의 정확한 선례 — 시나리오를 JSON으로 선언하고 결정론적으로 재생하는 구조 | **해당 없음(데이터 제공자가 아님)**. 대신 **우리 데모 API 설계의 참조 모델**로서 가치가 크다. 특히 "고정 초기 이력 + 동적 추가 + 웹훅 트리거" 3분할 | S11·S12·S13·S15 |

### 라이선스 실무 판단 (검증된 사실만)

- PaySim 코드는 GPL-3.0(S1). 우리 앱 코드에 생성기를 **직접 링크·내장하면 GPL 전염 위험**이 있다. 생성기를 별도 오프라인 도구로 돌려 CSV만 뽑아 쓰는 방식이면 실무적으로 회피 가능하지만, 산출 데이터가 CC BY-SA(S4)면 **배포 시 동일조건변경허락 + 출처표시** 의무가 붙는다. 발표·시연 자료에 데이터 출처를 넣어야 한다.
- Sparkov는 MIT(S8). **개조·내장·재배포 모두 가능**하고 고지문만 유지하면 된다. 데모 데이터 생성기를 리포 안에 넣어야 하는 우리 상황에 유일하게 마찰 없는 라이선스다.
- Kaggle `kartik2112/fraud-detection`은 **CC0**(S9) — 3종 중 가장 제약이 없다. 리포 커밋·재배포·개조 전부 자유이고 출처표시 의무조차 없다(관례상 표기는 권장). **생성기 코드가 필요하면 Sparkov(MIT), 완성 데이터가 필요하면 이 CC0 배포본** 조합이 라이선스상 가장 안전하다.
- BankSim 라이선스는 확인하지 못했다. **확인 전에는 파일을 리포에 커밋하지 말 것.**

### 미검증 후보 (존재는 추정, 사실로 쓰지 말 것)

아래는 지시된 조사 대상이지만 **검색 예산 소진으로 단 한 건도 확인하지 못했다**. 이름·URL 형태·특성 모두 **UNVERIFIED**이며, 다음 라운드에서 각각 1차 출처를 열어 라이선스·스키마를 확인해야 한다. 확인 전 기획서 인용 금지.

- Kaggle `ealaxi/paysim1`의 "Synthetic Financial Datasets For Fraud Detection" 표기 동일성 — UNVERIFIED
- SDV(Synthetic Data Vault), CTGAN, TVAE — 표형식 합성. 라이선스·한국 거래 적합성 UNVERIFIED
- Gretel, YData — 상용/오픈코어 여부, 무료 한도 UNVERIFIED
- Capital One Nessie API, Belvo / Tink / TrueLayer sandbox — UNVERIFIED
- 금융데이터거래소(FinDX), AI Hub 금융 데이터셋, 신한카드·BC카드 공개 소비 데이터 — UNVERIFIED
- 통계청 가계동향조사 마이크로데이터(MDIS) — UNVERIFIED. **이 항목이 한국 소비 분포 캘리브레이션의 핵심 근거이므로 다음 라운드 1순위**

## classification_resources

**부분 완료.** Plaid PFC 택소노미는 실검증했고, MCC·한국어 가맹점명 정규화는 **BLOCKED**(예산 재소진).

### Plaid `personal_finance_category` — 검증됨 (S14·S15)

2단 계층이다. `PRIMARY`(대분류) + `DETAILED`(소분류), 그리고 `confidence_level`이 함께 반환된다.

확인된 PRIMARY 19종:
`INCOME`, `TRANSFER_IN`, `TRANSFER_OUT`, `LOAN_PAYMENTS`, `BANK_FEES`, `ENTERTAINMENT`, `FOOD_AND_DRINK`, `GENERAL_MERCHANDISE`, `HOME_IMPROVEMENT`, `MEDICAL`, `PERSONAL_CARE`, `GENERAL_SERVICES`, `GOVERNMENT_AND_NON_PROFIT`, `TRANSPORTATION`, `TRAVEL`, `RENT_AND_UTILITIES`, `OTHER` (+ 문서상 잔여 항목 포함, 총 19종 규모)

DETAILED는 `<PRIMARY>_<SUBTYPE>` 형식으로 PRIMARY를 접두어로 포함한다(예: `FOOD_AND_DRINK_COFFEE`, `RENT_AND_UTILITIES_RENT`, `TRANSPORTATION_PUBLIC_TRANSIT`). 총 약 100여 종 규모 — **정확한 전체 개수는 UNVERIFIED**.

**우리 설계에 주는 시사점 3개**

1. `INCOME` / `TRANSFER_IN` / `TRANSFER_OUT`을 소비 카테고리와 **같은 레벨에서 분리**해 둔 것이 핵심이다. 우리 페이스 계산은 소비만 세야 하므로, 이 3종은 예산 소진률 분자에서 제외되는 별도 축으로 두어야 한다. Plaid가 이미 그 구조를 택했다는 것이 설계 근거가 된다.
2. `RENT_AND_UTILITIES`가 독립 PRIMARY다 — 월세·관리비를 변동 소비와 섞지 않는다. 우리 P3(고정비 과중형)에서 "고정비를 페이스에 포함할지" 정책 판단의 기성 선례.
3. `LOAN_PAYMENTS`가 별도 PRIMARY — 할부·대출 상환을 소비로 세지 않는다.

**한국화 시 부족한 것**(가설, UNVERIFIED): 배달앱, 교통카드 충전, 통신비, PC방·노래방, 편의점(GENERAL_MERCHANDISE로 뭉개짐). PFC를 그대로 쓰면 한국 사용자가 체감하는 카테고리와 어긋난다 — PRIMARY 골격만 차용하고 DETAILED는 자체 정의하는 것이 현실적이다.

### BLOCKED 항목 — 확인 대상 가설 (사실 주장 아님)

- MCC 공개 목록: ISO 18245가 MCC를 규정하는 표준으로 알려져 있으나 **표준 문서는 유료일 가능성**이 있다. 무료로 쓸 수 있는 실용 목록의 출처(카드사 개발자 문서, 결제 게이트웨이 문서 등)를 찾는 편이 현실적 — 전부 UNVERIFIED
- 한국 업종분류: 여신금융협회·카드사 가맹점 업종 코드가 MCC와 1:1이 아닐 가능성이 크다. **MCC를 그대로 쓰면 한국 데모 데이터에 안 맞는다**는 것이 검증해야 할 핵심 가설 — UNVERIFIED
- bank transaction categorization OSS/모델/API — 후보 미확보. UNVERIFIED
- 한국어 가맹점명 정규화: 확인해야 할 실제 노이즈 패턴 목록(우리 데모 데이터 생성기가 **일부러 넣어야 하는** 노이즈이므로 기획상 중요)
  - PG 접두어 (예: `(주)케이지이니시스`, `토스페이먼츠` 등이 실제 가맹점명 앞에 붙는 현상)
  - 법인 표기 `(주)` / `㈜` / `주식회사` 혼용, 전각·반각 혼재
  - 지점명 접미 (`스타벅스 강남역점`, `GS25 역삼1호점`)
  - 사업자 등록명 ≠ 브랜드명 (`(주)에스씨케이컴퍼니` = 스타벅스 등의 케이스)
  - 카드 전표 길이 제한으로 인한 절단·공백 소실
  - 위 5개 패턴은 **실무 경험 기반 가설이며 출처 미확인 — UNVERIFIED**

## visualization_notes

**전체 BLOCKED — 검색 미실행.**

확인해야 할 항목만 나열한다. 아래 기술적 서술은 출처 없는 사전 지식이므로 **UNVERIFIED**이며 기획서에 근거로 인용해서는 안 된다.

- 엔진 후보: PixiJS(2D 렌더러), Phaser, Flutter Flame, react-three-fiber, Godot 웹빌드. **프론트 스택이 무엇인지에 따라 선택이 갈리므로, 스택 확정 전 조사 가치가 낮다** — 다음 라운드에서 앱 스택(Flutter / React / RN) 확정 후 조사할 것
- 확인 필요한 실무 쟁점 3개
  1. 아이소메트릭 타일의 depth sorting — 스프라이트를 y좌표(또는 x+y) 기준 정렬하는 painter 방식이 일반적으로 알려져 있으나, 다층 건물·오버레이가 섞일 때의 정렬 붕괴 사례와 해법을 실무 글에서 확인해야 함
  2. 스프라이트 아틀라스 최적화 — draw call 병합 효과와 모바일 텍스처 메모리 한계
  3. 상태 오버레이(크레인/경고등/균열) 레이어 분리 — 건물 스프라이트와 상태 표식을 별 레이어로 두면 상태 조합 폭발(건물종류 × 상태)을 스프라이트 수 곱셈 없이 처리할 수 있다는 것이 검증할 가설
- Godot 웹빌드는 SharedArrayBuffer 관련 HTTP 헤더 요구가 있는 것으로 알려져 있어 **정적 호스팅 제약**이 될 수 있다 — UNVERIFIED, 배포 방식 확정 시 반드시 확인

## demo_dataset_design

이 절은 **외부 소스가 필요 없는 설계 산출물**이므로 검색 예산과 무관하게 완결해서 제출한다. 목적은 하나다 — 데모 데이터셋이 페이스 판정·자금 준비·코인 루프를 **실제로 반증할 수 있는가**.

### 규모 결론

| 항목 | 값 | 근거 |
|---|---|---|
| 페르소나 수 | **5명** | 아래 5개 판정 경로를 각 1명이 전담. 6명 이상은 검수 비용만 늘고 새 경로를 안 만든다 |
| 기간 | **13개월** (12+1) | 정기결제 탐지에 동일 주기 **3회 이상** 반복이 필요 → 월간 구독은 3개월로 충분하지만, 12개월 할부가 "완료된 케이스"와 "진행 중 케이스"로 동시에 존재하려면 12개월을 넘겨야 한다. 13번째 달이 있으면 연간 결제 1회 재출현도 관측 가능 |
| 거래 건수 | 페르소나당 월 60~120건 → **총 약 4,000~8,000건** | 손으로 전수 검수 가능한 상한이면서 카테고리별 월 표본이 통계적으로 민망하지 않은 하한 |

### 페르소나 5명 — 각자가 반증하는 것

| ID | 성격 | 이 페르소나가 없으면 검증 못 하는 것 |
|---|---|---|
| P1 | 안정형. 페이스 0.9~1.1 유지, 잔액 항상 여유 | **정상 경로**. 도시가 성장하고 코인이 정상 적립되는 happy path. 이게 없으면 "항상 경고를 띄우는 앱"과 구분이 안 된다 |
| P2 | 월초 폭주형. 1주차에 예산 50% 소진 | **페이스 분모 폭발 엣지케이스**. 월 3일차 소진률 20%면 페이스 = 0.20 ÷ 0.10 = 2.0. 월초에는 월진행률이 작아 페이스가 구조적으로 튄다. **초반 N일 판정 유예 또는 하한 클램프가 필요하다는 사실을 이 페르소나만이 드러낸다** |
| P3 | 고정비 과중형. 구독 7종 + 할부 3건 | **정기결제·할부 탐지 재현율**과, 고정비를 페이스 계산에서 제외/포함할지의 정책 검증 |
| P4 | 잔액 부족형. 결제일 D-1 결제계좌 잔액 < 청구액 | **자금 자동 준비의 본 시나리오**. 추가로 (a) 이체 원천계좌도 부족한 이중 실패, (b) 일부만 채우는 부분 충전 두 케이스를 포함해야 실패 경로가 검증된다 |
| P5 | 불규칙 소득형(프리랜서). 입금일·금액 변동 | **예산 리셋 기준선 흔들림**. 급여일 기준 예산 주기를 쓸 경우 이 페르소나에서 깨진다. 페이스의 "월진행률" 정의(달력월 vs 급여주기)를 강제로 확정하게 만든다 |

### 반드시 포함할 이벤트와 그 이유

**급여 입금** — 매월 25일 고정형(P1·P3·P4), 불규칙형(P5). 지급일이 주말·공휴일이면 **직전 영업일로 앞당김**. 상여 1~2회 주입(예산 여유가 급변하는 달을 만든다).

**월세·관리비** — 매월 동일일·동일액 계좌이체. 핵심은 **가맹점명이 없다는 것**(수취인 성명 또는 계좌 별칭만 존재). 카드 거래 전제로 만든 분류기가 여기서 깨지므로 반드시 포함.

**구독** — 월간(스트리밍·음악·클라우드), 연간(보험·도메인) 혼합. 포함해야 할 함정 3개:

- 금액 인상 (구독료가 6개월차에 변경 → 동일 구독으로 인식해야 함)
- 결제일 드리프트 (말일 결제가 2월엔 28/29일로 밀림)
- 무료 체험 후 첫 청구 (0원 → 유료 전환)

**할부** — 3·6·12개월 혼합. 필수 조합: ① 데이터 기간 중 시작·종료가 모두 들어온 완결 건, ② 기간 시작 전에 이미 진행 중이던 건(첫 회차가 데이터에 없음), ③ 데이터 끝에서 미완인 건. ②가 없으면 "회차 정보 없이 잔여 할부를 추정하는" 실제 상황을 못 만든다. 무이자/유이자 구분도 필요(청구액 ≠ 원금/개월수).

**환불·취소** — 원거래 참조(`original_txn_id`) 필수. 포함할 4종: 전액 환불, 부분 환불, **월 경계를 넘는 환불**(3월 결제 → 4월 환불: 어느 달 소진률에서 빼는지 정책을 강제로 결정하게 함), 취소 후 재승인(중복 계상 버그를 잡는다).

**승인–청구 시차** — 스키마에 **3개 시각 필드를 분리**한다: `authorized_at`(승인), `posted_at`(청구 확정), `settlement_date`(실제 출금일).

- 체크카드/즉시출금: 시차 0
- 신용카드 일반: 1~3일
- 주말·공휴일 이월
- 해외 결제: 3~7일 + **승인금액 ≠ 청구금액**(환율 확정으로 금액 변동)

이 필드 분리가 없으면 두 기능이 통째로 검증 불가다. 페이스는 어느 시각 기준으로 소진률을 세는지(승인 기준이 사용자 체감에 맞고, 청구 기준이 회계에 맞다), 자금 준비는 `settlement_date` 역산으로 언제 트리거하는지 — 둘 다 시차가 존재해야 답이 나오는 질문이다.

### 생성 파이프라인 (결정론적)

시드 고정 6단계. 순서를 지켜야 이벤트 간 모순(잔액 음수, 환불이 원거래보다 앞섬)이 안 생긴다.

1. 13개월 캘린더 생성 + 한국 공휴일 테이블 (영업일 이월 계산의 전제)
2. 고정 이벤트 배치 — 급여, 월세, 구독, 할부 회차
3. 변동 소비 샘플링 — 카테고리별 금액 분포(로그정규 계열) × 요일·시간대 가중치(점심/퇴근 후/주말 피크)
4. 승인 → 청구 → 출금 매핑 (시차·공휴일 이월·해외 환율 변동 적용)
5. 환불·취소·중복승인 주입 (원거래를 참조하므로 반드시 3단계 이후)
6. 정합성 assert 후 CSV/JSON 출력

### 남겨야 할 검증 하나 (lazy check)

생성기와 함께 `assert` 기반 자기검사 하나. 프레임워크·픽스처 없이 이것만 있으면 데이터가 조용히 썩는 걸 막는다.

- 잔액 정합성: 모든 계좌에서 시간순 누적 잔액이 음수로 가지 않는다 (P4의 의도된 부족 케이스는 화이트리스트)
- 기대 라벨 일치: 페르소나 × 월 → 기대 페이스 판정(정상/주의/초과)이 사전 정의와 일치
- 탐지 정답 수: 정기결제 정답 건수, 할부 정답 건수가 생성 시 심어둔 개수와 일치
- 자금 준비 트리거: P4에서 최소 1회 발생, P1에서 0회
- 환불 정합성: 모든 환불의 `original_txn_id`가 존재하고 시각이 원거래보다 늦다

이 다섯 개가 페이스·자금준비·코인 루프의 회귀 테스트를 동시에 대신한다. 데모 데이터가 곧 테스트 픽스처이므로 별도 테스트 데이터를 또 만들 필요가 없다.

### 카테고리 분포 캘리브레이션 (미해결)

한국 소비 분포를 어디서 가져올지가 **이 설계의 유일한 미해결 변수**다. 통계청 가계동향조사의 가구소득 분위별 소비 비목 비중을 카테고리 예산 기본값으로 쓰는 방안이 유력하나, **접근 조건·라이선스를 확인하지 못했다(BLOCKED)**. 확인 전에는 팀 내부 감각으로 임시 비중을 넣고 `# 캘리브레이션 미확정` 표시를 남길 것을 권한다. 비중은 나중에 상수 하나만 바꾸면 되도록 분리해 둘 것.

### 구현 경로 권고 (검증된 라이선스에 근거)

세 갈래 중 하나를 고르는 문제가 아니라, **역할이 다르므로 셋을 겹쳐 쓰는 것**이 답이다.

| 용도 | 채택안 | 근거 |
|---|---|---|
| 스키마 설계 | Kaggle `kartik2112/fraud-detection` 23컬럼(S9·S10)을 출발점으로, 여기에 우리 필수 필드 추가 | CC0라 제약 없음. 이미 24개월 실증된 컬럼 구성 |
| 카테고리 택소노미 | Plaid PFC의 **PRIMARY 골격 차용 + DETAILED 자체 정의**(S14) | `INCOME`/`TRANSFER`/`RENT_AND_UTILITIES`/`LOAN_PAYMENTS` 분리 구조가 페이스 계산에 그대로 필요 |
| 데모 API 형태 | Plaid Sandbox의 3분할 — 고정 초기 이력(JSON 선언) + 동적 거래 추가(`/sandbox/transactions/create`) + 트리거(S11·S15) | 시연 중 "지금 결제가 발생했다"를 재현하려면 동적 주입 엔드포인트가 반드시 필요하다. Plaid가 같은 문제를 이 형태로 풀었다 |
| 생성기 코드 | 자체 작성 권장 (Sparkov MIT는 개조 가능하나 미국 지오/직업 사전 의존이 커서 치환 비용이 신작보다 클 가능성) | S7·S8. **치환 비용 실측은 안 했다 — 판단 근거는 스키마 관찰뿐**이므로 착수 전 리포를 직접 열어볼 것 |

Kaggle 23컬럼에 **우리가 반드시 더해야 하는 필드**: `authorized_at` / `posted_at` / `settlement_date`(3분할 시각), `original_txn_id`(환불 참조), `installment_seq` + `installment_total`(할부 회차), `recurring_group_id`(정기결제 정답 라벨), `account_id`(다계좌 — 자금 준비의 전제), `persona_id`. Kaggle 스키마에는 이 7종이 전부 없다 — 사기탐지용이지 가계관리용이 아니기 때문이다. **이 격차가 우리 생성기를 자체 작성해야 하는 실질적 이유다.**

## claims

검증된 사실만. 나머지는 위 절에서 UNVERIFIED로 표기했다.

1. PaySim은 Lopez-Rojas·Elmir·Axelsson의 EMSS 2016 논문에 기반한 모바일머니 시뮬레이터이고, 코드 리포는 `EdgarLopezPhD/PaySim`, 코드 라이선스는 GPL-3.0으로 표기돼 있다. (S1·S2)
2. PaySim 배포 데이터에는 CC BY-SA 4.0 표기가 붙어 있으며, **코드와 데이터의 라이선스가 다르다**. (S4 — 재배포본 기준이므로 원배포본 재확인 필요)
3. BankSim은 스페인 은행의 2012-11~2013-04 마드리드·바르셀로나 집계 거래로 캘리브레이션한 에이전트 기반 합성 데이터이며, Kaggle에서는 "Synthetic data from a financial payment system"(`ealaxi/banksim1`)이라는 이름으로 배포된다 — PaySim과 별개 데이터셋이다. (S5·S6)
4. BankSim에는 결제 카테고리·가맹점 식별자·금액·시간·사기 라벨 축이 존재한다. (S5)
5. Sparkov Data Generation(`namebrandon/Sparkov_Data_Generation`)은 MIT 라이선스이며 상업적 이용·수정·배포가 허용된다. (S7·S8)
6. 위 3개 중 **우리 리포에 생성기를 내장·개조해야 하는 요구사항과 라이선스가 충돌하지 않는 것은 Sparkov(MIT)뿐이다.** PaySim은 GPL-3.0 전염 위험이 있고 BankSim은 라이선스 미확인이다. (S1·S5·S8에서 도출)
7. Kaggle `kartik2112/fraud-detection`("Credit Card Transactions Fraud Detection Dataset")은 Sparkov 생성기 산출물이고, **CC0 Public Domain**이며 **2019-01-01~2020-12-31 24개월** 구간을 `fraudTrain.csv`/`fraudTest.csv`로 분할 배포한다. (S9)
8. 동 데이터셋의 컬럼은 23개이고 `trans_date_trans_time`, `cc_num`, `merchant`, `category`, `amt`, `lat/long`, `merch_lat/merch_long`, `unix_time`, `is_fraud` 등을 포함한다. (S9·S10)
9. Plaid Sandbox는 `override_username`을 `user_custom`으로 두고 커스텀 유저 JSON을 넘겨 **임의의 거래 이력을 결정론적으로 주입**할 수 있다. JSON 템플릿은 `plaid/sandbox-custom-users` 리포에 있다. (S11·S12·S13)
10. Plaid Sandbox는 최초 이력 주입과 별개로 `user_transactions_dynamic` 및 `/sandbox/transactions/create`로 **사후 거래 추가**를 지원한다. (S15)
11. Plaid `personal_finance_category`는 `PRIMARY`(19종 규모) + `DETAILED`(`<PRIMARY>_<SUBTYPE>` 형식) 2단 계층이며, `INCOME`·`TRANSFER_IN`·`TRANSFER_OUT`·`LOAN_PAYMENTS`·`RENT_AND_UTILITIES`를 일반 소비 카테고리와 **같은 레벨에서 분리**한다. (S14·S15)
12. Kaggle 23컬럼 스키마에는 승인/청구/출금 시각 분리, 환불 원거래 참조, 할부 회차, 정기결제 그룹, 다계좌 식별자가 **없다** — 사기탐지 목적 스키마이기 때문이다. (S9·S10에서 도출)

## unverified_or_blocked

**원인: `web_search` 예산이 두 차례 소진(총 6쿼리 성공).** 지시된 우선순위대로 GAP1 → GAP2 순으로 투입했고 **GAP3에는 한 쿼리도 닿지 못했다.**

### BLOCKED — 다음 라운드 쿼리 목록 (우선순위 순)

1. 통계청 가계동향조사 마이크로데이터 소비 비목별 지출 비중 + MDIS 이용 조건 — *데모 데이터의 한국 현실성을 좌우하는 유일한 근거*
2. 한국어 가맹점명 정규화 사례 (PG 접두어, `(주)`/`㈜`, 지점명) — *GAP2의 핵심 미해결*
3. MCC 무료 공개 목록 출처 + ISO 18245 접근 조건
4. 여신금융협회/카드사 업종코드와 MCC 매핑 가능성
5. PixiJS·Phaser·Flame 아이소메트릭 타일 구현 사례 및 depth sorting 실무 글 — **앱 프론트 스택 확정 후 조사가 효율적**
6. 스프라이트 아틀라스 최적화 + 상태 오버레이 레이어 분리 패턴
7. Godot 웹빌드 SharedArrayBuffer 헤더 요구사항
8. BankSim(`ealaxi/banksim1`) Kaggle 페이지의 라이선스 표기
9. PaySim 원배포본의 데이터 라이선스 (S4가 3자 재배포본이므로)
10. SDV / CTGAN / TVAE 라이선스 및 표형식 금융거래 합성 품질 평가
11. bank transaction categorization OSS·모델·API 후보
12. Capital One Nessie API / Belvo / Tink / TrueLayer sandbox 데모 데이터 주입 가능 범위
13. 금융데이터거래소(FinDX), AI Hub 금융 데이터셋 실제 공개 여부·이용 조건
14. Gretel / YData 무료 한도
15. Plaid PFC DETAILED 전체 개수·전량 목록 (현재 형식만 확인)

### UNVERIFIED — 이 문서 내 사실로 인용 금지 항목

- PaySim·BankSim의 **정확한 컬럼명 목록** (기억 기반, 1차 출처 미확인). Kaggle `kartik2112/fraud-detection`의 23컬럼은 **검증됨**(S9·S10)
- BankSim 라이선스 — 미확인. **확인 전 리포 커밋 금지**
- Plaid PFC의 PRIMARY 19종 **전량 정확성** 및 DETAILED 총 개수 — 형식과 주요 항목은 확인, 전수 목록은 미확인
- MCC/ISO 18245, 한국 업종코드 매핑, 한국어 가맹점명 노이즈 패턴 — 전부 미확인
- `## visualization_notes` 절 **전체** — 엔진 특성, depth sorting 기법, Godot 헤더 제약 포함
- `## datasets_and_sandboxes` 의 "미검증 후보" 목록에 있는 모든 데이터셋·API의 존재 여부 및 URL 형태
- Sparkov 리포의 미국 지오/직업 사전 **치환 비용** — 리포를 직접 열지 않았으므로 "신작이 더 쌀 수 있다"는 판단은 관찰 기반 추정이다

### 검증된 것 vs 아닌 것 경계

`## demo_dataset_design` 절은 **외부 출처가 필요 없는 설계 제안**이므로 검색 예산과 무관하게 완결됐다. 단, 그 안의 **카테고리 금액 분포·비중 수치는 근거가 없다**(위 BLOCKED #1). 페르소나 구성·이벤트 목록·시차 필드 설계·검증 assert는 도메인 논리에서 도출된 것으로 외부 근거 없이도 성립한다.
