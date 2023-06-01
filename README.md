# 功能介绍

01. **快进**：按「右方向键」快进 10 秒。
02. **倍速播放**：按「.」键加速，按「,」键减速，按「/」键重置播放速度。
03. **逐帧播放**：按「’」键向前逐帧，按「;」键向后逐帧。
04. **静音**：按「j」键切换静音模式，再次按下解除静音并恢复原音量。
05. **截图**：按「s」键截取当前画面。
06. **录制屏幕**：按「1」键开始录制，按「2」键停止录制。（仅支持 MacOS）
07. **切换字幕**：按「t」键循环切换字幕。
08. **调整字幕位置**：按「d」键向下移动字幕，按「e」键向上移动字幕，按「r」键重置字幕位置。
09. **调整字幕大小**：按「z」键放大字幕，按「x」键缩小字幕，按「c」键重置字幕大小。
10. **调整字幕偏移**：按「v」键减少字幕延迟，按「b」键增加字幕延迟，按「n」键重置字幕偏移。
11. **移动画面**：按「m」键激活移动模式，使用「方向键」移动画面，再次按「m」关闭移动模式。按「o」键可重置画面位置。
12. **缩放画面**：按「=」键放大画面，按「-」键缩小画面，按「0」键重置画面大小。


# 脚本安装

请把脚本文件放进 Plex 和 Plex HTPC 的用户「scripts」文件夹内，然后重启 Plex 和 Plex HTPC 客户端即可。

MacOS 用户可参考以下目录，请将脚本文件移至「scripts」文件夹，然后使用文本编辑打开「screenshot-keybinds.lua」设置截图保存路径并保存；再使用文本编辑打开「recordingBeta-keybinds.lua」，将脚本中的「/Applications/FFmpeg/FFmpeg」替换为你的 FFmpeg 可执行文件的路径（需要先安装 FFmpeg），并设置保存视频的目录，然后保存文件即可。
```
/Users/你的用户名/Library/Application Support/Plex/scripts
/Users/你的用户名/Library/Application Support/Plex HTPC/scripts
```
Windows 用户可参考以下目录，请将脚本文件移至「scripts」文件夹，然后使用记事本打开「screenshot-keybinds.lua」设置截图保存路径并保存；可以删除「recordingBeta-keybinds.lua」这个脚本（此脚本不支持 Windows）。
```
C:\Users\你的用户名\AppData\Local\Plex\scripts
C:\Users\你的用户名\AppData\Local\Plex HTPC\scripts
```

# 脚本使用

除了「recordingBeta-keybinds.lua」这个脚本仅支持 MacOS 以外，其余脚本均支持 Plex for Windows/Mac/Linux 和 Plex HTPC for Windows/Mac/Linux，安装脚本后请务必重启客户端再使用，若脚本无法正常工作，可能是因为脚本设置的快捷键与你操作系统上的其他快捷键有冲突，你可以尝试使用文本编辑/记事本打开脚本修改快捷键。

#

# Function Introduction

01. **Fast forward**: Press "right arrow key" to fast forward 10 seconds.
02. **Multiply speed playback**: Press "." key to speed up, press "," to slow down, press "/" to reset the playback speed.
03. **Frame-by-frame playback**: press "'" to go forward frame-by-frame, press ";" to go backward frame-by-frame.
04. **Mute**: Press "j" to switch the mute mode, press again to unmute and restore the original volume.
05. **Screenshot**: Press "s" to capture the current screen.
06. **Record screen**: Press "1" to start recording, press "2" to stop recording. (Only support MacOS)
07. **Switch subtitles**: Press "t" to cycle through the subtitles.
08. **Adjust subtitle position**: Press "d" to move down the subtitle, press "e" to move up the subtitle, press "r" to reset the subtitle position.
09. **Adjust subtitle size**: press "z" to enlarge the subtitle, press "x" to reduce the subtitle, press "c" to reset the subtitle size.
10. **Adjust subtitle offset**: Press "v" to decrease the subtitle delay, press "b" to increase the subtitle delay, press "n" to reset the subtitle offset.
11. **Move screen**: Press "m" to activate the move mode, use "arrow keys" to move the screen, press "m" again to close the move mode. Press "o" to reset the screen position.
12. **Zoom screen**: Press "=" to zoom in, press "-" to zoom out, press "0" to reset the screen size.


# Script Installation

Please put the script file into the user "scripts" folder of Plex and Plex HTPC, and then restart the Plex and Plex HTPC clients.

MacOS users can refer to the following directory, please move the script files to the "scripts" folder, then use TextEdit to open "screenshot-keybinds.lua" to set the path to save the screenshot and save it; then use TextEdit to open "recordingBeta-keybinds.lua", replace the "/ Applications/FFmpeg/FFmpeg" in the script with the path of your FFmpeg executable (you need to install FFmpeg first), and set the directory to save the recording, then save the file.
```
/Users/Username/Library/Application Support/Plex/scripts
/Users/Username/Library/Application Support/Plex HTPC/scripts
```
Windows users can refer to the following directory, please move the script files to the "scripts" folder, then open "screenshot-keybinds.lua" with Notepad to set the screenshot save path and save it; delete "recordingBeta-keybinds.lua" (this script does not support Windows).
```
C:\Users\Username\AppData\Local\Plex\scripts
C:\Users\Username\AppData\Local\Plex HTPC\scripts
```

# Script Usage

Except "recordingBeta-keybinds.lua" which only supports MacOS, all other scripts support Plex for Windows/Mac/Linux and Plex HTPC for Windows/Mac/Linux, please make sure to restart the client after installing the script before using it. If the script does not work properly, it might have conflicts with other shortcuts on your operating system, you could try to change the shortcut keys by opening the script with a TextEdit/Notepad.
