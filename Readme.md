## ATTiny85をNeoPixel受信機にする

### ファイルの説明

#### neopixel-invert

アノード(+端子)コモンのLED用

#### neopixel-positive

カソード(-端子)コモンのLED用

#### .ino

空

#### .S

プログラム本体

### 配線

| 端子 | 用途 |
|----|----|
| P0 | 緑色LED |
| P1 | 赤色LED |
| P2 | NeoPixel信号出力 |
| P3 | NeoPixel信号入力 |
| P4 | 青色LED |
| P5 | (RESET) |

### 実行方法

Arduino IDEでdigispark(16.5MHz)向けにコンパイルし, micronucleusで書き込み

### 注意点

P3:NeoPixel入力を繋いだまま電源を入れるとブートローダーからアプリケーションに移行しないかもしれない

### レジスタの使用状況

あとで書く 


