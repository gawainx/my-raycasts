#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Open Finder Folder in Codex
# @raycast.mode compact
# @raycast.icon 📂
# @raycast.packageName Finder
# @raycast.description 将 Finder 最前面窗口的目录加入 Codex 项目列表并打开

set -eu

if ! folder=$(/usr/bin/osascript <<'APPLESCRIPT' 2>&1
tell application "Finder"
    if not (exists Finder window 1) then
        error "请先在 Finder 中打开一个文件夹窗口。"
    end if
    try
        set currentFolder to target of Finder window 1 as alias
        return POSIX path of currentFolder
    on error
        error "当前 Finder 窗口没有可用的目录，请打开具体文件夹后重试。"
    end try
end tell
APPLESCRIPT
); then
    if [[ "$folder" == *"-1743"* ]]; then
        printf '%s\n' '请在系统设置 → 隐私与安全性 → 自动化中，允许 Raycast 控制 Finder。'
    else
        printf '读取 Finder 目录失败：%s\n' "$folder"
    fi
    exit 1
fi

if [[ "$folder" != /* || ! -d "$folder" ]]; then
    printf 'Finder 目录不存在或无法访问：%s\n' "$folder"
    exit 1
fi

# Use the bundle identifier: the installed app may be named ChatGPT.app.
# Pass the directory as an open-document event, not as a process argument.
if ! result=$(/usr/bin/open -b com.openai.codex "$folder" 2>&1); then
    printf '打开 Codex 失败，请确认桌面应用已安装：%s\n' "$result"
    exit 1
fi

printf '已发送到 Codex：%s\n' "$folder"
