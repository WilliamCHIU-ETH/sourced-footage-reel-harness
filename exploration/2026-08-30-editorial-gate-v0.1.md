# 科技短影音 Editorial Gate 規格

- 版本：v0.1
- 日期：2026-08-30
- 狀態：Decision Lock；供人工與 agent 共同執行
- 受眾：一般科技觀眾
- 位置：既有 sourced-footage-reel harness 的上游編輯 gate
- 範圍：只定義題材是否值得進入 Story Package；不搜尋來源、不下載素材、不製作或驗收影片

## 1. 內容承諾

替「沒有時間完整追新聞、主要透過 Reels／短影音接收資訊」的一般科技觀眾，整理**最近七天內真正有新進展、現在值得知道、看完有明確收穫，而且能由可信來源與官方畫面支撐**的科技時事。

這不是投資選股服務、公司宣傳轉貼、規格朗讀或每日硬湊一題。某一週沒有題材通過是合法結果；不得為維持出片量放寬任何門檻。

## 2. v0.1 Decision Lock

1. **Freshness 是 rolling 7 天／168 小時 hard gate。**以評估當下往回精確計算 168 小時，邊界含第 168 小時；不是「今天加前六個日曆日」，也不是 24–48 小時。
2. Gate 恰有五項且不得增設隱性第六項：`freshness`、`why_now`、`audience_payoff`、`interest_signals`、`visual_source_fit`。
3. 每項只有 `PASS`、`FAIL`、`UNKNOWN`。不採加權、平均分、四過一補或編輯直覺補分。
4. 候選只有五項全為 `PASS` 才是整體 `PASS`；任一項 `FAIL` 即整體 `FAIL`；沒有 `FAIL` 但至少一項 `UNKNOWN`，整體為 `UNKNOWN`。
5. 每週允許零個整體 `PASS`。七天內找不到題材，只能輸出空的 Story Package 清單，不得延長 freshness、降低 interest proxy、接受無 payoff 題材或改用不相干畫面。
6. 出片前的觀眾興趣只能稱為 **proxy**；出片後的觀看、留存、分享等才是 **observed outcome**。兩者不可混寫，事後結果也不得回填成事前已知。
7. 本規格不改動 `SKILL.md` 的 harness GATE 1／GATE 2。Editorial Gate 通過只允許建立 Story Package；不等於素材可下載、不等於成片通過，也不等於取得發布權。

## 3. 四個階段不可混用

流程固定為：

`source acquisition → editorial selection → Story Package → harness execution`

| 階段 | 要回答的問題 | 必要輸出 | 不得宣稱 |
|---|---|---|---|
| **Source acquisition** | 有哪些可回查的新事件、事實來源與官方素材候選？ | `Acquisition Record`：來源 URL、時間戳、擷取時間、事實摘要、素材頁與 metadata | 不得說題材值得做、不得給 Editorial PASS |
| **Editorial selection** | 這個候選是否履行內容承諾？ | 每候選一份 `Gate Evaluation`，逐項列五個狀態與證據 | 不得把有來源／有影片等同值得做 |
| **Story Package** | 通過的故事要以哪個角度、哪些事實邊界交給製作？ | 僅整體 PASS 才建立的版本化 handoff package | 不得宣稱已下載、已選完十個鏡頭或已通過 QA |
| **Harness execution** | 既有方法能否把 package 做成合規成片？ | inputs、素材、composition、QA、render、provenance、既有 GATE 1／2 結果 | 不得用「做得出來」倒推 Editorial Gate 合格 |

階段失敗要留在原階段命名。例如「找不到來源」是 acquisition 結果；「來源很新但觀眾沒有收穫」是 editorial FAIL；「下載後可用鏡頭不足」是 harness execution 問題。不得互相代換。

## 4. 共通狀態語義與決策順序

### 4.1 單項狀態

- `PASS`：該項所有必填證據完整、可回查，而且滿足下列明文門檻。
- `FAIL`：有足夠證據證明未達門檻，或撞到明列的 hard fail。
- `UNKNOWN`：必要證據缺漏、時間或來源互相衝突、樣本不可比較，因而無法重算。`UNKNOWN` 不是保守的 PASS，也不能以直覺改寫成 FAIL。

### 4.2 整體決策

依序執行：

1. 先算 `freshness`；明確超過 168 小時可立即停止該候選並標記整體 `FAIL`。
2. freshness 未 FAIL 才評估另外四項；即使能提早判定，也要保留已查證欄位與停止理由。
3. 五項全 PASS → 整體 `PASS`，可建立 Story Package。
4. 任一 FAIL → 整體 `FAIL`，不得建立 Story Package。
5. 無 FAIL、至少一項 UNKNOWN → 整體 `UNKNOWN`，只能在 168 小時窗內補證；到期仍未解即因 freshness 轉為 FAIL。

例外只能使用本文件列出的 exception code，而且只改變「何種證據可以成立」，**不能把既有 FAIL 直接覆寫成 PASS，也不能改變 168 小時門檻**。

## 5. 五項 Gate

### G1. Freshness（hard gate）

**目的**：確認故事講的是評估當下往回 168 小時內發生的實質新事件，而不是剛被重發的舊聞。

**計算**：

`age_hours = evaluated_at_utc - freshness_anchor_at_utc`

所有時間須為帶時區的 ISO 8601，計算時轉 UTC。優先使用實際事件／正式公告時間；只有事件時間不存在時，才可用第一方正式發布時間，並標示 anchor 類型。

- `PASS`：`0 ≤ age_hours ≤ 168`，且 anchor 對應本故事要講的實質新進展。
- `FAIL`：`age_hours > 168`；或只是轉載、更新頁面日期、回顧文，把舊事件偽裝成新事件。
- `UNKNOWN`：只有日期沒有時間、來源時間互相衝突、找不到可回查 anchor，或 clock／timezone 無法確定。

**Hard fail**：明確超過 168 小時即停止該候選；熱門、畫面好、主管指定或本週無題材都不能救回。

**例外規則**：

- `FR-NEW-MILESTONE`：舊主題在 168 小時內發生新的正式里程碑、修正、召回、裁決或安全公告，可以用新事件作 anchor；故事角度必須只承諾這個新進展。
- `FR-SCHEDULED-ANNOUNCEMENT`：未來活動本身不能倒算為已發生；但若「活動／產品日期的正式公布」在 168 小時內，且故事講的是這次公布，可用公布時間作 anchor。
- 沒有 evergreen、viral、週末或供稿不足例外。

**必填證據欄位**：

`freshness_anchor_at`、`freshness_anchor_type`、`evaluated_at`、`age_hours`、`event_source_url`、`source_published_at`、`source_checked_at`、`timezone`、`exception_code|null`。

### G2. Why now

**目的**：用一句話說明「相較昨天／上一狀態，現在到底改變了什麼」。發布日期新，不代表事件有新意。

- `PASS`：有一個可命名的新 trigger；能寫出 `before → new development → immediate consequence/question`，三者均有來源支撐。
- `FAIL`：只有品牌再被提及、常識型科普、週期性回顧、宣傳口號或舊規格重述；拿掉「今天」後故事完全不變。
- `UNKNOWN`：疑似有新進展，但 trigger 或前後差異只有二手轉述、無法回查，或彼此矛盾。

**Hard fail**：沒有實質 state change，不得用「最近很熱門」「AI 又有新消息」代替。

**例外規則**：

- `WN-ONGOING-UPDATE`：持續事件可因 168 小時內的新數據、新階段或正式處置通過；標題與 package 不得把整段舊歷史都包成新消息。
- `WN-CORRECTION`：足以改變觀眾理解的官方更正本身可成為 why now；小幅文字修訂不可。

**必填證據欄位**：

`trigger_statement`、`before_state`、`new_state`、`trigger_at`、`primary_source_urls[]`、`supporting_source_urls[]`、`claim_status`（`confirmed|inferred|unknown`）、`exception_code|null`。

### G3. Audience payoff

**目的**：一般科技觀眾看完後，能回答「我多懂了什麼、這會改變誰能做什麼、或我要注意什麼限制」。不可把公司或投資人的 payoff 冒充觀眾 payoff。

- `PASS`：有一條無須投資背景也能理解的 payoff statement；明列技術／產品差異、受影響的人或使用情境，以及至少一個限制、比較基準或證據邊界。
- `FAIL`：只講營收、EPS、毛利、股價、募資、公司排名、未解釋的規格表或「更快更強」；看完只能知道公司表現，不能理解科技變化。
- `UNKNOWN`：可能有觀眾價值，但影響鏈缺一段、只有公司自稱且未歸因，或無法說明比較基準。

**Hard fail**：無法用一句一般觀眾語言完成「因為 X 改變，所以 Y 類使用者／系統會感受到 Z」；不得進 Story Package。

**財報題 payoff 判準**：

- 可 PASS：財報／法說揭露了可驗證的技術或產品 state change，例如量產節點、部署／採用、產能與供應、產品延誤、服務價格或可用性改變；故事主體是這個科技變化，財務數字只是證據或背景。
- 必 FAIL：財測優於預期、營收成長、EPS、毛利率、股價反應、法人看法本身。不能以「投資人會關心」當一般觀眾 payoff。

**產品／突破題 payoff 判準**：

- 可 PASS：清楚交代新能力相對什麼 baseline 改變、誰能因此完成什麼、現階段限制／代價；第一方性能主張必須明示「官方表示／官方資料」，不得寫成獨立驗證。
- 必 FAIL：只有發表會存在、型號更新、最高／首款等 superlative，卻沒有能力差異、使用情境或限制。

**例外規則**：

- `AP-SAFETY`：資安、召回或人身／資料安全事件的 payoff 可以是「如何避免損害」；仍須有受影響範圍與可執行注意事項，不得只製造恐慌。
- 沒有投資 payoff、品牌知名度或高流量例外。

**必填證據欄位**：

`story_type`、`payoff_statement`、`viewer_question_answered`、`technology_or_product_delta`、`affected_audience`、`practical_consequence`、`constraint_or_boundary`、`supporting_claim_ids[]`、`claim_attribution`、`exception_code|null`。

### G4. Interest signals

**目的**：在製作前用可重算的 proxy 判斷這是不是合理的觀眾興趣賭注；不冒充實際播放成效。

**事前 proxy 類型**（至少來自兩種互不重複的訊號，其中至少一種須為 audience-behavior／demand proxy）：

1. 同頻道、同題型、相近長度內容的歷史表現，相對預先定義 baseline。
2. 搜尋需求或上升趨勢，附查核期間與地區。
3. 真實觀眾在平台上的討論、收藏、分享或問題密度；官方自推數據至多算一種 promotional proxy。
4. 兩個以上獨立編輯來源的顯著版位／持續追蹤；同一新聞稿的轉載與 syndication 只算一次。

- `PASS`：至少兩種有效且獨立 proxy 指向正向需求，含至少一種 audience-behavior／demand proxy；每種都附 baseline、觀察窗與限制。
- `FAIL`：同一預先定義的 comparable set 中，至少兩種有效 proxy（含一種 audience-behavior／demand proxy）一致低於 baseline，且沒有可回查反向訊號。
- `UNKNOWN`：少於兩種、只有編輯直覺、只有官方宣傳／轉載數、baseline 未事前定義、樣本不可比較或數值拿不到。

**Hard fail**：不得把 `UNKNOWN` 包裝成「應該會紅」。整體 gate 因而保持 UNKNOWN，不建立 Story Package。

**例外規則**：

- `IS-PUBLIC-INTEREST`：有官方嚴重度／受影響範圍的重大資安、召回或安全公告，可用可驗證的 public-impact proxy 取代第二種興趣 proxy；仍須有一種 audience-behavior／demand proxy，且不得稱為出片後實證。
- 新品類沒有歷史片不是 PASS 例外；證據不足就是 UNKNOWN。

**出片後 observed outcome**：只能在發布後另記 `views`、`qualified_views`、`retention`、`completion`、`saves`、`shares`、`comments` 與觀察窗，用來校準下一輪 proxy。不得修改原 Gate Evaluation 的事前狀態。

**必填證據欄位**：

`signal_phase`（Gate 時固定 `pre_publish_proxy`）、`proxy_records[]`（每筆含 `type`、`value_or_observation`、`baseline`、`window`、`region`、`source_url_or_internal_report`、`independence_key`、`limitation`）、`behavior_proxy_count`、`independent_proxy_count`、`post_publish_outcome_ref|null`、`exception_code|null`。

### G5. Visual/source fit

**目的**：確認故事同時有可回查的事實來源，以及至少一支能直接展示題材、技術上可交給既有 harness 驗證的公開官方影片候選。

- `PASS`：事實來源可回查；至少一支官方／第一方機構影片直接拍到題材本體；公開頁與 metadata 可取得；時長、解析度、音軌及構圖 preview 足以支持 60 秒成片的合理 preflight；故事 beat 能對應到可見物件／人物／流程。
- `FAIL`：只有通用素材、生成畫面、純文字卡、不相干品牌片；影片只存在於現行環境不可取得的平台且無官方替代頁；全部候選明確太短、無必要音軌、解析度不足或不直接展示題材。
- `UNKNOWN`：影片存在但 metadata／公開取得性讀不到、題材對應不確定，或 preview 無法判斷是否足以支撐片長。

**Hard fail**：沒有直接相關且可技術取得的官方影片候選，不得因故事很重要就改用 AI 畫面、通用 B-roll 或同業媒體片。

**例外規則**：

- `VS-ADJACENT-FIRST-PARTY`：素材發布者可以不是故事主體，但必須是該技術／產品的第一方廠商或機構，且畫面直接展示同一技術本體；只提到相同名詞不算。
- 發布權 `UNKNOWN` 不等於技術 fit FAIL：可建立內部測試 package，但 output 必須 `publication_hold: true`；對外發布前另行解決。已知禁止用途則依預定用途 FAIL。
- Gate 的 PASS 只是 preflight。下載成功、十個完整六秒窗口、中央裁切、音訊與 render QA 仍由 harness execution 實測。

**必填證據欄位**：

`fact_source_urls[]`、`official_footage_page`、`footage_publisher`、`platform`、`probe_status`、`duration_seconds`、`width`、`height`、`audio_status`、`public_obtainability`、`visual_mapping[]`、`execution_risks[]`、`rights_status`、`publication_hold`、`exception_code|null`。

## 6. Story Package contract

只有整體 `PASS` 可建立 Story Package；`FAIL` 或 `UNKNOWN` 的 `story_package_ref` 必須為 `null`。

Story Package 至少包含：

1. `package_id`、`package_version`、`gate_version`、`selected_at`。
2. `topic`、`one_sentence_angle`、`why_now`、`audience_payoff`、`story_type`。
3. `claim_ledger[]`：每條 claim 的原文、可用中文表述、來源 URL、來源時間、`confirmed|inferred|unknown`、是否第一方主張、必要歸因與禁止推論。
4. `footage_candidates[]`：官方頁、發布者、平台／識別碼、metadata、畫面對應、已知風險、rights 狀態。
5. `interest_basis`：只放事前 proxy 與限制，不放預測播放數。
6. `content_boundaries`：不可加入的市場、投資、成效或權利推論。
7. `open_unknowns[]`、`publication_hold`、`harness_handoff`（目標片長、受眾、必要來源註記；不預填最終鏡頭、字幕或 render 結果）。

Story Package 凍結的是**編輯意圖與事實邊界**，不是 production success。Harness 發現素材不足時回報 execution failure，不得在 package 內偷偷換題或降低 Gate。

## 7. Gate Evaluation 輸出 contract

每個 acquisition candidate 必須有一筆，不得只輸出贏家：

```yaml
gate_version: v0.1
evaluated_at: <ISO-8601 with timezone>
candidate_id: <stable id>
topic: <candidate topic>
audience: 一般科技觀眾
content_promise: 替沒時間且主要滑 Reels／短影音的人整理最新科技時事
source_acquisition_ref: <Acquisition Record id>
criteria:
  freshness: {status: PASS|FAIL|UNKNOWN, reason_code: <code>, evidence: {...}}
  why_now: {status: PASS|FAIL|UNKNOWN, reason_code: <code>, evidence: {...}}
  audience_payoff: {status: PASS|FAIL|UNKNOWN, reason_code: <code>, evidence: {...}}
  interest_signals: {status: PASS|FAIL|UNKNOWN, reason_code: <code>, evidence: {...}}
  visual_source_fit: {status: PASS|FAIL|UNKNOWN, reason_code: <code>, evidence: {...}}
overall_status: PASS|FAIL|UNKNOWN
hard_fail_reasons: []
unknowns: []
exception_codes: []
publication_hold: true|false
story_package_ref: <id|null>
next_action: PACKAGE|REJECT|RESOLVE_WITHIN_WINDOW|STOP_WINDOW_EXPIRED
```

每個 cycle 另輸出：

```yaml
cycle_id: <id>
evaluated_at: <ISO-8601 with timezone>
candidate_count: <n>
pass_count: <0..n>
fail_count: <0..n>
unknown_count: <0..n>
story_package_refs: []
stop_reason: PASS_PACKAGED|ZERO_PASS_NO_RELAXATION|UNKNOWNS_PENDING_WITHIN_168H
```

`pass_count: 0` 與 `story_package_refs: []` 是完整、可接受的輸出，不是 pipeline error。

## 8. 停止條件

1. Candidate freshness 明確超過 168 小時：停止該候選，整體 FAIL，不繼續為它找理由。
2. 任一項 FAIL：停止在 Editorial Selection；保留五項已知證據，不建立 Story Package、不進 harness。
3. 整體 UNKNOWN：只可在 freshness window 內補指定缺口；不得先製作再回頭補 gate。到 168 小時仍未解即停止。
4. 本 cycle 所有候選都 FAIL／UNKNOWN：輸出 `ZERO_PASS_NO_RELAXATION` 或 pending 狀態後停止；不擴窗、不降門檻、不硬選一題。
5. 整體 PASS：建立 Story Package 後停止 Editorial Gate；交給 harness execution，不能把後續成功預寫進 gate。

## 9. Failure examples

| 情境 | 結果 | 原因 |
|---|---|---|
| 官方產品發表距評估 168 小時 1 分鐘，即使今天突然爆紅 | Freshness FAIL | 超過 hard gate；熱度不重設事件時間 |
| 三個月前產品被今天的整理文重發，沒有新功能或新處置 | Freshness FAIL／Why now FAIL | 轉載時間不是新事件 |
| 事件在七天內，但內容只是「AI 很熱門」與既有規格回顧 | Why now FAIL | 沒有 before→new state |
| 財報營收、EPS、股價都創高，沒有產品、部署、產能或可用性變化 | Audience payoff FAIL | 只有公司／投資 payoff |
| 財報揭露新製程開始量產且將改變供應，但效應來源尚未回查 | Audience payoff UNKNOWN | 方向可能成立，證據鏈未閉合 |
| 新產品新聞稿寫「解析提升 50%」，未說比較基準、限制，也未標官方主張 | Audience payoff FAIL | 規格朗讀且證據邊界錯誤 |
| 編輯覺得會紅，加上十家同一新聞稿轉載 | Interest signals UNKNOWN | 沒有兩種獨立 proxy，也沒有 behavior proxy |
| 同題型歷史表現與搜尋需求兩項都低於事前 baseline | Interest signals FAIL | 兩種有效 proxy 一致負向 |
| 有官方 YouTube 影片，但現行環境無法取得，官網沒有替代素材 | Visual/source fit FAIL | 「存在」不等於可交給 harness 取得 |
| 畫面精美但只是通用晶圓 B-roll，故事講特定冷卻技術 | Visual/source fit FAIL | 畫面沒有直接展示題材本體 |
| 影片 metadata 缺時長與音軌，無法判斷能否撐 60 秒 | Visual/source fit UNKNOWN | 不得把可能可用寫成 PASS |
| 一整週沒有任何候選五項全 PASS | Cycle 合法零產出 | 輸出空 package 清單，不放寬 gate |

## 10. v0.1 非目標與變更規則

- 不在本規格內搜尋、排名或批准新來源；source acquisition 另行執行。
- 不定義剪點、字幕密度、版面、下載、render 或 QA；沿用既有 `SKILL.md`／`ASSUMPTIONS.md`／`VERIFY.md`。
- 不以單支成片成功證明來源穩定、觀眾興趣或發布權。
- v0.1 的 168 小時、五項名稱、狀態邏輯與零產出規則若要改，必須升版並留下 Decision Lock 變更理由；不得在單一 cycle 臨時覆寫。
