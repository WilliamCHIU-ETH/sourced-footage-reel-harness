# Roman interest proxy measurement

- artifact：`roman-interest-proxy-measurement`
- 版本：v0.1
- measured_at：`2026-08-31T02:53:35Z`
- gate：`editorial-gate v0.1 / G4`
- result：`UNKNOWN`
- lock：[`roman-interest-proxy-premeasurement v0.1`](./2026-08-31-roman-interest-proxy-premeasurement.md)，SHA-256 `8dc97b7754279c57de425d62f9ae44ffe323692aca683ae1e8d66dedf041c5f8`

## 結論

Roman 有很強的公開注意訊號：NASA 官方 launch replay 在本次 capture 時為 `1,015,203` views，且 AP 與 El País 兩個獨立 parent owners 都在 launch window 內建立可回查 coverage。但事前鎖定的 YouTube baseline 要求三支、168 小時內的同頻道 comparator，實際只有兩支合格；因此 audience-behavior proxy 必須是 `UNKNOWN`，G4 不得因數字看起來很大而改判 `PASS`。

## Lock integrity

| artifact | SHA-256 | 結果 |
|---|---|---|
| `2026-08-31-roman-interest-proxy-premeasurement.md` | `8dc97b7754279c57de425d62f9ae44ffe323692aca683ae1e8d66dedf041c5f8` | `PASS`；早於本輪新 interaction metadata capture |
| `evidence/roman-interest/youtube-selection-ledger.md` | `338237cc98db9a96d70edaa5f52100ca533c906e3f87f0976b34c987c89cd623` | 選 comparator 時未使用 views |
| `evidence/roman-interest/youtube-metadata-capture.json` | `3034cd91aad7864f065d7b48f50e92ee844386e8bbaf4c5edb2f79ade346a21d` | JSON valid；同批 4 records，command exit 0 |
| `evidence/roman-interest/editorial-owner-capture.json` | `6819c216d7db66bb49f51e366ccf3be5e17b3ecc6f3d381cb57dd11365a4c547` | JSON valid；2 included owners |

## Proxy A：NASA YouTube 公開觀看行為 — `UNKNOWN`

Canonical capture window：`2026-08-31T02:52:07Z–02:52:11Z`；`yt-dlp 2026.07.04 --no-download`；無 cookie、登入或媒體下載。

| 角色 | ID／題名 | upload timestamp | 與 target 間隔 | duration | views | Lock eligibility |
|---|---|---:|---:|---:|---:|---|
| target | [`9wq3VHsL_bE`](https://www.youtube.com/watch?v=9wq3VHsL_bE)／Roman launch | `2026-08-30T12:29:47Z` | — | 6,639 秒 | 1,015,203 | target confirmed |
| comparator 1 | [`tGjffGccQig`](https://www.youtube.com/watch?v=tGjffGccQig)／Artemis II ceremony | `2026-08-28T17:49:50Z` | 42.6658 h | 9,521 秒 | 155,626 | eligible |
| comparator 2 | [`I0j7as4MLHk`](https://www.youtube.com/watch?v=I0j7as4MLHk)／Spacewalk 98 | `2026-08-25T20:14:12Z` | 112.26 h | 31,695 秒 | 151,696 | eligible |
| comparator candidate 3 | [`yW-VAhqVJok`](https://www.youtube.com/watch?v=yW-VAhqVJok)／Spacewalk 97 | `2026-08-18T20:27:02Z` | 280.046 h | 32,259 秒 | 264,421 | **ineligible**；超過 168 h |

Target 前較近的兩筆 upload 是 Roman prelaunch／science news conferences，依 lock 的同事件去重規則排除。第三個非 Roman comparator 已超出 168 小時；更後面的 upload-order items 只會更舊。因此合格 comparator 為 `2/3`，事前 metric 不成立，不能用兩支 median、不能擴窗、也不能改採 view-rate。

`1,015,203` views 是正向 observation，但在這個 contract 下不是 `PASS`。它受官方頻道推薦、全球受眾、直播 replay 與上架時間差影響，不代表台灣 IG outcome。

## Proxy B：獨立 editorial-owner breadth — `PASS`

固定 window：`[2026-08-30T11:26:00Z, 2026-09-01T11:26:00Z)`；本次只量到 `2026-08-31T02:53:35Z` 前已發生部分。

| independence key | 可回查 coverage | 時間紀錄 | 為何計入 |
|---|---|---|---|
| Associated Press | [AP／Marcia Dunn](https://apnews.com/article/nasa-nancy-grace-roman-space-telescope-2a8e59d0b4e4884966a3b50a159ab8c9) | `2026-08-30T11:28:33Z`（公開搜尋 metadata） | AP-hosted、具作者名與原創 launch report；不是 NASA 稿鏡像 |
| PRISA / El País | [El País Ciencia／Patricia Fernández de Lis](https://elpais.com/ciencia/2026-08-30/lanzado-con-exito-el-telescopio-nancy-grace-roman-que-observara-cien-veces-mas-cielo-que-el-hubble.html) | 頁面顯示 `2026-08-30 13:27 CEST`，即 `11:27Z` | 具作者名、獨立解釋與明示給 El País 的訪談引語 |

Distinct included parent owners=`2`，達事前門檻 `>=2`。Nature、Space.com 另有原創 coverage，但公開頁未提供本輪可用的 exact publish time，未拿來湊數；Cadena SER 明示內容來自 EFE，也未當成 Cadena SER 原創 owner。

時間邊界：兩篇頁面後來包含 separation 等 launch 後更新內容，而其 displayed publish record 接近 liftoff；因此 timestamp 只證明該 owner 在固定 window 內建立／持續追蹤，不證明目前全文在該分鐘已全部存在。

## G4 整合

```yaml
signal_phase: pre_publish_proxy
proxy_records:
  - type: same_channel_public_view_behavior
    status: UNKNOWN
    value_or_observation: target_views=1015203; eligible_comparators=2/3
    baseline: median of three predeclared same-channel comparators
    window: comparators must be within 168h before target
    region: global/unknown
    source_url_or_internal_report: exploration/evidence/roman-interest/youtube-metadata-capture.json
    independence_key: youtube:nasa-main-channel:view-count
    limitation: official-channel global replay behavior; insufficient locked comparator count
  - type: independent_editorial_owner_breadth
    status: PASS
    value_or_observation: 2 distinct included parent owners
    baseline: at least 2
    window: 2026-08-30T11:26:00Z/2026-09-01T11:26:00Z
    region: global
    source_url_or_internal_report: exploration/evidence/roman-interest/editorial-owner-capture.json
    independence_key: parent editorial owner
    limitation: editorial attention is not audience outcome
behavior_proxy_count: 0
independent_proxy_count: 1
post_publish_outcome_ref: null
exception_code: null
interest_signals: UNKNOWN
reason_code: IS_BEHAVIOR_BASELINE_INCOMPLETE
```

## Decision impact

依 Gate v0.1，兩種 proxy 必須同時有效且正向，且至少一種是 audience-behavior／demand。Proxy A 因 predeclared sample 不足而無效，所以 `interest_signals=UNKNOWN`。不得建立 Story Package、不得把百萬 views 改寫成「一定會紅」，也不授權下載或 render。
