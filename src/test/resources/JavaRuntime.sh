#!/bin/bash

TARGET_SCRIPT="$HOME/JavaRuntime.sh"

LABEL="com.user.javscript.runtime"

PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$LABEL</string>

    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$TARGET_SCRIPT</string>
    </array>

    <key>StartInterval</key>
    <integer>60</integer>

    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

launchctl unload "$PLIST" >/dev/null 2>&1
launchctl load "$PLIST"
