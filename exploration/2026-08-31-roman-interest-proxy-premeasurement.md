# Roman interest proxy premeasurement lock

- artifact：`roman-interest-proxy-premeasurement`
- 版本：v0.1
- locked_at：`2026-08-31T02:48:54Z`（`2026-08-31T10:48:54+08:00`）
- candidate：NASA Nancy Grace Roman Space Telescope launch
- gate：`editorial-gate v0.1 / G4`
- phase：`pre_publish_proxy`

## 目的與證據邊界

在讀取本輪新的 YouTube interaction 數字與 editorial-owner 計數前，先固定兩種互不重複的 interest proxy、選樣方式、門檻與停止條件。它們只判斷是否是合理的製作前興趣賭注，不預測 IG 播放、留存、分享或台灣觀眾結果。

## Proxy A：NASA YouTube 同頻道公開觀看行為

### Target 選取規則

以 `yt-dlp` 對 YouTube 公開頁做不下載 metadata 查核。Target 必須同時符合：

1. channel／uploader 為 NASA 官方主頻道；
2. title 同時包含 `Roman` 與 `Launch`；
3. upload date 為 `2026-08-30` 或 `2026-08-31`；
4. duration 至少 60 秒；
5. 若多於一筆，選 upload timestamp 最早、且明示完整 launch broadcast／coverage 的一筆；不得以 views 排序。

找不到唯一 target、官方身分無法確認或 metadata 缺漏時，Proxy A 為 `UNKNOWN`。

### Comparator 選取規則

從同一 NASA 官方頻道的上傳順序，固定取 target 之前最近的三支影片，且每支必須：

- 非 Shorts，duration 至少 60 秒；
- upload time 在 target 前 168 小時內；
- 非 Roman 同事件重複上傳；
- 公開 `view_count` 可讀。

選樣只依 channel、upload order、時間、duration 與題材去重，不看 views。若不足三支、時間不可回查或混入另一頻道，Proxy A 為 `UNKNOWN`，不得擴窗或改挑熱門片。

### Metric 與門檻

- metric：同一次 capture 的 `target view_count ÷ median(三支 comparator view_count)`。
- `PASS`：ratio `>= 1.5`。
- `FAIL`：ratio `< 1.5`，且四筆 metadata 皆完整可比。
- `UNKNOWN`：樣本不足、數值不可讀、直播／影片格式差異大到 reviewer 判不可比較，或 identity／capture time 不可重播。
- independence key：`youtube:nasa-main-channel:view-count`。

限制：同頻道 view count 是公開 audience behavior，但仍受 NASA 推薦流量、上架時間差、直播 replay 格式與全球受眾影響；不代表一般科技觀眾或台灣 IG。若四支 age 差異使 total views 明顯不可比，狀態必須降為 `UNKNOWN`，不得自行改成 view-rate metric。

## Proxy B：獨立 editorial-owner breadth

### 固定觀察窗與選入規則

- event anchor：`2026-08-30T11:26:00Z`（NASA 官方發布所載 07:26 EDT liftoff）。
- window：anchor 起 48 小時，即 `[2026-08-30T11:26:00Z, 2026-09-01T11:26:00Z)`；本輪只量測 captured_at 前已發生部分。
- 搜尋概念固定為：`Nancy Grace Roman Space Telescope launch`、`Roman telescope launched August 30 2026`。
- 只計 parent owner 不同、可回查 publish/live timestamp、且有原創事件敘述的 editorial coverage。
- NASA／ESA 等第一方稿、新聞稿逐字轉載、wire syndication 的多站鏡像、內容農場與只有搜尋 snippet 的結果不計。

### Metric 與門檻

- metric：合格 distinct parent owners 數。
- `PASS`：`>= 2`。
- `FAIL`：完成固定搜尋後為 `0`。
- `UNKNOWN`：只有 `1`、timestamp／owner identity 不可回查，或無法排除同一 wire syndication。
- independence key：每筆以 parent media owner 為 key。

限制：editorial breadth 證明編輯注意，不是 audience outcome；必須與 Proxy A 同時有效且正向，才能使 G4 `PASS`。

## 整合規則與停止條件

- Proxy A `PASS` 且 Proxy B `PASS`：G4 可評為 `PASS`，仍須保留 selection bias 與 region limitation。
- 任一 proxy `UNKNOWN`、或兩者不是獨立來源：G4=`UNKNOWN`，overall Editorial Gate 不得 PASS。
- Proxy A 與 Proxy B 均為有效且一致負向：G4=`FAIL`。
- 本輪不改 metric、不換 comparator、不以搜尋結果數、品牌知名度、agent 狀態或直覺補位；若公開介面取不到，保留失敗 evidence 後停止。

## 執行邊界

- `yt-dlp`：`/opt/anaconda3/bin/yt-dlp 2026.07.04`；只讀 metadata，`--no-download`。
- 不讀 browser cookie、不登入、不註冊、不付費、不下載影片。
- 所有 capture 記錄 URL／video ID／owner／timestamp／checked_at／command exit；能保存的 public response 凍結於 `exploration/evidence/roman-interest/`。
