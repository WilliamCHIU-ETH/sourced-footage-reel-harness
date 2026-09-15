# GTA VI preproduction focused review

- artifact：`gta-preproduction-review`
- artifact version：`v0.2`
- 日期：`2026-08-30`
- reviewer：`w14-reviewer`
- candidate：`GE-GTA-VI-20260830-R1`
- 前版：`exploration/2026-08-30-gta-preproduction-review.md v0.1`
- 審查模式：唯讀；無 browser／network／run_dir／download／ffmpeg／render
- **decision：`REVIEW_PASS_FOR_FRESH_RUN`**
- finding count：`1 MEDIUM（non-blocking）／0 HIGH／0 BLOCKER`

結論：F-01～F-08 均已關閉；interest proxy 在明列限制下可支撐一次低成本、fixed-selection、internal GATE 2 fresh run。此核准不解除 `rights_status:UNKNOWN` 或 `publication_hold:true`，不授權公開／商用發布。

## 1. Finding

### F-09 — MEDIUM（non-blocking）— owner r02 的 `measured_at` prose 與 hashed summary 不一致

- **位置**：`exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md:97-99`；`exploration/2026-08-30-gta-gate-evidence-supplement.md:74-80`；`exploration/2026-08-30-gta-gate-and-story-package.md:106-113`；`exploration/evidence/gta-editorial-owner-v04-r02/measurement-summary.json:3-6`
- **Severity**：`MEDIUM`，本次 internal fresh run non-blocking。
- **證據**：三份 prose 把 owner raw `measured_at` 寫成 `2026-08-30T13:21:59.592Z`，並把 `13:24:13.666Z` 稱為 later integration；但 SHA-256 已驗為 `d6967a34e324a2bc62559d999577c79f2aedf3babd612b8497ff46282f55ff51` 的 r02 `measurement-summary.json` 明列 `measured_at=2026-08-30T13:24:13.666Z`。後者也合理晚於 PCGamesN `captured_at=2026-08-30T13:24:13.662Z`；前者早於第二筆 capture，不能代表完整 r02 measurement 完成時間。
- **Failure scenario**：後續 auditor 若採 prose，會誤以為 owner breadth 在第二筆 evidence capture 前已完成，並把一個沒有 frozen locator 的時間當 canonical provenance。
- **最小修正**：producer 下次升版時，把上述三處統一到 hashed r02 summary 的 `13:24:13.666Z`；若 `13:21:59.592Z` 其實是另一階段，需提供 immutable artifact／欄位名稱並明確區分，不可再稱完整 r02 raw `measured_at`。
- **本次不阻擋理由**：本 review 明定 hashed r02 summary 與兩筆 per-record `captured_at` 為 canonical precedence；此差異不改變 event window、qualifying timestamps、parent identity、SHA、Gate 算術、fixed selection 或 render plan。

## 2. Independent SHA／identity／arithmetic replay

### 2.1 SHA-256

獨立以本地 bytes 重算；兩個 evidence roots 的實際檔案集合也與 manifest 完全相同，沒有多檔或缺檔。結果為 `16/16 PASS`：兩份 locks＋十四份 raw／normalized／summary evidence 全部吻合。

| Artifact | Recomputed SHA-256 | Result |
|---|---|---|
| `gta-interest-proxy-v0.4-dom-html-premeasurement.md` | `ed15306ca5ddd45e75ee5c8b5b19acc5ba72e6315e01a052eac026cb48978001` | PASS |
| `gta-editorial-owner-v0.4-premeasurement.md` | `24d153d42c3796993ed3936235a0220d0871a6fe59b3183b9fe7e4bf2d3a20f2` | PASS |
| `1w0c7q5.json`／`.root.html` | `443f0d5d9b643fe2f811536acd4684afb40fe40dc9e2aeb954392025a70a6c0d`／`b3d6576255ffff53687f479efddd9be0bd0fa4ae630b5bd64b2e4cebef7c42f9` | PASS |
| `1tv49hl.json`／`.root.html` | `52da22ecbb2f79cbcfa6a465cdafba18abab0ce957f524e32da615ce7b8d878b`／`a0ad709c84576a3d8a5158b9b0aba1d915f82358fc2565c5ffcd1c2b76dd5658` | PASS |
| `1vz2o7p.json`／`.root.html` | `83faf78c90f230ed60510da521f6460ae4dbb55e2ca17822b27c1b6c8a78d19c`／`1cb260dd0dd21e5c318d789d7ef106bba90ff6466675ee9f518e30ad03f47005` | PASS |
| `1w0szr9.json`／`.root.html` | `537096c70d14ac507d167896070173878b1195cecbf014a35631dd4ca45c2ad8`／`7297247d82c1b5d8d8c8c1de99232218dbbc387bc5ed2809209d487c0aba02f7` | PASS |
| Reddit `measurement-summary.json` | `c2bee4e0662e62fd7f8029e199f48a3508ec3ab528b82019b31b4632a105d9cc` | PASS |
| `future.json`／owner snippet | `119459bc56b5dcc04a097250d5a43aea4c0d708335273054193074b06ce6b1d9`／`603fe8032d551bb9da7d5e7854d575757379a45f32088f9bb0218a5111a0908f` | PASS |
| `network-n.json`／owner snippet | `e0f5cdc552bdc80c3442c153cc547c187bfb881c2c874808f8b86ac0021cecfa`／`185ab6988d34c4c01c72361e1492cdbbaea0e74362a7108ebdc8168c41590aef` | PASS |
| Owner r02 `measurement-summary.json` | `d6967a34e324a2bc62559d999577c79f2aedf3babd612b8497ff46282f55ff51` | PASS |

### 2.2 Reddit JSON／raw identity 與計算

- Lock 在 `2026-08-30T12:51:45Z` 固定 metric、四個 IDs、順序、median 與 `1.5x`；早於第一筆 `observedAt=2026-08-30T12:53:23.099Z`（`gta-interest-proxy-v0.4-dom-html-premeasurement.md:5-48`）。
- 四個 normalized records 各為 `valid:true`、`rootsFound:1`；`wanted/id/domId/permalink/subreddit/title/commentCount` 均與唯一 raw `<shreddit-post>` attributes 相同；共同 `capturedAt=2026-08-30T12:53:44.940Z`。
- Independent values：candidate `1061`；comparators `[1001,371,233]`。
- `median([1001,371,233]) = 371`。
- threshold count：`371 × 1.5 = 556.5`。
- exact ratio：`1061 / 371 = 2.8598382749326148`；`1061 >= 556.5`，mechanical result `PASS`。
- Raw roots 雖仍帶 `score` attribute，v0.4 lock 明定只讀 `comment-count`；current Gate／brief／plan 沒有再依賴 legacy `3683/1468/2.5089x`。

### 2.3 Interest proxy reviewer decision：`ACCEPTED_UNDER_LIMITATIONS`

Convenience comparator selection bias 對本次**一次、低成本、internal GATE 2 preview**可接受，但只在以下邊界內：

1. 四筆是事前固定 convenience set，不是隨機或完整母體；post ages 不等，兩個較低 Fable records 明顯拉低 median。
2. Candidate 對最高 comparator 僅 `1061 vs 1001`；`2.8598x` 只可描述相對 frozen median，不能泛化成全面領先。
3. `r/Games` 不是台灣或 IG cohort；comment count 不等於 unique humans、正向情緒、觀看意圖、retention 或 completion。
4. 接受理由是 metric／IDs／threshold 先鎖、raw identity 可重播、另有 owner-breadth proxy，而且此次成本與用途受 publication hold 限制。
5. **禁止**把本裁決寫成「會紅」、預測播放量或 post-publish observed outcome；公開決策仍不能靠此 proxy。

### 2.4 Owner breadth semantics：`ACCEPTED`

- Owner lock 在 `2026-08-30T12:54:04Z` 固定 event window、兩頁、`publish/live timestamp` 語義與 distinct-owner threshold；早於兩頁 capture（`gta-editorial-owner-v0.4-premeasurement.md:5-40`）。
- PC Gamer initial article publish `2026-08-27T17:30:05Z` 早於 anchor `19:00Z`，**不合格且沒有被拿來通過**（`future.json:14`）。唯一 qualifying locator 是同一 event-specific live page 的 JSON-LD `BlogPosting.datePublished=2026-08-27T19:17:24.976Z`（`future.json:241-242`）。
- 此 semantics 可接受：Editorial Gate G4 明列「顯著版位／持續追蹤」，premeasurement 又事前接受 publish／live timestamp；event-specific live page 在 anchor 後新增 machine-readable BlogPosting 可算 in-window editorial tracking。不得改寫成「PC Gamer article 首次於 19:17 發布」；應始終稱為 live entry。
- PCGamesN 的 `article:published_time=2026-08-27T19:35:04Z`，visible time 與 JSON-LD 相同，明確落窗內（`network-n.json:14-27`）。
- Raw footer snippets 分別含 `Future Publishing Limited`（`future.owner-snippet.html:12-14`）與 `Network N Media Ltd`（`network-n.owner-snippet.html:14`）；兩個 legal parent names 與 frozen keys distinct。Owner breadth `2 >= 2`，PASS。

## 3. F-01～F-08 focused disposition

| Prior finding | Disposition | Independent evidence |
|---|---|---|
| **F-01 canonical verifier** | **RESOLVED** | `gta-production-plan.md:446-453,898-931,1224` 把唯一 final MP4 的 `bin/verify-render.sh` 定為 `REQUIRED`，保存 exact command、stdout/stderr、verifier/tee exits 與 before/after SHA；split QA 明列不能取代。`bin/verify-render.sh:19-33,36-77` 本身 executable；`/bin/bash -n` 對 script 與抽出的 8.1 block 均 exit `0`。 |
| **F-02 dips／audio fades／boundary QA** | **RESOLVED** | `gta-production-plan.md:580-645` 明列 section events `12/24/36/48`、±80ms visual dip、±100ms bus valleys；`6/18/30/42/54` 明列不加 transition／gain。lines `647-707` 有 exact automation assertion；`759-790,1024-1126` 對四個 section boundaries 與 T33 source montage 做 pre/post before-at-after、audio／實聽 QA。 |
| **F-03 fixed starts fail-fast** | **RESOLVED** | `gta-production-plan.md:533-578` 只 replay 十個 fixed starts；任何 mismatch 寫 `P3 fixed-selection deviation`、`starts unchanged` 並 exit `1`，禁止在 canonical run 換點。 |
| **F-04 G5 heading／state** | **RESOLVED** | `gta-gate-and-story-package.md:132-182` 的 heading、reason、active rows 都是 PASS；唯一實際 canonical Gate YAML block在 `:218-242`，五 criteria 與 overall 均 PASS、`open_gate_unknowns:[]`。Visual preflight historical primary state有明確 historical namespace，不是 current Gate。 |
| **F-05 replayable interest evidence** | **RESOLVED／ACCEPTED_UNDER_LIMITATIONS** | 兩 locks＋十四 evidence SHA 全 PASS；JSON／raw identity、算術與 owner distinctness可重播（本 review §2）。`gta-interest-proxy-v0.4-measurement.md:123-155` 明確 supersede v0.2／v0.3／legacy score，且不冒充 outcome。 |
| **F-06 `11/19` circular claim** | **RESOLVED** | Brief Caption 19 改為 `正式上市前還要等未剪輯實測`（`gta-editorial-brief.md:69-71`）；whitelist／formal caption 同步且明列沒有 release-date factual claim（`gta-gate-and-story-package.md:307,351`）。Current viewer copy 無 `11/19`。 |
| **F-07 Caption 10 active mapping** | **RESOLVED** | Caption 10 為 `水上與場館活動也入鏡`（`gta-editorial-brief.md:40,61`）；實看 `fallback-b02/S3-R1-strip.jpg` 為入水、水上載具、kayak、場館，與 `gta-visual-preflight.md:305-324` 的 `PASS_ACTIVE_ONLY` 一致，淘汰的健身 frame 不再支撐 production claim。 |
| **F-08 safety fields／GATE 2** | **RESOLVED** | `gta-production-plan.md:742-757,834-851` 要求 final-crop `visual-qa.md` 有 S1/S2/S4/S5 structured fields；`:1128-1154` post-render 再驗；`:1175-1190` GATE 2 必須逐項交 caution、paths、timestamps、result 並保留 hold。實看 active strips亦與犯罪／衝突／親密語境／槍械 cautions 相符。 |

## 4. Canonical Gate／rights／review semantics

1. 實際 canonical Gate YAML block（marker 後直接接 fenced YAML）恰一個：`gta-gate-and-story-package.md:218-242`。五項均 PASS、overall PASS、`open_gate_unknowns:[]`、formal package ref 非空；current G5 heading與 active state無 UNKNOWN 矛盾。
2. `reviewer_ready:true` 在 producer artifacts 只表示可送審；同區仍是 `reviewer_approval:PENDING_FOCUSED_RECHECK`、`fresh_run_authorized:false`（`:237-240`），沒有冒充核准。本 v0.2 的明確 decision 才是下節限定範圍的 reviewer approval。
3. `rights_status:UNKNOWN` 與 `publication_hold:true` 是 non-Gate release unknown；可做 internal preview，不可公開。Gate/story `:427-435` 與 production plan `:1192-1207` 把 release check 留到 GATE 2 後。
4. Producer exact self-check r04 已以原樣 code block重播：stdout `PASS v0.4 evidence, Gate sync, F01-F08 guards, and no GTA run`，exit `0`。其 assertions、16 SHA／identity／arithmetic另由 reviewer獨立重算，不以 r04 文字自證。
5. GTA root `/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi` 經 `-e` 與 symlink `-L` 雙重檢查均不存在；本審查沒有開啟或建立它。

## 5. Fresh-run authorization scope

`REVIEW_PASS_FOR_FRESH_RUN` 僅授權：

- 一個新的 timestamped child；不得重用舊 run。
- 唯一 stable footage ID `RSG-GTA6-EXTLOOK-RK721912-ENUS-1080P` 與 fixed starts：`[212.5,218.5,1455.0,1461.0,1042.0,1048.0,384.0,390.0,1394.0,1400.0]`。
- 單一官方素材、單一 composition、單一 final internal GATE 2 preview；P3 deviation 必須 fail-fast，不得換點。
- HyperFrames `0.8.3`、20 caption snapshots、transition pre/post QA、single-worker immutable render、唯一 final canonical verifier及完整 safety handoff。
- Run audit 必須引用／保存本 review artifact path作 focused reviewer approval；`reviewer_ready` 本身仍不能代替。
- 全程維持 `rights_status:UNKNOWN`、`publication_hold:true`。只可交使用者作內部 GATE 2；不得公開、商用、上傳或宣稱已取得授權。
- 任一 Gate identity、素材 URL／hash、fixed selection、claim、QA 或 hold boundary 偏離，本次授權立即失效並停止，不得擴張範圍。

## 6. Reviewer artifact self-check

- expected exact result：`PASS review-v0.2 structure, source locks, decision scope, and no GTA run`
- expected exit：`0`
- checks：artifact version／唯一 decision／finding count；F-01～F-08 各恰一個 RESOLVED disposition；F-09 四欄完整；16 個 source SHA 仍匹配；canonical criteria 五 PASS；verifier blocks通過 Bash 3.2 syntax parse；GTA root absent且不是 symlink；只有本 review 是新增 reviewer檔。
- self-check result：`EXIT_0`
