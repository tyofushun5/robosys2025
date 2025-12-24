#!/bin/bash
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoka
# SPDX-License-Identifier: BSD-3-Clause


ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

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

printf '' | ./softmax >/dev/null 2>&1
[ "$?" -ne 0 ] || ng "$LINENO"

printf '1\nx\n2\n' | ./softmax >/dev/null 2>&1
[ "$?" -ne 0 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
