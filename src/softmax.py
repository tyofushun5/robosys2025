#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause

import sys
import math

from tools import to_float_list


@to_float_list
def softmax(nums: list)-> list:
    max_num = max(nums)
    exps = []
    for num in nums:
        exps.append(math.exp(num - max_num))
    total = sum(exps)

    return [value / total for value in exps]

ans = softmax(sys.stdin)
for value in ans:
    print(value)
