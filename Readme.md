## ATTiny85をNeoPixel受信機にする

### ファイルの説明

#### .ino

空

#### .S

プログラム本体

### 設定変更

#### NeoPixel信号入出力ピン

`INPUT_PIN`と`OUTPUT_PIN`の定義で`2`または`3`(、またはリセットピンを無効化すれば`5`)から選択

#### LED接続ピン

`GREEN_REG`, `RED_REG`, `BLUE_REG`の定義で`P0: 0x29`, `P1: 0x2E`, `P4: 0x2B`から選択 (PWM出力ピンが必要なため、P0, P1, P4以外は不可)

### 配線

| 端子 | 用途 |
|----|----|
| P0 | 緑色LED |
| P1 | 赤色LED |
| P2 | NeoPixel信号入力 |
| P3 | NeoPixel信号出力 |
| P4 | 青色LED |
| P5 | (RESET) |

### 実行方法

1. Arduino IDEで16MHzに設定してブートローダー（ヒューズ）を書き込み
2. `cd build && make avrdude`

### レジスタの使用状況

`r23`のみ使用
