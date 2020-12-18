#!/usr/bin/bash
# --disable-gpu
# --enable-logging --v=1
# --no-default-browser-check

google-chrome --no-first-run 1> chrome.stdout 2> chrome.stderr &
