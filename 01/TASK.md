# TASK

goal: Produce a citation-backed differentiation, AI-elevation, comparison-test, and interview STARR design for Setup, then save the frozen result in PLAN.md.
scope: a408_기획.md; public web sources about young-adult policy/finance pain points; RESEARCH/setup-differentiation_2026-08-22/**; PLAN.md.
exclusions: No implementation, no weekly roadmap, no external account access, no CAPTCHA/paywall bypass, no private-person data collection, no provider-as-competitor framing, no invented results.
authorization: Read public web sources; create research artifacts, TASK.md, and PLAN.md in this folder; no publish, commit, push, or external-system mutation.
baseline: CANDIDATE-002 was frozen after prior verification; user requested a stronger AI-centered supplement; CANDIDATE-003 is a new draft.

## Agent roster

| id | exact model | exact reasoning | role |
|---|---|---|---|
| worker-A | gpt-5.6-luna | max | community/forum user-pain research |
| worker-B | gpt-5.6-luna | max | video/SNS user-pain research |
| worker-C | gpt-5.6-luna | max | alternative behavior and provider constraints |
| verifier-problem | gpt-5.6-sol | high | independent problem-definition verification |
| designer-A | gpt-5.6-luna | max | divergent solution directions |
| designer-B | gpt-5.6-luna | max | divergent solution directions |
| verifier-final | gpt-5.6-sol | high | independent final spec/source verification |

## Tickets

| ticket | required | depends_on | owns | acceptance | check | wave | status |
| T-01 | REQUIRED | [] | RESEARCH/setup-differentiation_2026-08-22/worker-A.md | Community/forum findings use direct public URLs and separate fact, experience, inference | inspect worker artifact and source links | 1 | PASS |
| T-02 | REQUIRED | [] | RESEARCH/setup-differentiation_2026-08-22/worker-B.md | Video/SNS findings use public URLs or explicitly record blocked access | inspect worker artifact and source links | 1 | PASS |
| T-03 | REQUIRED | [] | RESEARCH/setup-differentiation_2026-08-22/worker-C.md | Alternative behaviors and provider roles/constraints are evidenced without competitor misclassification | inspect worker artifact and source links | 1 | PASS |
| T-04 | REQUIRED | [T-01,T-02,T-03] | RESEARCH/setup-differentiation_2026-08-22/problem-synthesis.md | One or two user problems are defined from evidence, not feature names | parent synthesis plus verifier | 2 | PASS |
| T-05 | REQUIRED | [T-04] | RESEARCH/setup-differentiation_2026-08-22/design-A.md | At least two directions cover non-AI and AI-required alternatives with test plans | inspect design artifact | 3 | PASS |
| T-06 | REQUIRED | [T-04] | RESEARCH/setup-differentiation_2026-08-22/design-B.md | Independent divergent directions cover UX and data/automation alternatives | inspect design artifact | 3 | PASS |
| T-07 | REQUIRED | [T-05,T-06] | PLAN.md | Final report contains all 12 requested outputs, direct links, explicit UNVERIFIED/BLOCKED items, and no fabricated outcomes | final verifier sign-off | 4 | PASS |

## Checklist

| ID | required | stage | environment | acceptance | method | status | candidate | evidence | verifier |
|---|---|---|---|---|---|---|---|---|---|
| A-01 | REQUIRED | SOURCE | STATIC | Community, video/SNS, and alternative/provider source families are covered or explicitly blocked | worker artifacts + parent source cross-check | PASS | CANDIDATE-003 | verifier-final-candidate-002.md | verifier-final-candidate-002 |
| A-02 | REQUIRED | SOURCE | STATIC | 1–2 problems pass independent checks for evidence, scope, provider role, and non-feature framing | problem-synthesis.md + verifier-problem | PASS | CANDIDATE-003 | verifier-problem.md | verifier-problem |
| A-03 | REQUIRED | SOURCE | STATIC | Selected direction and only its needed AI technologies have direct supporting sources and failure conditions | hero-ai-research.md + parent research | PASS | CANDIDATE-003 | verifier-final-candidate-003.md | verifier-final-candidate-003 |
| A-04 | REQUIRED | ARTIFACT | LOCAL | PLAN.md includes the 12 requested sections and preserves UNVERIFIED/BLOCKED boundaries | structural and link scan | PASS | CANDIDATE-003 | verifier-final-candidate-003.md | verifier-final-candidate-003 |
| A-05 | REQUIRED | ARTIFACT | LOCAL | Final artifact is frozen after independent read-only verification with no post-freeze mutation | SHA-256 manifest + verifier signature | PASS | CANDIDATE-003 | CANDIDATE-003.manifest.json; verifier-final-candidate-003.md | verifier-final-candidate-003 |

## Status

candidate: CANDIDATE-003
state: FROZEN
verdict: PASS
next: no further mutation; use PLAN.md as the frozen handoff
freeze_manifest: RESEARCH/setup-differentiation_2026-08-22/CANDIDATE-003.manifest.json
freeze_verifier: RESEARCH/setup-differentiation_2026-08-22/verifier-final-candidate-003.md
prior_freeze_manifest: RESEARCH/setup-differentiation_2026-08-22/CANDIDATE-002.manifest.json

## Telemetry

| id | model | wave | duration | result |
|---|---|---:|---:|---|
| worker-A | gpt-5.6-luna | 1 | not captured | PASS |
| worker-B | gpt-5.6-luna | 1 | not captured | PASS |
| worker-C | gpt-5.6-luna | 1 | not captured | PASS |
| verifier-problem | gpt-5.6-sol | 2 | not captured | PASS |
| designer-A | gpt-5.6-luna | 3 | not captured | PASS |
| designer-B | gpt-5.6-luna | 3 | not captured | PASS |
| verifier-final-candidate-001 | gpt-5.6-sol | 4 | not captured | FAIL (A-03/A-05) |
| verifier-final-candidate-002 | gpt-5.6-sol | 5 | not captured | PASS |
| verifier-final-candidate-003 | gpt-5.6-sol | 6 | not captured | PASS |
