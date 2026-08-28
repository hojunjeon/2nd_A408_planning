# Worker-C: 대안 행동과 공공 제공자 역할·제약

- **ticket**: T-03 / A-01
- **조사일**: 2026-08-22 (KST)
- **범위**: 한국 20~30대가 정책·금융 문제를 해결할 때 공개적으로 확인되는 검색, 커뮤니티, 비교표, 스크린샷·첨부, 스프레드시트/앱, 상담 흐름과 온통청년·복지로·정부24·공식 청년·금융 제공자의 데이터·신청·연결 경로
- **접근 규칙**: 로그인·CAPTCHA·유료벽·비공개 커뮤니티를 우회하지 않았다. 모든 링크는 공개 URL이며, 페이지의 문서 사실(`F`), 관찰 가능한 사용자 흐름 또는 1인 경험(`UX/E`), 연구자의 설계 추론(`I`)을 구분한다.
- **품질 등급**: `A` 정부·공공기관 원문/API/공식 안내, `A-` 공식 문서의 공공 미러, `B` 공개 커뮤니티·편집 글, `C` 개인 블로그·후기·판매자 페이지. 등급은 사실의 신뢰도이지 사용자 행동의 대표성을 뜻하지 않는다.

## 핵심 결론

1. 공개 근거에서 확인되는 실제 해결 흐름은 **검색/공고 확인 → 여러 제도 비교 → 자가진단 또는 상담 → 증빙·첨부 준비 → 운영기관에 신청하고 상태 확인**의 조합이다. 공식 포털이 이미 이 단계들을 부분적으로 제공하므로, 제공자를 경쟁자로 분류하면 안 된다.
2. 온통청년·복지로·정부24(보조금24)는 각각 정책/복지/공공서비스의 **원문·목록·자가진단·신청 연결**을 제공한다. 최종 자격·심사·지급은 대체로 각 운영기관/지자체/금융회사에 있다. Setup의 차별화 후보는 원문을 대체하는 추천이 아니라, 출처·기준일·변경·중복·다음 신청 단계와 사용자 체크리스트를 이어 주는 데이터/연결 계층이다.
3. API는 모두 같은 의미가 아니다. 온통청년 API는 회원가입·인증키 신청·담당자 승인 뒤 HTTPS/XML로 사용하고, 복지 중앙서비스 API는 목록·상세(대상·기준·신청방법) 조회용이며, 정부24 보조금 API는 공공서비스 목록·상세·지원조건 데이터 경로다. **실제 신청 권한을 부여하는 API라고 확인된 것은 없다.**
4. 금융 MyData는 스크래핑이 아니라 API 방식만 허용되고, 이용자 선택 동의·보안 심사·정보제공자별 연결이 전제된다. 따라서 현재 Setup 조사 단계에서는 은행/카드 비밀번호 수집이나 실계좌 자동연결을 전제하지 않고, 공개 API·사용자 입력·로컬 증빙을 우선한다.

## 1. 현재 공개적으로 보이는 대안 행동

| ID | 행동·문제 | 공개 문서에서 확인한 내용 | 근거 성격 | 출처·날짜·도메인·유형 | 품질 / 경계 |
|---|---|---|---|---|---|
| ALT-01 | 정책을 먼저 검색하고 맞춤 결과를 좁힘 | 국무조정실 공식 개통 자료는 구직 청년이 포털에서 정책을 찾았지만 관련 없는 정보가 많았고, 챗봇으로 자신에게 맞는 정책을 찾았다는 사례를 싣는다. 온통청년은 정책 검색·비교·신청자격 진단을 공식 기능으로 안내한다. | `UX/F`: 공식 자료에 적힌 사례와 기능. **반복률이나 만족도 조사는 아님.** | [국무조정실 온통청년 개통 보도자료 PDF](https://www.opm.go.kr/opm/news/press-release.do?articleNo=158539&attachNo=146452&mode=download), 2025-02-20 발표·2025-02-21 개통, `opm.go.kr`, 정부 보도자료; [온통청년 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout), 페이지 발행일 없음·2026-08-22 확인, `youthcenter.go.kr`, 공식 포털 | A. “정보가 너무 많다”는 공식 사례는 방향성 근거지만 청년 전체의 빈도로 확대하지 않는다. |
| ALT-02 | 커뮤니티 글·공고를 다시 찾아 수동 비교 | 공개된 취업 정보 글은 중앙/서울 청년월세 사업을 표로 비교하고, 복지로 자가진단 뒤 온라인 신청하라고 안내한다. 글은 조회수 1,439가 보이지만 독자의 실제 신청 성공·연령은 확인되지 않는다. | `E/UX`: 작성자가 재료를 표로 정리한 관찰 가능한 워크어라운드. 조회수는 노출 지표일 뿐 행동률이 아니다. | [링커리어 청년월세 비교 글](https://community.linkareer.com/employment_data/5633835), 2026-03-10 16:50, 조회 1,439, `community.linkareer.com`, 커뮤니티/편집 정보 글 | B. 공식 자격 판단은 복지로·운영기관 원문으로 재검증해야 한다. |
| ALT-03 | LLM에 조건을 넣어 예비판정한 뒤 공식 포털에 신청 | 개인 글은 나이·주거·소득·재산·부모 정보를 ChatGPT 프롬프트에 넣어 통과 여부와 서류를 받아 보라고 한 뒤 복지로에 신청하는 흐름을 보여준다. 글의 “1분/100%” 표현은 검증되지 않은 홍보 주장이다. | `E`: 공개 작성자의 워크어라운드. `I`: 민감정보를 외부 LLM에 넣는 위험과 규정 오판 가능성은 별도 안전 추론. | [청년월세 AI 자가진단 글](https://officework-ai.tistory.com/entry/2026-youth-rent-subsidy-ai-check), 2026-03-12, `officework-ai.tistory.com`, 개인 블로그/SEO 글 | C. 대표성·정확도·개인정보 처리의 근거가 없다. Setup은 이 글의 “100% 판정”을 재현하지 말고 공식 원문·확인 필요 항목을 표시해야 한다. |
| ALT-04 | 제출 전후 화면·스크린샷·첨부 파일로 완료 여부를 확인 | 서울시 공식 신청 안내서는 접수 완료 문구를 확인하고 마이페이지에서 신청 상태와 첨부 파일이 열리는지 확인하라고 안내한다. 모바일/Mac에서 업로드가 끝나기 전에 다음 단계로 진행될 수 있다는 운영상 주의도 문서화돼 있다. | `F/UX`: 제공자가 명시한 신청 UX·실패 방지 절차. 실제 발생률은 공개되지 않음. | [서울시 신청서 첨부·완료 확인 안내 PDF](https://soco.seoul.go.kr/coHouse/cmmn/file/fileDown.do?atchFileId=fba10a7affd347f189b4232d78f807fa&fileSn=3), 2023 안내서(정확한 게시일은 PDF 표지 확인 필요)·2026-08-22 확인, `soco.seoul.go.kr`, 서울시 공식 안내 | A. 스크린샷이 흔하다는 모집단 근거가 아니라, 제출 상태·첨부 검증이 사용자 흐름에 필요하다는 제공자 문서 근거다. |
| ALT-05 | 거래내역·예적금 만기를 Excel/앱/Notion에 수동 기록 | 공개 후기에는 20대 직장인이 Excel 가계부를 3개월 사용하며 거래를 모았다는 경험, 사회초년생이 예·적금 만기를 Excel로 관리했다는 경험, 앱·Excel을 병행하다 Notion 템플릿을 선택했다는 후기가 보인다. | `E`: 단일 작성자·구매자 후기. **사용자 경험이지 대표적 행동 통계가 아님.** | [Excel 가계부 20대 직장인 후기](https://trufflepigyoung.com/entry/%ED%98%B8%ED%98%B8%EC%96%91-%EC%97%91%EC%85%80%EA%B0%80%EA%B3%84%EB%B6%80-20%EB%8C%80%EC%A7%81%EC%9E%A5%EC%9D%B8-3%EB%8B%AC-사용-후기), 약 3.8년 전·2026-08-22 확인, `trufflepigyoung.com`, 개인 블로그; [가계부/예적금 Excel 공유](https://sunchip.tistory.com/entry/%EC%82%AC%ED%9A%8C%EC%B4%88%EB%85%84%EC%83%9D-%EC%98%88%EC%A0%81%EA%B8%88-%EA%B4%80%EB%A6%AC-%EC%97%91%EC%85%80-%EC%96%91%EC%8B%9D-%EB%AC%B4%EB%A3%8C-%EA%B3%B5%EC%9C%A0-%EA%B0%80%EA%B3%84%EB%B6%80-%EC%97%91%EC%셀-%EC%양식-공유-%EC%예%금-%EC%적%금-%EC%이%자-%EA%B4%80%EB%A6%AC-%EC%엑%셀-%EA%B3%B5%EC%9C%A0-%EA%B0%80%EA%B3%84%EB%B6%80-%EC%엑%셀-%EC%정%EB%A6%AC%EB%B2%95), 약 2.3년 전·2026-08-22 확인, `sunchip.tistory.com`, 개인 블로그; [Notion 가계부 구매 후기](https://gongysd.com/review/?bmode=view&idx=85201855), 2025-02-24, `gongysd.com`, 판매자 후기 | C. 선택·회고 편향이 크므로 “청년은 Excel을 쓴다”로 일반화하지 않는다. |
| ALT-06 | 사람이 조건을 상담하고 공식 경로로 연결 | 온통청년은 정책·취업·진로·면접 상담을 안내하고 전화 1670-1839를 공개한다. 서민금융진흥원은 청년이 소득·지출·자산을 진단한 뒤 1:1 대면/비대면 금융상담을 받고 3~5주 후속관리를 받을 수 있다고 안내한다. | `F`: 기존 상담 제공자의 서비스 범위. `I`: Setup은 상담을 대체하기보다 자료·질문·운영기관 연결을 준비하는 보조 역할로 두는 것이 안전함. | [온통청년 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout), 날짜 없음·2026-08-22 확인, `youthcenter.go.kr`, 공식 포털; [서민금융진흥원 청년 금융상담](https://www.kinfa.or.kr/financialLife/youthFinancialCounseling.do), 날짜 없음·2026-08-22 확인, `kinfa.or.kr`, 공식 기관 | A. 상담 수요 규모·상담 결과는 확인하지 않았다. |

### 대안 행동에 대한 판정

- **확인된 것**: 여러 포털의 검색·자가진단·신청, 커뮤니티의 수동 표 만들기, 공식 신청의 첨부/완료 확인, Excel·앱·Notion 같은 개인 기록, 사람이 하는 정책·금융 상담이 모두 공개 문서에 나타난다.
- **확인되지 않은 것**: 청년 전체가 이 순서를 따르는 비율, 커뮤니티/스크린샷/스프레드시트의 사용률, 각 대안의 신청 성공률·시간 절감·만족도. ALT-02~05는 공개된 선택 표본이다.
- **설계 추론(`I`)**: Setup이 제공할 수 있는 좁은 공백은 “정책 정보를 또 보여주기”가 아니라, 원문 URL·확인일·적용 기준·중복/순서·필요 첨부·운영기관 신청 링크·사용자 상태를 한 흐름으로 보존하는 것이다. 이는 사용자 조사로 확정된 결론이 아니라 위 문서의 결합에서 나온 가설이다.

## 2. 제공자별 데이터·신청·연결 경로와 제약

| ID | 제공자 / 역할 | 문서화된 기능·데이터 경로 | 문서화된 접근·법적 제약 | 근거 성격·품질 |
|---|---|---|---|---|
| P-01 | **온통청년** — 청년정책 정보·비교·진단·상담의 공공 연결원 | [소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout)는 정책 검색·비교·신청자격 진단, 청년센터 검색, 온·오프라인 상담 및 지원 연계를 안내한다. [정책 통합검색](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch)은 연령·소득·학력·취업·지역·분야로 검색·필터·비교하는 공개 UI다. | [OPEN API 이용방법](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide)은 회원 전용, 로그인→마이페이지→인증키 신청→담당자 심사·승인, HTTPS/XML이라고 명시한다. 부적절한 신청은 미승인될 수 있다. 공개 페이지는 JSON 즉시 호출이나 신청 API를 약속하지 않는다. | `F`: A. [공공데이터포털 온통청년 API](https://www.data.go.kr/data/15143273/openapi.do)는 한국고용정보원 제공, 정책 메타데이터·관리기관/연락처, XML·JSON, 2025-05-08 등록·2025-05-09 수정(포털 표시)을 안내한다. 무료·개방 라이선스라도 인증키·트래픽·운영 검토는 별도다. |
| P-02 | **온통청년 진단** — 예비 자격 확인원, 최종 결정기관 아님 | [진단 결과 주의](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch/pop/checkStep03)는 결과가 단순 참고용이고 법적 효력이 없으며 실제 신청 결과·증빙으로 쓸 수 없고 최종 판단은 정책 운영기관이라고 명시한다. | 공공 MyData 연계정보로 실시간 진단할 수 있으나, MyData로 확인할 수 없는 추가사항·참여제한 요건은 상세페이지/신청 사이트에서 확인해야 한다. 주민등록·취업상태 변경 시 결과가 바뀔 수 있다. | `F`: A. Setup 결과 화면은 “적합”을 확정 판정으로 표현하면 안 되고 기준시각·확인불가·운영기관 재확인을 보존해야 한다. |
| P-03 | **복지로** — 복지 정보·모의계산·복지멤버십·온라인 신청원 | [복지로 소개](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/intro/intro/info/01/index.html)는 중앙·지자체·민간 서비스 찾기, 소득·재산 항목 모의계산, 복지멤버십, 자격·지급·신청현황, 주민센터 방문 없는 온라인 신청과 구비서류 서식을 안내한다. | [개인정보처리방침](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/customer/site/01/index.html)은 신청·자격 확인·상담에 개인정보를 처리하고, 본인확인·가족정보를 위해 주민등록번호를 처리하되 시스템에 저장하지 않는다고 안내한다. 온라인 신청 파일 보유기간은 최종 수정일로부터 5년으로 표시된다. PASS/Naver/Kakao/Toss 등 인증 제공자와의 최소 정보 전달·즉시 파기도 문서화돼 있다. | `F`: A. 상세 검색 안내는 직접입력 또는 인증된 가구원·소득 연계를 설명하지만 8년 이상 된 페이지라 현재 UX는 재확인 필요. [2026 청년월세 안내](https://www.bokjiro.go.kr/ssis-tbu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661&wlfareInfoReldBztpCd=01)는 2026-03-30~05-29 신청, 복지로 온라인/주민센터 신청, 지자체 조사·결정·지급 경로를 보여준다. |
| P-04 | **복지로 데이터 API** — 중앙 복지서비스 조회원 | [한국사회보장정보원 중앙부처복지서비스 API](https://www.data.go.kr/data/15090532/openapi.do)는 복지로가 제공하는 중앙부처 서비스의 목록·상세 조회를 제공한다. 상세에는 지원대상·선정기준·신청방법이 포함된다. Base URL과 `NationalWelfarelistV001`/`NationalWelfaredetailedV001` 연산이 공개돼 있다. | REST/XML, 무료, 개발계정 100회, 운영은 활용사례 등록 뒤 트래픽 증가 신청, 실시간 업데이트, 개발·운영 자동승인으로 표시된다. 이는 **정보 조회 API**이지 복지 신청·심사 API라고 문서화돼 있지 않다. | `F`: A. 등록 2021-09-30, 2026-01-26 수정(공공데이터포털 표시). 현재 운영·트래픽은 바뀔 수 있어 호출 전 재확인 필요. |
| P-05 | **정부24·보조금24·혜택알리미** — 공공서비스 발견·기관 연결원 | [정부24 메인](https://www.gov.kr/portal/main)은 2026-08-22 확인 시 `https://plus.gov.kr`로 이동했다. 현재 포털은 민원 검색·신청·발급, 혜택알리미(나의 혜택·관심·발견·간편찾기·전체 혜택)를 노출한다. [혜택알리미 경로](https://plus.gov.kr/portal/benefitV2/benefitSrvcHelp/)도 공개돼 있다. | [공공서비스 상세 예](https://www.gov.kr/portal/rcvfvrSvc/dtlEx/B55190400005)는 자격·구비서류를 보여주고 실제 신청을 Work24 계정/사이트로 연결한다. 즉 정부24가 모든 서비스의 최종 신청기관은 아니다. `plus.gov.kr` 본문은 JS/리디렉션 때문에 정적 fetch가 제한돼 UI 세부 문구는 변동·UNVERIFIED다. | `F/UX`: A. URL 이전은 확인된 운영 상태. 실제 사용자 로그인 없는 맞춤 혜택 결과는 확인하지 않았다. |
| P-06 | **정부24 보조금 API** — 목록·상세·지원조건 데이터원 | [행정안전부 API 변경 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?originId=NOTICE_0000000004156)는 2025-06-13 `/gov24/v3/serviceDetail` 상세에 공무원 확인 구비서류·본인확인 필요 구비서류를 추가했고 URL은 변경 없다고 공지한다. [2021 API 개편 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?atchFileId=FILE_000000002438600&originId=NOTICE_0000000002221&pageIndex=2&searchCondition2=2)는 목록·상세·지원조건 3개 연산을 명시한다. | 2021 공지는 개편 당시 문서이고 “현행화되지 않은 정보가 포함”될 수 있다고 경고한다. 2025 공지로 상세 필드 변경은 확인되지만 현재 인증·트래픽·정확한 스키마와 신청 연결 방식은 이 조사에서 API 호출하지 않아 미검증이다. | `F`: A. 제공자·날짜·경로는 공식 공지. `I`: Setup은 해당 API를 발견·정규화에 사용하고 실제 신청은 링크로 넘기는 것이 안전하다. |
| P-07 | **서민금융진흥원(KINFA)** — 청년 금융상품·상담의 공식 연결원 | [청년미래적금](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do)은 19~34세, 월 최대 50만원, 3년, 정부기여·비과세와 참여 은행 앱 신청→자격 확인→통지→계좌 개설 흐름, 심사 4~6주를 안내한다. [청년 금융상담](https://www.kinfa.or.kr/financialLife/youthFinancialCounseling.do)은 소득·지출·자산 진단 후 1:1 상담·후속관리·1397 연결을 안내한다. | 계좌 신청은 KINFA 페이지가 직접 개설하는 것이 아니라 참여 은행 앱으로 연결된다. 심사기간·상품명·은행 목록은 시점별로 바뀐다. KINFA 상세 페이지는 2026-08-22 정적 fetch가 `Internal Error`여서 검색 노출·직접 URL만 확인한 항목을 **재검증 필요**로 둔다. | `F`: A(공식 기관/상품 페이지), 다만 현재 본문 fetch 제한. [청년도약계좌 운영 종료 페이지](https://www.kinfa.or.kr/financialProduct/youthLeapAccount.do)는 신규 가입이 2025-12-31까지였음을 보여주므로, 상품 상태를 고정값으로 저장하면 안 된다. |
| P-08 | **금융 MyData·공공 MyData** — 연결 가능성의 법·운영 경계 | [금융위원회 API 방식 전면시행 보도자료](https://www.fsc.go.kr/no010101/77182?curPage=124&srchBeginDt=&srchCtgry=&srchEndDt=%2F1000&srchKey=&srchText=) (2022-01-04)는 2022-01-05부터 금융 MyData 사업자가 스크래핑 없이 API 방식으로만 제공해야 하고, 민감정보 별도 동의·기능적합성·보안취약점 점검이 필요하다고 명시한다. 실제 통합조회는 사업자가 정보제공자와 각각 연결해야 한다. [공공 MyData 가이드 PDF](https://adm.mydata.go.kr/images/guide.pdf) (104쪽, 2026-08-21 확인)는 기관 신청·환경조사·서류·적합성/보안 검토 절차를 안내한다. | 이 근거는 Setup이 사용자의 금융 로그인 정보를 받아 임의 스크래핑해도 된다는 근거가 아니다. 어떤 허가·파트너십·기관 자격·심사기간이 Setup에 필요한지, 개인·학생 팀이 반드시 불가능한지는 이 조사에서 확정하지 않았다. | `F`: A. 규제·공식 가이드. `I`: MVP는 공개 API + 최소 사용자 입력 + 로컬/선택적 첨부로 시작해야 한다는 안전 설계 추론. |

## 3. 제공자를 사용하는 안전한 차별화 가설 (`I`, 확정 기능 아님)

1. **공식 원문을 대체하지 않는 출처 카드**: 정책/복지/금융 항목마다 제공자, 원문 URL, 확인 시각, 기준연도, 마감·변경 여부, `운영기관 최종 확인`을 저장한다. 온통청년 진단의 법적 면책을 그대로 반영해 “예비 확인”과 “신청 결과”를 다른 상태로 둔다.
2. **데이터→신청 연결**: 온통청년·복지로·보조금24 API/공개 페이지는 목록·상세·조건을 정규화하고, 실제 신청은 제공자가 공개한 신청 URL·은행 앱·주민센터·지자체로 딥링크한다. Setup이 신청 결과나 지급을 보증하지 않는다.
3. **중복·순서·증빙 체크리스트**: 중앙/지자체 사업과 금융상품의 중복 금지, 가구·기준연도·현재 상태, 필요한 첨부를 같은 화면에 비교한다. 제출 전 스크린샷을 강제 업로드하지 않고, 사용자가 선택한 로컬 메모/파일과 공식 완료 문구 확인을 분리한다.
4. **민감도 낮은 입력 우선**: 처음에는 연령대·지역·가구 유형·현재 수급·기준연도 같은 최소 입력/모의 프로필로 검색한다. 계좌·주민번호·부모 정보는 기본값으로 받지 않고, 운영기관이 요구하는 경우에도 왜 필요한지·어디로 전달되는지·보유기간을 먼저 표시한다.
5. **상담으로 넘길 때의 패킷**: 애매한 자격은 온통청년 1670-1839, 복지로 129/지역센터, KINFA 1397 등 공식 상담에 연결하고, 사용자가 이미 확인한 원문·질문·누락 증빙만 전달할 수 있는 요약을 만든다. 이는 상담기관을 대체한다는 뜻이 아니다.

## 4. 미검증·차단·변동 기록

- **UNVERIFIED — 대표성**: 공개 커뮤니티·개인 후기·공식 사례는 모집단 표본이 아니다. 검색·커뮤니티·스크린샷·Excel 사용률, 중단률, 성공률, 시간 절감은 계산하지 않았다.
- **UNVERIFIED — LLM 예비판정 정확도**: 개인 블로그의 “1분/100%” 주장은 실험·공식 검증이 없으며 설계 근거로 채택하지 않는다.
- **UNVERIFIED — API 실사용**: 온통청년 인증키 신청/승인, 복지로·정부24 운영계정 키 발급, 호출량·응답 스키마, 최신 정부24 API 인증은 이 공개 조사에서 실제 키를 발급하거나 호출하지 않았다. 외부 계정 생성·신청은 범위 밖이다.
- **UNVERIFIED — KINFA 페이지 본문**: 청년미래적금 상세 URL은 검색 결과로 상품 흐름을 확인했으나 2026-08-22 직접 정적 fetch가 `Internal Error`였다. 현재 금리·은행·신청기간은 신청 전 공식 페이지에서 다시 확인해야 한다.
- **UNVERIFIED — 복지로 인증 문구**: 오래된 상세검색 안내가 공동인증서를 요구한다고 설명하지만, 현재 복지로 개인정보정책은 여러 간편인증 사업자도 명시한다. 인증수단은 현재 신청 화면을 재확인하고 고정하지 않는다.
- **UNVERIFIED — MyData 사업 자격**: 기획서에 있는 특정 자본금·허가·학생팀 불가 주장은 이번 공식 자료만으로 확정하지 않았다. 확인된 사실은 API-only, 동의, 보안/기능 심사, 정보제공자별 연결, 공공 MyData 신청·검토 절차까지다.
- **BLOCKED — 로그인·비공개 커뮤니티**: 네이버 카페 등 로그인 필요 글, 회원 전용 댓글, CAPTCHA 페이지는 읽거나 우회하지 않았다. 따라서 실제 댓글·회원 행동을 사용자 경험 근거로 세지 않았다.
- **BLOCKED — 개인 금융 데이터**: 은행·카드·통신 계정에 접속하지 않았고, 주민번호·계좌·가족의 실제 데이터·스크린샷을 수집하지 않았다. MyData 연결 성공 여부나 실거래 기반 금융 추천 결과는 없다.
- **변동성**: 정책 마감일·혜택 수·상품 상태·정부24 도메인/메뉴·API 스키마·트래픽은 변할 수 있다. 모든 결과에 원문 확인일과 운영기관 링크를 남겨야 한다.

## 5. 직접 출처 장부

| URL | 문서 날짜 또는 페이지 상태 | domain | source_type | grade |
|---|---|---|---|---|
| [온통청년 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout) | 페이지 날짜 없음; 2026-08-22 확인 | `youthcenter.go.kr` | 공식 제공자 소개 | A |
| [온통청년 OPEN API 이용방법](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide) | 페이지 날짜 없음; 2026-08-22 확인 | `youthcenter.go.kr` | 공식 API 가이드 | A |
| [온통청년 자격진단 주의](https://www.youthcenter.go.kr/youthPolicy/ythPlcyTotalSearch/pop/checkStep03) | 결과 화면의 기준정보 예시는 2024-10-10; 페이지 2026-08-22 확인 | `youthcenter.go.kr` | 공식 진단 UI/주의문 | A |
| [온통청년 정책 API 공공데이터](https://www.data.go.kr/data/15143273/openapi.do) | 등록 2025-05-08; 수정 2025-05-09(포털 표시); 2026-08-22 확인 | `data.go.kr` | 공공데이터 API 메타데이터 | A |
| [국무조정실 온통청년 개통 보도자료](https://www.opm.go.kr/opm/news/press-release.do?articleNo=158539&attachNo=146452&mode=download) | 2025-02-20 발표; 2025-02-21 개통 | `opm.go.kr` | 정부 보도자료 PDF | A |
| [복지로 소개](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/intro/intro/info/01/index.html) | 페이지 날짜 없음; 2026-08-22 확인 | `bokjiro.go.kr` | 공식 포털 소개 | A |
| [복지로 개인정보처리방침](https://www.bokjiro.go.kr/ssis-tbu/cms/pc/customer/site/01/index.html) | 페이지 날짜 없음; 2026-08-22 확인 | `bokjiro.go.kr` | 공식 개인정보·처리 고지 | A |
| [복지로 중앙부처 복지서비스 API](https://www.data.go.kr/data/15090532/openapi.do) | 등록 2021-09-30; 수정 2026-01-26; 2026-08-22 확인 | `data.go.kr` | 공공데이터 API 메타데이터 | A |
| [복지로 2026 청년월세 상세](https://www.bokjiro.go.kr/ssis-tbu/twataa/wlfareInfo/moveTWAT52011M.do?wlfareInfoId=WLF00004661&wlfareInfoReldBztpCd=01) | 최종 수정 2026-04-23(검색 노출); 2026-08-22 확인 | `bokjiro.go.kr` | 공식 사업 상세·신청 안내 | A |
| [정부24 메인](https://www.gov.kr/portal/main) / [혜택알리미](https://plus.gov.kr/portal/benefitV2/benefitSrvcHelp/) | 2026-08-22 현재 `plus.gov.kr`로 이동 | `gov.kr`, `plus.gov.kr` | 공식 포털 UI | A |
| [정부24 외부 신청 연결 사례](https://www.gov.kr/portal/rcvfvrSvc/dtlEx/B55190400005) | 최종 수정 2026-02-03; 2026-08-21~22 확인 | `gov.kr` | 공식 서비스 상세/외부기관 연결 | A |
| [보조금24 API 필드 변경 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?originId=NOTICE_0000000004156) | 등록 2025-06-13; 2026-08-22 확인 | `data.go.kr` | 행정안전부 API 공지 | A |
| [정부24 API 개편 공지](https://www.data.go.kr/bbs/ntc/selectNotice.do?atchFileId=FILE_000000002438600&originId=NOTICE_0000000002221&pageIndex=2&searchCondition2=2) | 등록 2021-09-14; 2026-08-22 확인 | `data.go.kr` | 행정안전부 API 공지 | A (시점 주의) |
| [KINFA 청년미래적금](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do) | 2026-08-22 검색·직접 URL 확인; 본문 fetch Internal Error | `kinfa.or.kr` | 공식 금융상품·신청 경로 | A (재확인 필요) |
| [KINFA 청년 금융상담](https://www.kinfa.or.kr/financialLife/youthFinancialCounseling.do) | 페이지 날짜 없음; 2026-08-22 확인 | `kinfa.or.kr` | 공식 상담 서비스 | A |
| [KINFA 청년도약계좌 운영 종료](https://www.kinfa.or.kr/financialProduct/youthLeapAccount.do) | 신규 가입 2025-12-31까지; 2026-08-22 확인 | `kinfa.or.kr` | 공식 상품 상태 | A |
| [금융위 금융 MyData API 전면시행](https://www.fsc.go.kr/no010101/77182?curPage=124&srchBeginDt=&srchCtgry=&srchEndDt=%2F1000&srchKey=&srchText=) | 2022-01-04 | `fsc.go.kr` | 금융위원회 보도자료 | A |
| [공공 MyData 가이드 PDF](https://adm.mydata.go.kr/images/guide.pdf) | 104쪽; 2026-08-21 확인 | `adm.mydata.go.kr` | 공식 운영·신청 가이드 | A |
| [서울시 첨부·접수 완료 확인 안내 PDF](https://soco.seoul.go.kr/coHouse/cmmn/file/fileDown.do?atchFileId=fba10a7affd347f189b4232d78f807fa&fileSn=3) | 2023 안내서; 정확한 발행일 미확인; 2026-08-22 확인 | `soco.seoul.go.kr` | 서울시 공식 신청 안내 | A |
| [링커리어 수동 비교 글](https://community.linkareer.com/employment_data/5633835) | 2026-03-10; 조회 1,439 | `community.linkareer.com` | 공개 커뮤니티·편집 글 | B |
| [개인 LLM 자가진단 글](https://officework-ai.tistory.com/entry/2026-youth-rent-subsidy-ai-check) | 2026-03-12 | `officework-ai.tistory.com` | 개인 블로그 | C |
| [Excel 가계부 후기](https://trufflepigyoung.com/entry/%ED%98%B8%ED%98%B8%EC%96%91-%EC%97%91%EC%85%80%EA%B0%80%EA%B3%84%EB%B6%80-20%EB%8C%80%EC%A7%81%EC%9E%A5%EC%9D%B8-3%EB%8B%AC-사용-후기) | 약 3.8년 전; 2026-08-22 확인 | `trufflepigyoung.com` | 개인 경험 블로그 | C |
| [Notion/가계부 구매 후기](https://gongysd.com/review/?bmode=view&idx=85201855) | 2025-02-24 | `gongysd.com` | 판매자 고객 후기 | C |

## 검증 체크

- 프로젝트 브리프 `a408_기획.md`, 작업 범위 `TASK.md`, 상태 `state.json`을 확인했다.
- 이 파일 외의 프로젝트 파일은 수정하지 않았다. 공개 URL만 열었고 계정 생성·API 키 발급·신청·결제·게시·커밋을 하지 않았다.
- 결론에 사용한 강한 근거는 온통청년·복지로·정부24/행정안전부·금융위원회·KINFA·서울시의 공식 원문/API 문서다. 커뮤니티·후기·개인 블로그는 대안 행동의 사례와 가설로만 표시했다.

> URL 보정: Excel 가계부 경험의 직접 원문은 [호호양 엑셀가계부 - 20대 직장인 3달 후기](https://trufflepigyoung.com/entry/%ED%98%B8%ED%98%B8%EC%96%91-%EC%97%91%EC%85%80%EA%B0%80%EA%B3%84%EB%B6%80-20%EB%8C%80%EC%A7%81%EC%9E%A5%EC%9D%B8-3%EB%8B%AC-%EC%82%AC%EC%9A%A9-%ED%9B%84%EA%B8%B0)다. 이 URL은 2022-11-06 게시 원문으로 확인했다.
