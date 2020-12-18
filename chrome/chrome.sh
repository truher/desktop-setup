#!/usr/bin/bash
# --disable-gpu
# --enable-logging --v=1

google-chrome --no-default-browser-check 1> chrome.stdout 2> chrome.stderr &
