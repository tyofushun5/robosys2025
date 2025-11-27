#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause

import sys
import math

def sigmoid(x):
    return math.exp(math.minimum(x, 0)) / (1 + math.exp(- math.abs(x)))