# Setup 기획 보강 리서치 리포트 (RESEARCH/setup_bolgang_2026-08-22)

- 실행일: 2026-08-22 · 방법: insane-research 스킬(opencode 개조판, `.opencode/skill/insane-research/SKILL.md`)에 따라 병렬 스카우트 + 직접 웹리서치 혼합
- 트랙1(신규 문제→신기능): general 스카우트(bg_3c51c6c8) · 트랙2(기술 한계·고도화)·트랙3(AI 자동화): 부모 에이전트 직접 수행(라우팅 제약으로)
- 출처 등급: A=공식통계/1차 자료, B=공식 문서/보도자료, C=전문 분석, D=2차 분석/커뮤니티, E=소셜 일화
- 원기획 4대 핵심 기능은 유지하며 보강만 수행 (AGENTS.md 규칙 준수)

## 트랙 1 — 신규 문제 발굴 → 신기능 + 기술 설계

| 신규 문제 | 핵심 근거(등급) | 제안 기능 | 기술 설계 요약 |
| --- | --- | --- | --- |
| 청년 금융사기 취약 | 기관사칭 피해자 52%가 20~30대, 평균 피해액 7,438만원(+76.3%) (mt.co.kr 2025-09-19, A) | 사기 문자 지킴이 Agent | 기존 SMS 파싱 인프라 재활용 + 기관사칭 패턴 룰 + FAISS 유사 수법 검색, PUSH 경보 |
| 놓치는 환급·장려금 | 근로장려금 20대 이하 23%(192만 가구), 원클릭 환급 신청률 29.9% (joongang 2026-06-25 / daum 2025-09-30, A) | 숨은 돈 찾기 체크리스트 | 국세청 공개 자료 RAG + 자가입력 기반 공제 가능성 점검(추정 고지 필수) |
| 구독료·통신비 낭비 | OTT 평균 1.8개 구독 월 10,990원 vs 적정 인식 7,968원; 해지 절차 불만 84.3% (asiae 2026 / insightkorea, C/B) | 구독·통신비 다이어트 진단 | 구독 목록 자가입력 → 광고형 전환·결합 할인 비교 계산, 해지는 링크 유도 |
| 학자금 ICL 상환 부담 | 미상환비율 19.4% 역대 최고, 1인당 체납 141만원 (yna 2026-04-12, A) | ICL 상환 길잡이 시뮬레이터 | 장학재단 고시 RAG + 결정론적 의무상환 추정 계산식, 유예/자발상환 시나리오 비교 |
| 전세·보증금 리스크 | 피해자 3만 6,950건 중 청년 76%, HUG 사고액 2년 9조원 (heraldcorp/khan, A) | 내 보증금 지킴이 체크리스트 | 지역별 피해 통계 + 확정일자·보증보험 점검 가이드(개별 권리 판단 아님 명시) |
| N잡 소득 파편화 | 부업자 67.9만 명 5년 연속 증가, 배달기사 소득 -44% (chosun/mk, A) | 내 일감 장부(N잡 통합관리) | 플랫폼별 입금 수동 입력 → 월별 합산·소득유형 분류 가이드, 컷오프 엔진과 데이터 공유 |

## 트랙 2 — 기존 구현 기술의 한계 → 고도화 방안

| 대상 기술 | 한계(근거) | 고도화 방안 |
| --- | --- | --- |
| LlamaParse/Vision HWP 파싱 | LangChain에 HWP 로더 없음, PDF 변환 시 표 구조 손실(병합셀·페이지跨 표·투명 표·특수문자 OCR 오류) (velog pjg9606; synapsoft.co.kr 2026-01-06 B/C) | HWPX 원본 XML 직접 파싱(KS X 6101, python zipfile+ET), HWP 단독 공고는 오픈소스 파서(HWP-MCP류)/Upstage Document Parse 폴백 추가, GT 정답셋 30~50건 실측 |
| FAISS/RAG 자격 판정 | GPT-4o 실험에서 숫자 규칙(소득·자산 한도) plain prompting 정확도 0%, RAG 컨텍스트 누락 시 그럴듯한 오류 생성, 구조화 템플릿 없이 불안정 (digitalgovernmenthub.org 2025-09-04 A) | Policy Compiler: JSON 스키마 룰 저장소 + 원문 span 저장, 판정 코어는 결정론적 룰엔진, RAG는 검색 보조로 강등, GraphRAG/지식그래프 선택 보강 |
| Android SMS/PUSH 감지 | Doze 모드 네트워크·CPU 지연, WorkManager 최대 15분 딜레이, OEM 배터리 최적화(삼성 절전 앱·샤오미·화웨이)는 Doze와 무관하게 프로세스 종료, FCM high priority 남용 시 강등 (pushwoosh 2026-05-26 B/C; developer.android.com B) | 최초 실행 시 배터리 최적화 예외 안내 인앱 프롬프트(제조사별 경로), FCM priority high 절제 사용, 온디바이스 1차 파싱 후 금액·기관·일자만 전송(신용정보 동의 이슈 동시 완화) |
| "환각 0%·100% 정확" 주장 | 법률 RAG도 hallucination-free 입증 불가 (Stanford Legal_RAG_Hallucinations 2024-05-24 A) | 문구를 "GT 정답셋 대비 측정값 + UNVERIFIED 플래그"로 교체 |

## 트랙 3 — AI 대체·자동화 기회 매트릭스

| 현행 방식 | AI 대체안 | 선례(근거) | 난이도 | 데모 효과 |
| --- | --- | --- | --- | --- |
| 룰 하드코딩된 자격 조건 관리 | LLM structured output으로 공고 → JSON 룰 초안 추출 + 사람 검수(human-in-the-loop) | Digital Gov Hub Rules-as-Code 실험(A): 템플릿+검수 전제 시 성공 | M | "공고문이 스스로 코드가 된다" 시연 |
| 경보 PUSH 원샷 | LLM이 경보를 사용자 맥락 반영 한 줄 요약+다음 행동으로 개인화 | 토스뱅크 차세대 금융상담(혁신금융 2025-12, yna/ddaily A/B) | S | 페르소나 김하늘의 '카톡 한 줄' 니즈 충족 |
| 정책 검색 나열 | 근거 span 인용 대화형 Q&A(답변에 원문 링크·기준일 자동 첨부) | 토스뱅크 LLM 문서 기반 QA, Cleo 대화형 PFM(C) | M | 심사위원 질문 즉답 시나리오 |
| 수동 서류 확인 | 신청 건별 필요 서류·절차 체크리스트 자동 생성 | Rocket Money 대행 해지(concierge) 패턴(C), FTC click-to-cancel 맥락 | M | "여기 누르면 끝" 가이드(P3)와 연결 |
| SMS regex 전용 | 온디바이스 경량 분류기(TFLite류) + 서버 LLM 재분류 폴백 | 카카오페이 AI코치 마이데이터 AI 에이전트(wowtale 2026-08 C) | L | 프라이버시+정확도 동시 어필 |

주요 선례: 토스뱅크 AWS Bedrock 4건(코드리뷰·마케팅법률검토·재무분석·Text-to-SQL), 카카오페이 AI코치(마이데이터 AI 금융 에이전트 베타, 2026-08), 혜움→알프레드 에이전틱 AI 전환(2026-05), Cleo/Rocket Money/WallyGPT/Monarch AI(글로벌).

## Claim 상태표(요약)

| 상태 | 항목 |
| --- | --- |
| verified | 기관사칭 피해 집중(52%), ICL 미상환 19.4%, 전세사기 청년 76%, 근로장려금 20대 23%, OTT 구독 괴리, Doze/OEM 백그라운드 제한, Rules-as-Code 템플릿 필수·숫자룰 0% |
| partial | 구독 해지 불만 84.3%(조사 표본 한계), HWP-MCP "99%" 주장(벤더 자체 실측 E), 거지맵 이용자 수(D) |
| UNVERIFIED | 무문자 입금 누락 규모, 지역별 알바 임금체불 전국 통계, 보이스피싱 문자 패턴 실전 말뭉치, 개별 주택 권리 상태 |

## 한계 및 차단된 경로
- X/Instagram/TikTok 실시간 포스트는 로그인 게이트로 직접 확인 불가 → 커뮤니티/언론 재보도로 대체 수집
- 온디바이스 TFLite SMS 분류기의 국내 은행별 커버율 실측 자료 부재 → 착공 후 자체 실측 필요
- CODEF Demo 실동작은 미검증(기획 단계) → Sandbox 우선 구현 권장

## Bibliography(핵심)
- https://www.mt.co.kr/society/2025/09/19/2025091819475438359 · https://dgmbc.com/NewsArticle/635433 (보이스피싱)
- https://www.joongang.co.kr/article/25439908 · https://v.daum.net/v/20250930143004913 (장려금·환급)
- https://www.yna.co.kr/view/AKR20260412029200002 (ICL) · https://biz.heraldcorp.com/article/10518482 · https://www.khan.co.kr/article/202501160715001 (전세사기)
- https://www.chosun.com/economy/economy_general/2025/11/04/XOP2Q6LUQBGGFLV32XW7X6AU5Q/ · https://www.mk.co.kr/news/economy/12077945 (N잡)
- https://blog.hancom.com/hwp-rag-preprocessing-binary-parsing/ · https://tech.hancom.com/python-hwpx-parsing-1 · https://www.synapsoft.co.kr/blog/37848 · https://treesoop.com/blog/hwp-mcp-korean-document-ai-claude-2026 · https://velog.io/@pjg9606 (HWP)
- https://digitalgovernmenthub.org/publications/ai-powered-rules-as-code-experiments-with-public-benefits-policy/ (+summary) (Rules-as-Code)
- https://dho.st.edu/../Legal_RAG_Hallucinations.pdf (Stanford legal RAG) · https://aicompetence.org/when-rag-isnt-enough-enter-symbolic-ai
- https://www.pushwoosh.com/ko/blog/android-push-notifications · https://developer.android.com/training/monitoring-device-state/doze-standby?hl=ko (Android)
- https://www.yna.co.kr/view/AKR20251218110400002 · https://www.ddaily.co.kr/page/view/2025121814015143746 (토스뱅크) · https://wowtale.net/2026/08/04/262390/ (카카오페이 AI코치)
- https://getsmartertools.com/best-ai-budgeting-apps · https://en.ai-pedias.com/blog/ai-personal-finance-budgeting-2026 · https://agentic.ai/t/rocket-money (글로벌 PFM)
