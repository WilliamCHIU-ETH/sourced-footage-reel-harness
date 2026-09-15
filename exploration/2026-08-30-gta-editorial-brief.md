# GTA VI 60 秒 Reel editorial brief

- artifact：`gta-editorial-brief`
- artifact 版本：`v0.4`
- 日期：`2026-08-30`
- candidate：`GE-GTA-VI-20260830-R1`
- audience：沒有時間看完整發布內容、平常以 Reels 追科技／遊戲時事的一般觀眾
- 狀態：`PREPRODUCTION_GATE_PASS_REVIEW_PENDING`；v0.4 behavior／owner proxies 與 active selected set 均 PASS，overall PASS，正式 Story Package 為 `exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05`，`reviewer_ready:true`；既有 reviewer hold 尚未解除，`fresh_run_authorized:false`

## 1. 一句話價值

這支片不是替 Rockstar 重播宣傳，而是用 60 秒回答：8 月 27 日新增的近 27 分鐘官方展示，究竟讓觀眾多知道了什麼、又有哪些事情仍不能下結論。

## 2. 選材 Gate card

| 問題 | 判斷 | 證據邊界 |
|---|---|---|
| 為什麼現在要知道？ | 8 月 27 日首次公開，評估時約 64.5 小時，落在 rolling 168h 內。 | 精確 anchor 與計算見 `gta-gate-evidence-supplement v0.3`。 |
| 觀眾會得到什麼？ | 不看完整 26:48，也能理解這次新增的是任務分工、活動與日常互動，並知道哪些問題仍須等未剪輯實測。 | 素材內容須由 active selected set 的 visual preflight 與官方繁中 VTT 雙重對位。 |
| 觀眾真的可能在乎嗎？ | `PASS`；frozen behavior proxy 為 `1061 ÷ median(1001,371,233) = 2.8598x ≥ 1.5x`，另有固定 48h window 內兩個 distinct parent owners。 | canonical evidence 為 `gta-interest-proxy-v0.4-measurement v0.1`；convenience-set／post-age selection bias 必須交 reviewer，舊 score proxy 與 v0.2／v0.3 失敗史均不補位。 |
| 為何適合短影音？ | 原片近 27 分鐘；60 秒的價值是把「新增資訊」和「尚未證明」分開。 | 不以漂亮畫面本身當 payoff。 |
| 官方影片可用嗎？ | 第一方 1080p30 direct asset、AAC 音訊與 zh-Hant VTT 技術可讀。 | 公開重製權仍 UNKNOWN；只做 internal GATE 2，`publication_hold:true`。 |

## 3. 固定三行 headline

```text
GTA VI 這次
給了 {{num}}27 分鐘{{/num}}實機
但證明了什麼？
```

必要 attribution：footer 或貼文必須標示 `影片來源：Rockstar Games`。第二行的「實機」只可在同畫面或 caption 明示「官方稱／官方展示／PS5 遊戲內畫面」；不可寫成獨立效能測試。

## 4. 五段敘事與候選視覺

| Section | 成片時間 | v0.4 fixed active window | 來源 | 目的 |
|---|---:|---:|---|---|
| `S1` | 0–12s | `00:03:32.500–00:03:44.500` | retained `primary-b01` | hook：有足夠長度可檢查任務，而非只看 montage |
| `S2` | 12–24s | `00:24:15.000–00:24:27.000` | `fallback-b02/S2-R1` PASS | 任務角色分工與行動切換不同位置 |
| `S3` | 24–36s | `00:17:22.000–00:17:34.000` | `fallback-b02/S3-R1` PASS | 避開訓練器 prompt，呈現水上與場館活動 |
| `S4` | 36–48s | `00:06:24.000–00:06:36.000` | `fallback-b02/S4-R1` PASS | 角色日常互動，承接長片資訊密度 |
| `S5` | 48–60s | `00:23:14.000–00:23:26.000` | retained `primary-b01` | 結尾 payoff：上市前仍須等真實技術驗收 |

每個 12 秒 section 切成兩個相鄰 6 秒 shot。相鄰 pair 保持來源連續；只在 12／24／36／48 秒做極短色彩 dip 與音訊淡出入，避免上一支被指出的「突然斷掉、頓一下」。`fallback-b02` 恰三項且沒有再 fallback；逐格 QA 與相鄰 pair 結論見 `gta-visual-preflight v0.4`，上表是 fixed active selected set。Editorial Gate 已全 PASS，但 `reviewer_ready:true` 不等於 reviewer 已核准 production；既有 hold 明確解除前仍不得開始 fresh run。

## 5. 20 段 viewer-facing 中文字幕

每段 3 秒。這些是「編輯摘要」，不是逐句翻譯英文對白；時間帶與畫面語意要用官方 zh-Hant VTT 及 visual preflight 對位，成片 artifact 必須明示此邊界。去空白字元數為 `247`，`247 ÷ 60 = 4.1167 字／秒`，符合 4–5 硬門檻；不用技術 metadata 補字。

| # | Caption | 目的 |
|---:|---|---|
| 01 | `8/27，Rockstar 公開全新長篇展示` | freshness |
| 02 | `這次不再只是三分鐘宣傳預告` | before state |
| 03 | `而是接近二十七分鐘官方實機` | delta |
| 04 | `官方稱全片取自PS5遊戲內畫面` | attribution |
| 05 | `值得檢查的不只表面畫質` | redirect |
| 06 | `而是任務終於可以連續看懂` | payoff |
| 07 | `官方展示任務角色分工` | observed structure, identity-neutral |
| 08 | `再把行動切到不同位置` | spatial transition |
| 09 | `追車與槍戰不是全部` | redirect from action-only reading |
| 10 | `水上與場館活動也入鏡` | active S3-R1 world activity |
| 11 | `角色日常也被留下` | daily interaction |
| 12 | `長片才看得出這些密度` | viewer value synthesis |
| 13 | `但別忘了這仍是官方剪輯` | evidence boundary |
| 14 | `它只證明官方選擇展示了什麼` | evidence boundary |
| 15 | `不代表發售版本已經穩定` | unknown |
| 16 | `幀率、PC版本與自由度仍沒答案` | unknown |
| 17 | `所以重點不是現在就決定必買` | decision boundary |
| 18 | `而是熱度背後終於有內容可檢查` | audience value |
| 19 | `正式上市前還要等未剪輯實測` | editorial evidence boundary；不主張未映射日期 |
| 20 | `你最想先驗效能、任務還是世界？` | engagement prompt |

禁止把 production metadata（H.264、AAC、VTT cue 數、下載方式、candidate window 數、rights workflow）當 viewer-facing caption。這些只留在 audit artifact。

## 6. IG Reels 內文

> GTA VI 終於給了近 27 分鐘實機，但別只看畫面有多漂亮。
>
> 8/27，Rockstar 公開《An Extended Look》，官方表示全片取自 PS5 遊戲內畫面。這次真正新增的資訊，是你可以連續看到任務如何分工、活動與日常互動如何被留下。
>
> 但這仍是剪輯過的官方 showcase：它不等於發售版幀率、穩定度、PC 版或自由度已獲證明。正式上市前，下一個值得追的是未剪輯實機與技術測試。
>
> 你最想先確認哪一項：效能、任務節奏，還是世界細節？
>
> 影片來源：Rockstar Games  
> #GTAVI #RockstarGames #PS5 #科技新聞 #遊戲新知

狀態：`INTERNAL_PREVIEW_COPY`。公開前仍須 intended-use rights clearance；此 copy 不得解除 `publication_hold:true`。

## 7. 成片停止條件

任何一項成立就不得 render：

1. 五段中央裁切預檢無法清楚看到對應主體或文字／UI 被截斷。
2. Caption 07–12 的 identity-neutral 任務分工、空間切換、活動與日常密度無法由 active selected set 加官方 zh-Hant VTT 支持。
3. 任何 caption 被誤寫成英文對白的逐句翻譯或獨立 gameplay／效能測試。
4. 12／24／36／48 秒換段仍出現可感知的黑幀、音訊斷點或停頓。
5. Editorial Gate 不再是五項全 PASS，或正式 Story Package ref 與 canonical `#formal-story-package-v05` 不一致。
6. Focused reviewer 尚未明確寫出 `REVIEW_PASS_FOR_FRESH_RUN`；`reviewer_ready:true` 不能替代該決定。
