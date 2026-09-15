# GTA VI production plan reviewer findings

- artifact：`gta-production-plan-review`
- artifact 版本：`v0.1`
- 日期：`2026-08-30`
- producer artifact：`exploration/2026-08-30-gta-production-plan.md v0.1`
- reviewer：`w14-reviewer`

## F-01 — 內部 preview 被商用 rights clearance 卡死

- Severity：`BLOCKER`
- 位置：production plan §§1、2.1、5/M1–M2、9/P7–P8
- 證據：plan 要求 `CONFIRMED_FOR_INTENDED_USE`、`publication_hold:false` 才能 init/render；但 Editorial Gate v0.1 G5 明許 rights `UNKNOWN`、`publication_hold:true` 的內部測試 package，`SKILL.md` 也明定 harness 預設對內測試。
- 失敗情境：五項 Gate 與技術 preflight 即使全 PASS，也永遠不能產生供 GATE 2 檢視的內部 preview，形成隱性第六 Gate。
- 最小修正：內部 render 保持 `rights_status: UNKNOWN`、`publication_hold:true`；商用公開權改為 GATE 2 後獨立 release check。只有已知禁止本次內部用途才阻擋。

## F-02 — 前置條件循環

- Severity：`HIGH`
- 位置：production plan §§6、7、9
- 證據：P1 init 前要求 M1–M6 全通過，但 M4b、M6 又依賴 P1 建立 project、P2 下載、P3 選鏡與文案。
- 失敗情境：P1 等 M6，M6 等 P1/P2/P3，fresh run 無法開始。
- 最小修正：P1 前只要求 M1、修正後的 internal-preview rights check、M3、M4a、M5；M4b/M6 排在 P3 後、P4 前。

## F-03 — QA 目錄與 loop fail-fast 缺口

- Severity：`HIGH`
- 位置：production plan §§7/P3、8.2–8.5
- 證據：先寫 `$RUN_DIR/qa/*`，但 `mkdir -p` 到 8.5 才出現；media loops 沒逐項 fail-fast／輸出數量 assertion。
- 失敗情境：metadata redirection 因目錄不存在失敗；或缺部分 strip/midpoint 時仍由最後一項成功掩蓋成 exit 0。
- 最小修正：8.2 前建立 `qa/`；所有 media loops 每項失敗即停，batch 後驗恰有五個非空輸出。

## F-04 — selection 未綁定實際 inputs／下載素材

- Severity：`HIGH`
- 位置：production plan §§2、4、5/M3–M4a、7/P2
- 證據：`selection.json` 未被 blocking check 讀取；inputs locator 未比對被預授權候選，local route 也未驗 hash。
- 失敗情境：可換成另一支檔案，只要標同 publisher/source page 就通過。
- 最小修正：selection 記 stable footage ID、route locator、預期 hash；下載前比對 selection、Story Package、inputs，下載後凍結實際 SHA-256。

## F-05 — claim 白名單與 headline mapping 不完整

- Severity：`HIGH`
- 位置：production plan §§2、3.2、5/M6
- 證據：M6 把所有 claim ID 當 valid，未排除 `unknown` 或限制 allowed wording/attribution；fact-map 只覆蓋 20 段字幕，沒覆蓋三行 headline。
- 失敗情境：unknown claim 或無來源大標仍可通過。
- 最小修正：production claim 白名單排除 unknown，強制 attribution/allowed wording；fact-map 同時覆蓋 headline 與 captions，render 前保留逐項事實審查。

## F-06 — `≤5 items` 定義不一致

- Severity：`MEDIUM`
- 位置：production plan §6 與 M4b/M6
- 證據：plan 宣稱任何 local batch 最多五項，但輕量 JSON checks 一次掃 20 captions/10 shots。
- 失敗情境：規則自相矛盾，造成違規或不必要拆分。
- 最小修正：明定上限只適用資源型 media operations；JSON/文字驗證不算 local media batch。

## F-07 — snapshot retry 可能覆寫失敗證據

- Severity：`MEDIUM`
- 位置：production plan §§4、7/P7
- 證據：固定使用 `caption-r01-*`，卻又要求修正後重跑且保留舊 snapshot。
- 失敗情境：重跑覆寫 r01 或因目錄已存在失敗，修復鏈不可稽核。
- 最小修正：每輪用 r01/r02/r03 新目錄；`visual-qa.md` 指出 active passing round，P7 只驗該輪。

## F-08 — GATE 2 未揭露 source/output fps 差異

- Severity：`MEDIUM`
- 位置：production plan §§2、5、8、9
- 證據：preflight 沒保存 source frame rate，post-render 只驗成片；`ASSUMPTIONS.md` 要求重取樣列為 GATE 2 已知落差。
- 失敗情境：使用者無法知情驗收 cadence。
- 最小修正：PROVENANCE/GATE 2 保存 `r_frame_rate`、`avg_frame_rate` 與 source→30fps 差異；相同也明示無差異。

## Reviewer disposition

`CHANGES_REQUIRED`：先修 F-01 BLOCKER 與 F-02–F-05 HIGH，並把 F-06–F-08 納入同次最小修正；不得以 agent 狀態代替重新檢查 artifact。
