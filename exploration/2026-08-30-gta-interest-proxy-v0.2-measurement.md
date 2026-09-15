# GTA VI interest proxy v0.2 measurement

- artifact：`gta-interest-proxy-v0.2-measurement`
- artifact 版本：`v0.1`
- candidate：`GE-GTA-VI-20260830-R1`
- captured at：`2026-08-30T12:46:51Z`（四筆 Reddit 計畫共用的 frozen timestamp）
- premeasurement lock：`exploration/2026-08-30-gta-interest-proxy-v0.2-premeasurement.md v0.1`
- locked SHA-256 expected／actual：`e683c431966cf9018d687b093af3956d83dadd3da2628367c432c3ec2f3db34b`／同值，`PASS`
- measurement status：`BATCH_A_FAILED_STOPPED`
- interest result：`UNKNOWN`

## 1. Measurement boundary

本輪在任何新 metric 讀取前先驗證 premeasurement lock；hash 相符後才建立全新 `exploration/evidence/gta-interest-v02/`。請求固定為 `OMP_THREAD_LIMIT=1 nice -n 19 curl --disable -fL`、public User-Agent、無 auth、無 request cookie、無 retry、sequential。

Batch A item A01 的 Reddit public JSON endpoint 回 HTTP `403`；curl 因 `-fL` 回 exit `56`，保存 raw response headers，但沒有可保存的 raw JSON body。依 lock 的 stop condition，A02～A04 與 Batch B 均未執行；沒有改 User-Agent、endpoint、來源或重試。server response 中的 `Set-Cookie` 是 immutable raw header，不是 request cookie。

舊 score `3683／1639／1468／751` 沒有 frozen raw record，也沒有 measurement 前的 threshold 證據；本 artifact 不回溯把它寫成 predeclared，亦不拿它補 `num_comments` 缺值。

## 2. Fetch ledger

### Batch A — planned 4 public JSON fetches

| Item | Role／post ID | Endpoint | Curl exit | HTTP | Headers | Raw body | Identity／parse |
|---|---|---|---:|---:|---|---|---|
| `A01` | candidate／`1w0c7q5` | `https://www.reddit.com/comments/1w0c7q5.json?raw_json=1` | `56` | `403` | `batch-a/A01-1w0c7q5.headers.txt` | absent after `-fL` HTTP error | `NOT_VALIDATED` |
| `A02` | comparator／`1tv49hl` | `https://www.reddit.com/comments/1tv49hl.json?raw_json=1` | `NOT_RUN` | — | — | — | `NOT_VALIDATED` |
| `A03` | comparator／`1vz2o7p` | `https://www.reddit.com/comments/1vz2o7p.json?raw_json=1` | `NOT_RUN` | — | — | — | `NOT_VALIDATED` |
| `A04` | comparator／`1w0szr9` | `https://www.reddit.com/comments/1w0szr9.json?raw_json=1` | `NOT_RUN` | — | — | — | `NOT_VALIDATED` |

A01 失敗後立即停止，因此 Batch A 不完整。沒有任何 `.[0].data.children[0].data` record 可用來驗 post id、`subreddit=Games`、title、permalink、created_utc 或 num_comments。

### Batch B — planned 2 public HTML fetches

| Item | Outlet／expected owner | URL | Exit | Disposition |
|---|---|---|---|---|
| `B01` | PC Gamer／Future | `https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/` | `NOT_RUN` | `STOP_AFTER_A01` |
| `B02` | PCGamesN／Network N | `https://www.pcgamesn.com/grand-theft-auto-iv/new-extended-look` | `NOT_RUN` | `STOP_AFTER_A01` |

因此沒有本輪 raw HTML、published-time locator 或 parent-owner locator；ownership independence 不可驗證。

## 3. Frozen evidence與 hashes

Evidence root：`exploration/evidence/gta-interest-v02/`。

| Evidence | Bytes | SHA-256 | Meaning |
|---|---:|---|---|
| `batch-a/A01-1w0c7q5.headers.txt` | `1197` | `518e6888a0e558ed277d4259665837d0cea4b9e8278dde5f35ac43a1202b4dc5` | raw HTTP 403 headers |
| `fetch-commands.log` | `450` | `d05e9be8aff839238cce611f48618a4ca548fd3b39759c149df51bc99d6013eb` | exact single curl command |
| `fetch-exits.tsv` | `201` | `76930af0b3417f331a72b7b81a53b1b88005fb56a324a06f78a47d730705eb7c` | A01 exit＋all unrun states |
| `normalized-reddit-comments.tsv` | `758` | `f589596073ec387e0e588de869c945ff3cdfbc04081f4caba3e0ef54ca1477c7` | four-row null／failure ledger; not successful post records |
| `normalized-editorial-breadth.tsv` | `559` | `ae7692559c5f7cfca7691617d76d8d9088576d77dabdcb2c4ae7618b76967e83` | two-row NOT_RUN owner ledger |
| `measurement-status.yaml` | `982` | `4351f4a5c22d4011be13933957fad2b9f368f3416608a1f1a05932466630cd37` | canonical stop-state contract |
| `evidence-sha256.tsv` | — | `24c4ef9674f746328e756ec27266493fe40d17aee97ed66e0139f5386fb7d992` | manifest of evidence files existing before the manifest |

Raw body path `batch-a/A01-1w0c7q5.body.json` intentionally does not exist；`-fL` 沒有交付成功 body，不能建立空檔冒充 raw JSON。

## 4. Canonical proxy records

```yaml
proxy_records:
  - proxy_id: reddit-comments-v0.2
    type: audience_behavior_discussion_volume
    metric: num_comments
    value: null
    baseline:
      statistic: median(comparator_num_comments)
      comparator_post_ids: [1tv49hl, 1vz2o7p, 1w0szr9]
      comparator_values: [null, null, null]
      value: null
      pass_threshold: candidate_num_comments >= 1.5 * comparator_median
    window:
      start: null
      end: 2026-08-30T12:46:51Z
      start_semantics: per-post created_utc; unavailable because no identity record parsed
    region: global Reddit r/Games; not Taiwan-specific
    source:
      endpoint_template: https://www.reddit.com/comments/<post_id>.json?raw_json=1
      evidence_root: exploration/evidence/gta-interest-v02/
      successful_raw_records: 0
    independence_key: reddit-r-games-comment-count
    limitation: fixed convenience set, selection bias, differing post ages, n=3 comparators; endpoint also returned HTTP 403 in this measurement
    status: UNKNOWN
    reason_code: IS_V02_BATCH_A_HTTP_403

  - proxy_id: editorial-owner-breadth-v0.2
    type: independent_editorial_breadth
    metric: independent_parent_owners
    value: null
    baseline:
      statistic: count(distinct verified parent_owner)
      value: null
      pass_threshold: 2
    window:
      start: 2026-08-27T19:00:00Z
      end: 2026-08-29T19:00:00Z
    region: global English-language gaming press
    source:
      planned_urls:
        - https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/
        - https://www.pcgamesn.com/grand-theft-auto-iv/new-extended-look
      evidence_root: exploration/evidence/gta-interest-v02/
      successful_raw_records: 0
    independence_key: [future, network-n]
    limitation: editorial attention is not audience outcome; Batch B was not run after Batch A failed
    status: UNKNOWN
    reason_code: IS_V02_BATCH_B_NOT_RUN
```

## 5. Replayable calculation disposition

```text
candidate num_comments = null
comparator num_comments = [null, null, null]
comparator median = null
candidate / comparator median = null
required ratio = 1.5x
ratio test = NOT_EVALUABLE

verified independent parent owners = null
required owners = 2
owner test = NOT_EVALUABLE

reddit-comments-v0.2 = UNKNOWN
editorial-owner-breadth-v0.2 = UNKNOWN
interest_signals = UNKNOWN
```

這不是 `FAIL`：premeasurement lock 沒有定義低於門檻的 FAIL threshold，且數值根本不可得；按 `unknown_if` contract 必須是 `UNKNOWN`。convenience-set selection bias 仍透明保留，但本輪甚至未到 reviewer 是否接受 bias 的判斷階段。

## 6. Gate handoff

```yaml
interest_signals:
  status: UNKNOWN
  reason_code: IS_V02_BATCH_A_HTTP_403
  canonical_measurement_ref: exploration/2026-08-30-gta-interest-proxy-v0.2-measurement.md
  superseded_score_proxy_ref: gta-gate-evidence-supplement v0.1
  old_score_proxy_relied_upon: false
overall_status: UNKNOWN
open_gate_unknowns: [interest_signals]
story_package_ref: null
publication_hold: true
reviewer_ready: false
next_action: FOCUSED_REVIEW_OF_UNKNOWN_GATE_STATE
```
