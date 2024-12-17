#!/bin/bash

# Get current input method from fcitx5
layout=$(fcitx5-remote -n)

# Display the layout (e.g., us, ko, jp)
if [ "$layout" == "" ]; then
    echo "Unknown"
elif [[ "$layout" == "keyboard-us" ]]; then
    echo " Eng"
elif [[ "$layout" == "hangul" ]]; then
    echo " 한글"
else
    echo " $layout"
fi
