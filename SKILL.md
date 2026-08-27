# sourced-footage-reel

把**一篇文字來源**（例如每日財經晨報 docx）變成**一支 9:16 直式短影音**：從文字裡挑出有公開官方影片可用的題材，取得該素材，剪成固定版面，配上自寫中文字幕與整片固定的三行大標。

## 做什麼 / 不做什麼
**做**：單一支他人官方影片素材 → 固定版面的 9:16 短影音。素材原聲保留並正規化，字幕是自寫的中文摘要。

**不做**：不生成任何畫面（無 AI 生圖、無生成式 B-roll）、不做主播或虛擬人、不做多支素材混剪、不做旁白配音、不做競品分析。找不到公開官方素材的題材，這支 harness 直接不做——那是它的邊界，不是失敗。

**版面規格來源**：量測自 Instagram `@technewsinside`（TechNews 科技新報）播放數前 21 支影片。本 harness 只沿用量測結果，不含當時的分析工具。

## 停頓只有三種，沒有第四種
- **GATE**：出示後**等人回覆**才往下——常態兩個（題材與素材挑選、成片驗收），外加一個**條件式**（步驟 4 的可用鏡頭撐不起指定片長時才觸發，素材夠用就不會遇到）
- **ABORT**：回報實情後**結束**，不等回覆——來源文件讀不到、一個候選都抽不到、`check` 修不掉
- **自行判斷後告知**：自己決定並繼續，在下一個 GATE 一併出示理由——其餘全部

歸第三類、**不要為它們停下來**：明顯的輸入殘留（`footage` 未填卻有 `credit_text`）自行清除並記下；步驟 3 從素材畫面讀到的官方規格屬於**客觀讀取、不是草稿套值**，直接寫進 `topic.facts` 並在 GATE 2 一併出示；選鏡、字幕稿、大標的所有取捨。

唯一例外是 `topic` 與 `content` 同時存在卻互相矛盾——那代表呼叫方給錯輸入，猜錯整支做廢，留在 GATE 1 問。

## 前置條件
需要 `yt-dlp`、`ffmpeg`／`ffprobe`、`npx`、一份中文字型、一個品牌 logo。HyperFrames 版本由 `bin/init-project.sh` 釘進專案 `package.json`，之後每次 npx 都要帶那個版本。**動手前必讀 [`ASSUMPTIONS.md`](ASSUMPTIONS.md)**——那裡有幾個不知道會走死路的環境限制。

## 輸入
見 [`inputs.schema.json`](inputs.schema.json)。**開新題材用 [`fixtures/inputs.minimal.json`](fixtures/inputs.minimal.json) 當底稿**（只有必填欄位，不含任何題材值）。

所有隨題材變動的值（素材來源、大標、字幕稿、剪點、品牌資產、片長）都在輸入裡，SKILL.md 不含任何題材常數。

⚠️ `fixtures/inputs.example.json` 是**一支已完成的成品**（題材、素材、大標、字幕全在裡面）。它只用於對照欄位格式，**不得當作新題材的底稿或答案**——照抄它等於交出上一支的答案。

**開工前先做輸入一致性檢查**（處置依上面的停頓分類）：

- `topic` 未填 → 入口 A（還沒選題材）；此時 `content` 若已填是**矛盾**，留到 GATE 1 問
- `topic.name` 已填 → 入口 B（驗證已指定題材的依據）
- `footage` 未填 → 步驟 2 自己找素材；已填 → 呼叫方指定素材，步驟 2 改為**驗證它與選定題材相符**，無關則是矛盾
- `footage.credit_text` 與 `footage` 同進退。前者有、後者無 → **殘留**，自行清空並記下（那行字含素材發布者名，會在 GATE 1 前洩漏答案）

## 輸出
全部寫到呼叫方指定的 `run_dir`（輸入的 `run_dir` 欄位）。**不要寫入 harness 資料夾本身。**

`<run_dir>/project/`（HyperFrames 專案：index.html、assets/、renders/）、`candidates.json`（步驟 1–2 的候選與素材 preflight）、`shots/`（contact sheet 與抽幀）、`PROVENANCE.md`（素材來源、規格、取得方式、授權狀態）。

---

## 步驟

### 1. 決定題材候選

有兩種入口，看呼叫方給了什麼：

**入口 A — 從文字來源抽（`topic` 未填）**：讀 `source_document`，找出**技術或產品層級**的題材（某項技術、某個產品、某個規格數字）。判準：這件事有沒有攝影機拍得到的東西。

有畫面的：產品 demo、人物發言現場、展會、實驗室、產線。
沒畫面的：股價漲跌、財報數字、法人買賣超、技術分析型態。

**入口 B — 呼叫方已指定（`topic.name` 已填）**：不要重新抽。改為**驗證該題材在來源文件裡有沒有技術層級依據**，逐句列出命中的原文。

**兩種入口共用的依據檢查**（可操作，不要憑感覺）：對來源文件的**全部**內容（docx 要掃所有 XML 部件，不只主文）統計該題材的技術詞出現次數——規格單位、製程節點、封裝方式、材料名、產品代號、技術英文縮寫。技術詞全為 0 且該題材只出現在漲跌幅／成交量／法人買賣超的句子裡 → **不成立**；有至少一句完整的非價格敘述（產品組成、技術路線、規格、產能、應用方向）→ **成立**，逐句記進 `evidence`。判準是「句」不是「段」，但必須是完整敘述，不能只是名詞出現在價格句裡。

**切分粒度**：一個候選 = 一個**能獨立成片的技術主張**，不是一個技術名詞。同一段落裡共用同一組依據、講同一件事不同面向的名詞要合成一個；只有各自有獨立非價格依據、能各自撐起一支敘事時才拆。拆太細的代價是每個候選的 `evidence` 太薄，步驟 5 湊不出字幕。**只掃文字層**——docx 圖片內的文字不算原文（那些多是價格籌碼圖表，也無法逐句引用）。**排除自家產品**：這支 harness 的素材必須是他人的官方影片，所以來源文件裡自家產品或服務的介紹段落即使技術詞非 0 也不成立，記進 `candidates.json` 的 `excluded` 並寫明理由。

**成功長什麼樣**：入口 A 得到 1 個以上候選，每個附原文依據。入口 B 得到該題材的原文依據清單。

**失敗了怎麼辦**：
- **來源文件讀不到**（路徑不存在、格式不支援、權限不足）→ **ABORT**：回報實際錯誤後結束，不要改用其他來源、不要靠記憶或其他檔案裡的內容代替。這與「抽不到候選」是不同的失敗，要分開講。
- 入口 A 一個都抽不到 → **ABORT**：回報這篇來源只有價格層級內容。**不要把價格題材硬湊成技術題材。**
- 入口 B 的指定題材沒有非價格依據 → **停在 GATE 1，把情況攤給人看**，三個選項讓人挑：換一份來源文件、改用其他有依據的候選、或明確授權以素材畫面的官方規格作為主要事實來源（那會讓成片的事實與這篇來源文件脫鉤）。**不准自己挑其中一條往下走。**

### 2. 對每個候選 preflight 公開官方素材

**做什麼**：找該題材的**廠商或機構官方影片**。取得順序：廠商官網的影片頁 → 官方 newsroom／media kit。**官方 YouTube 頻道只用來確認素材存在，不作為取得來源**（ASSUMPTIONS 環境限制 2：匿名下載必失敗）；在那裡看到的影片，回官網找同一支。

搜尋時用產品代號與技術名稱，不要用股票名稱——台廠中小型股沒有官方影片，國際大廠的旗艦技術才有。

**素材發布者可以不是題材主體**（前者進畫面右下角標籤、後者進底部來源標註，是不同公司很常見）。題材主體沒有影片時改用同一技術的國際大廠官方影片，界線是：該素材必須**直接展示這個題材講的技術或產品本體**，不是只提到同一個名詞。多家都符合就全部列進 `footage` 陣列，由 GATE 1 讓人選。

**成功長什麼樣**：`<run_dir>/candidates.json` 是一個陣列，每筆的欄位、型別、`probe` 與 `platform` 的完整值域定義在 [`inputs.schema.json`](inputs.schema.json) 的 `$defs.candidate`——**照那份寫，不要自己發明欄位**。一個候選可掛多支素材（`footage` 是陣列），找不到素材時 `footage_found: false` 且 `footage: []`。

**探測只讀 metadata，不下載媒體檔。** `probe` 六個值涵蓋六種實況（含 generic extractor 讀不到畫質、平台有已知下載限制），判準見 schema。

```bash
yt-dlp --socket-timeout 30 --referer "<來源網站>" --print "%(extractor)s|%(title)s|%(duration)s|%(width)sx%(height)s" "<URL>"
yt-dlp --list-formats "<URL>" | tail -5
```

**yt-dlp 讀不到時長與畫質時，用 `ffprobe` 遠端讀 header 補上。** generic extractor 與 `direct_file` 一律回 NA，而依 ASSUMPTIONS 環境限制 2，這類正是目前主要可用的管道——不補的話 GATE 1 要出示的「長度／解析度」會整欄是空的，那個 gate 就失去意義。`ffprobe` 走 HTTP range 只讀檔頭，不下載媒體檔：

```bash
ffprobe -v error -rw_timeout 20000000 \
  -show_entries format=duration,size,bit_rate \
  -show_entries stream=codec_type,codec_name,width,height,r_frame_rate \
  -of default=nw=1 "<URL>"
```

`candidates.json` 的 `duration_seconds`／`width`／`height` **仍照 schema 留 `null`**（那三個欄位的定義是 yt-dlp 回報值，不可混入實測值）；ffprobe 讀到的規格寫進 `blocked_reason`，並在 GATE 1 的素材表出示。

**實際下載留到步驟 3（GATE 1 之後）。** 理由：下載是有成本且需要人同意的動作，不能為了填一個 gate 前的欄位就對每個候選各下載一次。`probe=ok` 不保證下載一定成功——ASSUMPTIONS 環境限制 2 記的 YouTube 就是 metadata 讀得到、下載到中途才 403。

**失敗了怎麼辦**：素材在 YouTube 但抓不到（403），先查廠商官網有沒有同一支——官網多半走企業影片平台，那條路可行。都不行就把該候選標為不可用，不要卡住。

### 🛑 GATE 1：題材挑選（必須停下來問人）

出示候選清單與素材探測結果，問**兩件事**：要做哪一個（或哪幾個）候選、以及該候選要用哪一支素材。

出示內容：每個候選的題材、來源文件裡的原文依據、以及它 `footage` 陣列裡**每一支**素材的發布者／長度／解析度／`probe` 值。**不要出示「可用鏡頭」**——那要等步驟 3 下載素材後才看得到。
**兩個決定都不准自己做**，候選只有一支素材時仍要出示確認。使用者可能回答「都要」，那就對每個選定題材各跑一次步驟 3 之後的流程。

入口 B 的依據檢查沒過時，這個 gate 同時承擔上面步驟 1 列的三選一。

**gate 通過後，由你（不是使用者）補齊這四個值，並在同一則回覆裡出示讓使用者過目**：

- `topic.name`：選定候選的 kebab-case 短名，只用於專案 id 與檔名
- `topic.tag`：畫面右下角標籤，取來源文件裡與該題材直接相關的主體（個股名與代號、或公司名）。**不要放素材發布者**——那是底部來源標註的內容，兩者本來就是不同公司
- `topic.facts`：步驟 1 的 `evidence` 逐句搬過來，再加上步驟 3 之後從素材畫面讀到的官方規格。這是步驟 5 的字幕事實白名單
- `--project-id`：`<topic.name>-<source_document.date_label>`
- `footage`：把人選定那一支的 `publisher`／`source_page`／`ids`／`referer` 從 candidates 搬進輸入，並依 `publisher` 寫出 `credit_text`

### 3. 取得素材並準備

**做什麼**：`bin/init-project.sh` 建骨架，`bin/prep-footage.sh` 取素材。

```bash
bin/init-project.sh --run-dir "<run_dir>" --project-id "<topic.name>-<date_label>" \
  --logo "<brand.logo_path>" --font-bold "<brand.font_bold_path>" --font-regular "<brand.font_regular_path>"

bin/prep-footage.sh --url "<URL>" --referer "<footage.referer>" --lufs "<output.target_lufs>" \
  --out "<run_dir>/project/assets" --sheet "<run_dir>/shots"
```

`--url` **只吃 URL 不吃識別碼**：Brightcove 要自己組成 `https://players.brightcove.net/<account_id>/<player_id>_default/index.html?videoId=<video_id>`；素材已在本機時用 `--local <檔案>` 取代 `--url`。
**成功長什麼樣**：`project/package.json`（已釘版）、`assets/` 有 logo 與字型與 `footage.mp4` 與 `audio-normalized.m4a`、`shots/contact-sheet.jpg`。兩支 script 會印出實測規格與模板要填的字型檔名。素材沒有音軌時 `prep-footage.sh` 會明講並跳過正規化——那種情況步驟 6 不要放 `<audio>`，並在 GATE 2 告知成片是靜音。

**失敗了怎麼辦**：下載失敗看 ASSUMPTIONS 的「素材取得」；正規化的 measured 值每支素材不同，script 自己跑二階段，不要手填。

### 4. 選鏡
**做什麼**：看 contact sheet，挑出 `duration / shot_seconds` 段鏡頭，寫成 `shots` 陣列（每段：timeline 起點 ↔ 素材起點）。

**選鏡硬約束**：素材區比例接近 1:1，16:9 素材填滿要裁掉 40% 寬度，**主體必須落在畫面中央 60% 以內**。優先挑產品特寫、手持物件、機構畫面；避開純文字卡（字會被裁掉）與主體偏一側的鏡頭。

**contact sheet 的格距通常小於 `shot_seconds`（`prep-footage.sh` 會印出格距），所以一格好看不代表整段都好**——挑完起點後對每段抽幾幀確認整個窗口沒有落進上面要避開的鏡頭，再寫進 `shots`。

**成功長什麼樣**：鏡頭數 × 每段秒數 = 目標片長，且**至少一半是產品或物件特寫**（畫面主體是東西，不是站著的人）。靜態抽幀看不出人有沒有在講話，所以判準用構圖而不是動作。

**失敗了怎麼辦**：可用鏡頭撐不起 `duration_seconds` 時 → **條件式 GATE，停下來問**。片長是呼叫方指定的輸入，**不可自行更改**；重複鏡頭硬撐也不行。出示可用鏡頭數與缺口，三個選項讓人挑：縮短片長、換一支素材（回步驟 3）、或接受重複鏡頭。

### 5. 寫大標與字幕稿
**做什麼**：三行大標（整片固定）＋逐段字幕。

大標：三行，每行陳述一件事——技術突破／產品事實／與讀者的關聯。數字用 `{{num}}…{{/num}}` 包住以套強調色。

**大標長度不用字數判定，用像素。** 真正的約束是 70px 字級下每行不得超過 972px 可用寬，超出就溢出成第四行。中文約 13 字、含英文縮寫與數字時更少，**所以字數只是粗估，唯一可信的判準是步驟 7 的 snapshot 目視「大標是三行不是四行」**。

字幕：每段 1–2 行，每段 `caption_seconds` 秒。行長以版面容得下為準（60px 字級、單行約 15 個中文字），**不設每行字數下限**——短句是刻意的節奏。

**唯一的硬判準是密度：字幕總字數 ÷ 片長 落在每秒 4–5 字。**

字幕內容只能來自兩處：來源文件的原文事實、素材畫面裡的官方規格。**不要自己推論數字。**

**價格事實可以當字幕，不可以當題材依據。**「昨日某股攻上漲停某價」放在字幕裡是合理的收尾，但步驟 1 不接受只有價格的題材——兩處判準不同，不要混用。

**成功長什麼樣**：密度落在每秒 4–5 字，且每段的行數不超過 2。

**失敗了怎麼辦**：密度超標就刪句、不足就補句，不要改字級。

### 6. 組成 composition

**做什麼**：以 `fixtures/composition-template.html` 為底，填入所有 `{{...}}` 佔位符，寫到 `<run_dir>/project/index.html`。骨架與資產已由步驟 3 的 `init-project.sh` 就位。

佔位符分兩種。單值直接替換，共 16 個：`TITLE`、`WIDTH`、`HEIGHT`、`DURATION`、`LOGO_FILE`、`FONT_BOLD_FILE`、`FONT_REGULAR_FILE`、`HEADLINE_LINE_1`、`HEADLINE_LINE_2`、`HEADLINE_LINE_3`、`CREDIT_TEXT`、`TOPIC_TAG`、`ACCENT`、`HEADLINE_STROKE`、`BG_GRADIENT_FROM`、`BG_GRADIENT_TO`（模板裡都是 `{{…}}` 形式）。

`{{SHOTS}}`、`{{CAPTIONS}}`、`{{AUDIO}}` 是**整段生成**，各自替換掉整行，逐段格式寫在模板的註解裡：

- `{{SHOTS}}`：`duration ÷ shot_seconds` 段。`data-start` = 序號 × `shot_seconds`，`data-media-start` = `shots[i].media_start`
- `{{AUDIO}}`：段數同上，三個時間屬性與對應 video **完全相同**；素材無音軌時整行刪掉
- `{{CAPTIONS}}`：`duration ÷ caption_seconds` 段，`data-start` = 序號 × `caption_seconds`

id 一律 `shot-NN`／`snd-NN`／`cap-NN`，兩位數補零，不得重複。

版面幾何（1080×1920 畫布，模板已寫好，不要改動）：品牌帶 y 0–239（靜）、素材區 y 240–1256 高 1017（動）、大標區 y 1257–1773 高 517（靜）、來源標註帶 y 1774–1919（靜）。

每段鏡頭需要**一個 `<video>` 加一個 `<audio>`**，兩者共用相同的 `data-start` / `data-duration` / `data-media-start`。**每個 video 與 audio 都必須有唯一 id**，否則畫面凍結或整支靜音。

**成功長什麼樣**：`npx hyperframes@<釘定版> lint` 0 error，且下面三個數字對得上：video 數 = audio 數 = `duration ÷ shot_seconds`、caption 數 = `duration ÷ caption_seconds`、`{{...}}` 在檔案裡剩 0 個。

`grep -c` 逐項數：`"<video "`、`"<audio "`、`'class="cap clip"'`、`"{{"`（最後一項必須是 0）。
**失敗了怎麼辦**：lint 訊息會直接指出缺什麼。ASSUMPTIONS 記了幾個必踩的規則。**所有 npx 呼叫都要帶 `package.json` 裡釘的版本**，不要用 `npx hyperframes`（會解析到最新版，而必踩規則是在釘定版實測的）。

### 7. 驗證
**做什麼**：依 [`VERIFY.md`](VERIFY.md) 逐項跑：`lint` → `check` → `snapshot` 抽幀目視 → `render` → `bin/verify-render.sh`。最後一支**必須把 `output` 的值傳進去**，否則會套 1080/1920/60/30/6 的預設值而誤判：

```bash
bin/verify-render.sh "<成片路徑>" --width <w> --height <h> \
  --duration <duration_seconds> --fps <fps> --shot-seconds <shot_seconds>
```

**成功長什麼樣**：`check` 0 error、snapshot 每張的字幕與大標都完整不溢出、`verify-render.sh` 全項通過。

**失敗了怎麼辦**：render 前的失敗一律修 composition 再跑；render 後才發現的問題（例如某段無聲）改 composition 重 render，不要後製補救。

### 🛑 GATE 2：成片驗收（必須停下來問人）

把成片交給使用者看，並附上實測規格（解析度、時長、平均音量）與已知落差。

**不准自己判定通過。** 使用者說可以才算完成。

### 8. 收尾
寫 `<run_dir>/PROVENANCE.md`：素材標題、發布者、來源頁面、平台識別碼、實測規格與 **sha256**（日後確認素材有沒有被換過只能靠它）、取得日、取得方式、畫面內容摘要、授權狀態。

**素材著作權屬原發布者**，對外發布前需確認授權範圍——本 harness 預設對內測試。

## 成功判準
見 [`VERIFY.md`](VERIFY.md)。做過一遍的軌跡與踩過的坑在 [`RECIPE.md`](RECIPE.md)（史料，不是指令；那裡刻意不留上次的題材答案）。
