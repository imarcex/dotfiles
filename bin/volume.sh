#!/bin/bash
current_volume=$(pamixer --get-volume)
if [[ $current_volume -gt 100 ]]; then pamixer --set-volume 100; fi
notify-send "Sound" -h int:value:$current_volume
