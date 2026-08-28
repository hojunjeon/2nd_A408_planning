# CANDIDATE-003 히어로 AI 기술 조사

작성일: 2026-08-22 (KST)

## 핵심 방향

Setup의 히어로 AI는 정책을 요약하는 챗봇이 아니라 **PolicyOS: 자연어 공고를 실행 가능한 정책 프로그램으로 컴파일하고, 사용자의 미래 상태를 가상 실행하며, 다른 AI가 결과를 공격적으로 감사하는 시스템**이다.

## 왜 기존 방식으로는 부족한가

| 기존 방식 | 남는 문제 | CANDIDATE-003의 전환 |
|---|---|---|
| 키워드·벡터 RAG | 비슷한 문장만 찾아 표·예외·기간·참조 관계를 실행하지 못함 | 문서를 Policy IR로 컴파일하고 실행·검증 |
| 사람이 만든 규칙 카드 | 정책이 바뀔 때 수작업 갱신, 새로운 표현·표 구조에 취약 | AI가 변경 후보를 만들고 버전·근거·테스트를 함께 제출 |
| 현재 자격 조회 | “지금”만 보여주고 취업·이사·소득 변화의 결과를 설명하지 못함 | 개인 정책 디지털 트윈의 반사실 시나리오 실행 |
| 단일 LLM 답변 | 그럴듯한 인용·누락·과신을 스스로 잡기 어려움 | 컴파일러·반대심문·근거 감사·결정론적 실행을 분리 |

## 직접 근거

| 기술 주장 | 출처 | Setup 적용 |
|---|---|---|
| 자연어 정책을 기계가 실행할 수 있는 규칙으로 바꾸는 Rules-as-Code 실험 | [AI-Powered Rules as Code: Public Benefits Policy](https://digitalgovernmenthub.org/publications/ai-powered-rules-as-code-experiments-with-public-benefits-policy/) | 정책 공고를 규칙 후보로 컴파일하는 문제 자체가 공공급여 영역에서 연구·실험되고 있음을 근거로 삼음. Setup 성능으로 전용하지 않음 |
| LLM이 정책을 정규화된 실행 규칙으로 변환하는 P2T | [Executable Governance for AI](https://arxiv.org/abs/2512.04408) | Policy IR 후보 생성·정책 테스트 생성의 설계 참고. 사전 공개 연구이며 결과 수치는 사용하지 않음 |
| 자연어 요구를 검증 가능한 명세 후보로 만들고 symbolic verifier가 거부·수정하는 구조 | [AutoSpec+, ACL 2026 Demo](https://aclanthology.org/2026.acl-demo.66/) | AI 후보와 결정론적 검증기를 분리하는 근거 |
| 프로그램 의미론·계획 언어는 문법적으로 맞아도 의미가 틀릴 수 있음 | [FormalBench, ACL 2025](https://aclanthology.org/2025.acl-long.1068/), [Planetarium, NAACL 2025](https://aclanthology.org/2025.naacl-long.560/) | “JSON이 만들어졌다”를 성공으로 보지 않고 정책 테스트·반례·실행 결과까지 요구 |
| 표·레이아웃이 중요한 문서를 구조적으로 읽는 모델 | [DocLLM, ACL 2024](https://aclanthology.org/2024.acl-long.463/), [PubTables-1M, CVPR 2022](https://openaccess.thecvf.com/content/CVPR2022/html/Smock_PubTables-1M_Towards_Comprehensive_Table_Extraction_From_Unstructured_Documents_CVPR_2022_paper.html) | 공고 표·각주·행/열을 Policy IR 후보의 원문 span으로 보존 |
| 문서 버전과 변화 자체를 retrieval 대상에 포함 | [VersionRAG](https://arxiv.org/abs/2510.08109), [DyG-RAG](https://arxiv.org/abs/2507.13396) | 현재 문서만 찾지 않고 특정 기준일의 정책 상태와 변경된 사용자 시나리오를 다시 계산 |
| 여러 LLM이 제안·반박·합의하는 검증 | [Multiagent Debate, ICML 2024](https://proceedings.mlr.press/v235/du24e.html) | 컴파일러가 낸 규칙·시나리오를 공격하는 감사 에이전트 설계 참고 |
| 구조화 출력의 형식 준수와 의미 품질을 분리 | [JSONSchemaBench](https://arxiv.org/abs/2501.10868) | Policy IR의 스키마 오류를 먼저 막되, 의미 검증은 별도 실행·반례 시험으로 수행 |

## 채택하는 기술과 채택하지 않는 기술

| 채택 | 이유 | 금지선 |
|---|---|---|
| Policy IR 후보 생성 | AI가 이질적인 공고 표현·표·참조를 사람이 승인 가능한 구조로 바꾸는 핵심 병목 | AI 출력 자체를 자격 판정으로 사용하지 않음 |
| 정책 테스트 자동 생성 | 각 규칙에서 경계값·예외·상충·누락 프로필 테스트를 만들 수 있음 | 생성된 테스트가 실제 정답이라는 보장 없음 |
| 반사실 시나리오 에이전트 | 사용자의 “취업하면/이사하면/소득이 바뀌면” 질문을 이벤트 그래프로 변환 | 미래의 승인·금액을 예언하지 않음 |
| 적대적 감사 에이전트 | 누락된 예외·오래된 근거·상충 조항을 일부러 찾음 | 논쟁에서 이긴 답을 사실로 채택하지 않음 |
| 버전·시간 인덱스 | 정책 문서가 바뀌는 문제를 제품의 핵심 난제로 승격 | 날짜가 없으면 최신으로 추정하지 않음 |
| 범용 챗봇·무근거 RAG·자동 신청 | 차별화가 아니며 고위험 | 기본 흐름에서 제외 |

## 7주 제약에서의 세로 슬라이스

전체 정책 세계를 만들지 않고, 공개 원문 3~5개와 2개 지역, 합성 사용자 프로필로 Policy IR → 시나리오 실행 → 적대적 감사 → 결정 패킷까지 연결한다. 이는 일정표가 아니라 “히어로 AI가 실제로 증명 가능한 최소 문제 크기”다.
