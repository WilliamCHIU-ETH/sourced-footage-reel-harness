# GTA VI editorial-owner breadth v0.4 premeasurement lock

- artifact：`gta-editorial-owner-v0.4-premeasurement`
- artifact 版本：`v0.1`
- locked at：`2026-08-30T20:54:04+08:00`（`2026-08-30T12:54:04Z`）
- measurement status：`NOT_RUN`
- behavior proxy dependency：`reddit-dom-comments-v0.4` raw capture complete；integration/reviewer 尚未判定

## Fixed contract

```yaml
proxy_id: editorial-owner-breadth-v0.4
type: independent_editorial_breadth
event_anchor: 2026-08-27T19:00:00Z
window_end: 2026-08-29T19:00:00Z
region: global English-language gaming press
pass_threshold: independent parent owners >= 2
records:
  - outlet: PC Gamer
    url: https://www.pcgamer.com/news/live/grand-theft-auto-6-reveal-live-coverage-breaking-down-the-netflix-extended-look-event/
    expected_parent_key: future
  - outlet: PCGamesN
    url: https://www.pcgamesn.com/grand-theft-auto-iv/new-extended-look
    expected_parent_key: network-n
required_per_record:
  - requested/resolved URL
  - article title
  - machine-readable or visible publish/live timestamp within window
  - raw HTML snippet locating parent owner
  - extraction paths
  - captured_at
  - normalized JSON and raw snippet SHA-256
unknown_if:
  - either page or article identity cannot be verified
  - publish time cannot be placed inside the fixed 48h window
  - parent owner locator is absent or ambiguous
  - both records resolve to the same parent key
```

只接受 page DOM／metadata 的 raw locator；CDN host、品牌名稱相似或 reviewer 直覺不算 ownership evidence。不得新增第三家補失敗。

本 proxy 只證明 independent editorial attention，不是 audience outcome；必須與 v0.4 Reddit behavior proxy 同時成立，才可重新評估 `interest_signals`。
