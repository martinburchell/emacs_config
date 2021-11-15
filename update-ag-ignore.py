#!/usr/bin/env python

import os
from subprocess import check_output


def create_ignore_file():
    command = ["git", "rev-parse", "--show-toplevel"]
    top_dir = (
        check_output(command).decode("utf-8").split()[0]
    )
    os.chdir(top_dir)

    ignore_file_name = os.path.join(top_dir, ".ignore")
    command = ["git", "status", "--ignored", "--porcelain=v2"]

    status_files = check_output(command).decode("utf-8").split("\n")

    with open(ignore_file_name, "w") as ignore_file:
        for status_file in status_files:
            if status_file.startswith("! "):
                ignore_file.write("{0}\n".format(status_file[2:]))


def main():
    create_ignore_file()


if __name__ == "__main__":
    main()
