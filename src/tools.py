# !/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Shunsuke Fukuoks
# SPDX-License-Identifier: BSD-3-Clause

from typing import Any


def to_float_list(func):
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        float_args = []
        for arg in args:
            try:
                float_args.append(float(arg))
                continue
            except TypeError:
                converted = []
                for item in arg:
                    converted.append(float(item))
                float_args.append(converted)
        return func(*float_args, **kwargs)
    return wrapper
