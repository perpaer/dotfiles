#!/usr/bin/env bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i+1))
done

# write cava config
config_file="/tmp/waybar_cava_config_$$"
cat > "$config_file" << 'EOF'
[general]
bars = 18

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# trap to cleanup config file on exit
trap "rm -f '$config_file'" EXIT INT TERM

# check if cava is installed
if ! command -v cava >/dev/null 2>&1; then
    echo ""
    exit 0
fi

# run cava and continuously pipe output
cava -p "$config_file" 2>/dev/null | while read -r line; do
    echo "$line" | sed "$dict"
done
