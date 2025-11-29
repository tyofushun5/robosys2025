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

python3 <<'PY' || ng "$LINENO"
import math
import subprocess
import sys
from typing import List

def run_case(data: str) -> List[float]:
    proc = subprocess.run(
        [sys.executable, "softmax.py"],
        input=data,
        text=True,
        capture_output=True,
        check=True,
    )
    lines = [line.strip() for line in proc.stdout.splitlines() if line.strip()]
    return [float(line) for line in lines]


def assert_close(values: List[float], expected: List[float], tol: float = 1e-12) -> None:
    if len(values) != len(expected):
        raise AssertionError(f"length mismatch: got {len(values)} expected {len(expected)}")
    for idx, (val, exp) in enumerate(zip(values, expected)):
        if not math.isclose(val, exp, rel_tol=1e-9, abs_tol=tol):
            raise AssertionError(f"softmax mismatch at {idx}: got {val}, expected {exp}")
    if not math.isclose(sum(values), 1.0, rel_tol=1e-9, abs_tol=tol):
        raise AssertionError(f"softmax outputs do not sum to 1, got {sum(values)}")


assert_close(
    run_case("0\n0\n"),
    [0.5, 0.5],
)

assert_close(
    run_case("1\n2\n3\n"),
    [0.09003057317038046, 0.24472847105479764, 0.6652409557748218],
)
PY

[ "${res}" = 0 ] && echo OK
exit $res
