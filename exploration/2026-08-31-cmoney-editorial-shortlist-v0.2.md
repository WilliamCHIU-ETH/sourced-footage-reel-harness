# CMoney Editorial Shortlist v0.2

## 唯一明確結論

**正式推薦：`NO_RECOMMENDATION`。** 本輪三題目前是 `0 EDITORIAL_PASS`：C1 為 `EDITORIAL_UNKNOWN`，C2、C3 為 `EDITORIAL_FAIL`。因此沒有任何題材可進 Story Package、run 或 render。**「補證優先 C1」只代表下一個研究順序，不是 render 推薦，也不得改寫成已通過 Editorial Gate。**

- artifact_version：`v0.2`
- gate_version：`cmoney-editorial-v0.2`
- evaluated_at：`2026-08-31T14:48:05+08:00`
- checked_at：`2026-08-31T14:48:05+08:00`
- audience：主要透過 Reels／短影音接收市場資訊、沒有時間完整追新聞的 CMoney 財經觀眾
- formal_recommendation：`NO_RECOMMENDATION`
- editorial_pass_count：`0`
- publication_hold：`true`（三題皆是）

## Decision Lock

1. 本 artifact 只依據下列兩份已查核文件，不新增網路查核、未驗證數字或第二套 Gate：
   - `exploration/2026-08-31-cmoney-editorial-gate-v0.2.md`
   - `exploration/2026-08-31-cmoney-editorial-evidence-packet-v0.1.md`
2. Gate 恰有七項：`freshness`、`why_now`、`financial_relevance`、`viewer_payoff`、`interest_signals`、`visual_source_fit`、`audio_role_fit`。
3. 七項全 PASS 才能是 `EDITORIAL_PASS`；任一 FAIL 即為 `EDITORIAL_FAIL`；無 FAIL 但至少一項 UNKNOWN 即為 `EDITORIAL_UNKNOWN`。
4. 目前三題沒有任何 `EDITORIAL_PASS`，所以正式推薦欄只能是 `NO_RECOMMENDATION`。
5. C1 排在「補證優先」第一名，不等於推薦製作；在 G5、G6、G7 補齊前，不得下載、建 run 或 render。
6. 市場價格、殖利率、成交與單日股價反應只能協助證明市場變數受到關注，**不能**當成 CMoney audience-behavior baseline，也不能替代 G3 財經因果鏈。
7. 公司展望、產品進度、性能、需求與財測均保留第一方歸因；不得把 forward-looking statement 改寫為已實現成果。
8. 三題權利均未完成，固定 `publication_hold=true`；可公開定位或可見，不等於可重剪、可商用或可發布。

---

## C1 候選卡｜Fed Jackson Hole：Warsh 的鷹派訊號

### 卡片身份

| 欄位 | 值 |
|---|---|
| candidate_id | `C1-fed-jackson-hole-warsh-2026-08-28` |
| topic | Fed 主席 Warsh 在 Jackson Hole 將市場推向「可能升息」的重定價 |
| one_sentence_angle | Warsh 沒有直接宣布升息，但他把通膨降得不夠快時 Fed 仍須行動的條件說清楚；投資人下一步應看 9 月 FOMC、下一次 PCE 與兩年期殖利率，而不是把演說誤寫成已升息。 |
| event_at | `2026-08-28T10:00:00-04:00`（Kansas City Fed 事前公告 10:00 EDT；台北 `2026-08-28T22:00:00+08:00`） |
| evaluated_at | `2026-08-31T14:48:05+08:00` |
| checked_at | `2026-08-31T14:48:05+08:00` |
| age_hours | 約 `64.8` |
| anchor_type | 官方央行主席演說與活動議程 |
| overall_status | `EDITORIAL_UNKNOWN` |
| next_action | `RESOLVE_WITHIN_WINDOW`（只補證，不進 production） |
| publication_hold | `true` |

### 觀看價值

替投資人分清楚「鷹派政策訊號」與「正式 FOMC 決議」的差別，並說明為什麼同一句政策表述會先反映在兩年期美債、美元與高估值資產，而不是直接把一次演說包裝成全面股災。觀眾看完應知道下一個具名觀察點是 9 月 FOMC、下一次 PCE，以及兩年期殖利率的重定價能否維持。

### 七項 Gate 判定

| Gate | Status | 直接證據與判斷 | Coverage gap／通過條件 |
|---|---|---|---|
| G1 `freshness` | **PASS** | 官方活動與書面演說 anchor 為 `2026-08-28T10:00:00-04:00`；相對 `evaluated_at` 約 `64.8` 小時，在 rolling 168 小時內。來源：C1-S1、C1-S2。 | 無時間缺口；事件時區與 anchor 可回查。 |
| G2 `why_now` | **PASS** | Before：市場仍在判斷新主席會否容忍偏高通膨。New：Warsh 列出 PCE 12 個月 `3.7%`、6 個月 `4.1%`，並表示 underlying inflation 若未明確且足夠快回到 2%，Fed 就有工作要做。Immediate consequence：AP 記錄兩年期殖利率 `4.22% → 4.35%`。 | 這是演說，不是 FOMC 決議；後續就業與通膨數據可使市場反向重定價。 |
| G3 `financial_relevance` | **PASS** | 因果鏈完整：演說訊號 → 升息機率／前端利率與美元上升 → 折現率、融資成本與成長股估值承壓 → 美股與美元資產 → 觀察 9 月 FOMC、下一次 PCE、兩年期殖利率。來源：C1-S1、C1-S4、C1-S5。 | 市場反應可支持重定價發生，但不得宣稱所有資產波動都由單一演說完全造成。 |
| G4 `viewer_payoff` | **PASS** | 發生什麼：鷹派演說。為何在乎：前端利率與美元重定價。影響誰：高估值資產、融資成本敏感部位與美元資產。下一訊號：FOMC、PCE、兩年期殖利率。限制：演說不是決策；S&P 500 當日約 `-0.2%`、Nasdaq 約 `-0.5%`，不是全面股災。 | 後續片稿必須持續使用「可能」「市場重定價」而非「Fed 已升息」。 |
| G5 `interest_signals` | **UNKNOWN** | 可見 proxy 包括官方 YouTube `59,659` views／`639` likes，以及 Reddit r/investing 約 `+154`、r/stocks 約 `+56`；市場反應另見 AP／Reuters syndication。 | 沒有事前鎖定、同母體 comparator baseline、region 與 CMoney audience 母體；市場反應不算 audience baseline，因此不能 PASS。 |
| G6 `visual_source_fit` | **UNKNOWN** | Kansas City Fed 官方議程直接連到官方演說實景 YouTube；metadata-only probe 顯示 `32:26`、`1280×720`、30fps，畫面可直接展示 Warsh 發言，不是通用 B-roll。來源：C1-S2、C1-S3。 | 官方頁目前只連 YouTube；repo 已知匿名 YouTube 下載會在 41.5% 遭 HTTP 403，故不能視為穩定取得來源。仍缺非 YouTube 官方動態檔、畫面 mapping、publication rights。 |
| G7 `audio_role_fit` | **UNKNOWN** | 建議 `TRANSLATE_SOURCE`：保留 2–3 段真正影響政策判斷的英文原聲，繁中字幕依語意對齊。Sound-on 可聽原句與政策語氣；sound-off 由完整繁中翻譯獨立成立。 | `rights_status=UNKNOWN`；來源尚不可穩定取得，且缺逐句翻譯、時間對齊與 QA。`current_harness_compatible=UNKNOWN`。 |

### G3 必填財務鏈

- financial_chain：政策演說訊號 → 升息機率、前端利率與美元 → 折現率／融資成本／成長股估值 → 美股與美元資產 → FOMC、PCE、兩年期殖利率。
- affected_entities_or_assets：美國兩年期公債、美元、美股成長股、高估值科技資產。
- mechanism_claims：較高政策利率預期可提高前端殖利率、融資成本與估值折現率；這是市場機制判斷，不是每一筆資產變動的單一因果證明。
- next_observable：`9 月 FOMC`、下一次 `PCE`、兩年期殖利率是否維持重定價。
- counterfactual：若就業／通膨數據轉弱，或 FOMC 未延續演說的鷹派條件，市場可反向重定價。
- source_urls：C1-S1、C1-S4、C1-S5。

### G4 四個觀眾答案

1. 發生什麼事：Warsh 在 Jackson Hole 提出通膨若未足夠快回到 2%，Fed 仍須行動的條件。
2. 市場為什麼在乎：短天期利率與美元先反映升息機率變化，進而改變融資成本與估值假設。
3. 誰可能受影響：債券、美元與高估值成長資產；方向不是保證，且股市當日反應有限。
4. 下一個具名訊號：9 月 FOMC、下一次 PCE、兩年期殖利率。

### G7 聲音角色

- audio_mode：`TRANSLATE_SOURCE`（建議，尚未通過）
- audio_job：讓觀眾直接聽見影響判斷的政策原句及語氣。
- sound_on_experience：英文原聲搭配忠實、語意對齊的繁中翻譯。
- sound_off_experience：繁中字幕獨立交代事件、財務影響、限制與下一訊號。
- speech_translation_required：`true`
- rights_status：`UNKNOWN`
- current_harness_compatible：`UNKNOWN`
- execution_gap：非 YouTube 官方檔、授權、逐句翻譯與時間對齊 QA 均未完成。

### 目前可取得素材直接證據

- **存在證據**：Kansas City Fed 2026 Symposium 官方議程列有 Video Remarks，精確連到 C1-S3 的官方演說實景。
- **metadata-only 證據**：C1-S3 為公開 `32:26`、`1280×720`、30fps；查核快照為 `59,659` views、`639` likes。未下載。
- **現行取得結論**：只能確認存在與內容適配，不能確認可由 harness 穩定取得；YouTube 不是本 repo 可採用的 acquisition source。

### 主要風險

1. 把鷹派演說誤寫成已決定升息。
2. 把兩年期殖利率與單日股市反應當成所有資產變動的單一因果證明。
3. 把 YouTube 公開可見誤寫成素材可穩定取得或可重剪發布。
4. 把 views、likes、Reddit score 或市場反應誤當 CMoney audience baseline。
5. 英文政策原聲若未逐句翻譯對齊，可能形成兩套互相競爭的敘事。

### Confirmed／Inferred／Unknown

**Confirmed**

- 官方演說、活動時間、PCE／CPI 判斷與政策條件可由 C1-S1、C1-S2 回查。
- AP 報導兩年期殖利率由 `4.22%` 升至 `4.35%`，S&P 500 約 `-0.2%`、Nasdaq 約 `-0.5%`。
- 官方演說動態畫面存在於 C1-S3；metadata-only probe 已完成，未下載。

**Inferred**

- 若升息機率維持，較高前端利率可能透過融資成本與折現率壓抑高估值資產。

**Unknown**

- CMoney audience-behavior baseline 與可比較的事前 interest proxies。
- 非 YouTube 官方動態檔、匿名穩定取得路徑與 publication rights。
- 最終可用原聲段落、忠實翻譯與時間對齊 QA。

### C1 直接來源 ledger

所有列的 `checked_at` 均為 evidence packet 的 `2026-08-31T14:48:05+08:00`。

| ID | 直接 URL | 用途 | checked_at |
|---|---|---|---|
| C1-S1 | https://www.federalreserve.gov/newsevents/speech/warsh20260828a.htm | Federal Reserve 書面演說、日期與政策原文 | `2026-08-31T14:48:05+08:00` |
| C1-S2 | https://www.kansascityfed.org/research/jackson-hole-economic-symposium/2026/ | Kansas City Fed 活動日期、時區、議程與 Video Remarks | `2026-08-31T14:48:05+08:00` |
| C1-S3 | https://www.youtube.com/live/0UIKsanJb84 | Kansas City Fed 官方演說實景；僅 metadata-only probe | `2026-08-31T14:48:05+08:00` |
| C1-S4 | https://apnews.com/article/0a655f1c042b059279343443d5802907 | 兩年期殖利率及美股反應 | `2026-08-31T14:48:05+08:00` |
| C1-S5 | https://www.marketscreener.com/news/stocks-fall-while-dollar-bond-yields-rise-as-warsh-prompts-rate-hike-bets-ce7858dfd080f724 | Reuters syndication 的股、債、美元反應與因果限制 | `2026-08-31T14:48:05+08:00` |
| C1-S6 | https://www.reddit.com/r/investing/comments/1w15faz/warsh_at_jackson_hole_sticky_37_pce_pushes/ | r/investing 易變討論快照，非 baseline | `2026-08-31T14:48:05+08:00` |
| C1-S7 | https://www.reddit.com/r/stocks/comments/1w0wboi/rate_hike_odds_increased_after_jackson_hole_why/ | r/stocks 易變討論快照，非 baseline | `2026-08-31T14:48:05+08:00` |

### C1 disposition

- hard_fail_reasons：無。
- unresolved_gates：G5、G6、G7。
- publication_hold：`true`。
- **補證優先第一，不是 render 推薦。**

---

## C2 候選卡｜NVIDIA Q2 FY27 財報與 Vera Rubin 量產

### 卡片身份

| 欄位 | 值 |
|---|---|
| candidate_id | `C2-nvidia-q2-fy27-rubin-2026-08-26` |
| topic | NVIDIA Q2 FY27 財報、Q3 指引與 Vera Rubin 量產 |
| one_sentence_angle | 營收翻倍只是表面；真正要看的是 NVIDIA 能否把 Vera Rubin 量產、供給限制與雲端資本支出轉成下一季 `1,080 億美元 ±2%` 的收入。 |
| event_at | `2026-08-26T17:00:00-04:00`（官方 earnings-call transcript 5:00 PM ET；台北 `2026-08-27T05:00:00+08:00`） |
| evaluated_at | `2026-08-31T14:48:05+08:00` |
| checked_at | `2026-08-31T14:48:05+08:00` |
| age_hours | 約 `105.8` |
| anchor_type | 官方季度財報與 earnings call |
| overall_status | `EDITORIAL_FAIL` |
| next_action | `REJECT`（本 cycle 停止） |
| publication_hold | `true` |

### 觀看價值

不只朗讀 EPS 或營收，而是把「AI 需求很強」拆成可追蹤框架：下一季收入、Data Center 成長、Rubin 量產／供給。觀眾也能知道公司 forward-looking statement 尚未等於已實現收入，並用 10-Q 的基礎設施、融資與導入速度風險限制過度樂觀推論。

### 七項 Gate 判定

| Gate | Status | 直接證據與判斷 | Coverage gap／通過條件 |
|---|---|---|---|
| G1 `freshness` | **PASS** | 官方 earnings-call anchor 為 `2026-08-26T17:00:00-04:00`；相對 `evaluated_at` 約 `105.8` 小時，在 rolling 168 小時內。來源：C2-S1、C2-S2。 | 無時間缺口；官方 transcript 可回查精確時間。 |
| G2 `why_now` | **PASS** | Before：市場已知 AI 算力需求強，但擔心高基期與 capex 回報。New：NVIDIA 公布 Q2 營收 `962 億美元`（QoQ `+18%`、YoY `+106%`）、Data Center `890 億美元`（YoY `+117%`），並稱 Vera Rubin 已全面量產。Immediate question：能否轉成 Q3 `1,080 億美元 ±2%`。 | 數字與量產狀態是公司披露；未來收入與 ramp 不是已實現成果。 |
| G3 `financial_relevance` | **PASS** | 財報／指引與 Rubin ramp → GPU 供需、產品組合與毛利 → NVIDIA 收入／毛利與 hyperscaler capex → NVIDIA 與雲端平台 → 觀察 Q3 實際收入、Rubin ramp、供給限制。來源：C2-S1、C2-S2、C2-S3。 | 客戶基礎設施、資金與採用速度可能延後採購和收入時點；須保留 10-Q 反證。 |
| G4 `viewer_payoff` | **PASS** | 發生什麼：財報、指引、Rubin 量產。為何在乎：需求能否轉為收入與毛利。影響誰：NVIDIA、hyperscaler 與雲端平台。下一訊號：Q3 實際收入、Data Center、Rubin ramp／供給。限制：公司展望未實現。 | 片稿不得只報大數字或把 Rubin 量產直接等同收入落袋。 |
| G5 `interest_signals` | **UNKNOWN** | r/stocks 財報帖查核時約 `+851`；財報後交易與市場疑慮另見 AP、Reuters syndication。 | 沒有事前鎖定、同母體 earnings comparator baseline、region 或 CMoney audience 母體；單日股價／交易量不是 audience baseline。 |
| G6 `visual_source_fit` | **FAIL** | 財報 newsroom DOM 只有一張檔名含 `DH1L4415-HDR-20220527-r5` 的舊靜態圖；Media Assets 的 Rubin featured asset 是 `Photo`、`274.5 kB`；Corporate B-Roll 本次未列可用 item；IR webcast 是音訊，不是同事件動態畫面。來源：C2-S1、C2-S7、C2-S8。 | 缺同事件、官方、非 YouTube、可取得的動態素材。依 Gate 不得以舊圖、靜態圖或泛用 B-roll 冒充財報現場。 |
| G7 `audio_role_fit` | **FAIL** | 唯一合理角色是 `ZH_VOICEOVER`，但本輪現有固定形式是來源原聲＋自寫字幕，且禁止擴張 pipeline；IR webcast 音訊沒有同事件動態畫面可支撐。 | 新增旁白、motion／資料視覺與相應權利超出本輪範圍；來源音訊保留也無法解決視覺不符。 |

### G3 必填財務鏈

- financial_chain：財報／指引與 Rubin ramp → GPU 供需、產品組合與毛利 → NVIDIA 收入／毛利與 hyperscaler capex → NVIDIA 與雲端平台 → Q3 實際收入、Rubin ramp、供給限制。
- affected_entities_or_assets：NVIDIA、hyperscaler、雲端平台。
- mechanism_claims：量產與需求可提高供給與收入可見度，但客戶基礎設施、融資及採用速度會影響採購和認列時點。
- next_observable：Q3 實際營收是否達 `1,080 億美元 ±2%`、Data Center 成長、Rubin ramp、供給限制是否改善。
- counterfactual：若客戶 capex、融資、基礎設施或部署速度延後，需求主張不一定按公司時程成為收入。
- source_urls：C2-S1、C2-S2、C2-S3。

### G4 四個觀眾答案

1. 發生什麼事：NVIDIA 公布 Q2 FY27 財報、Q3 指引，並稱 Rubin 已全面量產。
2. 市場為什麼在乎：市場要驗證高成長能否在高基期下持續轉為收入、毛利與供給改善。
3. 誰可能受影響：NVIDIA、hyperscaler 與雲端平台；forward-looking statement 不保證實現。
4. 下一個具名訊號：Q3 實際收入、Data Center 成長、Rubin ramp 與供給限制。

### G7 聲音角色

- audio_mode：`ZH_VOICEOVER`（唯一合理策略，但本 cycle 判 FAIL）
- audio_job：用中文解釋財報因果鏈、限制與下一指標。
- sound_on_experience：理論上由中文旁白主敘事；現況未建立也未授權。
- sound_off_experience：繁中 captions 可獨立閱讀，但沒有合格動態視覺。
- speech_translation_required：`false`（IR webcast 不作本輪來源聲音）
- rights_status：`UNKNOWN`
- current_harness_compatible：`false`
- execution_gap：需另建中文旁白、motion／資料視覺與權利證據，超出本輪固定 harness 與來源探索範圍。

### 目前可取得素材直接證據

- C2-S1 財報頁可回查事實，但 DOM 只有一張舊靜態圖。
- C2-S7 的 Rubin featured asset 明列為 `Photo | NVIDIA Rubin Platform`，大小 `274.5 kB`。
- C2-S8 在本次查核未列出可用 Corporate B-Roll item。
- IR event 有音訊 webcast，但 evidence packet 未提供可對應本事件的官方動態畫面；因此不能把音訊存在寫成 G6 通過。

### 主要風險

1. 把公司財測與 Rubin 量產主張寫成下一季收入已實現。
2. 用舊靜態圖、Rubin 產品照或泛用 B-roll 假裝是本次財報事件畫面。
3. 把 r/stocks 約 `+851`、盤後交易或單日股價當 CMoney audience baseline。
4. 為了出片臨時增加中文旁白或 motion pipeline，越過本 cycle Decision Lock。
5. 未完成影音與 publication rights。

### Confirmed／Inferred／Unknown

**Confirmed**

- C2-S1、C2-S2 可回查公司公布的營收、Data Center、Q3 指引與 Rubin 量產說法。
- C2-S3 明列客戶基礎設施、融資與採用速度可能影響收入時點。
- 本次 DOM 實查只找到舊靜態圖、Rubin photo 與無可用 item 的 Corporate B-Roll 頁，未找到同事件官方動態畫面。

**Inferred**

- Rubin ramp 與 hyperscaler capex 若按計畫執行，可能提高 NVIDIA 的需求可見度。
- 供給、產品組合與部署速度可能影響毛利與收入認列；方向成立不代表幅度已知。

**Unknown**

- CMoney audience baseline 與合格的兩種事前 proxy。
- 同事件官方動態素材、穩定取得路徑與 publication rights。
- 若未來另開 voiceover／motion workflow，其成本、時程與最終相容性。

### C2 直接來源 ledger

所有列的 `checked_at` 均為 evidence packet 的 `2026-08-31T14:48:05+08:00`。

| ID | 直接 URL | 用途 | checked_at |
|---|---|---|---|
| C2-S1 | https://investor.nvidia.com/news/press-release-details/2026/NVIDIA-Announces-Financial-Results-for-Second-Quarter-Fiscal-2027/default.aspx | NVIDIA 官方 Q2 FY27 財報、指引與 Rubin 狀態 | `2026-08-31T14:48:05+08:00` |
| C2-S2 | https://investor.nvidia.com/files/content_files/TRANSCRIPT_-NVIDIA-Corp-NVDA-US-Q2-2027-Earnings-Call-26-August-2026-5_00-PM-ET.pdf | 官方 call 時間、capex、AWS 部署與供給說法 | `2026-08-31T14:48:05+08:00` |
| C2-S3 | https://investor.nvidia.com/files/doc_financials/2027/NVDA-2027-Q2-10Q-Final-including-exhibits.pdf | 10-Q 的收入時點與導入風險 | `2026-08-31T14:48:05+08:00` |
| C2-S4 | https://apnews.com/article/dc8d556e709b50915cca9217a60b1991 | 獨立財經整理與市場疑慮 | `2026-08-31T14:48:05+08:00` |
| C2-S5 | https://www.investing.com/news/stock-market-news/nvidia-bounce-shows-wall-streets-ai-obsession-is-far-from-over-4878000 | Reuters syndication 的財報後交易；非 audience baseline | `2026-08-31T14:48:05+08:00` |
| C2-S6 | https://www.reddit.com/r/stocks/comments/1vz8pnh/nvidia_announces_financial_results_for_second/ | r/stocks 易變討論快照；非 comparator baseline | `2026-08-31T14:48:05+08:00` |
| C2-S7 | https://nvidianews.nvidia.com/multimedia | NVIDIA Media Assets；Rubin featured asset 為 photo | `2026-08-31T14:48:05+08:00` |
| C2-S8 | https://nvidianews.nvidia.com/multimedia/corporate/corporate-b-roll | Corporate B-Roll 查核頁；本次未列可用 item | `2026-08-31T14:48:05+08:00` |

### C2 disposition

- hard_fail_reasons：G6 無同事件官方動態素材；G7 唯一合理聲音／視覺策略需擴張本輪禁止的 pipeline。
- unresolved_gate：G5。
- publication_hold：`true`。
- 本 cycle 正式 `REJECT`；若未來條件改變，只能重新 Gate，不能沿用本次 FAIL 當通過。

---

## C3 候選卡｜AWS＋NVIDIA：額外部署 200 萬顆 GPU

### 卡片身份

| 欄位 | 值 |
|---|---|
| candidate_id | `C3-aws-nvidia-2m-gpu-2026-08-26` |
| topic | AWS 與 NVIDIA 宣布 2027–2028 額外部署 200 萬顆 GPU |
| one_sentence_angle | 200 萬顆不是本季收入，而是 AWS 對 2027–2028 AI 容量的多年度承諾；投資人要同時看 NVIDIA 供給、Amazon capex 與 AWS 能否把容量變成收入。 |
| event_at | `2026-08-26T17:00:00-04:00`（依 C3-S9 NVIDIA 官方 earnings-call transcript 標示的 5:00 PM ET；台北 `2026-08-27T05:00:00+08:00`） |
| evaluated_at | `2026-08-31T14:48:05+08:00` |
| checked_at | `2026-08-31T14:48:05+08:00` |
| age_hours | 約 `105.8` |
| anchor_type | 雙方公司公告與 NVIDIA earnings call |
| overall_status | `EDITORIAL_FAIL` |
| next_action | `REJECT`（本 cycle 停止） |
| publication_hold | `true` |

### 觀看價值

阻止觀眾把 `200 萬顆` 直接乘售價、當成已簽且立即認列的收入。題材可同時解釋這是 NVIDIA 的需求可見度訊號，也是 Amazon 的 capex、折舊、電力與變現壓力；下一步不是只看公告 headline，而是查核 AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。

### 七項 Gate 判定

| Gate | Status | 直接證據與判斷 | Coverage gap／通過條件 |
|---|---|---|---|
| G1 `freshness` | **PASS** | C3-S9 標示 earnings call 為 `2026-08-26T17:00:00-04:00`；相對 `evaluated_at` 約 `105.8` 小時，在 rolling 168 小時內。來源：C3-S9；C3-S1、C3-S3 保存同事件公告。 | 無時間缺口；官方 transcript 可回查精確時間。 |
| G2 `why_now` | **PASS** | Before：AWS 在 GTC 2026 已宣布自 2026 年起增加超過 100 萬顆 GPU。New：本次宣布 2027–2028 額外 200 萬顆 Blackwell Ultra、Rubin、Rubin Ultra，另含 10 萬顆政府 AI factory 規模。Immediate question：部署如何受供給、電力與資料中心限制，並何時變成收入。來源：C3-S1、C3-S2、C3-S3、C3-S9。 | 公告未揭露財務條款、單價、不可取消性與收入認列時點。 |
| G3 `financial_relevance` | **PASS** | 多年 GPU 部署承諾 → NVIDIA 需求可見度與 Amazon capex／雲端容量 → NVIDIA 收入時點與 AWS 折舊／毛利 → NVDA、AMZN → 觀察 AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。來源：C3-S1、C3-S2、C3-S3、C3-S4、C3-S5、C3-S9。 | 財務條款未公開；Amazon 自研 Trainium 是替代路徑，部署也受電力、資料中心與供給限制。 |
| G4 `viewer_payoff` | **PASS** | 發生什麼：多年 GPU 部署公告。為何在乎：同時影響 NVIDIA demand visibility 與 Amazon capex／變現壓力。影響誰：NVDA、AMZN 與 AWS。下一訊號：AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。限制：不是本季收入。 | 不能用未公開單價估算訂單金額，也不能把部署承諾寫成已完成部署。 |
| G5 `interest_signals` | **UNKNOWN** | 公開討論查核快照：r/stocks 約 `+2`、r/StockMarket 約 `+6`、r/NvidiaStock 約 `+16`；另有整體 NVIDIA 財報市場報導。 | 訊號偏弱且沒有事前同母體 baseline、region 或 CMoney audience 母體；不能正式 FAIL，也不能宣稱觀眾在乎。市場反應不是 audience baseline。 |
| G6 `visual_source_fit` | **FAIL** | NVIDIA 財報頁只載入 `aws-nvidia_mid.jpg` 靜態圖；AWS／NVIDIA 官方公告本次未找到事件對應動態影片或直接影音檔。來源：C3-S1、C3-S2、C3-S3。 | 只有靜態圖；不得用舊 GPU B-roll 冒充 200 萬顆部署已發生。缺事件動態素材、mapping、取得與 rights。 |
| G7 `audio_role_fit` | **FAIL** | 沒有可用來源聲音；只有靜態圖時，`ZH_VOICEOVER` 仍須另建 motion／資料視覺，不符合本輪「來源層、不擴張 production」範圍。 | `rights_status=UNKNOWN`；缺來源聲音、中文旁白、motion／資料視覺及相容性驗證。 |

### G3 必填財務鏈

- financial_chain：多年 GPU 部署承諾 → NVIDIA 需求可見度與 Amazon capex／雲端容量 → NVIDIA 收入時點與 AWS 折舊／毛利 → NVDA、AMZN → AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。
- affected_entities_or_assets：NVIDIA、Amazon／AWS、NVDA、AMZN。
- mechanism_claims：部署計畫可能增加需求可見度與 capex，但受供給、電力、資料中心、折舊與變現速度限制。
- next_observable：AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。
- counterfactual：若 Trainium 替代增加、電力／資料中心不足、GPU 供給延後或 AI 容量變現不及預期，公告不一定轉成同等收入與毛利。
- source_urls：C3-S1、C3-S2、C3-S3、C3-S4、C3-S5、C3-S9。

### G4 四個觀眾答案

1. 發生什麼事：AWS 與 NVIDIA 公布 2027–2028 額外部署 200 萬顆 GPU 的多年度計畫。
2. 市場為什麼在乎：它同時改變 NVIDIA 需求可見度與 Amazon capex／雲端容量、折舊及變現假設。
3. 誰可能受影響：NVIDIA 與 Amazon／AWS；方向受條款、供給、電力與替代晶片限制。
4. 下一個具名訊號：AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。

### G7 聲音角色

- audio_mode：`ZH_VOICEOVER`（唯一合理策略，但本 cycle 判 FAIL）
- audio_job：用中文拆解 demand signal、capex、折舊與收入認列的差別。
- sound_on_experience：理論上由中文旁白主敘事；現況沒有已建立或授權的聲音。
- sound_off_experience：繁中 captions 可獨立閱讀，但沒有合格動態素材或資料視覺。
- speech_translation_required：`false`
- rights_status：`UNKNOWN`
- current_harness_compatible：`false`
- execution_gap：需新增旁白、motion／資料視覺、素材與權利證據，超出本輪範圍。

### 目前可取得素材直接證據

- C3-S1、C3-S2、C3-S3 可回查雙方公告及 forward-looking 邊界；C3-S9 可回查 earnings-call event anchor 與管理層具體說明，但 transcript PDF 不是事件動態畫面。
- 本次只確認 NVIDIA 財報頁載入 `aws-nvidia_mid.jpg` 靜態圖；沒有事件對應官方動態影片或直接影音檔。
- 現況可取得的是事實頁與靜態圖定位，不是可進固定 footage harness 的 60 秒動態素材。

### 主要風險

1. 把多年度部署承諾寫成本季收入、已簽不可取消訂單或已完成部署。
2. 在財務條款、單價與認列時點未公開時自行估算金額。
3. 忽略 Trainium、電力、資料中心與 GPU 供給等反證。
4. 用舊 GPU B-roll 或靜態圖冒充事件已發生。
5. 把低量 Reddit 快照或整體 NVIDIA 市場反應當 audience baseline。
6. 未完成素材、聲音與 publication rights。

### Confirmed／Inferred／Unknown

**Confirmed**

- C3-S1、C3-S2、C3-S3 可回查額外 200 萬顆、2027–2028 與 GPU 家族等公司公告內容。
- C3-S9 直接支持 `2026-08-26T17:00:00-04:00` 的 event anchor 與管理層對 AWS 部署的具體說明。
- 公告未揭露財務條款、單價、不可取消性與收入認列時點。
- 本次官方頁查核只找到靜態圖，未找到事件對應動態素材或直接影音檔。

**Inferred**

- 部署若執行，可能提高 NVIDIA 需求可見度並增加 Amazon capex、折舊與雲端容量。

**Unknown**

- 財務條款、採購單價、不可取消性、實際部署與收入認列時點。
- CMoney audience baseline 與合格的兩種事前 proxy。
- 事件動態素材、來源聲音、publication rights 與新 workflow 相容性。

### C3 直接來源 ledger

所有列的 `checked_at` 均為 evidence packet 的 `2026-08-31T14:48:05+08:00`。

| ID | 直接 URL | 用途 | checked_at |
|---|---|---|---|
| C3-S1 | https://press.aboutamazon.com/aws/2026/8/aws-and-nvidia-to-deliver-2-million-additional-gpus-and-next-generation-infrastructure-for-agentic-and-physical-ai | AWS 官方 Press Center：數量、時程、GPU 家族與合作範圍 | `2026-08-31T14:48:05+08:00` |
| C3-S2 | https://www.aboutamazon.com/news/aws/aws-nvidia-2-million-gpus-ai | About Amazon：前次超過 100 萬顆與此次增量關係 | `2026-08-31T14:48:05+08:00` |
| C3-S3 | https://investor.nvidia.com/news/press-release-details/2026/AWS-and-NVIDIA-to-Deliver-2-Million-Additional-GPUs-and-Next-Generation-Infrastructure-for-Agentic-and-Physical-AI/default.aspx | NVIDIA IR 同口徑公告與 forward-looking 邊界 | `2026-08-31T14:48:05+08:00` |
| C3-S4 | https://news.bloomberglaw.com/business-and-practice/amazon-to-buy-2-million-nvidia-chips-for-data-center-build-out | Bloomberg Law：未來兩年資料中心擴建訊號 | `2026-08-31T14:48:05+08:00` |
| C3-S5 | https://hk.marketscreener.com/news/nvidia-forecasts-quarterly-revenue-above-estimates-ce7858d9d18bf621 | Reuters syndication：200 萬顆部署、供需與中國市場脈絡 | `2026-08-31T14:48:05+08:00` |
| C3-S6 | https://www.reddit.com/r/stocks/comments/1vzpcas/amazon_and_nvidia_to_deliver_2_million_additional/ | r/stocks 易變討論快照；非 baseline | `2026-08-31T14:48:05+08:00` |
| C3-S7 | https://www.reddit.com/r/StockMarket/comments/1vza0qx/globe_newswire_reports_amzn_aws_and_nvda_to/ | r/StockMarket 易變討論快照；非 baseline | `2026-08-31T14:48:05+08:00` |
| C3-S8 | https://www.reddit.com/r/NvidiaStock/comments/1vzfvy1/amazon_to_deploy_some_2_million_of_nvidias/ | r/NvidiaStock 易變討論快照；非 baseline | `2026-08-31T14:48:05+08:00` |
| C3-S9 | https://investor.nvidia.com/files/content_files/TRANSCRIPT_-NVIDIA-Corp-NVDA-US-Q2-2027-Earnings-Call-26-August-2026-5_00-PM-ET.pdf | NVIDIA 官方 earnings-call transcript：C3 event_at 與管理層 AWS 部署說明 | `2026-08-31T14:48:05+08:00` |

### C3 disposition

- hard_fail_reasons：G6 無事件對應官方動態素材；G7 無可用來源聲音且合理策略超出本輪 pipeline。
- unresolved_gate：G5。
- publication_hold：`true`。
- 本 cycle 正式 `REJECT`；不得因財務鏈清楚而略過素材與聲音 hard fail。

---

## 三題總表

| candidate | freshness | why_now | financial_relevance | viewer_payoff | interest_signals | visual_source_fit | audio_role_fit | overall | publication_hold | formal recommendation |
|---|---|---|---|---|---|---|---|---|---|---|
| C1 Fed Jackson Hole | PASS | PASS | PASS | PASS | UNKNOWN | UNKNOWN | UNKNOWN | `EDITORIAL_UNKNOWN` | `true` | `NO_RECOMMENDATION` |
| C2 NVIDIA Q2 FY27 | PASS | PASS | PASS | PASS | UNKNOWN | FAIL | FAIL | `EDITORIAL_FAIL` | `true` | `NO_RECOMMENDATION` |
| C3 AWS＋NVIDIA 200 萬 GPU | PASS | PASS | PASS | PASS | UNKNOWN | FAIL | FAIL | `EDITORIAL_FAIL` | `true` | `NO_RECOMMENDATION` |

- EDITORIAL_PASS：`0`
- EDITORIAL_UNKNOWN：`1`（C1）
- EDITORIAL_FAIL：`2`（C2、C3）
- formal_recommendation：**`NO_RECOMMENDATION`**

## 補證優先順序（不是 render 推薦）

1. **C1 Fed Jackson Hole**：唯一沒有 FAIL，仍在 freshness window 內；先補 G6／G7 的可取得官方非 YouTube 動態素材、權利與翻譯對齊可行性，再補 G5 audience baseline。
2. **C2 NVIDIA Q2 FY27**：財務鏈與公開討論最強，但本 cycle 已因 G6、G7 FAIL；只有找到同事件官方動態素材，且另有經授權、相容的聲音方案後，才值得重新 Gate。
3. **C3 AWS＋NVIDIA 200 萬 GPU**：財務鏈成立，但同樣有 G6、G7 hard fail，公開討論又缺 baseline 且強度偏弱；先於 C2 之後處理。

### 下一個最小驗收

只對 C1 做一個 **G6/G7 locator preflight**，且仍不下載：

- 找到與本次 Warsh Jackson Hole 演說直接對應、第一方、**非 YouTube** 的官方動態素材 URL；
- 記錄 checked_at、公開匿名可讀的 metadata、片長、畫面內容 mapping 與來源聲音類型；
- 明確記錄 rights／publication 邊界，以及 `TRANSLATE_SOURCE` 是否可在現有 harness 內完成語意對齊；
- 若找不到，C1 維持 `EDITORIAL_UNKNOWN` 並停止；不得換成泛用 Fed B-roll，也不得先 render。

完成上述最小驗收仍不等於 Editorial PASS；G5 仍須有至少兩種互相獨立的事前 proxy，且至少一種是具 observation window、baseline、region 與母體限制的 audience-behavior／demand proxy。

## Evidence packet URL preservation｜未入選替代題

以下只為逐條保留 evidence packet 已列出的直接 URL，不新增候選或改變前三名：

| 項目 | 直接 URL | 原 disposition | checked_at |
|---|---|---|---|
| 韓國央行 8/27 事件的官網嵌入影片 | https://www.youtube.com/watch?v=CZN_6cDc3xI | 官網播放器實際仍是 YouTube，不是現有 harness 可穩定取得的官網媒體檔；未取代 C1。 | `2026-08-31T14:48:05+08:00` |

Apple M6／M5 Ultra 替代題在 evidence packet 沒有提供可保留的 direct URL；本 artifact 不自行補 URL。

## 方法與限制

1. **Evidence freeze**：所有判定、URL、`checked_at`、`event_at`、`age_hours` 與數字均逐項取自指定 evidence packet；沒有在本 artifact 階段新增外部查核或推算未提供的商業數字。
2. **來源層級**：第一方公告／逐字稿定義事件與公司主張；AP、Reuters syndication、Bloomberg Law 用於市場反應、背景與反證；Reddit／YouTube 易變快照只作未校準 proxy。
3. **Interest 邊界**：本輪沒有台灣 CMoney 自有受眾 baseline，也沒有事前鎖定、同母體 comparator。市場價格、殖利率、交易量與單日股價反應沒有被當作 audience baseline；因此三題 G5 均為 UNKNOWN。
4. **Visual 邊界**：第一方頁可見、影片存在、靜態圖可下載或 webcast 有聲音，都不自動等於 G6 PASS。必須有事件對應動態素材、可查取得路徑、metadata、mapping 與 rights 邊界。
5. **Audio 邊界**：聲音角色依事件需要選擇，不因來源剛好有聲音就保留。C1 只建議 `TRANSLATE_SOURCE`；C2、C3 的 `ZH_VOICEOVER` 會擴張本輪 pipeline，所以判 FAIL。
6. **Rights 邊界**：所有候選 `publication_hold=true`。公開頁面、YouTube metadata、官方公告或品牌素材不證明重剪／商用／社群發布權。
7. **Kiro quota**：W14 websearch agent 因 Kiro monthly usage limit 未能產出；evidence packet 由 orchestrator 以公開搜尋、官方頁 DOM 與 metadata-only probe 完成同範圍查核。本 artifact 不重跑搜尋。
8. **執行限制**：未登入、未註冊、未付款、未下載媒體、未建立 run、未 render、未啟動 production，也未變更 production code。
9. **Outcome 邊界**：Editorial PASS 也只會代表值得發布測試；目前 0 PASS，更不能宣稱已證明觀眾需求或播放成效。

## Artifact self-check

- [x] 三張完整候選卡：C1、C2、C3。
- [x] 每張卡均逐項列出七個 Gate，且 status 只使用 PASS／FAIL／UNKNOWN。
- [x] 三張卡均有觀看價值、目前可取得素材直接證據、主要風險、Confirmed／Inferred／Unknown、`publication_hold`。
- [x] 總表包含三題、七 Gate、overall、publication hold 與正式推薦。
- [x] 正式推薦為 `NO_RECOMMENDATION`，沒有把「補證優先 C1」冒充 render 推薦。
- [x] 保留 evidence packet 的直接 URL、`checked_at`、事件時間與 `age_hours`；unique URL 數量至少 10。
- [x] 沒有把市場反應、views、likes、Reddit score 或單日股價當成 audience baseline。
- [x] 沒有新增未查證數字。
- [x] 本工作只建立本 exploration artifact；沒有 production code 變更。
- [x] Kiro quota、未登入、未下載、未建立 run、未 render 與 rights limitation 均已明示。
