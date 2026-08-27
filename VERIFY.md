# 驗證

可執行的檢查優先。以下在 `<run_dir>/project/` 底下跑。

## Render 前

`<V>` 是 `package.json` 裡釘的 HyperFrames 版本。**不要用不帶版本的 `npx hyperframes`**（會解析到最新版，而 ASSUMPTIONS 的必踩規則是在釘定版實測的）。

```bash
npx hyperframes@<V> lint                    # 必須 0 error
npx hyperframes@<V> check                   # 必須 0 error；含 runtime / layout / motion / contrast
npx hyperframes@<V> snapshot --at <每段中點>  # 抽幀目視
npx hyperframes@<V> render
```

- `check` 的對比度必須全項通過 WCAG AA。
- **抽幀時間要落在每段字幕的中點，不要落在邊界**。字幕在自己的入點會處於淡入起點，邊界幀看起來像沒有字幕。
- 逐張目視三件事：三行大標**沒有溢出成第四行**、字幕完整不被裁切、素材主體在畫面中央。
- ⚠️ `check` 0 error **不代表成片有聲音**。它不檢查音軌。render 前先自己數：

```bash
grep -c "<audio " index.html   # 必須等於 video 數；為 0 就是靜音成片
```

## Render 後

```bash
bin/verify-render.sh "<成片路徑>" --width <w> --height <h> \
  --duration <duration_seconds> --fps <fps> --shot-seconds <shot_seconds>
```

**不帶參數就會套 1080/1920/60/30/6 的預設值而誤判。** 輸入用了非預設值時一定要傳。

該 script 檢查並印出：

| 項目 | 判準 |
|---|---|
| 解析度 | 等於輸入的 width × height |
| 時長 | 與輸入的 duration_seconds 相差 < 0.1 秒 |
| 幀數 | 等於 duration × fps |
| 音訊串流 | 必須存在 |
| 平均音量 | `mean_volume` 落在 -22 ～ -16 dB |
| 逐段有聲 | 每段鏡頭中點各量 4 秒，全部不得為靜音 |

**音量的兩個單位不要混用**：`output.target_lufs`（-16 LUFS）是 `prep-footage.sh` 正規化音檔時的目標，屬 EBU R128 感知響度；這裡驗的 `mean_volume` 是 ffmpeg 的 RMS dB，兩者不同量綱、沒有換算公式。實測對應關係是 -16 LUFS 的音檔在成片量到約 -19 dB。

平均音量落窗外的處置：偏低調高 `<audio>` 的 `data-volume` 後重 render；偏高則降。**不要重跑 loudnorm**——那支音檔已經正規化過，再跑一次會疊加。

其餘任一項失敗就改 composition 重 render，不要後製補救。

## 人眼判斷（無法自動化）

- 字幕內容是否只用了來源文件的原文事實與素材畫面的官方規格，沒有自行推論的數字
- 選鏡是否避開了純文字卡與主體偏一側的鏡頭
- 大標三行是否各自陳述一件事，而不是同一件事講三次

## 最終

**成片必須由使用者驗收**（SKILL.md 的 GATE 2）。所有自動檢查通過不等於完成。
