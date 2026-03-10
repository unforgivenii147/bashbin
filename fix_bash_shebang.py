#!/data/data/com.termux/files/usr/bin/env python
import os
TARGET_SHEBANG = "#!/data/data/com.termux/files/usr/bin/bash"
BASH_KEYWORDS={"set ", "unset ", "then", "done", "cd", "chdir", "bash", "copy", "not", "del", "do", "echo", "else", "errorlevel", "exist", "exit", "fi", "for", "goto", "if", "in", "md", "mkdir", "move", "not", "pause", "ren", "set", "shift", "export"}


def is_bash_file(filepath):
    if filepath.endswith(".sh"):
        return True
    try:
        with open(filepath) as f:
            first_line = f.readline().strip()
            if first_line.startswith("#!") and ("bin/sh" in first_line or 'bin/bash' in first_line or 'env bash' in first_line):
                return True
            f.seek(0)
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    return any(keyword in line for keyword in BASH_KEYWORDS)
            return False
    except (OSError, UnicodeDecodeError):
        return False


def process_file(filepath):
    print(f'processing {filepath}')
    with open(filepath, "r+") as f:
        lines = f.readlines()
        if not lines:
            return
        if lines and lines[0].startswith("#!"):
            lines[0] = TARGET_SHEBANG + "\n"
            if len(lines) > 1 and lines[1].strip() != "":
                lines.insert(1, "\n")
        f.seek(0)
        f.writelines(lines)
        f.truncate()
        print(f"{os.path.relpath(filepath)} updated.")
    if "bin" in filepath.split(os.sep):
        os.chmod(filepath, 0o755)


def traverse_directory(directory):
    for root, _, files in os.walk(directory):
        for filename in files:
            filepath = os.path.join(root, filename)
            if os.path.islink(filepath):
                continue
            if is_bash_file(filepath):
                process_file(filepath)

if __name__ == "__main__":
    traverse_directory(os.getcwd())
