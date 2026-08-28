# Setup 차별화·AI 고도화·면접 STARR 설계 결과

작성일: 2026-08-22 (KST)  
상태: CANDIDATE-003, 최종 독립 검증 PASS, SHA-256 동결 예정

이 문서는 요청된 셋업 메타프롬프트를 실행한 조사·문제 정의·방향 비교·AI 조사·검증 설계 결과다. 구현, 실제 계정 연결, 외부 제출, 세부 일정표는 포함하지 않는다. 실제 성능·승인·지급·금액·절감 결과는 아직 존재하지 않으므로 UNVERIFIED로 남긴다.

### 보완 판정: “안전한 정책 장부”에서 “실행 가능한 정책 AI”로

기존 CANDIDATE-002는 출처·보류·개인정보 경계는 강했지만, AI가 문서를 추출하고 규칙 코드가 판단하는 수준이라 면접에서 기술적 한 방이 약했다. CANDIDATE-003은 다음을 히어로 AI로 승격한다.

| 기존 약점 | 보완 방향 |
|---|---|
| 정책을 요약·검색하는 앱처럼 보임 | 공고문을 실행 가능한 Policy IR로 컴파일 |
| 현재 자격만 보여줌 | 취업·이사·소득 변화의 반사실 시나리오를 개인 정책 디지털 트윈으로 실행 |
| 단일 모델이 답을 생성함 | 컴파일러·시나리오 에이전트·적대적 감사 에이전트가 서로 공격하고 결정론적 런타임이 거부 |
| 규칙을 추가했다는 수준의 STARR | AI가 만든 정책 프로그램이 의미적으로 틀린 실패를 재현하고, symbolic verifier와 반례 생성으로 뒤집는 서사 |

히어로 문장: **“Setup은 정책 공고를 읽어주는 챗봇이 아니라, 정책을 실행 가능한 프로그램으로 컴파일하고 사용자의 미래 상태를 가상 실행한 뒤 다른 AI가 그 결과를 공격적으로 감사하는 PolicyOS다.”**

아래 기존 6~10번은 CANDIDATE-002의 안전한 기준선으로 보존한다. 최종 차별화·AI·시스템·시험·STARR 판단은 문서 끝의 **CANDIDATE-003 보완 설계**를 우선한다.

## 1. 범위와 조사 방법

### 범위

- 대상: 대학생, 취업준비생, 비정기 소득 알바생, 사회초년생 등 한국 청년.
- 핵심 순간: 정책·월세·취업지원·정책형 금융상품을 신청하기 전의 자격·중복·순서 결정, 신청 후 소득·주소·가구·계약·반려 변화에 따른 유지·중단·복구·이의신청 결정.
- 조사 대상: 공개 커뮤니티·포럼, 공개 영상·SNS, 사용자가 실제로 취하는 대안 행동, 공식 정책·복지·금융 제공자·공공 API와 제약, 선택 방향에 필요한 AI 기술.
- 제외: 온통청년·복지로·정부24·토스·뱅크샐러드를 경쟁사로 취급하지 않음. 이들은 정책 원문·데이터·신청·연결·상담 제공자다. SMS 원문 자동수집, 금융 로그인·스크래핑, MyData 실계좌 연결, 자동 신청·해지·자격 확정은 기본 범위에서 제외한다.

### 실행 순서와 판정 규칙

1. 현재 기획서의 기능 가설과 미검증 수치를 분리했다.
2. 최대 세 축의 독립 조사자(worker-A: 커뮤니티/포럼, worker-B: 영상/SNS, worker-C: 대안 행동·제공자)를 병렬 조사했다.
3. 부모 오케스트레이터가 결과를 직접 교차 취합해 P-01/P-02를 작성했다.
4. verifier-problem이 원문 일부를 독립 재확인해 문제 정의의 증거 범위와 제공자 역할을 점검했다.
5. designer-A/B가 각각 비AI, AI 보조, UX, 데이터·자동화 대안을 분기했다.
6. 문제 증거를 먼저 정한 뒤 선택 방향에 필요한 AI만 조사했다.
7. 최종 문서는 별도 verifier-final의 읽기 전 검증 후 SHA-256 매니페스트로 동결한다.

### 증거 표기

- 공식 원문·공식 영상·학술 논문: 제도 사실 또는 기술 가능성의 근거.
- 공개 개인 글·SNS: 특정 작성자의 경험 신호. 모집단 빈도나 성공률로 일반화하지 않음.
- 추론: 설계 위험 또는 가설. 실험 전에는 UNVERIFIED.
- UNVERIFIED: 조사·구현·운영 데이터가 없어 확인할 수 없음.
- BLOCKED: 로그인, CAPTCHA, 유료벽, robots, 일시 오류, 원문 미접근 등으로 확인하지 못함.

## 2. 사용자 발화와 출처

다음 표는 반복되는 고통 신호를 보여주는 짧은 공개 발화다. 인용은 해당 글의 작성자 표현이며, 발화 하나가 전체 청년의 빈도를 증명하지 않는다.

| ID | 공개 발화 또는 관찰 | 출처 | 해석 경계 |
|---|---|---|---|
| A-01 | “소득 조건 헷갈려서 신청 안 하는 애들 많더라.” | [DCInside](https://gall.dcinside.com/board/view/?id=outofwork&no=728055&page=1) | 소득 조건 혼란의 경험 신호. 빈도·신청 포기율은 UNVERIFIED |
| A-02 | “부모님 소득 때문에 컷날 수 있습니다.” | [DCInside](https://gall.dcinside.com/mgallery/board/view/?id=singlebungle1472&no=2375811) | 원가구 소득을 함께 확인해야 한다는 사용자 경고. 특정 제도의 법적 기준은 공고 확인 필요 |
| A-03 | “서류 뗄 게 있어서”, “지자체 홈페이지나 관련 글을 살핀다.” | [TheQoo](https://theqoo.net/square/4310681320) | 신청 전 수동 탐색·서류 준비 행동. 원문 일부 직접 확인은 BLOCKED |
| A-04 | “가족구성원 동의 안하면 취소한다는데 … 무시함.” | [TheQoo](https://theqoo.net/ktalk/4287185827?category=1947874&l=jp&m=1&order_type=desc&sort_index=title) | 가족 동의·취소에 대한 불안 신호. 작성 시점은 UNVERIFIED |
| A-05 | “클릭할때마다 대기 10분씩”, “아빠는 폰 스마트폰 아닌데” | [DCInside](https://gall.dcinside.com/board/view/?id=jungsopd&no=1762761&page=1) | 접속·가족 디지털 접근성 마찰. 발생률은 UNVERIFIED |
| A-06 | “청년도약계좌 있는 사람은 절대 먼저 깨지 마세요.” | [DCInside](https://gall.dcinside.com/board/view/?id=dcbest&no=426928) | 상품 전환·해지 순서에 대한 위험 인식. 실제 최적 순서는 해당 상품 원문 확인 필요 |
| B-01 | “해도 식비가 부족하더라고요.” | [KTV 청년지원 영상](https://www.ktv.go.kr/content/view?content_id=757124) | 생활비·주거비 압박을 말한 공식 영상 속 참여자 발화. 전체 청년 소득 사정의 대표값 아님 |
| B-02 | “월세 부담이 갈수록 커져 고민이 많았다.” | [Newsis 영상/Daum](https://v.daum.net/v/20260809090206093) | 월세 부담과 지원 후 학업 여유에 대한 사례. 지원 효과의 일반화는 UNVERIFIED |
| B-03 | “서울 청년의 현실은 매우 버겁습니다.” | [서울시 공식 영상](https://tv.seoul.go.kr/v/7dfacb949cd6498595f89d37e3de7a35) | 공식 발표의 상황 진술. 수치·정책 효과의 독립 검증은 별도 필요 |
| B-04 | 지원금 정보는 많지만 기준과 신청 방법을 확인해야 한다는 안내 | [KTV 정책 안내](https://www.ktv.go.kr/content/view?content_id=749152) | 소셜미디어식 ‘지원금 챙기기’와 실제 요건 사이의 적합성 문제 |
| B-05 | 월세가 50~55만 원에서 65만 원으로 올랐다는 사례 | [KTV 주거 영상](https://m.ktv.go.kr/content/view?content_id=689028) | 주거비 변동 사례. 금액은 해당 사례의 발화이지 일반 통계 아님 |
| B-06 | “예상치 못한 결과에 패닉”, 이의 후 준비하던 수당을 잃었다는 자기보고 | [개인 블로그](https://2b-continued.tistory.com/38) | 반려·이의·현금흐름 불안 신호. 사실관계와 금액은 독립 검증하지 않음 |
| B-07 | “나는 청년일까 아닐까?”, 기준을 착각해 신청하지 못했다는 서술 | [개인 블로그](https://myview23394.tistory.com/24) | 연령·기준 혼동의 경험 신호. SEO성 2차 글의 대표성 낮음 |
| B-08 | 이전 수혜자 제외, 선착순·예산 소진 사례를 알리는 공지 | [구미시 공식 X](https://x.com/yesgumi/status/2025823158268539231/photo/2) | 모집 상태와 이전 수혜가 시점·지역에 따라 바뀜. X 원문 일부는 직접 접근 제한 |

공식 제공자도 단순한 정보 부재를 말하지 않는다. [온통청년 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout)는 검색·비교·자격 진단·상담을 제공하고, [예비 진단 주의문](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch/pop/checkStep03)은 진단이 참고용이며 최종 판단은 운영기관이라고 명시한다. 따라서 Setup의 문제는 “정보가 없다”가 아니라 “원문·조건·버전·다음 행동을 함께 판단하기 어렵다”로 한정한다.

## 3. 대안 행동과 제공자 역할

| 사용자가 현재 하는 일 | 얻는 것 | 남는 실패 | Setup에서의 위치 |
|---|---|---|---|
| 온통청년에서 검색·비교·예비 진단 | 정책 후보, 비교, 상담 연결 | 운영기관별 원문·버전·중복·첨부를 다시 대조 | 대체하지 않고 원문·상담으로 연결 |
| 복지로·정부24·지자체 페이지에서 신청·조회 | 실제 신청·증명·상태 확인 | 신청 전후 상태와 기한을 여러 화면에서 이어 붙임 | 신청은 해당 기관에 남김 |
| 블로그·커뮤니티 비교표, 스크린샷, 메모 | 타인의 경험과 빠른 요약 | 최신성·지역성·근거가 불안정, 개인 상태와 불일치 | 경험 신호로만 사용 |
| 엑셀·캘린더·노션으로 소득·기한 기록 | 상태와 마감 수동 관리 | 원문 버전·정책 관계와 분리, 변경 감지 없음 | 장부 UX의 비AI 대안 |
| 공식 상담·전화·방문 | 애매한 조건의 기관 답변 | 반복 문의, 상담 전 필요한 사실 정리 부담 | 애매한 결과의 최종 경로 |
| ChatGPT 등 범용 질문 | 긴 문서의 빠른 요약 | 출처·기준일·최종 판단 주체가 빠질 위험 | 출처가 고정된 후보 추출 외에는 사용하지 않음 |

| 제공자 | 맡는 역할 | Setup이 하지 않는 일 | 직접 근거 |
|---|---|---|---|
| 온통청년 | 청년 정책 검색·비교·예비 진단·상담·공개 API | 최종 자격·지급 판정, 운영기관 대체 | [소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout), [API 안내](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide) |
| 복지로 | 복지 서비스 정보·신청·상태·공공데이터 API | 모든 지역 정책의 단일 최종 판정 | [복지로 소개](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/intro/intro/info/01/index.html), [중앙복지 API](https://www.data.go.kr/data/15090532/openapi.do) |
| 정부24·보조금24 | 민원·혜택 검색·신청·증명 연결 | 사용자를 대신한 신청·인증 | [정부24](https://www.gov.kr/portal/main), [API 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?originId=NOTICE_0000000004156) |
| 서민금융진흥원(KINFA) | 정책형 금융상품 원문·상담 | 금융상품 가입 승인·계좌 접근 | [청년 금융상품](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do), [상담](https://www.kinfa.or.kr/financialLife/youthFinancialCounseling.do) |
| 지자체·운영기관·은행 | 공고·신청·심사·지급·상담 | Setup의 결과를 법적 결정으로 인정할 의무 없음 | 각 정책 원문과 신청 링크 |

금융 데이터 연결은 별도 권한이 필요하다. [금융위원회 마이데이터 안내](https://www.fsc.go.kr/no010101/77182?curPage=124&srchBeginDt=&srchCtgry=&srchEndDt=%2F1000&srchKey=&srchText=)는 API 방식, 동의, 보안·적합성 확인과 기관별 연결을 설명한다. 이 조사만으로 “학생 팀은 법적으로 절대 불가”라고 단정하지 않으며, 실제 권한·등록 여부가 없는 상태에서는 금융 계정·SMS·스크래핑을 기본 전제로 삼지 않는다.

## 4. 독립 검증을 통과한 문제 정의

verifier-problem이 worker-A/B/C와 공식 원문을 다시 확인했다. PASS의 의미는 문제를 제품 기능명이 아닌 사용자 순간으로 정의했고, 공개 사례를 모집단 수치로 과장하지 않았으며, 제공자를 경쟁자로 잘못 분류하지 않았다는 뜻이다. 실제 효과는 여전히 UNVERIFIED다.

### P-01 신청 전 자격·중복·순서 결정

- 사용자: 주소·가구·소득·재학/재직·이전 수혜가 바뀌는 대학생, 취준생, 알바생, 사회초년생.
- 순간: 월세·수당·취업지원·정책형 금융상품을 신청하거나 기존 상품을 바꾸기 직전.
- 목표: 현재 가능한 후보, 중복·배제 관계, 먼저 확인할 정책과 첨부를 정한다.
- 현재 행동: 온통청년·복지로·정부24·지자체·은행 검색, 커뮤니티·블로그·스크린샷·상담의 수동 대조.
- 실패 가설: 지역, 가구원, 기준연도·현재 소득, 이전 수혜, 신청기간, 첨부·중복 규칙이 여러 원문에 흩어진다. 단일 검색이나 일반 RAG가 표 예외·상충 공고·기준일을 놓칠 수 있다는 것은 설계 위험이지 재현 실험 결과가 아니다.
- 부담: 서류·상담 시간, 잘못된 신청·전환 순서 위험, 결정 지연과 불안. 지원금 손실액·탈락률·절감액은 UNVERIFIED.
- 검증 수준: 경험 신호 중간, 제도 원문 높음, 전체 빈도·효과 UNVERIFIED.

### P-02 상태 변화 후 유지·중단·복구·이의신청 결정

- 사용자: 신청 중이거나 수혜 중이며 소득·취업·주소·가구·계약·이전 수혜가 변할 수 있는 청년.
- 순간: 소득 입금, 취업·퇴사, 이사·계약 변경, 가족 변화, 반려·보완·예산 소진·접속 장애를 겪은 직후.
- 목표: 유지 가능한지, 무엇을 언제 신고·보완해야 하는지, 중단·재개·이의신청·대체 경로 중 무엇을 확인할지 정한다.
- 현재 행동: 문자·포털 상태·공고 PDF·첨부 목록·상담을 다시 보고 엑셀·메모·스크린샷으로 기한 관리.
- 실패 가설: 상태 변화의 적용일, 중단 사유, 신고기한, 복구·이의·환수 규칙이 원문·상태 화면·개인 기록에 나뉜다. 단순 알림이나 RAG가 버전과 반증 문서를 보존하지 않으면 과잉 경고 또는 근거 없는 확신을 만들 수 있다.
- 부담: 신고·보완·이의 기한을 놓칠 위험, 중단·재개 지연, 상담 반복, 현금흐름 불확실성. 실제 환수·중단액은 UNVERIFIED.
- 검증 수준: 공식 운영 흐름 높음, 개인 경험 중간 이하, 발생률·금액 UNVERIFIED.

### 범위에서 보류한 후보

할부 수수료 최적화는 기획서의 후보 기능이지만 이번 공개 조사에서 독립적인 반복 사용자 증거와 허용된 금융 데이터 경로가 충분하지 않아 주 문제로 확정하지 않는다. 실제 SMS·MyData·CODEF 연결도 조사 결과가 아니라 향후 권한·약관·보안 확인 대상이다.

## 5. 해결 방향 비교

| 방향 | AI 없이 가능한 최소안 | AI 보조안 | 차별화 | 주요 시험 |
|---|---|---|---|---|
| A1 자격·중복 그래프 | 승인된 규칙 카드와 합성 프로필로 결정론적 판정 | AI가 규칙 후보만 제안 | 설명 가능·보수적 보류 | 중복·순서·누락 입력 |
| A2 문서 해석 보조 | 사람이 원문을 구조화 | 표·예외·조건을 원문 span과 함께 추출 | 이질적 공고를 근거 단위로 연결 | 추출·인용·보류 |
| A3 결정 패킷 UX | 확인 사실/누락/기관 문의의 세 칸 | 필요할 때만 근거 인용 요약 | 사용자의 다음 행동을 명확히 함 | 근거 회상·잘못된 해지 의도 |
| A4 버전·변경 원장 | 해시·필드 diff·수동 검토 큐 | 의미상 같은 조항 후보 연결 | 오래된 공고·변경을 장부로 추적 | 버전 선택·변경 감지 |
| B1 상태 결정표 | 사건·날짜·정책 상태를 규칙 분기로 계산 | AI 없음 | 유지/중단/복구/이의의 명시적 분기 | 합성 상태 변화 |
| B2 복구 콕핏 | 네 상태 카드와 기한 체크리스트 | AI 없음 | 상태와 다음 행동을 한 화면에 배치 | 과업 성공·접근성 |
| B3 반려문서 해석 | 사용자가 사건·사유·기한을 직접 입력 | 가린 문서에서 후보 추출 | 자유 형식 통지를 구조화 | 사유·기한 추출·민감정보 |
| B4 상태 장부 | CSV·스프레드시트·수동 캘린더 | AI 없음 | 사용자 사건과 정책 버전을 연결 | 영향 범위·중복 작업 |

A2/B3만으로도 AI를 설명할 수 있지만, 최종 차별화는 A1/B1의 결정론적 핵심과 A4/B4의 시간 원장이다. AI가 없어도 동작 가능한 최소안이 있어야 하며, AI는 이질적 원문을 후보 구조화하는 좁은 병목에만 넣는다.

## 6. 기준선 차별화(CANDIDATE-002): 근거 제한형·시간 버전형 정책 상태 장부

### 한 문장

공식 제공자 원문을 버전과 기준일이 붙은 원자 조건으로 보존하고, AI는 표·예외·통지에서 인용 가능한 후보만 추출하며, 결정론적 규칙·관계 그래프가 자격·중복·순서·상태 변화를 계산하고, 불확실하면 확정 대신 UNVERIFIED/BLOCKED와 기관 연결을 보여준다.

### 차별화의 경계

1. 단순 정책 검색이 아니라 정책 조항·예외·기간·중복 관계·증빙을 하나의 출처 장부에 묶는다.
2. 단순 RAG가 아니라 유효 기간 필터와 원문 span 검증을 먼저 거친다.
3. AI가 자격을 판정하지 않고, 후보 추출·문서 구조화·질문 제안만 한다.
4. 신청·심사·지급·환수·이의 결정은 운영기관에 남기고, Setup은 근거·누락·다음 확인 행동을 제공한다.
5. 민감 데이터 최소화를 기본값으로 한다. 사용자가 직접 입력한 최소 프로필과 선택적으로 가린 통지만 사용하며 계좌·비밀번호·주민번호·가족 계정·SMS 자동수집은 요구하지 않는다.

## 7. 선택 방향에 필요한 AI 조사

문헌은 기술 가능성과 문헌 실험을 보여줄 뿐 Setup의 결과가 아니다.

| 기술 | 직접 출처 | 채택 이유와 사용 범위 | 경계 |
|---|---|---|---|
| 레이아웃·표 추출 | [DocLLM, ACL 2024](https://aclanthology.org/2024.acl-long.463/), [PubTables-1M, CVPR 2022](https://openaccess.thecvf.com/content/CVPR2022/html/Smock_PubTables-1M_Towards_Comprehensive_Table_Extraction_From_Unstructured_Documents_CVPR_2022_paper.html) | 텍스트뿐 아니라 좌표·표 구조를 조건·행·각주 후보로 보존 | 병합 셀·스캔·각주 오류 시 후보 폐기·수동 확인 |
| 인용 검증·보류 | [Self-RAG, ICLR 2024](https://proceedings.iclr.cc/paper_files/paper/2024/file/25f7be9694d7b32d5cc670927b8091e1-Paper-Conference.pdf), [CaLM, Findings ACL 2024](https://aclanthology.org/2024.findings-acl.759/), [Conformal abstention](https://arxiv.org/abs/2405.01563) | 후보마다 원문 span·기준일·정책 ID를 검증하고 unsupported/conflict 출력을 보류 | 인용이 있다고 의미 정확성이 보장되지 않음 |
| 구조화 출력 | [JSONSchemaBench arXiv](https://arxiv.org/abs/2501.10868) | 조건·예외·기간·근거 span 스키마를 형식 검증 | OpenReview 원문 미러는 브라우저 검증으로 BLOCKED. 스키마 준수는 사실성·법적 판단을 보장하지 않음 |

### 기술 선택의 이유

- 문서가 모두 구조화된 필드로 제공되면 AI 없이 규칙 카드·diff로 충분하다.
- AI는 PDF/HWP 표, 각주, 자유 형식 반려 통지처럼 사람이 매번 구조화하기 비싼 부분에만 쓴다.
- 버전 필터, 중복·순서 그래프, 인용 확인, 충돌 보류, 사용자 확인은 일반 코드와 규칙으로 강제한다.
- AI 중단·원문 차단 시 수동 입력·공식 상담으로 되돌아갈 수 있어야 한다.

문헌에 보고된 정확도·향상률·토큰 절감률은 Setup 결과로 복사하지 않는다. Setup의 실제 성능은 아래 비교 시험을 통과한 뒤에만 기록한다.

## 8. 시스템·데이터·실패 설계

### 데이터 흐름

1. 공개 원문 수집: 제공자·운영기관 URL, 원문 파일/HTML, 취득 시각, 공고일, 유효 시작·종료일, 정책 ID를 함께 보존한다. 접근 실패는 BLOCKED다.
2. 원문 스냅샷: 원본 해시와 버전을 불변 기록하고 변경 전후를 비교한다.
3. AI 후보 추출: 조건·예외·중복·기한·증빙·사건 유형을 JSON 스키마와 원문 위치, confidence, unknown 필드로 제안한다.
4. 원문 검증: 인용 span이 실제 원문을 지지하는지, 문서가 사용자 기준일에 유효한지 확인한다. 실패하면 UNVERIFIED다.
5. 결정론적 정규화: 지역, 연령, 가구, 직전/현재 소득, 재학·재직, 이전 수혜, 기간, 중복·선후 관계를 규칙 카드와 그래프로 계산한다.
6. 사용자 사건 장부: 사용자가 직접 입력한 주소·소득·고용·가구·수급·반려·계약 사건과 발생일을 저장하고 영향을 받는 정책만 재검토한다.
7. 결정 패킷: 확인된 사실, 입력 누락, 기관에 물을 항목, 기준일, 원문 링크, 다음 확인 행동을 분리해 표시한다. 신청은 제공자 화면으로 연결한다.

### 책임 분리

| 주체 | 할 일 | 하지 않을 일 |
|---|---|---|
| AI | 원문 후보 추출, 표현 정규화 후보, 질문 후보 | 최종 자격·중복·지급·환수 판정 |
| 결정론적 코드 | 버전 필터, 필드 비교, 규칙·그래프, 충돌·누락 보류 | 원문이 없는 조건 추정 |
| Setup UX | 근거·누락·기관 문의·다음 행동 표시, 변경 이력 | 승인 보장·자동 제출·자동 해지 |
| 사용자 | 최소 프로필·사건 확인, 기관 제출·상담 | AI 후보를 공식 결정으로 간주 |
| 운영기관 | 최종 심사·지급·중단·환수·이의 판단 | Setup 결과를 대신할 의무 없음 |

### 최소 데이터·권한

- 필수 최소값: 사용자가 직접 확인한 지역, 연령대, 가구 형태, 재학·재직 상태, 소득 기준일·범위, 현재/이전 수혜, 사건 발생일.
- 선택 입력: 개인정보를 가린 통지의 텍스트·이미지. 원본 보관 여부와 삭제를 사용자가 결정한다.
- 수집하지 않음: 금융 비밀번호·토큰, 주민번호, 가족 계정, 계좌 원문, SMS 자동수집, 제공자 로그인 대행.
- 감사 흔적: 원문 URL·해시·취득 시각·정책 버전·AI 후보·검증 결과·사용자 수정 이력을 남긴다.

### 실패와 복구

| 실패 | 표시 | 복구 |
|---|---|---|
| 구버전과 신버전 혼재 | UNVERIFIED | 적용일 질문, 변경 전후 원문과 운영기관 확인 링크 |
| 표·스캔·각주 추출 실패 | UNVERIFIED | 원문 위치를 표시하고 수동 규칙 입력 |
| 원문·기관 페이지 접근 차단 | BLOCKED | 제공자 링크·상담 전화·사용자 직접 확인 |
| 서로 다른 공고의 조건 충돌 | UNVERIFIED | 어느 조항이 충돌하는지 나열하고 확정 금지 |
| 사용자 프로필 누락 | UNVERIFIED | 누락 필드만 질문, 추정값 사용 금지 |
| 자유 형식 통지와 원문 불일치 | UNVERIFIED | 사건·날짜·정책 ID를 다시 확인 |
| 원문/API 스키마 변경 | BLOCKED 또는 UNVERIFIED | 마지막 정상 버전 보존, 변경 검토 큐 |
| 사용자가 입력을 수정·철회 | 검토 필요 | 관련 정책만 재계산, 외부 제출은 하지 않음 |

## 9. 실패 중심 비교 시험

구현 전 설계용 시험이며, 모든 입력은 공식 원문 스냅샷과 비식별 합성 프로필로 만든다. 아래에는 결과값을 쓰지 않는다.

| 시험 | 단순 검색/일반 RAG 예상 위험 | 선택 방향의 기대 동작 | 측정 지표 |
|---|---|---|---|
| T1 구버전·신버전 공고 | 오래된 조건을 현재 답변에 섞음 | 기준일에 맞는 버전만 선택, 변경 조항 표시 | 버전 선택 정확도, 오래된 인용률 |
| T2 표의 예외 행·각주 | 본문·헤더만 읽고 예외 누락 | 행·헤더·각주 span을 함께 추출하거나 보류 | 필드 F1, 예외 누락률, 인용 정밀도 |
| T3 상충 공고 | 더 그럴듯한 한 쪽을 임의 선택 | 충돌 목록과 UNVERIFIED 반환 | 충돌 탐지 재현율, 잘못된 확정 0건 |
| T4 소득·주소·고용 사건 | 전체 정책을 다시 추정하거나 과잉 경고 | 영향 정책만 재검토, 적용일 질문 | 영향 범위 정확도, 중복 작업률 |
| T5 프로필 누락 | 빈 필드를 평균값·추정값으로 채움 | 누락 질문 또는 UNVERIFIED | unsupported 답변률, 질문 적합성 |
| T6 가린 반려·보완 통지 | 날짜·사유를 환각하거나 기관을 오인 | 사건·기한 후보를 원문과 대조, 불일치 보류 | 사건/기한 추출 F1, 보류 정밀도 |
| T7 첨부·페이지 차단 | 이전 캐시를 현재 원문으로 가장 | BLOCKED와 공식 링크·상담 표시 | 차단 분류 정확도, 허위 최신성 0건 |
| T8 되돌리기 어려운 행동 | 해지·신청을 바로 권고 | 확인된 사실·기관 문의를 먼저 보여주고 잠금 | 잘못된 해지 의도, 근거 회상 |

후속 시험 지표는 조항 추출 정확도, 인용 정밀도, 버전 선택 정확도, 충돌 탐지·보류 정밀도/재현율, unsupported 답변률, 합성 규칙 판정 정확도, 지연·토큰·비용, UX 과업 성공률이다. 위 지표의 실제 숫자는 구현 후 로그로 채우며 현재는 모두 UNVERIFIED다.

## 10. 면접용 STARR 증거 설계

### STARR-1: 표 예외·버전 혼합을 보류한 정책 결정 패킷

- Situation: 기존 키워드/벡터 검색이 비슷한 정책의 본문은 찾지만 표 예외 또는 구버전 조항을 현재 답변에 섞을 수 있는 상황.
- Task: 제한된 기간 안에 선택 정책 묶음의 최소 PoC를 만들고, 근거 없는 최종 자격 판정을 내리지 않는 것. 기간은 제약 조건일 뿐 세부 실행 계획이나 결과를 의미하지 않는다.
- Action: 원문 스냅샷·해시·적용일 장부, 레이아웃·표 후보 추출, 조건·예외·근거 span 스키마, 결정론적 규칙·중복 그래프, 인용 검증·UNVERIFIED/BLOCKED 게이트를 설계한다. 개인 금융계정 없이 공개 원문과 합성 프로필만 사용한다.
- Result: 실제 구현·시험 로그가 없으므로 UNVERIFIED. 완료 뒤 T1/T2/T3의 기준선 대비 지표를 기록한다. 승인률·지원금·절감액은 결과로 주장하지 않는다.
- Reflection: AI는 후보 추출자이고 법적 판단자가 아니다. HWP/HWPX·스캔·접근 차단·과도한 보류를 후속 검토 대상으로 남긴다.

증거 패킷: 기준선 출력, 원문 스냅샷·해시, 정답 주석, AI 후보와 인용 span, 검증기 로그, 보류 사유, 재현 명령, 미해결 목록. 없으면 결과 문장을 만들지 않는다.

### STARR-2: 상태 변화 후 유지·중단·복구·이의 경로

- Situation: 소득·주소·고용·계약 또는 반려 통지가 생겼지만, 포털 상태·공고·첨부·상담 기록이 분리되어 다음 행동과 기한을 확인하기 어려운 상황.
- Task: 사건·정책·원문 버전을 연결해 영향을 받는 정책만 검토하고, 유지·중단·복구·이의신청 중 확정할 수 없는 경우 기관 확인으로 안전하게 넘기는 것.
- Action: 사용자 사건 장부, 유효일 필터, 상태 결정표·네 갈래 UX, 가린 통지의 선택적 AI 후보 추출, 원문 검증, 중복 작업 제거, 외부 제출 없는 공식 링크·상담 폴백을 설계한다.
- Result: 실제 유지·중단·환수·이의 결과와 시간 절감은 UNVERIFIED. 구현 뒤 T4/T6/T7의 영향 범위, 기한 추출, 보류, 허위 확정 0건을 로그로 채운다.
- Reflection: 알림이 행동을 재촉해도 운영기관 판단을 대신하면 안 된다. 장기 민감 사건 보관, 오탐 변경, API 권한과 접근성의 한계를 공개한다.

증거 패킷: 비식별 합성 사건 스트림, 원문 버전 전후, 기대 분기표, 상태 장부 diff, 보류·복구 로그, 접근성 점검, BLOCKED 처리 기록. 실제 개인 제출·계정 연결 증거는 요구하지 않는다.

면접 답변에서 “절감했다”, “합격시켰다”, “법적으로 가능하다”라고 말할 수 있는 값은 승인된 로그·공식 문서·권한 증명으로 확인된 뒤에만 사용한다. 지금은 반드시 UNVERIFIED라고 답한다.

## 11. UNVERIFIED와 BLOCKED

### UNVERIFIED

- 공개 사례의 모집단 빈도, 신청 포기율, 탈락률, 지원금·환수 손실액, 승인률, 상담 횟수, 시간·금액 절감.
- Setup의 AI 추출 정확도, 인용 정밀도, 버전 선택, 충돌 탐지, UX 과업 성공, 실제 운영기관 결과.
- 기획서에 적힌 특정 정책 금액·기간·중복 가능성·청년도약계좌 종료·후속 상품·할부 수수료 예시의 현재성. 각각의 현재 공고와 상품 원문을 다시 확인해야 한다.
- MyData·SMS·CODEF·공공 마이데이터의 실제 자격, 계약, 키 발급, 운영 약관, 실데이터 접근.
- 개인 블로그·커뮤니티 발화의 사실관계, 작성자 조건, 인용된 금액·결과.
- 논문에 보고된 성능을 Setup 성능으로 전용할 수 없음.

### BLOCKED

- 로그인·비공개 게시판·CAPTCHA·유료벽·일부 X/YouTube/Naver 원문·댓글.
- 데스크톱에서 직접 열리지 않은 [복지로 청년월세 상세](https://www.bokjiro.go.kr/ssis-tbu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661&wlfareInfoReldBztpCd=01). 모바일 검색 결과와 공식 링크는 참고 경로로만 남겼다.
- [JSONSchemaBench OpenReview 미러](https://openreview.net/pdf?id=FKOaJqKoio)는 브라우저 검증으로 원문 직접 확인이 BLOCKED다. 확인 가능한 [arXiv 원문](https://arxiv.org/abs/2501.10868)을 사용했다.
- 접근 권한·API 키·사업자 등록·기관 승인 없이 호출하는 제공자 API.
- 운영기관의 내부 심사·지급·환수·이의결정과 개인 금융 계정.

### 안전한 표현

“가능”은 예비 조건 일치일 뿐 승인 보장이 아니다. 원문·기준일·기관이 확인되지 않으면 “운영기관 확인 필요” 또는 UNVERIFIED/BLOCKED로 표시한다. 자동 신청·자동 해지·소득을 옮기거나 숨기라는 조언은 하지 않는다.

## 12. 직접 링크 참고문헌

### 정책·제공자·제약

1. [온통청년 소개·검색·상담](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout)
2. [온통청년 예비 자격진단 주의](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch/pop/checkStep03)
3. [온통청년 Open API 안내](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide)
4. [국무조정실 온통청년 출범 보도자료 PDF](https://www.opm.go.kr/opm/news/press-release.do?articleNo=158539&attachNo=146452&mode=download)
5. [복지로 소개](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/intro/intro/info/01/index.html)
6. [복지로 중앙복지서비스 API](https://www.data.go.kr/data/15090532/openapi.do)
7. [복지로 청년월세 상세 링크](https://www.bokjiro.go.kr/ssis-tbu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661&wlfareInfoReldBztpCd=01)
8. [정부24](https://www.gov.kr/portal/main)
9. [정부24·보조금 API 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?originId=NOTICE_0000000004156)
10. [서민금융진흥원 청년 금융상품](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do)
11. [서민금융진흥원 청년 금융상담](https://www.kinfa.or.kr/financialLife/youthFinancialCounseling.do)
12. [금융위원회 마이데이터 API·스크래핑·동의·보안 안내](https://www.fsc.go.kr/no010101/77182?curPage=124&srchBeginDt=&srchCtgry=&srchEndDt=%2F1000&srchKey=&srchText=)
13. [서울시 주거 신청·첨부·완료 확인 안내 PDF](https://soco.seoul.go.kr/coHouse/cmmn/file/fileDown.do?atchFileId=fba10a7affd347f189b4232d78f807fa&fileSn=3)

### 사용자 경험 신호

14. [DCInside 실직·소득 조건 사례](https://gall.dcinside.com/board/view/?id=outofwork&no=728055&page=1)
15. [DCInside 가구 소득·정책 혼동 사례](https://gall.dcinside.com/mgallery/board/view/?id=singlebungle1472&no=2375811)
16. [TheQoo 서류·정책 탐색 사례](https://theqoo.net/square/4310681320)
17. [TheQoo 가족 동의 사례](https://theqoo.net/ktalk/4287185827?category=1947874&l=jp&m=1&order_type=desc&sort_index=title)
18. [DCInside 가족 동의·접속 마찰 사례](https://gall.dcinside.com/board/view/?id=jungsopd&no=1762761&page=1)
19. [DCInside 금융상품 전환 주의 사례](https://gall.dcinside.com/board/view/?id=dcbest&no=426928)
20. [KTV 청년 생활비 발화](https://www.ktv.go.kr/content/view?content_id=757124)
21. [Newsis/Daum 월세 부담 사례](https://v.daum.net/v/20260809090206093)
22. [서울시 공식 청년 주거 영상](https://tv.seoul.go.kr/v/7dfacb949cd6498595f89d37e3de7a35)
23. [KTV 지원금 정보·요건 안내](https://www.ktv.go.kr/content/view?content_id=749152)
24. [KTV 주거비 사례](https://m.ktv.go.kr/content/view?content_id=689028)
25. [반려·이의 자기보고](https://2b-continued.tistory.com/38)
26. [청년 기준 혼동 자기보고](https://myview23394.tistory.com/24)
27. [구미시 공식 X 모집·예산 공지](https://x.com/yesgumi/status/2025823158268539231/photo/2)

### AI 기술

28. [DocLLM, ACL 2024](https://aclanthology.org/2024.acl-long.463/)
29. [PubTables-1M, CVPR 2022](https://openaccess.thecvf.com/content/CVPR2022/html/Smock_PubTables-1M_Towards_Comprehensive_Table_Extraction_From_Unstructured_Documents_CVPR_2022_paper.html)
30. [Self-RAG, ICLR 2024](https://proceedings.iclr.cc/paper_files/paper/2024/file/25f7be9694d7b32d5cc670927b8091e1-Paper-Conference.pdf)
31. [CaLM, Findings ACL 2024](https://aclanthology.org/2024.findings-acl.759/)
32. [Conformal abstention](https://arxiv.org/abs/2405.01563)
33. [JSONSchemaBench arXiv](https://arxiv.org/abs/2501.10868)
34. [JSONSchemaBench OpenReview 미러(BLOCKED)](https://openreview.net/pdf?id=FKOaJqKoio)
35. [AI-Powered Rules as Code: Public Benefits Policy](https://digitalgovernmenthub.org/publications/ai-powered-rules-as-code-experiments-with-public-benefits-policy/)
36. [Executable Governance for AI: Translating Policies into Rules Using LLMs](https://arxiv.org/abs/2512.04408)
37. [AutoSpec+, ACL 2026 Demo](https://aclanthology.org/2026.acl-demo.66/)
38. [FormalBench, ACL 2025](https://aclanthology.org/2025.acl-long.1068/)
39. [Planetarium, NAACL 2025](https://aclanthology.org/2025.naacl-long.560/)
40. [VersionRAG](https://arxiv.org/abs/2510.08109)
41. [DyG-RAG](https://arxiv.org/abs/2507.13396)
42. [Multiagent Debate, ICML 2024](https://proceedings.mlr.press/v235/du24e.html)

부속 조사 기록은 [worker-A](RESEARCH/setup-differentiation_2026-08-22/worker-A.md), [worker-B](RESEARCH/setup-differentiation_2026-08-22/worker-B.md), [worker-C](RESEARCH/setup-differentiation_2026-08-22/worker-C.md), [문제 검증](RESEARCH/setup-differentiation_2026-08-22/verifier-problem.md), [방향 A](RESEARCH/setup-differentiation_2026-08-22/design-A.md), [방향 B](RESEARCH/setup-differentiation_2026-08-22/design-B.md), [방향 선택](RESEARCH/setup-differentiation_2026-08-22/direction-selection.md), [기존 AI 조사](RESEARCH/setup-differentiation_2026-08-22/ai-research.md), [히어로 AI 조사](RESEARCH/setup-differentiation_2026-08-22/hero-ai-research.md)에 보존했다.

---

# CANDIDATE-003 보완 설계: PolicyOS

이 부록은 기존 기준선을 폐기하지 않고, 사용자가 지적한 “기능을 들으면 볼 것이 없어 보이는 문제”를 해결하기 위한 최종 방향이다. 핵심은 AI를 요약·검색 보조가 아니라 **정책 컴파일러, 반사실 시뮬레이터, 적대적 감사 시스템**으로 사용하는 것이다.

### A. 히어로 AI 정의

### Policy Compiler

공고문 PDF/HWP/HTML의 문장을 검색용 chunk로만 저장하지 않는다. AI가 다음 중간 표현(Policy IR)을 제안한다.

| Policy IR 필드 | 예시 의미 | 반드시 보존할 근거 |
|---|---|---|
| subject | 청년, 가구, 재학생, 취업자 | 원문 span·정책 ID |
| predicate | 나이, 지역, 소득, 주거, 이전 수혜 | 표의 행·열·각주 |
| operator | AND, OR, NOT, 기간, 임계값 | 조항·예외 문장 |
| event | 취업, 퇴사, 이사, 소득 변화, 반려 | 통지·변경 공고 |
| effect | 신청 가능성, 검토 필요, 유지·중단 후보 | 지급 확정이 아닌 상태 후보 |
| validity | 공고일, 적용 시작·종료, 기준연도 | 버전·확인 시각 |
| evidence | source URL, page, bounding box, quote | 원문 위치와 해시 |

AI는 Policy IR 후보를 만들고, 스키마 검사·정적 규칙 검사·합성 입력 실행·반례 생성기를 통과하지 못한 후보는 폐기한다. 따라서 “LLM이 자격을 판정했다”가 아니라 **LLM이 정책을 프로그램으로 번역했고, 프로그램이 검증을 통과했을 때만 시뮬레이터에 들어간다**가 된다.

### Personal Policy Digital Twin

사용자 프로필을 정적인 진단값으로 저장하지 않고, 정책과 연결된 상태 그래프로 표현한다.

| 상태 | 가상 이벤트 | 보여줄 결과 |
|---|---|---|
| 현재 재학생·알바·서울 거주 | 다음 달 취업 | 어떤 정책 조건이 바뀌는지, 어느 원문을 다시 확인해야 하는지 |
| 현재 수혜 중 | 주소 이전 | 영향받는 정책만 재실행하고 유지·중단·기관 확인 후보를 분리 |
| 신청 준비 중 | 소득 기준일 변경 | 구버전·신버전 차이와 새로 필요한 증빙 |
| 반려 통지 수신 | 누락 서류 보완 | 기한·사유·필요 증빙 후보와 운영기관 연결 |

디지털 트윈은 미래 지원금이나 승인 결과를 예언하지 않는다. **현재 상태와 가상 이벤트 사이의 규칙 변화(delta)**와 확인해야 할 근거를 보여준다.

### Adversarial Policy Audit

생성 AI 하나가 답을 내고 끝내지 않는다.

| 역할 | 질문 |
|---|---|
| Compiler agent | 원문을 어떤 조건·예외·기간으로 번역했는가? |
| Scenario agent | 사용자의 가상 이벤트를 어떤 상태 변화로 해석했는가? |
| Counterexample agent | 이 규칙을 깨는 표 행, 각주, 상충 공고, 누락 입력이 있는가? |
| Citation auditor | 모든 조건이 원문 span과 기준일에 연결되는가? |
| Symbolic runtime | Policy IR을 실행했을 때 타입·기간·충돌이 일관적인가? |
| Decision packet | 통과하지 못한 부분을 확정 대신 UNVERIFIED/BLOCKED로 표시했는가? |

이 구조는 [Rules as Code 공공급여 실험](https://digitalgovernmenthub.org/publications/ai-powered-rules-as-code-experiments-with-public-benefits-policy/), [Executable Governance](https://arxiv.org/abs/2512.04408), [AutoSpec+](https://aclanthology.org/2026.acl-demo.66/), [Multiagent Debate](https://proceedings.mlr.press/v235/du24e.html)의 문제의식에서 출발한다. 논문 성능 수치는 Setup의 결과로 사용하지 않는다.

### B. 사용자 중심 사용 흐름

| 단계 | 사용자가 하는 일 | PolicyOS 내부 동작 | 결과 |
|---:|---|---|---|
| 1 | 지역·나이·주거·재학/재직·소득 기준일·현재 수혜 입력 | 최소 상태 그래프 생성 | 현재 상태와 누락 정보 |
| 2 | “취업하면?”, “이사하면?”, “소득이 바뀌면?” 중 하나 선택 | Scenario agent가 이벤트를 구조화 | 가상 이벤트와 영향 범위 |
| 3 | 정책 후보를 선택 | 관련 정책 버전과 원문 span 검색 | 적용 공고와 변경 이력 |
| 4 | 결과 확인 | Compiler agent가 만든 Policy IR을 symbolic runtime에서 실행 | 정책별 상태 delta |
| 5 | 반례 확인 | Counterexample agent가 예외·충돌·구버전 근거를 공격 | 통과 근거와 보류 이유 |
| 6 | 다음 행동 선택 | Decision packet이 확인 사실·누락·기관 문의를 분리 | 공식 신청·상담 링크 |
| 7 | 상태나 공고가 바뀜 | 영향받은 시나리오만 재컴파일·재실행 | “이전 결과가 왜 바뀌었는지” 설명 |

기존 정책 포털이 “무슨 정책이 있는가”를 보여준다면, PolicyOS는 **“내 상태에서 이 이벤트를 실행하면 어떤 조건이 바뀌며 무엇을 다시 확인해야 하는가”**를 보여준다.

### C. 왜 AI가 반드시 필요한가

| 작업 | 규칙만으로 가능한가 | AI가 필요한 이유 |
|---|---|---|
| 이미 구조화된 조건 계산 | 가능 | AI를 쓰지 않음 |
| PDF/HWP 표·각주·참조 조항의 후보 추출 | 제한적 | 문서 레이아웃과 표현 변화가 고정되지 않음 |
| 자연어 공고를 Policy IR로 번역 | 부분 가능 | 새로운 표현·예외·교차 참조를 후보로 묶어야 함 |
| 사용자의 자유 형식 “취업하면?” 해석 | 부분 가능 | 이벤트·시점·영향 정책 후보를 구조화해야 함 |
| 반례·상충 문서 찾기 | 검색만으로 부족 | 생성된 규칙을 공격하는 질문과 테스트 케이스가 필요 |
| 최종 판정·기간 계산·충돌 보류 | 가능 | 결정론적 런타임이 담당해야 함 |

AI가 없어도 작은 정책 집합은 규칙 카드로 처리할 수 있다. 그러나 **이질적인 공고를 계속 Policy IR로 번역하고, 사용자의 자연어 가상 이벤트를 테스트 가능한 시나리오로 바꾸고, 스스로 만든 규칙의 반례를 찾는 과정**은 이 설계에서 AI가 실제로 필요한 병목이다.

### D. 기술 구조

| 계층 | 핵심 구성 | 책임 |
|---|---|---|
| Source layer | 원문 스냅샷, 해시, URL, 취득 시각, 유효 기간 | 버전과 원문 보존 |
| Multimodal compiler | layout/table parser + LLM + structured decoder | Policy IR 후보 생성 |
| Policy test generator | 경계값·예외·상충·누락 입력 생성 | 후보 규칙의 테스트 생성 |
| Symbolic runtime | 타입·기간·조건·그래프 실행기 | 최종 상태 계산과 보류 |
| Digital twin | 사용자 상태 그래프 + 이벤트 시뮬레이터 | 반사실 상태 delta 계산 |
| Adversarial audit | 반례·인용·버전·상충 검사 에이전트 | 통과·보류·차단 판정 |
| Decision UX | 정책 카드·상태 delta·근거·기관 연결 | 사용자가 이해하고 확인할 결과 |

### 핵심 데이터 객체

| 객체 | 핵심 필드 |
|---|---|
| PolicyVersion | policyId, authority, effectiveFrom, effectiveTo, sourceHash, clauses |
| PolicyIR | subjects, predicates, operators, exceptions, effects, evidenceSpans |
| Scenario | baseState, events, targetDate, affectedPolicies |
| AuditReport | failedClauses, counterexamples, citationGaps, versionConflicts, verdict |
| DecisionPacket | confirmed, unknowns, scenarioDelta, nextActions, providerLinks |

### 책임 경계

| AI | 결정론적 코드 |
|---|---|
| 문서·표·자유 형식 이벤트를 구조화 | Policy IR 스키마·타입·기간 검증 |
| 정책 후보·반례·테스트 케이스 제안 | 규칙 실행·중복·순서·상태 delta 계산 |
| 설명 초안과 질문 후보 생성 | 인용 span·버전·상충 여부 확인 |
| 감사 질문 생성 | 통과하지 못한 결과를 UNVERIFIED/BLOCKED로 보류 |

### E. 실패 중심 비교 시험

| ID | 의도적으로 만드는 실패 | 일반 RAG/규칙의 문제 | PolicyOS가 증명할 것 | 결과 상태 |
|---|---|---|---|---|
| C3-01 | 표의 예외 행을 본문과 반대로 배치 | 예외 누락 또는 잘못된 자격 | IR에 행·열·각주와 span을 함께 넣거나 보류 | UNVERIFIED |
| C3-02 | 구버전과 신버전의 소득 기준 충돌 | 최신 문서를 임의 선택 | 기준일별 PolicyVersion을 선택하고 변경 delta 표시 | UNVERIFIED |
| C3-03 | AI가 문법상 유효하지만 의미가 틀린 Policy IR 생성 | JSON 성공을 정답으로 오인 | symbolic runtime·반례 테스트가 거부 | UNVERIFIED |
| C3-04 | “다음 달 취업하면?” 이벤트 입력 | 현재 자격만 답하거나 근거 없는 예측 | affectedPolicies만 재실행하고 조건 delta 표시 | UNVERIFIED |
| C3-05 | 두 공고가 같은 정책을 다르게 제한 | 한 답변을 임의 확정 | Counterexample agent가 충돌을 제기하고 기관 확인으로 보류 | UNVERIFIED |
| C3-06 | 반려 통지의 날짜와 공고 기한 불일치 | 자유 문장 요약이 기한을 잘못 전달 | 날짜·정책 ID·원문 span 불일치 보류 | UNVERIFIED |
| C3-07 | 누락된 가구원·소득 기준일 | 빈칸을 추정하거나 평균값 사용 | Scenario를 실행하지 않고 필요한 질문 반환 | UNVERIFIED |
| C3-08 | 감사 에이전트가 틀린 반례를 주장 | 다수결만 믿으면 거짓 반례 채택 | 반례도 원문·실행 trace로 재검증 | UNVERIFIED |

측정 지표는 Policy IR 필드·의미 정확도, 원문 span 정밀도, 버전 선택 정확도, 반례 탐지율, unsupported 확정률, 시나리오 영향 범위 정확도, 보류 정밀도, 비용·지연, 사용자 근거 회상률이다. 현재 관측값은 없다.

### F. 면접용 STARR 보완안

### STARR-3: “JSON은 맞는데 정책 의미가 틀린” 컴파일러 실패

- Situation: 공고의 표·예외를 LLM이 구조화한 결과가 JSON 스키마는 통과했지만, 예외 행을 일반 조건으로 합쳐 합성 프로필의 결과를 뒤집는 상황.
- Task: 단순 파싱 성공이 아니라 정책 의미를 보존하는 실행 가능한 Policy IR을 만들고, 틀린 후보가 사용자 결정 패킷까지 도달하지 않게 하는 것.
- Action: layout-aware 후보 추출 → Policy IR → 자동 경계·예외 테스트 생성 → symbolic runtime 실행 → Counterexample agent 반례 → citation auditor 재검증 순서를 설계한다. 실패 후보는 폐기하고 원문 확인으로 돌린다.
- Result: 실제 정확도·오답 감소·처리 시간은 UNVERIFIED. 구현 후 C3-01/C3-03 로그로 기준선과 비교한다.
- Reflection: 스키마 준수와 의미 정확도는 다르다. [FormalBench](https://aclanthology.org/2025.acl-long.1068/)와 [Planetarium](https://aclanthology.org/2025.naacl-long.560/)이 시사하는 의미 검증 문제를 제품 테스트로 옮긴다.

### STARR-4: “취업하면?”을 현재 자격 답변으로 처리한 실패

- Situation: 기존 진단이 현재 프로필만 보고 “가능”을 반환해, 사용자가 다음 달 취업·이사 후 어떤 정책을 다시 확인해야 하는지 알 수 없는 상황.
- Task: 미래를 예언하지 않고, 사용자가 지정한 이벤트가 정책 조건과 증빙에 미치는 변화만 설명하는 것.
- Action: 자연어 이벤트를 Scenario로 구조화하고, PolicyVersion 기준일을 고정한 뒤 affectedPolicies만 재실행한다. 결과에는 상태 delta, 변경된 조항, 확인해야 할 기관을 함께 출력한다.
- Result: 실제 시나리오 정확도·과업 성공률·잘못된 행동 감소는 UNVERIFIED. C3-04 로그와 사용자 과업 시험으로 채운다.
- Reflection: 디지털 트윈은 금융 예측기가 아니라 정책 조건 변화의 가상 실행기다. 승인·지급·환수는 운영기관 판단으로 남긴다.

### STARR-5: 그럴듯한 답을 반대심문으로 뒤집은 실패

- Situation: 단일 LLM이 최신처럼 보이는 공고를 인용했지만, 다른 지역 공고의 예외와 기준일이 섞여 확정적인 안내를 만든 상황.
- Task: 답변을 더 유창하게 만드는 것이 아니라, 근거 없는 확정을 사용자에게 보여주지 않는 것.
- Action: Compiler agent의 후보를 Scenario agent가 실행하고, Counterexample agent가 상충·구버전·누락 조건을 생성하며, Citation auditor와 symbolic runtime이 반례를 재검증한다. 통과하지 못하면 DecisionPacket의 verdict를 UNVERIFIED/BLOCKED로 고정한다.
- Result: 실제 허위 확정률·보류 정밀도·비용은 UNVERIFIED. 단일 LLM·일반 RAG·PolicyOS를 같은 C3 케이스로 비교한다.
- Reflection: 다중 에이전트의 다수결이 진실을 보장하지 않으므로, 모든 반례에도 원문과 실행 trace를 요구한다.

이 STARR들은 “규칙을 하나 추가했다”가 아니라 **AI가 만든 실행 프로그램의 의미 오류를 재현하고, 반사실 실행과 적대적 검증으로 거부하는 아키텍처를 선택한 이유**를 설명하기 위한 설계다. 구현 전 Result를 확정하지 않는다.

### G. CANDIDATE-003의 남은 검증

- 실제 Policy IR 정답 주석과 규칙 실행기가 아직 없다.
- 공개 공고 3~5개만으로도 컴파일러·디지털 트윈·감사 루프가 연결되는지 아직 구현하지 않았다.
- 연구 문헌의 성능 수치는 Setup 성능이 아니다.
- 운영기관의 법적 판단·신청·지급·환수는 여전히 범위 밖이다.
- 대규모 다중 에이전트 비용, 지연, 동일 모델의 상관 오류는 측정 전이다.
- 결과가 보류되는 비율이 지나치게 높아도 사용자 가치가 떨어질 수 있다.

현재 상태: **CANDIDATE-003 설계 보완 완료, 독립 최종 검증 PASS, 구현·비교 실험은 아직 UNVERIFIED**.
