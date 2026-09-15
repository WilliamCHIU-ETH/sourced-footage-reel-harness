# YouTube selection ledger before comparator metric lookup

- selected_at：`2026-08-31T02:51:08Z`
- lock_ref：`exploration/2026-08-31-roman-interest-proxy-premeasurement.md`
- lock_sha256：`8dc97b7754279c57de425d62f9ae44ffe323692aca683ae1e8d66dedf041c5f8`
- inventory：NASA official channel `streams` tab，依公開 upload order；inventory lookup 未要求 `view_count`

## Target

- `9wq3VHsL_bE` — `Nancy Grace Roman Space Telescope Launch`
- NASA channel id：`UCLA_DiR1FfKNvjuUpBHmylQ`
- 符合 title、channel、duration 與 8/30 launch broadcast 規則；正式 timestamp 另由 direct metadata 驗證。

## Upload-order ledger

Target 前的公開順序如下，選取不使用 views：

1. `l5OJk1FuEKg` — Roman prelaunch news conference：排除，同一 Roman event。
2. `0cVnt1bUzLI` — Roman science overview news conference：排除，同一 Roman event。
3. `tGjffGccQig` — Artemis II Congressional Space Medal of Honor Ceremony：第一個 comparator candidate。
4. `I0j7as4MLHk` — U.S. Spacewalk 98：第二個 comparator candidate。
5. `yW-VAhqVJok` — U.S. Spacewalk 97：第三個 comparator candidate。

三個 comparator candidate 必須再以 direct metadata 驗證 upload time 位於 target 前 168 小時內、duration >= 60 秒、NASA channel identity 與公開 view_count；任一不符時依 premeasurement lock 的 chronological filtering 繼續檢查下一筆，不得按 views 替換。若完整 inventory 找不到三筆合格項目，Proxy A=`UNKNOWN`。
