# GTA VI preproduction reviewer audit

- artifact：`gta-preproduction-review`
- artifact 版本：`v0.1`
- 日期：`2026-08-30`
- reviewer：`w14-reviewer`
- candidate：`GE-GTA-VI-20260830-R1`
- scope：preproduction artifacts 與既有八張 visual-preflight strips 的唯讀稽核
- execution state：`NOT_RUN`；本審查沒有建立／開啟 run_dir，沒有下載、ffmpeg、init、snapshot 或 render
- **decision：`REVIEW_HOLD`**
- finding count：`1 BLOCKER / 5 HIGH / 2 MEDIUM / 0 LOW`
- fresh run：`MUST_NOT_START`

結論：目前不能解除 `REVIEWER_HOLD`；canonical fresh run 必須等 F-01～F-06 關閉並完成聚焦複審後才可開始。

## 1. Findings

### F-01 — BLOCKER — Canonical verifier 被明確排除，違反 repo 的 render-after contract

- **位置**：`VERIFY.md:25-31`；`bin/verify-render.sh:8,19-33,63-77`；`exploration/2026-08-30-gta-production-plan.md:432-437,624-633,754-765`
- **證據**：`VERIFY.md` 把 `bin/verify-render.sh` 列為 render 後必跑命令；script 只接收一個 `FILE`，並對同一支成片依序完成 metadata、整體音量與十個聲音窗口檢查。production plan 卻把 invocation 標為 `NOT_SCHEDULED`，理由是 script 內有十個窗口。
- **Reviewer 裁決**：對唯一 final `preview.mp4` 執行一次 canonical script，合理且應計為 **一個外部 media operation／一個 media item**；script 內對同一檔案的 sequential subchecks 不是十個外部素材項目，也不是以 loop 掩蓋十支不同 media。兩批各五段的補充 QA 可以保留，但不能取代 canonical invocation。
- **失敗情境**：fresh run 可 render、split QA 也可 PASS，卻沒有 repo 規定的 canonical stdout、exact command 與 exit code；GATE 2 package 因而無法證明實際通過 harness verifier，且與 supervisor 的明確要求相反。
- **最小修正**：把 8.1 與狀態表改為 post-render `REQUIRED / NOT_RUN`；在唯一 final MP4 上實際執行一次 lines 629-630 的完整參數命令，保留 exact command、stdout/stderr 與 exit code（至少 `commands.log`、`logs/verify-render-canonical.log`、`exit-status.tsv`），exit 非 `0` 即停止，不交 GATE 2。若曾失敗後重 render，每次嘗試必須 immutable，最後須有 final artifact 對應的一筆 exit `0`。不得只列 reference 或要求 reviewer 接受「等價」宣告。

### F-02 — HIGH — brief 要求的換段 dip／audio fades 沒有進 composition 或可驗證 QA contract

- **位置**：`exploration/2026-08-30-gta-editorial-brief.md:44,97`；`exploration/2026-08-30-gta-production-plan.md:549-562,574-591,663-712`；`exploration/2026-08-30-gta-visual-preflight.md:298-317`；image `exploration/evidence/gta-visual-preflight/fallback-b02/S3-R1-strip.jpg`
- **證據**：brief 明定只在 output `12/24/36/48s` 做極短色彩 dip 與音訊淡出入，且把黑幀、音訊斷點或停頓列為停止條件；P4 只驗 video/audio/caption 數量，沒有 transition／gain envelope 的實作契約。P6 全是字幕中點，8.4 只證明離邊界的窗口非靜音，8.5 也只抽五張代表幀。實看 S3-R1 strip 可見水上畫面在 source 約 `00:17:31` 切到場館門面；文件承認它是 montage，但沒有針對該 source-authored cut 的動態／聲音驗收。
- **失敗情境**：section boundary 仍可能有黑幀、頓格、pop 或可感知音訊斷點；S3 約 output `33s` 的原片 montage cut 也可能在中央 crop／字幕／音訊下顯得突兀，而現有 midpoint 與「非靜音」檢查仍全部 PASS。
- **最小修正**：在 P4 明定 seek-safe、deterministic 的四個 visual dip 與 audio fade envelope（不在相鄰 pair 的 `6/18/30/42/54s` 任意加斷點）；在 render 前／後新增四個 section boundary 與 S3 約 `33s` 的 before/at/after 視聽檢查及結果欄。S3 原片 cut 可在實看／實聽後保留，但必須有明確 PASS 證據，不能由 strip 或 non-silence 推定。

### F-03 — HIGH — P3 允許換起點，直接破壞 fixed active selection 與 input binding

- **位置**：`exploration/2026-08-30-gta-production-plan.md:153-175,535-547`
- **證據**：lines 169-175 固定十個 `media_start`，並明定 fresh run 不得重新挑點；但 line 547 又要求 strip 有轉場／偏軸時「需換起點並重抽」。
- **失敗情境**：executor 可在 fresh run 內靜默換成未經 visual preflight、Story Package、selection 與 reviewer 核准的窗口；後續 hash／inputs 雖一致，卻不再是預授權的 canonical selection。
- **最小修正**：line 547 的 failure action 改為 fail-fast、保留 strip、停止該 run 並回報 deviation；任何新起點都必須先更新 visual preflight、claim mapping、selection／inputs binding 並取得新的明確核准，不得在 canonical run 內自行重選。

### F-04 — HIGH — Formal Gate artifact 對 G5 同時寫 UNKNOWN 與 PASS

- **位置**：`exploration/2026-08-30-gta-gate-and-story-package.md:92,127,182-188,388`
- **證據**：Audience Payoff 仍寫 `GTA-V05`～`GTA-V08`「仍須 visual preflight」；G5 subsection 標題仍是 `Visual/source fit — UNKNOWN`。同一檔案的 canonical Gate block 與結尾卻寫 `visual_source_fit: PASS`、`overall_status: PASS`、五項全 PASS。
- **失敗情境**：M1 可能從不同段落凍結出不同 Gate 狀態。若 G5 是 UNKNOWN，依 Gate contract 不能建立 Story Package；若 E11 已使它 PASS，現有 UNKNOWN／pending 文字就是會污染 machine handoff 的 stale state。
- **最小修正**：建立單一 canonical 狀態：若採 E11，將 line 92 與 line 127 明確更新為 visual preflight complete／`PASS`，並讓 reason code、evidence ref、overall block 一致；否則把 overall 降為 UNKNOWN 並維持 hold。修正後需重新做文字一致性 assertion，不能只在未來 JSON 選擇性抄 PASS。

### F-05 — HIGH — Interest PASS 的算術可重算，但「事前」與來源輸入不可獨立重播

- **位置**：`exploration/2026-08-30-editorial-gate-v0.1.md:137-163`；`exploration/2026-08-30-gta-gate-evidence-supplement.md:38-60,64-83`；`exploration/2026-08-30-gta-gate-and-story-package.md:103-123`
- **證據**：`3683 / 1468 = 2.5089x` 與 `2 >= 2` 的算術正確；但「同一快照」沒有 frozen JSON／HTML／screenshot artifact，`exploration/evidence/` 目前只有八張 visual strips。score 被文件自己標示為會變動；comparable-set inclusion 與 `1.5x` threshold 首次出現在同一份已含觀測值的 supplement，沒有可定位的 pre-observation declaration／完整候選清單；Future 與 Network N 的 ownership independence 也只有表內斷言，沒有 ownership evidence locator。
- **失敗情境**：日後 URL 顯示不同 score，無法驗證當時四筆輸入；也無法排除看過 candidate 後才選三個 comparator／門檻。若 outlet ownership 判錯，第二種 proxy 的 independence 亦不成立。這會把 Gate 規格明定應為 UNKNOWN 的「baseline 未事前定義／數值拿不到」誤升為 PASS。
- **最小修正**：凍結每筆 score 的 raw record（URL、post id、score、captured_at、hash），凍結 query／完整 inclusion-exclusion ledger，提供能證明 threshold 早於 measurement 的 artifact，並為兩個 parent owner 提供可回查 locator。若沒有真正的 pre-observation baseline 證據，不得事後補寫成 predeclared；應把 `interest_signals` 與 overall 降為 UNKNOWN、`story_package_ref:null`。

### F-06 — HIGH — Viewer-facing `11/19` 被標 confirmed，但 claim-specific evidence 是循環引用

- **位置**：`exploration/2026-08-30-gta-gate-and-story-package.md:20-32,254,298,307`；`exploration/2026-08-30-gta-editorial-brief.md:70,81`
- **證據**：`GTA-V12` 把 `11/19上市前` 標為 confirmed／production allowed，唯一 evidence 是 `E10`；但 E10 就是承載同一句文案的 editorial brief，不是 release-date fact source。E01 的列明支持範圍也沒有 release date。全組本地 artifact 沒有另一筆 `11/19` 來源 mapping。
- **失敗情境**：Caption 19 與 IG copy 可把未驗證、過期或年份不明的日期帶入 final preview；M6 只看到 whitelist 的 `confirmed` 而無法阻止 circular sourcing。
- **最小修正**：將 `GTA-V12` 綁到第一方 release-date URL、精確 source passage／date、checked_at 與必要 attribution，再保留 `confirmed`；否則刪除日期或改成不含日期的「上市前仍要等未剪輯實測」，並同步更新 brief、claim whitelist、caption density 與 IG copy。

### F-07 — MEDIUM — Caption 10 的「健身」不在 fixed active selected set

- **位置**：`exploration/2026-08-30-gta-editorial-brief.md:40,61`；`exploration/2026-08-30-gta-visual-preflight.md:298-317,340-352`；`exploration/2026-08-30-gta-production-plan.md:161-175`；images `exploration/evidence/gta-visual-preflight/primary-b01/S3-strip.jpg`、`exploration/evidence/gta-visual-preflight/fallback-b02/S3-R1-strip.jpg`
- **證據**：實看 primary S3 的 0 秒格才有健身器材／button UI，該窗口已排除；active S3-R1 四格只有入水、水上摩托車、kayak 與場館門面。visual preflight line 314 也明說「健身」只由 excluded primary frame 作 audit context，final active range 沒有該畫面。
- **失敗情境**：成片顯示 Caption 10「健身與水上活動也入鏡」時，觀眾只能看到水上／場館活動；畫面與 viewer copy 只有部分閉合。
- **最小修正**：優先把 Caption 10 改為只描述 active 畫面，並重算 20 段共 4–5 字／秒與更新 claim ledger；若一定保留健身，只能另找無 UI 的健身窗口並完整重走 visual preflight／selection approval，不能回用已淘汰的 primary 起點。

### F-08 — MEDIUM — 已辨識的內容安全 cautions 沒有被帶進 canonical run QA／GATE 2 handoff

- **位置**：`exploration/2026-08-30-gta-visual-preflight.md:100-115,188-199,285-296,325-338`；`exploration/2026-08-30-gta-production-plan.md:86-98,574-591,698-712`；images `exploration/evidence/gta-visual-preflight/primary-b01/S1-strip.jpg`、`exploration/evidence/gta-visual-preflight/fallback-b02/S2-R1-strip.jpg`、`exploration/evidence/gta-visual-preflight/fallback-b02/S4-R1-strip.jpg`、`exploration/evidence/gta-visual-preflight/primary-b01/S5-strip.jpg`
- **證據**：八張圖實看與 preflight 一致：S1 有犯罪／疑似物質處理，S2-R1 有非血腥近身衝突，S4-R1 有臥室／親密關係語境，S5 有明確槍械。plan 只在 `execution_risks` 留一個不透明的 `non_graphic_content_cautions` token；P6 每張必填欄位與 8.5 post-render QA 都沒有 content-safety／platform-caution 欄。
- **失敗情境**：中央 crop 或字幕語境改變後，run artifact 仍可把 visual QA 寫成 PASS，而 GATE 2 使用者沒有逐 section 的 caution 摘要；若後續有人誤把 internal preview 接到 publish flow，風險更高。
- **最小修正**：在 `visual-qa.md` 與 `qa/post-render-qa.md` 每個 relevant section 增加 `content_safety`、實看 timestamp、結果與 caution；GATE 2 handoff 明列 S1/S2/S4/S5，並保留 publication hold。這些 caution 目前不必自動改成 FAIL，但不可只藏在 preproduction token。

## 2. 已通過的獨立核對

1. **Freshness 算術**：`2026-08-27T19:00:00Z → 2026-08-30T11:32:00Z = 64h32m = 64.5333h`，確實在 rolling `168h` 內；first-public anchor 的 `inferred` 邊界也有揭露（`gta-gate-evidence-supplement.md:14-32`）。
2. **固定 ranges／十鏡**：五個 12 秒 range 各拆成相鄰兩個 6 秒；十個 starts 的 pair 差均為 `6.0s`，總 timeline `60s`。S2 任務分工有官方 VTT「聲東擊西／我要上樓」加 active walk-to-stairs 畫面支持，且沒有猜角色 identity。
3. **文案機械量**：固定三行 headline；20 段字幕編號完整，每段 3 秒；去空白共 `250` 字元，`250/60 = 4.1667` 字／秒。文案明示是編輯摘要，不是英文 VTT 逐句翻譯。
4. **八張 strips 已逐張實看**：primary-b01 的 S1～S5 與 fallback-b02 的 S2-R1／S3-R1／S4-R1 均已檢視。active set 的中央 crop、主要 UI 避讓與非血腥 caution 大致符合 preflight 記錄；這些 strips 只算 preflight，不被當成 final visual QA。
5. **Footage／provenance／input binding 方向**：stable footage ID、official page、direct URL、expected bytes、未來 full-file hash、selection→Story Package→inputs 的一致性與 fixed starts 都有 hard-stop 設計；full SHA 仍正確保留為 fresh-run 後才能取得的 pending evidence。
6. **Rights 邊界**：`rights_status: UNKNOWN`、`publication_hold:true` 不阻擋 internal GATE 2 preview；對外 release 另要求 intended-use rights confirmed 與 hold false。plan 沒有增設第六個 editorial Gate，也沒有把 internal preview 冒充公開授權。
7. **主要執行護欄**：HyperFrames 釘 `0.8.3`；20 caption snapshots 分四批各五並使用 immutable `rNN`；render 明列 `--workers 1`；loops 多數有 `set -euo pipefail`／逐項 `|| exit 1`／cardinality assertions；只允許寫 fresh run child，沒有要求修改 harness code。
8. **GATE 2 邊界**：machine QA 不冒充人類驗收；output nominal `30fps/1800 frames` 與 source `30/1` 的揭露已排入 handoff，若 full probe 顯示 VFR 亦要求覆寫披露。

## 3. 八張 image review ledger

| Image | Reviewer observation | Disposition |
|---|---|---|
| `primary-b01/S1-strip.jpg` | 昏暗犯罪／疑似物質處理場景、刺青人物、手機 UI；中央主體可讀 | active PASS，保留 safety caution |
| `primary-b01/S2-strip.jpg` | 車內多人與近身動作；單靠四格不能唯一證明指定兩主角分工 | rejected primary；與 preflight 一致 |
| `primary-b01/S3-strip.jpg` | 健身器材 bottom prompts，之後切入水上 montage | rejected primary；Caption 10 audit context only |
| `primary-b01/S4-strip.jpg` | 街景／車流／直播 beach UI，來源 UI 密度高 | rejected primary；與 preflight 一致 |
| `primary-b01/S5-strip.jpg` | 武裝進入、藍光室內與持槍輪廓；未見血腥 | active PASS_WITH_CONTENT_CAUTION |
| `fallback-b02/S2-R1-strip.jpg` | 走廊→樓梯→非血腥近身衝突，主體／路徑中央 | active PASS_WITH_CONTENT_CAUTION |
| `fallback-b02/S3-R1-strip.jpg` | 入水→水上載具→kayak→場館門面；約 9 秒有原片 montage cut／signage | active PASS_WITH_AUDIT_CONTEXT；須補 transition QA |
| `fallback-b02/S4-R1-strip.jpg` | 臥室日常互動、人物有衣著、無 HUD／燒錄字幕 | active PASS_WITH_CONTENT_CAUTION |

## 4. 解除 hold 的最小證據

1. F-01 的 canonical verifier 必須改為 scheduled；actual command／log／exit proof 在 fresh run render 後產生，不可先冒充 executed。
2. F-02～F-06 必須先修正 preproduction source artifacts，並只針對這六項做 reviewer re-check。
3. F-07～F-08 可與上述修正一起關閉；若保留為已接受風險，fresh-run handoff 必須逐項寫明且不得削弱 claim／safety boundary。
4. 在 reviewer 明確寫出 `REVIEW_PASS_FOR_FRESH_RUN` 前，不得建立 canonical run_dir 或開始 init／下載／ffmpeg／snapshot／render。

