#!/data/data/com.termux/files/usr/bin/python
import os

source_dir = '.'

for filename in os.listdir(source_dir):
    if filename.endswith('.sh'):
        src_file = os.path.join(source_dir, filename)
        link_name = os.path.join(source_dir, filename[:-3])  # Remove .py
        try:
            os.symlink(src_file, link_name)
            print(f'Created symlink: {link_name} -> {src_file}')
        except FileExistsError:
            print(f'Symlink already exists: {link_name}')
        except Exception as e:
            print(f'Error creating symlink for {filename}: {e}')
