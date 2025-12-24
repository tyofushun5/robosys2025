# robosys2025

[![test](https://github.com/tyofushun5/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/tyofushun5/robosys2025/actions/workflows/test.yml)

## 概要
標準入力から読み取った数値列をSoftmaxで正規化するコマンドラインツールです。

## 内容
- `softmax`: Softmaxを用いて標準入力の数値を正規化するスクリプト
- `tools/`: Pythonモジュール共通のデコレータ（`to_float_list`, `output`）を提供

## 実行環境
- Python3.12

## インストール
```bash
git clone https://github.com/tyofushun5/robosys2025.git
cd robosys2025
chmod +x softmax test.bash
```

## 使い方
### `softmax`
```bash
$ seq 4 | ./softmax
0.03205860328008499
0.08714431874203257
0.23688281808991013
0.6439142598879724

$ seq 5 | ./softmax
0.011656230956039605
0.03168492079612427
0.0861285444362687
0.23412165725273662
0.6364086465588308
```
- 標準入力から1行ごとに値を読み取り、最大値シフト込みのSoftmaxで正規化します。

## ライセンスおよびコピーライト
本リポジトリはBSD-3-Clauseライセンスです。詳細は`LICENSE`を参照してください。  
©2025 Shunsuke Fukuoka
