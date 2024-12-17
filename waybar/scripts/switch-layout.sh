#!/bin/bash

# Use fcitx5-remote to toggle between layouts
current_layout=$(fcitx5-remote -n)

if [ "$current_layout" = "keyboard-us" ]; then
    fcitx5-remote -s hangul
else
    fcitx5-remote -s keyboard-us 
fi
