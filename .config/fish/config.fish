export WIN_VER=(echo (cd /c && cmd.exe /c ver) | sed 's/.*\[Version \([^]]*\)\].*/\1/g')
export WSL_HOST=(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY=:0
# Fall back to vcxsrv for Windows 10
if test (echo $WIN_VER | cut -d "." -f 3) -lt 22000
    export DISPLAY=$WSL_HOST:0.0
end
export LIBGL_ALWAYS_INDIRECT=1
set PATH /mnt/c/Windows/ $PATH
set PATH /mnt/c/Windows/System32 $PATH
set_path $HOME/.local
bass source theme_sync
