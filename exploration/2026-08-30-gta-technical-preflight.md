# GTA VI 官方長影片技術 preflight

- artifact：`gta-technical-preflight`
- artifact 版本：`v0.1`
- 日期：`2026-08-30`
- session checked at：`2026-08-30T11:15:17Z`
- 範圍：remote metadata 與繁中 VTT 時間帶；不建立 run_dir、不下載完整 MP4、不抽幀、不 render
- ffprobe invocation count：`1`
- overall technical probe：`PASS`
- visual preview：`UNKNOWN`
- publication rights：`UNKNOWN`（技術可讀與公開 URL 不代表可重製／發布）

## 1. 輸入與證據邊界

| 項目 | 值 | 證據狀態 |
|---|---|---|
| 第一方 context page | `https://www.rockstargames.com/VI/an-extended-look` | 上游 dry-run 已記錄 |
| 官方 1080p MP4 | `https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4` | 本輪單次 ffprobe 直接讀取 |
| 官方繁中 VTT | `https://videos-rockstargames-com.akamaized.net/v4/rk721912/cap/zh-hant.vtt` | 本輪 HTTP GET 文字檔直接讀取 |
| HTTP HEAD size | `1,980,545,083 bytes` | 呼叫方提供；本輪未重送 HEAD |
| HTTP HEAD ranges | `accept-ranges` | 呼叫方提供；本輪未重送 HEAD |
| VTT bytes | `30,850` | 本輪 in-memory 讀取 |
| VTT SHA-256 | `700ded6254683e34edd16fba079d1202cd8477d190ddba29e329777e2c2e2931` | 本輪 in-memory 計算 |
| VTT cue count | `461` | 本輪 parser 計算 |

呼叫方提供的 HEAD 結果不冒充本輪 command output。除下列 ffprobe 與 VTT GET 外，本輪沒有對 MP4 執行其他 probe，也沒有把遠端 media 寫入磁碟。

## 2. 唯一一次 ffprobe：command、exit、完整結果

### Command

```bash
OMP_THREAD_LIMIT=1 nice -n 19 ffprobe -v error -rw_timeout 60000000 \
  -show_entries format=duration:stream=index,codec_type,codec_name,width,height,r_frame_rate,avg_frame_rate,channels,sample_rate \
  -of json \
  'https://videos-rockstargames-com.akamaized.net/v4/rk721912/flv/en-us-1080p.mp4'
```

- execution location：目前可見 pane
- exit status：`0`
- stderr：空（`-v error` 未回報 error）

### 完整 stdout

```json
{
    "programs": [

    ],
    "stream_groups": [

    ],
    "streams": [
        {
            "index": 0,
            "codec_name": "h264",
            "codec_type": "video",
            "width": 1920,
            "height": 1080,
            "r_frame_rate": "30/1",
            "avg_frame_rate": "30/1"
        },
        {
            "index": 1,
            "codec_name": "aac",
            "codec_type": "audio",
            "sample_rate": "48000",
            "channels": 2,
            "r_frame_rate": "0/0",
            "avg_frame_rate": "0/0"
        },
        {
            "index": 2,
            "codec_type": "data",
            "r_frame_rate": "0/0",
            "avg_frame_rate": "15360/512"
        }
    ],
    "format": {
        "duration": "1608.066667"
    }
}
```

## 3. 可直接重算的 technical summary

| 欄位 | ffprobe 結果 | 判定 |
|---|---|---|
| duration | `1608.066667 s`（約 `26:48.067`） | `PASS`：遠高於 60 秒算術需求 |
| video codec | `h264` | `PASS` |
| width × height | `1920 × 1080` | `PASS`：官方 1080p stream |
| video fps | `r_frame_rate=30/1`、`avg_frame_rate=30/1` | `PASS`：30 fps |
| audio codec | `aac` | `PASS` |
| audio channels | `2` | `PASS`：stereo |
| audio sample rate | `48000 Hz` | `PASS` |
| extra stream | index 2，`codec_type=data` | 記錄但不作影音可用性依據 |

若日後寫入 harness `candidates.json`，此 URL 的 `platform` 可標 `direct_file`；但 schema 的 `duration_seconds`／`width`／`height` 定義是 **yt-dlp metadata**，本輪沒有跑 yt-dlp，因此那些 schema 欄位不能偷填 ffprobe 實測值。上述實測值應另存 technical evidence／`blocked_reason` 並在 GATE 1 出示。

本輪只證明 remote header 可由 ffprobe 解析，以及時長／影音 stream 規格符合後續 preflight 的最低機械條件；不證明整檔下載成功、不證明中央裁切、不證明十段畫面可用，也不證明 publication rights。

## 4. VTT 讀取紀錄

### Command

```bash
OMP_THREAD_LIMIT=1 nice -n 19 curl -fsSL --max-time 60 \
  'https://videos-rockstargames-com.akamaized.net/v4/rk721912/cap/zh-hant.vtt' \
| OMP_THREAD_LIMIT=1 nice -n 19 python3 <in-memory VTT parser>
```

- exit status：`0`
- response bytes：`30,850`
- SHA-256：`700ded6254683e34edd16fba079d1202cd8477d190ddba29e329777e2c2e2931`
- parsed cues：`461`
- parser 行為：讀 WebVTT timestamp、移除 markup、保留繁中 cue text；不寫本機 VTT 檔

VTT 只能支持「該時間帶的對白／敘事功能」；它不能證明鏡頭內容、構圖、是否為文字卡、是否有燒錄字幕、是否能承受 16:9→素材區中央裁切。所以下列每一筆的 `visual_preview_status` 都是 `UNKNOWN`。

## 5. 候選 6 秒窗口

選法：只用已取得的繁中 VTT cue 時間與文字，挑出互不重疊、分布於整支 26 分鐘影片、具有不同敘事功能的 16 個窗口。每筆長度精確 6 秒；任取十筆在算術上可組成 60 秒，但在實際抽幀前，**沒有任何一筆可升為 visual PASS，也尚未選定最終十筆**。

| ID | 6 秒窗口 | 命中 VTT 時間／文字摘要 | VTT 支持的敘事意義 | 畫面假設與狀態 |
|---|---|---|---|---|
| `W01` | `00:00:07.500–00:00:13.500` | `00:00:07.566`「他們知道我們來了」；`00:00:09.533`「到了，就是這地方」 | 開場即建立傑森／露西亞進入高風險地點的任務情境 | 可能是抵達／潛入建立鏡頭；`visual_preview_status=UNKNOWN` |
| `W02` | `00:03:32.500–00:03:38.500` | `00:03:32.500`「特遣隊…正在過去」；`00:03:34.500` 要求配合 | 從交易升級成執法突襲，展現任務即時轉折 | 可能有電話、角色反應或警力逼近；`UNKNOWN` |
| `W03` | `00:04:22.000–00:04:28.000` | `00:04:22.400`「得想辦法出去」；`00:04:25.600`「得想辦法脫身」 | 逃脫目標明確，適合作為動作／任務系統段落 | 可能是掩體、移動或交火；VTT 無法證明；`UNKNOWN` |
| `W04` | `00:06:24.000–00:06:30.000` | `00:06:24.566` 問候；`00:06:25.633` 買衣服；`00:06:27.666` 自己能買 | 從槍戰切到伴侶日常，支持角色關係與生活層次 | 可能是室內互動／服裝展示；`UNKNOWN` |
| `W05` | `00:07:34.500–00:07:40.500` | `00:07:34.566`「遼闊的野外」；`00:07:38.433`「無限可能」 | 遊戲內廣告／旁白式世界觀，支持雷歐奈達環境與諷刺調性 | 可能是自然景觀、廣告或 montage；是否純文字卡未知；`UNKNOWN` |
| `W06` | `00:08:24.000–00:08:30.000` | `00:08:24.500` 布萊恩幫忙、需要介紹；`00:08:27.766`「我知道」 | 把兩人當前麻煩與新關係網連起來，適合作為故事 stakes | 可能是駕車對話；視覺動態與中央構圖未知；`UNKNOWN` |
| `W07` | `00:11:44.000–00:11:50.000` | `00:11:44.000`「警察把誰趕來了」；`00:11:47.500`「當地人很剽悍」；`00:11:48.833`「這裡是雷歐奈達」 | 直接命名地區並呈現地方性格，可支撐世界觀一句 | 可能交錯警察／當地人／環境；實際畫面未知；`UNKNOWN` |
| `W08` | `00:12:54.000–00:13:00.000` | `00:12:54.066` 問怎麼辦；`00:12:56.300`「慢慢來」 | 顯示玩家角色對風險與新合作對象的策略判斷 | 可能為車內對話或任務過場；`UNKNOWN` |
| `W09` | `00:13:41.000–00:13:47.000` | `00:13:41.033` 西語催促；「讓我瞧瞧你開車的能耐」 | 明確進入駕駛／追逐能力展示，是 gameplay 候選節點 | 可能為車輛追逐，但未抽幀前不得稱為 gameplay visual PASS；`UNKNOWN` |
| `W10` | `00:14:54.000–00:15:00.000` | `00:14:54.400` 計畫不會照走；`00:14:59.033`「總會有某種鳥事」 | 表達任務系統的變數與即興應對，也建立露西亞能力測試 | 可能仍在逃逸或停車對話；動作強度未知；`UNKNOWN` |
| `W11` | `00:16:39.500–00:16:45.500` | `00:16:39.966`「不錯的開始」；`00:16:43.666`「手機記得開著」 | 第一段任務後形成新合作線，可作章節轉場 | 可能是任務收尾／角色離場；`UNKNOWN` |
| `W12` | `00:18:19.000–00:18:25.000` | `00:18:19.800`「聊天室！我該怎麼做？」；`00:18:24.000`「快看」 | 支持遊戲內直播／社群文化與警察追逐被觀看的世界細節 | 可能包含手機直播 UI、車輛或追逐；UI 裁切風險未知；`UNKNOWN` |
| `W13` | `00:19:21.000–00:19:27.000` | `00:19:21.166`「我們得工作」；`00:19:24.733` 指定保護目標 | 清楚呈現另一種任務類型：派對中的人物保護 | 可能是私人飛機／聚會 briefing；`UNKNOWN` |
| `W14` | `00:23:14.000–00:23:20.000` | `00:23:14.100`「派對結束」；`00:23:16.366` 要所有人趴下 | 從企業活動瞬間切入武裝事件，提供強烈節奏轉折 | 可能是宴會突襲；人物位置、暴力內容與裁切未知；`UNKNOWN` |
| `W15` | `00:24:15.000–00:24:21.000` | `00:24:15.466`「聲東擊西」；`00:24:18.166`「我要上樓」 | 顯示傑森／露西亞分工與任務空間轉換 | 可能有爆炸後移動、樓層切換；`UNKNOWN` |
| `W16` | `00:25:47.000–00:25:53.000` | `00:25:47.433`「最光輝的日子」；`00:25:52.133`「最無憂無慮的歲月」 | 尾段反思與伏筆，可作成片收束而非單純動作堆疊 | 可能是角色近景或 montage；是否有足夠視覺資訊未知；`UNKNOWN` |

### Machine-readable window list

```text
W01	00:00:07.500	00:00:13.500	6.000
W02	00:03:32.500	00:03:38.500	6.000
W03	00:04:22.000	00:04:28.000	6.000
W04	00:06:24.000	00:06:30.000	6.000
W05	00:07:34.500	00:07:40.500	6.000
W06	00:08:24.000	00:08:30.000	6.000
W07	00:11:44.000	00:11:50.000	6.000
W08	00:12:54.000	00:13:00.000	6.000
W09	00:13:41.000	00:13:47.000	6.000
W10	00:14:54.000	00:15:00.000	6.000
W11	00:16:39.500	00:16:45.500	6.000
W12	00:18:19.000	00:18:25.000	6.000
W13	00:19:21.000	00:19:27.000	6.000
W14	00:23:14.000	00:23:20.000	6.000
W15	00:24:15.000	00:24:21.000	6.000
W16	00:25:47.000	00:25:53.000	6.000
```

## 6. Preflight disposition

- `duration_fit=PASS`：16 個互不重疊候選，每個 6 秒；算術上有 96 秒候選容量，至少可供十段／60 秒篩選。
- `video_stream=PASS`：H.264、1920×1080、30 fps。
- `audio_stream=PASS`：AAC、2 channels、48 kHz。
- `remote_header_probe=PASS`：唯一一次 ffprobe exit 0。
- `vtt_timing_fit=PASS`：461 cues 可提供分散於全片的敘事時間帶。
- `visual_preview=UNKNOWN`：本輪沒有抽幀或觀看上述窗口，不知道主體位置、純文字卡、UI、英文燒錄字幕、暴力內容、轉場或中央裁切結果。
- `full_download=NOT_RUN`：未驗完整 1.98 GB transfer 或 checksum。
- `publication_rights=UNKNOWN`：不得由 direct URL、HEAD、range support 或 ffprobe 成功推論。
- `render=NOT_RUN`。

下一個技術動作若獲另行授權，應只對候選窗口做每批最多五項的 range／frame visual preview，再依中央裁切與完整六秒內容決定十個最終窗口；本 artifact 本身不授權該步驟。
