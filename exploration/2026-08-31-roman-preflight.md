# NASA Roman preflight decision

## 文件狀態

| 欄位 | 值 |
|---|---|
| 版本 | `v0.2` |
| 評估時間 | `2026-08-31T03:01:12Z`（`2026-08-31T11:01:12+08:00`） |
| Gate | `editorial-gate v0.1` |
| 題材 | NASA Nancy Grace Roman Space Telescope 8/30 升空 |
| 結論 | **`HOLD / overall UNKNOWN`** |
| Story Package | `null` |
| Download／render | **未授權、未執行** |
| Publication | `publication_hold: true` |
| Reviewer | `REVIEW_PASS`：focused recheck 已確認 canonical identity finding 修正完成；本文件兩項 `UNKNOWN` 是 Gate coverage gap，不是 reviewer finding |

## 一句話結論

Roman 是新、值得解釋、且已出現強烈公開注意訊號的題材，但現在仍不能直接 render：interest baseline 少一支合格 comparator，兩支可取得 SVS 素材也尚未有 frame-level 60 秒 mapping；此外都含第三方 Universal Production Music。

## 五項 Editorial Gate

| Criterion | 結果 | 可驗證證據 | 決策影響 |
|---|---|---|---|
| `freshness` | `PASS` | 8/30 07:26 EDT 實際升空；本次評估 age=`15.586667 h` | 在 rolling 168 h 內 |
| `why_now` | `PASS` | NASA 確認升空、31 分鐘後分離、1:23 後太陽能板與 lower sun shade 部署 | 故事是從等待發射進入 L2 航行／commissioning，不是舊科普重發 |
| `audience_payoff` | `PASS` | 可回答「已有 Hubble／Webb，為何需要 Roman？」；NASA 主張大視野與 Hubble 1,000 倍巡天速度 | 必須標 NASA attribution；不能宣稱已出現科學成果 |
| `interest_signals` | **`UNKNOWN`** | NASA launch replay capture=`1,015,203` views；AP＋El País 兩個 owner `PASS`，但同頻道 behavior baseline 只有 `2/3` 支 comparator 合格 | 百萬 views 是正向 observation，不足以越過事前鎖定門檻 |
| `visual_source_fit` | **`UNKNOWN`** | 兩支 direct MP4 metadata／range probe 皆 exit 0，時長、解析度、音軌合格；沒有 dynamic preview、十個 6 秒窗口或 final-crop evidence | 不能從「檔案存在且夠長」推論 60 秒畫面成立 |

依 v0.1 conjunction：沒有 `FAIL`，但至少一項 `UNKNOWN`，所以 `overall_status=UNKNOWN`；不得建立 Story Package 或進 harness execution。

## 素材 preflight 結果

| 候選素材 | 已確認規格 | 畫面與新聞的關係 | 主要風險 | 本輪 disposition |
|---|---|---|---|---|
| [SVS 15080：Roman: Go For Launch](https://svs.gsfc.nasa.gov/15080/) | `193.126271s`；1920×1080；29.97fps；H.264＋AAC stereo；direct metadata／ffprobe exit 0 | 直接拍 Roman 實體、組裝與環境測試；8/28 發布，**不是 8/30 實際升空畫面** | 16:9 放入近方形 stage 的中央裁切未驗；Universal Production Music；full acquisition 未驗 | `TECHNICAL_PREFLIGHT_PASS / VISUAL_UNKNOWN / RIGHTS_UNKNOWN` |
| [SVS 15058：Journey to Space／vertical NoTOS](https://svs.gsfc.nasa.gov/15058/) | `74.941542s`；1080×1920；29.97fps；H.264＋AAC stereo；direct metadata／ffprobe exit 0 | 直接拍 Roman 零件、完工與運往 Kennedy；7/8 的另一個獨立 item，**不是 15080 直式版，也不是升空畫面** | 比 60 秒只多 `14.941542s`；固定近方形 stage 仍會大幅裁上下；Universal Production Music | `TECHNICAL_PREFLIGHT_PASS / VISUAL_UNKNOWN / RIGHTS_UNKNOWN` |

兩支都要求 credit：`NASA's Goddard Space Flight Center`。NASA media guideline 對多數 NASA media 的一般資訊用途較寬，但明示第三方受保護內容的權利不會轉授給下游；兩支頁面都列 Universal Production Music，故 direct MP4 不等於公開重剪授權。

## Interest preflight

### Audience behavior

- Lock 在讀數前固定：target ÷ 三支同 NASA channel、target 前 168h 的 comparator median，門檻 `>=1.5x`。
- Target [`9wq3VHsL_bE`](https://www.youtube.com/watch?v=9wq3VHsL_bE) 在共同 capture 為 `1,015,203` views。
- 只有 Artemis II ceremony（42.6658h）與 Spacewalk 98（112.26h）合格；第三支非 Roman upload 已距 target 280.046h，超窗。
- 結果：comparator=`2/3`，locked metric 無效；不得改用兩支 median、擴窗或事後換 metric。

### Editorial breadth

- [AP News](https://apnews.com/article/nasa-nancy-grace-roman-space-telescope-2a8e59d0b4e4884966a3b50a159ab8c9)／Associated Press。
- [El País Ciencia](https://elpais.com/ciencia/2026-08-30/lanzado-con-exito-el-telescopio-nancy-grace-roman-que-observara-cien-veces-mas-cielo-que-el-hubble.html)／PRISA。
- 兩個不同 parent owners 在固定 48h window 有原創、可回查 coverage，Proxy B=`PASS`；這只證明 editorial attention，不是台灣 IG outcome。

## 推薦與停止條件

**目前推薦保持 Roman，但只作「待補證候選」，不進 render。**

若下一輪要以最小成本解鎖，順序應是：

1. 先決定是否接受一個新的、事前鎖定且可比的 audience-behavior proxy；本輪 v0.1 量測不可回寫成 PASS。
2. 若 G4 後續通過，優先對 **SVS 15080** 做單一素材 visual preflight，因為 193 秒提供較大選鏡餘量、敘事也較能支撐「Roman 為何不同」；但不得把它稱為 actual launch footage。
3. 在任何對外發布前，另找可證明 Universal Production Music 可供本用途重剪的 license，或找到不含第三方音樂的官方版本；否則 publication hold 不解除。

本輪停止於 `HOLD`：不建立 run_dir、不下載、不做 contact sheet、不 render，也不修改 production code。

## Canonical refs 與完整性

| Artifact | SHA-256 |
|---|---|
| [`roman-editorial-core-preflight`](./2026-08-31-roman-editorial-core-preflight.md) | `6bf8a59453916204e0c8221d07ace4a0483b2906038e6bf1c5fa7e7ca04358e8` |
| [`roman-interest-proxy-measurement`](./2026-08-31-roman-interest-proxy-measurement.md) | `7ac2754641042d2e9c393d66e47d476b1a39def76c000ef26d2f34ed7830fb0d` |
| [`roman-material-preflight`](./2026-08-31-roman-material-preflight.md) | `c48cc9615c2b56a689541982da8866505fbe8c6dbefc5a8155d3acbe38d1e73d` |

```yaml
gate_version: v0.1
evaluated_at: 2026-08-31T03:01:12Z
candidate_id: roman-launch-2026-08-30
topic: NASA Nancy Grace Roman Space Telescope launch
criteria:
  freshness: {status: PASS, reason_code: FR_ACTUAL_LIFTOFF}
  why_now: {status: PASS, reason_code: WN_LAUNCH_TO_COMMISSIONING}
  audience_payoff: {status: PASS, reason_code: AP_WIDE_SURVEY_COMPLEMENT}
  interest_signals: {status: UNKNOWN, reason_code: IS_BEHAVIOR_BASELINE_INCOMPLETE}
  visual_source_fit: {status: UNKNOWN, reason_code: VS_NO_60S_VISUAL_PREVIEW_EVIDENCE}
overall_status: UNKNOWN
hard_fail_reasons: []
unknowns:
  - interest_behavior_baseline
  - sixty_second_visual_mapping
  - intended_use_music_rights
exception_codes: []
publication_hold: true
story_package_ref: null
next_action: RESOLVE_WITHIN_WINDOW
```
