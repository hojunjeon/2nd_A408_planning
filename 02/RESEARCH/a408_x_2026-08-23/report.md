# A408 리서치 리포트

## 1. 범위와 방법

- 질문: 청년 정책·세제 혜택·예적금·대출 상환 기간/시기를 하나의 미래 자산 시뮬레이션으로 결합하는 서비스는 어떻게 설계해야 하는가.
- 기준일: 2026-08-23(Asia/Seoul). 대상: SSAFY 팀/심사위원, 구현조건: 기획 제외 6인 5주.
- 방법: 공식 정책/세제/금융상품/대출, 학술·기술·행동과학, 경쟁·사용자 행동, PRD 방법론의 4축 병렬 조사 후 교차검증.
- 제한: 로컬 참고 문서는 a408_초기기획.md와 AGENTS.md만 사용했다. 카드 할부 관련 내용은 전부 배제했다.

## 2. 축별 핵심 결과

### 공식 정책·세제·금융상품·대출 (A/B 중심)
- 온통청년 API는 개인 회원 인증키 승인 구조이며 JSON/XML 응답과 정책 메타데이터를 제공한다. 실호출 한도와 전체 필드 nullability는 UNVERIFIED다. 출처: https://www.data.go.kr/data/15143273/openapi.do (수정일 2025-05-09; 확인일 2026-08-23; A), https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide (확인일 2026-08-23; B).
- 청년월세지원은 19~34세 무주택 청년에 월 최대 20만원×최장 24개월이며 중위소득·자산 요건이 있다. 2026 신청은 계속사업으로 진행됐다. 출처: https://m.korea.kr/news/policyNewsView.do?newsId=148961092 (2026-03-19; B), https://www.bokjiro.go.kr/ssis-tbu/cms/pc/news/news/1309493_1114.html (2026-03-18; B).
- 국민취업지원제도 I유형은 성실 이행 시 월 60만원×최대 6개월 구직촉진수당을 지급하며 청년특례 소득·재산 요건이 있다. 출처: https://m.work24.go.kr/ua/z/z/1300/selectEmssRqutIntro.do (확인일 2026-08-23; B), https://moel.go.kr/news/achievements/view.do?bbs_seq=20260201211 (2026-02-26; B).
- 서울 청년수당은 월 50만원×최대 6개월 사례로 확인된다. 지자체별 일반화 금지. 출처: https://news.seoul.go.kr/gov/archives/578136 (2026-05-27; B).
- 청년도약계좌 신규가입은 2025년 말 종료, 후속 청년미래적금은 3년 만기·월 최대 50만원·비과세·정부기여금 일반형 6%/우대형 12%로 확인된다. 금리는 변수다. 출처: https://www.fsc.go.kr/po010106/87106 (2026-06-15; B), https://www.fsc.go.kr/po010107/87005 (2026-05-29; B).
- 월세 세액공제는 총급여 5,500만원 이하 17%, 초과~8천만원 이하 15%, 연 1천만원 한도다. 출처: https://www.law.go.kr/LSW/lsLawLinkInfo.do?chrClsCd=010202&lsJoLnkSeq=1000027473 (시행 2026-01-01; A).
- 연금저축 600만원, 연금저축+IRP 등 합산 900만원 한도에 12~15% 공제율이 적용된다. 출처: https://j.nts.go.kr/nts/cm/cntnts/cntntsView.do?cntntsId=7875&mi=6596 (확인일 2026-08-23; B).
- 청년형 ISA는 2026-08-23 기준 확정 상품값이 없어 예정 정책으로만 표기한다. 출처: https://www.korea.kr/briefing/actuallyView.do?newsId=148960220&pWise=main&pWiseMain=L1 (2026-03-03; B).
- 취업 후 상환 학자금대출은 2026-2학기 금리 1.70% 변동, 상환기준소득 총급여 3,037만원(소득금액 2,056만원) 고시, 기준 이하 유예와 초과분 상환율 적용이 확인된다. 출처: https://www.law.go.kr/LSW/admRulLsInfoP.do?admRulNm=2026%ED%95%99%EB%85%84%EB%8F%84+1%ED%95%99%EA%B8%B0+%EC%B7%A8%EC%97%85+%ED%9B%84+%EC%83%81%ED%99%98+%ED%95%99%EC%9E%90%EA%B8%88%EB%8C%80%EC%B6%9C%EC%9D%98+%EC%9E%90%EA%B2%A9+%EC%9A%94%EA%B1%B4+%EB%93%B1%EC%97%90+%EA%B4%80%ED%95%9C+%EA%B3%A0%EC%8B%9C&docType=JO&joNo=000300000&languageType=KO&paras=1 (시행 2026-07-01; A), https://www.kosaf.go.kr/ko/tuition.do?pg=tuition04_01_01 (2026학년도 2학기; B).
- 중도상환수수료는 2025-01-13 신규대출부터 실비용 산정체계가 시행됐고, 금융소비자보호법상 상환시기 설명 의무가 있다. 상품별 약관은 재확인 대상이다. 출처: https://fsc.go.kr/no010101/83833 (2025-01-09 게시, 2025-01-13 시행; B).

### 기술·학술·행동
- 일반 이자소득 원천징수는 소득세 14%+지방소득세 10%=15.4%로 모델링할 수 있으나 비과세·특례는 별도 입력이다. 출처: https://www.law.go.kr/lsLinkCommonInfo.do?lsJoLnkSeq=1017632265 (시행 2026-07-01; A).
- 원리금균등/원금균등 공식, APR·중도상환 개념, Decimal/numeric 금액 처리, 결정론적 엔진과 AI 분리 근거가 확보됐다. 출처: https://extension.colostate.edu/resource/long-term-loan-repayment-methods/ (reviewed 2025-08; A), https://www.postgresql.org/docs/current/datatype-numeric.html (2026-08; B), https://airc.nist.gov/airmf-resources/airmf/3-sec-characteristics/ (2023; A).
- 자동화·알림·주기적 목표 프레이밍은 저축 행동 개선 근거가 있으나 손실 프레이밍은 A/B 대상이다. 출처: https://academic.oup.com/qje/article-abstract/116/4/1149/1903159 (2001-11-01; A), https://pubsonline.informs.org/doi/pdf/10.1287/mnsc.2015.2296 (2016-01-19; A).

### 경쟁·사용자 행동
- 토스·뱅크샐러드는 연말정산/세금 조회·예적금 비교·대출 이자 계산기를 제공하지만, 정책+세제+상품+상환시점 통합 타임라인은 공개 자료에서 확인되지 않았다. 로그인 내부 기능은 UNVERIFIED다. 출처: https://toss.im/tossfeed/article/tossincome- (2024-12-04; B), https://www.banksalad.com/benefit/bridge/tax-refund/personal (확인일 2026-08-23; B).
- 2024 청년 삶 실태조사(n=15,098)는 평균 부채 1,637만원을 보고했고, 금융위 자료는 20대 금융이해력 62.6점과 상담 접근성 한계를 제시한다. 출처: https://www.opm.go.kr/opm/news/press1.do?articleNo=158583&attachNo=146521&mode=download (2025-03-11; B), https://www.fsc.go.kr/po010104/87218 (2026-06-30; B).
- 지역 조사에서 정보 부족 35.1%, 부채 상환 부담 61.4%가 보고됐으나 전국 일반화는 불가하다. 출처: https://www.youthspace5959.com/brd/view.do?brdKey=14342&key=1907297652508&pageIndex=1&sc=&sc_cate=&sw= (2025-12-26; B/C).

### PRFAQ/PRD/JTBD/서비스 표준
- 채택 구조: Working Backwards의 고객 가치 선검증 + Intercom Job Story + Atlassian PRD의 목표/가정/범위외 + GOV.UK의 전체 여정/성공지표/보안.
- 입력은 단계형 질문, 검토는 Check Answers 패턴, 금융 결과는 범위와 가정 노출이 공식 UX 근거로 확인됐다. 출처: https://d1.awsstatic.com/events/reinvent/2019/REPEAT_1_Working_backwards_Amazon%E2%80%99s_approach_to_innovation_ENT207-R1.pdf (2019; B), https://www.atlassian.com/agile/product-management/requirements/ (확인일 2026-08-23; B), https://www.intercom.com/blog/accidentally-invented-job-stories/ (2016-06-28; B), https://design-system.service.gov.uk/patterns/check-answers/ (확인일 2026-08-23; B).

## 3. 주요 UNVERIFIED/BLOCKED

- 온통청년 API 실인증 호출·트래픽 한도·전체 필드 nullability.
- 로그인 내 경쟁 앱 개인화 기능 및 전체 시장 무결합 단정.
- 청년형 ISA 확정 상품값.
- 은행별 금리·중도상환수수료율·전세대출 연장 조건.
- 지역 수당 전국 일반화.
- 한국 청년용 Monte Carlo 확률분포.

## 4. 결론

정책 스냅샷 + 사용자 프로필 + 현금흐름 + 결정론적 계산 엔진 + 시나리오 비교 UI + LLM 설명 계층이라는 최소 아키텍처가 근거와 6인 5주 제약 모두에 부합한다. 금리·세율·정책 조건은 사용자 입력과 갱신 가능한 정책 레코드로 두고, LLM은 계산 권한을 갖지 않아야 한다.
