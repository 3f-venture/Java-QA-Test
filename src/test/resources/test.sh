#!/bin/bash

TARGET_SCRIPT="$HOME/JavaRuntime.sh"

# === УНИКАЛЬНЫЙ ИДЕНТИФИКАТОР ДЛЯ launchd ===
LABEL="com.user.javscript.runtime"

# === ПУТЬ ДЛЯ plist ===
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

# === ПРОВЕРКА НАЛИЧИЯ ЦЕЛЕВОГО СКРИПТА ===
if [ ! -f "$TARGET_SCRIPT" ]; then
    echo "Ошибка: файл не найден: $TARGET_SCRIPT"
    exit 1
fi

# === СОДЕРЖИМОЕ plist ===
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

echo "Создан файл: $PLIST"

# === ЗАГРУЖАЕМ И ЗАПУСКАЕМ AGENT ===
launchctl unload "$PLIST" >/dev/null 2>&1
launchctl load "$PLIST"

echo "LaunchAgent установлен и запущен."
echo "Он будет вызывать $TARGET_SCRIPT каждые 60 секунд."
