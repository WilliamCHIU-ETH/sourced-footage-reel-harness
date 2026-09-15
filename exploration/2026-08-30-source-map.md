# Source Map v0.4-gate-passed：來源層探索

## 文件 metadata

| 欄位 | 值 |
|---|---|
| 版本 | v0.4-gate-passed |
| 日期 | 2026-08-30 |
| 階段 | 階段一已關閉；R-01／R-02 並行實作驗證中 |
| 狀態 | human-gate-passed |
| 查核時區 | Asia/Taipei |
| 範圍 | 來源研究、公開可取用性查核、便利／目標式樣本與來源路徑排序；不進入成片流程 |
| 上游意圖 | [`exploration/intent.md`](./intent.md) |
| 外部證據邊界 | 僅整合 2026-08-30 公開頁面觀察；每項外部結論以本文件內的直接 URL 回查 |

**總邊界：影片頁或影片資產存在，不等於現有 harness 可下載，也不等於取得發布授權。** 本階段未登入、未註冊、未付款、未下載影片、未做 metadata preflight、未跑 ffmpeg、未產片。

## 1. 證據分級與整合規則

### 1.1 分級定義

| 分級 | 定義 | 最低紀錄要求 | 不可做的延伸 |
|---|---|---|---|
| `confirmed` | 公開頁面的直接內容或可重現頁面行為，明確支持該列的最小敘述。 | 直接 URL、最小敘述、查核日期；衍生頻率或 `k/n` 另附分母及偏差。 | 不把 URL 可開啟擴張成長期穩定、可下載、可重發或已授權。 |
| `inferred` | 間接證據可支持暫時推論，但沒有直接規格或完整樣本足以確認。 | URL、推論鏈、替代解釋、查核日期。 | 不寫成已確認事實，不用來補造分母。 |
| `unknown` | 尚未查核、證據互相衝突，或現有證據不足以回答。 | 缺少的證據與可關閉問題的下一個動作。 | 不以猜測、搜尋摘要、agent 狀態或空白代填。 |
| `coverage gap` | 樣本期間、欄目、題材類型、分母、獨立搜尋或取得路徑覆蓋不足，不能外推局部觀察。 | 缺口範圍、影響、關閉條件。 | 不把「尚未覆蓋」寫成來源不存在或命中率為零。 |

`UNKNOWN/TBD` 對應尚無足夠證據的 `unknown`。同一列可同時有已確認欄位與未解欄位；「判定」必須逐項寫清，不能用整列一個 `confirmed` 掩蓋未知部分。

### 1.2 外部結論紀錄規則

1. 每個外部結論在同列或緊鄰段落放直接 URL 與查核日期 `2026-08-30`；搜尋結果頁不單獨支撐結論。
2. URL 例子的存在可為 `confirmed`，由例子歸納 URL pattern 原則上為 `inferred`，除非官方文件直接定義 pattern。
3. 更新頻率必須綁定可見日期與樣本窗口。單一快照只能證明該快照的密度，不能證明長期 cadence。
4. 登入、JS、RSS／API、公開可讀、候選取得路徑、實際下載與授權分開判定。否定性結論沒有官方說明時維持 `unknown` 或 `coverage gap`。
5. 官方影片路徑寫成 `題材入口 → 第一方頁／官方影音頁 → 階段二可 preflight 的候選資產`；本階段不以任何按鈕文字或副檔名代替實際下載驗證。
6. 不記錄 cookie、token、帳密或其他憑證。

## 2. 粗估命中率：可回算樣本、不可回放觀察與偏差

### 2.1 不可混同的四個狀態

| 狀態 | 本文件定義 | 本輪是否驗證 |
|---|---|---|
| `V` 影片存在 | 官方公開頁直接列出、嵌入或連到與題材相符的影片。 | 部分案例有直接證據。 |
| `P` 候選取得路徑 | 已辨識可交給階段二做 metadata preflight 的頁面或媒體候選 URL。 | 部分案例有線索；未做 preflight。 |
| `D` 現環境可下載 | 由現有 harness 實際取得媒體檔。 | 未驗證。 |
| `L` 可發布授權 | 權利條款允許目標使用方式。 | 未驗證；每支資產仍須另查。 |

因此 `V ≠ D`、`V ≠ L`，頁面寫有 download 也只確認頁面提供該操作，不代表本輪已下載或已取得發布授權。

### 2.2 分母與命中方法

| 元素 | v0.3 操作定義 |
|---|---|
| 觀察單位 | 依量測目的明示為「文章題材」或「media-kit entry」；不同單位的 `k/n` 不合併比較。 |
| 一般來源分母 `n` | 理想上是固定來源／欄目在連續期間內，先列舉、再依預定規則納入的全部唯一題材。這個母體本輪沒有完成，故真正來源命中率為 `unknown`。 |
| 一般來源命中 `k` | 題材具官方影片 `V`，且有候選路徑 `P`；即使計入 `k`，仍不表示 `D` 或 `L`。本輪沒有可比較的跨來源一般母體 `k/n`。 |
| 便利樣本 | 依單次首頁快照或指定文章集合觀察；可報原始分數，但必須標明非連續、非完整母體與訊號定義。 |
| 目標式樣本 | 從已偏向視覺資產的 media kit／resource page 選 entry；可回答該頁內被選 entry 是否附影片，不能外推所有新聞稿或產業。 |
| 呈現 | 只報原始 `k/n`，不換算百分比；每一分數附分子、分母、樣本類型、URL 與偏差。 |

### 2.3 證據包內可回算的兩個觀察值

這兩列量測的不是同一件事，**不得互相比大小或合併成總命中率**。

| 樣本 ID | 來源與量測 | 樣本期間／類型 | 分母 `n` | 分子 `k` | 原始 k/n | 能支持的最小結論 | 分母偏差／不能外推 | 直接證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|---|
| M-A1 | CMoney 文章正文是否直接出現官方影片 URL | 2026-08-30 同日 5 篇便利樣本；非完整連續母體 | 5 篇指定文章 | 0 篇正文有直接官方影片 URL | 0/5 | `confirmed`：這 5 篇的「文章內直接官方影片連結」觀察為 0。 | 未做站外第一方搜尋；不能推論 5 個題材沒有官方影片，也不能推論 CMoney 全站命中率。 | [A1-1](https://cmnews.com.tw/article/forumnews-d7ebea37-a427-11f1-94d4-f2368af854b0)、[A1-2](https://cmnews.com.tw/article/forumnews-9e918209-a423-11f1-8fe2-2cbd5f4ed103)、[A1-3](https://cmnews.com.tw/article/forumnews-c7bf595d-a3cf-11f1-ae45-bbf14718ff81)、[A1-4](https://cmnews.com.tw/article/forumnews-96d63c2c-a3cb-11f1-8a43-0fbc2bf41db7)、[A1-5](https://cmnews.com.tw/article/forumnews-19660c2e-a395-11f1-a8a5-8ca16e1a0a80) | 2026-08-30 |
| M-C4 | Applied Materials media kit 內指定近期產品／活動 entry 是否附 video | 2026-02-10、2026-04-08、2026-06-25 三個目標式 entry | 3 個已收進 media kit 的 entry | 3 個附 video | 3/3 | `confirmed`：指定三個 entry 都列有影片資產。 | 分母已由 media kit 與產品／活動條件預選，強烈偏向有視覺資產；不能外推 Applied 全部新聞稿或一般科技題材。 | [Applied Materials Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |

### 2.4 TechNews 不可回放觀察（不列入 k/n）

| 觀察 ID | 留存觀察 | 已保留證據 | 缺少的分母證據 | k/n | 判定與用途邊界 | 查核日期 |
|---|---|---|---|---|---|---|
| M-B1 | 曾觀察到 NASA Psyche 題明示影片訊號；首頁 aggregate 無法重建。 | [目前首頁](https://technews.tw/)、[NASA Psyche 題](https://technews.tw/2026/07/29/nasa-psyche-spacecraft-captures-stunning-timelapse-video/) | 其餘 9 篇 URL、凍結快照、納入順序與逐篇 0/1 判定均未保留。 | `UNKNOWN/TBD` | NASA 單篇 URL 存在可 `confirmed`；首頁 aggregate 為 `unknown`／non-replayable observation，不得作 TechNews 命中率、更新頻率或 R-01 成功率證據。 | 2026-08-30 |

F-01 處置：M-B1 已移出可回算表；B-01、R-01 與 gate 均不再使用該 aggregate 的數值。

#### M-A1 分母明細

| 項目 | 快照時間／題材 | 文章 URL | 正文直接官方影片 URL 訊號 | 查核日期 |
|---|---|---|---|---|
| A1-1 | 12:04；矽光子／封裝 | https://cmnews.com.tw/article/forumnews-d7ebea37-a427-11f1-94d4-f2368af854b0 | 0 | 2026-08-30 |
| A1-2 | 11:33；AI 基礎設施 | https://cmnews.com.tw/article/forumnews-9e918209-a423-11f1-8fe2-2cbd5f4ed103 | 0 | 2026-08-30 |
| A1-3 | 01:33；AI 液冷機櫃 | https://cmnews.com.tw/article/forumnews-c7bf595d-a3cf-11f1-ae45-bbf14718ff81 | 0 | 2026-08-30 |
| A1-4 | 01:03；半導體散熱 | https://cmnews.com.tw/article/forumnews-96d63c2c-a3cb-11f1-8a43-0fbc2bf41db7 | 0 | 2026-08-30 |
| A1-5 | 約 7 小時前；油價 | https://cmnews.com.tw/article/forumnews-19660c2e-a395-11f1-a8a5-8ca16e1a0a80 | 0 | 2026-08-30 |

#### M-C4 分母明細

| 項目 | 日期／entry | 共用列表 URL | 是否列 video | 查核日期 |
|---|---|---|---|---|
| C4-1 | 2026-06-25；DRAM／advanced packaging replay | https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html | 1 | 2026-08-30 |
| C4-2 | 2026-04-08；logic master class replay | https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html | 1 | 2026-08-30 |
| C4-3 | 2026-02-10；SEMICON Korea launch＋設備影片 | https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html | 1 | 2026-08-30 |

## 3. 來源地圖

### A. CMoney

| ID | 來源／欄目 | 列表 URL | 文章 URL 樣式與例子 | 取用方式 | 更新頻率及依據 | 登入 | JS | RSS／API | 官方影片路徑 | k/n | 判定 | 證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| A-01 | 財經焦點情報站 | [列表](https://cmnews.com.tw/forumnews) | `inferred`：5 例呈 `https://cmnews.com.tw/article/forumnews-<UUID>`；例子見 M-A1。 | `confirmed`：未登入可讀欄目說明、卡片與個別文章核心內容；編輯／管理提示不代表閱讀需登入。 | `confirmed`：單次快照同日有分鐘／小時級多筆；長期固定頻率 `unknown`。 | 閱讀不需登入 `confirmed`；管理功能另有提示。 | 列表 HTML 同時有 hydration fallback 與文章卡；純 HTTP 能否穩定完整列舉 `unknown`。個別文章核心 HTML 可讀 `confirmed`。 | RSS：`unknown`，公開頁與站內搜尋未找到不能證明不存在。 | M-A1 為文章內直接連結 0/5；題材在站外第一方頁面的 `V/P` 命中仍為 `unknown`／`coverage gap`。 | 0/5，僅「文章內直接官方影片 URL」便利樣本；非題材命中率。 | 公開讀取與快照密度 `confirmed`；URL pattern `inferred`；列表完整性、RSS、真正影片命中 `unknown`。 | [列表](https://cmnews.com.tw/forumnews)；[5 篇直接證據](#m-a1-分母明細) | 2026-08-30 |
| A-02 | 舊 CMoney 投資網誌／API descriptor | [欄目例](https://www.cmoney.tw/notes/default.aspx?ca=3)、[tag 例](https://www.cmoney.tw/notes/?tag=55608) | 本輪未保留文章 URL 例：`UNKNOWN/TBD`。 | `confirmed`：公開 descriptor 頁存在；本輪未實際呼叫 endpoint。 | 資料新鮮度與 cadence `unknown`。 | descriptor 公開；endpoint 匿名可用性 `unknown`。 | `UNKNOWN/TBD`。 | `confirmed`：GetDailyHeadlineArticles 與 GetStockRssArticles descriptor 列出 GET 參數／回傳欄位；實際可用性、速率限制、是否涵蓋 cmnews `unknown`。 | `UNKNOWN/TBD`；descriptor 存在不等於 pipeline-ready。 | `UNKNOWN/TBD`。 | descriptor 存在 `confirmed`；endpoint 行為與資料覆蓋 `unknown`。 | [GetDailyHeadlineArticles](https://www.cmoney.tw/cm-service/CMService.asmx?op=GetDailyHeadlineArticles)、[GetStockRssArticles](https://www.cmoney.tw/cm-service/CMService.asmx?op=GetStockRssArticles) | 2026-08-30 |

### B. TechNews

| ID | 來源／欄目 | 列表 URL | 文章 URL 樣式與例子 | 取用方式 | 更新頻率及依據 | 登入 | JS | RSS／API | 官方影片路徑 | k/n | 判定 | 證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| B-01 | 一般分類／文章；首頁另列 AI、財經、尖端科技、醫療／生技、能源、軍事、航太 | [首頁](https://technews.tw/)、[半導體](https://technews.tw/category/semiconductor/)、[網路](https://technews.tw/category/internet/)、[PC](https://technews.tw/category/pcnotebook/)、[科技生活](https://technews.tw/category/tech-life/)、[科技政策](https://technews.tw/category/tech-policy/)、[電池](https://technews.tw/category/dian-chi/) | 例子存在 `confirmed`；由例子歸納 `https://technews.tw/YYYY/MM/DD/<slug>/` 與分類 `/page/2/` 為 `inferred`。[文章例](https://technews.tw/2026/07/29/nasa-psyche-spacecraft-captures-stunning-timelapse-video/)、[翻頁例](https://technews.tw/category/pcnotebook/page/2/)。 | `confirmed`：一般分類與普通文章核心內容未登入可讀且在 HTML；會員／VIP 是另一路徑，不能外推全部內容公開。 | M-B1 未保留凍結快照與完整題目清單，故該次密度觀察 non-replayable；長期更新頻率 `unknown`。 | 一般核心內容不需登入 `confirmed`；會員內容範圍另計。 | 普通文章／分類核心不依賴 JS 為 `inferred`；廣告、翻譯與會員 overlay 可能用 JS。 | 見 B-02。 | NASA Psyche 提供一個直接影片訊號例；逐篇第一方回溯未完成，實際 `V/P` 命中 `unknown`。 | `UNKNOWN/TBD`。 | 公開核心內容 `confirmed`；URL pattern 與低 JS 依賴 `inferred`；更新頻率與 `k/n` `unknown`。 | 本列各列表／文章連結；[首頁](https://technews.tw/) | 2026-08-30 |
| B-02 | RSS／robots 入口 | [全站 RSS](https://technews.tw/feed/)、[半導體 RSS](https://technews.tw/category/semiconductor/feed/) | RSS item 導向文章；完整 pattern 仍依 B-01 判定。 | `confirmed`：兩個 feed 回應 HTTP 200 與 RSS content-type；工具不渲染 XML 不等於 feed 不存在。 | feed cadence 未做連續取樣：`unknown`。 | 公開 feed 未登入可取 `confirmed`。 | RSS 取用不以瀏覽器渲染為前提 `confirmed`；站內其他 JS 依 B-01。 | RSS `confirmed`；API `unknown`。 | 路徑候選為 `RSS → TechNews 題材 → 第一方 newsroom/media kit`，完整 resolver 成功率 `unknown`。 | `UNKNOWN/TBD`；不可用 M-B1 代替 RSS 全體命中率。 | feed 存在 `confirmed`；robots 一般分類／文章未在本輪觀察到禁止項，但不等於授權重發；API 與端到端命中 `unknown`。 | [全站 RSS](https://technews.tw/feed/)、[分類 RSS](https://technews.tw/category/semiconductor/feed/)、[robots](https://technews.tw/robots.txt) | 2026-08-30 |

### C. TechNews 上游

| ID | 來源／欄目 | 列表 URL | 文章 URL 樣式與例子 | 取用方式 | 更新頻率及依據 | 登入 | JS | RSS／API | 官方影片路徑 | k/n | 判定 | 證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| C-00 | 官方內容合作頁 | [內容合作](https://technews.tw/content-exchange/) | 合作名單頁，非文章 URL pattern。 | `confirmed`：頁面明列 36Kr、EnergyTrend、MoneyDJ、Unwire HK、中央社、中央廣播電台等合作媒體。 | 名單頁單次查核；合作更新 cadence `unknown`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`；合作名單不等於每篇來源，也不保證官方影片。 | `UNKNOWN/TBD`。 | `confirmed` 僅限頁面上的合作名單；逐篇來源映射與完整上游清單 `unknown`。 | [TechNews 內容合作](https://technews.tw/content-exchange/) | 2026-08-30 |
| C-01 | PR Newswire author archive | [作者頁](https://technews.tw/author/pr-newswire/) | TechNews author archive；個別文章例未在證據包列出：`UNKNOWN/TBD`。 | 公開 archive 可讀 `confirmed`。 | `confirmed`：2026-06-14 至 06-27 可見連續多日 14:00 發文；不能外推長期固定 cadence。 | 未登入可讀公開 archive `confirmed`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `inferred` 候選路徑：供稿 → 發稿公司第一方 newsroom／media；未證明每篇附影片。 | `UNKNOWN/TBD`。 | archive 與所見時段 `confirmed`；作即時公司題材 signal 為 `inferred`；新聞稿不是獨立查證，影片命中 `unknown`。 | [PR Newswire author archive](https://technews.tw/author/pr-newswire/) | 2026-08-30 |
| C-02 | Apple 第一方 newsroom | [Apple newsroom 文章](https://www.apple.com/newsroom/2025/05/apple-unveils-powerful-accessibility-features-coming-later-this-year/) | [TechNews 對應文章](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/)；單一例，非全站 pattern 樣本。 | 公開 TechNews、Apple newsroom 與 direct MP4 URL 可開啟 `confirmed`；未下載。 | 單一目的式案例，cadence `unknown`。 | 所列公開頁未登入可讀 `confirmed`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `confirmed` 路徑：[TechNews](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/) → [Apple newsroom](https://www.apple.com/newsroom/2025/05/apple-unveils-powerful-accessibility-features-coming-later-this-year/) → [direct MP4](https://www.apple.com/newsroom/videos/2025/autoplay/05/apple-accessibility-features-apple-vision-pro-zoom/large_2x.mp4)。`D/L` 未驗證。 | 不報單例比例；這是目的式成功案例，沒有來源母體分母。 | 路徑存在 `confirmed`；可由 harness 下載與授權 `unknown`。 | 本列三個直接連結 | 2026-08-30 |
| C-03 | NASA 第一方上游 | [TechNews 文章](https://technews.tw/2025/07/08/nasa-is-using-virtual-reality-to-train-for-moon-missions/) | 單一 TechNews 例。 | `confirmed`：TechNews 正文連至 `science.nasa.gov` 官方影片；證據包未保留該 target 的完整 URL。 | 單一目的式案例，cadence `unknown`。 | TechNews 公開文章未登入可讀 `confirmed`；NASA target 狀態未另記。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | TechNews → NASA 官方影片的上游身分 `confirmed`；精確 target URL、媒體候選、`D/L` 為 `coverage gap`／`unknown`。 | `UNKNOWN/TBD`。 | 官方上游連結存在 `confirmed`；取得路徑 `unknown`。 | [TechNews NASA VR 文章](https://technews.tw/2025/07/08/nasa-is-using-virtual-reality-to-train-for-moon-missions/) | 2026-08-30 |
| C-04 | Applied Materials Media Kits | [Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 同頁列 press release、presentation、video、images、b-roll；各 entry 的獨立 URL pattern `UNKNOWN/TBD`。 | 公開頁可讀 `confirmed`；video 指向 `appliedmaterials.widen.net`／`appliedmaterials.acquiadam.com`，未做 preflight 或下載。 | 三個所選 entry 日期為 2026-02-10、04-08、06-25；不足以確認固定 cadence。 | media-kit 頁公開；外部 asset host 登入需求 `unknown`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `confirmed`：頁面提供 video／b-roll 候選；`P` 線索強，但 `D/L` 未驗證。 | 3/3 目標式 entry 附 video；分母已偏向視覺資產，非一般新聞命中率。 | 頁面與三 entry 資產存在 `confirmed`；下載、授權、全新聞室外推 `unknown`。 | [Applied Materials Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |
| C-05 | Ars Technica 外媒上游案例 | [TechNews Muon Space 文章](https://technews.tw/2025/10/22/satellite-operators-will-soon-join-airlines-in-using-starlink-in-flight-wi-fi/) | 單篇 TechNews 文章例；不可外推 pattern。 | `confirmed`：正文底部直接連 Ars Technica 原文。 | 單一案例；外媒上游 cadence `unknown`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`；本列只確認外媒上游，不確認官方影片路徑。 | `UNKNOWN/TBD`。 | `confirmed` 僅限一個 Ars Technica 上游案例；來源完整性與持續性 `unknown`。 | [TechNews Muon Space 文章](https://technews.tw/2025/10/22/satellite-operators-will-soon-join-airlines-in-using-starlink-in-flight-wi-fi/) | 2026-08-30 |

**上游範圍判定：** 官方[內容合作頁](https://technews.tw/content-exchange/)可 `confirmed` 一組具名合作媒體，但不能推成每篇來源或完整上游；[Muon Space 文章](https://technews.tw/2025/10/22/satellite-operators-will-soon-join-airlines-in-using-starlink-in-flight-wi-fi/)可 `confirmed` 一個 Ars Technica 外媒上游案例，其 cadence／完整性 `unknown`。另有 [PR Newswire archive](https://technews.tw/author/pr-newswire/)、[Apple 案例](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/)與 [NASA 案例](https://technews.tw/2025/07/08/nasa-is-using-virtual-reality-to-train-for-moon-missions/)；這些仍是最小案例集合，不是完整上游清單。查核日期：2026-08-30。

## 4. 假設 D：支持、反例與邊界

待檢驗假設：「有公開官方影片可用的題材，集中在科技突破／產品發表。」下表確認的是公開頁面與案例，不把單一案例當穩定供應，也不把 `V` 當 `D/L`。

### 4.1 支持案例與指定反例覆蓋

| ID | 假設角色／領域 | 來源／欄目 | 列表 URL | 文章 URL 樣式與例子 | 取用方式 | 更新頻率及依據 | 登入 | JS | RSS／API | 官方影片路徑 | k/n | 判定與限制 | 證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| D-S1 | 支持：科技產品／Apple | Apple newsroom | [newsroom 文章](https://www.apple.com/newsroom/2025/05/apple-unveils-powerful-accessibility-features-coming-later-this-year/) | [TechNews 例](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/) | 公開 newsroom 與 MP4 URL；未下載。 | 單一案例，cadence `unknown`。 | 所列頁面公開未登入可讀。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | [TechNews](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/) → [Apple](https://www.apple.com/newsroom/2025/05/apple-unveils-powerful-accessibility-features-coming-later-this-year/) → [MP4](https://www.apple.com/newsroom/videos/2025/autoplay/05/apple-accessibility-features-apple-vision-pro-zoom/large_2x.mp4)。 | 不報；目的式單例無母體分母。 | direct asset 存在 `confirmed`；下載與授權 `unknown`；只能支持「有強案例」，不能支持集中度。 | 本列三個 URL | 2026-08-30 |
| D-S2 | 支持：科技產品／活動 | Applied Materials Media Kits | [Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 三個近期指定 entry，見 M-C4。 | 公開 media kit 列 video／b-roll；未 preflight／下載。 | 三個日期不是 cadence 母體。 | 主頁公開；資產 host 狀態 `unknown`。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | media kit → Widen／Acquia DAM 候選資產。 | 3/3 目標式；選樣偏向有視覺資產。 | 資產存在 `confirmed`；對一般新聞與集中度的外推 `unknown`。 | [Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |
| D-R1 | 反例覆蓋：車廠／產品發表 | Toyota Global Newsroom | [Newsroom](https://global.toyota/en/newsroom/) | [world premiere 例](https://global.toyota/en/newsroom/corporate/43567793.html) | 公開 newsroom、all-news RSS；案例頁明示 YouTube event footage。 | RSS 存在；實際更新 cadence 未連續取樣。 | 公開頁未登入可讀。 | `UNKNOWN/TBD`。 | [官方 RSS](https://global.toyota/en/rss_feeds/) `confirmed`。 | Newsroom／RSS → premiere 頁 → YouTube footage；非 YouTube 候選直檔、`D/L` `unknown`。 | 不報；單一目的式案例。 | 官方入口、RSS、案例影片存在 `confirmed`；pipeline readiness `unknown`。它反駁「只有消費科技」，但仍屬產品發表，不能單獨反駁「產品發表集中」。 | [Newsroom](https://global.toyota/en/newsroom/)、[RSS](https://global.toyota/en/rss_feeds/)、[案例](https://global.toyota/en/newsroom/corporate/43567793.html) | 2026-08-30 |
| D-R2 | 反例覆蓋：航太 | NASA Artemis II media resources | [Media resources](https://www.nasa.gov/artemis-ii-media-resources/) | [NASA library](https://images.nasa.gov/) 提供資產入口；單篇 pattern `UNKNOWN/TBD`。 | media 頁明示 view/download mission photos、behind-the-scenes videos，並列 animation／b-roll／resource reel；本輪未實際下載。 | resource page cadence `unknown`。 | 公開頁未登入可讀。 | `UNKNOWN/TBD`。 | `UNKNOWN/TBD`。 | Artemis media page → `images.nasa.gov` 資產候選；`D/L` 未驗證。 | 不報；頁面先按影片／B-roll 資產類型篩選，分母偏差明顯。 | 頁面及下載文字／資產連結存在 `confirmed`；一般航太新聞命中率 `unknown`。 | [Artemis II media](https://www.nasa.gov/artemis-ii-media-resources/)、[NASA library](https://images.nasa.gov/) | 2026-08-30 |
| D-R3 | 反例覆蓋：央行 | ECB press conferences | [Press conferences](https://www.ecb.europa.eu/press/press_conference/html/index.en.html) | 同頁列最近記者會與 calendar；獨立文章 pattern `UNKNOWN/TBD`。 | 頁面提供完整記者會觀看與最近記者會 HD footage download；本輪未下載。 | calendar 存在，實際 cadence 未由本輪計算。 | 公開頁未登入可讀。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | press conference page → HD footage download 候選；`D/L` 未驗證。 | 不報；沒有連續會議樣本。 | 影片與 download 選項 `confirmed`；視覺多為記者會／talking-head、可能不適配物件特寫為 `inferred` 編輯風險。 | [ECB press conferences](https://www.ecb.europa.eu/press/press_conference/html/index.en.html) | 2026-08-30 |
| D-R4 | 反例覆蓋：交易所 | Nasdaq MarketSite bell ceremonies | [Bell ceremony](https://www.nasdaq.com/marketsite/bell-ringing-ceremony) | past ceremonies 由同頁進入；URL pattern `UNKNOWN/TBD`。 | 頁面明示 live replay 與 past ceremonies；匿名直檔未驗證。 | 頁面明示 daily ceremonies，僅確認官方描述，未另做長期樣本。 | 公開頁未登入可讀。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | ceremony page → live replay／past ceremony；媒體多導社群／直播，直接資產 `P/D/L` `unknown`。 | 不報。 | daily／replay／past 入口存在 `confirmed`；可供 harness 取得 `unknown`。 | [Nasdaq Bell Ceremony](https://www.nasdaq.com/marketsite/bell-ringing-ceremony) | 2026-08-30 |
| D-R5 | 反例覆蓋：國防 | U.S. Department of Defense Videos | [官方影片入口](https://www.defense.gov/Multimedia/Videos/) | 入口 redirect 後可見多支日期化影片；獨立 asset pattern `UNKNOWN/TBD`。 | 官方影音頁列搜尋、DVIDS embed、Download；範例下載使用官方 CloudFront，但證據包未保留該資產 URL。 | 多支日期可見；固定 cadence `unknown`。 | 公開頁未登入可讀；下載端狀態未 preflight。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | Defense 入口 → DVIDS／Download → CloudFront 候選；每支 metadata、`D/L` 另查。 | 不報。 | 官方影片與下載入口存在 `confirmed`；權利／public-domain 例外及逐支可用性 `unknown`。 | [Defense Videos](https://www.defense.gov/Multimedia/Videos/) | 2026-08-30 |
| D-R6 | 反例覆蓋：生技／臨床 | Pfizer newsroom／FDA meetings／NIH VideoCast | [Pfizer newsroom](https://www.pfizer.com/newsroom)、[media resources](https://www.pfizer.com/news/media-resources)、[NIH VideoCast](https://videocast.nih.gov/) | [FDA 會議例](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-june-18-2026-meeting-announcement) | 公開公司新聞室與官方會議影音入口存在；[NIH support](https://videocast.nih.gov/support) 明示不可自行下載、需聯繫團隊。 | 各來源 cadence 未連續取樣。 | 公開頁未登入可讀；取得可能需另行聯繫。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | 公司 newsroom／監管或研究 webcast → 官方影音；與臨床結果同題材的 b-roll 路徑 `unknown`。 | 不報。 | 官方頁／影音與 NIH 下載限制 `confirmed`；臨床新聞稿穩定直接展示同題材 `unknown`。talking-head 適配為 `inferred` 風險。 | [Pfizer](https://www.pfizer.com/newsroom)、[Pfizer resources](https://www.pfizer.com/news/media-resources)、[FDA](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-june-18-2026-meeting-announcement)、[NIH](https://videocast.nih.gov/)、[NIH support](https://videocast.nih.gov/support) | 2026-08-30 |
| D-R7 | 反例覆蓋：能源 | U.S. Department of Energy newsroom | [DOE newsroom](https://www.energy.gov/newsroom) | 本輪沒有可回查的題材文章＋影片例：`UNKNOWN/TBD`。 | 公開 newsroom 可讀；未建立近期題材到直接影片的可重現鏈。 | cadence `unknown`。 | 公開頁未登入可讀。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | `UNKNOWN/TBD`；`V/P/D/L` 均未由單題材鏈確認。 | `UNKNOWN/TBD`。 | 官方 newsroom 存在 `confirmed`；穩定影片命中與取得路徑 `unknown`／`coverage gap`。 | [DOE newsroom](https://www.energy.gov/newsroom) | 2026-08-30 |
| D-R8 | 反例覆蓋：半導體設備 | Applied Materials Media Kits | [Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 三個 entry 見 M-C4。 | 同 D-S2。 | 三個日期不足以證明 cadence。 | media-kit 頁公開；asset host 狀態 `unknown`。 | `UNKNOWN/TBD`。 | RSS／API `UNKNOWN/TBD`。 | media kit → video／b-roll → Widen／Acquia DAM 候選；`D/L` 未驗證。 | 3/3 目標式；不是一般新聞母體。 | 對「只有消費科技」是強反例；仍屬科技鄰接產業，不能用來證明非科技集中度。資產存在 `confirmed`，外推 `unknown`。 | [Applied Materials Media Kits](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |

### 4.2 D 的分級結論

| 分級 | 結論 | 直接證據 URL | 查核日期 |
|---|---|---|---|
| `confirmed` | Apple direct MP4 與 Applied video／b-roll 是科技產品／活動的強案例；Toyota、NASA、ECB、Nasdaq、Defense 也有公開官方影片型頁面或案例；生技／臨床組則確認 Pfizer 官方新聞入口及 FDA／NIH 官方會議影音。這足以否定「只有科技類才存在官方影片」的排他版本，但不回答「是否集中」。 | [Apple MP4](https://www.apple.com/newsroom/videos/2025/autoplay/05/apple-accessibility-features-apple-vision-pro-zoom/large_2x.mp4)、[Applied](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html)、[Toyota](https://global.toyota/en/newsroom/corporate/43567793.html)、[NASA](https://www.nasa.gov/artemis-ii-media-resources/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[Nasdaq](https://www.nasdaq.com/marketsite/bell-ringing-ceremony)、[Defense](https://www.defense.gov/Multimedia/Videos/)、[Pfizer](https://www.pfizer.com/news/media-resources)、[FDA](https://www.fda.gov/advisory-committees/advisory-committee-calendar/vaccines-and-related-biological-products-advisory-committee-june-18-2026-meeting-announcement)、[NIH](https://videocast.nih.gov/) | 2026-08-30 |
| `inferred` | 可得性可能更接近「可視化事件＋成熟 media infrastructure」：產品發表、任務、記者會、bell ceremony、軍事活動，而不只由產業分類決定。替代解釋是本輪刻意選到 media/resource 頁，具有來源選擇偏差。 | [Applied media kit](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html)、[NASA media](https://www.nasa.gov/artemis-ii-media-resources/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[Nasdaq](https://www.nasdaq.com/marketsite/bell-ringing-ceremony)、[Defense](https://www.defense.gov/Multimedia/Videos/) | 2026-08-30 |
| `unknown` | 沒有跨產業、連續期間、相同納入規則的母體分母，故無法統計確認或反駁「集中」程度；DOE 也尚無單題材直接影片鏈。 | [TechNews non-replayable observation](https://technews.tw/)、[Applied 目標式樣本](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html)、[DOE newsroom](https://www.energy.gov/newsroom) | 2026-08-30 |
| `coverage gap` | 車廠、航太、央行、交易所、國防、生技、能源與半導體設備未使用相同期間和分母；現有案例不能做跨領域命中率排序。 | [Toyota](https://global.toyota/en/newsroom/)、[NASA](https://www.nasa.gov/artemis-ii-media-resources/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[Nasdaq](https://www.nasdaq.com/marketsite/bell-ringing-ceremony)、[Defense](https://www.defense.gov/Multimedia/Videos/)、[Pfizer](https://www.pfizer.com/newsroom)、[DOE](https://www.energy.gov/newsroom)、[Applied](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |

## 5. 建議進入後續實作驗證的兩條來源路徑

排序是階段一研究建議，不是人類 gate 決定，也不是下載／授權通過。

| 排名 | 建議 ID | 路徑 | 排序理由 | 可用證據與 k/n 邊界 | 未解風險／coverage gap | 判定 | 直接證據 URL | 查核日期 |
|---|---|---|---|---|---|---|---|---|
| 1 | R-01 | `TechNews 全站／分類 RSS → 題材判斷 → 回溯第一方 newsroom／media kit → 只保留有 direct video／b-roll 候選路徑的題材` | TechNews 有可機械讀取的全站與分類 RSS、具名合作媒體頁與 Ars Technica 單篇上游案例；Apple 與 NASA 提供回溯第一方的具體案例，Applied 顯示上游 media kit 可給較明確資產候選。相較固定 watchlist，先保留選題廣度，故排第一。 | M-B1 為 `unknown`／non-replayable，沒有可用 `k/n`，不得支撐此路徑成功率；Apple 是目的式單例；Applied 3/3 是偏向視覺資產的目標式樣本。 | 需要 resolver；合作名單不等於逐篇來源；第一方精確資產、metadata、`D/L` 逐題查；RSS 長期 cadence 與端到端命中率未知。 | 路徑元件存在 `confirmed`；整條路徑可持續性為 `inferred`，pipeline readiness `unknown`。 | [全站 RSS](https://technews.tw/feed/)、[半導體 RSS](https://technews.tw/category/semiconductor/feed/)、[內容合作](https://technews.tw/content-exchange/)、[Ars 案例](https://technews.tw/2025/10/22/satellite-operators-will-soon-join-airlines-in-using-starlink-in-flight-wi-fi/)、[Apple TechNews](https://technews.tw/2025/05/14/apple-unveils-powerful-accessibility-features-coming-later-this-year/)、[Apple newsroom](https://www.apple.com/newsroom/2025/05/apple-unveils-powerful-accessibility-features-coming-later-this-year/)、[NASA TechNews](https://technews.tw/2025/07/08/nasa-is-using-virtual-reality-to-train-for-moon-missions/)、[Applied](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 |
| 2 | R-02 | `第一方高資產 watchlist（先以 Applied Materials＋NASA；Toyota／ECB／Defense 作擴充候選）→ 官方 press／media entry → direct video／b-roll 候選` | 少一層上游辨識，provenance 較直接；Applied media kit 與 NASA resource page 已明示影片／b-roll 類資產。代價是機構與題材偏差較大，故排第二。 | Applied 3/3 僅目標式 entry；NASA 頁已按 media resource 篩選，沒有一般新聞分母；其他機構只確認頁面／單例。 | watchlist 偏差、題材較窄；cadence、精確資產、metadata、下載與使用條款仍逐來源驗證。ECB 另有 talking-head 視覺適配風險。 | 核心資產頁存在 `confirmed`；作穩定來源策略為 `inferred`；`D/L` `unknown`。 | [Applied](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html)、[NASA](https://www.nasa.gov/artemis-ii-media-resources/)、[Toyota](https://global.toyota/en/newsroom/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[Defense](https://www.defense.gov/Multimedia/Videos/) | 2026-08-30 |

**暫不列前二：CMoney。** A-01 的 0/5 只表示五篇正文沒有直接官方影片 URL，加上 RSS 與列表完整列舉仍為 `unknown`；因此先保留為本地市場題材 signal／後續 comparator，而不是判定來源無價值。證據：[CMoney 列表](https://cmnews.com.tw/forumnews) 與 [M-A1](#m-a1-分母明細)；查核日期：2026-08-30。

## 6. Coverage gaps

| Gap ID | 缺口範圍 | 已知狀態 | 對結論的影響 | 關閉條件 | 證據 URL／依據 | 查核日期 | 狀態 |
|---|---|---|---|---|---|---|---|
| CG-01 | 研究搜尋覆蓋 | 規劃中的 websearch 工作因 monthly usage quota unavailable 而未執行。這只描述研究流程，**不作為任何來源結論的證據**；本文件外部結論只使用各列公開 URL。 | 缺少獨立的廣搜與第二輪來源發現，可能漏掉來源或反例。 | 由可用的獨立搜尋流程依同一欄位補查，且新增結論仍須直接 URL。 | 研究流程狀態；不作外部來源證據。 | 2026-08-30 | `coverage gap` |
| CG-02 | 真正命中率分母 | 只有 M-A1 便利樣本與 M-C4 目標式樣本可回算；M-B1 是 `unknown`／non-replayable observation，沒有 `k/n`。 | 不能比較 CMoney、TechNews、上游或跨產業的實際 `V/P` 命中率。 | 對候選來源選同一連續期間、先列舉再搜影片、保留完整分母與排除表。 | [CMoney 列表](https://cmnews.com.tw/forumnews)、[TechNews 首頁](https://technews.tw/)、[Applied media kit](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 | `coverage gap` |
| CG-03 | 下載與授權 | 本輪未做 metadata preflight、下載或逐支權利查核；部分頁面雖寫 download，仍只確認 `V/P` 線索。 | 任何來源都不能標 pipeline-ready，也不能視為已授權發布。 | 階段二在被人選定後，逐題做既有 GATE 1 preflight 與權利判斷；本階段不執行。 | 本輪執行邊界；頁面例：[NASA](https://www.nasa.gov/artemis-ii-media-resources/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[NIH support](https://videocast.nih.gov/support) | 2026-08-30 | `coverage gap` |
| CG-04 | 可重現性 | TechNews M-B1 已移出可回算 `k/n`，因其未保留其餘 9 篇 URL、凍結快照、納入順序與逐篇 0/1；NASA C-03 未保留 science.nasa.gov target；Defense 未保留範例 CloudFront asset URL。 | M-B1 只能保留為 `unknown`／non-replayable，其餘部分媒體鏈也不能逐項重播。 | 補齊 item-level URL 或可存續的公開頁引用，不以 agent 記述代替。 | [TechNews 首頁](https://technews.tw/)、[NASA TechNews 文章](https://technews.tw/2025/07/08/nasa-is-using-virtual-reality-to-train-for-moon-missions/)、[Defense Videos](https://www.defense.gov/Multimedia/Videos/) | 2026-08-30 | `coverage gap` |
| CG-05 | CMoney 列舉與介面 | hydration fallback 使列表的純 HTTP 完整性未知；API 只確認 descriptor，未呼叫；RSS 未證實。 | 尚不能把 CMoney 當機械穩定入口，也不能判定不可用。 | 只讀驗證匿名 endpoint、資料新鮮度、分頁完整性與公開 RSS 狀態。 | [列表](https://cmnews.com.tw/forumnews)、[DailyHeadline descriptor](https://www.cmoney.tw/cm-service/CMService.asmx?op=GetDailyHeadlineArticles)、[StockRss descriptor](https://www.cmoney.tw/cm-service/CMService.asmx?op=GetStockRssArticles) | 2026-08-30 | `coverage gap` |
| CG-06 | D 的跨領域比較 | 八類反例是目的式頁面／案例，不是相同期間的完整母體。 | 只能否定「只有科技」的排他說法，不能估計集中程度。 | 用一致期間、題材納入規則與 `V/P` 定義建立各類分母。 | [Toyota](https://global.toyota/en/newsroom/)、[NASA](https://www.nasa.gov/artemis-ii-media-resources/)、[ECB](https://www.ecb.europa.eu/press/press_conference/html/index.en.html)、[Nasdaq](https://www.nasdaq.com/marketsite/bell-ringing-ceremony)、[Defense](https://www.defense.gov/Multimedia/Videos/)、[Pfizer](https://www.pfizer.com/newsroom)、[DOE](https://www.energy.gov/newsroom)、[Applied](https://www.appliedmaterials.com/us/en/newsroom/media-kit-digital-assets.html) | 2026-08-30 | `coverage gap` |
| CG-07 | TechNews 上游完整性 | C-00 只確認官方合作名單，C-05 只確認一個 Ars Technica 外媒案例；既有 PR Newswire、Apple、NASA、Applied 也都是個別入口／案例。 | 不能把合作名單映射到每篇文章，也不能視為完整上游；R-01 仍需逐篇 resolver。 | 對連續期間文章保留逐篇外連 target、來源角色與去重紀錄，再評估 cadence／覆蓋。 | [內容合作](https://technews.tw/content-exchange/)、[Ars 案例](https://technews.tw/2025/10/22/satellite-operators-will-soon-join-airlines-in-using-starlink-in-flight-wi-fi/)、[PR Newswire](https://technews.tw/author/pr-newswire/) | 2026-08-30 | `coverage gap` |

## 7. 階段一人類 gate

**Gate 狀態：已通過（human-gate-passed）。** 使用者在閱讀 Source Map 後要求 R-01、R-02 與其餘內容繼續探索；其後明確將本輪題材與素材判斷委派給 orchestrator，要求一有最低可執行素材便與深度探索並行成片，直到「探索＋成片＋audit＋結論 artifact」才回到人類 GATE 2。

這次 gate 只改變執行授權，不把 v0.3 的未知事項改寫為已知：

- R-01 與 R-02 同時進入驗證，不以原始排序排他選一。
- 原 GATE 1 已委派；不再等待使用者逐題挑素材。
- 使用者確認既有 harness 不觸發影片生成費用；仍禁止付費素材、登入、註冊與付款路徑。
- `D` 由 fresh-run 關閉；`L` 仍須依逐支權利條款判定，內部測試成功不能外推可公開發布。
- 下一個人類判斷點是 GATE 2；在完整 audit artifact 交付前不要求中途選題。

| 決策日期 | 選定路徑 | 選擇理由 | 接受的 coverage gaps | 人類明確確認 |
|---|---|---|---|---|
| 2026-08-30 | R-01＋R-02 並行；最低可執行候選直接 fresh-run | 來源廣度與高資產密度是互補問題；無影片生成費用，可在探索未結束前提早取得成片證據 | 接受先以小樣本、watchlist 偏差與逐題權利未知開始；最終 artifact 必須揭露而非掩蓋 | 已確認；題材與素材判斷委派 orchestrator，GATE 2 延後到完整交付 |

後續版本化證據：[`2026-08-30-r01-replayable-sample.md`](./2026-08-30-r01-replayable-sample.md)。
