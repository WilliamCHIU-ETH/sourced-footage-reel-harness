# GTA VI interest proxy v0.4 measurement

- artifact：`gta-interest-proxy-v0.4-measurement`
- artifact 版本：`v0.1`
- 日期：`2026-08-30`
- candidate：`GE-GTA-VI-20260830-R1`
- behavior proxy：`PASS_UNDER_FROZEN_CONTRACT`
- editorial-owner breadth：`PASS_UNDER_FROZEN_CONTRACT`
- integrated `interest_signals`：`PASS`
- measurement mode：只整合既有 frozen evidence；本 artifact 沒有發出 request、開 browser 或補抓第三方資料

## 1. Lock 與判定範圍

兩個規則 artifact 都先於其對應 evidence observation 存在，且整合前 SHA-256 與呼叫方鎖值相同：

| Contract | Locked at | Required／verified SHA-256 | Result |
|---|---|---|---|
| `exploration/2026-08-30-gta-interest-proxy-v0.4-dom-html-premeasurement.md v0.1` | `2026-08-30T12:51:45Z` | `ed15306ca5ddd45e75ee5c8b5b19acc5ba72e6315e01a052eac026cb48978001` | `PASS` |
| `exploration/2026-08-30-gta-editorial-owner-v0.4-premeasurement.md v0.1` | `2026-08-30T12:54:04Z` | `24d153d42c3796993ed3936235a0220d0871a6fe59b3183b9fe7e4bf2d3a20f2` | `PASS` |

規則套用不使用 legacy Reddit score；behavior 只讀四個 fixed `shreddit-post@comment-count`。Owner breadth 只讀 locked PC Gamer／PCGamesN 兩頁，不新增第三家。兩者都是出片前 proxy，不是發布後 outcome。

## 2. Frozen raw evidence manifest

### 2.1 Reddit behavior evidence

Evidence root：`exploration/evidence/gta-interest-v04-dom-html/`

| Record | Raw／normalized path | SHA-256 |
|---|---|---|
| candidate normalized | `exploration/evidence/gta-interest-v04-dom-html/1w0c7q5.json` | `443f0d5d9b643fe2f811536acd4684afb40fe40dc9e2aeb954392025a70a6c0d` |
| candidate raw target root | `exploration/evidence/gta-interest-v04-dom-html/1w0c7q5.root.html` | `b3d6576255ffff53687f479efddd9be0bd0fa4ae630b5bd64b2e4cebef7c42f9` |
| comparator 1 normalized | `exploration/evidence/gta-interest-v04-dom-html/1tv49hl.json` | `52da22ecbb2f79cbcfa6a465cdafba18abab0ce957f524e32da615ce7b8d878b` |
| comparator 1 raw target root | `exploration/evidence/gta-interest-v04-dom-html/1tv49hl.root.html` | `a0ad709c84576a3d8a5158b9b0aba1d915f82358fc2565c5ffcd1c2b76dd5658` |
| comparator 2 normalized | `exploration/evidence/gta-interest-v04-dom-html/1vz2o7p.json` | `83faf78c90f230ed60510da521f6460ae4dbb55e2ca17822b27c1b6c8a78d19c` |
| comparator 2 raw target root | `exploration/evidence/gta-interest-v04-dom-html/1vz2o7p.root.html` | `1cb260dd0dd21e5c318d789d7ef106bba90ff6466675ee9f518e30ad03f47005` |
| comparator 3 normalized | `exploration/evidence/gta-interest-v04-dom-html/1w0szr9.json` | `537096c70d14ac507d167896070173878b1195cecbf014a35631dd4ca45c2ad8` |
| comparator 3 raw target root | `exploration/evidence/gta-interest-v04-dom-html/1w0szr9.root.html` | `7297247d82c1b5d8d8c8c1de99232218dbbc387bc5ed2809209d487c0aba02f7` |
| round summary | `exploration/evidence/gta-interest-v04-dom-html/measurement-summary.json` | `c2bee4e0662e62fd7f8029e199f48a3508ec3ab528b82019b31b4632a105d9cc` |

### 2.2 Editorial-owner evidence

Evidence root：`exploration/evidence/gta-editorial-owner-v04-r02/`

| Record | Raw／normalized path | SHA-256 |
|---|---|---|
| PC Gamer normalized page record | `exploration/evidence/gta-editorial-owner-v04-r02/future.json` | `119459bc56b5dcc04a097250d5a43aea4c0d708335273054193074b06ce6b1d9` |
| PC Gamer raw owner locator | `exploration/evidence/gta-editorial-owner-v04-r02/future.owner-snippet.html` | `603fe8032d551bb9da7d5e7854d575757379a45f32088f9bb0218a5111a0908f` |
| PCGamesN normalized page record | `exploration/evidence/gta-editorial-owner-v04-r02/network-n.json` | `e0f5cdc552bdc80c3442c153cc547c187bfb881c2c874808f8b86ac0021cecfa` |
| PCGamesN raw owner locator | `exploration/evidence/gta-editorial-owner-v04-r02/network-n.owner-snippet.html` | `185ab6988d34c4c01c72361e1492cdbbaea0e74362a7108ebdc8168c41590aef` |
| round summary | `exploration/evidence/gta-editorial-owner-v04-r02/measurement-summary.json` | `d6967a34e324a2bc62559d999577c79f2aedf3babd612b8497ff46282f55ff51` |

## 3. Behavior proxy normalization 與計算

- fixed order：`1w0c7q5 → 1tv49hl → 1vz2o7p → 1w0szr9`
- shared `captured_at`：`2026-08-30T12:53:44.940Z`
- page observation interval：`2026-08-30T12:53:23.099Z` 至 `2026-08-30T12:53:44.940Z`（`21.841 s`）
- observation window semantics：每筆是該貼文截至共同 capture 的累積留言數，不是固定 post-age interval
- region：global Reddit `r/Games`；不是台灣樣本
- independence key：`reddit-r-games-comment-count`

| Role | ID／identity | Title | Extracted integer | Extraction | Identity result |
|---|---|---|---:|---|---|
| candidate | `t3_1w0c7q5`；`/r/Games/comments/1w0c7q5/grand_theft_auto_vi_an_extended_look/` | `Grand Theft Auto VI: An Extended Look` | `1061` | target `shreddit-post@comment-count` | `PASS`：root 恰一個、ID／permalink／subreddit 均相符 |
| comparator 1 | `t3_1tv49hl`；fixed Wolverine permalink | `Marvel’s Wolverine - Extended Gameplay Trailer \| PS5 Games` | `1001` | 同上 | `PASS` |
| comparator 2 | `t3_1vz2o7p`；fixed Fable quest permalink | `Fable - Official Quest Gameplay \| gamescom 2026` | `371` | 同上 | `PASS` |
| comparator 3 | `t3_1w0szr9`；fixed Fable combat permalink | `Fable - Official Combat Gameplay \| gamescom 2026` | `233` | 同上 | `PASS` |

```text
comparator values = [1001, 371, 233]
sorted comparators = [233, 371, 1001]
median baseline = 371
fixed threshold multiplier = 1.5
threshold count = 371 × 1.5 = 556.5
candidate = 1061
ratio = 1061 ÷ 371 = 2.8598382749326148
1061 >= 556.5  => PASS
```

**Behavior result：`PASS_UNDER_FROZEN_CONTRACT`。** 這只代表 candidate 在事前固定四筆 convenience set、共同 capture 與事前固定算式下達 `2.8598x`，超過 `1.5x` 門檻。

### Selection-bias disclosure

1. 四筆不是隨機抽樣、完整母體或台灣受眾 cohort；是事前鎖定的 convenience set。
2. 累積時間不齊：raw roots 的建立時間包含 `2026-06-02` 與 `2026-08-26/28`，沒有依貼文 age 正規化；較低的兩個 Fable comparators 會顯著影響 median。
3. Candidate 對最高 comparator 只是 `1061 vs 1001`；`2.8598x` 是對 median，不是對每一 comparator。
4. `comment-count` 不代表 unique commenters、正向情緒、觀看意圖、台灣 IG demand、完成率或發布後成效。
5. 以上限制不改寫 frozen threshold 的機械 PASS，但必須原樣交 focused reviewer；reviewer 仍可因 comparability／selection bias 拒絕解除既有 fresh-run hold。

## 4. Editorial-owner breadth normalization 與計算

- event anchor：`2026-08-27T19:00:00Z`
- fixed window end：`2026-08-29T19:00:00Z`
- window：`[anchor, end]`，48 小時
- region：global English-language gaming press
- threshold：distinct verified parent keys `>= 2`
- raw `measured_at`：`2026-08-30T13:21:59.592Z`
- later integration decision at：`2026-08-30T13:24:13.666Z`（不可回寫成 raw measurement time）
- per-record capture：PC Gamer `2026-08-30T13:21:10.324Z`；PCGamesN `2026-08-30T13:24:13.662Z`
- independence key：`editorial-owner-breadth-v0.4`

| Parent key | Outlet／article identity | Initial page publish | Qualifying in-window timestamp | Timestamp locator／rule application | Raw owner locator | Result |
|---|---|---|---|---|---|---|
| `future` | PC Gamer；`Grand Theft Auto 6 reveal live coverage: breaking down the Netflix 'extended look' event` | `2026-08-27T17:30:05Z`，早於 anchor `1h29m55s`，**不拿它通過 window** | `2026-08-27T19:17:24.976Z` | 同頁 JSON-LD `BlogPosting.datePublished` 的 event-specific live entry；lock 明文接受 publish／live timestamp | footer literal `Future Publishing Limited`；snippet SHA 見 §2.2 | `PASS` |
| `network-n` | PCGamesN；`Everything new we know about GTA 6, after Netflix's extended look` | `2026-08-27T19:35:04Z` | `2026-08-27T19:35:04Z` | `article:published_time`、visible `time[datetime]` 與 JSON-LD `NewsArticle.datePublished` 一致 | footer literal `Network N Media Ltd`；snippet SHA 見 §2.2 | `PASS` |

PC Gamer 的 article-level `17:30:05Z` 不在 window，不能被改標為合格發稿時間；本判定只因 frozen contract 接受 machine-readable **live** timestamp，且同一 event-specific live page 有明確 `BlogPosting` entry `19:17:24.976Z`。若 reviewer 不接受 live-entry semantics，該 record 即回到 UNKNOWN，不能換第三家補位。

```text
future qualifying live timestamp:
2026-08-27T19:00:00Z <= 2026-08-27T19:17:24.976Z <= 2026-08-29T19:00:00Z

network-n publish timestamp:
2026-08-27T19:00:00Z <= 2026-08-27T19:35:04Z <= 2026-08-29T19:00:00Z

distinct parent keys = {future, network-n}
verified independent parent owners = 2
2 >= 2  => PASS
```

**Editorial-owner breadth result：`PASS_UNDER_FROZEN_CONTRACT`。** 它證明兩個 ownership-independent outlets 對同一事件有合格 publish／live record；不證明閱聽需求、內容品質或 audience outcome。

## 5. v0.2／v0.3 失敗史與 supersession

| Attempt | Frozen result | Preserved boundary | Canonical use |
|---|---|---|---|
| v0.2 Reddit JSON | A01 public JSON single fetch 為 curl `56`／HTTP `403`；raw body absent；依 stop condition A02–A04 與 owner batch 未跑 | failure headers、command、exit 與 null ledgers 保留在 `exploration/evidence/gta-interest-v02/` | `SUPERSEDED_FAILURE_HISTORY`；不拿舊 score 或缺值補位 |
| v0.3 screenshot | 第一頁 `Page.captureScreenshot` timeout、process exit `1`；沒有 normalized count／screenshot 持久化 | premeasurement 與失敗敘述保留 | `SUPERSEDED_FAILURE_HISTORY`；不能當 Gate evidence |
| v0.4 DOM root | 四筆 raw opening tags、normalized JSON、identity 與共同 capture 全部完整 | 本文件 §2–3 的 hashes／replay | canonical behavior evidence |
| v0.4 owner r02 | 兩頁 normalized records、owner snippets 與 window locators完整 | 本文件 §2、§4 的 hashes／replay | canonical editorial-breadth evidence |

Legacy score metric 仍是 `SUPERSEDED_NOT_RELIED_UPON`；v0.4 只計 `comment-count`，不從 raw root 的其他 attributes 取值。

## 6. Interest Gate 整合判定

| Required proxy type | Evidence | Frozen threshold | Result |
|---|---|---|---|
| audience behavior／demand | Reddit `r/Games` target-root comment count | `1061 / median(1001,371,233) = 2.8598x >= 1.5x` | `PASS` |
| independent editorial attention | PC Gamer／Future + PCGamesN／Network N | fixed 48h window 中 distinct parent owners `2 >= 2` | `PASS` |

兩種 proxy 的 source、metric 與 independence key 不同，且至少一種是 audience behavior。依 `editorial-gate v0.1 G4`：

```yaml
signal_phase: pre_publish_proxy
behavior_proxy_count: 1
independent_proxy_count: 2
interest_signals:
  status: PASS
  reason_code: IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH
canonical_measurement_ref: exploration/2026-08-30-gta-interest-proxy-v0.4-measurement.md
post_publish_outcome_ref: null
exception_code: null
```

這個 PASS 是對 frozen proxy contract 的可重算判定，不是「應該會紅」或預測播放數。Reviewer acceptance 仍是 fresh-run 的獨立人工條件；`reviewer_ready=true` 只表示 preproduction package 已可送審，不表示 reviewer 已核准。

## 7. Confirmed／inferred／unknown 邊界

### Confirmed

- 兩份 premeasurement lock 的 SHA、時間與事前固定 IDs／門檻。
- 14 個 raw／normalized／summary evidence 檔存在且 SHA 與 §2 相符。
- 四個 target roots 恰各一個，identity 相符，`comment-count` 為 `1061／1001／371／233`，共同 `captured_at` 相同。
- median、ratio 與 frozen threshold 算術。
- PC Gamer event-specific live page 的 initial article timestamp 是窗外 `17:30:05Z`；同頁 machine-readable live entry 是窗內 `19:17:24.976Z`。
- PCGamesN 的 `19:35:04Z` 在窗內；兩份 raw footer snippets 分別寫出 Future Publishing Limited 與 Network N Media Ltd。

### Inferred／rule-applied

- 依 lock 的「publish/live timestamp」用 PC Gamer JSON-LD BlogPosting entry 作 qualifying timestamp；沒有把 initial page publish 改寫成窗內。
- Footer corporate locator 對應 frozen parent keys `future`／`network-n`，兩者視為 ownership-independent。
- 兩種 proxy 同時 PASS，依 Gate v0.1 規則把 `interest_signals` 評為 PASS。

### Unknown／coverage gaps

- Convenience set 是否能代表一般科技觀眾、台灣觀眾或未來 IG audience；reviewer 是否接受其 selection bias。
- Reddit 留言的 unique-human composition、情緒、品質、bot／moderation 影響與 post-age normalization。
- Editorial coverage 的 readership、版位流量與是否造成 audience demand。
- 任何發布後 views／retention／completion／saves／shares outcome。
- Rockstar 素材 intended-use publication rights；`rights_status` 仍為 `UNKNOWN`，`publication_hold:true`。
- Full-source SHA、fresh-run execution 與 GATE 2 成片品質；本輪沒有建立 run。

## 8. Canonical handoff

<a id="canonical-interest-v04"></a>

```yaml
canonical_interest_evidence: v0.4
behavior_proxy: PASS
editorial_owner_breadth: PASS
interest_signals: PASS
interest_reason_code: IS_V04_COMMENTS_RATIO_AND_OWNER_BREADTH
overall_gate_status: PASS
open_gate_unknowns: []
story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05
reviewer_ready: true
reviewer_approval: PENDING_FOCUSED_RECHECK
fresh_run_authorized: false
rights_status: UNKNOWN
publication_hold: true
allowed_next_action: FOCUSED_REVIEW_FOR_FRESH_RUN
public_release: BLOCKED_PENDING_RIGHTS
```

五項 Gate 同步為 PASS 後可正式建立 Story Package；但既有 reviewer `REVIEW_HOLD` 只能由 focused reviewer 明確改成 `REVIEW_PASS_FOR_FRESH_RUN`。在此之前不得建立 GTA run_dir 或執行 init／下載／ffmpeg／snapshot／render。

## 9. Exact self-check

以下是本 artifact 與五份 canonical preproduction artifacts 更新後的完整重播命令；不含 network、browser、media 或 run 操作。預期唯一成功輸出為 `PASS v0.4 evidence, Gate sync, F01-F08 guards, and no GTA run`，exit `0`。

```bash
OMP_THREAD_LIMIT=1 nice -n 19 python3 - <<'PY'
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, re, statistics

root = Path('exploration')
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def z(s): return datetime.fromisoformat(s.replace('Z', '+00:00'))

locks = {
  root/'2026-08-30-gta-interest-proxy-v0.4-dom-html-premeasurement.md': 'ed15306ca5ddd45e75ee5c8b5b19acc5ba72e6315e01a052eac026cb48978001',
  root/'2026-08-30-gta-editorial-owner-v0.4-premeasurement.md': '24d153d42c3796993ed3936235a0220d0871a6fe59b3183b9fe7e4bf2d3a20f2',
}
files = {
  root/'evidence/gta-interest-v04-dom-html/1w0c7q5.json': '443f0d5d9b643fe2f811536acd4684afb40fe40dc9e2aeb954392025a70a6c0d',
  root/'evidence/gta-interest-v04-dom-html/1w0c7q5.root.html': 'b3d6576255ffff53687f479efddd9be0bd0fa4ae630b5bd64b2e4cebef7c42f9',
  root/'evidence/gta-interest-v04-dom-html/1tv49hl.json': '52da22ecbb2f79cbcfa6a465cdafba18abab0ce957f524e32da615ce7b8d878b',
  root/'evidence/gta-interest-v04-dom-html/1tv49hl.root.html': 'a0ad709c84576a3d8a5158b9b0aba1d915f82358fc2565c5ffcd1c2b76dd5658',
  root/'evidence/gta-interest-v04-dom-html/1vz2o7p.json': '83faf78c90f230ed60510da521f6460ae4dbb55e2ca17822b27c1b6c8a78d19c',
  root/'evidence/gta-interest-v04-dom-html/1vz2o7p.root.html': '1cb260dd0dd21e5c318d789d7ef106bba90ff6466675ee9f518e30ad03f47005',
  root/'evidence/gta-interest-v04-dom-html/1w0szr9.json': '537096c70d14ac507d167896070173878b1195cecbf014a35631dd4ca45c2ad8',
  root/'evidence/gta-interest-v04-dom-html/1w0szr9.root.html': '7297247d82c1b5d8d8c8c1de99232218dbbc387bc5ed2809209d487c0aba02f7',
  root/'evidence/gta-interest-v04-dom-html/measurement-summary.json': 'c2bee4e0662e62fd7f8029e199f48a3508ec3ab528b82019b31b4632a105d9cc',
  root/'evidence/gta-editorial-owner-v04-r02/future.json': '119459bc56b5dcc04a097250d5a43aea4c0d708335273054193074b06ce6b1d9',
  root/'evidence/gta-editorial-owner-v04-r02/future.owner-snippet.html': '603fe8032d551bb9da7d5e7854d575757379a45f32088f9bb0218a5111a0908f',
  root/'evidence/gta-editorial-owner-v04-r02/network-n.json': 'e0f5cdc552bdc80c3442c153cc547c187bfb881c2c874808f8b86ac0021cecfa',
  root/'evidence/gta-editorial-owner-v04-r02/network-n.owner-snippet.html': '185ab6988d34c4c01c72361e1492cdbbaea0e74362a7108ebdc8168c41590aef',
  root/'evidence/gta-editorial-owner-v04-r02/measurement-summary.json': 'd6967a34e324a2bc62559d999577c79f2aedf3babd612b8497ff46282f55ff51',
}
for p, expected in {**locks, **files}.items():
    assert p.is_file() and sha(p) == expected, (p, sha(p))

ids = ['1w0c7q5','1tv49hl','1vz2o7p','1w0szr9']
vals = []
captured = set()
for post_id in ids:
    p = root/f'evidence/gta-interest-v04-dom-html/{post_id}.json'
    d = json.loads(p.read_text())
    raw = (root/f'evidence/gta-interest-v04-dom-html/{post_id}.root.html').read_text()
    assert d['valid'] is True and d['rootsFound'] == 1 and d['wanted'] == post_id
    assert d['domId'] == f't3_{post_id}' and d['subreddit'] == 'r/Games'
    assert f'id="t3_{post_id}"' in raw and f'comment-count="{d["commentCount"]}"' in raw
    assert isinstance(d['commentCount'], int) and d['commentCount'] >= 0
    assert d['extraction'] == 'shreddit-post@comment-count'
    vals.append(d['commentCount']); captured.add(d['capturedAt'])
assert vals == [1061,1001,371,233] and captured == {'2026-08-30T12:53:44.940Z'}
summary = json.loads((root/'evidence/gta-interest-v04-dom-html/measurement-summary.json').read_text())
assert summary['status'] == 'COMPLETE' and [r['commentCount'] for r in summary['records']] == vals
baseline = statistics.median(vals[1:]); ratio = vals[0] / baseline
assert baseline == 371 and ratio == 2.8598382749326148 and vals[0] >= 1.5 * baseline

future = json.loads((root/'evidence/gta-editorial-owner-v04-r02/future.json').read_text())
network = json.loads((root/'evidence/gta-editorial-owner-v04-r02/network-n.json').read_text())
anchor, end = z('2026-08-27T19:00:00Z'), z('2026-08-29T19:00:00Z')
initial = z(future['page']['articlePublishedTime'])
live = [z(x['datePublished']) for x in future['page']['jsonLdDateHits']
        if x['type'] == 'BlogPosting' and x['datePublished'].startswith('2026-08-27T19:17:24')]
pcgn = z(network['page']['articlePublishedTime'])
assert initial < anchor and len(live) == 1 and anchor <= live[0] <= end
assert anchor <= pcgn <= end
assert future['record_key'] == 'future' and future['page']['ownerPattern'] == 'Future Publishing Limited'
assert network['record_key'] == 'network-n' and network['page']['ownerPattern'] == 'Network N Media'
assert 'Future Publishing Limited' in (root/'evidence/gta-editorial-owner-v04-r02/future.owner-snippet.html').read_text()
assert 'Network N Media Ltd' in (root/'evidence/gta-editorial-owner-v04-r02/network-n.owner-snippet.html').read_text()
assert len({future['record_key'], network['record_key']}) == 2

paths = {
 'brief': root/'2026-08-30-gta-editorial-brief.md',
 'visual': root/'2026-08-30-gta-visual-preflight.md',
 'gate': root/'2026-08-30-gta-gate-and-story-package.md',
 'supp': root/'2026-08-30-gta-gate-evidence-supplement.md',
 'plan': root/'2026-08-30-gta-production-plan.md',
}
s = {k:p.read_text() for k,p in paths.items()}
assert 'artifact 版本：`v0.4`' in s['brief'] and 'artifact 版本：`v0.4`' in s['visual']
assert 'artifact 版本：`v0.5`' in s['gate'] and 'artifact 版本：`v0.3`' in s['supp']
assert 'artifact 版本：`v0.5`' in s['plan']
canon = s['gate'].split('<!-- canonical-gate-state:start -->',1)[1].split('<!-- canonical-gate-state:end -->',1)[0]
assert len(re.findall(r'^  [a-z_]+: \{status: PASS,', canon, re.M)) == 5
assert 'overall_status: PASS' in canon and 'open_gate_unknowns: []' in canon
assert 'story_package_ref: exploration/2026-08-30-gta-gate-and-story-package.md#formal-story-package-v05' in canon
assert 'reviewer_ready: true' in canon and 'rights_status: UNKNOWN' in canon and 'publication_hold: true' in canon
for stale in ['IS_V02_' + 'BATCH_A_HTTP_403', 'overall_status: ' + 'UNKNOWN',
              'story_package_ref: ' + 'null', 'reviewer_ready: ' + 'false']:
    assert stale not in canon, stale
assert '`水上與場館活動也入鏡`' in s['brief'] and '11/19' not in s['brief']
assert 'bin/verify-render.sh' in s['plan'] and 'logs/verify-render-canonical.log' in s['plan']
assert all(x in s['plan'] for x in ['[12, 24, 36, 48]', '[6, 18, 30, 42, 54]', 'P3 fixed-selection deviation'])
assert all(x in s['plan'] for x in ['S1','S2','S4','S5','content_safety','publication_hold: true'])
assert 'reviewer_ready: true' in s['plan'] and 'fresh_run_authorized: false' in s['plan']
assert not Path('/Users/chiu/Developer/sourced-footage-reel-runs/w14-2026-08-30-gta-vi').exists()
print('PASS v0.4 evidence, Gate sync, F01-F08 guards, and no GTA run')
PY
```

### 9.1 Execution record

- attempt `self-check-r01`：exit `1`；embedded Python line 50 使用尾數 `6145` 的不精確 float literal，而 Python 對 `1061/371` 的實際值為 `2.8598382749326148`。這是 self-check contract bug，不是 evidence threshold failure；失敗輸出已如實保留於本輪記錄，literal 與所有 canonical prose 已更正後才可重跑。
- attempt `self-check-r02`：exit `1`；embedded Python line 79 的 substring count 把 `overall_status: PASS` 也計入，得到 6 而不是 criteria 5。已改成只匹配 `criteria` 內兩空格縮排的五列；這同樣是 assertion scope bug，不是 Gate state failure。
- attempt `self-check-r03`：exit `1`；Gate 檔較早的 executable assertion 內含完整 marker literal，self-check 的 first split 誤取 code text，而非後方 canonical YAML。已把 executable marker／formal-anchor strings 拆接，確保 raw marker 在 artifact 中唯一；這正是本輪要清除的 stale executable/example ambiguity。
- attempt `self-check-r04`：exit `0`；exact stdout：`PASS v0.4 evidence, Gate sync, F01-F08 guards, and no GTA run`。
- canonical self-check result：`PASS`。r01–r03 保留為 assertion-contract 修正史，不以 r04 覆寫或洗掉。
