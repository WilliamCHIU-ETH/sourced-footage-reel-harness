# exploration — 來源層探索（2026-08-30 ～ 08-31，已凍結）

**這是史料，不是指令。** 跟 [`RECIPE.md`](../RECIPE.md) 同性質：記錄當時查了什麼、用什麼證據、結論停在哪裡。
開新題材時不要把這裡的候選、素材或判定當成答案——來源狀態會變，證據都綁著 2026-08-30／08-31 的查核日期。

harness 本體（`SKILL.md`、`ASSUMPTIONS.md`、`bin/`）在這一輪**沒有被修改**，只新增這個資料夾。

## 這一輪在解什麼

當時的產線已經能剪出成片，但**題材入口依賴人工放進來的台股晨報 DOCX**：來源供應不穩，題材範圍也被綁在台股。
這一輪要回答的是：系統能不能自己找到「值得做、而且配得到公開官方影片」的題材。完整意圖與授權邊界見 [`intent.md`](./intent.md)。

## 三條線，結論各自停在哪

| 線 | 做到哪裡 | 結論 |
|---|---|---|
| **來源地圖** | [`2026-08-30-source-map.md`](./2026-08-30-source-map.md) v0.4，human-gate-passed | 逐個來源記下 URL 樣式、取用方式、更新頻率、登入／JS／RSS 狀態，每條結論分級為 `confirmed`／`inferred`／`unknown`／`coverage gap`。**影片頁存在 ≠ 能下載 ≠ 有發布授權**，這條邊界寫在文件開頭 |
| **GTA VI 候選** | preproduction 全套（interest proxy v0.2→v0.4、technical／visual preflight、production plan、兩輪 reviewer audit） | **沒有成片。** reviewer hold 未解除、`fresh_run_authorized:false`。visual preflight 實看八張圖後另外發現內容安全欄位缺漏，補進 QA 要求 |
| **NASA Roman 候選** | [`2026-08-31-roman-render-decision-lock.md`](./2026-08-31-roman-render-decision-lock.md) → 一支 60 秒成片 | 使用者明確授權跳過 `interest_signals=UNKNOWN` 的等待，用 NASA SVS item 15080 完成一支內部驗收成片。**`publication_hold=true`**——素材頁列 Universal Production Music，對外發布權利仍是 `UNKNOWN` |

## 檔案

| 群組 | 檔案 |
|---|---|
| 意圖與來源地圖 | `intent.md`、`2026-08-30-source-map.md`、`2026-08-30-r01-replayable-sample.md` |
| Editorial Gate 規格與候選 | `2026-08-30-editorial-gate-v0.1.md`、`2026-08-30-editorial-gate-dry-run.md`、`2026-08-31-cmoney-editorial-gate-v0.2.md`、`2026-08-31-cmoney-editorial-shortlist-v0.2.md`、`2026-08-31-cmoney-editorial-evidence-packet-v0.1.md`、`2026-08-31-news-material-shortlist.md` |
| GTA VI 候選 | `2026-08-30-gta-*.md`（editorial brief／gate／interest proxy 四版／technical 與 visual preflight／production plan／reviewer findings） |
| NASA Roman 候選 | `2026-08-31-roman-*.md`（interest proxy、editorial core preflight、素材 preflight、decision lock） |
| 證據 | `evidence/`（見下） |

## evidence/ 怎麼讀

每個子資料夾是一次量測的**不可變證據**：premeasurement 先鎖 SHA-256，再發請求，失敗就照實留下 exit code 與空白欄位。

- `gta-interest-v02/` — 公開匿名 curl 被 403 擋下（curl exit 56）。**失敗紀錄刻意保留**：有 body 路徑但沒有 body 檔，是因為 HTTP error 沒產出 body，不是漏抓。Batch B 在宣告的停止條件下沒有執行
- `gta-interest-v04-dom-html/` — 改走 DOM-HTML 取得的四筆 root HTML 與正規化 JSON
- `gta-editorial-owner-v04-r02/` — editorial owner breadth 的第二輪量測
- `gta-visual-preflight/` — 五窗口選鏡的 contact strip（primary 與 fallback 兩組）
- `roman-interest/` — YouTube metadata 與選片 ledger

不記錄 cookie、token、帳密或任何憑證；所有請求都是公開未登入路徑。
