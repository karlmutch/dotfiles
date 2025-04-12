#!/usr/bin/python

import os


PROJECT_ROOT = os.path.dirname(os.path.realpath(__file__))


def main():
    # The following command may fail
    os.system('cd {} && git submodule update --init --recursive'.format(PROJECT_ROOT))

    # In case the above command failed, also go through all submodules and update them individually
    for root, dirs, files in os.walk(PROJECT_ROOT):
        for filename in files:
            if filename == '.gitmodules':
                with open(os.path.join(root, filename), 'r') as gitmodules_file:
                    for line in gitmodules_file:
                        line = line.replace(' ', '')
                        if 'path=' in line:
                            submodule = line.replace('path=', '')
                            os.system('cd {} && git submodule init {}'.format(root, submodule))
                            os.system('cd {} && git submodule update {}'.format(root, submodule))


if __name__ == '__main__':
    main()
