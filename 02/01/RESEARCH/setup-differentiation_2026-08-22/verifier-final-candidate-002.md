# CANDIDATE-002 최종 독립 검증

- verifier: `verifier-final-candidate-002`
- checked_at: 2026-08-22 KST
- status: **PASS**
- decision: A-01, A-03, A-04, T-07이 모두 충족된다.

## Findings by severity

### BLOCKER

- 없음.

### MAJOR

- 없음.

### MINOR

- 없음.

### 확인 근거

1. **12개 산출물과 범위**: `PLAN.md:8,35,58,79,107,122,136,155,197,214,238,261`에 요청된 1~12번 섹션이 정확히 한 번씩 있다. `PLAN.md:6,199,219-221`은 구현·실측 결과·세부 일정표를 만들지 않았고, 기간은 STARR의 제약 조건으로만 다룬다. 이는 원본 메타프롬프트 `pasted-text.txt:15,28-29,262-282,306-320`과 일치한다.
2. **직접 출처와 증거 경계**: `PLAN.md:27-33`이 공식 사실, 공개 개인 경험, 설계 추론, `UNVERIFIED`, `BLOCKED`를 정의하고, `PLAN.md:37-56,81-105,238-259`가 그 경계를 실제 주장에 적용한다. 본문에 사용한 고유 URL 32개는 모두 `PLAN.md:265-304`의 34개 직접 링크 참고문헌에 포함된다.
3. **제공자 역할**: `PLAN.md:15,56,58-77,128-134,167-175`는 온통청년·복지로·정부24·KINFA·운영기관을 경쟁자가 아니라 원문·데이터·신청·상담 제공자로 둔다. 공식 페이지도 온통청년의 검색·비교·진단·상담 역할([온통청년](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout))과 예비진단의 비법적·운영기관 최종판단 경계([주의문](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch/pop/checkStep03))를 지지한다.
4. **A-03 수리 확인**: `PLAN.md:136-153`의 AI 조사는 선택 방향에 필요한 세 축, 즉 레이아웃·표 추출, 근거 검증·보류, 스키마 구조화 출력에만 한정된다. 직접 원문은 [DocLLM](https://aclanthology.org/2024.acl-long.463/), [PubTables-1M](https://openaccess.thecvf.com/content/CVPR2022/html/Smock_PubTables-1M_Towards_Comprehensive_Table_Extraction_From_Unstructured_Documents_CVPR_2022_paper.html), [Self-RAG](https://proceedings.iclr.cc/paper_files/paper/2024/file/25f7be9694d7b32d5cc670927b8091e1-Paper-Conference.pdf), [CaLM](https://aclanthology.org/2024.findings-acl.759/), [Conformal abstention](https://arxiv.org/abs/2405.01563), [JSONSchemaBench arXiv](https://arxiv.org/abs/2501.10868)이다. `PLAN.md:148-151,163,167-175`는 버전 필터·필드 비교·중복/선후 관계·충돌/누락 처리를 명시적으로 일반 코드와 결정론적 규칙에 맡긴다. CANDIDATE-001의 불필요한 시간 RAG/GraphRAG는 남아 있지 않다.
5. **OpenReview 차단/대체**: `PLAN.md:144,253,303-304`는 [JSONSchemaBench OpenReview 미러](https://openreview.net/pdf?id=FKOaJqKoio)를 명시적으로 `BLOCKED` 처리하고 [arXiv 원문](https://arxiv.org/abs/2501.10868)을 대체 근거로 사용한다. 독립 재확인에서도 OpenReview는 브라우저 검증 페이지로 전환됐고 arXiv 원문은 열렸다.
6. **결과 비조작**: `PLAN.md:6,138,153,199,212,221,231,236,242-247`은 논문 수치나 예상 지표를 Setup의 실제 성능·승인·지원금·절감 결과로 쓰지 않는다. 시험표는 측정할 지표와 기대 동작만 정의하며 모든 관측 결과는 구현 후까지 `UNVERIFIED`다.

## Acceptance

| 항목 | 판정 | 근거 |
|---|---|---|
| A-01 | PASS | 커뮤니티, 영상/SNS, 대안 행동, 공식 제공자 출처군이 직접 URL 또는 명시적 차단 경계로 다뤄졌다 (`PLAN.md:35-77`; worker-A/B/C). |
| A-03 | PASS | 선택 방향에 필요한 AI 세 축만 남았고 각 축에 직접 출처와 실패 조건이 있다. 버전·관계 처리는 결정론적 책임으로 분리됐다 (`PLAN.md:136-175`). |
| A-04 | PASS | 12개 요청 섹션이 모두 존재하며 `UNVERIFIED/BLOCKED` 경계가 보존됐다 (`PLAN.md:8-261`). |
| T-07 | PASS | 12개 출력, 직접 링크, 명시적 미검증/차단, 결과 비조작, 구현·세부 일정 제외 조건을 모두 충족한다. |

**최종 결정: PASS.** CANDIDATE-001의 A-03 실패와 OpenReview/Bibliography 보완 항목은 CANDIDATE-002에서 해소됐다. A-05 동결·매니페스트는 이 검증의 후속 단계이며 본 판정 범위가 아니다.
