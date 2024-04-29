#!/usr/bin/python

import re
import sys
from tomlkit import dumps
from tomlkit import parse
from tomlkit.toml_file import TOMLFile


def main(size):

    path_config = '/home/tringuyen/.config/alacritty/alacritty.toml'
    config_obj = TOMLFile(path_config)
    data = config_obj.read()
    data['font']['size'] = size
    config_obj.write(data)

    # with open(path_config, 'rb') as input_f:
    #     data = tomllib.load(input_f)
    # data['font']['size'] = size_str

    # with open(path_config, 'rt') as input_f:
    #     all_lines = input_f.readlines()
    # p = re.compile('.*size: .*\n')
    # matches = [i for i, item in enumerate(all_lines) if p.match(item) is not None]
    # assert len(matches) == 1
    # all_lines[matches[0]] = '  size: %s\n' % size_str
    #
    # with open( path_config, 'wt') as output_f:
    #     output_f.writelines(all_lines)


if __name__ == "__main__":
    # 15 and 20
    main(int(sys.argv[1]))

