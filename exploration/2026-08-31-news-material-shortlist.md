# 新聞素材 evidence-backed shortlist

## 文件狀態

| 欄位 | 值 |
|---|---|
| 版本 | v0.2 |
| 評估時間 | 2026-08-31T09:49:50+08:00（2026-08-31T01:49:50Z） |
| 範圍 | 只回答哪些新聞題材值得進下一輪 Editorial Gate；不下載、不剪輯、不 render、不修改 production code |
| 受眾 | 沒時間追完整新聞、主要透過 Reels／短影音接收資訊的一般科技觀眾 |
| 決策 | 推薦 `C1 NASA Roman 太空望遠鏡升空` 作為下一支候選；這是選材推薦，不是 production authorization |
| Reviewer | `REVIEW_PASS_WITH_GAPS`：0 blocker；推薦成立，但仍有下列明示 coverage gaps |

## 本輪 Decision Lock

本輪只比較三件事：事件是否仍在 rolling 168 小時內、一般觀眾看完能得到什麼、官方動態素材是否已能直接定位。三者是本輪已查候選中的 shortlist，不是已證明窮盡市場的「絕對前三名」。未完成的 audience-interest proxy、逐項權利判斷與素材 preflight 一律保留為 `UNKNOWN/COVERAGE GAP`，不以品牌知名度、agent 狀態或既有成片能力補成 PASS。C1、C2 目前只有可回查的官方遠端 locator，未保存本機快照、metadata 或 hash，因此獨立重播性仍是 coverage gap。

## 三個候選

| 排名 | 候選 | 為什麼值得看 | 目前可取得的素材直接證據 | 主要風險 | 本輪判定 |
|---|---|---|---|---|---|
| 1 | **C1 NASA Nancy Grace Roman 太空望遠鏡於 8/30 升空** | 不是「又一枚火箭」：觀眾可在一分鐘內知道 Roman 與 Hubble／Webb 的差別，以及它為何能更快盤點暗物質、暗能量與系外行星。NASA 已確認 8/30 07:26 EDT 升空、望遠鏡與火箭分離、太陽能板部署；官方稱其巡天速度為 Hubble 的 1,000 倍，首批影像預計 2027 年初。 | 事件：[NASA 8/30 發布](https://www.nasa.gov/news-release/nasas-dark-universe-seeking-nancy-grace-roman-space-telescope-launches/)；同題材官方影片：[NASA SVS `Roman: Go For Launch`](https://svs.gsfc.nasa.gov/15080)，8/28 發布，列出 1080p 170.3 MB、4K 354.2/699.6 MB、SRT/VTT；[1080p direct MP4](https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4)。另有一組來自 **7/8、不同 SVS 項目**的 [Roman 直式素材頁（15058）](https://svs.gsfc.nasa.gov/15058/)與[1080×1920 無字 direct MP4](https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015058/Roman_Map_Vert_NoTOS.mp4)；它不是 8/28 主影片的直式版本，內容適配、片長與 credit 須另做 preflight。 | `UNKNOWN`：尚未量測台灣／一般科技觀眾的 demand proxy。影片主要是組裝、測試與任務解說，不可剪成「8/30 實際升空全程」；直式素材能否支撐敘事尚未驗證。NASA SVS 頁列音樂與完整 credit，重混與第三方元素權利仍須依 reproduction guideline 逐項確認。 | `SHORTLIST_PASS`；full Editorial Gate 尚為 `UNKNOWN`。 |
| 2 | **C2 ESA Ariane 6 將 MTG-I2 氣象衛星送入軌道** | 把火箭畫面連回日常用途：MTG-I2 將支援劇烈天氣 nowcasting；官方說明可每 2.5 分鐘掃描歐洲與北非、持續監測閃電，完整 MTG 系統預期產生前代至少 50 倍資料。觀眾得到的是「這次發射如何改變天氣預警」，不是只看升空。 | [ESA Television 官方頁](https://www.esa.int/esatv/Videos/2026/08/Ariane_6_launch_with_MTG-I2_highlights)記錄 8/27 22:11 CEST 升空、8/28 發布、片長 4:28、English、ESA copyright；[36.41 MB MP4](https://dlmultimedia.esa.int/download/public/videos/2026/08/035/2608_035_AR_EN.mp4)與[655.78 MB source MP4](https://dlmultimedia.esa.int/download/public/videos/2026/08/035/orig-2608_035_AR_EN.mp4)皆為官方 direct asset。 | `UNKNOWN`：台灣受眾對歐洲氣象基礎建設的興趣 proxy 未量測；官方說的是預期能力，不可改寫成已經改善某次災害預報。ESA 標示 copyright，公開下載不等於可任意重剪或商用。 | `SHORTLIST_PASS`；full Editorial Gate 尚為 `UNKNOWN`。 |
| 3 | **C3 Rockstar 8/27 公開 GTA VI 近 27 分鐘 Extended Look** | 有明確的「替觀眾省時間」工作：不是重播遊戲畫面，而是整理這 27 分鐘究竟展示了哪些任務、世界活動與角色互動，以及哪些效能、自由度與正式版品質仍未被證明。既有事前 proxy 顯示候選討論量相對固定 comparator median 為 2.8598 倍，且有兩個獨立編輯 owner 跟進；這只能支持合理的興趣賭注，不是播放成效。 | 官方頁：[Rockstar `An Extended Look`](https://www.rockstargames.com/VI/an-extended-look)；[1080p direct MP4](https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4)。既有且不重做的本機取得證據：`/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi/run-20260830T143055Z/acquisition-evidence.json` 記錄 1,980,545,083 bytes、SHA-256 `c1d0e4a9a0d5b36969415713f254f10b94e0039577a834cb3025f95133b385fd`；Gate 與 proxy 證據見 [`2026-08-30-gta-gate-and-story-package.md`](./2026-08-30-gta-gate-and-story-package.md) 與 [`2026-08-30-gta-interest-proxy-v0.4-measurement.md`](./2026-08-30-gta-interest-proxy-v0.4-measurement.md)。 | `CONFIRMED BLOCKER FOR PUBLICATION`：`rights_status=UNKNOWN`、`publication_hold=true`。素材是官方剪輯，不能當獨立效能測試；既有興趣樣本不是台灣 IG 母體，不能宣稱「會紅」。題材也比 Roman／MTG-I2 更偏遊戲受眾。 | 既有 `EDITORIAL_GATE_PASS` 保留；本 shortlist 不重開 production。 |

## 明確推薦

**推薦 C1：NASA Roman 太空望遠鏡升空，作為下一支候選。**

理由不是「NASA 品牌大」，而是三個可回查的組合：

1. **Why now 最強**：實際升空只發生在約 14 小時前，且已完成分離與太陽能板部署，不是預告或舊聞重發。
2. **觀眾收穫最清楚**：可回答「有 Hubble、Webb 之後，為何還需要 Roman？」並把 1,000 倍巡天速度、暗物質／暗能量與系外行星連成一條可理解的故事。
3. **官方畫面最接近下一步驗證需求**：主題已有 1080p、4K、captions 的官方 locator，另有一組較早、分開發布的 1080×1920 無字素材可優先檢查；是否足以支撐完整敘事仍是素材 preflight 的 `UNKNOWN`。
4. **證據邊界可說清楚**：現在能確認的是升空與任務設計，不能提前宣稱科學成果；首批影像仍要等 2027 年初。

下一個最小驗收只應是替 C1 補齊 Editorial Gate 的 audience-interest proxy、逐資產 rights/credit 判斷，以及核對 15058 直式素材的內容、片長與 credit；若要讓第三人可獨立重播查核，再凍結第一方頁面 metadata／hash。在這些項目完成前，不授權 Story Package、下載或成片。

## 未進前三的顯著候選

- **Samsung Galaxy S26 FE（8/27）**：[官方產品發布](https://news.samsung.com/global/samsung-galaxy-s26-fe-delivering-the-latest-flagship-experience-focused-on-what-matters-most)與[8 月 Galaxy Event 邀請頁](https://news.samsung.com/global/invitation-galaxy-event-august-2026)可定位；邀請頁嵌入影片 ID `i-kCaStA9dg`，metadata probe 顯示上傳日 2026-08-19、片長 12 秒。這只能證明邀請片可定位，不能證明 S26 FE 沒有其他官方 motion asset，因此「排除是否完整」為 `UNKNOWN`。
- **Apple M6／M5 Ultra（8/25）**：[官方新聞稿](https://www.apple.com/uk/newsroom/2026/08/apple-introduces-m6-and-m5-ultra-for-a-big-leap-in-performance-and-ai-compute/)與[官方 media ZIP](https://www.apple.com/newsroom/images/2026/08/apple-introduces-m6-and-m5-ultra-for-a-big-leap-in-performance-and-ai-compute/article/Media-of-Apple-M6-and-M5-Ultra-260825.zip)可直接定位，但本輪未確認 topic-specific motion footage；是否另有未被本輪查到的官方影片仍為 `UNKNOWN`，所以這是暫不入選，不是窮盡式排除。

## 證據邊界

- 所有公開頁於 `2026-08-31T09:49:50+08:00` 前查核；日期新不等於 audience-interest PASS。
- `direct MP4`、下載按鈕或本機已取得檔案都不等於公開／商用授權。
- C1、C2 的 interest signals 尚未量測，遠端頁面也未做本機 evidence freeze，因此本文件只作 shortlist，不冒充完整 Editorial Gate 或完全可重播的 acquisition audit。
- 既有 GTA proxy 原始紀錄有一個不影響算術與兩名 owner 結論、但影響追溯清晰度的低風險時間序矛盾：measurement 的 `measured_at` 早於其中一筆來源 capture time；本輪保留舊檔、不回寫歷史證據。
- 既有 GTA run、快照與取得證據全部保留；本輪沒有新增 source、run、render 或 production code 變更。

## Reviewer disposition

- 結果：`REVIEW_PASS_WITH_GAPS`，0 blocker；三候選欄位、168 小時 freshness 與 GTA proxy 算術均通過核對。
- 已修正：不再把另一個較早的 Roman 直式 asset 當作主影片的直式版本，也不再從 locator 推論素材已足夠；補上 C1、Samsung、Apple 與 GTA 的可定位證據。
- 仍未關閉：C1／C2 本機凍結證據、audience-interest proxy、逐資產權利／credit、C1 直式素材適配，以及未入選候選的窮盡性。
- 決策影響：以上 gaps 使推薦保持「下一個要過 Editorial Gate 的候選」，不構成下載、剪輯、發布或成效承諾。
