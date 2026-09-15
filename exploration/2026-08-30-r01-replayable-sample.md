# R-01 可回放樣本：TechNews RSS → 第一方來源 → 官方影片

## 文件 metadata

| 欄位 | 值 |
|---|---|
| 版本 | v0.1-self-checked |
| 日期 | 2026-08-30 |
| 查核時區 | Asia/Taipei |
| 路徑 | R-01：TechNews RSS selector → 第一方來源 resolver → 官方影片候選 |
| 母體 | TechNews 全站 RSS 在 `lastBuildDate = Sun, 30 Aug 2026 05:31:43 +0000` 的前 10 個 item |
| 上游文件 | [`intent.md`](./intent.md)、[`2026-08-30-source-map.md`](./2026-08-30-source-map.md) |
| 執行邊界 | 公開頁唯讀查核；不登入、不註冊、不付款；本文件未下載影片、未跑 ffmpeg |

## 1. 結論

1. `confirmed`：全站 RSS 自述 `sy:updatePeriod = hourly`、`sy:updateFrequency = 1`，且本次快照前 10 筆的發布時間落在 2026-08-30 00:30:45–05:30:18 UTC；這證明入口可機械列舉與本次快照密度，不證明長期每小時一定有新文章。[RSS](https://technews.tw/feed/)（查核：2026-08-30）
2. `confirmed`：依下述一致規則，前 10 筆有 6/10 可解析到與題材相符的第一方公司、官方組織或研究機構頁；有 1/10 在該第一方頁出現題材相符官方影片；有 0/10 在本輪找到非 YouTube、可直接交給現有 harness 做 metadata preflight 的影片候選。
3. `inferred`：R-01 適合當「選題雷達＋第一方事實 resolver」，但不能把一般 RSS item 直接視為素材供應。若要進入自動成片，selector 後面必須加 `第一方來源已解析` 與 `非 YouTube 媒體候選已解析` 兩個硬 gate。
4. `coverage gap`：0/10 是這個時間點、這個前 10 筆母體的觀察，不代表 TechNews 全站或其他日期沒有可下載官方影片；也未排除第一方頁以外仍存在同片 mirror。
5. `confirmed`：RSS 刷新頻率不等於題材即時性。G03 的 Berkeley Lab 第一方頁日期是 2026-08-18，TechNews item 是 2026-08-30，觀察落差 12 天；G07 的 SEMI 第一方新聞稿日期是 2026-08-21，TechNews item 是 2026-08-30，觀察落差 9 天。這兩例不能估計整體延遲，但足以要求 pipeline 同時保存 `first_party_published_at` 與 `selector_seen_at`。

## 2. 操作定義

| 訊號 | 本文件定義 |
|---|---|
| `U` 第一方來源已解析 | 找到與文章核心題材相符的公司官方頁、政府／組織新聞稿、研究機構頁或原始研究頁。只有外媒、轉載或一般評論不算。可由文章外連或同題材目的式搜尋取得。 |
| `V` 題材相符官方影片存在 | `U` 的公開頁直接嵌入或連出與同一題材相符的官方影片；只有機構通用 YouTube 頻道連結不算。 |
| `P` harness preflight 候選 | 找到非 YouTube 的 direct file、Brightcove、Vimeo、Wistia 或 self-hosted 影片頁／播放器，可交給現有 harness 做 metadata preflight。`P` 不代表可下載 `D` 或可發布 `L`。 |
| 判定方式 | 先凍結 RSS 前 10 筆；逐篇列出外連；再對可辨識主體／研究做第一方目的式搜尋；檢查第一方 HTML 的 direct media、video、Brightcove、Vimeo、Wistia、YouTube 標記。 |

## 3. 固定分母與逐題結果

| ID | RSS item（pubDate UTC） | 第一方 resolver | U | V | P | 逐題判定與排除理由 |
|---|---|---|---:|---:|---:|---|
| G01 | [迷你電腦性價比真的高？](https://technews.tw/2026/08/30/what-are-the-downsides-of-a-mini-pc/)（05:30:18） | 文章外連為 Engadget、ITPro，沒有單一產品事件或第一方技術主張。 | 0 | 0 | 0 | `confirmed`：文章外連未提供同題材第一方來源；`unknown`：逐品牌另搜可能有一般產品影片，但不等於這篇比較主張的官方素材。 |
| G02 | [特斯拉停產太陽能屋頂瓦片](https://finance.technews.tw/2026/08/30/tesla-discontinues-solar-roof-tiles/)（05:00:11） | 外連 Electrek、Unwire 與 Tesla 舊 X 貼文；未找到 Tesla 對「停產」的同題材第一方頁。 | 0 | 0 | 0 | Tesla 舊產品貼文不支撐停產主張；不能以一般 Solar Roof 宣傳片替代同題材事實。 |
| G03 | [MOSAIC 顯微鏡結合超算與開源軟體](https://technews.tw/2026/08/30/building-the-computational-mind-for-the-swiss-army-knife-of-microscopes/)（03:30:27） | [Berkeley Lab News Center](https://newscenter.lbl.gov/2026/08/18/building-the-computational-mind-for-the-swiss-army-knife-of-microscopes/) | 1 | 1 | 0 | 第一方頁有 4 個題材相符 YouTube embed：`SyZQNq5x2HM`、`2ADrfLwQokg`、`Cw6bIkMej1o`、`eu6RBwxRf9U`。依 repo 已知限制，YouTube 只能確認存在、不能當現環境下載來源；本輪未找到同片非 YouTube mirror。 |
| G04 | [破產公司數位遺產成 AI 訓練資料新戰場](https://infosecu.technews.tw/2026/08/30/digital-assets-of-bankrupt-companies-become-hot-targets-for-ai-startup/)（03:00:47） | 外連創業小聚、Crunchbase、Fast Company、Forbes、WSJ 與服務商文章；沒有可辨識的同題材第一方事件頁。 | 0 | 0 | 0 | 題材是交易／資料權利爭議，不是單一可視化產品事件；未找到同題材官方影片候選。 |
| G05 | [TechInsights 分析麒麟 9030 Pro](https://technews.tw/2026/08/30/techinsight-analyze-kirin-9030-pro/)（02:57:34） | [TechInsights 官方分析](https://www.techinsights.com/blog/smic-n3-kirin-9030-pro-process-flow-analysis) | 1 | 0 | 0 | 官方頁只觀察到通用 TechInsights YouTube 頻道連結，未見這篇分析的影片或非 YouTube 媒體候選。 |
| G06 | [高溫加劇農藥對農工風險](https://technews.tw/2026/08/30/us-farmworkers-health-dual-threat-heat-pesticides/)（02:30:44） | [Union of Concerned Scientists 原始報告頁](https://www.ucs.org/resources/farmworkers-at-risk) | 1 | 0 | 0 | 原始報告頁只觀察到機構通用 YouTube 頻道連結，未見同題材影片或非 YouTube媒體候選。 |
| G07 | [SEMI 半導體材料聯盟成立](https://finance.technews.tw/2026/08/30/semi-taiwan-materials-alliance/)（02:00:10） | [SEMI 官方新聞稿](https://www.semi.org/zh/node/175101) | 1 | 0 | 0 | 官方頁可確認聯盟成立與四個聚焦方向，但頁面未出現 `video`；本輪沒有同題材官方影片候選。 |
| G08 | [光達揭開亞馬遜古文明](https://technews.tw/2026/08/30/lidar-ancient-amazon/)（01:30:39） | [University of Helsinki 新聞稿](https://www.helsinki.fi/en/news/culture/ancient-civilization-millions-once-flourished-amazon)、[Nature 論文](https://www.nature.com/articles/s41586-026-10835-7) | 1 | 0 | 0 | Helsinki 頁只觀察到機構通用 YouTube 頻道資料，未見同題材影片或非 YouTube 媒體候選。 |
| G09 | [台股上漲後的資產重分配](https://finance.technews.tw/2026/08/30/taiwan-stock-market-generated-over-nt100-trillion/)（01:00:17） | 文章外連財訊系列文章與 Pixabay；沒有單一第一方事件頁。 | 0 | 0 | 0 | 題材是財富管理分析，未找到同題材官方影片候選。 |
| G10 | [重複經驗如何影響選擇](https://technews.tw/2026/08/30/why-your-brain-keeps-making-the-same-decisions/)（00:30:45） | [TU Dresden 官方新聞稿](https://tu-dresden.de/mn/psychologie/die-fakultaet/news/psychologie-wiederholung-beeinflusst-entscheidungen-staerker-als-gedacht?set_language=en)、[原始 DOI](https://doi.org/10.1038/s44271-025-00363-x) | 1 | 0 | 0 | 官方頁只觀察到通用 TUDresdenTV 頻道連結與圖片 source，未見同題材影片或非 YouTube 媒體候選。 |

### 可回算結果

| 指標 | k/n | 能支持的最小結論 | 不可外推 |
|---|---:|---|---|
| 第一方來源解析 `U` | 6/10 | 這個快照中，多數題材可回到第一方事實頁。 | 不代表第一方內容可重發，也不代表長期解析率。 |
| 題材相符官方影片 `V` | 1/10 | MOSAIC 第一方頁直接嵌入 4 支同題材官方影片。 | 不代表影片可下載、可發布或足夠支撐 60 秒。 |
| 非 YouTube preflight 候選 `P` | 0/10 | 本輪逐題 HTML／目的式查核未找到可立即交給 harness 的非 YouTube 候選。 | 不代表網路上不存在 mirror，也不是 TechNews 全站命中率。 |

## 4. 對 R-01 的修正版設計

R-01 不應是 `RSS → 直接做片`，而應是：

`RSS 凍結候選 → 排除評論／純財經／不可視化題材 → 解析第一方事實頁 U → 解析題材相符官方影片 V → 只在非 YouTube 候選 P 成立時交給 harness preflight`。

- `confirmed`：RSS 可列舉、第一方來源可被解析，且 MOSAIC 證明 RSS 題材能命中官方影片。
- `inferred`：加入「可視化事件／產品＋第一方 media infrastructure」排序，會比不分類地逐篇找素材更有效；本輪尚未做對照實驗。
- `unknown`：相同 classifier 在連續 7 天的 `P` 命中率、平均延遲與漏題率。
- `coverage gap`：YouTube-only 題材若無第一方 mirror，現有下載環境仍無法進產線；需要 mirror resolver 或直接淘汰。
- `coverage gap`：尚無連續期間的 `first_party_published_at → selector_seen_at` 延遲分布；只有 G03 的 12 天與 G07 的 9 天兩個可回算案例。

## 5. 自檢

- [x] 分母先凍結，10 個 item 的 title、URL、pubDate 均保留。
- [x] `U/V/P` 分開，不把第一方頁、影片存在、可 preflight 混成同一命中。
- [x] 空結果只限公開頁與本輪搜尋，不寫成來源不存在。
- [x] YouTube 只作存在證據，不假稱可下載。
- [x] 每個外部結論附直接 URL 與查核日期 2026-08-30。
