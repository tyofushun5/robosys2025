#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause

import sys

def step(num: float)-> float:

    if num > 0:
        return 1
    else:
        return 0

for line in sys.stdin:
    print(step(float(line)))