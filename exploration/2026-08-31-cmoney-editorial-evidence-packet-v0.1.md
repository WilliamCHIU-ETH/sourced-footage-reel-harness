# CMoney Editorial shortlist evidence packet v0.1

- checked_at：`2026-08-31T14:48:05+08:00`
- evaluated_at：`2026-08-31T14:48:05+08:00`
- Gate：`exploration/2026-08-31-cmoney-editorial-gate-v0.2.md`
- 範圍：最近 168 小時的三類候選；只做選材與公開來源查核，不下載、不建立 run、不 render
- 方法：第一方公告／逐字稿定義事件與主張；獨立財經媒體查市場反應與反證；公開 audience proxy 只在有母體與 baseline 時才能判 PASS；官方素材另查是否能由現有 harness 穩定取得

## 0. 先講結果

三類各有一題在 freshness、why-now 與 financial relevance 上成立，但目前 **沒有任何一題七項全 PASS**：

1. Fed Jackson Hole 是最強的 CMoney 編輯題目，但官方影片只有 YouTube，repo 已鎖定匿名 YouTube 不可作取得來源；interest 也沒有事前 comparator baseline。
2. NVIDIA Q2 FY27 財報有最強的公司財務與公開討論訊號，但官方財報頁只有靜態圖、IR webcast 為音訊，未找到同事件、可取得的官方動態畫面。
3. AWS 加碼部署 200 萬顆 NVIDIA GPU 的財務鏈清楚，但官方頁仍只有靜態圖，公開討論也明顯弱於 NVIDIA 整體財報題。

因此本 packet 支持 `NO_RECOMMENDATION_FOR_RENDER`。若只排補證優先順序，先解 Fed 的非 YouTube 官方素材／授權，其次才是 NVIDIA 財報的事件對應動態素材。

## 1. C1：Fed 主席 Warsh 在 Jackson Hole 把市場推向「可能升息」

### 事件與價值

- `event_at`：`2026-08-28T10:00:00-04:00`（Kansas City Fed 事前公告的 10:00 EDT；台北 `2026-08-28T22:00:00+08:00`）
- `age_hours`：約 `64.8`
- 一句角度：**Warsh 沒有直接宣布升息，但他把「通膨降得不夠快就還要做事」說到足以讓兩年期美債殖利率跳升；投資人下一步要看 9 月 FOMC 與 PCE，而不是把演說誤寫成已升息。**
- before → new state：市場原先仍在判斷新主席會不會容忍偏高通膨；Warsh 在演說中列出 PCE 12 個月 `3.7%`、6 個月 `4.1%`，並表示若 underlying inflation 未明確且足夠快地回到 2%，Fed 就「有工作要做」。AP 記錄兩年期美債殖利率由演說前 `4.22%` 升到 `4.35%`。
- financial chain：演說訊號 → 升息機率／前端利率與美元上升 → 折現率、融資成本與成長股估值承壓 → 美股與美元資產 → 下一個具名觀察為 `9 月 FOMC`、下一次 `PCE` 與兩年期殖利率是否維持重定價。
- 觀看價值：替投資人分清「鷹派訊號」與「正式決策」，並知道為什麼同一句話先動的是兩年期美債、美元與高估值資產。
- 主要反證：這是一場演說，不是 FOMC 決議；後續就業／通膨數據可讓市場反向重定價。當日 S&P 500 只跌約 `0.2%`，反應主要集中在債券而非全面股災。

### 可回查證據

1. [Federal Reserve：Warsh 書面演說](https://www.federalreserve.gov/newsevents/speech/warsh20260828a.htm)：日期、PCE／CPI 判斷、政策原則與原文。
2. [Kansas City Fed：2026 Symposium](https://www.kansascityfed.org/research/jackson-hole-economic-symposium/2026/)：活動日期、時區、官方議程與 Video Remarks。
3. [Kansas City Fed 官方影片](https://www.youtube.com/live/0UIKsanJb84)：DOM 實查確認議程精確連到此影片；metadata-only probe（未下載）為 `32:26`、`1280×720`、30fps、公開、`59,659` views、`639` likes，查核於 `2026-08-31`。
4. [AP：演說後市場反應](https://apnews.com/article/0a655f1c042b059279343443d5802907)：兩年期殖利率 `4.22% → 4.35%`、S&P 500 約 `-0.2%`、Nasdaq 約 `-0.5%`。
5. [Reuters syndication：股、債、美元反應](https://www.marketscreener.com/news/stocks-fall-while-dollar-bond-yields-rise-as-warsh-prompts-rate-hike-bets-ce7858dfd080f724)：短債殖利率與美元上升、全球股市轉弱；不得把相關性寫成單一因果已完全證明。
6. [Reddit r/investing 討論](https://www.reddit.com/r/investing/comments/1w15faz/warsh_at_jackson_hole_sticky_37_pce_pushes/)：查核時約 `+154`；另有 [r/stocks 討論](https://www.reddit.com/r/stocks/comments/1w0wboi/rate_hike_odds_increased_after_jackson_hole_why/) 約 `+56`。兩者沒有事前同母體 comparator baseline，不能判 G5 PASS。

### 素材與聲音

- 可見內容：官方演說實景，直接展示人物、發言與事件，不是通用 B-roll。
- 取得邊界：官方議程與 Fed 演說頁都只連到 YouTube。`ASSUMPTIONS.md` 已驗證匿名 YouTube 下載會在 41.5% 以 HTTP 403 失敗；依 `SKILL.md`，YouTube 只能確認存在，不能當取得來源。
- 建議 audio mode：`TRANSLATE_SOURCE`。保留 2–3 段真正影響判斷的英文原聲，繁中字幕依語意分段翻譯；不得再用與原聲無關的 editorial captions 形成兩套敘事。
- sound-off：繁中翻譯字幕必須獨立說清事件、影響與下一訊號。
- sound-on：觀眾能聽到 Warsh 原句並理解翻譯，不以背景音樂蓋掉政策語氣。
- gap：尚無非 YouTube 官方檔案、publication rights 判斷與翻譯對齊 QA。

## 2. C2：NVIDIA Q2 FY27 財報與 Vera Rubin 量產

### 事件與價值

- `event_at`：`2026-08-26T17:00:00-04:00`（官方 earnings-call transcript 標示 5:00 PM ET；台北 `2026-08-27T05:00:00+08:00`）
- `age_hours`：約 `105.8`
- 一句角度：**營收翻倍只是表面，真正要看的，是 NVIDIA 能否把 Vera Rubin 的量產、受限供給與雲端資本支出轉成下一季 `1,080 億美元 ±2%` 的收入。**
- before → new state：市場已知 AI 算力需求強，但仍擔心高基期與資本支出回報；NVIDIA 公布 Q2 營收 `962 億美元`（QoQ `+18%`、YoY `+106%`）、Data Center `890 億美元`（YoY `+117%`），並稱 Vera Rubin 已全面量產。
- financial chain：財報／指引與 Rubin ramp → GPU 供需、產品組合與毛利 → NVIDIA 收入／毛利與 hyperscaler capex → NVIDIA 與雲端平台 → 下一個具名觀察為 Q3 實際營收是否達 `1,080 億美元 ±2%`、Rubin ramp 與供給限制是否改善。
- 觀看價值：不只報 EPS，而是讓投資人知道「需求強」要用哪三個數字驗證：下一季收入、Data Center 成長、Rubin 量產／供給。
- 主要反證：公司主張與 forward-looking statements 不是已實現營收；NVIDIA 10-Q 明列資料中心基礎設施、資金與導入速度可能延後客戶採購和收入時點。

### 可回查證據

1. [NVIDIA 官方 Q2 FY27 財報](https://investor.nvidia.com/news/press-release-details/2026/NVIDIA-Announces-Financial-Results-for-Second-Quarter-Fiscal-2027/default.aspx)：營收、Data Center、指引與 Rubin 狀態。
2. [NVIDIA 官方 earnings-call transcript](https://investor.nvidia.com/files/content_files/TRANSCRIPT_-NVIDIA-Corp-NVDA-US-Q2-2027-Earnings-Call-26-August-2026-5_00-PM-ET.pdf)：精確 call 時間、hyperscaler capex、AWS 部署與供給限制等管理層說法。
3. [NVIDIA Q2 FY27 10-Q](https://investor.nvidia.com/files/doc_financials/2027/NVDA-2027-Q2-10Q-Final-including-exhibits.pdf)：客戶基礎設施、融資與採用速度可能影響收入時點的風險。
4. [AP：財報高於市場預期](https://apnews.com/article/dc8d556e709b50915cca9217a60b1991)：獨立整理與市場疑慮。
5. [Reuters syndication：財報後交易](https://www.investing.com/news/stock-market-news/nvidia-bounce-shows-wall-streets-ai-obsession-is-far-from-over-4878000)：盤後由跌轉升、重交易量；不可把單日股價當觀眾需求。
6. [Reddit r/stocks 財報帖](https://www.reddit.com/r/stocks/comments/1vz8pnh/nvidia_announces_financial_results_for_second/)：查核時約 `+851`，是明顯 audience-behavior 訊號；但本 cycle 沒有事前鎖定的同母體 earnings baseline，因此 G5 仍為 UNKNOWN。

### 素材與聲音

- NVIDIA 財報 newsroom 頁 DOM 實查只見一張標題為本次財報、實際檔名含 `DH1L4415-HDR-20220527-r5` 的舊靜態圖。
- [NVIDIA Media Assets](https://nvidianews.nvidia.com/multimedia) 的 Rubin featured asset 實查為 `Photo | NVIDIA Rubin Platform`、下載大小 `274.5 kB`；[Corporate B-Roll](https://nvidianews.nvidia.com/multimedia/corporate/corporate-b-roll) 頁在本次查核沒有列出可用 item；IR event 提供 webcast，但屬音訊，不是同事件動態畫面。
- 目前合理 audio mode 是 `ZH_VOICEOVER`，但現有 harness 的固定形式是來源原聲＋自寫字幕；本輪又禁止擴張剪輯／pipeline。沒有事件對應影片時，不得用靜態圖或泛用舊 B-roll 假裝財報現場。
- gap：缺同事件、官方、非 YouTube、可取得的動態素材；缺 publication rights；缺乾淨的 interest baseline。

## 3. C3：AWS 再加碼部署 200 萬顆 NVIDIA GPU

### 事件與價值

- `event_at`：`2026-08-26T17:00:00-04:00`（依 [NVIDIA 官方 earnings-call transcript](https://investor.nvidia.com/files/content_files/TRANSCRIPT_-NVIDIA-Corp-NVDA-US-Q2-2027-Earnings-Call-26-August-2026-5_00-PM-ET.pdf) 標示的 5:00 PM ET；台北 `2026-08-27T05:00:00+08:00`）
- `age_hours`：約 `105.8`
- 一句角度：**200 萬顆不是本季收入，而是 AWS 對 2027–2028 AI 容量的多年度承諾；投資人要同時看 NVIDIA 供給、Amazon capex 與 AWS 能否把容量變成收入。**
- before → new state：AWS 在 GTC 2026 已宣布自 2026 年起增加超過 100 萬顆 GPU；本次再宣布 2027–2028 部署額外 200 萬顆 Blackwell Ultra、Rubin 與 Rubin Ultra GPU，另含 10 萬顆政府 AI factory 規模；NVIDIA 官方 earnings-call transcript 是本次 event anchor 與管理層具體說明的直接依據。
- financial chain：多年 GPU 部署承諾 → NVIDIA 需求可見度與 Amazon 資本支出／雲端容量 → NVIDIA 收入時點與 AWS 折舊／毛利 → NVDA、AMZN → 下一個具名觀察為 AWS 2027–2028 GPU 部署里程碑、Amazon capex 揭露、NVIDIA 出貨／收入認列揭露。
- 觀看價值：避免把 `200 萬顆` 直接乘售價當成已簽收入；觀眾會知道這同時是 NVIDIA demand signal 與 Amazon capex／變現壓力。
- 主要反證：公告未揭露財務條款、單價、不可取消性與收入認列時點；Amazon 自研 Trainium 仍是替代路徑，部署也受電力、資料中心與供給限制。

### 可回查證據

1. [AWS 官方 Press Center](https://press.aboutamazon.com/aws/2026/8/aws-and-nvidia-to-deliver-2-million-additional-gpus-and-next-generation-infrastructure-for-agentic-and-physical-ai)：200 萬顆、2027–2028、GPU 家族與合作範圍。
2. [About Amazon 官方解讀](https://www.aboutamazon.com/news/aws/aws-nvidia-2-million-gpus-ai)：前次超過 100 萬顆承諾與此次增量的關係。
3. [NVIDIA IR 官方公告](https://investor.nvidia.com/news/press-release-details/2026/AWS-and-NVIDIA-to-Deliver-2-Million-Additional-GPUs-and-Next-Generation-Infrastructure-for-Agentic-and-Physical-AI/default.aspx)：雙方同口徑公告與 forward-looking 邊界。
4. [Bloomberg Law](https://news.bloomberglaw.com/business-and-practice/amazon-to-buy-2-million-nvidia-chips-for-data-center-build-out)：獨立報導將其界定為未來兩年的資料中心擴建訊號。
5. [Reuters syndication](https://hk.marketscreener.com/news/nvidia-forecasts-quarterly-revenue-above-estimates-ce7858d9d18bf621)：在整體 NVIDIA 財報中確認 200 萬顆部署，並提供供需與中國市場脈絡。
6. [NVIDIA 官方 earnings-call transcript](https://investor.nvidia.com/files/content_files/TRANSCRIPT_-NVIDIA-Corp-NVDA-US-Q2-2027-Earnings-Call-26-August-2026-5_00-PM-ET.pdf)：標示 `2026-08-26T17:00:00-04:00` 的 event anchor，並保存管理層對 AWS 部署的具體說明。
7. 公開討論強度偏弱：[r/stocks](https://www.reddit.com/r/stocks/comments/1vzpcas/amazon_and_nvidia_to_deliver_2_million_additional/) 約 `+2`、[r/StockMarket](https://www.reddit.com/r/StockMarket/comments/1vza0qx/globe_newswire_reports_amzn_aws_and_nvda_to/) 約 `+6`、[r/NvidiaStock](https://www.reddit.com/r/NvidiaStock/comments/1vzfvy1/amazon_to_deploy_some_2_million_of_nvidias/) 約 `+16`。沒有事前 baseline，不能正式判 FAIL，但也不能宣稱觀眾在乎。

### 素材與聲音

- NVIDIA 財報頁實查載入一張 `aws-nvidia_mid.jpg`；AWS／NVIDIA 官方公告本次未找到事件對應動態影片或直接影音檔。
- 只有靜態圖時，`ZH_VOICEOVER` 仍需要另建 motion／資料視覺，不符合「來源層、不要擴張 production」的本輪範圍；不應拿舊 GPU B-roll 冒充 200 萬顆部署已發生。
- gap：G6 無事件動態素材；G7 無可用來源聲音；G5 需求訊號不足且無 baseline；財務條款未公開。

## 4. Gate 建議判定

| candidate | freshness | why_now | financial_relevance | viewer_payoff | interest_signals | visual_source_fit | audio_role_fit | overall |
|---|---|---|---|---|---|---|---|---|
| C1 Fed Jackson Hole | PASS | PASS | PASS | PASS | UNKNOWN | UNKNOWN | UNKNOWN | `EDITORIAL_UNKNOWN` |
| C2 NVIDIA Q2 FY27 | PASS | PASS | PASS | PASS | UNKNOWN | FAIL | FAIL | `EDITORIAL_FAIL` |
| C3 AWS＋NVIDIA 200 萬 GPU | PASS | PASS | PASS | PASS | UNKNOWN | FAIL | FAIL | `EDITORIAL_FAIL` |

## 5. Rejected alternate

- 韓國央行 8/27 升息：事件與金融鏈成立，BOK 官網也有完整韓文逐字稿；但 DOM 實查證明官網播放器實際嵌入 `https://www.youtube.com/watch?v=CZN_6cDc3xI`，不是可由現有 harness 穩定取得的官網媒體檔，因此未取代 Fed。
- Apple M6／M5 Ultra：事件在窗口內且對 TSMC 2nm 有財務鏈，但本輪沒有確認 topic-specific official motion footage，因此沒有升入 top 3。

## 6. Research limitations

- W14 websearch agent 因 Kiro monthly usage limit 未能產出；orchestrator 以公開搜尋、官方頁 DOM 與 metadata-only probe 完成同範圍查核。
- 沒有登入、註冊、付款、下載媒體、建立 run 或 render。
- audience proxy 不是台灣 CMoney 自有受眾，且沒有在看見 target 前鎖定 comparator baseline；所以 G5 一律不補成 PASS。
- `59,659` views、`639` likes 與 Reddit score 是 `2026-08-31` 的易變快照，不是永久值，也不是播放成效預測。
- 權利與 publication permission 未完成，所有候選 `publication_hold=true`。
