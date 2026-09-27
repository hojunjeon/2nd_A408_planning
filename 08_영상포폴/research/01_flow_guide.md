# Google Flow 공식 사용 가이드 + Veo 3.1 모델 정리

조사일: 2026-09-16 | 주요 출처: Google Flow 공식 Help Center, blog.google, Google Cloud 공식 프롬프팅 가이드

---

## 1. Google Flow 핵심 기능

출처: [Create videos in Google Flow](https://support.google.com/flow/answer/16353334), [Edit videos & build scenes](https://support.google.com/flow/answer/16935718), [Introducing Veo 3.1 and advanced capabilities in Flow](https://blog.google/innovation-and-ai/products/veo-updates-flow/)

### 생성 방식 (프롬프트 박스 → 모델명 클릭 → Video 선택)

- **Text to Video**: 텍스트만으로 생성. 피사체·동작·환경·조명·스타일을 구체적으로 적을수록 좋음.
- **Frames to Video (첫/끝 프레임)**: 시작 프레임, 끝 프레임 이미지를 드래그해 넣고, 두 프레임 사이에서 일어날 동작/전환을 텍스트로 서술. 트랜지션·이미지 애니메이션에 사용.
- **Ingredients to Video (레퍼런스 이미지)**: 캐릭터·오브젝트·배경·스타일 레퍼런스 이미지를 넣고, 프롬프트에서 각 이미지가 어떻게 쓰여야 하는지 서술. `@` 입력으로 프로젝트 내 에셋/캐릭터를 이름으로 참조 가능.
- **Characters**: 얼굴·의상·목소리를 묶은 재사용 캐릭터를 만들어 두고 `@캐릭터명`으로 호출. 매번 이미지를 올리지 않아도 일관성 유지. ([캐릭터/에셋 관리](https://support.google.com/flow/answer/16935308))
- **Voice references**: Omni Flash에서 ingredients 영상에 단일 화자 목소리 레퍼런스/커스텀 보이스 적용 가능 (다른 생성 방식에서는 에러).
- **Flow Agent**: 프롬프트 박스에서 Agent 토글을 켜면 "이 영상 5개 조명 바꿔서" 같은 자연어 지시·일괄 편집·에셋 정리를 대화식으로 수행.

### 편집/조립

- **Scenebuilder**: 클립을 시퀀스로 배열·순서 변경·앞뒤 트림·전체 프리뷰·씬 단위 다운로드. 클립 hover → More → Add to Scene.
- **Extend**: 생성된 Veo 영상의 마지막 1초를 이어받아 뒤에 영상을 덧붙임. 1분 이상 롱테이크 제작 가능. 단, **Extend된 클립에는 insert/remove/camera 같은 다른 편집 모드를 적용할 수 없음**.
- **Insert/Remove/Camera (편집 모드)**: 장면에 요소 추가, 오브젝트/캐릭터 제거, 카메라 편집 모드가 존재.
- **Video-to-Video 편집** (Omni Flash 전용): 업로드 영상(최대 60초/1GB, 30초 초과분은 트림 필요)의 최대 10초 구간을 프롬프트로 편집. 최대 3턴까지 컨텍스트 유지.
- **History/프레임 저장**: 편집해도 원본 유지, History 패널에서 이전 버전+프롬프트 확인 가능. 영상의 특정 프레임을 이미지로 저장해 다음 생성의 ingredient/시작·끝 프레임으로 재사용 가능 ← 샷 연결의 핵심 기능.
- **다운로드/업스케일**: 프로젝트 단위 다운로드, 씬 다운로드 지원. 1080p 업스케일은 Plus/Pro/Ultra 구독자에게 0크레딧, 4K 업스케일은 Ultra 전용 50크레딧.

### 접근/제한

- Google AI Plus/Pro/Ultra 구독 필요(Workspace 일부 플랜은 일일 50크레딧). 만 18세+, 지원 국가, Chromium 브라우저 권장.
- 모든 생성물에 **SynthID** 보이지 않는 워터마크. **한국·인도·베트남 거주자는 눈에 보이는 워터마크가 자동 적용**됨(프로필 메뉴의 Visible watermarking 토글 관련).
- 실패한 생성은 크레딧 미차감(반영 지연 가능). 대량 생성 시 분당 생성 수 레이트리밋 존재.

---

## 2. Flow 내 모델별 지원 기능 매트릭스

출처: [Learn about Google Flow models & supported features](https://support.google.com/flow/answer/16352836) (공식, 최신 기준)

| 기능 | Veo 3.1 Lite | Veo 3.1 Fast | Veo 3.1 Quality | Gemini Omni Flash 1.1 |
|---|---|---|---|---|
| Text to Video | O (4/6/8s) | O (4/6/8s) | O (4/6/8s) | O (4/6/8/10s) |
| Frames (첫 프레임) | O | O | O | O |
| Frames (첫+끝) | O | O | O | O |
| **Ingredients to Video** | O (**8s만**) | O (**8s만**) | **X** | O (4/6/8/10s) |
| Extend | O (유일) | **X** | **X** | coming soon |
| Video-to-Video 편집 | X | X | X | O (최대 10s 구간) |

핵심: **Ingredients to Video는 Veo 3.1 Quality에서 지원되지 않는다.** 레퍼런스 이미지로 캐릭터 일관성을 유지하려면 Lite, Fast, 또는 Omni Flash를 써야 함. Extend는 Veo 3.1 계열 8초 영상만 가능하며 실행 모델은 Lite로 고정(공식 표기: "모든 Veo 3.1 8s 영상은 Extend 가능하지만 Lite를 써야 한다").

### 크레딧 비용 (생성 1회당, [공식 크레딧 표](https://support.google.com/flow/answer/16526234))

| 모델 | 비용 |
|---|---|
| Veo 3.1 Lite | 비-Ultra 10 / Ultra 5 |
| Veo 3.1 Fast | 비-Ultra 20 / Ultra 10 |
| Veo 3.1 Quality | 모든 사용자 100 |
| Omni Flash 720p | 8s = 12 (4s:7 / 6s:10 / 10s:15) |
| Omni Flash 360p | 8s = 6 (드래프트용) |
| Omni Flash 영상 편집 | 40 |
| 1080p 업스케일 | 구독자 0 / 비구독 불가 |
| 4K 업스케일 | Ultra만 50 |

크레딧 지급: 무구독 일일 50 / Plus +200/월 / Pro +1,000/월 / Ultra $100 플랜 +10,000/월 / Ultra $200 플랜 +25,000/월. 일일·월간 크레딧 모두 이월 없음.

### Fast vs Quality 실무 차이 (비공식 참고: [veo3ai.io](https://www.veo3ai.io/blog/veo-3-fast-vs-quality))

- Quality는 모션·텍스처·복잡한 프롬프트 준수도가 최상. Fast는 단순 샷에서는 거의 구분 불가, 복잡한 장면(다수 피사체, 빠른 동작, 파인 텍스트, 반사면)에서 차이 발생.
- 권장 워크플로: **Fast로 반복(iteration) → 마음에 드는 컷만 Quality로 파이널**. 단, 이 프로젝트처럼 ingredients가 필수면 Quality 자체를 못 쓰므로 Fast가 사실상 최고 품질 옵션.
- API 기준 초당 비용 참고: Lite ~$0.05 / Fast ~$0.10~0.15 / Quality $0.40 (오디오 포함).

---

## 3. 공식 베스트 프랙티스와 제약

출처: [Flow 생성 도움말 - Best practices](https://support.google.com/flow/answer/16353334), [Veo 3.1 공식 프롬프팅 가이드 (Google Cloud)](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1), [Veo 3.1 Ingredients 업데이트 (blog.google)](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)

### 프롬프트 공식 (Google 공식 5요소)

`[Cinematography] + [Subject] + [Action] + [Context] + [Style & Ambiance]`

- 카메라: dolly shot, tracking shot, crane shot, aerial view, slow pan, POV, locked-off 등 영화 용어 그대로 사용.
- 구도/렌즈: wide shot, close-up, low angle, shallow depth of field, 35mm lens, macro lens 등.
- 오디오: 대사는 따옴표(`A woman says, "..."`), 효과음은 `SFX:`, 배경음은 `Ambient noise:`로 명시.
- 네거티브: "no X"보다 "a desolate landscape with no buildings"처럼 서술형으로.
- **Timestamp 프롬프팅**: `[00:00-00:02] ...` 형식으로 8초 안에 멀티샷 시퀀스 지시 가능.

### 제약/주의점

- **Ingredients 모드는 8초 고정** (Veo 3.1 Lite/Fast). 레퍼런스 이미지는 **최대 3장** (Gemini API 문서 기준, Flow UI도 동일 관행).
- Ingredients용 이미지는 **단순/분리된 배경**에서 찍은 피사체 레퍼런스가 최적. 배경·스타일 레퍼런스에 불필요한 피사체가 섞이면 의도와 다르게 합성됨.
- 텍스트 프롬프트가 레퍼런스와 **모순되면 안 됨**. 모든 ingredient를 프롬프트에서 참조할 것.
- 파인 텍스트/로고 렌더링은 여전히 약점(특히 Fast). 손·얼굴·로고·텍스트 아티팩트는 생성 후 체크 포인트.
- 미지원 기능 선택 시 Flow가 호환 모델로 자동 전환하며 경고를 띄움. 생성 전 설정에서 모델·해상도·크레딧 비용 확인.
- Veo 3.1 Ingredients는 2026-01 업데이트로 **9:16 네이티브 세로**, **1080p/4K 업스케일**, 대화·스토리텔링 강화됨.

---

## 4. 캐릭터/스타일 일관성 실전 기법

1. **Characters 기능 활용**: 캐릭터를 만들어 두면 얼굴·의상·목소리가 고정되고 `@이름`으로 모든 클립에 호출. 매번 ingredient 업로드 불필요. ([공식](https://support.google.com/flow/answer/16935308))
2. **Ingredient 이미지는 Nano Banana Pro로 제작**: Google이 공식 추천한 파이프라인 — Gemini/Flow의 이미지 모델로 캐릭터·소품·배경 레퍼런스를 먼저 만들고(단순 배경), 그걸 Veo 3.1 Ingredients에 투입.
3. **프레임 체이닝**: 샷 A의 마지막 프레임을 "Save frame"으로 저장 → 샷 B의 시작 프레임(Frames to Video)으로 사용. 씬 전환 시 조명·색감 연속성 확보.
4. **Extend로 롱테이크**: 한 샷을 더 길게 가져가야 하면 Extend(실행 모델은 Lite). 단 Extend 클립에는 camera/insert/remove 편집 불가.
5. **프롬프트에 정체성 재명시**: "same person as reference; short brown hair; red scarf"처럼 레퍼런스와 별개로 텍스트로도 고정.
6. **스타일 통일**: ingredient 이미지들끼리 조명·화풍이 다르면 subject drift 발생. 실사+CGI 혼합이면 "실사 배경 ingredient + CGI 캐릭터 ingredient"를 나눠 넣고 프롬프트에서 각자의 역할을 명시.

---

## 이 프로젝트에 적용할 핵심 포인트

- **모델 선택: Veo 3.1 Fast가 정답.** Ingredients to Video는 Quality에서 아예 지원 안 되므로, 레퍼런스 기반 캐릭터 일관성이 필요한 이 프로젝트는 Fast(8s, 20크레딧/회, Ultra면 10)가 최상위 옵션. 더 싼 Lite(10/5크레딧)로 먼저 레이아웃을 잡고 Fast로 파이널을 뽑는 2단계도 유효.
- **8초 고정은 제약이 아니라 규격**: Ingredients 모드는 어차피 8초만 지원. 13샷 × 8초 = 104초로 계획과 정확히 일치.
- **Ingredients는 샷당 최대 3장**: 캐릭터 + 핵심 소품 + 배경/스타일 조합으로 설계. 더 많은 일관성이 필요하면 Characters 기능으로 캐릭터를 등록해 `@이름` 호출 방식 병행.
- **샷 연결은 프레임 체이닝**: 각 샷의 마지막 프레임을 저장해 다음 샷의 시작 프레임으로 쓰면 컷 연결이 자연스러움. Scenebuilder에서 트림으로 타이밍 조정 후 씬 통째 다운로드.
- **크레딧 산정**: Fast 8s × 13샷 = 260크레딧(비-Ultra 기준, 재생성 제외). 재생성 2~3배수 감안 시 Pro(월 1,000+일일 50)로 빠듯할 수 있으니 Lite 드래프트 → Fast 파이널 분리 권장. 1080p 업스케일은 구독자 무료이니 최종 출력 전 반드시 적용.
- **한국 계정은 보이는 워터마크 자동 적용** — 브랜드 영상 최종본에 워터마크가 박히는지 프로필 메뉴에서 사전 확인 필요.
- **프롬프트는 영화 용어로**: `[카메라] + [피사체] + [동작] + [환경] + [스타일]` 공식 + `SFX:`/`Ambient noise:`/따옴표 대사. 텍스트 오버레이는 Veo가 약하니 핵심 카피는 후편집(외부 툴)에서 얹는 게 안전.
