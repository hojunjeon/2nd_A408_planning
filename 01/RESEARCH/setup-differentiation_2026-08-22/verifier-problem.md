# A-02 독립 검증 — Setup 문제 정의

- ticket: T-04 / A-02
- verifier: verifier-problem
- checked_at: 2026-08-22 KST
- overall_status: PASS
- scope: `problem-synthesis.md`의 P-01/P-02와 그 근거 URL만 검증했다. PLAN.md와 worker 파일은 수정하지 않았다.

## 판정 기준

문제는 (1) 공개 사용자 발화가 실제 URL에서 확인되고, (2) 개인 사례를 발생률·성공률·전체 청년의 사실로 일반화하지 않으며, (3) 온통청년·복지로·정부24·토스·뱅크샐러드를 경쟁자로 부르지 않고 연결·데이터·상담 제공자로 다루며, (4) 기능명이나 기술명이 아닌 사용자의 결정 순간으로 서술될 때 `PASS`로 판정했다.

## 문제별 판정

| 대상 | status | 독립 확인 | 근거 |
|---|---|---|---|
| P-01 신청 전 자격·중복·순서 결정 | PASS | 실제 공개 사용자 글에서 직전연도 소득/알바 질문, 부모·원가구 소득 경고, 기존 계좌 해지 순서 경고를 각각 확인했다. 문제는 “찾고 비교하고 순서를 정하는 순간”으로 쓰였고, 탈락률·손실액은 만들지 않았다. | [A-01](https://gall.dcinside.com/board/view/?id=outofwork&no=728055&page=1), [A-02](https://gall.dcinside.com/mgallery/board/view/?id=singlebungle1472&no=2375811), [A-06](https://gall.dcinside.com/board/view/?id=dcbest&no=426928); synthesis.md:21-42 |
| P-02 상태 변화 후 유지·중단·복구 결정 | PASS | 공개 개인 후기에 탈락→이의신청→대체 제도 탐색의 순서가 실제로 보이고, 공식 방송에는 소득 발생 시점/반영 시차와 이의신청 운영이 확인된다. 문제는 “변화 후 무엇을 신고·보완·재신청할지 정하는 순간”으로 쓰였다. | [B-06](https://2b-continued.tistory.com/38), [B-12](https://www.ktv.go.kr/content/view?content_id=752914), synthesis.md:44-65 |
| 공개 사용자 근거 존재 | PASS | 최소한 A-01, A-02, A-04, A-05, A-06, B-06은 공개 URL을 직접 열어 본문과 작성 시점/개인 발화를 확인했다. 사례는 질적 신호로만 사용한다. | 아래 “공개 URL 점검” |
| 일화의 일반화 방지 | PASS | synthesis는 “자기선택 표본”, “반복 신호”, “전체 빈도·효과 UNVERIFIED”, 실제 탈락·환수·손실액 미측정을 명시한다. `많다`, 발생률, 성공률, 절감액을 근거 없이 확정하지 않았다. | synthesis.md:8-18, 39-42, 62-65, 77-82; worker-A.md:60-63; worker-B.md:57 |
| 제공자 역할·경쟁자 분리 | PASS | 온통청년·복지로·정부24·토스·뱅크샐러드를 경쟁 서비스로 쓰지 않고 정책/복지/공공서비스/금융 데이터·신청·연동·상담의 연결원으로 명시한다. | synthesis.md:8-10, 67-75; worker-C.md:11-13, 37-42 |
| 문제 진술의 비기능·비기술성 | PASS | P-01은 신청 전 비교·중복·순서, P-02는 상태 변화 후 유지·중단·복구라는 user moment다. 제목과 `누가/언제/무엇을 하려 했고/어디서 실패하고/무엇을 잃는가` 구조가 기능명·AI/RAG 명칭으로 문제를 대체하지 않는다. | synthesis.md:21-65, 75 |

## 공개 URL 점검

| URL / 용도 | status | 확인 결과 |
|---|---|---|
| [A-01 DCInside](https://gall.dcinside.com/board/view/?id=outofwork&no=728055&page=1) | PASS | 공개 본문에서 주말 알바·작년 소득·소득 조건 혼란 발화 확인. |
| [A-02 DCInside](https://gall.dcinside.com/mgallery/board/view/?id=singlebungle1472&no=2375811) | PASS | 공개 본문에서 부모 소득 때문에 탈락할 수 있다는 경고와 복지로 신청 경로 확인. |
| [A-04 TheQoo](https://theqoo.net/ktalk/4287185827?category=1947874&l=jp&m=1&order_type=desc&sort_index=title) | UNVERIFIED | 공개 본문과 동의 주저 발화는 확인했지만 게시일에 연도가 없어 2026년 사례라는 시간 정보는 확정하지 않는다. |
| [A-05 DCInside](https://gall.dcinside.com/board/view/?id=jungsopd&no=1762761&page=1) | PASS | 공개 본문에서 부모 동의 기한, 반복 대기, 비스마트폰 가족의 어려움 확인. 정책 전체의 처리시간으로 일반화하지 않는다. |
| [A-06 DCInside](https://gall.dcinside.com/board/view/?id=dcbest&no=426928) | PASS | 공개 본문에서 기존 계좌를 먼저 해지하지 말라는 순서 경고와 전환 절차 확인. 실제 금전 손실 결과는 확정하지 않는다. |
| [A-03 TheQoo](https://theqoo.net/square/4310681320) | BLOCKED | 현재 직접 열람이 `Internal Error`로 실패했다. A-01/A-02/A-06 등 접근 가능한 사례가 있어 P-01 판정의 단독 근거로 사용하지 않았다. |
| [B-06 개인 후기](https://2b-continued.tistory.com/38) | PASS | 공개 본문에서 청년수당 탈락, 이의신청, 대체 제도 탐색의 1인 경험 확인. 탈락률·일반 빈도는 확인하지 않는다. |
| [B-12 KTV](https://www.ktv.go.kr/content/view?content_id=752914) | PASS | 공식 본문에서 소득 발생/건보료 반영 시차와 소득 변동에 대한 이의신청 설명 확인. 청년 전용 사례로 확대하지 않는다. |
| [B-09 X](https://x.com/Sieg_tlrmsla/status/2026798397609722134), [B-10 X](https://x.com/rmfoekwnrwl/status/2026467024650776652) | BLOCKED | 공개 URL은 존재하지만 현재 직접 본문이 0-line/오류로 렌더링됐다. P-01/P-02의 핵심 판정에서 제외했다. |
| [ALT-02 링커리어](https://community.linkareer.com/employment_data/5633835) | PASS | 공개 글에서 중앙/서울 사업 비교표, 복지로 자가진단·신청 흐름을 확인했다. 조회수는 행동률로 사용하지 않는다. |

| 공식 원문 | status | 확인 결과 |
|---|---|---|
| [온통청년 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout) | PASS | 정책 검색·비교·신청자격 진단·상담·연계를 직접 확인했다. 따라서 경쟁 서비스가 아닌 공공 연결원으로 분류한다. |
| [복지로 소개](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/intro/intro/info/01/index.html) | PASS | 서비스 찾기, 모의계산, 복지 자격·지급·신청현황 기능을 직접 확인했다. |
| [정부24 메인](https://www.gov.kr/portal/main) | PASS | 공개 URL이 `plus.gov.kr`로 리디렉션되는 운영 상태를 확인했다. |
| [서울시 신청 안내 PDF](https://soco.seoul.go.kr/coHouse/cmmn/file/fileDown.do?atchFileId=fba10a7affd347f189b4232d78f807fa&fileSn=3) | PASS | 공개 PDF(11쪽)와 첨부·가구·기존 수혜 제한 문구를 확인했다. |
| [복지로 청년월세 상세](https://www.bokjiro.go.kr/ssis-tbu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661&wlfareInfoReldBztpCd=01) | PASS | 동일 사업의 [공식 모바일 결과](https://m.bokjiro.go.kr/ssis-tem/ssis-tem/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661)와 검색 노출에서 중지 후 재신청·잔여횟수 규칙을 확인했다. |
| 위 복지로 데스크톱 상세의 정적 본문 fetch | BLOCKED | 원 URL은 현재 정적 열람 결과가 0-line이다. 운영 규칙은 공식 모바일/검색 결과로 확인했으나 실행 전 최신 원문을 다시 확인해야 한다. |
| [금융위원회 MyData 안내](https://www.fsc.go.kr/no010101/77182?curPage=124&srchBeginDt=&srchCtgry=&srchEndDt=%2F1000&srchKey=&srchText=) | PASS | API 방식·스크래핑 금지·동의/보안/정보제공자 연결 전제를 직접 확인했다. 토스·뱅크샐러드는 공식 문서에서 MyData 사업자로 열거될 뿐 경쟁자로 판정하지 않는다. |

## 남은 경계

- `UNVERIFIED`: 공개 사례만으로 청년 전체의 빈도, 신청 성공률, 실제 지원금 손실·환수액, P-01/P-02의 시간 절감 효과를 산출할 수 없다.
- `UNVERIFIED`: synthesis의 “단일 검색·벡터 RAG가 표 예외·상충 공고·변경 시점을 놓칠 수 있다”는 문장은 일반 설계 위험 추론이며, 이 조사에서 재현 실험한 결과가 아니다.
- `BLOCKED`: 일부 TheQoo/X 원문과 복지로 데스크톱 상세의 현재 정적 fetch. 최신 공고와 운영기관 판단이 우선이며, 해당 근거가 없으면 `UNVERIFIED` 또는 `BLOCKED`로 보류해야 한다.

## 결론

`overall_status: PASS`. P-01과 P-02 모두 공개 사례·공식 원문·사용자 결정 순간을 분리해 정의했고, 제공자 경쟁자 오인·일화의 prevalence 일반화·기능/기술명 문제 정의를 확인하지 못했다. 위 `UNVERIFIED`/`BLOCKED` 경계는 다음 설계·검증 단계에서 그대로 보존한다.
