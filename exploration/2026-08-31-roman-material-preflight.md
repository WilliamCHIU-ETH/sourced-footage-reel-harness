# NASA Roman 素材 preflight

## 文件狀態

| 欄位 | 值 |
|---|---|
| 版本 | `v0.1` |
| 評估時間 | `2026-08-31T02:55:55Z` |
| 範圍 | 只評估 NASA Roman 的 Editorial Gate G5 `visual/source fit` 與 rights／credit；不評估 G1–G4，不建立 Story Package |
| 方法 | 讀第一方頁面；對恰好 2 個 direct MP4 跑 `yt-dlp --skip-download` metadata 與 `ffprobe` 遠端 header／range probe |
| 媒體下載 | `0`；沒有 contact sheet、逐幀 preview、local media hash 或 60 秒選鏡 |
| G5 結果 | **`UNKNOWN`** (`VS_NO_60S_VISUAL_PREVIEW_EVIDENCE`) |
| rights | `UNKNOWN` |
| publication_hold | `true` |
| production authorization | `false` |

## 結論

兩個候選都是 NASA／SVS 第一方 direct asset，匿名 metadata 讀取成功，規格也都名義上足以覆蓋 60 秒：SVS 15080 是 `193.126271s`、1920×1080、H.264＋AAC；SVS 15058 的 `NoTOS` 直式檔是 `74.941542s`、1080×1920、H.264＋AAC。頁面文字也確認兩者直接拍到 Roman 觀測站、組裝／測試／運輸，而非通用太空 B-roll。

但本輪依 Decision Lock **沒有下載或觀看動態 preview**，所以無法證明任一檔案能提供十個完整 6 秒窗口、能承受固定 stage crop、避開文字／logo／人物權利風險，或能把 8/30 升空故事映射成 60 秒。兩支影片又都在實際升空前發布，不能冒充 8/30 實際升空畫面。因此 G5 不得寫成 PASS，維持 `UNKNOWN`。

此外，兩頁都明列 Universal Production Music 曲目，而 ffprobe 確認 direct MP4 內有 AAC 音軌。NASA guideline 明說 NASA 偶爾使用的第三方受保護內容不會把權利轉授給下游；本 harness 又預設保留原聲。因此公開重剪前必須另行確認音樂授權，`publication_hold: true`。

## 1. 事實來源與故事邊界

### 1.1 NASA 8/30 launch release

- URL: <https://www.nasa.gov/news-release/nasas-dark-universe-seeking-nancy-grace-roman-space-telescope-launches/>
- 頁面標題：`NASA’s Dark Universe-Seeking Nancy Grace Roman Space Telescope Launches`
- 第一方發布時間：`2026-08-30T13:18:06Z`（頁面 `parsely-pub-date`；另有 `og:updated_time=2026-08-30T09:18:10-04:00`）
- checked_at: `2026-08-31T02:55:53.202Z`

**Confirmed from release**：

1. Roman 於 `2026-08-30 07:26 EDT` 從 Kennedy Space Center LC-39A 搭 Falcon Heavy 升空。
2. NASA 在升空後 7 分鐘收到 telemetry；火箭在升空後 31 分鐘與觀測站分離。
3. 團隊在升空後 1 小時 23 分確認太陽能板與 lower instrument sun shade 部署成功。
4. Roman 正前往距地球約 100 萬英里的 Sun–Earth L2；任務將研究暗物質、暗能量與系外行星。
5. NASA 稱 Roman 設計巡天速度是 Hubble 的 1,000 倍，首批影像預計 2027 年初發布。這兩項都必須保留 NASA attribution，不能寫成獨立實測。

**Boundary**：NASA release 的首圖可見實際升空，但本輪沒有定位或探測該事件的官方 motion asset。下列 15080／15058 皆為升空前素材，不能標成「8/30 實際升空畫面」。

## 2. 兩個 asset 的關係

| 欄位 | SVS 15080 主素材 | SVS 15058 較早直式素材 |
|---|---|---|
| item | `Roman: Go For Launch` | `Roman Space Telescope and The Journey to Space` |
| official page | <https://svs.gsfc.nasa.gov/15080/> | <https://svs.gsfc.nasa.gov/15058/> |
| page published | `2026-08-28T13:00:00-04:00` (`2026-08-28T17:00:00Z`) | `2026-07-08T14:00:00-04:00` (`2026-07-08T18:00:00Z`) |
| probed asset | `15080_RomanGoForLaunch_1080.mp4` | `Roman_Map_Vert_NoTOS.mp4` |
| page-declared subject | Roman 的研製、完整組裝、clean-room integration 與 vibration／acoustic／thermal-vacuum／centrifuge tests | Roman 從各地零件到 Goddard 完工，再經 8 天旅程前往 Kennedy launch site |
| page-declared format relation | 15080 item 的 1080p 主檔；同頁另列 4K／ProRes／SRT／VTT | 15058 item 自己的 vertical `text-on-screen` 與 `no-text` 版本 |
| relation | **不同 item、不同發布日、不同標題、敘事、音樂、旁白與 credit roster** | **不是 15080 的直式轉版**；只是同一 Roman 任務的較早第一方素材 |

**Confirmed**：SVS 15080 頁沒有把 15058 列成自己的 vertical rendition；15058 頁則明寫 `Vertical version with text-on-screen and no-text options.`，direct 檔名也屬 `/a015058/`。

## 3. Metadata probe ledger（沒有下載媒體）

### 3.1 工具

- `yt-dlp 2026.07.04`
- `ffprobe 8.1.2`
- 所有 probe：`OMP_THREAD_LIMIT=1 nice -n 19`
- `yt-dlp` 明確使用 `--skip-download`；`ffprobe` 只做遠端 header／range metadata probe。沒有產生本機 MP4。

### 3.2 Asset A — SVS 15080 1080p

- page: <https://svs.gsfc.nasa.gov/15080/>
- direct: <https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4>

#### yt-dlp metadata

- checked_at: `2026-08-31T02:52:06Z`
- exit: `0`
- stderr: empty

```bash
OMP_THREAD_LIMIT=1 nice -n 19 yt-dlp --skip-download --socket-timeout 30 \
  --referer 'https://svs.gsfc.nasa.gov/15080/' \
  --print 'extractor=%(extractor)s\ntitle=%(title)s\nduration=%(duration)s\nwidth=%(width)s\nheight=%(height)s\nvcodec=%(vcodec)s\nacodec=%(acodec)s\next=%(ext)s\nfilesize=%(filesize)s\nwebpage_url=%(webpage_url)s' \
  'https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4'
```

stdout（verbatim；本次 format string 的 `\n` 被 yt-dlp 原樣輸出）：

```text
extractor=generic\ntitle=15080_RomanGoForLaunch_1080\nduration=NA\nwidth=NA\nheight=NA\nvcodec=NA\nacodec=NA\next=mp4\nfilesize=NA\nwebpage_url=https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4
```

判讀：generic extractor 可匿名定位 direct MP4，但不回報技術 metadata；依 SKILL 步驟 2 以 ffprobe 補測，不能把 NA 當成規格 PASS。

#### ffprobe remote header

- checked_at: `2026-08-31T02:52:31Z`
- exit: `0`
- stderr: empty

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffprobe -v error -rw_timeout 20000000 \
  -headers $'Referer: https://svs.gsfc.nasa.gov/15080/\r\n' \
  -show_entries format=duration,size,bit_rate,format_name \
  -show_entries stream=index,codec_type,codec_name,width,height,r_frame_rate,avg_frame_rate,sample_rate,channels,channel_layout,duration \
  -of json \
  'https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4'
```

stdout：

```json
{
  "streams": [
    {
      "index": 0,
      "codec_name": "h264",
      "codec_type": "video",
      "width": 1920,
      "height": 1080,
      "r_frame_rate": "30000/1001",
      "avg_frame_rate": "30000/1001",
      "duration": "193.126267"
    },
    {
      "index": 1,
      "codec_name": "aac",
      "codec_type": "audio",
      "sample_rate": "48000",
      "channels": 2,
      "channel_layout": "stereo",
      "r_frame_rate": "0/0",
      "avg_frame_rate": "0/0",
      "duration": "193.126271"
    }
  ],
  "format": {
    "format_name": "mov,mp4,m4a,3gp,3g2,mj2",
    "duration": "193.126271",
    "size": "178601651",
    "bit_rate": "7398336"
  }
}
```

### 3.3 Asset B — SVS 15058 vertical NoTOS

- page: <https://svs.gsfc.nasa.gov/15058/>
- direct: <https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015058/Roman_Map_Vert_NoTOS.mp4>

#### yt-dlp metadata

- checked_at: `2026-08-31T02:53:15Z`
- exit: `0`
- stderr: empty

```bash
OMP_THREAD_LIMIT=1 nice -n 19 yt-dlp --skip-download --socket-timeout 30 \
  --referer 'https://svs.gsfc.nasa.gov/15058/' \
  --print 'extractor=%(extractor)s|title=%(title)s|duration=%(duration)s|width=%(width)s|height=%(height)s|vcodec=%(vcodec)s|acodec=%(acodec)s|ext=%(ext)s|filesize=%(filesize)s|webpage_url=%(webpage_url)s' \
  'https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015058/Roman_Map_Vert_NoTOS.mp4'
```

stdout：

```text
extractor=generic|title=Roman_Map_Vert_NoTOS|duration=NA|width=NA|height=NA|vcodec=NA|acodec=NA|ext=mp4|filesize=NA|webpage_url=https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015058/Roman_Map_Vert_NoTOS.mp4
```

#### ffprobe remote header

- checked_at: `2026-08-31T02:53:51Z`
- exit: `0`
- stderr: empty

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffprobe -v error -rw_timeout 20000000 \
  -headers $'Referer: https://svs.gsfc.nasa.gov/15058/\r\n' \
  -show_entries format=duration,size,bit_rate,format_name \
  -show_entries stream=index,codec_type,codec_name,width,height,r_frame_rate,avg_frame_rate,sample_rate,channels,channel_layout,duration \
  -of json \
  'https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015058/Roman_Map_Vert_NoTOS.mp4'
```

stdout：

```json
{
  "streams": [
    {
      "index": 0,
      "codec_name": "h264",
      "codec_type": "video",
      "width": 1080,
      "height": 1920,
      "r_frame_rate": "30000/1001",
      "avg_frame_rate": "30000/1001",
      "duration": "74.941533"
    },
    {
      "index": 1,
      "codec_name": "aac",
      "codec_type": "audio",
      "sample_rate": "48000",
      "channels": 2,
      "channel_layout": "stereo",
      "r_frame_rate": "0/0",
      "avg_frame_rate": "0/0",
      "duration": "74.941542"
    }
  ],
  "format": {
    "format_name": "mov,mp4,m4a,3gp,3g2,mj2",
    "duration": "74.941542",
    "size": "230992905",
    "bit_rate": "24658462"
  }
}
```

## 4. 逐資產 confirmed／inferred／unknown

### A. SVS 15080 — `Roman: Go For Launch`

**Confirmed**

- NASA SVS／Goddard 第一方頁與 direct MP4，可匿名由 generic extractor 定位並由 ffprobe range-read。
- 193.126271 秒、1920×1080、29.97 fps、H.264；AAC 48 kHz stereo，技術上長於 60 秒。
- 頁面敘述直接包含 Roman 實體硬體、Goddard clean room 組裝，以及 vibration、acoustic、thermal-vacuum、centrifuge 測試；不是通用 B-roll。
- 頁面在實際升空前兩天發布，內容是「prepped for launch」與研製回顧，不是 8/30 launch footage。
- 頁面列音樂 `“Caelum,” Dan Thiessen [BMI], Universal Production Music`。

**Inferred**

- 內容類型可支援「Roman 是什麼／如何完成組裝與測試」等 beat；但只有頁面敘述，沒有本輪 frame-level 證據。
- 16:9 放進固定近方形 stage 會裁掉大量左右畫面；能否保留 Roman 本體與人物，尚不可由 metadata 推定。

**Unknown**

- 十個 6 秒窗口、中央裁切、純文字卡比例、source text／NASA logo／字幕碰撞、實際音訊內容分布與 60 秒 visual mapping。
- full-file acquisition 是否能不中斷完成；本輪只證明 metadata／range access。
- Universal Production Music、旁白與任何第三方畫面是否涵蓋本預定公開重剪用途。

**Asset-level disposition**：`TECHNICAL_PREFLIGHT_PASS / VISUAL_MAPPING_UNKNOWN / RIGHTS_UNKNOWN`。

### B. SVS 15058 — `Roman_Map_Vert_NoTOS`

**Confirmed**

- 另一個較早、獨立的 SVS item；不是 15080 的 vertical encoding。
- 頁面明列 `Vertical version with text-on-screen and no-text options.`；本輪 probe 的是 `NoTOS`。
- 74.941542 秒、1080×1920、29.97 fps、H.264；AAC 48 kHz stereo，名義上比 60 秒多 14.941542 秒。
- 頁面敘述直接涵蓋 Roman 從各地零件、Goddard 完工到運往 Kennedy launch site 的 8 天旅程。
- 7/8 發布且敘述仍稱 launch `slated for Aug. 30`，不能冒充 8/30 升空後影片。
- 頁面列音樂 `“Comic Book Hero,” Adam Saunders [PRS] and Mark Stephen Cousins [PRS], Universal Production Music`。

**Inferred**

- native 9:16 可減少左右裁切問題，但 harness 的動態 stage 是 1080×1017、`object-fit: cover`；1080×1920 素材會大幅裁掉上下區域，不能因「直式」二字直接判 fit。
- 只多約 15 秒的剪輯餘量，若有片頭／片尾、文字卡或主體離開 stage-safe center，可能撐不起十個不重複窗口。

**Unknown**

- `NoTOS` 是否全片完全無 source text／logo，以及固定 stage crop 後的主體、人物、字幕碰撞與安全性。
- 十個完整六秒窗口與 launch-story beat mapping；未看動態 preview，不得用 duration 代替。
- full acquisition 與內嵌 Universal Production Music 的重剪／社群發布權。

**Asset-level disposition**：`TECHNICAL_PREFLIGHT_PASS / VISUAL_MAPPING_UNKNOWN / RIGHTS_UNKNOWN`。

## 5. Credit 與 rights preflight

### 5.1 Item-level requested credit

兩頁都明列：

> `Please give credit for this item to: NASA's Goddard Space Flight Center`

建議 viewer-facing credit 以此 item-level wording 為準；完整 contributor roster 應保留在 provenance，而不是自行縮成「NASA public domain」。

### 5.2 Full credits preserved from SVS

**15080**

- Producer: Scott Wiessinger (eMITS)
- Videographers: Sophia Roberts (eMITS), Scott Wiessinger (eMITS), John D. Philyaw (eMITS), Rob Andreoli (eMITS), Jolearra Tshiteya (ASRC Federal), Sydney Rohde (ASRC Federal)
- Drone pilots: Francis Reddy (University of Maryland College Park), Christopher Albert, Rob Fortunato
- Public affairs officer: Claire Andreoli (NASA/GSFC)
- Science writer: Ashley Balzer (eMITS)
- Animator: Adriana Manrique Gutierrez (eMITS)
- Editor: Scott Wiessinger (eMITS)
- Narrator: Jacob Pinter (eMITS)
- Music: `“Caelum,” Dan Thiessen [BMI], Universal Production Music`

**15058**

- Producer: Scott Wiessinger (eMITS)
- Narrator: John Rhys-Davies
- Videographers: Sophia Roberts (eMITS), Scott Wiessinger (eMITS)
- Drone pilot: Francis Reddy (University of Maryland College Park)
- Animator: Krystofer Kim (eMITS)
- Science writer: Ashley Balzer (eMITS)
- Music: `“Comic Book Hero,” Adam Saunders [PRS] and Mark Stephen Cousins [PRS], Universal Production Music`

### 5.3 NASA media-use guideline

- URL: <https://www.nasa.gov/nasa-brand-center/images-and-media/>
- title: `Guidelines for using NASA Images and Media Guidelines`
- checked_at: `2026-08-31T02:55:22.627Z`
- page updated metadata: `2026-08-13T16:05:02-04:00`

**Confirmed guideline statements**：

1. NASA images/audio/video generally are not subject to copyright **in the United States** and may be used for educational or informational purposes.
2. Factual use must not imply NASA endorsement；NASA should be acknowledged as source.
3. NASA occasionally uses third-party copyright-protected material；NASA’s use **does not convey rights to others**，and downstream users must contact the copyright holder.
4. NASA insignia／logotype／identifiers are protected and are not simply public-domain marks.
5. Commercial/promotional use may require logo／employee clearances；media with identifiable persons may create privacy/publicity-right issues.

**Rights disposition**：

- `rights_status: UNKNOWN`
- `publication_hold: true`
- `direct MP4: confirmed public locator; not evidence of remix/commercial/social-publication permission`
- 最高風險是兩個 probed MP4 都有 AAC，SVS 又明列 Universal Production Music。是否能把該音樂連同 NASA 影片重剪並公開上架，本輪沒有 license evidence；不能以 NASA 的一般 media permission 補成 PASS。
- 未看 preview，片中 NASA logo、可辨識員工／承包商及其他第三方畫面範圍也維持 `UNKNOWN`。

## 6. G5 Visual/source fit evaluation

```yaml
gate_version: v0.1
candidate_id: roman-launch-2026-08-30
criterion: visual_source_fit
status: UNKNOWN
reason_code: VS_NO_60S_VISUAL_PREVIEW_EVIDENCE
fact_source_urls:
  - https://www.nasa.gov/news-release/nasas-dark-universe-seeking-nancy-grace-roman-space-telescope-launches/
official_footage_page: https://svs.gsfc.nasa.gov/15080/
alternate_official_footage_page: https://svs.gsfc.nasa.gov/15058/
footage_publisher: NASA's Goddard Space Flight Center
platform: direct_file
probe_status:
  asset_15080: yt-dlp_generic_metadata_exit_0_ffprobe_exit_0
  asset_15058_vertical: yt-dlp_generic_metadata_exit_0_ffprobe_exit_0
duration_seconds:
  asset_15080: 193.126271
  asset_15058_vertical: 74.941542
width:
  asset_15080: 1920
  asset_15058_vertical: 1080
height:
  asset_15080: 1080
  asset_15058_vertical: 1920
audio_status:
  asset_15080: AAC_48000Hz_stereo_present
  asset_15058_vertical: AAC_48000Hz_stereo_present
public_obtainability: CONFIRMED_ANONYMOUS_METADATA_AND_RANGE_ACCESS_ONLY
visual_mapping:
  - confirmed_page_description: Roman hardware, clean-room assembly and environmental testing in 15080
  - confirmed_page_description: components, completed observatory and transport to Kennedy in 15058
  - unknown: no downloaded preview, frame timestamps, ten six-second windows or final crop evidence
execution_risks:
  - neither probed asset is actual August 30 launch footage
  - 15080 landscape central-crop viability is unknown
  - 15058 vertical footage will be cropped vertically by the fixed near-square stage
  - 15058 has only 14.94 seconds beyond the 60-second target
  - both assets carry audio credited to Universal Production Music
  - full acquisition was not tested
rights_status: UNKNOWN
publication_hold: true
exception_code: null
```

**Why UNKNOWN, not FAIL**：兩支直接相關的官方影片候選存在，metadata、解析度、時長與音軌都可讀，尚無證據證明它們一定不適用。

**Why UNKNOWN, not PASS**：G5 明文要求 composition preview 足以支持 60 秒合理 preflight；本輪刻意不下載媒體，不能證明 visual mapping、crop 或十個窗口。公開 direct URL 與足夠秒數不能代替畫面驗證。

## 7. 主要 execution risks 與停止條件

1. **Publication blocker — music**：Universal Production Music reuse 未解。由於 harness 預設保留原聲，在取得明確授權／可用的無第三方音樂官方版本前，不能解除 publication hold。
2. **Event/footage mismatch**：15080、15058 都是 pre-launch；成片不得把它們稱為 8/30 實際升空影像。若故事必須以實際 launch motion 為主要 beat，需另行找到並 preflight 官方 launch asset，不能靠這兩支補述。
3. **60 秒 visual mapping gap**：只有 metadata 與頁面敘述，沒有 frame-level evidence。下一階段若獲准下載選定單一素材，才可依 harness 產 contact sheet、十段窗口與 final-crop snapshot。
4. **15058 duration margin**：74.94 秒雖大於 60 秒，但剪輯容錯窄；如果可用窗口不足，應觸發 SKILL 步驟 4 的條件式 gate，不可重複鏡頭硬撐。
5. **Remote mutability**：本輪沒有下載、hash 或本機 HTML freeze；第三人可用本文件命令重播目前 locator，但遠端內容未被不可變地封存。

## 8. 自檢

- [x] 只探測 2 個 direct asset：15080 1080p、15058 vertical NoTOS。
- [x] 每個 asset 都跑 `yt-dlp --skip-download` 與 `ffprobe`；command、exit、stdout、checked_at 均記錄。
- [x] 沒有下載媒體、沒有建立 run_dir、沒有 render、沒有改 production code／`bin`／`SKILL.md`／`ASSUMPTIONS.md`。
- [x] 分開列 confirmed／inferred／unknown，沒有把頁面文案或 duration 當成 frame-level preview。
- [x] 明確判定 15058 不是 15080 的直式版本。
- [x] 保存 NASA/SVS requested credit、full contributor credits、兩首第三方音樂與 media guideline 邊界。
- [x] `G5=UNKNOWN`、`rights_status=UNKNOWN`、`publication_hold=true`；沒有建立 Story Package 或聲稱 production authorization。
