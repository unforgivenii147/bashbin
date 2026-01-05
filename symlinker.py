#!/usr/bin/env python3

import sys
from time import perf_counter


def main():
    start = perf_counter()

    print(f'{perf_counter() - start} sec')


if __name__ == '__main__':
    sys.exit(main())
