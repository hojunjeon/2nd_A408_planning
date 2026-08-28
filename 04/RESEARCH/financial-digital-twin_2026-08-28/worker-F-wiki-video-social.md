# worker-F — 나무위키/위키 · 영상 · 공개 SNS 축

## axis

축 F: 대중적 이해(위키/용어) + 게이미피케이션 선행사례에 대한 공개 사용자 반응.
목표는 기획서가 이미 쓰고 있는 주장 — "Fortune City는 기록량에 보상해서 오히려
지출을 유발하는 부작용이 사용자 리뷰로 확인된다" — 의 실제 근거를 찾는 것.

**결론 먼저: 이 주장은 현재 확보된 공개 자료로 뒷받침되지 않는다.**
상세는 fortune_city_evidence 및 claims 절 참조. 기획서 문장은 수정이 필요하다.

예산 소진으로 우선순위 1(Fortune City 반응)만 수행했고, 2~4(위키/영상/국내 앱테크)는
미착수 상태로 unverified_or_blocked 에 명시했다.

## queries_run

| # | query | 상태 |
|---|-------|------|
| 1 | Fortune City app review "spend more" gamification side effect | 결과 확보 |
| 2 | Fortune City Fourdesire reddit review personal finance app city building | 결과 확보 |
| 3 | Fortune City app store review daily building motivation log expenses | 결과 미도달 |
| 4 | Fortune City Google Play Best App 2017 award / Red Dot 2018 | 결과 미도달 |

쿼리 3·4는 실행되었으나 결과가 이 세션에 도달하지 않았다. 따라서 수상 이력과
App Store 개별 리뷰 원문은 미검증으로 처리한다.

## sources

| title | URL | date | platform | type | grade |
|-------|-----|------|----------|------|-------|
| Fortune City: Expense Tracker — Ratings & Reviews | https://apps.apple.com/us/app/fortune-city-expense-tracker/id1172713884?see-all=reviews | 미확인 | App Store | 리뷰 목록(페이지 존재만 확인, 개별 리뷰 원문 미독) | E |
| Gamified expense tracker app (r/ADHD) | https://www.reddit.com/r/ADHD/comments/1auba8p/gamified_expense_tracker_app/ | 미확정 | Reddit | 커뮤니티 스레드 | E |
| Community App Suggestions: Budgeting Apps (r/androidapps) | https://www.reddit.com/r/androidapps/comments/a1tdka/community_app_suggestions_budgeting_apps/ | 미확정 | Reddit | 커뮤니티 스레드 | E |
| What app do you use to track cash spendings? (r/AskReddit) | https://www.reddit.com/r/AskReddit/comments/18i9or1/what_is_the_app_youre_using_to_track_your_cash/ | 미확정 | Reddit | 커뮤니티 스레드 | E |
| Free money management app (r/adhdwomen) | https://www.reddit.com/r/adhdwomen/comments/1gnybjv/free_money_management_app/ | 미확정 | Reddit | 커뮤니티 스레드 | E |
| Fortune City — SPARKFUL Support | https://sparkful.app/help/apps/fortune-city | 미확인 | 벤더 공식 | 제품 문서 | D |
| Fortune City — Gamified Expense Tracker | https://sparkful.app/fortune-city | 미확인 | 벤더 공식 | 제품 소개 | D |
| Fortune City — A Finance App (Google Play) | https://play.google.com/store/apps/details?id=com.fourdesire.fortunecity | 미확인 | Google Play | 스토어 등재 + 리뷰 | D/E |

게시일은 대부분 미확정이다. Reddit 스레드 날짜는 원문 타임스탬프를 직접 읽지
않았으므로 기재하지 않았다. 발표 인용 시 날짜를 임의로 추정해 쓰지 말 것.

## fortune_city_evidence

### (a) 리텐션 긍정 반응 — 건물 때문에 매일 지출을 기록/점검하게 된다

부분 확보. 방향은 지지되지만 인용문 수준의 근거는 아직 없다.

- r/androidapps Budgeting Apps 스레드 요지: 게이미피케이션이 기록의 지루함을 줄이고,
  주택·상점·공공건물을 세우는 것이 지출을 꾸준히 기록할 이유를 준다. YNAB 같은 완전한
  예산 시스템은 아니지만 돈이 어디로 가는지 파악하는 데 도움이 된다는 평.
  → https://www.reddit.com/r/androidapps/comments/a1tdka/community_app_suggestions_budgeting_apps/
  → 주의: 위 문장은 검색 엔진이 스레드를 요약한 내용이며 개별 댓글 원문을 직접 읽지
    않았다. 따라서 인용문으로 쓸 수 없고 커뮤니티 전반의 평 수준으로만 쓸 수 있다.
- r/adhdwomen 요지: 반복 거래·저장된 항목 기능이 반복 입력 부담을 줄인다.
  → https://www.reddit.com/r/adhdwomen/comments/1gnybjv/free_money_management_app/
- r/AskReddit 요지: 은행 계좌 연동이 필요 없는 수동 입력이 프라이버시 측면에서
  선호되며, 무료 버전만으로 장기간 사용했다는 사용자가 있다.
  → https://www.reddit.com/r/AskReddit/comments/18i9or1/what_is_the_app_youre_using_to_track_your_cash/

정리: 기록 습관 형성에 효과적이라는 리텐션 방향의 반응은 복수 커뮤니티에서 일관되게
나타난다. 그러나 매일 접속해서 지출을 점검한다는 구체적 사용자 증언 문구는 확보하지
못했다. 확보한 것은 기록을 지속할 이유를 준다 수준이다.

### (b) 부작용 증언 — 도시를 키우려고 오히려 돈을 쓰게 된다

**UNVERIFIED — 이 축의 가장 중요한 발견.**

검색 결과는 이 부작용을 문서화된 사실이 아니라 이론적 위험으로 명시적으로 규정했다.
원문 표현: 이 현상은 "a plausible behavioral risk, not a documented finding that
Fortune City causes overspending."

즉 "사용자 리뷰로 확인된다"는 기획서의 서술은 현재 근거가 없다.

실제로 확보된 인접 비판은 다음이며, 모두 지출 유발과는 다른 문제다.

- "game first, expense tracker second" — 가계부보다 게임이 앞선다는 평. r/ADHD 스레드에
  대한 검색 요약이 이 표현을 리뷰 묘사로 제시했다. 원문 댓글 직접 확인은 못 했다.
  → https://www.reddit.com/r/ADHD/comments/1auba8p/gamified_expense_tracker_app/
- 수집 메커니즘이 중독적(addictive)이라는 반응.
- 일정 기간 사용 후 pay-to-play 로 느껴진다는 사용자 보고(광고·유료 기능 부각).
- 계정 간 이체 불가, 잔액 수동 조정 불가, 카테고리 제한, 데이터 내보내기 부재 등
  기능적 한계. → https://play.google.com/store/apps/details?id=com.fourdesire.fortunecity

한편 벤더 공식 문서에 따르면 Fortune City는 예산(budgets), 지출 카테고리,
wants versus needs 도구를 제공한다. 즉 "기록량만 보상한다"는 단순화도 엄밀하지 않다.
→ https://sparkful.app/help/apps/fortune-city

기획서 권고 — 아래 중 하나로 문장을 바꿀 것.

1. (안전) Fortune City는 기록 자체를 게임 진행과 연결한다. 사용자 반응에서는 기록 습관
   형성 효과가 반복적으로 확인되는 반면, 게임이 가계부보다 앞선다는 비판도 함께
   나타난다. 계획 준수가 아닌 기록량이 보상의 축이 되면 보상이 목표에서 이탈할 수
   있다는 것이 셋업의 설계 출발점이다.
2. (설계 논증 전환) 부작용을 사실 주장이 아니라 보상 설계상의 구조적 위험으로 서술하고,
   셋업이 페이스 준수에 보상을 주는 이유로 연결한다.

어느 쪽이든 "사용자 리뷰로 확인된다"는 표현은 삭제해야 한다.

### 수상 이력 검증 (2017 Google Play 올해의 앱 / 2018 Red Dot)

**UNVERIFIED.** 해당 검색 쿼리의 결과가 이 세션에 도달하지 않았다. Google Play 올해의 앱
수상 여부, Red Dot Award 수상 연도·부문 모두 확인하지 못했다. 발표 자료에 수상 이력을
쓰려면 반드시 재조사가 필요하다. 확인 경로: Red Dot 공식 수상자 검색(red-dot.org),
Fourdesire/SPARKFUL 공식 프레스 페이지, Google Play Best of 2017 공식 발표 아카이브.

## wiki_summaries

**BLOCKED — 미착수.** 나무위키 "디지털 트윈", 위키백과 Digital twin(한/영) 조사를
수행하지 못했다.

참고로 남기는 가설(검증 필요, 인용 금지): 디지털 트윈은 통상 제조·플랜트·스마트시티
맥락에서 정의되므로, 금융/개인 소비에 쓸 때 청중이 먼저 떠올리는 이미지와 불일치할
가능성이 크다. 이 가설은 조사로 확인되지 않았다.

## videos

**BLOCKED — 미착수.** digital twin finance, 디지털 트윈 금융, 가계부 앱 게이미피케이션,
Fortune City 리뷰 영상 조사를 수행하지 못했다. 조회수·게시일을 포함해 어떤 영상도
인용 가능한 상태가 아니다.

## korea_gamification_reactions

**BLOCKED — 미착수.** 토스 만보기/행운퀴즈, 카카오뱅크 돈나무, 신한 쏠퇴크에 대한 사용자
반응, 특히 "게임과 내 소비가 무관하다"는 비판의 실존 여부를 확인하지 못했다.

이 항목은 셋업의 차별화 논증(기존 앱테크는 보상이 소비 행동과 분리되어 있다)에 직접
연결되므로 후속 조사 우선순위 1순위로 남긴다.

## terminology_guidance

아래는 조사 결과가 아니라 확보된 근거의 한계에서 도출한 서술 전략 권고다.

- 위키 조사가 미완료이므로 발표에서 디지털 트윈의 정의를 인용 형태로 제시하지 말 것.
  정의를 단정하면 청중의 제조업 프레임과 충돌했을 때 방어할 근거가 없다.
- 용어를 쓰려면 먼저 우리 정의를 주고 그다음 용어를 붙이는 순서가 안전하다. 예: "예산
  계획과 실제 소비 페이스를 도시 상태로 1:1 대응시킨 화면" → "이걸 디지털 트윈이라고
  부른다" 순서. 역순은 오해를 부른다.
- 가장 안전한 대안: 디지털 트윈을 핵심 용어로 승격하지 않고 "소비 상태의 시각적
  대응물" 같은 기능 서술을 주 표현으로 쓰고, 디지털 트윈은 비유로만 1회 언급.
- Fortune City와의 차별화는 보상의 대상으로 말할 것: 기록량이 아니라 계획 준수(예산 대비
  페이스). 이건 두 제품의 공개된 설계 차이로 설명 가능하며 미검증 부작용 주장에
  의존하지 않는다.

## claims

| # | claim | 근거 | grade | 발표 사용 가능? |
|---|-------|------|-------|----------------|
| C1 | Fortune City는 지출 기록을 도시 건설 게임 진행과 연결한 가계부 앱이다 | 벤더 공식 + 복수 커뮤니티 | D | 사용 가능 |
| C2 | 게이미피케이션이 기록 습관 지속에 도움이 된다는 사용자 반응이 복수 커뮤니티에 존재한다 | r/androidapps, r/adhdwomen, r/AskReddit (검색 요약 경유) | E | 조건부 — 커뮤니티 반응 수준으로만 |
| C3 | 게임이 가계부보다 앞선다는 비판이 존재한다 | r/ADHD (검색 요약 경유) | E | 조건부 — 원문 재확인 후 |
| C4 | Fortune City가 실제 지출을 증가시킨다는 것이 리뷰로 확인된다 | 없음. 검색 결과가 documented finding 아님이라고 명시 | — | **사용 금지. 기획서 수정 필요** |
| C5 | Fortune City는 기록량만 보상한다 | 반증됨 — 벤더 문서에 예산·카테고리·wants vs needs 존재 | D | **사용 금지(단순화 오류)** |
| C6 | Fortune City 2017 Google Play 올해의 앱 / 2018 Red Dot 수상 | 확인 실패 | — | **사용 금지. 재조사 필요** |
| C7 | 디지털 트윈의 대중적 연상은 제조/스마트시티다 | 미조사 가설 | — | 사용 금지 |

## unverified_or_blocked

- **UNVERIFIED**: Fortune City 도시 키우려고 돈을 쓴다 부작용 증언 — 실존 증거 없음.
  검색 결과는 이를 이론적 위험으로만 규정. 기획서의 해당 주장은 수정 대상.
- **UNVERIFIED**: 2017 Google Play 올해의 앱, 2018 Red Dot 수상 이력 — 쿼리 결과 미도달.
- **UNVERIFIED**: 모든 Reddit 스레드의 정확한 게시일. 원문 타임스탬프 미확인.
- **UNVERIFIED**: App Store 개별 리뷰 원문 및 평점 수치. 리뷰 페이지 URL만 확인.
- **UNVERIFIED**: 인용문으로 제시된 표현들(game first expense tracker second, pay-to-play)의
  원문 여부. 모두 검색 엔진 요약을 경유했으며 원 댓글 직접 확인 안 됨.
- **BLOCKED(미착수)**: 우선순위 2 위키/나무위키, 3 영상, 4 국내 앱테크 게이미피케이션 반응.
- 조회수·별점·수상연도 등 수치는 확인된 것이 없어 이 문서에 기재하지 않았다.

### 후속 조사 시 최소 3건

1. 국내 앱테크(토스·카카오뱅크·신한) 사용자 반응 — 차별화 논증에 직결.
2. Fortune City 수상 이력 1차 출처 — 발표에 쓸 경우 필수.
3. r/ADHD·r/androidapps 스레드 원문 직접 열람 — C2·C3를 인용 가능 등급으로 승격.
