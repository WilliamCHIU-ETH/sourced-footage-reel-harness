# CMoney 短影音 Editorial Gate v0.2

- 日期：2026-08-31
- 狀態：Decision Lock
- 受眾：沒有時間完整追新聞、主要透過 Reels／短影音接收市場資訊的 CMoney 財經觀眾
- 位置：來源探索與 harness GATE 1 之前
- 範圍：只判斷題材是否值得進入 CMoney 的短影音候選；不下載、不剪輯、不 render、不更改 production code
- 前版：`2026-08-30-editorial-gate-v0.1.md` 保留為「一般科技觀眾」歷史版本，不回寫、不覆蓋

## 1. 本輪決定

CMoney 不需要轉述所有熱門新聞。本 Gate 的內容承諾是：

> 用一分鐘替沒時間的投資人說清楚：發生什麼事、它影響誰的收入／成本／估值／資金或產業趨勢、為什麼現在值得注意，以及下一個可觀察訊號是什麼。

「有官方影片」、「科技品牌很大」、「事件很新」都不是單獨的入選理由。科技題材可以入選，但必須完成真實、可回查的財經因果鏈；不得為了貼股票而製造不存在的關係。

## 2. 決策規則

Gate 恰有七項：`freshness`、`why_now`、`financial_relevance`、`viewer_payoff`、`interest_signals`、`visual_source_fit`、`audio_role_fit`。

- 每項只有 `PASS`、`FAIL`、`UNKNOWN`。
- 七項全 PASS 才是 `EDITORIAL_PASS`，可推薦進下一個 Story Package／render 決策。
- 任一 FAIL 即為 `EDITORIAL_FAIL`，停止，不為了出片而換一套理由。
- 無 FAIL、至少一項 UNKNOWN，即為 `EDITORIAL_UNKNOWN`；只能補指定缺口，不得先 render 再回填。
- 每個 cycle 允許零個 PASS；零產出不是 pipeline failure。
- Gate 只證明「值得測試」，不能證明觀眾真的在乎；發布後 outcome 另行量測，不能回填成事前證據。

所有結論必須標記 `confirmed`、`inferred` 或 `unknown`。官方性能、展望與財測必須保留歸因，不得改寫為已實現成果。

## 3. 七項 Gate

### G1 Freshness

- `PASS`：以評估當下回看 rolling 168 小時，實質事件或正式公告的 anchor 在窗內。
- `FAIL`：事件超過 168 小時，只是舊聞重發、回顧或頁面更新。
- `UNKNOWN`：事件時間、時區或真正 anchor 無法回查。

必填：`event_at`、`evaluated_at`、`age_hours`、`anchor_type`、`source_url`、`checked_at`。

### G2 Why now

- `PASS`：能以來源完成 `before state → new development → immediate consequence/question`。
- `FAIL`：只有規格朗讀、品牌曝光、價格回顧或沒有 state change 的常識內容。
- `UNKNOWN`：疑似有新進展，但前後狀態或即時後果只能靠未驗證轉述。

### G3 Financial relevance（hard gate）

候選必須完成：

`事件 → 受影響的財務／市場變數 → 公司／產業／資產 → 下一個可觀察指標`

- `PASS`：四段都有可回查證據，且關聯不是只靠品牌聯想。可接受的變數包括收入、成本、毛利、資本支出、供需、定價、產能、利率、匯率、監管成本、風險溢酬與估值假設。
- `FAIL`：只能說「投資人可能有興趣」、只有股價反應、只有科技新奇感，或必須硬接一檔股票才看似財經。
- `UNKNOWN`：合理關聯存在，但受影響對象、作用機制或下一個指標缺證。

必填：`financial_chain`、`affected_entities_or_assets[]`、`mechanism_claims[]`、`next_observable`、`counterfactual`、`source_urls[]`。

### G4 Viewer payoff

看完後，觀眾必須能回答：

1. 發生什麼事？
2. 市場為什麼在乎？
3. 誰可能受到影響，而且方向與限制是什麼？
4. 接下來應觀察哪個具名訊號？

- `PASS`：四題都有一段一般投資人可理解的答案，並至少交代一個限制或反證。
- `FAIL`：只得到公司宣傳、EPS 數字、產品規格或「值得關注」的空話。
- `UNKNOWN`：主要影響可能成立，但無法轉成具體觀察框架。

### G5 Interest signals

- `PASS`：至少兩種互相獨立的事前 proxy，其中至少一種是 audience-behavior／demand proxy；必須附 observation window、baseline、region、母體限制與查核時間。
- `FAIL`：兩種可比較 proxy 一致低於事前 baseline，且沒有可回查的反向訊號。
- `UNKNOWN`：只有編輯直覺、官方宣傳、同稿轉載、不可比較的 views，或沒有 baseline。

財經新聞中的價格／成交量反應可以是市場關注 proxy，但不能單獨證明觀眾需要這支影片，也不能代替 G3 的因果機制。

### G6 Visual/source fit

- `PASS`：事實來源可回查；有直接展示事件、公司、產品、發言或機制的第一方／官方動態素材；素材頁、時間、metadata、公開取得路徑與畫面 mapping 可查。
- `FAIL`：只有通用 B-roll、生成畫面、同業節目、純文字卡，或畫面與標題所稱事件不一致。
- `UNKNOWN`：影片存在，但內容、取得性、片長、構圖或 rights 邊界未確認。

若是資料畫面而非實際事件，第一幀起就必須能誠實標示；不能延後到觀眾已可能形成錯誤理解之後。

### G7 Audio role fit

每支候選必須選一個主要聲音角色，不能因為來源剛好有聲音就保留：

1. `TRANSLATE_SOURCE`：原聲包含重要發言；中文字幕忠實翻譯並依語意對齊。
2. `AMBIENT_EDITORIAL`：原聲只提供環境／情緒；繁中 editorial captions 獨立敘事，原聲不得與字幕競爭，且音樂／人聲權利須可用。
3. `ZH_VOICEOVER`：中文旁白是主要敘事；來源聲音移除、降低或只保留必要環境聲。

- `PASS`：角色、理由、觀眾開聲／關聲時的體驗、權利狀態與現有 harness 相容性都明確。
- `FAIL`：原聲與字幕形成兩套互相競爭的敘事、保留第三方音樂卻沒有必要價值，或唯一合理策略明確超出本輪允許範圍。
- `UNKNOWN`：尚未確認素材含人聲、音樂、環境音或授權條件。

必填：`audio_mode`、`audio_job`、`sound_on_experience`、`sound_off_experience`、`speech_translation_required`、`rights_status`、`current_harness_compatible`、`execution_gap`。

## 4. 候選卡 contract

```yaml
gate_version: cmoney-editorial-v0.2
evaluated_at: <ISO-8601 with timezone>
candidate_id: <stable id>
topic: <topic>
one_sentence_angle: <event + finance consequence + next observable>
criteria:
  freshness: {status: PASS|FAIL|UNKNOWN, evidence: []}
  why_now: {status: PASS|FAIL|UNKNOWN, evidence: []}
  financial_relevance: {status: PASS|FAIL|UNKNOWN, evidence: []}
  viewer_payoff: {status: PASS|FAIL|UNKNOWN, evidence: []}
  interest_signals: {status: PASS|FAIL|UNKNOWN, evidence: []}
  visual_source_fit: {status: PASS|FAIL|UNKNOWN, evidence: []}
  audio_role_fit: {status: PASS|FAIL|UNKNOWN, evidence: []}
overall_status: EDITORIAL_PASS|EDITORIAL_FAIL|EDITORIAL_UNKNOWN
confirmed: []
inferred: []
unknowns: []
hard_fail_reasons: []
publication_hold: true|false
next_action: RECOMMEND|REJECT|RESOLVE_WITHIN_WINDOW
```

每個 cycle 必須同時交付三張完整候選卡與一個明確推薦；不得只寫贏家。若無 PASS，推薦欄必須寫 `NO_RECOMMENDATION`。

## 5. Roman 回判

`roman-launch-2026-08-30-final.mp4` 維持 `USER_RECOGNIZED_INTERNAL_ARTIFACT`，不重做也不否定視覺成果。但以本版 CMoney Gate 回判：

- Freshness：PASS。
- Why now：PASS。
- Financial relevance：FAIL；目前沒有成立的收入／成本／估值／資金／產業鏈影響與下一個財經觀察指標。
- Viewer payoff：對一般科技觀眾成立，對 CMoney 財經觀眾未成立。
- Interest signals：UNKNOWN。
- Visual/source fit：資料畫面邊界與 reviewer findings 原樣保留。
- Audio role fit：UNKNOWN；獨立 editorial captions 加來源音樂的必要價值未成立，且第三方音樂 rights 未解。

Disposition：作為來源到成片的能力證據持久保存，不作 CMoney 主頻道 Editorial PASS。

## 6. 本輪探索與停止條件

只查最近一週三類各一題：

1. 財報／公司展望。
2. 央行、交易所或重大政策。
3. 與上市公司、財務變數或供應鏈有直接關係的科技事件。

每類先找候選，再用同一版 Gate 評估。只有七項全 PASS 才能推薦進 Story Package；本輪交付 shortlist 與推薦後停止，不啟動下載、run 或 render。

## 7. 後續成效邊界

Editorial PASS 只能支持「值得發布測試」。實際出現在 CMoney 後，仍需用既有頻道 baseline 比較前三秒留存、50%／完整觀看、收藏、分享、有效留言或可觀察的後續行動；沒有 observed outcome 前，不得宣稱已證明觀眾價值。
