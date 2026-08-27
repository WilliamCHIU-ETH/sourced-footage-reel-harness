# 假設

## 工具

| 工具 | 用途 | 驗證 |
|---|---|---|
| `yt-dlp` | 下載素材 | `yt-dlp --version`（實測可用版本 2026.7.4） |
| `ffmpeg` / `ffprobe` | 抽幀、音軌正規化、成片驗證、**遠端讀素材規格**（步驟 2） | `ffmpeg -version` |
| `npx` + `hyperframes` CLI | lint / check / snapshot / render | 專案 `package.json` 會釘版；實測 0.8.3 |
| 中文字型檔（.ttf） | 字幕與大標 | 檔案存在即可，路徑走輸入 |
| `bash` | 執行 `bin/` | **這台 `/bin/bash` 是 3.2.57**，不可用 bash 4+ 語法（`${v,,}`、`declare -A`、`mapfile`）。改 script 後用 `/bin/bash <script>` 實測缺參數路徑，不要只跑 happy path |
| 品牌 logo（.png） | 頂部品牌帶 | 同上 |

可選：ego-browser（讀企業影片頁的 DOM 取平台識別碼）、Groq API key（判斷素材音軌是人聲或音樂，key 放 `~/.groq_key`）。兩者都不需要人工授權即可使用。

## 環境限制（不知道會走死路）

1. **這台機器的 `ffmpeg` 沒有 `drawtext` 也沒有 `subtitles`／`ass` filter**（未編 libfreetype／libass）。所有文字**必須**由 HyperFrames 的 HTML 渲染，不能用 ffmpeg 燒字。
2. **YouTube 匿名下載已失效**。三種格式全部 HTTP 403，固定在 41.5% 中斷；裝 `yt-dlp-ejs` 並指定 node runtime 也無效（需要 PO Token）。**不要在這條路上耗時間。**
3. **廠商官網的影片頁多半用企業影片平台**（Brightcove／Vimeo／Wistia），`yt-dlp` 原生支援。從頁面公開 DOM 屬性讀出識別碼即可下載，不需要 cookie、不需要攔截串流。實測可取得 1080p。
4. **企業 newsroom 的 media asset 庫可免登入下載，但內容多是靜態照片**，沒有影片 b-roll。不要期待那裡有動態素材。
5. **`hyperframes check` 不檢查成片有沒有聲音。** 沒有 `<audio>` 元素會靜默通過。有聲無聲必須自己驗（VERIFY.md 有指令）。
6. **composition 從 `cdn.jsdelivr.net` 載 gsap，所以 render 需要對外網路。** 離線環境要先把 gsap 下載到 `assets/` 並改模板的 `<script src>`。
7. **素材幀率通常不等於輸出幀率。** 廠商影片常是 23.976 或 25 fps，輸出是 30 fps，HyperFrames render 時會重取樣。這不是阻斷問題，但要列進 GATE 2 的已知落差告訴使用者。
8. **HyperFrames 版本必須釘定。** `bin/init-project.sh` 會把版本寫進專案 `package.json`（預設 0.8.3，可用 `--hf-version` 覆寫），之後每次 npx 都要帶那個版本。下面的「必踩規則」是在 0.8.3 實測的，換版必須重跑一次 VERIFY.md 全部項目——本機 npx 快取常同時存在多個版本，不帶版本號會解析到最新版。
9. **有些廠商官網的直鏈媒體檔擋 `yt-dlp` 與 `curl`（Cloudflare anti-bot）。** 症狀是 `ERROR: [generic] Got HTTP Error 403 caused by Cloudflare anti-bot challenge`，`curl` 同樣 403，但**同一個 URL 用 `ffprobe` 讀得到**、`yt-dlp` 加 `--extractor-args "generic:impersonate"` 也解析得到。**不要因此把素材判成不可用**——`bin/prep-footage.sh` 下載失敗時會自動帶這個參數重試一次。impersonate 靠 `curl_cffi`（實測 0.14.0，提供 Chrome-133/136 與 Safari 目標），缺了整個重試會失效，用 `yt-dlp --list-impersonate-targets` 確認。這與環境限制 2 的 YouTube 是不同的失敗：那個沒有繞道，這個有。

## HyperFrames 的必踩規則（實測 0.8.3）

- 每個 `<video>` / `<audio>` 都要唯一 `id`。video 缺 id → render 時畫面凍結；audio 缺 id → 混音器忽略它 → 整支靜音。
- 實測 0.8.3 的 lint 要求 `window.__timelines = window.__timelines || {};`，即使 skill 文件說不需要。照 CLI 走。
- 只宣告有 `@font-face` 的字型。CSS fallback 寫了未宣告的系統字型會被 lint 判 error。
- `<video>` 不能有 `crossorigin`；`<video data-start>` 不能有同樣帶 `data-start` 的祖先元素。

## 憑證

無必要憑證。Groq key 若存在則讀 `~/.groq_key`（600），只用於判斷素材音軌內容，缺了不影響主流程。

## 目錄

harness 執行時**不寫入自己**。所有輸出去輸入指定的 `run_dir`。素材檔會複製進 `<run_dir>/project/assets/`——HyperFrames 專案外的相對路徑不可靠。

## 知識假設

以下是做決定時用到、但沒寫在任何規格文件裡的常識：

1. **素材原始響度通常遠低於發布標準**（實測 -30.9 LUFS，社群平台約 -16 LUFS），而真實峰值往往已接近 0 dBTP。所以**不能直接加增益**，必須走 `loudnorm` 二階段讓限幅器處理，否則削波。
2. **16:9 素材填進接近 1:1 的框會裁掉 40% 寬度**。這不是設定問題，是幾何必然，所以選鏡時主體必須在中央。參考對象的素材全是特寫與中央構圖，是版面逼出來的結果，不是美學偏好。
3. **同一個帳號的不同版面做法可以完全相反**（有的自製旁白、有的保留原聲）。任何「這個帳號都是⋯⋯」的結論都要跨版面取樣才成立，單一樣本會導致整條管線走錯。
4. **中小型個股沒有官方影片素材，國際大廠的旗艦技術才有。** 搜尋要用技術名稱與產品代號，用股票名稱只會搜到財經節目與投顧頻道——那些是同業內容。
5. **字幕與畫面的語意對應比時間精度重要。** 素材原聲與自寫字幕不同步是可接受的取捨；硬切切斷語句同樣可接受。要消除後者就得讓素材的語音句界決定剪點，那會讓素材主導敘事順序。
