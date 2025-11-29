# robosys2025

## 概要
標準入力から読み取った数値を処理するためのコマンドラインツール集です。  
ロボットシステムの演習やデモを想定した小さなユーティリティ群で構成されています。

## 内容
- `plus`: 1 行 1 数値の入力を合計する Python スクリプト
- `softmax.py`: Softmax を用いて標準入力の数値を正規化するスクリプト
- `nums`, `nums2`: 動作確認用のサンプル入力
- `test.bash`: `plus` と `softmax.py` のリグレッションテスト
- `tools/`: Python モジュール共通のデコレータ（`to_float_list`, `output`）を提供

## 必要環境
- Python 3.10 以上
- POSIX 互換シェル環境

## インストール
```bash
git clone https://github.com/USER/robosys2025.git
cd robosys2025
chmod +x plus test.bash
```

## 使い方
### `plus`
```bash
$ seq 5 | ./plus
15

$ cat nums | ./plus
15
```
- 合計値を 1 行で表示します。
- 数値以外や空行のみの場合は終了コード `1` で異常終了し、何も表示しません。

### `softmax.py`
```bash
$ python3 softmax.py <<'EOF'
1
2
3
EOF
0.09003057317038046
0.24472847105479764
0.6652409557748218

$ python3 softmax.py < nums2
0.011656230956039605
0.03168492079612427
0.0861285444362687
0.23412165725273662
0.6364086465588308
```
- 標準入力から 1 行ごとに値を読み取り、最大値シフト込みの Softmax で正規化します。

## テスト
```bash
$ ./test.bash
```
`plus` の成功・異常ケースと `softmax.py` の出力をまとめて検証できます。

## ライセンスと出典
- SPDX-License-Identifier: BSD-3-Clause  
- © 2025 Shunsuke Fukuoka

このソフトウェアパッケージは 3 条項 BSD ライセンスの下で再頒布・使用できます。  
下記スライド（CC-BY-SA 4.0 by Ryuichi Ueda）の内容を参考にし、本人の許可を得て本リポジトリの著作としています。
- [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
