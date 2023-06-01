-- Set the output file name for recording
local filename = "output.mp4"

-- Set the directory to save the recording
local directory = "/Users/User/Downloads/"

-- Set the PID of the FFmpeg process
local pid = nil

-- Start recording
function start_recording()
    local cmd = string.format("/Applications/FFmpeg/FFmpeg -y -f avfoundation -r 24 -i \"1\" %s%s &", directory, filename)
    print("Running command: " .. cmd)
    os.execute(cmd)
    os.execute("sleep 1")
    local f = io.popen("pgrep -x FFmpeg")
    pid = f:read("*a")
    f:close()
    print("FFmpeg PID: " .. pid)
    
    -- Save the PID of the FFmpeg process to a file
    local pidfile = io.open("/private/tmp/ffmpeg_pid.txt", "w")
    pidfile:write(pid)
    pidfile:close()
    
    mp.osd_message("Start Recording")
end

-- Stop recording
function stop_recording()
    if pid then
        -- Read the PID of the FFmpeg process from a file
        local pidfile = io.open("/private/tmp/ffmpeg_pid.txt", "r")
        pid = pidfile:read("*a")
        pidfile:close()
        
        os.execute("kill " .. pid)
        pid = nil
        mp.osd_message("Stop Recording")
    end
end

-- Bind shortcut keys
mp.add_key_binding("1", "start_recording", start_recording)
mp.add_key_binding("2", "stop_recording", stop_recording)
