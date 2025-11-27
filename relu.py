#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause

import sys

def relu(x):
    return max(0, x)

for line in sys.stdin:
    print(relu(float(line)))
