# Finder → Codex

`finder-to-codex.sh` 是 Raycast Script Command：读取 Finder 最前面窗口正在浏览的文件夹，通过 macOS 打开目录事件交给 Codex，由应用登记并选中项目。命令名称为 **Open Finder Folder in Codex**，建议设置别名 `fc`。

## 安装

1. 在 Raycast 设置中打开 **Script Commands → Add Script Directory**，选择本仓库的 `extensions` 目录。也可以在 Raycast 中搜索 **Add Script Directory**。
2. 在 Raycast 搜索 **Open Finder Folder in Codex**。
3. 设置别名：Raycast v2 在 **Settings → Shortcuts** 中找到该命令，点击 **Add Alias** 并填入 `fc`；v1 在 **Settings → Extensions** 中找到该命令，在 **Alias** 栏填入 `fc`。
4. 在 Finder 打开目标文件夹，唤醒 Raycast，输入 `fc` 并回车。首次运行时，允许 Raycast 控制 Finder。

脚本使用 macOS 自带的 Bash、AppleScript 和 `open`，不需要安装 Codex CLI 或其他依赖。通过应用标识 `com.openai.codex` 定位桌面应用，支持本机名为 `ChatGPT.app` 的安装。

## 行为与错误提示

- 读取窗口当前目录，不使用选中的文件或子目录。
- 没有 Finder 窗口时，提示先打开文件夹。
- 窗口无法解析为真实目录、目录不可访问或应用无法打开时，显示错误并退出。
- 自动化授权被拒绝时，在 **系统设置 → 隐私与安全性 → 自动化** 中允许 Raycast 控制 Finder。
- 成功提示“已发送到 Codex”表示 macOS 已接收打开请求，项目登记和切换由 Codex 处理。

## 参考

- [Raycast Script Commands 官方仓库](https://github.com/raycast/script-commands)：脚本元数据与 Finder 目录读取示例。
- [导入脚本目录](https://manual.raycast.com/script-commands)。
- [Raycast v2 别名设置](https://manual.raycast.com/command-aliases-and-hotkeys)。
- [Raycast v1 别名设置](https://manual.raycast.com/v1/command-aliases-and-hotkeys)。
