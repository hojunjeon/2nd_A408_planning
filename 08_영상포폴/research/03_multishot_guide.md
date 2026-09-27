# 멀티샷/멀티비트 영상 프롬프팅 가이드
## 8초 클립 안에 A→B→C 여러 비트 넣기 + 샷 간 연결 (Veo 3/3.1 · Flow 기준)

조사일: 2026-09-16 · 대상 프로젝트: 8초 샷 × A(0~2.5s)→B(2.5~5s)→C(5~8s) 3비트 구조, 샷 체인으로 ~100초 구성

---

## 1. 타임스탬프 / 순차 지시 프롬프팅

### 공식 지원: `[MM:SS-MM:SS]` 구간 지시가 Google 공식 워크플로우

Google Cloud 공식 Veo 3.1 프롬프팅 가이드가 **"Workflow 3: Timestamp prompting"**을 정식 기법으로 문서화했다. 8초 클립을 2초 단위 4구간으로 나눈 예시가 그대로 실려 있다:

```
[00:00-00:02] Medium shot from behind a young female explorer ... pushes aside a large jungle vine to reveal a hidden path.
[00:02-00:04] Reverse shot of the explorer's freckled face, her expression filled with awe ... SFX: rustle of leaves, distant bird calls.
[00:04-00:06] Tracking shot following the explorer as she steps into the clearing ... Emotion: Wonder and reverence.
[00:06-00:08] Wide, high-angle crane shot, revealing the lone explorer ... SFX: A swelling, gentle orchestral score begins to play.
```

Google의 설명: "By assigning actions to timed segments, you can efficiently create a full scene with multiple distinct shots" — 즉 **한 번의 생성으로 멀티샷 시퀀스**를 노리는 것이 공식 권장 패턴이다.

출처: https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1

### 대안 문법: `first … then … finally` 서술형

커뮤니티 가이드(GitHub snubroot/Veo-3-Prompting-Guide)는 "This Then That" 기법을 기록했다. 타임스탬프 대신 순서 접속사로 비트를 나누는 방식:

```
She first hesitates at the door, then takes a deep breath, finally pushes it open with resolve.
The scene begins with a wide establishing shot, then smoothly transitions to a medium shot at the 3-second mark, finally ending with a close-up ...
```

`at the 3-second mark`처럼 문장 안에 시점을 박는 하이브리드도 가능하다.

출처: https://github.com/snubroot/Veo-3-Prompting-Guide

### 실증: 순서는 따르지만 "초 단위 정밀도"는 아님

- Artlist의 타임스탬프 프롬프팅 실전 가이드: Veo 3.1과 Kling 2.5 Turbo가 구간 지시 프롬프트에 가장 잘 반응하며, "프롬프트가 단일 지시가 아니라 **시퀀스처럼 읽혀야** 한다". 단, "여러 타임스탬프를 한 프롬프트에 넣으면 모델이 혼란스러워할 수 있다", "2~3회 반복 수정이 정상"이라고 경고.
  - 실측 예시: `Spring (1-2 seconds) → Autumn (5-6 seconds) → Winter (7-8 seconds)` — 8초에 3계절 배치가 실제 작동한 사례.
  - 출처: https://artlist.io/blog/timestamp-prompting/
- 커뮤니티(r/VEO3, r/PromptEngineering) 일치 견해: **"One action per prompt — multiple actions = chaos"**, "너무 많은 액션을 넣으면 일부만 하고 나머지는 무시한다", "액션이 여러 개인 샷은 10번 생성해야 1개 건진다".
  - 출처: https://www.reddit.com/r/PromptEngineering/comments/1ms5ri4/ , https://www.reddit.com/r/VEO3/comments/1mbqux2/ , https://www.reddit.com/r/VEO3/comments/1m084av/

**판단:** 타임스탬프는 "정확한 컷 시점"이 아니라 "비트 순서와 대략의 배분"을 모델에 전달하는 장치다. 2.5s/5s 같은 세밀한 경계는 생성물에서 ±0.5~1s 흔들린다고 보고, 정확한 컷은 후반 트리밍으로 잡는 것이 현실적이다.

---

## 2. 편집/전환 용어를 프롬프트에 쓰는 법

### 모델이 이해하는 용어 (공식 문서 확인됨)

- **whip pan**: Vertex 공식 프롬프트 가이드에 정의와 예시가 있음 — "an extremely fast pan that blurs the image, often used as a transition". 예: `whip pan from one arguing character to another`.
  - 출처: https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/veo/prompt-guide
- **cut to / transition to**: 커뮤니티 가이드에서 `Cut to:` 구문으로 장면 전환을 지시하는 예시 다수 ("Cut to: Same person using [PRODUCT]… Split-screen comparison shows before/after").
- **split screen**: 같은 가이드의 카메라/구도 키워드 목록에 "Split Screen: comparison and contrast"로 등재.
- **time-lapse, day-to-night transition**: Vertex 가이드의 temporal effect 예시로 확인.

### 전환 전용 공식: Frame A / Frame B / Join

media.io의 트랜지션 프롬프트 모음은 "전환 = 두 그림 + 그 사이의 모션"이라는 공식을 제시한다. 클립당 조인은 1개만:

```
Frame A: a door slamming, motion starting left. Frame B: a train tunnel rushing. Join: whip pan.
Frame A: an eye closing. Frame B: a tunnel ending in a white circle. Join: morph.
Frame A: a camera lens iris, circular bokeh. Frame B: a hard sun over a desert road. Join: graphic match cut on the circle.
```

출처: https://www.media.io/ai-prompts/ai-video-transition-prompts.html

**판단:** `fade to black`, `match cut`, `whip pan`, `split screen` 모두 프롬프트에 쓸 수 있지만, **전환이 "보이는 방식"까지 지정하려면 Frame A→Frame B를 이미지로 주는 편이 텍스트만보다 훨씬 안정적**이다. 텍스트만으로 match cut의 형상 대응(원→원, 사각→사각)을 맞추는 건 성공률이 낮다.

---

## 3. 샷 간 연속성: 프레임 인계와 Flow 도구

### 핵심 기법: 마지막 프레임 → 다음 샷 첫 프레임

Runway의 멀티샷 가이드가 "The last-frame technique"으로 정리: **한 샷의 마지막 프레임을 뽑아 다음 샷의 시작 프레임으로 넣고, '이어지는' 프롬프트를 쓰는 것**이 텍스트 묘사만으로 일관성을 유지하는 것보다 압도적으로 낫다. "Shot 2 doesn't pick up where shot 1 left off" 문제의 정석 해법.

- 출처: https://runway.com/resources/multi-shot-ai-video-generator

### Flow 도구 매트릭스 (Google 공식 지원 문서 + 팁 블로그)

| 도구 | 역할 | 제약 |
|---|---|---|
| **Frames to Video** | 시작 프레임(및 끝 프레임)을 이미지로 지정해 생성. 이전 클립의 저장 프레임을 시작점으로 재사용 가능 | Veo 3.1에서 first+last frame 지원 |
| **Extend** | 클립 끝 프레임/모션을 분석해 액션을 계속 생성. 체이닝으로 30초~1분+ 구성 | **Veo 생성 영상만 가능**. Extend된 클립에는 insert/remove/camera 편집 불가 |
| **Jump To** | 캐릭터/오브젝트 외형을 유지한 채 새 세팅으로 전환 | 초기엔 Veo 2 전용이었음(점진 확대) |
| **Scenebuilder** | 클립 배열·순서 변경·양끝 트림·전체 프리뷰·씬 다운로드 | 편집은 트림 수준, 본격 편집은 NLE로 |
| **Save frame** | 비디오의 임의 프레임을 이미지로 저장 → ingredient/시작/끝 프레임으로 재사용 | — |

- 출처: https://support.google.com/flow/answer/16935718 , https://blog.google/innovation-and-ai/products/flow-video-tips/ , https://toolfolio.com/articles/make-videos-longer-than-eight-seconds-in-veo

### Fast 모드 연속성 우회(커뮤니티 발견)

Extend는 Quality 모드에서만 동작한다는 제약이 있었고, Medium 기고자가 우회법을 기록: Scenebuilder에서 `+` → `Jump to…` 선택 → Jump to 버튼의 X를 눌러 제거(끝 프레임 썸네일이 사라짐) → `Frames to Video` 선택하면 끝 프레임이 저장된 채로 부활 → 다음 씬 프롬프트 입력. Fast 모드에서 끝 프레임 인계 생성이 가능해진다.

- 출처: https://therobbiedshow.medium.com/unlock-continuity-in-veo-3-fast-mode-with-this-loophole-37c4ad2afe7b

**S12(역재생) 판단:** Veo/Flow에는 실제 footage를 뒤집는 기능이 없다. Extend는 "앞으로 계속"만 한다. 이전 샷의 역재생은 (a) NLE에서 리버스 재생하거나, (b) "the action plays in reverse, time rewinding"류 프롬프트로 유사 역행을 생성하는 것인데, 후자는 실제 역재생이 아니라 근사치다. 정확한 역재생이 필요하면 후반 편집 확정.

---

## 4. 생성 vs 후반 편집 분리 기준

**후반으로 보낼 것 (생성에 맡기면 실패 또는 크레딧 낭비):**

- **로고·타이포·정확한 문자**: Veo 3는 무작위 자막/깨진 철자 텍스트를 생성하는 문제가 공식적으로 보고됨(MIT Technology Review). "No subtitles" 같은 네거티브 지시도 잘 무시한다. 검은 화면 위 로고처럼 **픽셀 정확도가 필요한 요소는 합성이 정답**.
  - 출처: https://www.technologyreview.com/2025/07/15/1120156/googles-generative-video-model-veo-3-has-a-subtitles-problem/
- **프레임 정확한 컷 시점**: 타임스탬프는 대략적 배분일 뿐. 정확한 비트 경계는 NLE 트림.
- **실제 footage 변형**(역재생, 속도 조정, 정확한 디졸브 길이): 생성 모델의 영역이 아님.

**생성에 맡길 것:**

- 카메라 무빙, 조명 변화, 점진적 암전 분위기("the lights gradually dim"), 문이 열리며 공간이 드러나는 리빌 — Veo가 잘하는 물리/광학 연속 동작.
- Skywork 가이드의 실무 워크플로우도 결론이 같다: "Pull clips into your NLE (Premiere/Resolve/Final Cut). Do your stitching, transitions, color balance, final audio mix there."
  - 출처: https://skywork.ai/blog/ai-video/veo-3-1-flow-ultimate-guide

**경계선:** `fade to black`은 생성으로도 어느 정도 나오지만, **완전한 검정 + 그 위 로고**는 "생성한 암전 직전 프레임까지"만 쓰고 검정~로고 구간은 편집으로 붙이는 게 안전하다.

---

## 5. 8초에 몇 비트까지가 현실적인가

- **공식 기준:** Google의 타임스탬프 워크플로우 예시 자체가 8초 = 4구간(2초씩). 단, 각 구간은 "덩굴을 젖힌다", "표정을 보여준다" 수준의 **단순 단일 액션**이다.
- **커뮤니티 합의:** 샷당 1개의 주요 액션. 3비트는 각 비트가 "상태 변화 1개"일 때 상한선 근처에서 작동. 비트 안에 액션을 2개 이상 넣으면 누락이 시작된다.
- **Runway:** 멀티샷 시퀀스는 "3~5개의 잘 계획된 샷"이 스위트스팟.
- **Skywork:** 액션이 많은 비트는 4~6초로 짧게 생성한 뒤 Extend로 늘리는 게 안정적.

**결론: A→B→C 3비트는 과밀이 아니라 상한선.** 성공 조건은 ① 비트당 동사 1개 ② 각 비트를 "샷"이 아니라 "지속 동작의 단계"로 서술 ③ 2~3회 재생성 예산 확보.

---

## 6. S04 스타일 정밀 연출 프롬프트 예시

S04 요구사항: `3분할 화면 → 점진 암전 → 검은 화면에 로고 → 문 열리며 3D 월드 공개`

**판단:** 4개 이벤트는 8초에 과밀 + "검은 화면 위 로고"는 생성 불가 영역. → **생성은 3비트로 줄이고, 로고는 후반 합성.**

### 생성용 프롬프트 (Veo 3.1, Flow)

```
[00:00-00:03] The screen is divided into a three-way split screen: three vertical panels showing different views of the same miniature world — a workshop desk, a city street diorama, a glowing portal doorway. Soft studio lighting, handcrafted diorama aesthetic.

[00:03-00:05] The three panels gradually dim one by one from left to right, the image sinking into complete darkness. SFX: a soft descending synth tone as the light fades.

[00:05-00:08] In the darkness, a tall door swings open, releasing a beam of warm volumetric light; through the doorway a vast miniature 3D world is revealed, camera slowly pushing forward toward the opening. Emotion: wonder and invitation. SFX: a gentle orchestral swell.
```

### 후반 편집 분리 설계

- Veo 생성물: 0~8초 위 프롬프트 결과물 (암전 → 도어 리빌까지).
- 편집(NLE): 4.5~6초 사이의 완전 암전 구간을 지정해 **로고 카드 0.5~1s 삽입** → 그 뒤 도어 오픈으로 컷백. 생성물의 "암전"과 "도어 오픈" 사이에 로고를 끼우면 프롬프트 4비트 압박이 사라진다.
- 로고는 PNG 합성 + alpha. 페이드 타이밍은 프레임 단위로 NLE에서 확정.

### 대안: 분할 생성이 더 안전한 경우

3분할 → 암전까지를 샷 A로, 도어 오픈 리빌을 샷 B로 분리하고, 샷 A의 마지막(거의 검정) 프레임을 Save frame → 샷 B의 시작 프레임으로 인계. 각 샷이 2비트 이하로 내려가 성공률이 크게 오른다.

---

## 7. 이 프로젝트에 적용할 핵심 포인트

1. **3비트 구조 유지, 공식 문법 사용.** `[00:00-00:02]` 스타일 타임스탬프가 Google 공식 워크플로우다. A/B/C 경계는 2.5s가 아니라 대략 2~3s로 기대하고, 정확한 컷은 후반 트림으로.
2. **비트당 동사 1개 원칙.** "점차 어두워진다"는 1비트. "어두워지고 로고가 뜬다"는 2비트 — 후자는 생성이 아니라 편집 작업이다.
3. **샷 체인은 last-frame 인계가 기본.** 각 샷의 마지막 프레임을 Save frame → 다음 샷 Frames to Video 시작 프레임. 텍스트만으로 연속성을 노리지 말 것. Extend는 "같은 액션 계속"용, 컷 전환은 프레임 인계가 맞다.
4. **S04 로고는 무조건 후반.** Veo는 텍스트/로고를 못 그리고 오히려 가짜 자막을 넣는다. 생성물엔 "complete darkness"까지만 요구.
5. **S12 역재생은 생성 시도하지 말 것.** NLE reverse가 유일하게 정확한 해법. "time rewinds" 프롬프트는 실제 역재생이 아니다.
6. **재생성 예산.** 멀티액션 샷은 커뮤니티 기준 ~10:1 재생성 비율이 보고된다. 정밀 연출 샷(S04)은 Fast 모드로 타이밍 검증 → Quality로 최종 생성의 2단계가 크레딧 효율적이다.
7. **전환 용어는 쓰되, 형상 대응은 이미지로.** whip pan/fade to black은 텍스트로 통하지만, match cut류 형상 매칭은 Frame A/B 이미지 지정이 정석.

---

## 출처 목록

- Google Cloud — Ultimate prompting guide for Veo 3.1 (타임스탬프 워크플로우, first/last frame): https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1
- Google Flow Help — Edit videos & build scenes (Extend, Scenebuilder, Save frame): https://support.google.com/flow/answer/16935718
- Google Blog — 5 tips for getting started with Flow (Frames to Video, Jump To, Extend): https://blog.google/innovation-and-ai/products/flow-video-tips/
- Vertex AI — Veo 프롬프트 가이드 (whip pan 등 카메라 용어, temporal effects): https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/veo/prompt-guide
- Artlist — Timestamp prompting 가이드 (Veo 3.1 구간 지시 실증, 주의사항): https://artlist.io/blog/timestamp-prompting/
- GitHub snubroot — Veo 3 Prompting Guide ("This Then That", cut to, split screen): https://github.com/snubroot/Veo-3-Prompting-Guide
- Runway — Multi-shot AI video generator (last-frame technique, 실패 모드 표, 3~5샷 권장): https://runway.com/resources/multi-shot-ai-video-generator
- media.io — AI Video Transition Prompts (Frame A/B + Join 공식): https://www.media.io/ai-prompts/ai-video-transition-prompts.html
- Toolfolio — Veo 8초 초과 연장 가이드 (Extend 체이닝 절차): https://toolfolio.com/articles/make-videos-longer-than-eight-seconds-in-veo
- Medium (Robert Dawson) — Fast 모드 연속성 우회법: https://therobbiedshow.medium.com/unlock-continuity-in-veo-3-fast-mode-with-this-loophole-37c4ad2afe7b
- Skywork — Veo 3.1 in Flow 가이드 (NLE 핸드오프, 4~6s 액션 비트): https://skywork.ai/blog/ai-video/veo-3-1-flow-ultimate-guide
- MIT Technology Review — Veo 3 자막 문제 (텍스트/로고 생성 취약 근거): https://www.technologyreview.com/2025/07/15/1120156/googles-generative-video-model-veo-3-has-a-subtitles-problem/
- 커뮤니티 실증 (검색 스니펫 기반, 본문 스크랩 차단됨): r/VEO3 "Making the most of 8 seconds", "VEO3 pays my bills but I still need 10 generations", r/PromptEngineering "one action per prompt"
