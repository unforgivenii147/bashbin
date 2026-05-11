#!/data/data/com.termux/files/usr/bin/bash
fn="$@"
ls -l "$fn" | ( read perm unknown1 group user size month day tclock fname; echo $fname   $size $month $day $perm);