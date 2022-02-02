import re
import sys


def main(zoom_str):

    path_config = '/home/tringuyen/.config/qutebrowser/config.py'
    with open(path_config, 'rt') as input_f:
        all_lines = input_f.readlines()
    p = re.compile('c\.zoom\.default.*\n')
    matches = [i for i, item in enumerate(all_lines) if p.match(item) is not None]
    assert len(matches) == 1
    all_lines[matches[0]] = "c.zoom.default = '{0}%'\n".format(zoom_str)

    with open( path_config, 'wt') as output_f:
        output_f.writelines(all_lines)


if __name__ == "__main__":

    main(sys.argv[1])


