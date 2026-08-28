# A408 미래 자산 시뮬레이션 리서치 보고서

- 기준일: 2026-08-23, Asia/Seoul
- 조사 질문: 청년 정책, 세제 혜택, 예·적금, 대출 상환 시점을 한 시간축에서 계산하는 서비스가 필요한가. 필요하다면 6인 5주 안에 어떤 범위와 기술로 검증할 수 있는가.
- 독자: SSAFY 6인 팀과 심사위원
- 결과물: `PLANNING/sol.md`의 사실 근거와 범위 결정
- 검증 표기: `VERIFIED`는 공식 원문 또는 독립 자료로 확인한 사실, `PARTIAL`은 적용 범위가 제한된 사실, `INFERENCE`는 확인된 사실에서 도출한 설계 추론, `UNVERIFIED`는 근거가 부족한 주장, `BLOCKED`는 현재 권한이나 자료로 진행할 수 없는 항목이다.
- 출처 등급: A는 법령·정부 원문·표준·동료평가 연구, B는 공식 서비스·제품·API 문서, C는 공신력 있는 산업 자료, D는 2차 분석, E는 경험담이다.

## 1. 조사 방법

조사는 서로 겹치지 않는 여섯 축으로 나눴다. 정책·세제, 금융상품·대출 규칙, 기술·학술, 경쟁 서비스·사용자 행동, 공개 PRD 방법론, 데이터·규제를 각각 독립 조사한 뒤 핵심 주장만 교차검증했다. 변동 금리와 모집 일정은 기준일 스냅샷으로만 기록했고 미래 값은 고정하지 않았다. 공식 페이지에서 기능을 확인했더라도 실제 계정, 실제 API 응답, 실제 심사 결과까지 검증하지 못한 경우에는 런타임 성공으로 보지 않았다.

재현 절차는 다음과 같다.

1. 기준일을 고정하고 정책명, 시행일, 신청 기간, 지급 기간을 분리해 검색한다.
2. 정부 부처 또는 법령 원문을 1차 출처로 확보한다.
3. 운영기관 안내나 다른 공식 자료로 금액·자격·예외를 대조한다.
4. 상품 금리는 공시일과 확인일을 별도 필드로 기록한다.
5. API는 문서 존재와 실제 호출 성공을 구분한다.
6. 서비스 기능은 공개 페이지에서 확인한 범위만 기록한다.
7. 계산식은 독립 계산 자료와 대조할 수 있는 형태로 정의한다.
8. 규제 항목은 학생 팀의 데모와 공개 상용 서비스의 경계를 구분한다.

## 2. 실행 결론

서비스 기회는 있다. 온통청년·정부24·복지로는 정책 탐색과 맞춤 안내를, 금융상품 한눈에는 상품 비교를, 토스와 한국장학재단은 대출 조건 또는 상환 계산을 공개 기능으로 제시한다. 그러나 조사한 공개 기능 범위에서는 정책 수혜, 세제 효과, 저축 수익, 대출 비용을 같은 월별 원장에 넣어 결합 효과를 설명하는 단일 서비스가 확인되지 않았다. 이는 시장 전체의 부재를 증명한 결론이 아니라 공개 기능을 비교한 `INFERENCE`다. 출처: [온통청년](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout)(확인 2026-08-23, B), [정부24 혜택알리미](https://plus.gov.kr/portal/benefitV2/)(확인 2026-08-23, B), [금융상품 한눈에 관련 금융위원회 자료](https://www.fsc.go.kr/no010101/83693)(2024-12-23, A), [토스 대출 안내](https://toss.im/tossfeed/article/toss-loan)(2020-08-20, B), [한국장학재단 대출 비교](https://www.kosaf.go.kr/ko/tuition.do?pg=tuition03)(확인 2026-08-23, B).

문제도 수치로 확인된다. 2024 전국민 금융이해력 조사에서는 성인 총점이 65.7점이었고 20대의 금융행위 점수가 상대적으로 낮았다. 2024년 청년의 삶 실태조사 잠정 집계는 만 19~34세 15,098명을 조사해 평균 개인소득 2,625만원, 평균 부채 1,637만원, 월평균 생활비 213만원을 보고했다. 서로 다른 조사 수치를 한 표본처럼 결합해서는 안 된다. 출처: [한국은행·금융감독원 금융이해력 조사](https://www.bok.or.kr/portal/bbs/B0000502/view.do?depth=201265&menuNo=201265&nttId=10091152&programType=newsData&relate=Y)(2025-04-29, A, `VERIFIED`), [국무조정실 청년의 삶 실태조사](https://m.korea.kr/briefing/pressReleaseView.do?newsId=156678299)(2025-03-11, A, KOSIS 확정 전 `PARTIAL`).

구현 방향은 단순하다. 정책 자격과 금액은 버전이 있는 결정론적 규칙이 판단하고, LLM은 원문에서 후보 필드를 추출해 검토 대기열에 넣거나 확정된 계산 결과를 쉬운 말로 설명한다. NIST는 생성형 AI의 그럴듯한 오류와 인용 검증, 인간 검토 필요성을 별도로 다룬다. 출처: [NIST AI RMF 1.0](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10)(2023-01-26, A), [NIST 생성형 AI 프로필](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf)(2024-07-25, A, `VERIFIED`).

6인 5주 MVP는 전국 모든 정책과 실계좌 연동을 포기해야 성립한다. 청년월세, 월세액 세액공제, 청년미래적금 규칙 3개와 시나리오당 적금 1개·고정금리 일반 대출 1개, 세 사용자 시나리오에 집중한다. 온통청년 API와 Finlife API가 지연되면 공식 원문을 수동 검수한 스냅샷으로 전환한다. 이 범위 결정은 기술 조사와 독립 실행성 검토에서 도출한 `INFERENCE`다.

## 3. 정책·세제 근거

### 3.1 청년월세 지원

청년월세 지원사업은 2026년 계속사업으로 전환됐다. 2026년 신규 신청 기간은 3월 30일부터 5월 29일까지였고, 19~34세 부모와 별도 거주 무주택 청년을 대상으로 청년가구·원가구 소득과 재산 요건을 적용한다. 실제 납부 월세 중 월 최대 20만원을 최대 24회 지원한다. 2027년 이후 요건과 신청 기간은 확정값으로 복사하지 않는다. 출처: [복지로 공식 안내](https://blog.bokjiro.go.kr/m/1828)(2026-03-24, B), [KDI에 수록된 국토교통부 자료](https://eiec.kdi.re.kr/policy/materialView.do?num=278145)(2026-03-18, B, `VERIFIED`).

주거급여의 월차임분과 지자체 지원은 지급액에서 차감되거나 중복 제한을 받을 수 있다. 중앙 운영지침 전체를 직접 확보하지 못했으므로 이 상호작용은 `PARTIAL`로 둔다. 출처: [2026 사업 운영 매뉴얼](https://www.sangju.go.kr/opencenter/jfile/readFile.tc?fileId=JF00000001672&fileSeq=1)(2026-03, C).

### 3.2 국민취업지원제도

국민취업지원제도 Ⅰ유형 구직촉진수당은 2026년 1월 1일부터 월 60만원, 최대 6개월이다. 청년특례는 15~34세를 기본으로 하며 병역기간을 반영하고, 중위소득·재산 기준과 예산에 따른 선발 조건이 있다. Ⅱ유형을 같은 현금수당으로 계산하면 안 된다. 출처: [고용노동부 2026 안내](https://www.moel.go.kr/news/cardinfo/view.do?bbs_seq=20251201443)(2025-12-24, A), [고용24 신청 안내](https://m.work24.go.kr/ua/z/z/1300/selectEmssRqutIntro.do)(확인 2026-08-23, B), [관련 법률](https://www.law.go.kr/LSW/lsInfoP.do?lsiSeq=253641)(확인 2026-08-23, A, `VERIFIED`).

### 3.3 월세액 세액공제

2026년 7월 1일 시행 법령 기준으로 월세액 세액공제는 과세기간 말 무주택 세대주 또는 일정 조건의 세대원, 총급여 8천만원 이하 근로자를 대상으로 한다. 연 월세 1천만원 한도에서 총급여 5,500만원 이하이면 17%, 그 초과 8천만원 이하이면 15%를 적용한다. 세액공제는 현금 지원과 다르며 산출세액을 초과한 금액이 자동 환급된다고 계산해서는 안 된다. 출처: [국세청 안내](https://www.nts.go.kr/nts/cm/cntnts/cntntsView.do?cntntsId=239025&mi=40634)(확인 2026-08-23, A), [조세특례제한법 제95조의2](https://law.go.kr/LSW/lsSideInfoP.do?docCls=jo&joBrNo=02&joNo=0095&lsiSeq=280409&urlMode=lsScJoRltInfoR)(시행 2026-07-01, A, `VERIFIED`).

### 3.4 청년주택드림청약통장

주택청약종합저축 소득공제와 청년주택드림청약통장의 비과세는 서로 다른 요건과 한도를 가진다. 소득공제는 납입액 일부가 과세표준에서 빠지는 구조이고, 비과세는 이자소득 과세를 면제하는 구조다. 가입일, 소득, 무주택, 세대 상태, 중도해지 시점을 따로 저장해야 한다. 출처: [정부 정책 안내](https://www.korea.kr/news/policyNewsView.do?newsId=148937414)(2024-12-16, A, 상품 안내 `PARTIAL`), [조세특례제한법 제87조](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1029034365)(시행 2026-07-01, A, 세제 `VERIFIED`).

### 3.5 청년미래적금

청년미래적금은 2026년 6월 22일 출시됐다. 3년 자유적립식, 월 최대 50만원, 일반형 6%·우대형 12% 정부기여금, 이자소득 비과세 구조다. 최초 신청과 계좌 개설은 기준일 전에 끝났으며 이후 모집 일정은 확정 공고가 아니므로 `UNVERIFIED`다. 은행금리는 취급기관이 정하므로 정책 고정값으로 저장하지 않는다. 출처: [금융위원회 출시 안내](https://www.fsc.go.kr/no010101/87106)(2026-06-15, A), [서민금융진흥원 상품 안내](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do)(확인 2026-08-23, A), [조세특례제한법 제91조의25](https://law.go.kr/LSW/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1032244659)(시행 2026-07-01, A, `VERIFIED`).

### 3.6 근로장려금

근로장려금은 귀속연도 소득, 가구 유형, 재산 기준일, 신청일, 지급일이 서로 다르다. 예금과 주식, 전세금은 재산에 포함되고 부채는 재산에서 빼지 않으므로 저축과 장려금을 독립 항목처럼 단순 합산해서는 안 된다. 출처: [국세청 2025 귀속 정기분 안내](https://www.nts.go.kr/nts/na/ntt/selectNttInfo.do?mi=&nttSn=1350768)(2026-04-30, A), [조세특례제한법 관련 조문](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1021384271)(시행 2026-07-01, A, `VERIFIED`). MVP에는 상호작용 검증 비용이 커서 고도화 후보로 두는 편이 안전하다.

## 4. 예·적금과 대출 규칙

일반 이자소득의 소득세 원천징수세율은 14%이며, 개인지방소득세 특별징수액은 그 소득세의 10%다. 두 세율을 적용한 통상 계산에서는 15.4%가 쓰인다. 개별 비과세 상품은 별도 법령 요건을 충족할 때만 적용한다. 출처: [국세청 이자·배당소득 안내](https://www.nts.go.kr/nts/cm/cntnts/cntntsView.do?cntntsId=7914&mi=40359)(확인 2026-08-23, A), [지방세법 제103조의13](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1031061107)(시행 2026-07-01, A, `VERIFIED`).

2026년 6월 신규취급액 기준 예금은행 저축성수신금리는 3.08%, 대출금리는 4.31%였다. 이는 시장 평균 참고치이며 특정 사용자의 상품 금리가 아니다. 출처: [한국은행 가중평균금리](https://www.bok.or.kr/portal/bbs/B0000501/view.do?depth=201264&menuNo=201264&nttId=11063198&oldMenuNo=201150&programType=newsData&relate=Y)(2026-07-28, A, `VERIFIED`). 계산에는 사용자가 입력하거나 기준일이 붙은 상품 스냅샷을 쓴다.

2025년 9월 1일부터 보호대상 예·적금은 금융기관별 1인당 원금과 소정의 이자를 합해 1억원까지 보호된다. 운용실적에 따라 금액이 변하는 상품은 같은 방식으로 보호되지 않는다. 출처: [금융위원회 Q&A](https://www.fsc.go.kr/po020201/84975)(2025-07-22, 시행 2025-09-01, A), [찾기쉬운 생활법령정보](https://www.easylaw.go.kr/CSP/CnpClsMain.laf?ccfNo=3&cciNo=1&cnpClsNo=1&csmSeq=1771)(기준 2026-07-15, B, `VERIFIED`).

대출 계산은 원금과 이자를 매 기간 분리한다. 상환 기간을 늘리면 월 부담은 줄 수 있지만 총이자가 커질 수 있다. 출처: [CFPB 상환 구조 안내](https://www.consumerfinance.gov/ask-cfpb/what-is-amortization-and-how-could-it-affect-my-auto-loan-en-771/)(검토 2024-09-24, A), [CFPB 주택대출 안내](https://www.consumerfinance.gov/ask-cfpb/how-does-paying-down-a-mortgage-work-en-1943/)(검토 2024-05-28, A, `VERIFIED`).

금융소비자보호법 적용 금융회사의 2025년 1월 13일 이후 신규 대출에는 중도상환수수료 산정 시 실제 비용만 반영하도록 제도가 개편됐다. 대출일부터 3년 이내 상환에는 예외적으로 부과될 수 있고 실제 요율, 면제 기간, 산식은 상품별 계약조건이므로 사용자 입력값으로 받아야 한다. 출처: [금융위원회 개편 안내](https://www.fsc.go.kr/po010101/83833)(2025-01-09, 시행 2025-01-13, A, `VERIFIED`).

취업 후 상환 학자금대출은 일반 원리금 스케줄과 구분한다. 2026학년도 2학기 금리는 1.70% 변동금리였고, 소득이 발생한 시점부터 소득수준에 따라 상환한다. 미래 학기 금리는 고정하지 않는다. 출처: [한국장학재단 취업 후 상환 안내](https://www.kosaf.go.kr/ko/tuition.do?naviParam=HD%2C01%2C02%2C02%2C01&pg=tuition04_01_01)(2026학년도 2학기, A), [교육부 고시 목록](https://www.moe.go.kr/boardCnts/list.do?boardID=337&m=030307&page=1)(2026-07-01, A, `VERIFIED`).

## 5. 데이터와 규제

온통청년 API는 청년정책·청년공간 데이터를 HTTPS/XML로 제공하지만 회원가입, 인증키 신청, 담당자 승인이 필요하다. 실제 키 발급과 응답 스키마는 이번 조사에서 실행하지 않았으므로 런타임은 `UNVERIFIED`다. 출처: [온통청년 API 가이드](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide)(확인 2026-08-23, B), [API 제공목록](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiDoc/47)(확인 2026-08-23, B).

금융공공데이터 API는 인증키가 필요하고 원천 데이터보다 늦게 갱신될 수 있다. Finlife 문서 URL은 2026-08-24 검사 환경에 따라 2xx와 TLS timeout이 엇갈렸고 키 발급·실제 endpoint도 실행하지 못했다. 문서 접근과 런타임을 모두 `UNVERIFIED`로 둔다. 출처: [금융위원회 데이터 안내](https://www.fsc.go.kr/in060101)(확인 2026-08-23, B), [금융위원회 API FAQ](https://www.fsc.go.kr/in060501)(확인 2026-08-23, B), [Finlife 문서 후보 URL](https://finlife.fss.or.kr/finlife/main/contents.do?menuNo=700029)(재검사 2026-08-24, 접근 불안정).

금융 마이데이터는 금융위원회 허가 대상이다. 현행법은 본인신용정보관리업 허가에 5억원 이상 자본금과 사업계획·전문성 등 요건을 둔다. 학생 팀이 자체 사업자가 되는 경로는 MVP에서 제외한다. 출처: [신용정보법 제4조](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1025127947)(시행 2026-08-13, A), [제6조](https://law.go.kr/LSW/lsLawLinkInfo.do?chrClsCd=010202&lsJoLnkSeq=900210785)(시행 2026-08-13, A, `VERIFIED`).

개인정보 보호법은 처리 목적의 명확화와 최소 수집, 적법한 수집·이용 근거, 보유기간 종료 뒤 파기, 안전조치를 요구한다. MVP는 주민등록번호, 계좌번호, 은행 인증정보, 거래 원문을 받지 않고 계산에 필요한 집계값만 다룬다. 출처: [개인정보 보호법 제3조](https://law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1025128625), [제15조](https://law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1029335387), [제21조](https://law.go.kr/LSW/lsSideInfoP.do?docCls=jo&joBrNo=00&joNo=0021&lsiSeq=270351&urlMode=lsScJoRltInfoR), [제29조](https://law.go.kr/LSW/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1029332029)(모두 시행 2025-10-02, A, `VERIFIED`).

금융상품 광고·중개·자문 해당 여부는 서비스 문구, 제휴, 계약 관여 방식에 따라 달라진다. MVP는 수수료성 제휴, 가입 실행, 승인 암시, 우열 추천을 제외한다. 공개 배포 전에 개별 법률 검토가 필요하며 그전에는 `BLOCKED`다. 출처: [금융소비자보호법 제22조](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1031294935)(시행 2026-01-02, A), [금융위원회 법령해석](https://better.fsc.go.kr/fsc_new/replyCase/LawreqDetail.do?lawreqIdx=3668&muGpNo=75&muNo=171&stNo=11)(2022-06-24, A, `PARTIAL`).

## 6. 기술·학술 근거

시간축 계산은 미래 현금흐름의 발생 시점을 보존해야 한다. 현재가치와 미래가치, 명목금리와 실질금리를 혼용하면 안 된다. 출처: [NIST 생애주기비용 매뉴얼](https://www.nist.gov/publications/life-cycle-costing-manual-federal-energy-management-program)(2022-04-13, A), [현금흐름 가치평가 연구](https://link.springer.com/article/10.1057/s11369-024-00374-2)(2024-09-11, A, `VERIFIED`).

정책 규칙은 기간과 출처를 가진 결정표로 저장할 수 있다. DMN은 결정표와 충돌 처리 방식을 표준화하고, 연구에서는 규칙의 중복·누락을 검출하는 방법이 제시됐다. 다만 5주 MVP에 DMN 플랫폼을 도입할 필요는 없다. 단순 JSON 조건 트리와 테스트가 더 작다. 출처: [OMG DMN 1.4](https://www.omg.org/spec/DMN/1.4)(2023-04, A), [결정표 검증 연구](https://doi.org/10.1016/j.is.2018.01.010)(2018-11, A, 사실 `VERIFIED`, 도입 제외는 `INFERENCE`).

정책 원문, 구조화 규칙, 계산 결과의 연결은 출처 신뢰에 직접 영향을 준다. W3C PROV-O는 원자료, 생성 활동, 책임 주체를 연결하는 표준 어휘를 제공한다. MVP는 전체 표준을 구현하지 않고 `source_url`, `source_hash`, `rule_version`, `engine_version`, `input_hash`만 저장한다. 출처: [W3C PROV-O](https://www.w3.org/TR/prov-o/)(2013-04-30, A, `VERIFIED`).

행동과학 근거는 절제해서 쓴다. 실행 의도 연구는 언제·어디서·어떻게 행동할지를 정하는 계획이 목표 달성에 영향을 줄 수 있다고 보고했지만 한국 청년의 금융 행동으로 직접 일반화할 수 없다. 금융역량 개입의 효과도 결과지표와 연구 설계에 따라 달랐다. 출처: [Implementation Intentions 메타분석](https://www.sciencedirect.com/science/article/abs/pii/S0065260106380021)(2006, A, `PARTIAL`), [금융역량 체계적 문헌고찰](https://www.campbellcollaboration.org/review/improving-financial-capability-financial-behaviour-financial-access/)(2022-03-15, A, `VERIFIED`). 제품 성과를 실제 자산 증가로 약속하지 않고 이해도와 계획 저장을 측정한다.

## 7. 경쟁 서비스와 공백

| 서비스 | 공개 확인 기능 | 이번 서비스가 추가할 층 | 검증 |
|---|---|---|---|
| 온통청년 | 정책 검색·비교, 자가진단, 상담 연결 | 수혜·세제·저축·대출의 월별 결합 | [공식 소개](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout), 확인 2026-08-23, B, `VERIFIED` |
| 정부24 혜택알리미 | 개인 상황에 따른 혜택 탐색 | 미래 현금흐름과 상품·부채 연결 | [공식 서비스](https://plus.gov.kr/portal/benefitV2/), 확인 2026-08-23, B, `VERIFIED` |
| 복지로 | 조건 상세검색과 모의계산 | 세후 순자산 변화의 시간축 | [상세검색 안내](https://www.bokjiro.go.kr/nwel/html/detailSearchTip.html), 확인 2026-08-23, B, `VERIFIED` |
| 금융상품 한눈에 | 예·적금과 대출 조건 비교 | 정책 자격과 세후 결과의 결합 | [금융위원회 자료](https://www.fsc.go.kr/no010101/83693), 2024-12-23, A, `VERIFIED` |
| 토스 | 대출 비교와 상환 계산 공개 안내 | 정책·세제 이벤트와 동일 원장 계산 | [공식 안내](https://toss.im/tossfeed/article/toss-loan), 2020-08-20, B, `VERIFIED` |
| 한국장학재단 | 학자금대출 유형·상환·이자계산 | 취업·정책·저축 전환 시나리오 | [대출 비교](https://www.kosaf.go.kr/ko/tuition.do?pg=tuition03), 확인 2026-08-23, B, `VERIFIED` |

공백은 서비스별 공개 기능을 비교한 결과다. 내부 기능이나 비공개 실험까지 조사하지 못했으므로 “국내 유일”이라고 표현하지 않는다.

## 8. 공개 기획 방법론 벤치마크

Amazon Working Backwards는 구현 전에 고객 관점의 1페이지 보도자료와 고객·내부 FAQ를 작성해 가치, 위험, 자원, 제외 결정을 검토한다. 이번 기획은 한 문장 제품 정의와 PRFAQ, `GO/CUT/BLOCKED` 게이트를 앞에 둔다. 대기업용 승인 절차는 복사하지 않는다. 출처: [AWS Product Management](https://aws.amazon.com/executive-insights/content/product-management-at-amazon/)(확인 2026-08-23, B), [AWS 공식 PDF](https://d1.awsstatic.com/executive-insights/en_US/product-management-ebook.pdf)(2023, B, `VERIFIED`).

Atlassian PRD는 목표·성공지표·가정·옵션·사용자 스토리·제외 범위·미해결 질문을 한 문서에서 관리한다. 이번 문서는 요구사항 추적표와 수용 기준을 채택한다. Jira·Confluence 연동은 필요하지 않다. 출처: [Atlassian PRD 템플릿](https://www.atlassian.com/software/confluence/templates/product-requirements/), [PRD 가이드](https://www.atlassian.com/agile/product-management/requirements)(확인 2026-08-23, B, 내용 `VERIFIED`, 게시일 `UNVERIFIED`).

Intercom JTBD는 인구통계만으로 사용자를 설명하지 않고, 특정 상황에서 이루려는 진전과 행동을 중심으로 문제를 정의한다. 이번 문서는 하나의 핵심 Job Story와 세 자격·현금흐름 유형을 함께 쓴다. 정책 적격성은 인구·소득 조건을 실제로 쓰므로 페르소나를 완전히 버리지 않는다. 출처: [Intercom JTBD 실무](https://www.intercom.com/blog/videos/who-are-you-building-for/)(2016-06-14, B), [문제 우선 제품 원칙](https://www.intercom.com/blog/intercom-product-principles-start-with-the-problem/)(2022-10-05, B, `VERIFIED`).

GOV.UK Service Standard는 사용자 필요, 전체 여정, 단순성, 접근성, 개인정보, 성공지표, 적합한 기술, 신뢰성을 함께 점검한다. 이번 문서는 이를 안전·품질 게이트로 쓰되 GOV.UK 인증을 받았다고 표현하지 않는다. 출처: [Service Standard](https://www.gov.uk/service-manual/service-standard)(확인 2026-08-23, A), [적용 지침](https://www.gov.uk/service-manual/service-assessments/how-to-apply-the-service-standard)(게시 2019-05-08, 갱신 2021-06-10, A, `VERIFIED`).

## 9. 재현 가능한 구현 검증 절차

### PoC 순서

1. 온통청년 API 키를 신청하고 정책 3건의 XML을 파싱한다. 3일 안에 응답을 받지 못하면 공식 원문 스냅샷으로 전환한다.
2. Finlife API 키를 신청한다. 3일 안에 실제 응답을 확보하지 못하면 상품 2건을 수동 검수한다.
3. 대출 상환 방식 두 개를 외부 데이터 없이 구현하고 독립 계산과 원 단위로 대조한다.
4. 정책·세제·상품 규칙을 JSON 조건 트리로 분리한다.
5. 같은 입력과 같은 규칙 버전이 같은 결과를 내는지 확인한다.
6. 모든 결과에서 출처, 기준일, 가정, 규칙 버전, 불확실성을 연다.
7. LLM 설명을 끄더라도 핵심 데모가 완성되는지 확인한다.

### 조사·갱신 프롬프트 템플릿

```text
기준일 {YYYY-MM-DD}에 {정책/상품명}의 공식 현행 조건을 확인한다.
법령·정부·운영기관 원문만 사용한다.
자격, 산식, 한도, 신청기간, 지급시기, 시행기간, 예외, 상호배제,
게시일/시행일/확인일, 직접 URL을 JSON으로 반환한다.
근거가 하나뿐이면 PARTIAL, 확정 공고가 아니면 UNVERIFIED로 표시한다.
미래 금리와 모집 일정은 추정하지 않는다.
```

```text
입력 규칙과 원문 문장을 대조한다.
금액·비율·날짜·연령·소득·재산·지역·가구·중복 제한을 한 항목씩 검사한다.
원문에 없는 규칙은 삭제 후보로, 서로 충돌하는 규칙은 NEEDS_REVIEW로 표시한다.
승인 전에는 활성 규칙으로 전환하지 않는다.
```

## 10. 핵심 주장 검증표

| ID | 주장 | 상태 | 근거 | 제품 반영 |
|---|---|---|---|---|
| C01 | 2026 청년월세 사업은 계속사업이며 월 최대 20만원, 최대 24회다 | VERIFIED | [복지로](https://blog.bokjiro.go.kr/m/1828), 2026-03-24; [KDI에 수록된 국토부 자료](https://eiec.kdi.re.kr/policy/materialView.do?num=278145), 2026-03-18 | 월별 정책 이벤트 |
| C02 | 국민취업지원 Ⅰ유형 수당은 2026년 월 60만원, 최대 6개월이다 | VERIFIED | [고용노동부](https://www.moel.go.kr/news/cardinfo/view.do?bbs_seq=20251201443), 2025-12-24; [고용24](https://m.work24.go.kr/ua/z/z/1300/selectEmssRqutIntro.do), 확인 2026-08-23 | 고도화 후보, MVP 계산 제외 |
| C03 | 월세 세액공제는 연 월세 1천만원 한도, 15% 또는 17%다 | VERIFIED | [법령](https://law.go.kr/LSW/lsSideInfoP.do?docCls=jo&joBrNo=02&joNo=0095&lsiSeq=280409&urlMode=lsScJoRltInfoR), 시행 2026-07-01; [국세청](https://www.nts.go.kr/nts/cm/cntnts/cntntsView.do?cntntsId=239025&mi=40634), 확인 2026-08-23 | 세액 한도 내 연간 이벤트 |
| C04 | 청년미래적금은 출시됐고 3년·월 50만원·기여금 6%/12% 구조다 | VERIFIED | [금융위원회](https://www.fsc.go.kr/no010101/87106), 2026-06-15; [서민금융진흥원](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do), 확인 2026-08-23 | 원금·기여금·이자 분리 |
| C05 | 후속 모집 일정은 기준일에 확정되지 않았다 | UNVERIFIED | [최초 모집 이후 공식 자료](https://admin.korea.kr/multi/visualNewsView.do?newsId=148969939&pWiseMinistry=ministryNews&repCodeType=%EC%A0%95%EB%B6%80%EB%B6%80%EC%B2%98&repCode_C=C00003), 2026-08-13 | 자동 가입 가정 금지 |
| C06 | 상품 금리와 중도상환 조건은 계약·기준일마다 달라진다 | VERIFIED | [한국은행](https://www.bok.or.kr/portal/bbs/B0000501/view.do?depth=201264&menuNo=201264&nttId=11063198&oldMenuNo=201150&programType=newsData&relate=Y), 2026-07-28; [금융위원회](https://www.fsc.go.kr/po010101/83833), 2025-01-09 | 사용자 입력·스냅샷 |
| C07 | 온통청년 API는 승인 절차가 있다 | VERIFIED | [공식 가이드](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide), 확인 2026-08-23 | 3일 전환 기준 |
| C08 | Finlife 문서 접근과 API 런타임은 이번 조사에서 확인하지 못했다 | UNVERIFIED | [공식 문서 후보 URL](https://finlife.fss.or.kr/finlife/main/contents.do?menuNo=700029), 2026-08-24 2xx·TLS timeout 혼재, 실제 API 호출 안 함 | 필수 경로에서 제외 |
| C09 | 자체 금융 마이데이터 사업은 허가 요건이 있다 | VERIFIED | [신용정보법](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1025127947), 시행 2026-08-13 | 실계좌 연동 제외 |
| C10 | 공개 기능 비교에서 월별 결합 시뮬레이션이 확인되지 않았다 | INFERENCE | [온통청년](https://www.youthcenter.go.kr/youthIntro/introduce/introAbout), 확인 2026-08-23; [정부24](https://plus.gov.kr/portal/benefitV2/), 확인 2026-08-23; [금융위원회](https://www.fsc.go.kr/no010101/83693), 2024-12-23; [토스](https://toss.im/tossfeed/article/toss-loan), 2020-08-20; [한국장학재단](https://www.kosaf.go.kr/ko/tuition.do?pg=tuition03), 확인 2026-08-23 | 공개 기능 범위의 차별화 가설, 사용자 검증 필요 |
| C11 | LLM은 자격·금액의 최종 결정에서 제외한다 | 설계 결정 | [NIST GAI Profile](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf), 2024-07-25 | 추출 후보·설명만 담당 |
| C12 | 시나리오가 한국 청년의 실제 자산을 늘린다 | UNVERIFIED | 직접 인과 근거 없음. [금융역량 개입 문헌고찰](https://www.campbellcollaboration.org/review/improving-financial-capability-financial-behaviour-financial-access/), 2022-03-15 | 성과 약속 금지 |

## 11. 한계와 미해결 항목

### UNVERIFIED

- 청년미래적금 추가 모집 일정, 취급기관별 최신 금리·우대조건 전체
- 2027년 이후 청년월세 요건과 모집 기간
- 국민취업지원제도와 다른 복지사업 사이 모든 소득 산정 조합
- 온통청년 API의 실제 응답 필드, 호출 한도, 갱신주기
- Finlife API의 키 발급, 실제 응답 스키마, 호출량
- 모든 대출상품의 중도상환 요율과 면제조건
- 정책 문서 자동 추출의 한국어 정확도와 인용 누락률
- 시나리오 UI가 실제 저축·부채 결과를 개선한다는 인과효과

### BLOCKED

- 허가 또는 계약 없이 실사용자 계좌·대출 정보를 자동 조회하는 기능
- 증빙과 기관 심사 없이 개인의 정책 수혜·대출 승인을 확정하는 기능
- 개별 법률 검토 전에 개인화 상품 추천·중개를 포함한 공개 서비스 운영
- 국내 전체 시장에 같은 기능이 없다는 완전한 부재 증명

### 최종 링크·범위 검사

- 2026-08-24 자동 GET 검사 대상은 고유 URL 76개였다.
- 1차 자동검수에서 72개는 2xx로 응답했고 미해결 리다이렉트와 404는 0건이었다.
- 4개는 자동접근 제한 403을 반환했다. 해당 원문은 조사 도구에서 내용을 확인했다: Campbell Collaboration 1개, CFPB 2개, ScienceDirect 1개.
- 독립 환경에서는 Finlife 문서 후보 URL의 TLS timeout이 재현됐다. 접근 상태와 API 런타임을 `UNVERIFIED`로 기록했다.
- 최종 문서, 보고서, 상태 파일의 금지 범위 키워드는 0건이었다.

## 12. 링크된 참고문헌

### 정책·세제·금융

- [복지로, 2026 청년월세 지원](https://blog.bokjiro.go.kr/m/1828), 2026-03-24.
- [고용노동부, 2026 국민취업지원제도](https://www.moel.go.kr/news/cardinfo/view.do?bbs_seq=20251201443), 2025-12-24.
- [국세청, 월세액 세액공제](https://www.nts.go.kr/nts/cm/cntnts/cntntsView.do?cntntsId=239025&mi=40634), 확인 2026-08-23.
- [국가법령정보센터, 조세특례제한법 제95조의2](https://law.go.kr/LSW/lsSideInfoP.do?docCls=jo&joBrNo=02&joNo=0095&lsiSeq=280409&urlMode=lsScJoRltInfoR), 시행 2026-07-01.
- [금융위원회, 청년미래적금](https://www.fsc.go.kr/no010101/87106), 2026-06-15.
- [서민금융진흥원, 청년미래적금](https://www.kinfa.or.kr/financialProduct/youthFutureSavings.do), 확인 2026-08-23.
- [한국은행, 금융기관 가중평균금리](https://www.bok.or.kr/portal/bbs/B0000501/view.do?depth=201264&menuNo=201264&nttId=11063198&oldMenuNo=201150&programType=newsData&relate=Y), 2026-07-28.
- [금융위원회, 예금보호한도](https://www.fsc.go.kr/po020201/84975), 2025-07-22.
- [금융위원회, 중도상환수수료 개편](https://www.fsc.go.kr/po010101/83833), 2025-01-09.
- [한국장학재단, 2026학년도 2학기 학자금대출 금리](https://www.kosaf.go.kr/ko/tuition.do?naviParam=HD%2C01%2C02%2C01%2C05&pg=tuition13), 확인 2026-08-23.

### 데이터·규제·기술

- [온통청년 API 가이드](https://www.youthcenter.go.kr/cmnFooter/openapiIntro/oaiGuide), 확인 2026-08-23.
- [금융위원회 금융공공데이터](https://www.fsc.go.kr/in060101), 확인 2026-08-23.
- [신용정보법 제4조](https://www.law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1025127947), 시행 2026-08-13.
- [개인정보 보호법 제3조](https://law.go.kr/lsLinkCommonInfo.do?chrClsCd=010202&lsJoLnkSeq=1025128625), 시행 2025-10-02.
- [NIST AI RMF 1.0](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10), 2023-01-26.
- [NIST 생성형 AI 프로필](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf), 2024-07-25.
- [OMG DMN 1.4](https://www.omg.org/spec/DMN/1.4), 2023-04.
- [W3C PROV-O](https://www.w3.org/TR/prov-o/), 2013-04-30.

### 사용자·산업·기획 방법론

- [한국은행·금융감독원, 2024 전국민 금융이해력 조사](https://www.bok.or.kr/portal/bbs/B0000502/view.do?depth=201265&menuNo=201265&nttId=10091152&programType=newsData&relate=Y), 2025-04-29.
- [국무조정실, 2024년 청년의 삶 실태조사](https://m.korea.kr/briefing/pressReleaseView.do?newsId=156678299), 2025-03-11.
- [AWS, Product Management at Amazon](https://aws.amazon.com/executive-insights/content/product-management-at-amazon/), 확인 2026-08-23.
- [Atlassian, PRD Template](https://www.atlassian.com/software/confluence/templates/product-requirements/), 확인 2026-08-23.
- [Intercom, Who are you building for?](https://www.intercom.com/blog/videos/who-are-you-building-for/), 2016-06-14.
- [GOV.UK, Service Standard](https://www.gov.uk/service-manual/service-standard), 확인 2026-08-23.
