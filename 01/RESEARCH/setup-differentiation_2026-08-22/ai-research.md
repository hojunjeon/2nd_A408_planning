# 선택 방향에 필요한 AI 기술 조사

작성일: 2026-08-22 (KST)
선택 방향: 근거 제한형·시간 버전형 정책 상태 장부

이 문서는 선택 방향에 직접 필요한 기술만 조사한다. 논문에 보고된 수치는 Setup의 결과가 아니며, 실제 성능은 구현 후 별도 시험해야 한다.

## 기술 대안

| 기술 축 | 직접 근거 | Setup에서의 제한적 사용 | 실패 조건 |
|---|---|---|---|
| 레이아웃·표 추출 | [DocLLM, ACL 2024](https://aclanthology.org/2024.acl-long.463/), [PubTables-1M, CVPR 2022](https://openaccess.thecvf.com/content/CVPR2022/html/Smock_PubTables-1M_Towards_Comprehensive_Table_Extraction_From_Unstructured_Documents_CVPR_2022_paper.html) | PDF/HWP 계열 공고에서 헤더·행·각주·예외의 후보 필드와 원문 위치 추출 | 병합 셀, 각주, 스캔 품질, 표 순서가 잘못 읽히면 후보를 폐기하고 수동 확인 |
| 근거 검증·보류 | [Self-RAG, ICLR 2024](https://proceedings.iclr.cc/paper_files/paper/2024/file/25f7be9694d7b32d5cc670927b8091e1-Paper-Conference.pdf), [CaLM, Findings ACL 2024](https://aclanthology.org/2024.findings-acl.759/), [Conformal abstention](https://arxiv.org/abs/2405.01563) | AI 후보의 인용 span·조건·기준일을 원문과 대조하고 unsupported/conflict 출력을 보류 | 인용 span이 없거나 원문이 후보를 지지하지 않으면 답변하지 않음; 문헌의 벤치마크 수치를 제품 성능으로 사용하지 않음 |
| 구조화 출력 | [JSONSchemaBench arXiv](https://arxiv.org/abs/2501.10868) | AI 후보를 조건·예외·기간·근거 span 스키마로 제한한 뒤 일반 검증기로 검사 | OpenReview 원문 미러는 브라우저 검증으로 BLOCKED; 스키마 준수는 의미 정확성을 보장하지 않으므로 원문·규칙 검증을 통과해야 함 |

## 채택 결론

최소 채택 조합은 레이아웃·표 후보 추출 + 인용 검증·보류 + 구조화 출력 검사다. 버전 필터와 중복·선후 관계는 AI가 아니라 원문 버전·정책 ID·명시적 규칙으로 처리한다. 범용 대화 생성이나 자동 판정은 채택하지 않는다. AI가 중단되면 사용자가 조건·날짜·근거 위치를 직접 입력하는 구조화 양식으로 폴백한다.

## 문헌 수치의 경계

DocLLM, PubTables-1M, Self-RAG, CaLM, conformal abstention, JSONSchemaBench의 논문·연구 페이지는 기술 가능성과 연구실험을 보여줄 뿐 Setup의 정확도·승인률·시간 절감·금액 효과를 증명하지 않는다.

## 방향별 시험 질문

- 표 예외의 헤더·행·각주를 원문 span과 함께 추출하는가?
- 동일 정책의 구버전과 신버전 중 적용일에 맞는 문서만 선택하는가?
- 인용이 틀리거나 문서가 충돌할 때 확정 대신 보류하는가?
- 사용자의 소득·주소·고용 사건이 생기면 관련 정책만 다시 검토하는가?
- API·페이지·첨부가 막힌 경우 BLOCKED와 공식 연결 경로를 남기는가?
