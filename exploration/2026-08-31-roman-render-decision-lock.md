# Roman 單支成片 Decision Lock v0.1

- 鎖定時間：2026-08-31（Asia/Taipei）
- 本輪決定：使用者已明確授權跳過目前 `interest_signals=UNKNOWN` 與 `visual_source_fit=UNKNOWN` 的等待，直接以 Roman 題材及 NASA SVS item 15080 製作一支 60 秒內部驗收成片。
- 題材：NASA Nancy Grace Roman Space Telescope 於 2026-08-30 發射；以發射後進入 commissioning、Roman 與 Hubble／Webb 的互補價值為敘事主軸。
- 素材：NASA Scientific Visualization Studio 15080，`Roman: Go For Launch`。來源頁 `https://svs.gsfc.nasa.gov/15080/`；直檔 `https://svs.gsfc.nasa.gov/vis/a010000/a015000/a015080/15080_RomanGoForLaunch_1080.mp4`。
- run_dir：`/private/tmp/w14-roman-launch-2026-08-31`。
- 影響範圍：只建立上述 run_dir 的輸入、素材、composition、snapshots、render、QA 與 provenance；不修改 harness production code、`SKILL.md`、`ASSUMPTIONS.md` 或 `bin/`。
- 必要證據：來源事實可回指 NASA；素材下載與 sha256；10 個 6 秒鏡頭的視覺抽查；HyperFrames `check`、snapshots、render 與 `verify-render.sh` exit；reviewer 的 GATE 2 findings。
- 已接受但不消失的缺口：觀眾 interest baseline 尚未完成；素材頁列 Universal Production Music，對外發布權利仍為 `UNKNOWN`。本輪成片只供內部評估，`publication_hold=true`。
- 停止條件：一支成片完成機械驗證並由 w14-reviewer 稽核後，在 GATE 2 交付使用者；不自行開新題材、新來源或第二個 run。

