## axis

축 E — 개발자·금융 실무 커뮤니티 + 오픈소스. 목표는 "금융 디지털 트윈"을 논문 개념이 아니라 **지금 코드로 옮길 수 있는 데이터 모델·알고리즘**으로 환원하는 것.

핵심 결론 먼저: 이 축에서 실제로 검증된 건 **반복결제 탐지(요구사항 2)와 정기결제 스케줄 데이터 모델**이다. Actual Budget의 `find-schedules.ts` 는 우리가 필요한 "정기결제·구독·할부 반복 패턴 탐지"를 ML 없이 휴리스틱으로 이미 구현해 놓았고, Firefly III는 반복거래를 5개 테이블로 정규화한 스키마를 제공한다. 이 두 개만으로 요구사항 2는 설계가 끝난다.

반대로 이 세션에서 **검증 실패**한 영역이 크다. 합성 데이터셋(6), 예측 라이브러리 비교(4), 도시 시각화(7), ABM/디지털트윈 프레임워크(7-8), 한국 커뮤니티 사례는 검색 예산이 소진되어 근거를 확보하지 못했다. 추측으로 채우지 않고 `## unverified_or_blocked` 에 그대로 남긴다. 이 문서는 축 E의 **부분 결과**로 읽어야 한다.

## queries_run

실행됨(결과 확보):

1. `Firefly III Recurrence RecurrenceRepetition model database schema recurring transactions github`
2. `Actual Budget find-schedules.ts recurring transaction detection algorithm loot-core`

실행됨(결과 미반환 / 절단):

3. `hledger --forecast periodic transactions syntax documentation`
4. `Beancount fava-envelope budget plugin recurring forecast plugin github`
5. `Maybe Finance archived repository fork Sure we-promise license`

미실행(예산 소진): 거래 분류 OSS·MCC 매핑, 한국어 가맹점명 정규화, Plaid recurring transactions API 문서, Nixtla/Darts/Prophet 커뮤니티 경험, PaySim/BankSim/Sparkov/SDV, Plaid Sandbox·Nessie·Belvo, Mesa/ABIDES/AgentPy/SimPy, Eclipse Ditto/DTDL, PixiJS/Phaser 아이소메트릭 성능, "digital twin은 마케팅 용어인가" 회의론 스레드.

## sources

title|URL|date|domain|type|grade

Actual Budget `find-schedules.ts` (loot-core 서버 스케줄 탐지 소스)|https://raw.githubusercontent.com/actualbudget/actual/master/packages/loot-core/src/server/schedules/find-schedules.ts|n/a (master 브랜치)|raw.githubusercontent.com|repo-source|B
actualbudget/actual 리포지토리|https://github.com/actualbudget/actual|n/a|github.com|repo|B
Firefly III `RecurrenceRepetition.php` 모델 소스|https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/app/Models/RecurrenceRepetition.php|n/a (main 브랜치)|raw.githubusercontent.com|repo-source|B
Firefly III `RecurrenceRepetition` 모델 (GitHub blob 뷰)|https://github.com/firefly-iii/firefly-iii/blob/main/app/Models/RecurrenceRepetition.php|n/a|github.com|repo-source|B
Recurring transactions — Firefly III documentation|https://docs.firefly-iii.org/explanation/financial-concepts/recurring/|n/a|docs.firefly-iii.org|official-docs|B
Easier installation and upgrade process · Issue #1123 · firefly-iii/firefly-iii|https://github.com/firefly-iii/firefly-iii/issues/1123|n/a|github.com|issue|C
firefly-iii/firefly-iii 리포지토리|https://github.com/firefly-iii/firefly-iii|n/a|github.com|repo|B

확보 소스 7개. **목표 20개 미달** — 사유는 `## unverified_or_blocked` 참조.

## oss_table

프로젝트|무엇|언어/스택|라이선스|스타 수|우리에게 쓸 수 있는 부분|URL

Actual Budget|로컬 우선 봉투(envelope) 예산 앱. `loot-core` 패키지에 서버측 스케줄 로직|TypeScript (loot-core 모노레포 패키지)|unverified (이 세션에서 확인 못 함)|unverified|**반복결제 탐지 알고리즘 전체**. `findSchedules()` 의 패턴 후보 생성 → ±2일 매칭 → 금액/거래처 검증 → 랭킹 → 거래처별 중복 제거 파이프라인을 그대로 이식 가능. RSchedule로 반복 규칙 전개|https://github.com/actualbudget/actual
Firefly III|셀프호스팅 개인 재무 관리자. 반복거래·규칙 엔진 보유|PHP / Laravel (Eloquent ORM)|unverified|unverified|**반복거래 정규화 스키마**. `recurrences` + `recurrences_repetitions` + `recurrences_meta` + `recurrences_transactions` + `recurrences_transaction_journals` 5테이블 구조와 `repetition_type`/`repetition_moment`/`repetition_skip`/`weekend` 4필드 반복 규칙 표현|https://github.com/firefly-iii/firefly-iii

라이선스와 스타 수를 비워둔 것은 의도적이다. 두 프로젝트 모두 널리 알려진 값이 있지만 이 세션에서 LICENSE 파일이나 리포지토리 헤더를 직접 확인하지 못했으므로 규칙대로 `unverified` 로 둔다. 채택 결정 전에 반드시 확인할 것 — 특히 Firefly III가 AGPL 계열이면 우리 서비스 배포 형태에 직접 영향을 준다.

## implementation_notes

### 요구사항 2 — 정기결제·구독·할부 반복 패턴 탐지

**커뮤니티가 실제로 쓰는 방법: ML이 아니라 "후보 스케줄 생성 후 검증" 휴리스틱.**

Actual Budget의 `findSchedules()` 는 범용 머신러닝 탐지기가 아니라 패턴 기반 휴리스틱이다. 동작 순서는 이렇다.

1단계, 계좌 스캔. 닫히지 않은 각 계좌마다 가장 최근 부모 거래를 찾아 그 날짜를 기준점으로 삼는다.

2단계, 후보 패턴 열거. 테스트하는 반복 유형은 6가지로 고정되어 있다.

| 패턴 | 비고 |
|---|---|
| 주간 | |
| 격주(2주) | |
| 매월 고정일 | **1~28일로 제한** |
| 매월 말일 | 별도 후보 탐색 2회 |
| 매월 첫째/셋째 요일 | 요일 서수 기반 |
| 매월 둘째/넷째 요일 | 요일 서수 기반 |

매월 고정일을 1~28일로 자른 건 중요한 설계 판단이다. 29·30·31일을 넣으면 2월과 짧은 달에서 규칙이 깨지므로, 말일 케이스를 아예 **별도 패턴**으로 분리했다. 우리도 한국 카드 결제일(말일 결제가 흔함)을 다룰 때 같은 분리가 필요하다.

3단계, 후보 날짜 전개. 각 시작일 후보마다 Actual 반복 설정을 만들고 RSchedule에 **첫 3회 발생**을 요청한다. 탐색 창은 대략 주간 4주 역방향·시작일 후보 14개, 격주 7주 역방향·14개, 매월 4개월 역방향·**62개**, 요일 기반 월간 약 2~8개월 역방향이다.

여기서 핵심은 전체 거래 이력을 분석하지 않는다는 점이다. **3회 발생을 설명하는 스케줄**만 찾는다. 계산량이 예측 가능하게 묶이고(패턴 6종 × 시작일 후보 최대 62개 × 발생 3회), 신규 구독도 3회차면 잡힌다. 우리 배치 계산 구조에 그대로 맞는다.

4단계, 근접 거래 조회. 각 예상 발생일마다 같은 계좌에서 `예상일 - 2일 ~ 예상일 + 2일` 범위 거래를 가져온다. 제외 대상은 (a) 이미 스케줄에 연결된 거래, (b) `payee.transfer_acct` 로 식별되는 계좌 간 이체다. ±2일 창 덕분에 1~2일 일찍/늦게 빠져나간 결제도 매칭된다. 주말·공휴일 이연 결제가 흔한 한국 환경에서 이 관용이 필수다. **이체를 제외하는 규칙은 요구사항 4(계좌 간 자금 이동)와 직접 충돌**하니 반드시 이식할 것 — 우리가 만든 자금 이동 스케줄이 다시 "구독"으로 오탐되는 사고를 막아준다.

5단계, 금액·거래처 매칭. 첫 발생일의 거래를 기준으로, 이후 모든 발생일에서 `baseAmount - threshold <= amount <= baseAmount + threshold` 를 만족하는 거래를 찾는다. 임계값은 `getApproxNumberThreshold(amount)` 가 금액에 따라 결정한다(고정값이 아니라 금액 비례). 그다음 **거래처는 정확히 일치**해야 한다.

함정이 여기 몰려 있다.

- 금액 호환 거래 중 **처음 찾은 것**을 쓴다. 같은 날 같은 거래처에 유사 금액이 2건이면 잘못된 쪽을 집을 수 있다.
- 거래처 매칭이 exact다. 한국 가맹점명은 `(주)`, 지점명, 단말기 번호, PG사 접두어가 붙어 표기가 흔들린다. **exact 매칭을 그대로 쓰면 한국 데이터에서 탐지율이 무너진다.** 우리 쪽에서는 정규화된 `merchant_key` 를 먼저 만들고 그 키로 exact 매칭하는 순서가 되어야 한다.
- **모든 발생일에 매칭이 있어야 한다.** 하나라도 비면 후보를 버린다. 즉 한 번 건너뛴 구독, 무료 체험 후 첫 결제, 카드 교체로 끊긴 결제는 탐지되지 않는다. 할부는 회차 금액이 일정하므로 유리하지만, 마지막 회차 잔액 조정이 들어가면 금액 임계값을 벗어날 수 있다.

6단계, 랭킹. 각 날짜 매칭 점수는 `rank = 1 / (abs(actualDate - expectedDate) + 1)` 이다.

| 날짜 차이 | 점수 |
|---:|---:|
| 0일 | 1.0 |
| 1일 | 0.5 |
| 2일 | 0.333… |

후보 총점은 첫 발생 포함 개별 점수의 합이고, 전부 정확히 맞으면 총점은 발생 횟수와 같아진다. 부수적으로 `exactDate`(모든 날짜 정확), `exactAmount`(모든 금액 동일) 플래그를 기록한다. 이 두 플래그가 우리에게 유용하다 — `exactAmount=true` 면 구독/할부처럼 **확정 금액**으로 미래 예측에 넣을 수 있고, false면 변동 청구(공과금)로 분류해 평균·분산으로 다뤄야 한다.

7단계, 중복 제거. 후보를 **거래처 기준으로만** 그룹핑해 거래처별 최고 점수 후보 하나만 남긴다. 결과 스케줄은 승자의 계좌·거래처·금액·반복 설정을 쓰고, 날짜가 정확하지 않았으면 근사 날짜 조건, 금액이 변동했으면 근사 금액 조건을 붙인다.

이건 명확한 한계다. **한 거래처에 여러 스케줄을 반환하지 않는다.** 같은 통신사에 회선 2개, 같은 플랫폼에 구독 2종이면 하나만 잡힌다. 우리는 그룹 키를 `(merchant_key, 금액대)` 로 넓히는 편이 안전하다.

### 반복 규칙을 어떻게 저장할 것인가 — Firefly III 스키마

Firefly III는 반복거래를 단일 테이블이 아니라 **테이블 그룹**으로 표현한다.

| 테이블 | 역할 |
|---|---|
| `recurrences` | 반복거래 정의와 스케줄 메타데이터 |
| `recurrences_repetitions` | 한 recurrence에 대한 **1개 이상**의 반복 규칙 |
| `recurrences_meta` | 추가 key/value 메타데이터 |
| `recurrences_transactions` | 해당 recurrence에 연결된 거래 템플릿 |
| `recurrences_transaction_journals` | 실제 거래 생성 시 쓰이는 저널/템플릿 데이터 |

이 기능은 반복 **출금·입금·이체**를 모두 지원한다. 이체를 지원한다는 점이 요구사항 4(계좌 간 자금 이동 스케줄링)에 직접 대응한다.

`RecurrenceRepetition` 모델은 `recurrences_repetitions` 테이블에 매핑되고 다음을 선언한다.

```php
protected $table = 'recurrences_repetitions';

protected $fillable = [
    'recurrence_id',
    'weekend',
    'repetition_type',
    'repetition_moment',
    'repetition_skip',
];
```

컬럼 구성:

| 컬럼 | 의미 |
|---|---|
| `id` | 정수 PK |
| `recurrence_id` | `recurrences.id` 외래키 |
| `repetition_type` | 스케줄 유형 문자열 |
| `repetition_moment` | 일/월/주 내 위치를 담는 문자열 |
| `repetition_skip` | 간격/건너뛰기 정수 |
| `weekend` | 주말 처리 동작 제어 정수 |
| `created_at` / `updated_at` | 타임스탬프 |
| `deleted_at` | soft delete용 nullable |

부모 `Recurrence` 모델에 `recurrence_id` 로 belongsTo 관계다.

설계상 배울 점 3개.

첫째, `(repetition_type, repetition_moment, repetition_skip)` 3필드 조합으로 RRULE 전체를 끌어오지 않고 실무 반복 패턴을 커버한다. Actual이 열거한 6패턴과 표현력이 대응한다 — 우리도 iCal RRULE 파서를 붙일 필요가 없다.

둘째, `weekend` 필드가 **독립 컬럼**으로 존재한다. 주말에 걸린 결제를 앞당길지·미룰지·그대로 둘지를 반복 규칙과 분리해 저장한다는 뜻이다. 한국 자동이체·카드 결제일 이연 규칙이 바로 여기 들어간다. 요구사항 4(출금 전 필요 금액 계산)의 정확도가 이 필드에 달렸다 — 결제일이 토요일이면 실제 출금이 금요일인지 월요일인지에 따라 필요 잔액 시점이 바뀐다.

셋째, recurrence 하나에 repetition이 **여럿**이다. "매월 15일 그리고 말일" 같은 복수 결제일을 단일 구독으로 묶을 수 있다.

주의: Firefly III는 마이그레이션으로 진화하므로 로컬 스키마가 `main` 브랜치와 다를 수 있다. 배포된 버전의 권위 있는 출처는 마이그레이션 이력과 DB 자체이며, 업그레이드 시 마이그레이션이 실행된다. 스키마를 참조 설계로 쓸 때는 특정 태그를 고정해서 읽어야 한다.

### 요구사항 1·3·4·5·6·7

이 세션에서 근거를 확보하지 못했다. `## unverified_or_blocked` 참조. 다만 위 두 구현에서 **파생되는** 설계 함의는 `## practical_steps` 에 적었다.

## datasets_and_sandboxes

이름|생성 방식|라이선스|현실성 평가|URL

(없음)|—|—|—|—

합성 데이터 항목은 **하나도 검증하지 못했다.** PaySim, BankSim, Sparkov, SDV/CTGAN, Kaggle 사기탐지 합성 데이터셋, Plaid Sandbox, Nessie, Belvo/Tink 모두 검색 예산 소진으로 접근하지 못했다. 요구사항 6이 프로젝트에서 필수인 만큼 이 칸이 빈 것은 이 문서의 가장 큰 결함이다. 다른 축 워커의 결과 또는 후속 세션으로 반드시 메워야 한다. 추측으로 채우지 않았다.

## claims

1. Firefly III의 `RecurrenceRepetition` 모델은 `recurrences_repetitions` 테이블에 매핑되며 `recurrence_id`, `weekend`, `repetition_type`, `repetition_moment`, `repetition_skip` 를 fillable로 선언한다. — https://raw.githubusercontent.com/firefly-iii/firefly-iii/main/app/Models/RecurrenceRepetition.php
2. Firefly III는 반복거래를 `recurrences`, `recurrences_repetitions`, `recurrences_meta`, `recurrences_transactions`, `recurrences_transaction_journals` 5개 테이블 그룹으로 표현하고, 반복 출금·입금·이체를 지원한다. — https://docs.firefly-iii.org/explanation/financial-concepts/recurring/
3. Firefly III 스키마는 마이그레이션으로 변경되므로 배포 버전의 실제 스키마는 `main` 브랜치와 다를 수 있고, 업그레이드 중 마이그레이션이 실행된다. — https://github.com/firefly-iii/firefly-iii/issues/1123
4. Actual Budget의 `findSchedules()` 는 머신러닝이 아닌 패턴 기반 휴리스틱이다. — https://raw.githubusercontent.com/actualbudget/actual/master/packages/loot-core/src/server/schedules/find-schedules.ts
5. 탐지 대상 패턴은 주간, 격주, 매월 고정일(1~28일 제한), 매월 말일, 매월 첫째/셋째 요일, 매월 둘째/넷째 요일 6종이다. — 위 동일
6. 각 시작일 후보마다 RSchedule로 첫 3회 발생만 생성해 검증하며, 전체 거래 이력을 분석하지 않는다. — 위 동일
7. 탐색 창은 주간 4주 역방향·시작일 후보 14개, 격주 7주 역방향·14개, 매월 4개월 역방향·62개, 요일 기반 월간 약 2~8개월 역방향이다. — 위 동일
8. 각 예상 발생일에 대해 `예상일 ± 2일` 범위의 동일 계좌 거래를 조회한다. — 위 동일
9. 이미 스케줄에 연결된 거래와 `payee.transfer_acct` 로 식별되는 이체는 후보에서 제외된다. — 위 동일
10. 금액 매칭은 `getApproxNumberThreshold(amount)` 가 반환하는 금액 의존 임계값을 사용하고, 거래처는 정확히 일치해야 한다. — 위 동일
11. 금액 호환 거래 중 처음 발견된 것을 사용하며, 발생일 중 하나라도 매칭이 없으면 해당 후보 스케줄은 폐기된다. — 위 동일
12. 랭킹 점수는 `rank = 1 / (abs(actualDate - expectedDate) + 1)` 로, 0일=1.0, 1일=0.5, 2일≈0.333이며 후보 총점은 개별 점수의 합이다. — 위 동일
13. 알고리즘은 `exactDate`(모든 날짜 정확 일치)와 `exactAmount`(모든 금액 정확 동일) 플래그를 기록한다. — 위 동일
14. 후보는 거래처 기준으로만 그룹핑되어 거래처별 최고 점수 1개만 남으므로, 동일 거래처에 대해 복수 스케줄을 반환하지 않는다. — 위 동일

## practical_steps

1. **Actual의 `find-schedules.ts` 를 읽고 6패턴 열거 + ±2일 매칭 + 랭킹 구조를 우리 배치 잡으로 이식한다.** 요구사항 2의 기본 구현으로 확정. 새 알고리즘을 발명하지 않는다. 계산량이 (패턴 6 × 시작일 후보 ≤62 × 발생 3)로 묶여 서버 배치에 적합하다.
2. **거래처 exact 매칭 앞단에 한국어 가맹점명 정규화 레이어를 넣는다.** `(주)`·지점명·단말기번호·PG 접두어를 제거한 `merchant_key` 를 만들고 그 키로 exact 비교. 이 단계를 빼면 Actual 알고리즘의 탐지율이 한국 데이터에서 붕괴한다. (정규화 사례 조사는 미완 — blocked 참조)
3. **중복 제거 키를 거래처 단독에서 `(merchant_key, 금액대)` 로 확장한다.** 동일 거래처 복수 구독을 잡기 위한 최소 수정.
4. **반복 규칙 저장은 Firefly III 스키마를 축약해 채택한다.** `repetition_type`/`repetition_moment`/`repetition_skip`/`weekend` 4필드 + recurrence 1:N repetition. RRULE 파서를 도입하지 않는다.
5. **`weekend` 필드를 1번 배치가 아니라 스키마 초기 설계부터 넣는다.** 한국 자동이체 주말 이연 규칙이 요구사항 4(출금 전 필요 금액 계산)의 시점 정확도를 좌우한다. 나중에 추가하면 예측 로직 전체를 다시 만져야 한다.
6. **탐지 결과의 `exactAmount` 플래그로 미래 현금흐름 항목을 2분류한다.** true는 확정 금액(구독·할부)으로 결정적 계산, false는 변동 청구(공과금)로 통계적 추정. 이 분기가 요구사항 3(월말 잔액 예측)과 5(what-if)의 정확도 경계를 만든다.
7. **요구사항 2가 요구사항 5의 엔진이 된다.** 탐지된 스케줄 목록에서 항목 하나를 제거하고 미래 발생을 재전개하면 "이 구독 해지하면 6개월 뒤" 답이 나온다. what-if를 위한 별도 시뮬레이션 엔진이 필요한지는 이 방식을 먼저 만들어 본 뒤 판단한다.
8. **차단된 영역(합성 데이터, 예측 라이브러리, 시각화)은 별도 리서치 세션으로 넘긴다.** 특히 합성 데이터셋은 요구사항 6에서 필수이므로 최우선.

## skepticism

**Actual 알고리즘의 구조적 한계 3개.** (a) 3회 발생 전부 매칭을 요구하므로 결제 실패·건너뛴 달·카드 교체로 끊긴 시퀀스는 탐지되지 않는다. 실사용 구독 데이터에는 이런 구멍이 흔하다. (b) 거래처별 1개 스케줄만 반환한다. (c) 금액 호환 거래 중 첫 번째를 무조건 채택해 동일 거래처·유사 금액 다건에서 오매칭 여지가 있다. 이건 "잘 만든 휴리스틱"이지 정확한 탐지기가 아니다. 재현율보다 정밀도를 택한 설계이고, 우리도 같은 트레이드오프를 받아들이는지 명시적으로 결정해야 한다.

**exact 거래처 매칭의 이식 위험.** 영어권 거래처명 기준으로 만들어진 규칙이다. 한국 카드 전표 문자열의 변동성을 감안하면 이 부분은 이식이 아니라 재작성이다. 정규화 품질이 곧 기능 품질이 된다.

**Firefly III 스키마 참조의 함정.** `main` 브랜치 모델은 진행 중인 스냅샷이다. 마이그레이션 기반으로 진화하며 배포 버전의 실제 스키마는 다를 수 있으므로, 설계 참조로 쓸 때 특정 릴리스 태그를 고정하지 않으면 존재하지 않는 컬럼을 베끼게 된다.

**라이선스 미확인이 실질 리스크다.** 두 프로젝트의 라이선스를 확인하지 못했다. 코드를 이식할 계획이라면 이건 선택이 아니라 선결 조건이다. 알고리즘 아이디어 참조와 소스 이식은 법적으로 다른 행위다. 특히 셀프호스팅 재무 앱 생태계에는 copyleft 계열이 흔하므로, 우리 서비스가 네트워크 배포 형태라면 AGPL류는 전염 범위를 반드시 따져야 한다.

**"디지털 트윈" 명명에 대한 이 축의 관찰.** 위 두 프로젝트는 어느 쪽도 자신을 디지털 트윈이라 부르지 않는다. 반복거래 모델 + 미래 발생 전개 + 예산 잔액 계산으로 우리가 원하는 기능을 이미 제공한다. 이는 요구사항 1~5가 디지털 트윈 프레임워크(Eclipse Ditto, DTDL 등) 없이 **일반 스케줄링·예산 도메인 모델로 구현 가능하다**는 방향을 시사한다. 프레임워크 도입 검토보다 도메인 모델 이식이 비용 대비 효과가 크다는 가설이고, 커뮤니티 회의론 스레드 수집이 미완이라 확정 근거는 아니다.

## unverified_or_blocked

**검색 예산 소진이 원인이다.** 5개 쿼리 중 2개만 결과를 반환했고(3~5번은 절단), 이후 추가 검색을 실행할 수 없었다. 병렬 서브에이전트로 분산하려 했으나 `agent thread limit reached` 로 실패했다(동시 슬롯 11개가 다른 축 워커로 이미 점유). 결과적으로 목표 20개 소스 중 7개만 확보했다.

전혀 조사되지 않은 항목:

- **요구사항 1 거래 분류** — bank transaction categorization OSS, MCC 매핑 데이터, 한국어 가맹점명 정규화 사례. 근거 0.
- **요구사항 3·4 예측** — Nixtla(statsforecast/neuralforecast), Darts, Prophet, sktime, Merlion의 희소·소액 다수 거래 시계열 실무 적합성. 커뮤니티 경험 0. '페이스'(소진률÷월진행률) 판정과 burn-rate/days-remaining 메트릭을 계산하는 OSS 선례도 미확인.
- **요구사항 6 합성 데이터** — PaySim, BankSim, Sparkov, SDV/CTGAN, Kaggle 합성 사기탐지 데이터셋, Plaid Sandbox, Nessie, Belvo/Tink sandbox. 라이선스·현실성 평가 전무. **프로젝트 필수 항목인데 완전 공백.**
- **요구사항 7 시각화** — PixiJS, Phaser, Flutter Flame, react-three-fiber, Godot 웹빌드의 2D 아이소메트릭 성능·에셋 관리 경험담. 근거 0.
- **ABM/시뮬레이션** — Mesa, ABIDES, AgentPy, SimPy의 개인 소비 시뮬레이션 적용 사례. 근거 0.
- **디지털 트윈 프레임워크** — Eclipse Ditto, Azure Digital Twins DTDL, Eclipse Vorto의 금융 도메인 적합성 커뮤니티 의견. 근거 0.
- **회의론 스레드** — "digital twin은 마케팅 용어인가", 개인 재무 예측 실패 사례담. 근거 0.

부분 조사(쿼리는 던졌으나 결과 미확보):

- hledger `--forecast` 와 periodic transaction `~` 문법. what-if 엔진의 기성 선례로 유력했으나 확인 못 함.
- Beancount/Fava 예산 플러그인(fava-envelope 등), Beancount recurring/forecast 플러그인.
- Maybe Finance 아카이브 여부(2025-07-27 추정)와 커뮤니티 포크 Sure(we-promise/sure). **아카이브 사실 자체가 미검증**이므로 이 문서 본문에서는 두 프로젝트를 다루지 않았다.
- GnuCash Scheduled Transactions(SX) 엔진, ledger-cli, Ghostfolio, Wealthfolio, ExpenseOwl, Financial Freedom.
- Plaid Recurring Transactions API 문서 — 상용 레퍼런스 구현으로 가치가 높았을 항목.

**모든 라이선스와 GitHub 스타 수 미확인.** Actual Budget, Firefly III 양쪽 모두. 규칙에 따라 추측하지 않고 `unverified` 로 표기했다.

**날짜 정보 부재.** 확보한 소스는 브랜치 기준 소스 파일과 버전 없는 문서 페이지라 게시/갱신 일자를 특정할 수 없어 `n/a` 로 두었다. 2025/2026 프레시니스 검증이 이루어지지 않았다.

