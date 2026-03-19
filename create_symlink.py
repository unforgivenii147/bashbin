#!/data/data/com.termux/files/usr/bin/python
import os
import pathlib

BASHBIN = (
    "/data/data/com.termux/files/home/bashbin"
)
BIN = "/data/data/com.termux/files/home/bin"

if __name__ == "__main__":
    source_dirs = [BASHBIN, BIN]
    for source_dir in source_dirs:
        if source_dir == BASHBIN:
            ext = ".sh"
        if source_dir == BIN:
            ext = ".py"
        for filename in os.listdir(source_dir):
            if filename.endswith(ext):
                src_file = os.path.join(
                    source_dir, filename
                )
                link_name = os.path.join(
                    source_dir, filename[:-3]
                )
                try:
                    pathlib.Path(
                        link_name
                    ).symlink_to(src_file)
                    print(
                        f"Created symlink: {link_name} -> {src_file}"
                    )
                except FileExistsError:
                    pass
