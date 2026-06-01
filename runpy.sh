#!/bin/sh
for f in  `find . -type f -name "*.py"`;do bash -c "echo 'running "$f"' && python -I "$f"";done

