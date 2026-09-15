# Roman Editorial Gate core preflight

- artifact：`roman-editorial-core-preflight`
- 版本：v0.1
- evaluated_at：`2026-08-31T02:58:26Z`（`2026-08-31T10:58:26+08:00`）
- gate：`editorial-gate v0.1`
- scope：G1–G4；G5 素材線另由 material preflight artifact 整合
- provisional overall：`UNKNOWN`
- story_package_ref：`null`

## 結論

Roman 的 freshness、why now 與 audience payoff 均可由 NASA 第一方來源閉合；但 interest G4 因事前鎖定的 behavior baseline 少一支合格 comparator，必須維持 `UNKNOWN`。即使 G5 素材 preflight 通過，整體 Editorial Gate 目前仍不能 PASS。

## G1 Freshness — `PASS`

```yaml
freshness_anchor_at: 2026-08-30T11:26:00Z
freshness_anchor_type: actual_liftoff
evaluated_at: 2026-08-31T02:58:26Z
age_hours: 15.540556
event_source_url: https://science.nasa.gov/blogs/roman/2026/08/30/nasas-roman-space-telescope-launches/
source_published_at: 2026-08-30T07:26:00-04:00
source_checked_at: 2026-08-31T02:53:35Z
timezone: EDT/UTC
exception_code: null
```

NASA launch blog 明示 `August 30, 2026 7:26AM` 與 7:26 a.m. EDT liftoff；評估時 age=`15.540556 h`，在 rolling 168 小時內。Anchor 是實際升空，不是預告或頁面更新日。

## G2 Why now — `PASS`

- trigger：Roman 已於 8/30 實際升空；NASA 隨後確認與 Falcon Heavy 分離，並成功部署太陽能板與下層遮陽罩。
- before state：Roman 是已完成、等待發射與 commissioning 的觀測站，科學能力仍是未啟用的任務承諾。
- new state：它已離開地球、開始約三個月前往 L2 的旅程，進入 deployment／commissioning 階段。
- immediate consequence/question：現在值得回答的不是「NASA 又做一台望遠鏡」，而是它與 Hubble／Webb 的分工，以及何時才會有第一批真正科學影像。
- primary sources：
  - [NASA launch release](https://www.nasa.gov/news-release/nasas-dark-universe-seeking-nancy-grace-roman-space-telescope-launches/)
  - [NASA 7:26 EDT launch blog](https://science.nasa.gov/blogs/roman/2026/08/30/nasas-roman-space-telescope-launches/)
- claim status：`confirmed`。
- boundary：不可把升空改寫成已產生暗物質、暗能量或系外行星新發現。

## G3 Audience payoff — `PASS`

```yaml
story_type: science_mission_milestone
payoff_statement: 因為 Roman 已從「等待發射」進入實際航行與 commissioning，一般觀眾現在可以理解它不是取代 Hubble 或 Webb，而是用更大的巡天範圍快速找出值得後續深挖的天體與事件。
viewer_question_answered: 已經有 Hubble 與 Webb，為什麼還需要 Roman？
technology_or_product_delta: NASA 表示 Roman 以大視野、紅外觀測與快速 survey 組合，設計巡天速度為 Hubble 的 1000 倍；Wide Field Instrument 為 300MP、含 18 個 4K detectors。
affected_audience: 沒時間追完整發射與任務說明的一般科技／科學觀眾
practical_consequence: 觀眾能區分「廣域快速盤點」與「窄域深度觀測」，並知道目前只完成升空與初期 deployment，科學成果尚未出現。
constraint_or_boundary: 所有性能數字是 NASA 第一方任務設計主張；三個月 commissioning 尚未完成，NASA 預計最早 2027 年初發布首批影像。
supporting_claim_ids: [R-C01, R-C02, R-C03, R-C04]
claim_attribution: NASA official release
exception_code: null
```

### Claim ledger

| ID | 可用事實 | 狀態／歸因 | 禁止推論 |
|---|---|---|---|
| R-C01 | 8/30 07:26 EDT 升空；31 分鐘後與火箭分離 | `confirmed`／NASA | 不等於 commissioning 完成 |
| R-C02 | 1 小時 23 分後確認太陽能板與 lower instrument sun shade 部署 | `confirmed`／NASA | 不等於全部 deployment 或儀器測試完成 |
| R-C03 | NASA 設計主張：巡天速度為 Hubble 的 1,000 倍 | `confirmed first-party claim`／NASA | 不可改寫成已獨立實測或影像品質 1,000 倍 |
| R-C04 | 三個月 commissioning；NASA 預計 2027 年初首批影像 | `confirmed schedule`／NASA | 不可提前宣稱科學發現 |

## G4 Interest signals — `UNKNOWN`

Canonical evidence：[`roman-interest-proxy-measurement v0.1`](./2026-08-31-roman-interest-proxy-measurement.md)。

- 正向 observation：NASA official launch replay 在 `2026-08-31T02:52:07Z–02:52:11Z` capture 為 `1,015,203` views。
- editorial breadth：AP 與 El País 兩個 distinct parent owners，固定 48 小時 window 內 `2/2`，Proxy B=`PASS`。
- 阻斷：YouTube premeasurement lock 要求三支同頻道、target 前 168 小時內 comparator；只有兩支合格，第三支距 target `280.046 h`。
- 決定：audience-behavior baseline 無效，`interest_signals=UNKNOWN`；百萬 views 不得單獨補成 PASS。

## Provisional Gate block

```yaml
gate_version: v0.1
evaluated_at: 2026-08-31T02:58:26Z
candidate_id: roman-launch-2026-08-30
topic: NASA Nancy Grace Roman Space Telescope launch
audience: 一般科技觀眾
content_promise: 替沒時間且主要滑 Reels／短影音的人整理最新科技時事
criteria:
  freshness: {status: PASS, reason_code: FR_ACTUAL_LIFTOFF}
  why_now: {status: PASS, reason_code: WN_LAUNCH_TO_COMMISSIONING}
  audience_payoff: {status: PASS, reason_code: AP_WIDE_SURVEY_COMPLEMENT}
  interest_signals: {status: UNKNOWN, reason_code: IS_BEHAVIOR_BASELINE_INCOMPLETE}
  visual_source_fit: {status: UNKNOWN, reason_code: PENDING_MATERIAL_PREFLIGHT}
overall_status: UNKNOWN
hard_fail_reasons: []
unknowns: [interest_behavior_baseline, visual_source_fit]
exception_codes: []
publication_hold: true
story_package_ref: null
next_action: RESOLVE_WITHIN_WINDOW
```

## 停止邊界

本 artifact 不建立 Story Package、不選最終素材、不授權下載或 render。Material preflight 回來後只整合 G5；G4 不因 G5 結果改變。
