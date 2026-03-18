#!/bin/sh
pip config --user set global.index https://mirror-pypi.runflare.com/simple
pip config --user set global.index-url https://mirror-pypi.runflare.com/simple
pip config --user set global.trusted-host mirror-pypi.runflare.com
