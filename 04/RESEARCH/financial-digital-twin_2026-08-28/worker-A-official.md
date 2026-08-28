# worker-A — 공식·1차 자료 축 (Official / Primary Sources)

## axis

축 A: "디지털 트윈"을 개인 금융·소비에 적용할 때 **발표 슬라이드에 인용 가능한 1차 정의**를 확보한다.
전제(타 축 확인 사실): 국내 금융권 디지털 트윈 사례는 전부 물리·인프라 자산이고 개인 소비·자금흐름 트윈 구현 사례는 0건.
따라서 본 축의 산출물은 사례가 아니라 **용어 사용권의 근거**다.

조사 대상 프로젝트: 소비관리 앱 "셋업(Setup)" — 마이데이터형 거래내역 자동 수집·분류, 카테고리별 가상 예산 + '페이스' 예측 판정,
정기결제·할부 출금 전 결제계좌 자금 자동 준비, 소비를 도시 게임으로 시각화. 실제 금융기관 미연동(발주처 내부 API + 데모 데이터).

조사일: 2026-08-28

**핵심 결과 요약:** 발표에 바로 인용 가능한 1차 정의 **3건 확보**(Digital Twin Consortium 2건, Gartner DToC 1건).
ISO 23247-1:2021 은 표준 번호·제목·발행일·구성까지 확인했으나 정의 조항 원문은 미확보. NIST 정의는 BLOCKED.
국내 정책의 디지털 트윈 범주는 개인 금융과 **어긋남**(공간정보·국토·제조 중심). 국제금융기구 권위로는 인용 불가.

## queries_run

본인 직접 실행(web_search):
1. `ISO 23247-1:2021 Automation systems and integration Digital twin framework for manufacturing Part 1 Overview and general principles` → 확인
2. `Digital Twin Consortium official definition "virtual representation of real-world entities and processes, synchronized at a specified frequency and fidelity"` → 확인
3. `Gartner "Digital Twin of a Customer" DToC definition glossary` → 확인 (gartner.com 1차 도메인)
4. `NIST digital twin definition` → **미실행**(해당 턴 web_search 한도 도달) → BLOCKED

위임 실행(서브에이전트, 결과는 본인이 직접 검색한 것이 아님 → 아래 provenance 주의 참조):
5. 한국 정책 축: 금융위 마이데이터 2.0 추진방안 / 과기정통부·국토부 디지털 트윈 정책의 정의 범주 (약 4~6회 검색)
6. 국제금융기구 축: BIS·FSB·IMF·OECD·ECB·BoE·FCA 의 digital twin 및 synthetic data 발간물 (약 4~6회 검색)

**Provenance 주의:** 5·6번 결과는 서브에이전트가 반환한 검색 결과를 근거로 기록했다. 1차 URL 원문을 본인이 직접 열어 대조하지 않았다.
1~3번(정의 축, 즉 이 축의 핵심 산출물)은 본인이 직접 검색해 1차 도메인에서 확인했다.

## sources

| # | title | URL | date | domain | type | grade |
|---|---|---|---|---|---|---|
| 1 | ISO 23247-1:2021 — Automation systems and integration — Digital twin framework for manufacturing — Part 1: Overview and general principles | https://www.iso.org/standard/75066.html / https://www.iso.org/obp/ui/ | 2021-10-22 | iso.org | 국제표준 | A |
| 2 | ISO 23247-1:2021 공개 preview PDF (샘플) | https://cdn.standards.iteh.ai/samples/75066/ec0a1c59176e488887873acda6b7ecd9/ISO-23247-1-2021.pdf | 2021 | cdn.standards.iteh.ai | 표준 발췌본(비공식 호스팅) | B |
| 3 | Digital Twin Consortium Defines Digital Twin (최초 정의 발표) | https://www.digitaltwinconsortium.org/2020/12/digital-twin-consortium-defines-digital-twin/ | 2020-12 | digitaltwinconsortium.org | 컨소시엄 공식 정의(발행처 원문) | A |
| 4 | The Definition of a Digital Twin (현행 정의 페이지) | https://www.digitaltwinconsortium.org/initiatives/the-definition-of-a-digital-twin/ | 접근일 2026-08-28 | digitaltwinconsortium.org | 컨소시엄 공식 정의(발행처 원문) | A |
| 5 | Gartner Hype Cycle Reveals How AI and Digital Advancements Are Primed to Aid Sales Transformations (DToC 정의 포함) | https://www.gartner.com/en/newsroom/press-releases/2025-10-30-gartner-hype-cycle-reveals-how-ai-and-digital-advancements-are-primed-to-aid-sales-transformations | 2025-10-30 | gartner.com | 공식 보도자료(1차 도메인) | B |
| 6 | How Digital Twins Will Upend the Customer Experience (ThinkCast) | https://www.gartner.com/en/podcasts/thinkcast/how-digital-twins-will-upend-the-customer-experience | UNVERIFIED(연도) | gartner.com | 공식 팟캐스트 페이지 | B |
| 7 | Gartner — What Are the Capabilities of a Digital Twin of a Customer? | https://www.gartner.com/en/documents/5399263 | UNVERIFIED(연도) | gartner.com | 유료 리서치(존재만 확인, 본문 미열람) | B |
| 8 | Analysis of the New ISO 23247 Series of Standards on Digital Twin Framework for Manufacturing | https://www.nist.gov/publications/analysis-new-iso-23247-series-standards-digital-twin-framework-manufacturing | UNVERIFIED(연도) | nist.gov | 정부연구기관 발간물 | A |
| 9 | 「국민의 자산관리에 실질적 도움이 될 수 있는 마이데이터 2.0을 추진하겠습니다」(별첨: 마이데이터 2.0 추진방안) | https://www.fsc.go.kr/no010101/82061 | 2024-04-04 | fsc.go.kr | 정부 보도자료·정책방안 | B |
| 10 | 「디지털 트윈 활성화 전략」(제14차 정보통신전략위원회, 관계부처 합동) | https://www.msit.go.kr/bbs/view.do?bbsSeqNo=67&nttSeqNo=3139400&sCode=user | 2021-09-06 | msit.go.kr | 정부 전략문서 | B |
| 11 | 디지털트윈국토 (한국판뉴딜 디지털 트윈) | https://www.molit.go.kr/newdeal/sub/sub_4_1.jsp | 2020 | molit.go.kr | 정부 정책 페이지 | B |
| 12 | 「'25년, 5,800억 원 규모 공간정보 정책사업 … 트윈국토 조기실현」(제7차 국가공간정보정책 기본계획 비전 인용) | molit.go.kr/LCMS/DWN.jsp (250502 석간, 국토정보정책과) | 2025 | molit.go.kr | 정부 보도자료 | B |
| 13 | 「디지털 트윈 국토 구현을 위한 전략 및 과제」 | https://www.krihs.re.kr/boardDownload.es?bid=0008&list_no=346051&seq=2 | UNVERIFIED(연도) | krihs.re.kr | 국책연구원 보고서 | D |
| 14 | Digital twins for bridging climate data gaps: from flood hazards to firms' physical assets to banking risks (IFC Bulletin No. 63) | https://www.bis.org/ifc/publ/ifcb63_10.pdf | 2025-03-28 | bis.org | 중앙은행 기고 논문집(기관 입장 아님) | B |
| 15 | Using Synthetic Data in Financial Services (Synthetic Data Expert Group 보고서) | https://www.fca.org.uk/publications/corporate-documents/report-using-synthetic-data-financial-services | 2024-03-08 | fca.org.uk | 규제기관 발간 보고서 | B |
| 16 | Generating and using synthetic data for models in financial services: governance considerations | https://www.fca.org.uk/publications/corporate-documents/synthetic-data-models-financial-services-governance-considerations | 2025-08-19 | fca.org.uk | 규제기관 발간물 | B |
| 17 | Synthetic Data and Anti-Money Laundering – Project Report (research note) | https://www.fca.org.uk/publications/research-notes/research-note-synthetic-data-anti-money-laundering-project-report | UNVERIFIED(게시일) | fca.org.uk | 규제기관 리서치노트 | B |
| 18 | Synthetic Data Expert Group update on progress | https://www.fca.org.uk/news/news-stories/synthetic-data-expert-group-update-progress | UNVERIFIED(게시일) | fca.org.uk | 규제기관 공지 | B |

유효 소스 18건 (A 4건 / B 13건 / D 1건). 등급 E 벤더 경유 소스는 Gartner 1차 도메인 확인으로 대체되어 제거했다.

## definitions

발표 인용용. **원문(quote)** 과 **요약(paraphrase)** 을 엄격히 구분했다. paraphrase 를 따옴표로 슬라이드에 올리면 안 된다.

### D-1. Digital Twin Consortium — 최초 공식 정의 ★ 슬라이드 1순위

> "A digital twin is a virtual representation of real-world entities and processes, synchronized at a specified frequency and fidelity."

- 귀속: **Digital Twin Consortium, "Digital Twin Consortium Defines Digital Twin", 2020년 12월.**
- URL: https://www.digitaltwinconsortium.org/2020/12/digital-twin-consortium-defines-digital-twin/
- 상태: **원문 인용(quote). 발행처 자체 도메인에서 확인.** 등급 A.
- 왜 1순위인가:
  - 정의가 "physical assets"가 아니라 **"real-world entities and processes"** 다. 개인의 소비·자금흐름은 real-world **process** 다.
  - "at a **specified** frequency and fidelity" 는 **실시간을 요구하지 않는다.** 데모 데이터·배치 동기화여도 정의 위반이 아니다.

### D-2. Digital Twin Consortium — 현행 확장 문구

> "An integrated data-driven virtual representation of real-world entities and processes, with synchronized interaction at a specified frequency and fidelity."

- 귀속: Digital Twin Consortium, "The Definition of a Digital Twin"(현행 정의 페이지), 접근일 2026-08-28.
- URL: https://www.digitaltwinconsortium.org/initiatives/the-definition-of-a-digital-twin/
- 상태: 원문 인용(quote). 개정일자는 페이지에서 확인하지 못했다 → 슬라이드에는 연도 대신 "접근일" 표기, 또는 연도가 확실한 D-1 을 쓸 것.
- 추가 이점: **"integrated data-driven"** 이 명시돼 있어, 여러 거래·계좌 데이터를 통합해 만든 표현이 정의에 부합함을 보이기 좋다.

### D-3. Gartner — Digital Twin of a Customer (DToC) ★ 개념적으로 가장 결정적

> "A dynamic virtual representation of a customer that organizations can use to simulate, as well as to emulate and anticipate, behavior and/or fit."

- 귀속: **Gartner**, DToC 정의. 확인 경로는 Gartner 공식 보도자료
  "Gartner Hype Cycle Reveals How AI and Digital Advancements Are Primed to Aid Sales Transformations", **2025-10-30**.
- URL: https://www.gartner.com/en/newsroom/press-releases/2025-10-30-gartner-hype-cycle-reveals-how-ai-and-digital-advancements-are-primed-to-aid-sales-transformations
- 상태: **원문 인용(quote), gartner.com 1차 도메인에서 확인.** 등급 B(공식 보도자료).
  *(주의: 이 문구는 위 보도자료 경로로 확인했다. "Gartner glossary 에 따르면" 보다 **"Gartner"** 또는 **"Gartner 보도자료(2025-10-30)"** 로 귀속하는 것이 정확하다.)*
- **범위 보강(확인됨, paraphrase):** Gartner 용법에서 "customer"는 **개인(individual)**, 기업 고객, 페르소나, 집단, 기계까지 포함한다.
  DToC 는 온라인·물리 상호작용을 포함한 고객 데이터로 맥락을 부여하고, 가능한 경험을 시뮬레이션하며, 미래 행동을 예측한다.
- 왜 결정적인가: 정의에 **개인** 과 **행동의 시뮬레이션·예측(simulate, emulate, anticipate behavior)** 이 명시적으로 들어 있다.
  "트윈은 물리자산에만 쓰는 말"이라는 반박을 정면으로 무력화하는 유일한 근거다. 우리 **'페이스' 예측 판정**이 정확히 anticipate behavior 에 대응한다.
- **정직성 보강(확인됨, paraphrase):** Gartner 공개 자료는 DToC 개념을 **아직 초기·미성숙(emerging, immature)** 하고 가치가 use case 에 크게 좌우된다고 기술한다.
  출처: https://www.gartner.com/en/podcasts/thinkcast/how-digital-twins-will-upend-the-customer-experience
  → 발표에서 이걸 먼저 인정하면 "과장" 지적을 선제 차단할 수 있다. 아래 terminology_defense 참조.

### D-4. ISO 23247-1:2021 — 제조 디지털 트윈 프레임워크

- 정확한 표준 번호·제목: **ISO 23247-1:2021, "Automation systems and integration — Digital twin framework for manufacturing — Part 1: Overview and general principles"**, ISO.
- **발행일: 2021-10-22** (확인됨).
- URL: https://www.iso.org/standard/75066.html , https://www.iso.org/obp/ui/
- 적용 범위(확인됨): **observable manufacturing elements** — personnel, equipment, materials, processes, facilities, products.
- Part 1 의 성격(확인됨): 제조 디지털 트윈의 **용어·정의**와 **프레임워크 일반 요구사항**을 규정하는 프레임워크·용어 문서.
  특정 소프트웨어 플랫폼·데이터 모델·센서 기술·시뮬레이션 도구·구현 방법을 규정하지 않으며, 도메인별 표준·기술 사용을 허용한다.
- Part 1 이 규정하는 관계(확인됨): **물리적 제조 환경 → 데이터 수집·센싱 → 제조 요소의 디지털 표현 → 모니터링·분석·예측·최적화·제어 애플리케이션.**
  식별(identification), 데이터 교환, 통신을 통해 물리 개체와 디지털 표현을 연결하는 원칙을 다룬다.
- ISO 23247 시리즈 4부 구성(확인됨): Part 1 Overview and general principles / Part 2 Reference architecture / Part 3 Digital representation of manufacturing elements / Part 4 Information exchange.
- **중요 한계:** ISO 표준 본문은 유료·페이월이다. 본 조사는 **clause 3(용어·정의)의 정의 조항 원문을 읽지 못했다.**
  검색 요약에 나오는 설명 문구를 **표준 정의 원문으로 따옴표 인용하면 안 된다.**
  인용 가능한 것은 위의 **표준 번호·제목·발행일·적용범위·Part 1 성격·4부 구성·연결 관계**까지다.
  *(정의 조항 원문이 꼭 필요하면 공개 preview PDF 로 접근 시도 가능: https://cdn.standards.iteh.ai/samples/75066/ec0a1c59176e488887873acda6b7ecd9/ISO-23247-1-2021.pdf — 비공식 호스팅이므로 최종 인용은 ISO OBP 대조 권장.)*
- 우리 용법과의 관계: 적용 범위가 제조업이므로 **"ISO 23247 준수"는 주장 불가.**
  다만 위에서 확인된 **연결 관계 4단(물리 환경 → 데이터 수집 → 디지털 표현 → 예측·최적화 애플리케이션)** 을 아키텍처 설명 틀로 차용하는 것은 가능하고 정직하다.
  우리 대응: (실제 소비·자금흐름) → (거래내역 자동 수집·분류) → (카테고리별 가상 예산·도시 시각화) → ('페이스' 예측 판정·자금 자동 준비).

### D-5. NIST

- **정의 확보 실패(BLOCKED).** NIST 자체의 digital twin 정의는 검색 한도로 확인하지 못했다. 추측하지 않았다.
- 확인된 것: NIST 가 ISO 23247 시리즈를 분석한 발간물이 존재한다 —
  "Analysis of the New ISO 23247 Series of Standards on Digital Twin Framework for Manufacturing", nist.gov (연도 UNVERIFIED).
  URL: https://www.nist.gov/publications/analysis-new-iso-23247-series-standards-digital-twin-framework-manufacturing
- 이 발간물은 "NIST 도 ISO 23247 을 제조 맥락에서 다룬다"는 근거이지, **NIST 의 일반 정의가 아니다.** NIST 정의 문구를 슬라이드에 쓰려면 추가 조사가 필요하다.

### 정의 확보 종합

| 정의 출처 | 발표 인용 가능? | 등급 | 개인 금융 적용 근거력 |
|---|---|---|---|
| DTC 2020 (D-1) | **가능 (원문·연도 확정)** | A | 높음 — "processes" + "specified frequency" |
| DTC 현행 (D-2) | 가능 (연도 대신 접근일 표기) | A | 높음 — "integrated data-driven" |
| Gartner DToC (D-3) | **가능 (원문·일자 확정)** | B | **최고 — individual + anticipate behavior** |
| ISO 23247-1 (D-4) | 서지·범위·구조만 가능. 정의 원문 인용 불가 | A | 낮음(제조 한정) — 구조 차용용 |
| NIST (D-5) | **불가 (BLOCKED)** | — | — |

## korea_policy_category

**결론: 국내 공식 정책의 "디지털 트윈" 범주와 우리 용법은 어긋난다.** 이 어긋남을 숨기지 말고 선제적으로 정리하는 것이 안전하다.

### 국내 정책의 디지털 트윈 범주 (= 공간정보·국토·시설물·제조)

- 국토교통부 디지털트윈국토 — 검색결과에 인용된 문구: "3차원 공간정보를 기반으로 각종 데이터를 연결한, 현실과 같은 가상공간".
  구성요소는 3D 지형(수치표고모형), 영상지도(항공사진·정사영상), 3D 입체모형(건축물·시설물). *(원문 PDF/HWP 직접 대조 안 함 → 인용 시 재확인 필요)*
- 과기정통부 「디지털 트윈 활성화 전략」(2021-09-06, 관계부처 합동, 제14차 정보통신전략위원회) — paraphrase: 4대 전략·11개 추진과제.
  선도시장 대상이 **공공시설물 안전관리, 도시·국토·사회기반시설 관리, 제조·에너지·물류 실증**.
- 제7차 국가공간정보정책 기본계획 비전 — paraphrase(2025 국토부 보도자료 인용): "모든 데이터가 연결된 디지털 트윈 Korea".

→ 확인된 국내 정의·정책 어디에도 **개인 금융·소비 데이터는 포함되지 않는다.** 일관되게 물리적 자산·공간이다.

### 마이데이터 2.0 은 같은 데이터를 다루지만 프레임이 다르다

- 금융위원회 「마이데이터 2.0 추진방안」(2024-04-04) paraphrase: 이용자 범위 확대(고령층·저시력자 오프라인 가입, 14세 이상 청소년), 제공정보 확대(결제·구매내역 상세화, 공공마이데이터),
  자산관리 기능 강화(휴면예금·보험금 포함 일괄조회, 미사용 계좌 해지·잔액이전), 정보보호 강화(안심 제공 시스템, 조회·삭제 기능).
- 즉 우리와 **동일한 개인 금융데이터**를 다루면서도 프레이밍은 "전송 범위 확대 + 정보주체 통제 + 결합·분석"이고, 반환된 보도자료 요약에 **"디지털 트윈" 용어는 등장하지 않는다.**

### 정합성 판정

| 항목 | 판정 |
|---|---|
| 국내 정책 디지털 트윈 정의에 개인 금융·소비 포함? | **아니오** (확인된 범위 내) |
| 마이데이터 2.0 이 디지털 트윈 용어를 사용? | **아니오** (보도자료 요약 수준에서 부재 확인) |
| "국가 디지털 트윈 정책과 연계된 과제" 주장 가능? | **불가** — 범주 오류 |
| "디지털 트윈" 용어 자체를 개인 금융에 쓸 수 있나? | **가능** — 단 근거는 국내 정책이 아니라 DTC 정의(D-1·D-2) + Gartner DToC(D-3) 계열이다 |

실무 결론: 국내 정책 문서는 **우리 용어의 근거가 아니라, 우리가 왜 국내에서 드문 시도인지를 설명하는 배경**으로만 써라.
마이데이터 2.0 은 "디지털 트윈" 근거가 아니라 **데이터 수집 정당성·정책 타이밍** 근거로 인용하는 것이 정확하다.

## claims

| # | claim | URLs | confidence |
|---|---|---|---|
| C1 | Digital Twin Consortium 공식 정의는 대상을 "real-world entities and **processes**"로 규정하며 물리적 자산에 한정하지 않는다 | https://www.digitaltwinconsortium.org/2020/12/digital-twin-consortium-defines-digital-twin/ | **높음** (발행처 원문 문구 직접 확인) |
| C2 | 같은 정의는 동기화를 "at a **specified** frequency and fidelity"로 규정하므로 실시간 연동을 요구하지 않는다 | 위 동일 | **높음** |
| C3 | DTC 현행 정의는 "integrated data-driven" 표현을 추가한다 | https://www.digitaltwinconsortium.org/initiatives/the-definition-of-a-digital-twin/ | **높음** |
| C4 | ISO 23247-1 의 정확한 제목은 "Automation systems and integration — Digital twin framework for manufacturing — Part 1: Overview and general principles"이고 2021-10-22 발행이다 | https://www.iso.org/standard/75066.html | **높음** |
| C5 | ISO 23247 적용 대상은 observable manufacturing elements(personnel, equipment, materials, processes, facilities, products)이므로 개인 금융에 직접 적용되지 않는다 | 위 동일 | **높음** |
| C6 | ISO 23247 시리즈는 Part 1 Overview / Part 2 Reference architecture / Part 3 Digital representation / Part 4 Information exchange 4부로 구성된다 | https://cdn.standards.iteh.ai/samples/75066/ec0a1c59176e488887873acda6b7ecd9/ISO-23247-1-2021.pdf | 높음 |
| C7 | ISO 23247-1 은 물리 환경 → 데이터 수집 → 디지털 표현 → 모니터링·분석·예측·최적화·제어의 관계를 규정한다 | 위 동일 | 중간~높음 (검색 요약 기반, 조항 원문 미대조) |
| C8 | ISO 23247-1 clause 3 정의 조항 원문 문구는 본 조사에서 확보하지 못했다 | (페이월) | **높음** (한계 자체가 확인 사실) |
| C9 | Gartner 의 DToC 정의는 "A dynamic virtual representation of a customer that organizations can use to simulate, as well as to emulate and anticipate, behavior and/or fit." 이다 | https://www.gartner.com/en/newsroom/press-releases/2025-10-30-gartner-hype-cycle-reveals-how-ai-and-digital-advancements-are-primed-to-aid-sales-transformations | **높음** (gartner.com 1차 도메인 확인) |
| C10 | Gartner 용법에서 DToC 의 "customer"는 개인(individual)을 포함하며, DToC 는 미래 행동 예측에 쓰인다 | 위 동일 | **높음** |
| C11 | Gartner 공개 자료는 DToC 를 아직 초기·미성숙 개념으로 기술한다 | https://www.gartner.com/en/podcasts/thinkcast/how-digital-twins-will-upend-the-customer-experience | 중간~높음 |
| C12 | Gartner 에 DToC 역량을 다룬 별도 리서치 문서가 존재한다 | https://www.gartner.com/en/documents/5399263 | 중간 (문서 존재 확인, 본문 미열람) |
| C13 | NIST 는 ISO 23247 시리즈를 분석한 발간물을 보유하나, NIST 자체의 digital twin 정의는 미확인이다 | https://www.nist.gov/publications/analysis-new-iso-23247-series-standards-digital-twin-framework-manufacturing | 중간 (페이지 미열람, 연도 미확인) |
| C14 | 한국 정부의 디지털 트윈 정책 범주는 공간정보·국토·시설물·제조이며 개인 금융·소비를 포함하지 않는다 | https://www.msit.go.kr/bbs/view.do?bbsSeqNo=67&nttSeqNo=3139400&sCode=user , https://www.molit.go.kr/newdeal/sub/sub_4_1.jsp | 중간~높음 (위임 검색, 원문 미대조) |
| C15 | 금융위 마이데이터 2.0 추진방안은 "디지털 트윈" 용어를 프레이밍으로 쓰지 않는다 | https://www.fsc.go.kr/no010101/82061 | 중간 (보도자료 요약 수준의 부재 확인, 본문 전문 검색 미실행) |
| C16 | 국제금융기구(FSB·OECD·ECB·BoE·FCA)의 "digital twin" 공식 발간물은 확인되지 않았다 | (검색 부재) | 중간 (제한된 검색 범위 내 부재, **부재증명 아님**) |
| C17 | BIS 관련 "digital twin" 문헌은 기후 데이터 갭 한정 기고 논문 1건이며 BIS 기관 입장이 아니다 | https://www.bis.org/ifc/publ/ifcb63_10.pdf | 중간~높음 (위임 검색) |
| C18 | FCA 는 금융서비스 합성데이터 활용·거버넌스에 관한 공식 발간물을 보유한다 (2024-03-08, 2025-08-19) | https://www.fca.org.uk/publications/corporate-documents/report-using-synthetic-data-financial-services , https://www.fca.org.uk/publications/corporate-documents/synthetic-data-models-financial-services-governance-considerations | 중간~높음 (위임 검색) |
| C19 | "금융시스템의 디지털 트윈" 표현을 쓴 자료는 벤더·업계 호스팅 자료이며 국제기구 권위로 인용할 수 없다 | (Q1 검색 결과) | 중간 |

## terminology_defense

심사위원 질문 "이게 왜 디지털 트윈이냐?" 에 대한 대응.

### 인용해도 안전한 근거 (강 → 약)

**1. DTC 정의를 그대로 읽고 요소별로 매핑한다 (핵심 무기)**

> "a virtual representation of real-world entities and **processes**, synchronized at a **specified** frequency and fidelity"
> — Digital Twin Consortium, 2020

| 정의 요소 | 셋업(Setup)의 대응 |
|---|---|
| real-world **process** | 개인의 소비·자금흐름 (물리자산이 아니어도 정의에 포함됨) |
| virtual representation | 카테고리별 가상 예산 + 도시 게임 시각화 |
| **integrated data-driven** (현행 정의) | 여러 계좌·거래내역 자동 수집·분류 통합 |
| synchronized at specified **frequency** | 거래내역 수집 주기 (실시간 불필요 — 정의가 "specified"라고만 요구) |
| specified **fidelity** | 카테고리 분류 수준의 충실도를 명시적으로 선언 |

이 표 하나로 "트윈은 공장·건물에만 쓰는 말"이라는 전제를 정의 원문으로 반박할 수 있다. **entities "and processes"** 를 강조해 읽어라.

**2. Gartner DToC 로 "개인 대상 트윈"이 이미 업계 공식 범주임을 보인다 (가장 강한 한 방)**

> "A dynamic virtual representation of a customer that organizations can use to simulate, as well as to emulate and anticipate, behavior and/or fit."
> — Gartner, 2025-10-30 보도자료

Gartner 용법의 "customer"에는 **개인(individual)** 이 포함된다. 우리 **'페이스' 예측 판정**은 정의의 **anticipate behavior** 에 정확히 대응한다.
고객·개인 단위 트윈은 이미 별도 이름(DToC)을 가진 범주이므로, "개인에게 트윈을 쓰는 건 비유일 뿐"이라는 지적은 성립하지 않는다.

**3. ISO 23247 은 "구조"만 빌린다**

"제조 분야 국제표준 ISO 23247-1:2021 이 규정한 연결 구조(물리 환경 → 데이터 수집 → 디지털 표현 → 예측·최적화 애플리케이션)를 개인 재무 영역에 대응시켰다" — 정직하고 검증 가능한 표현이다.
표준 번호·제목·발행일(2021-10-22)까지는 자신 있게 말해도 된다. **정의 조항 문구는 인용하지 마라.**

**4. 데모 데이터를 FCA 합성데이터 라인으로 방어한다**

"실제 금융기관 미연동인데 트윈이라 할 수 있나" 대응. 영국 FCA 가 금융서비스 모델 개발·테스트 목적의 합성데이터 활용과 거버넌스를 공식 발간물로 다룬다(2024-03-08, 2025-08-19).
즉 **합성·데모 데이터로 모델을 검증하는 것은 규제기관도 문서화한 정상 절차**이며 트윈의 결격 사유가 아니다.

**5. 선제적 겸손: DToC 는 Gartner 스스로도 초기 단계라 한다**

Gartner 공개 자료가 DToC 를 아직 초기·미성숙하며 가치가 use case 에 좌우된다고 기술한다. 이걸 **우리가 먼저 말하면** "과장" 지적이 봉쇄되고,
동시에 "그래서 우리가 구체적 use case(소비관리)로 좁혀 구현했다"는 논리로 이어진다.

### 주장하면 위험한 것 (하지 말 것)

| 금지 주장 | 왜 위험한가 |
|---|---|
| "ISO 23247 준수/기반" | 제조 표준이고 정의 조항 원문도 미확인. 표준 준수 주장은 즉시 반박된다. |
| ISO 정의라며 문구를 따옴표 인용 | clause 3 원문을 못 읽었다. 검색 요약 문구를 표준 정의로 인용하면 최악의 실패다. |
| "Gartner **glossary** 에 따르면…" | 확인 경로는 glossary 가 아니라 2025-10-30 공식 보도자료다. 출처 표기를 "Gartner(2025-10-30 보도자료)"로 정확히 하라. |
| "국가 디지털 트윈 정책과 연계" / "정부 디지털 트윈 전략의 금융 버전" | 국내 정책 범주는 공간정보·국토·시설물·제조. 개인 금융은 없다. 범주 오류로 지적당한다. |
| "마이데이터 2.0 이 금융 디지털 트윈을 추진한다" | 해당 문서는 디지털 트윈 용어를 쓰지 않는다. |
| "BIS/FSB/IMF 가 금융 디지털 트윈을 논의 중" | 근거 없음. BIS 관련 1건은 기후 데이터 갭 한정 + IFC Bulletin 기고 논문(기관 입장 아님). |
| "국내 금융권 최초의 디지털 트윈" | 부재증명 불가 + 국내 용례와 범주가 달라 역공당한다. 대안: "개인 소비·자금흐름을 트윈으로 다룬 사례를 조사 범위에서 찾지 못했다"로 조사 한계를 함께 밝혀라. |
| "실시간 동기화되는 트윈" | 데모 데이터·미연동이라 즉시 반박된다. 정의가 "specified frequency"만 요구한다는 점을 쓰는 편이 유리하다. |
| "NIST 정의에 따르면" | **NIST 정의 미확보(BLOCKED).** 절대 인용하지 마라. |

### 권장 표현 (슬라이드 스크립트)

물리자산 트윈과 **먼저 선을 그어** 범주 지적을 선제 차단하라.

> "국내 금융권의 디지털 트윈은 데이터센터·영업점 같은 물리 자산에 적용돼 왔습니다.
> 하지만 Digital Twin Consortium 의 공식 정의는 대상을 'real-world entities **and processes**'로 규정합니다(2020).
> 저희는 그중 **process** 쪽, 즉 개인의 소비·자금흐름을 트윈의 대상으로 삼았습니다.
> 업계 용어로는 Gartner 가 정의한 **Digital Twin of a Customer** 계열이며, 그 정의에는 개인과 '행동의 예측(anticipate behavior)'이 명시돼 있습니다.
> Gartner 도 이 개념이 아직 초기라고 말합니다. 그래서 저희는 이를 소비관리라는 구체적 use case 로 좁혀 구현했습니다."

## unverified_or_blocked

| 항목 | 상태 | 사유 / 다음 조치 |
|---|---|---|
| NIST 의 digital twin 정의 문구 | **BLOCKED** | 4번째 검색이 web_search 한도로 미실행. 추측하지 않았다. → `NIST digital twin definition` 재검색 필요. 확보 전 인용 금지 |
| ISO 23247-1:2021 clause 3 정의 조항 원문 | **UNVERIFIED** | ISO 페이월. 검색 요약 문구는 표준 원문이 아님 → 인용 금지. → 공개 preview PDF 또는 ISO OBP 로 확인 가능 |
| ISO 23247-1 의 "물리환경→수집→표현→애플리케이션" 문구의 조항 위치 | UNVERIFIED | 검색 요약 기반. 구조 차용 설명으로만 사용 |
| NIST ISO 23247 분석 발간물의 발행연도 | UNVERIFIED | 페이지 미열람 |
| Gartner DToC 정의의 **glossary 원본 페이지** | UNVERIFIED | 문구·일자는 2025-10-30 보도자료로 확정했으므로 인용 가능. 단 "glossary" 표기는 금지 |
| Gartner ThinkCast·문서(5399263) 의 발행연도 | UNVERIFIED | 페이지 미열람 |
| DTC 현행 정의 페이지의 개정일자 | UNVERIFIED | 슬라이드에는 연도 확실한 2020 정의(D-1) 사용 권장 |
| 마이데이터 2.0 추진방안 **본문 전문**에 "디지털 트윈" 부재 | UNVERIFIED | 타깃 검색이 rate limit 으로 미실행. 보도자료 요약 수준의 부재만 확인 |
| 제7차 국가공간정보정책 기본계획 발행연도·원문 URL | UNVERIFIED | 2025 보도자료의 비전 인용만 확보 |
| 국토부 디지털트윈국토 정의 문구의 1차 원문 대조 | UNVERIFIED | 검색결과 인용 문구 수준. 슬라이드 인용 전 molit.go.kr 원문 확인 |
| 국토연구원 「디지털 트윈 국토 구현을 위한 전략 및 과제」 발행연도 | UNVERIFIED | 등급 D이므로 발표 인용 비권장 |
| 「국가 디지털 트윈 활성화 전략/로드맵」이라는 별도 제목 문서 | **존재 미확인** | 확인된 제목은 과기정통부 「디지털 트윈 활성화 전략」(2021-09-06)뿐. 다른 제목으로 인용하지 말 것 |
| BIS Innovation Hub 의 합성데이터/에이전트기반 시뮬레이션 프로젝트명·연도 | **BLOCKED** | 위임 검색이 rate limit 으로 미실행. 추정 제시 안 함 |
| IMF/OECD "Handbook on Measuring Digital Trade" 의 digital twin 사용 | UNVERIFIED | 검색 요약에만 등장, 원문 미확인 → 근거로 사용 금지 |
| FSB·ECB·BoE 개별 도메인 전수 검색 | **미실시** | 위 "digital twin 발간물 없음"은 제한된 검색 예산 내 결과이며 **부재증명이 아니다** |
| FCA AML 합성데이터 리서치노트 게시일 | UNVERIFIED | 요약상 2026 계열로 보이나 원문 미확인 |
| 위임 검색(한국 정책·국제금융기구) 결과의 1차 URL 직접 대조 | UNVERIFIED | 서브에이전트 검색 결과 기반. 발표 직전 URL 재확인 권장 |

