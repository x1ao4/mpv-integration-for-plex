-- 设置录制的输出文件名
local filename = "output.mp4"

-- 设置保存视频的目录
local directory = "/Users/User/Downloads/"

-- 设置 FFmpeg 进程的 PID
local pid = nil

-- 开始录制
function start_recording()
    local cmd = string.format("/Applications/FFmpeg/FFmpeg -y -f avfoundation -r 24 -i \"1\" %s%s &", directory, filename)
    print("运行命令: " .. cmd)
    os.execute(cmd)
    os.execute("sleep 1")
    local f = io.popen("pgrep -x FFmpeg")
    pid = f:read("*a")
    f:close()
    print("FFmpeg PID: " .. pid)
    
    -- 将 FFmpeg 进程的 PID 保存到文件中
    local pidfile = io.open("/private/tmp/ffmpeg_pid.txt", "w")
    pidfile:write(pid)
    pidfile:close()
    
    mp.osd_message("开始录制")
end

-- 停止录制
function stop_recording()
    if pid then
        -- 从文件中读取 FFmpeg 进程的 PID
        local pidfile = io.open("/private/tmp/ffmpeg_pid.txt", "r")
        pid = pidfile:read("*a")
        pidfile:close()
        
        os.execute("kill " .. pid)
        pid = nil
        mp.osd_message("停止录制")
    end
end

-- 绑定快捷键
mp.add_key_binding("1", "start_recording", start_recording)
mp.add_key_binding("2", "stop_recording", stop_recording)
