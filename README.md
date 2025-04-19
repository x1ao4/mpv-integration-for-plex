# MPV Integration for Plex <a name="mpv-integration-for-plex-zh"></a>
<a href="#mpv-integration-for-plex-en">Switch to English</a>

Plex 桌面端使用的播放器是 mpv 播放器，mpv 播放器的部分功能可以通过操作界面或快捷键在 Plex 中使用，还有一部分功能在 Plex 中没有操作界面，也没有相应的快捷键，但是我们通过脚本可以为这些隐藏功能自定义快捷键，这样就可以在 Plex 中正常使用这些功能了。

## 功能介绍
01. **快进**：按 `右` 键快进 10 秒（支持自定义快进时长）。
02. **快退**：按 `左` 键快退 10 秒（支持自定义快退时长）。
03. **倍速播放**：按 `.` 键加速，按 `,` 键减速，按 `/` 键重置播放速度，按 `g` 键可开启或关闭全局播放速度模式。
04. **逐帧播放**：按 `’` 键向前逐帧，按 `;` 键向后逐帧。
05. **静音**：按 `j` 键切换静音模式，再次按下解除静音并恢复原音量。
06. **截图**：按 `s` 键截取当前画面。
07. **录制屏幕（测试）**：按 `1` 键开始录制，按 `2` 键停止录制。（仅支持 MacOS）
08. **切换字幕**：按 `t` 键循环切换字幕，按 `5` 键可切换显示内置字幕标题或显示 Plex 字幕标题。
09. **调整字幕位置**：按 `d` 键向下移动字幕，按 `e` 键向上移动字幕，按 `r` 键重置字幕位置。
10. **调整字幕大小**：按 `z` 键放大字幕，按 `x` 键缩小字幕，按 `c` 键重置字幕大小。
11. **调整字幕偏移**：按 `v` 键减少字幕延迟，按 `b` 键增加字幕延迟，按 `n` 键重置字幕偏移。
12. **移动画面**：按 `m` 键激活移动模式，使用 `方向键` 移动画面，再次按 `m` 键可关闭移动模式；按 `o` 键可重置画面位置。
13. **缩放画面**：按 `=` 键放大画面，按 `-` 键缩小画面，按 `0` 键重置画面大小。
14. **切换音轨**：按 `y` 键循环切换音轨，按 `6` 键可切换显示内置音轨标题或显示 Plex 音轨标题。

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

如需自定义**快进**或**快退**的时长，请用文本编辑/记事本打开 `skipForward-keybinds.lua` 或 `skipBackward-keybinds.lua` 脚本，将 `seek 10` 或 `seek -10` 中的 `10` 修改为你期望的秒数并保存即可（重启后生效）。

## 已知问题
- **快进**：快进功能的 `右` 键快捷键可能与 HTPC 的其他操作存在冲突，请用文本编辑/记事本打开 HTPC 的 `skipForward-keybinds.lua` 脚本，将 `RIGHT` 改为 `q` 或其他快捷键即可正常使用。
- **快退**：快退功能的 `左` 键快捷键可能与 HTPC 的其他操作存在冲突，请用文本编辑/记事本打开 HTPC 的 `skipBackward-keybinds.lua` 脚本，将 `LEFT` 改为 `h` 或其他快捷键即可正常使用。
- **倍速播放**：你可以通过 `g` 键开启或关闭全局播放速度模式（默认关闭，你也可以通过编辑 `speed-keybinds.lua` 脚本，设置 `local global_speed = true` 改为默认启用），在全局播放速度模式下，你设置的播放速度将对整个客户端生效，直到下次重启客户端为止，你也可以随时关闭该模式。
- **录制屏幕（测试）**：录制画面可能存在不流畅、卡顿问题，不支持音频录制。
- **切换字幕**：Plex 界面中的字幕选项不会发生变化，字幕切换仅在画面中生效，且仅对当次播放有效。默认显示 Plex 字幕标题，你也可以通过编辑 `cycleSub-keybinds.lua` 脚本，设置 `local show_title = true` 改为默认显示内置字幕标题（若当前字幕没有内置字幕标题则会退回 Plex 字幕标题）。
- **调整字幕位置**：此设置对整个客户端生效，直到下次重启客户端为止，字幕位置会应用到所有字幕上。
- **调整字幕大小**：此设置对整个客户端生效，直到下次重启客户端为止，字幕大小会应用到所有字幕上。
- **调整字幕偏移**：字幕偏移仅对当次播放有效。
- **切换音轨**：Plex 界面中的音轨选项不会发生变化，音轨切换仅在音频输出中生效，且仅对当次播放有效。默认显示 Plex 音轨标题，你也可以通过编辑 `cycleAudio-keybinds.lua` 脚本，设置 `local show_title = true` 改为默认显示内置音轨标题（若当前音轨没有内置音轨标题则会退回 Plex 音轨标题）。
- **按键输入**：有部分音频文件的 `video-codec` 会被识别为 `mjpeg` 或 `png`，在播放这类音频文件时，所有脚本中自定义的快捷键都会在 Plex 全局生效，这将导致你无法使用这些按键在操作界面内输入字符（按键会触发相应的功能），此时你需要停止当前播放的音乐，才能正常使用所有按键输入字符。如果你认为这对你造成了影响，可以选择修改快捷键，使用一些不常用的按键作为快捷键（比如把快捷键修改为大写字母或特殊符号，通过 `Shift` 组合按键触发功能），这样可以降低脚本的不良的影响。

## 感谢
感谢 [OttoKerner](https://forums.plex.tv/u/OttoKerner) 的启发，脚本 `stepping-keybinds.lua`、 `zoom-keybinds.lua` 和 `subPosition-keybinds.lua` 是复制了 OttoKerner [这篇文章](https://forums.plex.tv/t/use-mpv-features-which-are-not-exposed-in-plex-for-windows-mac-linux-and-plex-htpc/830025/1)中的代码进行修改得到的，感谢。

## 赞赏
如果你觉得这个项目对你有用，可以考虑请我喝杯咖啡或者给我一个⭐️。谢谢你的支持！

<img width="383" alt="赞赏" src="https://github.com/user-attachments/assets/bdd2226b-6282-439d-be92-5311b6e9d29c">
<br><br>
<a href="#mpv-integration-for-plex-zh">回到顶部</a>
<br>
<br>
<br>

# MPV Integration for Plex <a name="mpv-integration-for-plex-en"></a>
<a href="#mpv-integration-for-plex-zh">切换至中文</a>

The player used by Plex desktop client is mpv player, some features of mpv player can be applied in Plex through the interface or shortcut keys, while some features do not have an interface or corresponding shortcuts in Plex. However, we can customize shortcut keys for these hidden features through scripts, so that we can use these features properly in Plex.

## Features
01. **Fast Forward**: Press `right` to fast forward 10 seconds (customizable fast forward duration supported).
02. **Rewind**: Press `left` to rewind 10 seconds (customizable rewind duration supported).
03. **Multiply Speed Playback**: Press `.` to speed up, press `,` to slow down, press `/` to reset the playback speed, press `g` to turn the global playback speed mode on or off.
04. **Frame-by-frame Playback**: press `'` to go forward frame-by-frame, press `;` to go backward frame-by-frame.
05. **Mute**: Press `j` to switch the mute mode, press again to unmute and restore the original volume.
06. **Screenshot**: Press `s` to capture the current screen.
07. **Record Screen (Beta)**: Press `1` to start recording, press `2` to stop recording. (Only support MacOS)
08. **Switch Subtitles**: Press `t` to cycle through the subtitles, press `5` to toggle between displaying Embedded Subtitle Titles and Plex Display Titles.
09. **Adjust Subtitle Position**: Press `d` to move down the subtitle, press `e` to move up the subtitle, press `r` to reset the subtitle position.
10. **Adjust Subtitle Size**: press `z` to enlarge the subtitle, press `x` to reduce the subtitle, press `c` to reset the subtitle size.
11. **Adjust Subtitle Offset**: Press `v` to decrease the subtitle delay, press `b` to increase the subtitle delay, press `n` to reset the subtitle offset.
12. **Move Screen**: Press `m` to activate the move mode, use `arrow keys` to move the screen, press `m` again to close the move mode. Press `o` to reset the screen position.
13. **Zoom Screen**: Press `=` to zoom in, press `-` to zoom out, press `0` to reset the screen size.
14. **Switch Audio Tracks**：Press `y` to cycle through the audio tracks, press `6` to toggle between displaying Embedded Audio Track Titles and Plex Display Titles.

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

To customize the duration of **Fast Forward** or **Rewind**, open the `skipForward-keybinds.lua` or `skipBackward-keybinds.lua` script with a TextEdit/Notepad, and change the `10` in `seek 10` or `seek -10` to your desired number of seconds. Then, save the file (Changes will take effect after restarting).

## Known Issues
- **Fast Forward**: The shortcut key for fast forward, `right` key, might conflict with other operations on your HTPC. To resolve this, open the `skipForward-keybinds.lua` of the HTPC with a TextEdit/Notepad, and change `RIGHT` to `q` or any other shortcut key you prefer.
- **Rewind**: The shortcut key for Rewind, `left` key, might conflict with other operations on your HTPC. To resolve this, open the `skipBackward-keybinds.lua` of the HTPC with a TextEdit/Notepad, and change `LEFT` to `h` or any other shortcut key you prefer.
- **Multiply Speed Playback**: You can toggle the global playback speed mode on or off with the `g` key (By default, it's turned off, but you can also set `local global_speed = true` in the `speed-keybinds.lua` script to turn it on by default). In global playback speed mode, the speed you set will apply to the entire client until the next client restart, and you can turn off this mode at any time.
- **Record Screen (Beta)**: The recording might have issues with smoothness and stuttering, and does not support audio recording.
- **Switch Subtitles**: The subtitle option in the Plex interface will not change. Subtitle switching only takes effect on the screen and is only valid for the current playback. By default, Plex Display Titles are shown. You can also customize this by editing the `cycleSub-keybinds.lua` script, setting `local show_title = true` to default to displaying embedded subtitle titles 
(If the current subtitle lacks an embedded subtitle title, it will fallback to Plex Display Title).
- **Adjust Subtitle Position**: This setting applies to the entire client until the next time the client is restarted. The subtitle position will be applied to all subtitles.
- **Adjust Subtitle Size**: This setting applies to the entire client until the next time the client is restarted. The subtitle size will be applied to all subtitles.
- **Adjust Subtitle Offset**: Subtitle offset is only valid for the current playback.
- **Switch Audio Tracks**: The audio track option in the Plex interface will not change. Audio track switching only takes effect on the audio output and is only valid for the current playback. By default, Plex Display Titles are shown. You can also customize this by editing the `cycleAudio-keybinds.lua` script, setting `local show_title = true` to default to displaying embedded audio track titles (If the current audio track lacks an embedded audio track title, it will fallback to Plex Display Title).
- **Keyboard Input**: For some audio files, the `video-codec` may be identified as `mjpeg` or `png`. When playing these audio files, all custom shortcuts in the script will take effect globally in Plex. This prevents you from using these keys to input characters within the user interface (the keys trigger corresponding functions). To resolve this, you need to stop the currently playing music to enable normal use of all keys for character input. If you find this affecting you, you can choose to modify the shortcuts by using less commonly used keys (such as changing the shortcut to uppercase letters or special symbols, triggering functions through `Shift` key combinations). This can mitigate the adverse effects of the script.

## Thanks
Thanks to [OttoKerner](https://forums.plex.tv/u/OttoKerner) for the inspiration, the scripts `stepping-keybinds.lua`, `zoom-keybinds.lua` and `subPosition-keybinds.lua` were obtained by modifying the code in OttoKerner’s [article](https://forums.plex.tv/t/use-mpv-features-which-are-not-exposed-in-plex-for-windows-mac-linux-and-plex-htpc/830025/1). Thank you.

## Support
If you found this helpful, consider buying me a coffee or giving it a ⭐️. Thanks for your support!

<img width="383" alt="Support" src="https://github.com/user-attachments/assets/bdd2226b-6282-439d-be92-5311b6e9d29c">
<br><br>
<a href="#mpv-integration-for-plex-en">Back to Top</a>
