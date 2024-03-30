# plex-mpv
Plex 桌面端使用的播放器是 mpv 播放器，mpv 播放器的部分功能可以通过操作界面或快捷键在 Plex 中使用，还有一部分功能在 Plex 中没有操作界面，也没有相应的快捷键，但是我们通过脚本可以为这些隐藏功能自定义快捷键，这样就可以在 Plex 中正常使用这些功能了。


## 功能介绍

01. **快进**：按 `右方向键` 快进 10 秒。
02. **倍速播放**：按 `.` 键加速，按 `,` 键减速，按 `/` 键重置播放速度，按 `g` 键可开启或关闭全局播放速度模式。
03. **逐帧播放**：按 `’` 键向前逐帧，按 `;` 键向后逐帧。
04. **静音**：按 `j` 键切换静音模式，再次按下解除静音并恢复原音量。
05. **截图**：按 `s` 键截取当前画面。
06. **录制屏幕（测试）**：按 `1` 键开始录制，按 `2` 键停止录制。（仅支持 MacOS）
07. **切换字幕**：按 `t` 键循环切换字幕。
08. **调整字幕位置**：按 `d` 键向下移动字幕，按 `e` 键向上移动字幕，按 `r` 键重置字幕位置。
09. **调整字幕大小**：按 `z` 键放大字幕，按 `x` 键缩小字幕，按 `c` 键重置字幕大小。
10. **调整字幕偏移**：按 `v` 键减少字幕延迟，按 `b` 键增加字幕延迟，按 `n` 键重置字幕偏移。
11. **移动画面**：按 `m` 键激活移动模式，使用 `方向键` 移动画面，再次按 `m` 键可关闭移动模式；按 `o` 键可重置画面位置。
12. **缩放画面**：按 `=` 键放大画面，按 `-` 键缩小画面，按 `0` 键重置画面大小。


## 脚本安装

请把脚本文件放进 Plex 和 Plex HTPC 的用户 `scripts` 文件夹内，然后重启 Plex 和 Plex HTPC 客户端即可。

MacOS 用户可参考以下目录，请将脚本文件移至 `scripts` 文件夹，然后使用文本编辑打开 `screenshot-keybinds.lua` 设置截图保存路径并保存；再使用文本编辑打开 `recordingBeta-keybinds.lua`，将脚本中的 `/Applications/FFmpeg/FFmpeg` 替换为你的 FFmpeg 可执行文件的路径（需要先安装 FFmpeg），并设置保存视频的目录，然后保存文件即可。
```
/Users/用户名/Library/Application Support/Plex/scripts
/Users/用户名/Library/Application Support/Plex HTPC/scripts
```
Windows 用户可参考以下目录，请将脚本文件移至 `scripts` 文件夹，然后使用记事本打开 `screenshot-keybinds.lua` 设置截图保存路径并保存；可以删除 `recordingBeta-keybinds.lua` 这个脚本（此脚本不支持 Windows）。
```
D:\Users\用户名\AppData\Local\Plex\scripts
D:\Users\用户名\AppData\Local\Plex HTPC\scripts
```
## 脚本使用

除了 `recordingBeta-keybinds.lua` 这个脚本仅支持 MacOS 以外，其余脚本均支持 Plex for Windows/Mac/Linux 和 Plex HTPC for Windows/Mac/Linux，安装脚本后请务必重启客户端再使用，若脚本无法正常工作，可能是因为脚本设置的快捷键与你操作系统上的其他快捷键有冲突，你可以尝试使用文本编辑/记事本打开脚本修改快捷键。


## 已知问题

- **快进**：快进功能的 `右方向键` 快捷键可能与 HTPC 的其他操作存在冲突，请用文本编辑/记事本打开 HTPC 的 `skipForward-keybinds.lua` 脚本，将 `RIGHT` 改为 `f` 或其他快捷键即可正常使用。
- **倍速播放**：你可以通过 `g` 键开启或关闭全局播放速度模式（默认关闭，你也可以通过编辑 `speed-keybinds.lua` 脚本，设置 `local global_speed = true` 改为默认启用），在全局播放速度模式下，你设置的播放速度将对整个客户端生效，直到下次重启客户端为止，你也可以随时关闭该模式。
- **录制屏幕（测试）**：录制画面可能存在不流畅、卡顿问题，不支持音频录制。
- **切换字幕**：Plex 界面中的字幕选项不会发生变化，字幕切换仅在画面中生效，且仅对当次播放有效。
- **调整字幕位置**：此设置对整个客户端生效，直到下次重启客户端为止，字幕位置会应用到所有字幕上。
- **调整字幕大小**：此设置对整个客户端生效，直到下次重启客户端为止，字幕大小会应用到所有字幕上。
- **调整字幕偏移**：字幕偏移仅对当次播放有效。
- **搜索**：有部分音频文件的 `video-codec` 会被识别为 `mjpeg` 或 `png`，在播放这类音频文件时，所有脚本中的自定义快捷键都会生效，这将导致你无法使用这些快捷键在搜索栏输入字符，此时你需要停止当前播放的音乐，才能在搜索栏正常使用所有按键输入字符。如果你认为这对你造成了影响，可以选择修改快捷键，使用一些不常用的按键作为快捷键，这样可以降低对搜索功能的影响。


## 感谢

感谢 [OttoKerner](https://forums.plex.tv/u/OttoKerner) 的启发，脚本 `stepping-keybinds.lua`、 `zoom-keybinds.lua` 和 `subPosition-keybinds.lua` 是复制了 OttoKerner [这篇文章](https://forums.plex.tv/t/use-mpv-features-which-are-not-exposed-in-plex-for-windows-mac-linux-and-plex-htpc/830025/1)中的代码进行修改得到的，感谢。

　

# plex-mpv
The player used by Plex desktop client is mpv player, some features of mpv player can be applied in Plex through the interface or shortcut keys, while some features do not have an interface or corresponding shortcuts in Plex. However, we can customize shortcut keys for these hidden features through scripts, so that we can use these features properly in Plex.


## Features

01. **Fast forward**: Press `right arrow key` to fast forward 10 seconds.
02. **Multiply speed playback**: Press `.` to speed up, press `,` to slow down, press `/` to reset the playback speed, press `g` to turn the global playback speed mode on or off.
03. **Frame-by-frame playback**: press `'` to go forward frame-by-frame, press `;` to go backward frame-by-frame.
04. **Mute**: Press `j` to switch the mute mode, press again to unmute and restore the original volume.
05. **Screenshot**: Press `s` to capture the current screen.
06. **Record screen (Beta)**: Press `1` to start recording, press `2` to stop recording. (Only support MacOS)
07. **Switch subtitles**: Press `t` to cycle through the subtitles.
08. **Adjust subtitle position**: Press `d` to move down the subtitle, press `e` to move up the subtitle, press `r` to reset the subtitle position.
09. **Adjust subtitle size**: press `z` to enlarge the subtitle, press `x` to reduce the subtitle, press `c` to reset the subtitle size.
10. **Adjust subtitle offset**: Press `v` to decrease the subtitle delay, press `b` to increase the subtitle delay, press `n` to reset the subtitle offset.
11. **Move screen**: Press `m` to activate the move mode, use `arrow keys` to move the screen, press `m` again to close the move mode. Press `o` to reset the screen position.
12. **Zoom screen**: Press `=` to zoom in, press `-` to zoom out, press `0` to reset the screen size.


## Installation

Please put the script file into the user `scripts` folder of Plex and Plex HTPC, and then restart the Plex and Plex HTPC clients.

MacOS users can refer to the following directory, please move the script files to the `scripts` folder, then use TextEdit to open `screenshot-keybinds.lua` to set the path to save the screenshot and save it; then use TextEdit to open `recordingBeta-keybinds.lua`, replace the `/Applications/FFmpeg/FFmpeg` in the script with the path of your FFmpeg executable (you need to install FFmpeg first), and set the directory to save the recording, then save the file.
```
/Users/Username/Library/Application Support/Plex/scripts
/Users/Username/Library/Application Support/Plex HTPC/scripts
```
Windows users can refer to the following directory, please move the script files to the `scripts` folder, then open `screenshot-keybinds.lua` with Notepad to set the screenshot save path and save it; delete `recordingBeta-keybinds.lua` (this script does not support Windows).
```
D:\Users\Username\AppData\Local\Plex\scripts
D:\Users\Username\AppData\Local\Plex HTPC\scripts
```
## Usage

Except `recordingBeta-keybinds.lua` which only supports MacOS, all other scripts support Plex for Windows/Mac/Linux and Plex HTPC for Windows/Mac/Linux, please make sure to restart the client after installing the script before using it. If the script does not work properly, it might have conflicts with other shortcuts on your operating system, you could try to change the shortcut keys by opening the script with a TextEdit/Notepad.


## Known Issues

- **Fast forward**: The shortcut key for fast forward, `right arrow key`, might conflict with other operations on your HTPC. To resolve this, open the `skipForward-keybinds.lua` of the HTPC with a TextEdit/Notepad, and change `RIGHT` to `f` or any other shortcut key you prefer.
- **Multiply speed playback**: You can toggle the global playback speed mode on or off with the `g` key (By default, it's turned off, but you can also set `local global_speed = true` in the `speed-keybinds.lua` script to turn it on by default). In global playback speed mode, the speed you set will apply to the entire client until the next client restart, and you can turn off this mode at any time.
- **Record screen (Beta)**: The recording might have issues with smoothness and stuttering, and does not support audio recording.
- **Switch subtitles**: The subtitle option in the Plex interface will not change. Subtitle switching only takes effect on the screen and is only valid for the current playback.
- **Adjust subtitle position**: This setting applies to the entire client until the next time the client is restarted. The subtitle position will be applied to all subtitles.
- **Adjust subtitle size**: This setting applies to the entire client until the next time the client is restarted. The subtitle size will be applied to all subtitles.
- **Adjust subtitle offset**: Subtitle offset is only valid for the current playback.
- **Search**: Some audio files have their `video-codec` recognized as `mjpeg` or `png`. When playing such audio files, all custom shortcuts in scripts will be active. This prevents you from using these shortcuts to input characters in the search bar. To resolve this, you'll need to stop the current music playback to use all keys for character input in the search bar. If you find this inconvenient, consider modifying the shortcuts to use less common keys, reducing their impact on the search functionality.


## Thanks

Thanks to [OttoKerner](https://forums.plex.tv/u/OttoKerner) for the inspiration, the scripts `stepping-keybinds.lua`, `zoom-keybinds.lua` and `subPosition-keybinds.lua` were obtained by modifying the code in OttoKerner’s [article](https://forums.plex.tv/t/use-mpv-features-which-are-not-exposed-in-plex-for-windows-mac-linux-and-plex-htpc/830025/1). Thank you.
