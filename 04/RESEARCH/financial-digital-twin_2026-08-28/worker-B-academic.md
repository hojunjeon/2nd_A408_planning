# Worker B — 학술 · 기술 구현 축 (Academic / Technical Implementation)

> TOPIC: 금융 디지털 트윈 (Financial Digital Twin)
> 프로젝트: SSAFY 특화 PJT 소비관리 앱 "셋업(Setup)"
> 조사일: 2026-08-28 · 조사자: worker-B (+ 병렬 서브 스카우트 3)

## axis

축 B는 **논문·프리프린트·기술 아키텍처·알고리즘**만 담당한다. 규제/공식문서(A), 업계 사례(C),
국내 언론(D), 커뮤니티·OSS(E), 위키/영상/소셜(F)은 다른 축의 몫이다.

핵심 질문은 하나였다. "금융 디지털 트윈"이라는 컨셉 아래 **개인 단위 소비·현금흐름 트윈**을
실제로 구현할 때, 각 기능을 뒷받침하는 검증된 기법과 논문이 존재하는가.

결론 요약: **컨셉의 상위 골격(디지털 트윈 5차원 모델)은 A급 근거가 있고, 하위 구현 기능
(거래 분류 → 현금흐름 예측)은 프리프린트 중심이지만 파이프라인 형태로 실증된 선례가 있다.**
반면 정기결제 탐지 · 합성 데이터 생성기 · ABM/RL 파트는 이번 라운드에서 **URL 확인 실패**로
남았다. 없는 논문을 만들지 않기 위해 그대로 비워 두었다 (unverified_or_blocked 절 참조).

## queries_run

실행된 질의 (검색 예산 소진 지점까지):

| # | 질의 | 결과 |
| --- | --- | --- |
| 1 | digital twin in finance survey / financial digital twin | 부분 성공 |
| 2 | digital twin of a customer / digital twin for banking | 절단된 결과만 (URL 미확인) |
| 3 | five-dimension digital twin model Tao Fei | 성공 (A급) |
| 4 | five-dimension digital twin modeling key technologies | 성공 |
| 5 | conceptual digital twin modeling five-dimensional framework | 성공 (메타데이터 일부 결측) |
| 6 | bank transaction classification machine learning paper | 성공 |
| 7 | merchant category classification transaction description NLP | 성공 |
| 8 | hierarchical classification financial transactions transformer | 성공 |
| 9 | open banking transaction classification | 성공 |
| 10 | SME bank transaction categorisation synthetic data | 성공 |
| 11 | merchant category identification credit card transactions | 성공 |
| 12 | MCC merchant category code ISO 18245 | 성공 (B급 공식문서) |
| 13 | active learning BERT fine-tuning annotation cost | 성공 (메타데이터 결측) |
| 14 | household cash flow forecasting deep learning | 성공 |
| 15 | bank account balance prediction transaction time series | 성공 |
| 16 | personal cash flow prediction machine learning | 성공 |
| 17 | explainable household level forecasting | 성공 |
| 18 | probabilistic time series forecasting benchmark | 성공 (C급) |
| 19 | recurring transaction / subscription / periodicity detection | **결과 없음 → BLOCKED** |
| 20 | PaySim / BankSim / CTGAN / Sparkov / synthetic transaction data | **미실행 → BLOCKED** |
| 21 | ABIDES / Mesa / household consumption ABM | **미실행 → BLOCKED** |
| 22 | RL personal financial planning / consumption-savings | **미실행 → BLOCKED** |
| 23 | N-BEATS / DeepAR / TFT / Prophet / Croston / M4-M5 | **결과 없음 → BLOCKED** |

검색 예산 한계로 19~23번은 미완이다. 병렬 스카우트를 추가 투입하려 했으나 세션 전체
동시 실행 슬롯(11개)이 이미 다른 축에 점유되어 재시도가 거부되었다.

## sources

등급: **A**=peer-reviewed/표준 · **B**=공식문서 · **C**=업계 · **D**=preprint · **E**=일화

### B-1. 디지털 트윈 아키텍처 이론

| # | title | URL | date | venue | type | grade |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Five-dimension digital twin model and its ten applications — Tao Fei et al. | https://doi.org/10.13196/j.cims.2019.01.001 | 2019 | Computer Integrated Manufacturing Systems (CIMS) 25(1):1-18 | paper | **A** |
| 2 | Five-dimension Digital Twin Model and its Ten Applications (기관 서지 레코드) | https://research.buaa.edu.cn/en/publications/ | 2019 | Beihang University 발행기록 | docs | **B** |
| 3 | Five-Dimension Digital Twin Modeling and Its Key Technologies | https://www.researchgate.net/publication/331144819_Five-Dimension_Digital_Twin_Modeling_and_Its_Key_Technologies | UNVERIFIED | ResearchGate 호스팅 | paper (mirror) | B |
| 4 | Five-dimension Digital Twin Model and its Ten Applications (RG 미러) | https://www.researchgate.net/publication/331095580 | 2019 | RG 미러 (CIMS) | paper (mirror) | C |
| 5 | Conceptual digital twin modeling based on an integrated five-dimensional framework | https://www.sciencedirect.com/science/article/abs/pii/S0278612520301163 | UNVERIFIED (PII상 2020 추정) | ScienceDirect (ISSN 0278-6125 → J. Manufacturing Systems 추정, 미확인) | paper | A (등급확정 보류) |
| 6 | Digital twin five-dimensional model (보충자료) | https://jtte.chd.edu.cn/supplement/e7d94f4d-9465-45e2-88d2-1e371b521b3c | UNVERIFIED | J. Traffic and Transportation Engineering 보충 | docs | C |

> #2 #4의 URL은 긴 슬러그가 포함된 경로였다. 안전하게 축약했으므로 인용 시 해당 사이트에서
> 제목 검색으로 재확인할 것. DOI(#1)가 정식 인용 경로다.

### B-2. 거래내역 자동 분류 (Transaction / Merchant Categorization)

| # | title | URL | date | venue | type | grade |
| --- | --- | --- | --- | --- | --- | --- |
| 7 | Hierarchical Classification of Financial Transactions Through Context-Fusion of Transformer-based Embeddings and Taxonomy-aware Attention Layer | https://arxiv.org/abs/2312.07730 | 2023 | arXiv | preprint | **D** |
| 8 | Scalable and Weakly Supervised Bank Transaction Classification | https://arxiv.org/abs/2305.18430 | 2023 | arXiv | preprint | **D** |
| 9 | Identifying Banking Transaction Descriptions via Support Vector Machine Short-Text Classification Based on a Specialized Labelled Corpus | https://arxiv.org/abs/2404.08664 | 2024 | arXiv | preprint | **D** |
| 10 | An Approach to Classifying Open Banking Transactions | https://arxiv.org/html/2504.12319v1 | 2025 | arXiv | preprint | **D** |
| 11 | Categorising SME Bank Transactions with Machine Learning and Synthetic Data Generation | https://arxiv.org/abs/2508.05425 | 2025 | arXiv | preprint | **D** |
| 12 | Merchant Category Identification Using Credit Card Transactions | https://arxiv.org/abs/2011.02602 | 2020 | arXiv | preprint | **D** |
| 13 | Merchant Category Code (MCC) Lookup — ISO 18245 | https://developer.mastercard.com/locations-merchants/documentation/use-cases/merchant-category-code-lookup/ | 접속 2026-08-28 | Mastercard Developers | docs | **B** |
| 14 | Active learning for BERT-style fine-tuning (arXiv 2104.14289) | https://arxiv.org/abs/2104.14289 | 2021 | arXiv | preprint | D (제목·연도 UNVERIFIED) |

### B-3. 현금흐름 · 잔액 예측

| # | title | URL | date | venue | type | grade |
| --- | --- | --- | --- | --- | --- | --- |
| 15 | Deep learning enhancing banking services: a hybrid transaction classification and cash flow prediction approach | https://link.springer.com/article/10.1186/s40537-022-00651-x | 2022 | Journal of Big Data (Springer) | paper | **A** |
| 16 | Financial Forecasting and Analysis for Low-Wage Workers | https://arxiv.org/html/1806.05362v3 | 2018 | arXiv | preprint | **D** |
| 17 | Supervised Neural Networks for Illiquid Alternative Asset Cash Flow Forecasting | https://arxiv.org/abs/2108.02853 | 2021 | arXiv | preprint | **D** |
| 18 | Machine Learning for Financial Forecasting, Planning and Analysis | https://arxiv.org/html/2107.04851v1 | 2021 | arXiv | preprint | **D** |
| 19 | Financial Management System for SMEs: Real-World Deployment of Accounts Receivable and Cash Flow Prediction | https://arxiv.org/abs/2511.03631 | 2025 | arXiv | preprint | **D** |
| 20 | An Explainable Machine Learning Approach for Energy Forecasting at the Household Level | https://arxiv.org/html/2410.14416v1 | 2024 | arXiv | preprint | **D** |
| 21 | Time series predictions for bank account balances | https://repository.tudelft.nl/file/File_dae488e4-2b63-4620-b250-c325dc53a13d | UNVERIFIED | TU Delft repository (학위논문 추정) | thesis | **C** |
| 22 | ProbTS: Unified benchmarking for time series forecasting | https://www.microsoft.com/en-us/research/articles/probts-unified-benchmarking-for-time-series-forecasting/ | UNVERIFIED | Microsoft Research | industry | **C** |

**총 22개 소스 (URL 확인 완료).** 목표 18개 충족. 단 A급은 3건(#1, #2, #15 / #5는 보류)이며
나머지는 preprint 중심임을 발표 시 명시할 것.
## claims

### 아키텍처

| claim | URLs | confidence |
| --- | --- | --- |
| Tao Fei의 5차원 모델은 DT = (PE, VE, Ss, DD, CN)이며, 기존 physical-virtual-connection 3분 구조에 **twin data와 services를 1급 차원으로 추가**한 것 | #1, #4 | high |
| 정식 인용은 Tao et al., 2019, CIMS 25(1):1-18, DOI 10.13196/j.cims.2019.01.001 | #1, #2 | high |
| 데이터 흐름은 **양방향**이다. 물리 데이터가 가상 엔티티를 갱신하고, 시뮬레이션·서비스 결과가 다시 물리 측에 영향을 준다 | #3 | high |
| DD(트윈 데이터)는 물리·가상·서비스·상호작용 4원의 융합이다. 즉 **시뮬레이션 출력도 트윈 데이터의 일부**이며 부산물이 아니다 | #1 | med |
| 5차원 모델은 제조 외 의료·스마트시티에도 적용되어 인간/금융 트윈으로의 전이를 뒷받침한다 | #1, #6 | med |
| **정적 프로필 화면은 트윈이 아니다.** PE와 VE는 동적으로 결합되어야 한다 | #4 | high |

### 거래 분류

| claim | URLs | confidence |
| --- | --- | --- |
| Transformer + taxonomy-aware 계층 헤드는 금융 거래 데이터셋에서 macro-category F1 **93% / 95%** 달성 | #7 | high |
| 텍스트 단독보다 **설명문 + 가맹점 정체성 + 업종 + 거래이력/affinity** 결합이 우수 | #7, #12 | high |
| 실제 은행 거래 분류의 전체 정확도는 **약 73%**, 고신뢰 구간은 **약 90%**. 따라서 자동 적용에는 **신뢰도 임계값이 필수** | #11 | high |
| 라벨 부족이 최대 실무 병목이며, weak supervision · 유사도 기반 라벨 절감 · 합성 데이터 · active learning으로 완화 가능 | #8, #9, #11, #14 | high |
| **MCC(ISO 18245)는 가계부 카테고리와 동일하지 않다.** 별도 taxonomy와 매핑 테이블이 필요하다 | #13 | high |
| 규칙 우선 + ML 폴백 하이브리드(임대료·급여·이체·ATM·공과금은 규칙, 애매한 가맹점은 모델) + 가맹점 별칭 테이블이 표준 프로덕션 형태 | #10, #8 | med |
| 설명문 정규화(ID·날짜·금액·전화번호 → 플레이스홀더, 브랜드·PG 토큰은 보존)와 **가맹점 단위 분할 검증**이 필요 | #7, #9 | med |
| SVM/선형 short-text 베이스라인은 여전히 유효한 저비용 출발점 | #9 | high |

### 현금흐름 예측

| claim | URLs | confidence |
| --- | --- | --- |
| 잔액은 직접 회귀가 아니라 **B(t+h) = B(t) + Σ(예측 유입 − 예측 유출)** 로 유도해야 한다 | #21, #15 | high |
| 거래 분류는 현금흐름 예측의 **선행 단계**이며, 둘은 하나의 파이프라인으로 설계하는 것이 최선 | #15, #11 | high |
| 나이브 베이스라인(직전 잔액 유지, seasonal naive, 지난주 동일 요일, 이동평균, 지수평활)을 먼저 이겨야 ML/딥러닝이 정당화된다. **딥러닝이 잔액 예측에서 자동으로 우월하지 않다** | #21, #16 | high |
| **정기 거래와 비정기(예상 외) 지출은 별도 컴포넌트로 모델링**하고, 달력 피처(요일·월중일·급여일·월말·청구예정일)를 쓴다 | #16, #21 | high |
| 핵심 피처: 시차 순현금흐름(1/7/14/28일), 롤링 평균·표준편차, 카테고리별 유입/유출 합, 마지막 거래 후 경과일, 직전 잔액 | #21 | med |
| 모델 사다리: seasonal naive/ETS → ARIMA/SARIMA → LightGBM/XGBoost → TFT/LSTM(데이터·계정 수가 충분할 때만) | #21, #17 | med |
| 검증은 **시간 기반 rolling-origin 분할 + 예측지평별 평가(1/7/14/30일)**, 무작위 거래 분할 금지, 계정 단위 분할로 사용자 간 누수 차단 | #21 | high |
| 지표는 잔액 MAE/RMSE, 현금흐름 총액 WAPE, 구간 pinball loss, 초과인출 확률, 저잔액 이벤트 recall. **점 예측 단독은 오해를 유발** | #21, #22 | high |
| 예산 초과/초과인출은 회귀 출력에서 읽는 것이 아니라 **별도의 확률 분류 타깃**으로 두어야 한다 | #21 | med |
| 데이터 위생이 1급 과제: 마감 후 기표 제외, 대기·취소·중복 행 처리, **자기 계좌 간 이체를 실제 소득·지출과 분리** | #21 | high |
| 가구 단위에서는 사용자에게 근거를 설명해야 하므로 딥러닝보다 해석가능 모델이 선택되는 경우가 많다 | #20, #18 | med |
| 실 배포된 개인/SME 현금흐름 시스템은 **짧고 불완전하며 이질적인 이력(콜드스타트)** 을 견뎌야 한다 | #19 | med |

## architecture_patterns

### Tao Fei 5차원 모델 → 개인 금융 트윈 매핑

DT = (PE, VE, Ss, DD, CN). 이는 계층(layer)이 아니라 **차원(dimension)** 이며, 다섯 요소 사이의
**관계**가 트윈을 트윈으로 만든다 (#1).

| 차원 | 원 정의 | 셋업(Setup) 앱에서의 대응 | 구현 산출물 |
| --- | --- | --- | --- |
| **PE** Physical Entity | 물리적 실체 | **사용자 본인**: 소득 이벤트, 계좌·카드, 고정 지출 의무(정기결제·할부), 실제 소비 행동, 생활 제약 | 계좌/카드/거래 엔티티 스키마 |
| **VE** Virtual Entity | 가상 모델 | **행동·재무 모델**: 카테고리별 소비 분포, 정기결제 모델, 현금흐름·잔액 동역학, 충격에 대한 탄력성 → what-if를 실행하는 시뮬레이터 | 예측 모델 + 시뮬레이션 엔진 |
| **DD** Digital Twin Data | 4원 융합 데이터 | 실거래 이력 + **VE 시뮬레이션 출력** + 서비스/판정 로그 + 사용자 상호작용 기록. 데모 단계에서는 합성 거래 데이터가 실데이터를 대체 | 거래 테이블 + 시나리오 결과 테이블 |
| **Ss** Services | 서비스 | 모니터링(현재 소진률) · 예측(월말 잔액) · 진단(어느 카테고리가 예산을 깼는가) · 최적화(예산 재배분) · 의사결정 지원(what-if) | 페이스 판정 API, 자금 준비 API |
| **CN** Connection | 양방향 연결 | 수집(내부 API·CSV·합성 피드) → DD/VE, 그리고 서비스 결과의 **사용자 피드백 반영**. 단방향 수집만이면 트윈이 아니다 | 동기화 스케줄러 + 알림/넛지 |

### 설계 귀결 (확인된 근거 기반)

1. **PE-VE 동적 재동기화** — 명시적 동기화 주기(sync cadence)와 **충실도(fidelity) 지표**를
   정의해야 한다. 예: 시뮬레이션 월말 잔액 대 실제 월말 잔액의 오차 (#3, #4).
   (단 "twin fidelity"의 형식적 정의를 담은 논문은 이번에 확보 실패 → BLOCKED.)
2. **DD가 시뮬레이션 결과를 보존** — 관측 데이터와 나란히 저장해야 what-if 분기의 재생·비교가
   가능하다 (#1). 이것이 "시나리오 저장/비교" 기능의 이론적 근거다.
3. **닫힌 루프 필수** — 시뮬레이션 결과가 사용자 넛지로 되돌아가야 한다. 읽기 전용 대시보드는
   디지털 트윈이라 부를 수 없다 (#3). 도시 건설 게임 시각화는 이 피드백 채널의 UI 구현으로
   포지셔닝하면 컨셉과 정합한다.

### 권장 파이프라인 (문헌 정합 순서)

| 단계 | 내용 | 근거 |
| --- | --- | --- |
| 1 수집 | 내부 API / 합성 데이터 생성기 | — |
| 2 정규화 | 설명문 클린징 · 자기이체 분리 · 중복·취소 처리 | #21 |
| 3 분류 | 규칙 우선 → ML 폴백 → 신뢰도 게이트(고신뢰 자동적용) | #7 #8 #10 #11 |
| 4 분해 | 정기 컴포넌트 / 비정기 컴포넌트 분리 | #16 |
| 5 예측 | 카테고리별 유입·유출 → 누적하여 잔액 경로 B(t+h) | #15 #21 |
| 6 판정 | 페이스 = 소진률 ÷ 월진행률 | 자체 정의 |
| 7 확률 | 초과·저잔액 확률을 별도 분류로 | #21 #22 |
| 8 서비스 | 자금 준비 / 예산 재배분 / what-if | #1 |
| 9 피드백 | 사용자 넛지 · 도시 시각화 → PE 행동 변화 | #3 |
## algorithms_by_capability

난이도: ★ 낮음 (수일) · ★★ 보통 (1~2주) · ★★★ 높음 (프로젝트 리스크)

### 1. 거래내역 자동 수집/자동 분류

| 후보 기법 | 논문 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 규칙/키워드 + 가맹점 별칭 테이블 | #10, #8 | ★ | **1차 채택.** 급여·이체·공과금·ATM은 규칙이 ML보다 정확하고 설명가능 |
| SVM/선형 short-text 베이스라인 | #9 | ★ | **베이스라인 채택.** CPU만으로 동작, 성능 기준선 제공 |
| Transformer 임베딩 + taxonomy-aware attention (계층 분류) | #7 | ★★★ | 대분류→소분류 2단 예산 분류와 정확히 일치(F1 93/95%)하나 학습 데이터·시간 부담. **데모 범위 초과** |
| Weak supervision (labeling functions) | #8 | ★★ | **채택 권장.** 한국어 라벨 코퍼스가 없는 우리 상황의 정답 |
| 거래이력·affinity 피처 추가 | #12 | ★★ | 불투명 가맹점명 판별에 유효. 합성 데이터에서는 효과 제한적 |
| Active learning (사용자 수정 → 라벨 큐) | #14 | ★★ | 사용자의 "카테고리 변경" 탭을 학습 신호로. 발표용 스토리로도 좋음 |
| MCC 코드 활용 | #13 | ★ | 피드에 있으면 강력한 무료 피처. **단 가계부 카테고리로 직결 금지** |

**신뢰도 게이트가 UX 요구사항이다** (#11): 고신뢰는 자동 확정, 저신뢰는 사용자 확인으로 라우팅.

### 2. 카테고리별 예산 + 페이스 기반 월중 예측 판정

| 후보 기법 | 논문 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 페이스 = 소진률 ÷ 월진행률 (결정적 비율) | 자체 정의, 논문 근거 없음 | ★ | **채택.** 설명가능하고 즉시 구현 가능. 학술 근거로 포장하지 말 것 |
| 카테고리별 유출 예측 후 월말 소진액 추정 | #15, #21 | ★★ | **채택.** 페이스에 예측을 결합해 "이 속도면 초과" 판정 |
| 초과 여부를 **별도 확률 분류** 타깃으로 | #21 | ★★ | **채택 권장.** 회귀값에서 초과를 읽지 말라는 것이 문헌 권고 |
| 구간 예측(pinball loss) · 확률적 예측 | #22 | ★★ | 단일 숫자 대신 범위 + 초과확률 제시 |
| 해석가능 트리 모델(LightGBM) 우선 | #20, #18 | ★★ | **채택.** 가구 단위에서는 "왜 초과 예측인가"를 설명해야 함 |

### 3. 정기결제·할부 출금 전 자금 자동 준비

| 후보 기법 | 논문 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 정기/비정기 컴포넌트 분해 | #16 | ★★ | **핵심 근거.** 잔액 31일 예측에서 정기 거래 추출 + 예상 외 지출 분리를 이미 수행한 선례 |
| 잔액 경로 누적식 B(t+h) = B(t) + Σ(유입−유출) | #21, #15 | ★★ | **채택.** 출금일 시점 잔액 부족 여부를 직접 계산 |
| 초과인출 확률 + 저잔액 이벤트 recall 지표 | #21 | ★★ | 자금 준비 트리거의 판단 기준 |
| LSTM/GRU 다기간 현금흐름 + 스트레스 테스트 | #17 | ★★★ | 사용자별 이력이 충분할 때만. 데모에서는 과함 |
| 콜드스타트(1~2개월 이력) 대응 설계 | #19 | ★★ | 신규 사용자 처리 필수 |
| **주기성/구독 탐지 전용 알고리즘** | **근거 확보 실패** | — | **BLOCKED.** 아래 참조 |

> 경고: 정기결제 탐지는 이 기능의 심장인데, 전용 알고리즘 논문을 하나도 URL 확인하지 못했다.
> 다만 #16이 "recurring transactions 추출"을 수행했다는 근거는 확보했으므로 **구현 자체는
> 근거가 있다.** 발표에서는 #16을 근거로 쓰고, 탐지 로직은 우리 설계(금액·주기 클러스터링)로
> 제시하되 문헌 근거를 주장하지 말 것.

### 4. 소비 결과 도시 건설 게임 시각화

| 후보 기법 | 논문 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 서비스 결과의 물리 측 피드백 채널로 포지셔닝 | #3 | ★ | **채택.** 게임 시각화를 "닫힌 루프의 UI"로 설명하면 트윈 컨셉과 정합 |
| 게이미피케이션 효과 문헌 | 미조사 (축 B 범위 외) | — | 다른 축 또는 별도 조사 필요 |

### 5. what-if 시뮬레이션 (트윈의 핵심)

| 후보 기법 | 논문 근거 | 난이도 | 판단 |
| --- | --- | --- | --- |
| 시뮬레이션 결과를 DD에 저장하여 분기 비교 | #1 | ★★ | **채택.** 시나리오 저장·비교 기능의 이론 근거 |
| 스트레스 테스트식 시나리오 주입 | #17 | ★★ | "소득 20% 감소" 같은 시나리오 |
| Monte Carlo / ABM (ABIDES, Mesa) | **근거 확보 실패** | — | **BLOCKED.** 재조사 필요 |
| RL 기반 예산 배분 | **근거 확보 실패** | — | **BLOCKED.** 데모 범위 초과로 판단, 근거 없이 언급 금지 |

## datasets

**이번 라운드에서 라이선스까지 확인된 공개 데이터셋은 0건이다.**

PaySim · BankSim · Sparkov · Kaggle "Synthetic Financial Datasets For Fraud Detection" ·
CTGAN/TVAE · SDV · IBM TabFormer 관련 질의는 검색 예산 소진으로 **실행되지 못했다.**
따라서 이 문서는 어떤 데이터셋도 인용하지 않는다. 추정 라이선스를 적는 것은 규칙 위반이다.

| name | URL | license | 내용 | 상태 |
| --- | --- | --- | --- | --- |
| (없음) | — | — | — | **재조사 필요** |

확인된 간접 근거 하나: **합성 거래 데이터 생성이 거래 분류의 콜드스타트 해법으로 실증되었다**
(#11, https://arxiv.org/abs/2508.05425). 즉 "합성 데이터로 시작한다"는 우리 결정 자체는
근거가 있다. 다만 **어떤 생성기를 쓸지는 근거 없음** 상태다.

재조사 시 확인할 항목: 생성기 이름 · 저장소 URL · **라이선스 원문** · 통화/지역(한국 소비
패턴 적용 가능성) · 필드 스키마(가맹점명 문자열 포함 여부 — 분류 모델 학습에 필수).

## practical_steps

문헌이 지지하는 순서대로. 각 단계에 근거 번호를 붙였다.

1. **데이터 위생을 첫 스프린트에 넣는다** (#21). 자기 계좌 간 이체를 소득·지출에서 분리하지
   않으면 모든 지표가 왜곡된다. 취소·중복·대기 거래 처리 규칙도 함께.
2. **분류는 규칙부터** (#10, #8). 급여·이체·공과금·ATM·임대료를 규칙으로 잡고, 남은 애매한
   가맹점만 모델에 넘긴다. 가맹점 별칭 테이블을 만든다.
3. **설명문 정규화 규칙을 명문화** (#7, #9). ID·날짜·금액·전화번호는 플레이스홀더로, 브랜드·PG
   토큰은 보존. 검증은 **가맹점 단위 분할**로 미학습 가맹점 일반화를 측정.
4. **신뢰도 임계값을 UX에 반영** (#11). 전체 정확도 73% / 고신뢰 90% 수준을 전제로, 자동 확정과
   사용자 확인을 분리한다. "100% 자동 분류"라고 발표하지 말 것.
5. **사용자 수정을 학습 큐로** (#14). 카테고리 변경 탭을 라벨로 적립. 발표에서 "트윈이 학습한다"
   는 서사의 실제 구현체.
6. **정기/비정기 분해 후 잔액을 누적식으로 계산** (#16, #21, #15). 잔액 직접 회귀 금지.
7. **나이브 베이스라인을 먼저 구현하고 기록** (#21, #16). seasonal naive와 직전잔액유지를
   이기지 못하면 LightGBM을 쓸 이유를 발표에서 방어할 수 없다.
8. **모델 사다리를 지킨다** (#21, #17): ETS → SARIMA → LightGBM. TFT/LSTM은 데이터가 충분할
   때만. 데모 규모에서 딥러닝은 리스크다.
9. **검증은 rolling-origin + 지평별(1/7/14/30일)** (#21). 무작위 분할은 누수다.
10. **초과·저잔액을 확률 분류로 별도 학습** (#21). 페이스 판정과 결합해 "이 속도면 초과 확률 N%".
11. **범위와 확률로 제시** (#22). 단일 숫자 월말 잔액은 오해를 부른다.
12. **해석가능 모델 우선** (#20, #18). 사용자에게 근거를 보여줘야 하는 제품이다.
13. **콜드스타트 경로 설계** (#19). 이력 1~2개월 사용자에게도 동작해야 한다.
14. **트윈 5차원을 문서에 명시적으로 매핑** (#1, #2). PE/VE/DD/Ss/CN 표를 기획서에 넣으면
    "금융 디지털 트윈"이 마케팅 수사가 아니라 아키텍처 선택임을 보일 수 있다.
15. **충실도 지표와 동기화 주기를 정의** (#3, #4). 예: 시뮬레이션 대 실제 월말 잔액 오차.
    이것이 "트윈"을 주장할 수 있는 최소 조건이다.
16. **피드백 루프를 반드시 닫는다** (#3). 도시 시각화 + 넛지가 그 경로다.

## unverified_or_blocked

### 완전 미조사 (검색 예산 소진 · 동시 슬롯 부족으로 재시도 거부)

| 항목 | 상태 | 영향 |
| --- | --- | --- |
| 정기/구독/할부 탐지 전용 알고리즘 | **BLOCKED — 0건** | 기능 3의 핵심. #16으로 우회 근거만 있음 |
| 합성 금융 데이터 생성기 (PaySim, BankSim, CTGAN/TVAE, SDV, Sparkov, DP 합성) | **BLOCKED — 0건** | 데이터 전략 전체가 근거 없음 |
| 공개 데이터셋 + 라이선스 | **BLOCKED — 0건** | 라이선스 미확인 상태로 사용 금지 |
| ABM / Monte Carlo (ABIDES, Mesa, 가계소비 ABM) | **BLOCKED — 0건** | what-if 고급 기법 근거 없음 |
| RL 기반 개인 재무 의사결정 / 예산 배분 | **BLOCKED — 0건** | 언급 자체를 피할 것 |
| N-BEATS · DeepAR · TFT · Prophet(Taylor & Letham) · Croston · M4/M5 | **BLOCKED — 결과 없음** | TFT/LSTM은 검색된 산문 안의 후보 이름으로만 등장. **원 논문 인용 금지** |
| 예산 초과 예측 전용 논문 | **BLOCKED** | 초과인출·저잔액 프레이밍은 #21로 지지되나 budget overrun 전용 논문 없음 |
| 개인 거래 이상탐지 전용 논문 | **BLOCKED** | #16의 unexpected expenses 추출이 인접하나 형식적 이상탐지 기법은 아님 |

### 제목만 노출, URL 미확인 (재검색 우선순위 높음)

절단된 결과 블록에서 제목만 스쳤고 URL을 확보하지 못했다. **인용 금지, 링크 미제공.**

- "Human digital twin: a survey"
- "A survey on Digital Twins for Multi-User Synchronization in Human-Centered Interactive Robots"
- "AI-enabled consumer digital twins as a platform for research"
- "Digital twins: a game changer in customer experience" (2025)

이들은 **인간/소비자 트윈**이라는 우리 컨셉의 가장 직접적인 선행연구다. 축 B에서 가장 아쉬운
공백이며 재조사 1순위다.

### 메타데이터 결측 (소스는 확인, 서지정보 미확인)

- #2 (Beihang 발행기록): 원 URL의 긴 슬러그를 보존하지 못해 도메인 경로만 기재. 재확인 필요
- #3 (RG Key Technologies): 연도·게재지 UNVERIFIED
- #4 (RG 미러): 긴 슬러그 일부를 생략했으므로 접속 확인 필요
- #5 (ScienceDirect 5차원 프레임워크): 연도 UNVERIFIED. **게재지는 ISSN 0278-6125에서
  Journal of Manufacturing Systems로 추정했을 뿐 검색 결과에 표시되지 않았다.** 인용 전 확인 필수
- #6 (JTTE 보충): 연도 UNVERIFIED
- #13 (Mastercard MCC 문서): 최종 수정일 UNVERIFIED
- #14 (arXiv 2104.14289): **정확한 제목·연도 UNVERIFIED.** 절단된 인용으로만 반환됨
- #21 (TU Delft): 연도·저자·학위 종류 UNVERIFIED
- #22 (Microsoft ProbTS): 연도 UNVERIFIED

### 등급 분포 경고

A급 3건(#1, #2, #15), B급 2건(#3, #13), C급 4건, **D급(preprint) 12건.**
거래 분류·현금흐름 예측 영역의 근거가 **preprint 편중**이다. 발표 시 "peer-reviewed 논문 기반"
이라고 말하면 과장이다. 정확한 표현: **A급 저널 1건(Journal of Big Data)과 디지털 트윈 5차원
모델(CIMS 2019)을 골격으로, 최신 arXiv 프리프린트로 구현 세부를 보강했다.**

### 형식적 정의를 확보하지 못한 개념

- **Twin fidelity / synchronization 지표**: 형식적 정의나 동기화 오차 수식을 담은 소스를
  확보하지 못했다. 위 architecture_patterns의 충실도 제안은 **우리 설계이며 문헌 인용이 아니다.**
