# AI 영상 생성 프롬프트 작성 가이드 (Veo 3.1 / Google Flow 중심)

조사일: 2026-09-16. 대상 프로젝트: Flow + Veo 3.1, 8초 샷 13개 ≈ 100초 브랜드 영상. 실사 파트 + stylized 3D CGI 파트 공존, 무언 연출, 한국어 나레이션 후반 작업.

## 주요 출처

- Google DeepMind 공식 프롬프트 가이드: https://deepmind.google/models/veo/prompt-guide/
- Google Cloud 공식 "Ultimate prompting guide for Veo 3.1": https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1
- Vertex AI / Gemini Enterprise 공식 "Video generation prompt guide": https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/video/video-gen-prompt-guide (구 cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide)
- Veo 3.1 모델 스펙: https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/veo/3-1-generate
- Google 공식 Flow 팁 (blog.google): https://blog.google/innovation-and-ai-products/flow-video-tips/
- 커뮤니티 종합 가이드 (GitHub): https://github.com/snubroot/Veo-3-Prompting-Guide
- 자막 문제 실전 픽스: https://www.veo3ai.io/blog/veo-3-remove-subtitles-captions-fix-2026
- 자막 버그 보도: https://www.technologyreview.com/2025/07/15/1120156/googles-generative-video-model-veo-3-has-a-subtitles-problem/
- Gemini 공식 포럼 자막 스레드: https://support.google.com/gemini/thread/346109881
- 캐릭터 일관성 (Google Cloud Medium): https://medium.com/google-cloud/veo-3-character-consistency-a-multi-modal-forensically-inspired-approach-972e4c1ceae5
- 텍스트/로고 한계 언급: https://www.dreamhost.com/blog/veo-3-1-prompt-guide/
- Replicate 실전 가이드: https://replicate.com/blog/using-and-prompting-veo-3

---

## 1. 공식 프롬프트 구조

### 1.1 Google Cloud의 5요소 공식 (가장 실용적)

```
[Cinematography] + [Subject] + [Action] + [Context] + [Style & Ambiance]
```

- **Cinematography**: 카메라 워크와 샷 구도
- **Subject**: 주체(인물/사물) — 구체적으로
- **Action**: 주체가 하는 동작
- **Context**: 환경, 배경 요소
- **Style & Ambiance**: 전체 미학, 무드, 조명

공식 예시: *"Medium shot, a tired corporate worker, rubbing his temples in exhaustion, in front of a bulky 1980s computer in a cluttered office late at night. The scene is lit by the harsh fluorescent overhead lights and the green glow of the monochrome monitor. Retro aesthetic, shot as if on 1980s color film, slightly grainy."*

### 1.2 Vertex AI 공식 문서의 요소 분해

| 요소 | 역할 | 예시 키워드 |
|---|---|---|
| Subject | "who/what" — 구체성이 generic 출력을 막음 | "a seasoned detective", "a miniature dragon with iridescent scales" |
| Action | 동사, 동작·표정·미세 움직임 | walking, a subtle nod, fingers tapping, eyes blinking slowly |
| Scene/Context | "where/when" — 장소·시간대·날씨·시대 | golden hour, misty forest, floating dust motes in a sunbeam |
| Camera angles | 시점 | eye-level, low-angle, bird's-eye, dutch, POV |
| Camera movements | 움직임 | static, pan, tilt, dolly, truck, crane, arc, handheld |
| Lens/optical | 광학 효과 | shallow DOF, bokeh, rack focus, telephoto, dolly zoom |
| Visual style | 조명·톤·아트스타일·앰비언스 | film noir, high-key, Pixar-like 3D, muted earthy tones |
| Temporal | 시간 흐름 | slow-motion, time-lapse |
| Audio | 사운드 지시 | SFX, ambient noise, dialogue |
| Negative prompt | 제외할 요소 (별도 필드) | 명사 나열 방식 (§3 참조) |

모든 요소를 매번 쓸 필요는 없지만, 요소를 알면 제어가 쉬워진다. **8초 샷 하나 = 동작 1~2개 + 카메라 무브 1개**가 현실적인 밀도다.

### 1.3 타임스탬프 프롬프팅 (한 생성 안에 멀티샷)

Veo 3.1은 `[00:00-00:02]` 형식으로 시간대별 지시를 지원. 8초 안에 컷 전환을 넣고 싶을 때 사용:

```
[00:00-00:02] Medium shot from behind a young female explorer ... pushes aside a large jungle vine.
[00:02-00:04] Reverse shot of the explorer's freckled face, expression filled with awe ...
[00:04-00:06] Tracking shot following the explorer ... SFX: rustle of dense leaves.
[00:06-00:08] Wide, high-angle crane shot ... SFX: swelling gentle orchestral score.
```

이 프로젝트는 샷을 개별 생성하므로 필수는 아니지만, 한 샷 안에 "0-4초: 정지 → 4-8초: dolly in" 같은 시간 지시로 액션 타이밍을 제어할 수 있다.

---

## 2. 카메라·조명·렌즈·스타일 키워드 사전

### 2.1 샷 크기 (composition)

- **extreme close-up**: 눈, 물방울 등 극단적 디테일
- **close-up**: 얼굴/디테일 강조, 감정 전달
- **medium shot**: 허리 위, 대화·인물 표준
- **full shot / long shot**: 전신 + 일부 환경
- **wide shot / establishing shot**: 환경 안의 주체, 장면 오프닝용
- **over-the-shoulder shot**: 대화·응시 구도
- **two-shot**: 두 인물을 한 프레임에

### 2.2 카메라 앵글

- **eye-level**: 중립적, 가장 자연스러움
- **low-angle**: 아래에서 위로 — 주체가 크고 강력해 보임
- **high-angle**: 위에서 아래로 — 주체가 작고 취약해 보임
- **bird's-eye / top-down**: 직상俯视, 지도 같은 시점
- **worm's-eye**: 지면에서 직상 — 웅장함
- **dutch angle / canted**: 기울어진 수평선 — 불안·역동
- **POV shot**: 캐릭터 시점

### 2.3 카메라 무브먼트

- **static shot (fixed)**: 완전 고정 — 무언 연출·정적 무드에 기본값
- **pan left/right**: 제자리 수평 회전 ("slow pan left across a city skyline")
- **tilt up/down**: 제자리 수직 회전 ("tilt down from face to the letter in hands")
- **dolly in/out**: 카메라 자체가 전후진 ("dolly out to emphasize isolation")
- **truck left/right**: 카메라가 옆으로 이동
- **pedestal up/down**: 카메라가 수직 승강
- **zoom in/out**: 렌즈 배율 변화 (dolly와 다름 — 카메라는 안 움직임)
- **tracking shot**: 주체를 따라감
- **crane shot**: 크레인 상승·선회 — 드라마틱한 리빌
- **aerial / drone shot**: 공중 비행 무브
- **arc shot**: 주체 주위를 원호로 선회 ("smooth 180-degree arc shot")
- **handheld / shaky cam**: 손들고 찍은 흔들림 — 다큐·긴박감
- **whip pan**: 초고속 팬, 트랜지션용
- **dolly zoom (vertigo effect)**: 달리+줌 반대방향 — 배경이 왜곡되며 불안감

주의: 공식 문서도 "일부 고급 카메라 앵글/렌즈는 공식 지원이 아니라 결과가 들쭉날쭉할 수 있다"고 명시. 재생성 각오로 쓴다.

### 2.4 조명

- 자연광: "soft morning sunlight streaming through a window", "overcast daylight", "moonlight", "golden hour glow"
- 인공광: "warm glow of a fireplace", "flickering candlelight", "harsh fluorescent office lighting", "pulsating neon signs"
- 시네마틱: "Rembrandt lighting", "film noir style with deep shadows and stark highlights", "high-key lighting (밝고 경쾌)", "low-key lighting (어둡고 미스터리)"
- 효과: "volumetric lighting creating visible light rays", "backlighting to create a silhouette", "dramatic side lighting"

### 2.5 렌즈·광학

- "wide-angle lens" (광활한 스케일, 원근 왜곡), "telephoto lens" (압축 원근, 피사체 분리)
- "shallow depth of field" + "bokeh" (배경 흐림), "deep depth of field" (전체 초점)
- "lens flare", "rack focus (초점 이동)", "fisheye lens", "soft focus", "macro lens"

### 2.6 스타일·앰비언스

- 실사: "photorealistic", "ultra-realistic rendering", "shot on 35mm film", "anamorphic widescreen", "cinematic film look", "slightly grainy"
- CGI/애니: "Pixar-like 3D animation", "stylized 3D CGI animation", "cel-shaded animation", "claymation", "stop-motion"
- 톤/무드: "melancholic mood with cool blue tones", "warm, inviting color palette", "muted earthy tones", "vibrant and saturated"
- 질감/분위기: "floating dust motes", "heat haze", "magical glowing particles in the air", "film grain", "sepia toned"

### 2.7 오디오 지시 (무언 연출이라도 필요)

공식 권장: 오디오는 **별도 문장/섹션**으로 명시.

- **SFX**: "SFX: thunder cracks in the distance", "the sound of a phone ringing"
- **Ambient noise**: "Ambient noise: the quiet hum of an office", "waves crashing on the shore"
- **Dialogue**: "A woman says: We have to leave now." (콜론 형식, §3)

무언 샷이라도 "Audio: ..."를 명시하지 않으면 모델이 임의로 대화·음악·관객 웃음소리를 넣을 수 있다 (커뮤니티 다수 보고). **"Audio: quiet room tone, no dialogue, no speech"** 처럼 원하는 소리의 부재까지 적는 게 안전.

---

## 3. 부정 지시 (no subtitles / no text / 입 다물기) 전략

### 3.1 공식 가이드의 원칙

Vertex AI 공식 문서의 negative prompt 규칙:

- **비권장**: "no", "don't" 같은 지시문 ("no walls", "don't show walls")
- **권장**: 보고 싶지 않은 **요소를 명사로 나열** ("wall, frame")
- 메인 프롬프트 안에서는 **부재를 긍정 서술**: "no man-made structures" 대신 "a desolate landscape with no buildings or roads" 식으로 '없는 상태의 장면'을 묘사

즉 공식 입장은: ① 별도 negative prompt 필드에는 명사 나열, ② 본문에는 긍정 묘사, 두 채널을 나눠 쓰라는 것.

### 3.2 왜 "no subtitles"가 잘 안 먹히는가

- Veo 3의 학습 데이터(YouTube·틱톡 등)에 burned-in 자막이 워낙 많아, **대사가 감지되면 자막을 '도움이 되는 것'으로 학습**함 (MIT Technology Review)
- 자막은 픽셀에 구워져 나옴 — 토글 불가
- 부정 프롬프트는 긍정 프롬프트보다 구조적으로 효과가 약함 (학계 지적)
- 한 광고 디렉터 경험치: 대사 있는 클립의 최대 ~40%가 깨진 자막 포함

### 3.3 실전에서 검증된 자막/텍스트 방지 기법 (누적 적용)

1. **대사를 콜론 형식으로, 따옴표 없이**: `A barista says: Your latte is ready.` — 따옴표로 감싸면 '쓰인 텍스트'로 인식해 화면에 그릴 확률이 올라감. 대사 안의 apostrophe(축약형)도 피함.
2. **대사/음성 지시를 프롬프트 맨 앞에**: 시각 묘사보다 먼저 쓰면 자막 감소 + 립싱크 정렬 향상 보고 있음.
3. **대사 직후에 제약 부착**: `(no subtitles, no captions, no on-screen text)` — 긴 문단 끝보다 대사 바로 뒤가 효과적.
4. **negative prompt 필드 채우기** (Flow/AI Studio/API에 있는 별도 필드):
   ```
   subtitles, captions, closed captions, on-screen text, text overlay, watermark, words on screen, lower-third text, burned-in text
   ```
5. **고집스러운 경우 부정문 반복**: "No subtitles. No subtitles! No on-screen text whatsoever." (커뮤니티 검증, 성공률 높음)
6. **근본 방지 = 대사를 아예 쓰지 않기**: 이 프로젝트는 무언 연출이므로 대사 자체를 넣지 않는 것이 최선. 단, 대사가 없어도 '말하는 얼굴'로 보이면 자막이 붙을 수 있으므로 §3.4의 명시 필요.

### 3.4 "입을 다물어라 / 립싱크 하지 마라" 지시법

부정("don't move lips")보다 **원하는 상태를 긍정 묘사**하는 게 공식 원칙에 부합:

```
... she gazes out the window, mouth closed, silent, a calm contemplative expression.
She does not speak. Audio: quiet room tone, soft rain against the window, no dialogue, no speech.
```

- "mouth closed", "silent", "does not speak", "not talking" 같은 상태 묘사를 액션에 섞는다.
- Audio 줄에 "no dialogue, no speech"를 명시해 음성 생성 자체를 끈다.
- negative prompt 필드에 `subtitles, captions, on-screen text, dialogue, speech, lip-sync` 추가.

### 3.5 그래도 자막이 나오면 (후처리)

1. **하단 크롭**: 자막은 거의 항상 하단 1/3에 위치 → 12~18% 크롭. 생성 시 프레임 하단에 여유(foot-room)를 두면 손실 없이 가능.
2. **덮기**: 자체 로워서드/브랜드 바/자막을 얹어 디자인 요소로 전환.
3. **AI 인페인팅/오브젝트 제거 툴**: 배경이 단순할 때 깨끗함.
4. **재생성**: 같은 프롬프트 재생성은 낭비. 위 기법 적용 후 재생성. 저렴한 티어(Fast/Lite)로 먼저 검증.

---

## 4. 텍스트·로고 렌더링의 한계와 우회 (S04 "KeyFin" 대응)

### 4.1 한계

- AI 영상의 텍스트 렌더링은 여전히 불안정("pretty janky" — DreamHost 가이드). 짧은 단어도 철자가 깨지거나 글리프가 흔들림.
- 로고처럼 **정확한 서체·심볼**이 필요한 경우 텍스트 프롬프트로는 재현 불가에 가까움.

### 4.2 우회법 (우선순위 순)

1. **후반 작업에서 합성 (권장)**: Veo로는 텍스트 없는 클린 샷을 만들고, KeyFin 로고는 편집 단계에서 오버레이. 브랜드 영상에서 로고 정확성이 중요하므로 사실상 정답. 프롬프트에는 로고가 들어갈 자리를 확보하는 구도 지시만: "centered composition with negative space" 등.
2. **Frames to Video / image-to-video로 로고 포함 첫 프레임 투입**: Flow에서 로고가 이미 합성된 스틸 이미지를 첫 프레임으로 넣고 "the camera slowly dollies in, the logo remains sharp and unchanged" 식으로 애니메이트. Veo 3.1은 i2v 프롬프트 준수율이 개선됐고, 첫 프레임의 픽셀은 정확히 유지되므로 로고가 '생성'이 아니라 '유지'가 됨.
3. **Ingredients to Video에 로고 에셋 등록**: 로고 이미지를 ingredient로 넣고 "using the provided logo image". 단, 장면 변형 과정에서 왜곡 가능 — 짧은 텍스트는 따옴표로 ("the word 'KeyFin' in clean white sans-serif") 보조 지시하고 재생성 각오.

결론: **생성으로 로고를 '그리게' 하지 말고, 이미지로 주입하거나 후반 합성.**

---

## 5. 캐릭터 묘사 일관성

### 5.1 최강 수단: Flow의 Ingredients (레퍼런스 이미지)

텍스트 묘사 반복보다 **레퍼런스 이미지**가 압도적으로 강력:

- Flow에서 캐릭터/소품/배경을 "ingredient"로 등록 → Ingredients to Video로 샷마다 동일 에셋 투입
- Scenebuilder의 **Jump To**: 이전 샷의 외형을 유지한 채 새 환경으로 전환
- **First & Last Frame**: 시작/끝 프레임을 이미지로 고정해 카메라 무브·변형을 제어
- 공식 워크플로: Gemini 2.5 Flash Image(Nano Banana)로 캐릭터 레퍼런스를 먼저 만들고 → Veo에 투입

### 5.2 텍스트 묘사를 병행할 때: 캐릭터 템플릿

레퍼런스 이미지 위에 **동일 문구를 매 샷 그대로** 반복 (바꿔 쓰면 드리프트 발생):

```
[NAME], a [AGE] [ETHNICITY] [GENDER] with [HAIR_DETAILS], [EYE_COLOR] eyes,
[DISTINCTIVE_FACIAL_FEATURES], wearing [DETAILED_CLOTHING], with [POSTURE/MANNERISMS]
```

예: *"Sarah Chen, a 32-year-old Asian-American woman with shoulder-length black hair in a professional bob, warm brown eyes behind wire-rimmed glasses, wearing a charcoal gray blazer over a white collared shirt."*

- 이름을 부여하고 템플릿 전체를 verbatim으로 재사용
- 시그니처 요소 고정 ("always wears his vintage leather jacket, silver watch on left wrist")
- Gemini로 여러 샷 프롬프트를 확장할 때는 "모든 필수 캐릭터 디테일을 각 프롬프트에 반복하라"고 명시해야 함 (공식 Flow 팁) — Gemini가 요약하며 디테일을 빼먹는 경우가 있음
- 고급: Google Cloud Medium 글의 "forensic profile" — 얼굴형·턱선·눈 모양 등을 항목별로 분해한 구조화 묘사(JSON)를 만들어 identity vector처럼 사용

### 5.3 환경·스타일 일관성

- 장소 묘사도 문구를 고정해 재사용
- 조명 세팅·컬러 팔레트·카메라 프레이밍 스타일을 통일
- 실사 파트와 CGI 파트는 각각 **고정 스타일 문자열**을 정의해 모든 샷에 동일하게 삽입

---

## 6. 바로 쓸 수 있는 프롬프트 템플릿

### 6.1 무언 실사 샷 (이 프로젝트 기본형)

```
[Cinematography: shot size + movement], [NAME — character template verbatim],
[action: subtle, mouth closed, silent], [context: location, time, atmosphere].
[Lighting description]. [Style: photorealistic, shot on 35mm, ...].
Audio: [ambient/SFX only], no dialogue, no speech.
```

예시:

```
Static medium shot, Jiho, a late-20s Korean man with short black hair and a
navy crewneck sweater, sits at a minimalist desk and gazes at a laptop screen,
mouth closed, silent, a focused expression. A small apartment studio at night,
warm desk lamp glow against cool window light. Photorealistic, shot on 35mm
film, shallow depth of field, muted cinematic tones.
Audio: quiet room tone, soft keyboard clicks, no dialogue, no speech.

Negative prompt: subtitles, captions, on-screen text, text overlay, watermark,
words on screen, dialogue, speech, lip-sync
```

### 6.2 stylized 3D CGI 샷 (아바타 + 고양이 AI)

```
[Camera], [AVATAR template], [CAT-AI template], [action — nonverbal],
[context]. Stylized 3D CGI animation, [palette/lighting].
Audio: [soft ambient/score direction], no dialogue, no speech.
```

예시:

```
Slow dolly in, a stylized 3D avatar of a young woman with a rounded face and
short bob, sitting cross-legged on a glowing platform, beside her a small
white cat-like AI companion with luminous cyan eyes hovering at shoulder
height. Both are silent, mouths closed, exchanging a glance. A dreamy
abstract space of soft gradient blues and floating geometric shapes.
Stylized 3D CGI animation, soft volumetric lighting, gentle pastel palette.
Audio: soft ambient synth pads, faint chimes, no dialogue, no speech.

Negative prompt: subtitles, captions, on-screen text, text overlay, watermark,
dialogue, speech
```

### 6.3 로고 샷 (S04) — 두 가지 방식

방식 A (권장): 클린 샷 생성 → 후반 합성

```
Slow dolly in on a clean minimal end-card composition: soft gradient
background in brand navy and white, generous centered negative space,
subtle floating particles. No text, no logos, no letters anywhere in frame.
Elegant, premium brand film aesthetic.
Audio: gentle ambient swell, no dialogue.
```

→ 편집에서 KeyFin 로고를 정확히 합성.

방식 B: 로고 포함 첫 프레임을 Frames to Video에 투입

```
[첫 프레임: KeyFin 로고가 합성된 엔드카드 이미지]
The camera performs a very slow, subtle push-in. The logo remains perfectly
sharp, centered, and completely unchanged. Soft light sweep passes gently
across the background. No additional text appears.
Audio: gentle ambient swell, no dialogue.
```

---

## 7. 이 프로젝트에 적용할 핵심 포인트

1. **샷 프롬프트 골격 통일**: `[Cinematography] + [Subject] + [Action] + [Context] + [Style] + Audio 줄`. 13개 샷이 같은 뼈대면 결과 편차가 줄고 수정 포인트가 명확해진다. 8초 샷에는 동작 1~2개 + 카메라 무브 1개가 적정 밀도.
2. **무언 연출은 "대사를 빼는 것"이 아니라 "침묵을 묘사하는 것"**: 액션에 `mouth closed, silent, does not speak`를 넣고, Audio 줄에 `no dialogue, no speech` + 원하는 환경음을 명시. negative prompt 필드에 `subtitles, captions, on-screen text, text overlay, dialogue, speech` 상시 투입.
3. **부정 지시는 2채널**: 본문에는 긍정 묘사("a clean wall with no text"), negative prompt 필드에는 명사 나열. "don't/no ~해라" 단독 문장은 공식·커뮤니티 모두 약하다고 확인.
4. **S04 KeyFin 로고는 생성에 맡기지 않는다**: 클린 엔드카드 샷 + 후반 합성이 1순위, 로고 합성 첫 프레임을 Frames to Video에 넣는 게 2순위. 텍스트 렌더링 요청은 재시도 비용만 든다.
5. **캐릭터 일관성은 Ingredients가 주력, 템플릿 문구는 보조**: 아바타·고양이·실사 인물 각각 레퍼런스 이미지를 ingredient로 등록하고, 캐릭터 묘사 문자열은 모든 샷에서 verbatim 재사용. 실사/CGI 각각 고정 스타일 문자열("photorealistic, shot on 35mm" / "stylized 3D CGI animation, soft volumetric lighting")을 정의해 전 샷에 삽입.
6. **자막이 뚫고 나올 때를 대비한 사전 설계**: 프레임 하단에 여유를 두는 구도로 생성하면, 최악의 경우 하단 12~18% 크롭으로 무손실 복구 가능. Fast/Lite 티어로 프롬프트를 먼저 검증하고 본 생성에 들어가면 크레딧을 아낀다.

