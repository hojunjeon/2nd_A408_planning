# 기획 문서 구성 벤치마크

- 기준일: 2026-08-23
- 대상: `Setup_설득력.md`와 `Setup_기술력.md`를 처음 읽는 사람이 프로젝트를 이해할 수 있도록 합친 문서
- 범위: 문서의 흐름과 구성만 조사한다. KPI, 기대효과, 마일스톤은 통합 문서의 구성에서 제외한다.

## 1. 조사 기준과 기존 문서 관례

저장소에는 조사 범위·방법, 핵심 요약, 근거 표, 솔루션, 기능, 기술 매핑, 미확인 사항, 참고문헌 순으로 정리한 `research_report.md`가 있다. 따라서 이 파일도 **주장 → 근거 링크 → 추천 구조**의 순서를 따른다.

이번 벤치마크는 원 소유자의 공식 자료만 사용했다.

| 출처 | 확인한 원칙 | 문서에 적용할 부분 |
|---|---|---|
| [Atlassian PRD 템플릿](https://www.atlassian.com/software/confluence/templates/product-requirements), [작성 가이드](https://confluence.atlassian.com/doc/blog/2015/08/how-to-document-product-requirements-in-confluence), [공식 템플릿 PDF](https://www.atlassian.com/dam/jcr%3Ac1c5b270-7d89-443a-82ae-7085c7cbbd33/Product%20Requirement.pdf) | PRD는 제품·기능의 목적, 기능, 동작을 정의하고 사용자 스토리, 가정, UX 자료, 질문·결정 사항, 범위 밖을 한곳에 모아 팀의 공통 이해를 만든다. | 문제와 사용자 맥락, 핵심 흐름, 기능 표, 기술·검증 경계, 위험·미확인 사항을 연결한다. |
| [GOV.UK 사용자 요구 파악](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs), [서비스를 단순하게 만들기](https://www.gov.uk/service-manual/service-standard/point-4-make-the-service-simple-to-use), [정부 디자인 원칙](https://www.gov.uk/guidance/government-design-principles) | 사용자 목표·현재 행동·불편을 먼저 파악하고, 문제 중심의 사용자 요구를 작성한 뒤 실제 사용자로 검증한다. 서비스는 처음부터 끝까지 단순하고 일관되어야 한다. | 첫 부분에서 대상 사용자와 상황을 설명하고, 기능을 사용자의 행동과 결과로 서술한다. |
| [Nielsen Norman Group: 존재하지 않는 제품의 사용자 조사](https://www.nngroup.com/videos/user-research-non-existent-products/), [Lean UX & Agile 용어집](https://media.nngroup.com/media/articles/attachments/NNg_Lean_UX_%26_Agile_Glossary.pdf) | 제품이 아직 없어도 관찰·조사로 사용자 요구를 확인할 수 있다. 사용자 관점의 명확한 완료 기준과 이른·반복 검증이 오해를 줄인다. | 기술 선택에는 구현 가능성만 쓰지 않고, 무엇을 어떤 증거로 확인했는지와 남은 검증 경계를 함께 적는다. |

Atlassian 템플릿에는 성공 지표와 출시일 항목도 있지만, 이번 요청의 범위와 맞지 않으므로 통합 문서에는 넣지 않는다. 이는 해당 항목이 불필요하다는 뜻이 아니라 이번 문서의 목적이 **프로젝트 이해**로 한정되기 때문이다. ([Atlassian PRD 템플릿](https://www.atlassian.com/software/confluence/templates/product-requirements))

## 2. 벤치마크에서 얻은 문서 흐름

처음 보는 독자는 기술이나 기능 목록보다 “누가 어떤 상황에서 무엇을 해결하려고 하며, 앱이 어떻게 돕는가”를 먼저 알아야 한다. 공식 가이드의 공통 흐름을 Setup에 맞게 줄이면 다음과 같다.

```text
사용자·상황과 문제
        ↓
제품 한 문장과 해결 방식
        ↓
사용자 행동 → 앱 처리 → 사용자 결과
        ↓
핵심 기능과 기능별 이유
        ↓
기술 선택·구현 가능성·검증 방법
        ↓
위험·가정·UNVERIFIED/BLOCKED 경계
```

이 순서는 GOV.UK의 “사용자 요구에서 시작” 원칙, Atlassian의 “목표와 사용자 스토리에서 요구사항으로 이동”하는 PRD 흐름, NN/g의 문제·목표 합의와 반복 검증 원칙을 합친 것이다. ([GOV.UK 사용자 요구 파악](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs), [Atlassian 작성 가이드](https://confluence.atlassian.com/doc/blog/2015/08/how-to-document-product-requirements-in-confluence), [NN/g 사용자 조사](https://www.nngroup.com/videos/user-research-non-existent-products/))

## 3. Setup 통합 문서에 추천하는 최소 구조

### 1) 프로젝트 한눈에 보기

첫 문장은 다음 세 요소를 포함한다.

> Setup은 **[대상 사용자]**가 **[상황에서 겪는 문제]**를 해결하도록 **[핵심 해결 방식]**을 제공하는 금융 내비게이션이다.

바로 아래에 `사용자 행동 → 앱 처리 → 결과`를 3~5단계로 보여준다. 예를 들어 신청 전·수혜 중·지출 후·미래 계획을 하나의 시간축으로 배치한다. 긴 배경 설명보다 사용자가 무엇을 하고 무엇을 받는지 먼저 보여주면 문서 전체의 기준점이 생긴다. 사용자의 목표와 현재 행동을 먼저 설명하라는 GOV.UK 원칙에 따른 구성이다. ([GOV.UK 사용자 요구 파악](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs))

### 2) 문제와 사용자 맥락

| 항목 | 적을 내용 |
|---|---|
| 대상 사용자 | 대학생·취준생·사회초년생 등 현재 문서에서 정의한 범위 |
| 상황 | 정책 신청 전, 수혜 중 소득 변화, 지출 후 비용 판단 등 실제 의사결정 시점 |
| 문제 | 정보가 흩어져 있거나, 사용자가 직접 계산·비교해야 하는 구체적 불편 |
| 근거 | 조사 수치·공식 문서·사용자 조사 등 출처와 검증 수준 |
| 요구 | “무엇을 하고 싶다 → 그래서 무엇을 알고 싶다” 형식의 사용자 요구 |

문제마다 기능을 억지로 붙이지 말고, 이 문서에서 실제로 다루는 문제만 남긴다. 사용자 요구는 가능한 해결책이 아니라 사용자가 달성하려는 결과로 쓴다. ([GOV.UK 사용자 요구 작성·검증](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs))

### 3) 제품 정의와 핵심 흐름

제품이 문제를 어떤 방식으로 해결하는지 한 문단으로 설명한 뒤, 아래 표로 핵심 흐름을 고정한다.

| 단계 | 사용자가 하는 일 | 시스템이 하는 일 | 사용자에게 보이는 결과 |
|---|---|---|---|
| 입력 | 프로필·소득·지출·할부 조건 등을 입력 | 입력을 표준 형식으로 정리 | 입력값과 누락값 확인 |
| 판단 | 비교할 정책·시나리오를 선택 | 규칙·계산식으로 조건과 비용 비교 | 근거가 붙은 비교 결과 |
| 이해 | 결과와 차이를 확인 | 구조화된 결과를 쉬운 문장으로 설명 | 무엇이 확정이고 무엇이 가정인지 구분 |
| 행동 | 신청·저축·상환 등 다음 행동 선택 | 실행 조건과 주의사항을 표시 | 사용자가 선택한 계획 |

제품 흐름은 기능 목록의 나열이 아니라 사용자가 목표를 달성하는 순서여야 한다. 서비스의 시작부터 끝까지 일관된 경험을 설계하라는 GOV.UK 원칙과, 요구사항에 사용자 스토리를 연결하라는 Atlassian 방식을 반영한다. ([GOV.UK 서비스 단순성](https://www.gov.uk/service-manual/service-standard/point-4-make-the-service-simple-to-use), [Atlassian 작성 가이드](https://confluence.atlassian.com/doc/blog/2015/08/how-to-document-product-requirements-in-confluence))

### 4) 핵심 기능

기능은 현재 두 문서에 있는 내용에서만 추리고, 각 기능을 아래처럼 한 행으로 설명한다.

| 기능 | 해결하는 사용자 문제 | 동작 | 결과·근거 |
|---|---|---|---|
| 기능명 | 왜 필요한가 | 사용자가 무엇을 입력·선택하고 시스템이 무엇을 처리하는가 | 사용자가 무엇을 확인하는가, 어떤 출처·계산식인가 |

기능을 설명할 때 기술 이름을 먼저 쓰지 않는다. 기능의 사용자 가치와 동작을 먼저 적고, 기술 선택은 다음 장에서 기능과 연결한다. Atlassian 공식 템플릿이 사용자 스토리와 요구사항을 함께 기록하는 이유도 개발·디자인이 같은 동작을 이해하도록 하기 위해서다. ([Atlassian PRD 템플릿](https://www.atlassian.com/software/confluence/templates/product-requirements), [Atlassian 작성 가이드](https://confluence.atlassian.com/doc/blog/2015/08/how-to-document-product-requirements-in-confluence))

### 5) 기술적 구현 가능성과 검증 경계

기술 문서는 별도 설계 문서처럼 확장하지 않고, 기능과 1:1로 이어지는 표만 둔다.

| 기능 | 선택 기술 | 선택 이유 | 구현 가능성 | 검증 방법·현재 상태 |
|---|---|---|---|---|
| 기능명 | 기술 또는 규칙 | 기능의 입력·출력에 왜 적합한가 | 범위 안에서 가능한가, 주요 난점은 무엇인가 | 작은 PoC, 공식 명세 확인, 테스트 데이터 등; `검증 완료`/`검증 예정`/`UNVERIFIED` |

금액·자격·정책 조건처럼 결과가 재현되어야 하는 부분과 설명을 돕는 AI 부분의 역할을 분리한다. 아직 확인하지 못한 API, 정책 조항, 계산식, 실제 데이터는 설계 사실처럼 쓰지 않고 `UNVERIFIED`로 표시한다. NN/g가 말하는 사용자 관점의 완료 기준을 기술 검증에도 적용해 “무엇이 동작하면 충분한가”를 한 줄로 적는다. ([NN/g Lean UX & Agile 용어집](https://media.nngroup.com/media/articles/attachments/NNg_Lean_UX_%26_Agile_Glossary.pdf))

### 6) 위험·가정·미확인 사항

마지막에는 새 기능을 추가하지 않고 현재 문서의 불확실성을 요약한다.

| 상태 | 의미 | 예시 |
|---|---|---|
| `UNVERIFIED` | 근거·명세·실행 결과를 아직 확인하지 못함 | 정책 원문, 카드사 계산식, API 필드 |
| `검증 예정` | 검증 방법은 정했지만 결과가 없음 | PoC, 실제 데이터 테스트 |
| `BLOCKED` | 외부 권한·자료 부족으로 현재 진행 불가 | 접근 권한이 필요한 운영 연동 |
| `범위 밖` | 이번 제품 설명에 포함하지 않음 | KPI, 기대효과, 마일스톤 및 명시하지 않은 확장 기능 |

각 항목은 “위험/가정 → 영향 → 확인 방법”의 짧은 형식으로 쓴다. Atlassian은 PRD에서 해결되지 않은 질문과 범위 밖 항목을 명시하라고 안내하며, GOV.UK와 NN/g는 조사·검증을 반복해 요구를 확인하도록 한다. ([Atlassian 작성 가이드](https://confluence.atlassian.com/doc/blog/2015/08/how-to-document-product-requirements-in-confluence), [GOV.UK 사용자 요구 검증](https://www.gov.uk/service-manual/user-research/start-by-learning-user-needs), [NN/g 사용자 조사](https://www.nngroup.com/videos/user-research-non-existent-products/))

## 4. 작성 시 유지할 기준

1. **한 문단 한 주장:** 수치·사례·기술 선택에는 바로 출처를 붙인다.
2. **문제에서 기능으로 추적:** 모든 핵심 기능은 해결하려는 사용자 문제와 연결한다.
3. **사용자 언어 우선:** “사용자가 무엇을 하고 무엇을 얻는가”를 먼저 쓰고 기술 용어는 뒤에 둔다.
4. **결정과 설명 분리:** 규칙·계산식이 판정하고 AI는 이미 구조화된 결과를 분류하거나 설명하는 등 역할 경계를 적는다.
5. **검증 수준 보존:** 문서상 설계, 실행한 PoC, 공식 원문 확인을 같은 사실처럼 섞지 않는다.
6. **정보량 제한:** 프로젝트 이해에 직접 필요한 기능·기술·위험만 남기고, 로드맵·성과 지표·기대효과는 넣지 않는다.

이 기준은 GOV.UK의 사용자 중심·단순성 원칙, Atlassian의 공유된 요구사항 문서, NN/g의 사용자 조사와 반복 검증 원칙을 Setup의 현재 범위에 맞게 축약한 것이다. ([GOV.UK 디자인 원칙](https://www.gov.uk/guidance/government-design-principles), [Atlassian PRD 템플릿](https://www.atlassian.com/software/confluence/templates/product-requirements), [NN/g Lean UX & Agile 용어집](https://media.nngroup.com/media/articles/attachments/NNg_Lean_UX_%26_Agile_Glossary.pdf))
