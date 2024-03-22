#!/usr/bin/python

import re
import sys


def main(size_str):

    path_config = '/home/tringuyen/.config/alacritty/alacritty.yml'
    with open(path_config, 'rt') as input_f:
        all_lines = input_f.readlines()
    p = re.compile('.*size: .*\n')
    matches = [i for i, item in enumerate(all_lines) if p.match(item) is not None]
    assert len(matches) == 1
    all_lines[matches[0]] = '  size: %s\n' % size_str

    with open( path_config, 'wt') as output_f:
        output_f.writelines(all_lines)


if __name__ == "__main__":
    # 15 and 20
    main(sys.argv[1])

