#!/data/data/com.termux/files/usr/bin/python
import os
BASHBIN="/data/data/com.termux/files/home/bashbin"
BIN="/data/data/com.termux/files/home/bin"


if __name__=='__main__':

    source_dirs=[BASHBIN,BIN]
    for source_dir in source_dirs:
        if source_dir == BASHBIN:
            ext = ".sh"
        if source_dir == BIN:
            ext = ".py"
        for filename in os.listdir(source_dir):
            if filename.endswith(ext):
                src_file = os.path.join(source_dir, filename)
                link_name = os.path.join(source_dir, filename[:-3])
                try:
                    os.symlink(src_file, link_name)
                    print(f"Created symlink: {link_name} -> {src_file}")
                except FileExistsError:
                    print(f"Symlink already exists: {link_name}")
