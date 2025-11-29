#!/bin/bash
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause


ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0 

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(seq 4 | ./softmax)
expected=$(cat <<'EOF'
0.03205860328008499
0.08714431874203257
0.23688281808991013
0.6439142598879724
EOF
)
[ "${out}" = "${expected}" ] || ng "$LINENO"

out=$(seq 5 | ./softmax)
expected=$(cat <<'EOF'
0.011656230956039605
0.03168492079612427
0.0861285444362687
0.23412165725273662
0.6364086465588308
EOF
)
[ "${out}" = "${expected}" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
