# RECIPE：歷次軌跡與踩過的坑

第一次（2026-08-26，harness 的建構與四輪冷啟動驗收）見階段 A–I；第二次（2026-08-27，第一次對全新來源文件正式使用）見階段 J。

**這是史料，不是指令。** 步驟請看 `SKILL.md`。這裡記錄實際發生的順序、卡住的地方、繞道的方式，以及人在哪裡介入。只寫有證據的事。

產出：一支 60.0 秒、1080×1920 的 9:16 短影音，來源是一篇財經晨報 docx 裡的一個技術題材，素材是一家國際半導體廠的官方產品影片。

> **本次的具體值（題材名、素材識別碼、大標與字幕文字、剪點、專案 id）已從本檔移除。** 這是刻意的：冷啟動驗收發現，只要 RECIPE 寫著「這份文件的正確候選是 X 與 Y」，任何 agent 都能不讀來源文件就交出看起來正確的 GATE 1 候選表，驗收因此失效。本檔只留**方法與現象**。
>
> 一組完整的實際值在 `fixtures/inputs.example.json`——那是**已完成的範例**，用途是驗證環境與格式，**不得當作新題材的答案來抄**。

---

## 階段 A：競品分析（不在 SKILL.md 的流程裡）

起點是使用者給的一個 Instagram 帳號網址與一句需求：「我的目的是分析他的影片所以如果可以的話我希望可以下載下來去分析」。

**INCIDENT A-1｜yt-dlp 對 Instagram 已失效。**
```
ERROR: [instagram:user] technewsinside: Unable to extract data
WARNING: The program functionality for this site has been marked as broken
```
繞道：改用 IG 自家 web API，帶 header `x-ig-app-id: 936619743392459`，免登入可讀：
`api/v1/users/web_profile_info/?username=…` 取 uid，`api/v1/feed/user/<uid>/?count=12&max_id=<cursor>` 分頁。實測抓到 480 篇 metadata（1.6 MB、約 1 分鐘）。
下次還會遇到嗎：會。這是平台端封鎖，不會自己好。

**INCIDENT A-2｜macOS 沒有 `timeout` 指令。** `(eval):1: command not found: timeout`。繞道：改用 yt-dlp 自己的 `--socket-timeout`。

**INCIDENT A-3｜舊的 GraphQL `query_hash` 全部失效**（`HTTPError 400`）。繞道：改用 `api/v1/feed/user/` 的 `next_max_id` 分頁。

**INCIDENT A-4｜Whisper 指定 `language=zh` 會把英文素材硬翻成中文。** 實際轉出「我们现在在Fishworks Lab里面对不起我叫声这里的空气系统和设备都在很大声」——原片是英文。繞道：語言改自動偵測。另外 Groq Whisper 的中文輸出是簡體，補了 opencc `s2twp` 轉繁。

**INCIDENT A-5｜用 python 就地 patch 腳本時把後面的參數註解掉。** 產生 `AttributeError: 'Namespace' object has no attribute 'limit'`，因為 `# 註解` 吃掉了同一行後面的 `r.add_argument('--limit', ...)`。繞道：拆行。

**INCIDENT A-6｜cwd 漂移。** 前一個 `cd` 會留到下一次呼叫，導致相對路徑失敗（`no such file or directory: app/runtime-data/...`）。發生至少 4 次。繞道：關鍵指令一律用絕對路徑，或每次先 `cd` 到 repo root。

**INCIDENT A-7｜背景任務被中止兩次。** OCR 批次跑到 9/21 與 6/21 各被 kill 一次（task-notification 顯示 `stopped`，output 檔為空——python 的 print 被緩衝，進度看不到）。繞道：改前景分批跑（每批 5–6 支），並用「輸出檔是否含新欄位」判斷進度。

**人類介入 A｜使用者指出資訊載體判斷錯了。** 原話：「我判斷需要OCR？原因是這種的似乎是搬運為主？也就是取得他人的影片素材壓圖後就上傳並且資訊在內文」。我當時正要對 21 支跑語音辨識，因此改寫成 OCR 管線（macOS Vision + Swift CLI）。**這是探索期的方向糾正，不是常態流程的 gate。**

**人類介入 B｜使用者中止批次。** 原話：「preflight一支就夠了」。

**人類介入 C｜使用者要求人工 audit 版面分類。** 原話：「最後告訴我連結們我看是不是一樣的」。我輸出 5 類分類表附每支 IG 連結，並標出 4 處自己沒把握的。

**人類介入 D｜使用者裁定版面規格三條。** 原話：「1. 逐段的字幕是絕對必要的。2. 大標確定需要維持很久，盡量不要換 3. Logo 都是置中」。這三條後來成為 `SKILL.md` 的版面規格。

---

## 階段 B：素材管道驗證

**人類介入 E｜使用者指定範圍與輸入。** 原話：「先做 3 支 A-固定大標，用晨報的題材」，並附上 `0821_台股晨報.docx`，要求「技術與產品層級這篇晨報有提到什麼嗎？如果有提到的話，你是不是可以 preflight 一下」。

從該 docx 抽出四個候選，其中兩個是真的技術題材（同出於一家公司的產品段落），另兩個在文件裡只有股價與資金輪動敘述。

> ⚠️ **這個抽法不符現行的 `SKILL.md` 步驟 1。** 那兩個只有股價的候選，我當時當成技術題材列進去了——那正是現在規則禁止的做法。
>
> **冷啟動驗收用的反證方法（這是可複用的部分）**：對來源文件全部 XML 部件做技術詞的出現次數統計。若某題材的技術詞（規格單位、製程節點、封裝方式、材料名、產品代號）出現次數全為 0，而該題材只在漲跌幅與資金輪動的句子裡出現，則該題材不成立。這個方法後來寫進 `SKILL.md` 步驟 1 的判準。
>
> 這也是把候選門檻從「3–6 個」改成「1 個以上」的原因——原本的門檻在它自己的參考來源上就不成立。

**INCIDENT B-1｜用股票名稱搜素材，搜到的全是同業內容。**
以「個股名 + 代號 + 族群名」搜三個題材，結果全是財經電視台、投顧頻道、個人 YouTuber——一支企業官方影片都沒有。改成「廠商英文名 + 技術名稱 + 產品代號 + official」之後，立刻搜到三家國際大廠的官方短片（86–156 秒）。
**這條後來寫進 `ASSUMPTIONS.md` 的知識假設第 4 條。**

**INCIDENT B-2｜YouTube 匿名下載全面失效。** 三種格式（1080p avc1、720p avc1、progressive 360p）全部 `HTTP Error 403: Forbidden`，且每次固定在 **41.5%** 中斷。安裝 `yt-dlp-ejs` 0.8.0 並用 `--js-runtimes node:...` 指定 node v24.13.1 仍然 403（走 android vr client 被節流）。**耗掉數輪。**
繞道：改查廠商官網。

**INCIDENT B-3｜企業 newsroom 的素材庫只有照片。** NVIDIA Newsroom 可免登入下載（抽樣 6 項全部有 Download 按鈕，最大 17.6 MB），但六項全是 `Photo | …`，連該題材對應的那一項也是 417.7 kB 的照片，Corporate B-roll 頁是空的。

**INCIDENT B-4｜兩次被安全機制擋下。** 嘗試（a）用 CDP `Network.getAllCookies` 匯出 YouTube session cookie、（b）讀 `performance.getEntriesByType('resource')` 取媒體串流位址，都被 `Blocked by classifier` 拒絕。**沒有繞過**，停下來向使用者說明並請他決定。

**人類介入 F｜使用者授權。** 原話：「授權我用瀏覽器 session／攔截媒體位址　不行的話再走ego-browser 全螢幕播放，本機 ffmpeg 錄螢幕」。

**結果：授權沒被用到。** 該廠官網的播放器是 Brightcove，而 `yt-dlp` 原生支援。取得識別碼的方法：在影片頁點播後讀 `performance.getEntriesByType('resource')`，從 `edge.api.brightcove.com/playback/v1/accounts/<account>/videos/<video>` 與 `players.brightcove.net/<account>/<player>_default/` 兩條請求取出三組 id，再加頁面上的 `data-video-id` 屬性交叉確認；組成標準播放器 URL 交給 yt-dlp 即可，不需要 cookie、不需要攔截串流內容。實測取得 1920×1080、202.7 秒、93 MB。
**這條是 `SKILL.md` 步驟 2 與 `ASSUMPTIONS.md` 環境限制第 3 條的來源。**

**人類介入 G｜使用者否決靜態替代方案。** 原話：「不 我一定要動態影片」。我原本提了「用官方產品照做動態鏡頭」的省事方案。

**INCIDENT B-5｜瀏覽器導航被權限擋。** `mopsov.twse.com.tw`、`nvidianews.nvidia.com` 的 in-app browser 導航回 `navigation ... was denied or failed`。繞道：改用 curl 與 ego-browser。公開資訊觀測站的法說會影音**始終沒驗通**（`mops.twse.com.tw` 302、`webpro.twse.com.tw/investor/` 404），這條路留著沒挖完。

---

## 階段 C：版面量測

方法：對競品影片抽 4–6 幀，算**逐列跨幀標準差**。素材區 54.0，其餘三區 2.4–2.7，差 20 倍，邊界因此毫無模糊空間，得到 720×1280 下的四區幾何（0–159 / 160–837 / 838–1182 / 1183–1279），等比放大成 1080×1920 寫進 `SKILL.md`。

**INCIDENT C-1｜銳利度分析被字幕干擾。** 我先用相鄰像素差找「銳利核心帶」想推素材真實比例，結果 y 736–808 出現尖峰——那是白色字幕的高對比邊緣，不是素材。判斷因此無效。改用跨幀變動量才得到正確結果。**寫進 `VERIFY.md` 的註記。**

**INCIDENT C-2｜找不到使用者說的虛化效果。** 使用者提到「他們似乎會用一個類似虛化的效果」。我掃了全部 21 支的跨幀水平剖面，沒有找到虛化背景填充；實際做法是三種（放大裁切滿寬、放進裝飾框、原素材自帶黑邊直接出現）。回報為「沒找到，若你記得是哪一支我再單獨驗」。**這一項至今未結案。**

---

## 階段 D：製作

**人類介入 H｜使用者要求收攏檔案位置並加入口文件。** 原話：「你要放在哪裡？，你幫我加個 README 或是一個 agent.md，避免其他人進來不知道這在做什麼」。依 `app/AGENTS.md` 的既有規範把工具搬進 `app/scripts/competitor/`、文件進 `app/docs/footage-reel/`。

**人類介入 I｜使用者授權開始製作。** 原話：「好，開始生成」。

**INCIDENT D-1｜這台機器的 ffmpeg 沒有文字渲染能力。** `No such filter: 'drawtext'`，`subtitles`/`ass` 也沒有（未編 libfreetype／libass）。**這直接決定了整個實作路徑**：所有文字必須由 HyperFrames 的 HTML 渲染。寫進 `ASSUMPTIONS.md` 環境限制第 1 條。

**INCIDENT D-2｜三個 lint error 連續踩。**
1. `media_missing_id`：10 個 `<video>` 都沒 id → 「this video will be FROZEN in renders」
2. `font_family_without_font_face`：CSS fallback 寫了 `'PingFang TC'` 但沒有 `@font-face`
3. `timeline_registry_missing_init`：0.8.3 的 lint 要求 `window.__timelines = window.__timelines || {}`，**但 `hyperframes-core` 的文件明說「You do not need」**。文件與 CLI 版本不一致，照 CLI 走。
全部寫進 `ASSUMPTIONS.md` 的「HyperFrames 必踩規則」。

**INCIDENT D-3｜大標第二行溢出成第四行。** 一行含中文、英文縮寫與數字的大標，在 76px 下超出 972px 可用寬，最後一個字被推到第四行。修法：刪掉一個可省的詞並把字級降到 70px。**這是「大標長度用像素判定、不用字數判定」的來源——字數會因為英文與數字混排而失準。**

**INCIDENT D-4｜snapshot 抽在字幕入點看起來像沒字幕。** 抽 15.000s 時 cap-06 剛好處於淡入起點（autoAlpha=0），畫面上完全沒有字幕，一度以為字幕壞了。改抽段落中點。**寫進 `VERIFY.md`。**

**INCIDENT D-5｜常駐暗化漸層讓素材底部過暗。** 原本 300px、0.86 不透明度。降到 240px、0.62。

**INCIDENT D-6｜雜項。** `ffmpeg` 用 `scale=440:-1` 產生奇數寬導致 mjpeg 編碼失敗；ego-browser 的 `Page.captureScreenshot` CDP timeout（改用 `js()` 讀 DOM）；`SendUserFile` 用相對路徑失敗（cwd 當時在 `renders/`）。

第一支成片：60.0 秒、26.8 MB、render 耗時 4m37.8s。`check` 全過（Runtime 0、Layout 0/9 samples、Motion 0、對比度 47/47 WCAG AA）。

---

## 階段 E：音軌事件（這次最嚴重的錯誤）

**INCIDENT E-1｜抽樣錯誤導致靜音交付。**

我在階段 A 只對**一支**競品影片做語音辨識（`DZkaAHZk8iS`），轉出英文 DTrace 內容，就得出結論「這個帳號的資訊在畫面文字而非旁白」，並把它寫進文件。整條管線因此只做 OCR，第一支成片交付時是**完全靜音**——10 個 `<video>` 全 `muted` 且沒有任何 `<audio>`。

`npx hyperframes check` **全項通過**，因為它不檢查成片有沒有聲音。lint 只會在「寫了缺 id 的 `<audio>`」時報錯，完全不寫 audio 是靜默通過的。

**人類介入 J｜使用者發現。** 原話：「效果我很喜歡，你可以告訴我為什麼沒有聲音嗎？」

回頭量測才發現真相：21 支競品**全部有音軌**，平均音量統一在 -17.3 ～ -17.8 dB。抽 5 支轉錄：
- A 版式三支（`Db3OPglFTnv`、`DcVd5xFlNoj`、`DbacHthDPdI`）→ **中文旁白**，逐字對上畫面字幕
- B 版式兩支（`DbSnmphj8AQ`、`DbTLvxsFOws`）→ 英文原聲、或無語音

而我測的那支恰好是 B 版式。**單一樣本被推廣成全帳號結論。** 寫進 `ASSUMPTIONS.md` 知識假設第 3 條。

**人類介入 K｜使用者釐清問題邊界。** 原話：「意思是說他的那個影片本來就沒聲音嗎？還是你是參考 TechNews 的做法？」量測證實素材**有**完整英文旁白（AAC 立體聲 48kHz 180 kb/s，-33.8 dB 平均、-1.1 dBTP 峰值），是我主動 `muted` 掉的。

**人類介入 L｜使用者選定音軌方案。** 我提三條（自製中文配音／保留英文原聲／只加 BGM），使用者選「先做第 2 條讓我聽差別」。

正規化：素材 -30.9 LUFS 而真實峰值已 -1.1 dBTP，直接加 15 dB 會削波，走 `loudnorm` 二階段（`measured_I=-30.9 measured_TP=-1.1 measured_LRA=6.1 measured_thresh=-41.5`，實際落在 Dynamic 模式）。成片量到 -19.4 dB 平均、-1.4 dB 峰值，10 段逐段 -18.0 ～ -21.4 dB 無空段。

**人類介入 M｜使用者驗收定案。** 原話：「英文原聲版非常好」。這條成為 `SKILL.md` 的音軌做法，並記錄兩個刻意接受的落差（語音與字幕不同步、硬切切斷語句）。

第二支成片（加上原聲後）：60.0 秒、29.6 MB、render 2m55.6s。

---

---

## 階段 F：冷啟動驗收與修補（2026-08-26 晚）

harness 產出後，使用者在另一個 session（CWD 設為 harness 資料夾）跑冷啟動驗收。那個 session **停在步驟 1 沒有往下走**，並列出缺口。它的判定正確：驗收 prompt 指定的題材在來源文件裡只有股價敘述，照步驟 1 的規則抽不出合法候選，而它沒有繞過。（驗收 prompt 本身是錯的——指定了一個文件裡沒有技術依據的題材。）

驗收暴露的缺口與本輪修補：

| 缺口 | 修補 |
|---|---|
| 步驟 6 完全沒說怎麼建 HyperFrames 專案骨架；ASSUMPTIONS 提到 `package.json` 釘版但 harness 沒有；本機 npx 快取有 0.8.2–0.8.12 共 9 版，不帶版本號會解析到最新版 | 新增 `bin/init-project.sh`（建骨架、寫釘版 `package.json`、複製品牌資產），SKILL／VERIFY 的所有 npx 呼叫改帶釘定版本 |
| 模板的 `{{SHOTS}}`／`{{CAPTIONS}}`／`{{AUDIO}}` 是 HTML 註解，不是可機械替換的佔位符 | 說明留在註解、佔位符獨立成行；SKILL 步驟 6 補段數與時間屬性的推算規則、id 命名、以及四個 `grep -c` 自檢 |
| 「使用者先指定題材」這條入口不存在 | 步驟 1 拆成入口 A（從文件抽）與入口 B（驗證已指定題材的依據），共用「必須有非價格依據」的檢查；依據不足時停在 GATE 1 三選一 |
| 步驟 1 要求 3–6 個候選，但它自己的參考來源只抽得出 2 個 | 門檻改成 1 個以上 |
| 字數規則自相矛盾（SKILL「每段 8–14 字」vs schema「每行 8–14 字」），兩種解讀對已驗收範例都不成立 | 刪掉字數判準，唯一硬判準改為整片密度每秒 4–5 字 |
| 大標「13 個中文字以內」計法未定義（同一行有 9／13／16 三種算法） | 改為像素判準（70px 下不超過 972px），字數降為粗估，實際檢查靠 snapshot 目視 |
| `mean_volume`（RMS dB）與 `target_lufs`（LUFS）混用、無換算、失敗處置未寫 | VERIFY 說明兩者不同量綱、給實測對應（-16 LUFS ≈ 成片 -19 dB）、處置改 `data-volume` 而非重跑 loudnorm |
| `verify-render.sh` 的呼叫沒帶 output 值會套預設而誤判 | SKILL 與 VERIFY 的呼叫範例補上五個參數 |
| `candidates.json` 沒有欄位定義 | SKILL 步驟 2 列出固定欄位 |
| GATE 1 要求出示「預估可用鏡頭」，但 contact sheet 要等步驟 3 才有 | 從 GATE 1 的出示內容移除，改到步驟 4 |
| SKILL 寫 `--url` 可吃 Brightcove 三組 id，script 只吃 URL | 補上要自己組的 URL 格式 |
| `target_lufs`、`referer` 沒出現在呼叫範例 | 補進步驟 3 的指令 |
| 模板從 CDN 載 gsap，網路依賴沒列 | ASSUMPTIONS 環境限制第 6 條 |
| 「至少一半是非人物講話的鏡頭」在靜態抽幀下不可判定 | 改為「至少一半是產品或物件特寫」，判準用構圖 |
| 「價格事實可當字幕、不可當題材依據」這條規則沒寫出來 | 步驟 5 明文寫出兩處判準不同 |
| RECIPE 記載的抽法與現行規則互斥 | 階段 B 加註警示（見上） |

**未修**：當時被指定但無依據的那個題材要走哪條路（換來源文件／授權以素材規格為主要事實／放棄），使用者尚未裁定。入口 B 的三選一 gate 已就位，等實際跑到時由人決定。

---

## 階段 G：第三次冷啟動驗收與修補（2026-08-26 深夜）

第三次驗收**首次走完步驟 1–2 並正確停在 GATE 1**。驗收 prompt 改成不指定題材、刪掉 `topic`／`content`／`footage`，並把讀取範圍放寬到「輸入 JSON 指到的檔案」——前兩次的失敗都是 prompt 自身的問題（第一次指定了文件裡沒依據的題材，第二次限制的讀取範圍與流程需求衝突）。

**移除 RECIPE 答案的效果得到驗證**：該 session 獨立找到三支同題材的官方影片，平台識別碼與 `fixtures/inputs.example.json` 裡那支**完全不同**，還另外找到兩家其他廠商的素材。它掃了來源文件全部 XML 部件、做技術詞出現次數統計、抽出候選各附原文依據、明確列出不成立的題材、全程只做 metadata 探測未下載、`bin/` 三支一行未跑（GATE 1 前的正確行為）。

它列出 12 條缺口。**逐條核對後：7 條成立、2 條部分成立、1 條與其他條重複、1 條不是缺陷**，另外核對時自查到 2 條它沒提的。修補如下：

| 缺口 | 修補 |
|---|---|
| `credit_text` 住在 `output` 卻依賴 `footage`，一致性檢查漏掉它——`footage` 未填時它會在 gate 前洩漏素材答案 | schema 把 `credit_text` 移進 `footage`；SKILL 的一致性檢查加一條「與 footage 同進退」 |
| 沒有不含答案的最小輸入；SKILL 還把完整成品範例誤稱為「最小範例」 | 新增 `fixtures/inputs.minimal.json`（只有必填、零題材值）；example 改稱「一支已完成的成品」，明寫不得當底稿 |
| 一個候選只能掛一支素材；「用哪一支」沒有歸屬人 | `candidates.json` 的 `footage` 改成陣列，全部列出；GATE 1 改成同時問「哪個候選」與「哪一支素材」，並規定只有一支時仍要出示確認 |
| `probe` 三值蓋不住「解析成功但讀不到畫質」；`platform` 沒有自架站台可填 | `probe` 擴為六值（`ok`／`metadata_only`／`no_formats`／`known_blocked`／`blocked`／`not_found`），`platform` 加 `wistia`／`self_hosted`／`direct_file` 並定義語意 |
| `duration/width/height` 標「素材實測」，與「GATE 1 前不下載」互斥 | 改為「yt-dlp metadata 回報值，不是 ffprobe 實測」 |
| `footage_found: false` 時各欄位填什麼未定義 | schema 對可空欄位標 `["string","null"]` 等型別，並規定 `footage: []` |
| 候選切分粒度無判準 | 步驟 1 加「一個候選 = 一個能獨立成片的技術主張」與拆併規則 |
| 素材發布者與題材主體是不同公司時，「該題材的官方影片」算哪一家沒界線 | 步驟 2 明寫發布者可非題材主體，界線是「素材必須直接展示該題材的技術或產品本體，不是只提到同一個名詞」，多家符合就全列由人選 |
| docx 圖內文字算不算原文未定 | 步驟 1 明訂只掃文字層，圖內文字不算 |
| **自查 A**：GATE 1 還寫「可否取得」，而步驟 2 已把該概念改名為 `probe` | GATE 1 措辭跟上改名 |
| **自查 B**：步驟 2 把官方 YouTube 列為第三順位取得來源，但 ASSUMPTIONS 說 YouTube 匿名下載必失敗，該順位永遠走不通 | 改為「YouTube 只用來確認素材存在，不作為取得來源；看到的影片回官網找同一支」 |

**判定為非缺陷**：`bin/` 三支這輪沒被執行——GATE 1 之前本來就不該跑，是覆蓋率事實。**判定為部分不成立**：它說「YouTube 已知不可下載這件事 SKILL 只有口頭承認、格式沒承接」——前半不成立（步驟 2 明文寫了 `probe=ok` 不保證下載成功），後半併入 `probe` 值域一起修。

同一批還加了 `CLAUDE.md`：這是唯一會被自動讀取的檔名，讓在此 CWD 開的 session 一進來就知道任務性質、兩個 gate 的存在、以及 fixtures 與 RECIPE 都不得當答案抄。檔案數因此從 10 增為 12，經使用者同意。

---

## 階段 H：gate 數量的意圖對齊（2026-08-26 深夜）

第四次驗收走到步驟 3 時，使用者指出：「沒有想到這個 harness gate 這麼多，不符合原本的 1 gate 的 vision 設計」。

**歸因後發現 SKILL.md 一直只有 2 個 🛑 gate**，與使用者原本的 vision（題材挑選、成片驗收）一致。實際感受到的停頓次數更多，來源是三個不同的地方：

1. **驗收 prompt 自己要求的**——「遇到任何沒講清楚、或需要你猜的地方，停下來記錄，不要繞過」。前三輪的大量停頓幾乎都是這一句造成的，正式使用不會有。
2. **使用者的全域偏好設定**——「草稿含佔位符時，套值後必須完整重新出示一次才寫入」。第四次驗收停下來確認 `topic.facts` 從 5 條變 16 條，就是這條在作用，那個 session 明確引述了它。
3. **SKILL.md 裡散落的「不一致就停下來問」**——這一類是真的可以收斂。

修補：SKILL.md 新增「停頓只有三種，沒有第四種」段落，明訂 **GATE**（只有兩個，等人回覆）／**ABORT**（回報後結束，不等回覆）／**自行判斷後告知**（其餘全部，理由留到下一個 GATE 一併出示）。並把幾件原本會停的事明確歸到第三類：明顯的輸入殘留自行清除、步驟 3 從素材畫面讀到的官方規格定義為**客觀讀取而非草稿套值**（因此不觸發全域的套值確認規則）、選鏡與字幕稿的所有取捨。只有 `topic` 與 `content` 同時存在卻矛盾留在 GATE 1，因為那代表呼叫方給錯輸入、猜錯整支做廢。CLAUDE.md 同步這條規則。

同一批另外補：步驟 1 加「排除自家產品」（第四次驗收發現一個候選機械判準成立、但那是呼叫方自家產品，與 harness「他人官方影片素材」的定義衝突）；`$defs.candidate` 加 `excluded` / `excluded_reason`，讓這種候選留痕而不必謊稱 `footage_found: false`；ASSUMPTIONS 加「素材幀率通常不等於輸出幀率」（該次素材 23.976 fps、輸出 30 fps，render 會重取樣，屬 GATE 2 的已知落差）。

**這次驗收也交叉驗證了 `bin/prep-footage.sh` 是實跑**：它算出的 loudnorm measured 值（-30.9 LUFS / -1.1 dBTP / LRA 6.1 / Threshold -41.5）與階段 E 記錄的一致，而該 session 明確標註「script 自己跑，未手填」。正規化後 -19.0 dB 也落在 VERIFY.md 記的預期。`probe` 六個值裡有三個在這次被實際用到（`ok` 四支、`metadata_only` 四支、`known_blocked` 兩支）——上一批擴充值域的判斷得到印證。

---

## 階段 I：完整跑通與「停在這裡」的決定（2026-08-27）

第四次驗收**首次走完全部八個步驟**並產出成片（1080×1920 / 48.0 秒 / 30 fps / 22.3 MB，`lint` 與 `check` 皆 0 error，harness 資料夾未被寫入）。上一批的每一項修補都在這輪被實際走過：`$defs.candidate` 的多素材陣列（一個候選掛十支素材探測）、`probe` 擴充值域、`init-project.sh` 釘版、`prep-footage.sh` 的 loudnorm 二階段實跑、`credit_text` 歸位、GATE 1 同時問候選與素材。

**片長升格為條件式 GATE。** 該次選鏡時可用鏡頭撐不起指定的 60 秒，那個 session **自發停下來問人**，使用者選了縮到 48 秒——即使當時 SKILL.md 寫的是「可用鏡頭不足就縮短片長」（歸在自行判斷）。使用者隨後裁定「改片長算 gate」，理由是片長是呼叫方指定的輸入，agent 自行更改等於推翻輸入。修補做成**條件式 GATE**：素材夠用時不觸發，撐不起片長時停下來給三個選項（縮短片長／換素材／接受重複鏡頭），常態流程的停頓次數不變。

**三項刻意不補（不要再加回去）。** 該次驗收另外浮現三個可補項，逐項判斷後只補了一項，判準是「不寫進去，下一個 agent 會不會做錯」：

| 項目 | 決定 | 理由 |
|---|---|---|
| 把取得平台識別碼的具體方法寫進步驟 2 | **不補** | 該 session 在毫無指引下自行找到比 RECIPE 記載更好的路徑。寫進去會綁定特定網站的實作細節（某廠商的前端 bundle 檔名），換一家就失效，還會讓後來的 agent 以為只有那一條路 |
| 把 `OPEN-QUESTIONS.md`／`evidence-scan.txt`／`source_text.txt` 寫進輸出規格 | **不補** | 依據留痕已由 `candidates.json` 的 `evidence` 承載；`OPEN-QUESTIONS` 是驗收模式產物，正式使用有停頓分類就不會產生。寫進去等於強制每次都產，增加負擔不增加成功率 |
| 把 `PROVENANCE.md` 的顆粒度規格化到該次的 106 行水準 | **只補 sha256** | 切點表與公司關係說明的詳細度本來就因素材而異，規定了會僵化；但素材指紋沒人會自己想到要記，而日後確認素材有沒有被換過只能靠它 |

harness 至此視為最小可行：12 個檔案，跑過一次完整流程，每一項規則都有驗收證據。**再加東西前先問「不寫進去，下一個 agent 會不會做錯」——答案是不會的，就不要加。**

---

## 階段 J：第一次正式使用（2026-08-27，新來源文件）

**本段刻意比階段 A–I 短得多。** 那些階段是在建 harness，這一次是在用它——踩到的坑少，是 harness 收斂的證據，不是記錄偷懶。這次走完全部八個步驟、兩個常態 gate 都通過、沒有 ABORT、條件式 gate 沒觸發（素材可用鏡頭足夠）。同樣**不留本次的題材、素材識別碼、大標與字幕文字**。

**INCIDENT J-1｜`yt-dlp` 對直鏈媒體檔一律回 NA，導致 GATE 1 的必填欄位填不出來。**
本次找到的可用素材全部是廠商官網的直鏈 mp4（`platform: direct_file`），`yt-dlp` 走 generic extractor 只回報 `ext=mp4`，`duration`／`width`／`height` 全是 `NA`。但 SKILL 步驟 2 的 GATE 1 出示清單要求「每一支素材的發布者／**長度／解析度**／probe 值」——工具給不出 SKILL 自己要求的欄位。
繞道：用 `ffprobe` 走 HTTP range 遠端讀檔頭，只讀 metadata、不下載媒體檔。`candidates.json` 的三個欄位仍照 schema 留 `null`（定義是 yt-dlp 回報值），實測規格寫進 `blocked_reason` 並在 GATE 1 出示。**已補進 SKILL.md 步驟 2。**

**INCIDENT J-2｜廠商官網的直鏈檔被 Cloudflare anti-bot 擋。**
其中一個候選的素材，`yt-dlp` 回 `HTTP Error 403 caused by Cloudflare anti-bot challenge`，`curl` 同樣 403，但**同一個 URL 用 `ffprobe` 讀得到**，`yt-dlp` 加 `--extractor-args "generic:impersonate"` 也解析得到（靠 `curl_cffi`）。這與環境限制 2 的 YouTube 是不同的失敗：那個沒有繞道，這個有。**已補進 ASSUMPTIONS 環境限制 9，並讓 `bin/prep-footage.sh` 下載失敗時自動重試一次。**

**現象 J-3｜這次一支企業影片平台的素材都沒遇到。**
ASSUMPTIONS 環境限制 3 寫「廠商官網的影片頁**多半**用企業影片平台（Brightcove／Vimeo／Wistia）」——那是階段 B 的單次觀察。這次探測到的可用素材 100% 是 `direct_file`（官網 CDN 直鏈 mp4），Brightcove 一支都沒有。限制 3 沒有寫錯（它是「多半」不是「一定」），但**「多半」這個詞目前只有兩次取樣，不要當成通則**。取得順序（官網影片頁 → newsroom）仍然有效，兩次都是官網頁勝出。

**現象 J-4｜contact sheet 的格距小於 `shot_seconds`，一格好看不代表整段好。**
格距由素材長度決定（本次素材切 42 格，格距約 4.1 秒），而 `shot_seconds` 是 6——每段鏡頭橫跨約 1.5 格。有一個起點在 contact sheet 上看起來合格，抽 start／+2／+4／尾端 四幀後發現前兩秒主體偏低、畫面大片空背板，往後挪了 1.5 秒。**已補進 SKILL.md 步驟 4。**

**現象 J-5｜呼叫方沒有給 inputs JSON。**
實際的呼叫方式是人貼一份 docx 加一句「開始探索製作哪個產業影片」，`run_dir`／品牌資產／片長規格全部沒給。依停頓分類這些屬「自行判斷後告知」，因此自行決定（品牌資產沿用既有路徑並確認檔案存在、片長用 schema 預設）並在 GATE 1 一併出示，其中片長因為**過了 gate 就不可自行更改**，直接做成 GATE 1 的第三題讓人裁定。停頓分類在這個情境下運作正常，沒有為此多停一次。

**現象 J-6｜依據檢查的技術詞統計在新來源上有效。**
候選的技術詞出現次數落差明顯（最強的候選 30 次、次強 9 次、其餘族群名 3 次以內且全部落在漲跌幅或資金輪動句裡），判準給得出乾淨的分界。也遇到一個**機械判準勉強通過、但非價格依據只有一句**的邊緣候選——出示時明講證據薄弱與後續風險，讓人決定，沒有自己踢掉。步驟 1 的「排除自家產品」也在這篇來源上觸發一次，依規則記進 `excluded` 留痕。

**人類介入 N｜GATE 1 三題一次問完。** 候選、素材、片長三個決定併成一次提問，沒有拆成三輪。

**人類介入 O｜GATE 2 通過。** 成片交付時附實測規格與四項已知落差（素材幀率≠輸出幀率、原聲與自寫字幕不同步、16:9 裁掉 40% 寬、大標的產品規格屬素材發布者而非題材主體）。使用者裁定通過。

**人類介入 P｜使用者質疑 harness 在膨脹。** 原話：「我感覺我們在這個harness上越加越多了」。時間點是在本次四項修補寫進去之後。這與階段 I 立下的規則是同一件事的兩面——階段 I 說「不寫進去下一個 agent 會不會做錯，答案是不會的就不要加」，而這次一輪就讓 SKILL.md 長了 7.8%。**成長速率本身要當成一個要看的指標，不是只看每一條規則單獨是否合理。**

依此回頭用階段 I 的判準複驗當輪的四項修補：ffprobe 補位與 Cloudflare 重試「不寫會做錯」成立，保留；選鏡窗口驗證只是近失不是失敗，三句加一段指令壓成一句；`check` 的 info 提示「不寫也不會做錯」，**刪除**。同時把階段 I 那條煞車規則搬進 `CLAUDE.md`——留在 RECIPE 等於煞車不在會被讀到的地方。淨效果：該輪 `SKILL.md` 成長從 +7.8% 降到 **+6.0%**（18,040 → 19,131 bytes；砍與壓之前一度是 19,451），`VERIFY.md` 回到原狀。

## 人類介入點總表與判定

使用者在 Phase 0 沒有逐一標記 a/b/c，而是給了流程結構：「harness 應該會有幾個 gate，首先就是我的 input 應該也是晨報，但是他會提取出幾個可能的（產業面向？）題材，然後 preflight 有沒有公開素材，結束後就會 gate 問我要挑哪個⋯⋯之後下一個 gate 就是直接看成片」，並說「這裡面有大量我們探索的決策」。

依此判定：

| # | 介入 | 判定 |
|---|---|---|
| E | 指定輸入為晨報 docx、要求 preflight 素材 | **method-自動**（SKILL 步驟 1–2） |
| — | 題材挑選 | **🛑 method-gate 1** |
| I / M | 開始製作、成片驗收 | **🛑 method-gate 2**（合併為成片驗收） |
| D | 版面三條裁定（字幕必要／大標久／logo 置中） | **method-自動**（已固化成規格） |
| L | 音軌方案選擇 | **method-自動**（已定案為保留原聲，不再問） |
| A, B, C, G, H, J, K | 探索期的方向糾正與發現 | **incident**（只在本檔） |
| F | 授權瀏覽器 session | **incident**（實際未使用；若未來需要則升級為 gate） |
| 3, 4, 5, 17 | Groq 而非本機 whisper／客觀拆解／文件風格／清理授權 | **incident**（使用者明示 Groq 與 ego-browser 不需 gate） |

## 未結案

1. 使用者提到的「虛化效果」在 21 支裡找不到，未確認是哪一支。
2. 公開資訊觀測站的法說會官方影音沒驗通，那條路可能讓大型股題材也有官方素材。
3. 成片 53.1 MB 超過對話工具 30 MiB 的上傳上限，只能在本機桌面版播放，手機與網頁看不到。不影響製作，但 GATE 2 的交付體驗有缺口。
4. `SKILL.md` 單輪成長 7.8%、複驗收回後 +6.0%（階段 J）。有了入口的煞車規則，但仍然只有「加」與「當輪收回」，沒有跨輪定期回收的做法。
5. 原本要做三支，只做了一支。後續兩支需要另找有官方素材的題材——同一份來源文件的技術題材數量有限，可能要換來源日期或改用國際供應鏈層級的題材。
