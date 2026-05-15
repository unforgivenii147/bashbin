#!/system/bin/sh
# Script to start "am" on the device, which has a very rudimentary
# shell.
base=/system
export CLASSPATH=$base/framework/am.jar
exec am $base/bin com.android.commands.am.Am "$@"
