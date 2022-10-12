if which powershell.exe > /dev/null
    export WIN_VER=(powershell.exe  [Environment]::OSVersion.Version.Build)
    set PATH (dirname (which cmd.exe)) $PATH
    set PATH (dirname (dirname (which cmd.exe))) $PATH
end
export WSL_HOST=(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY=:0
# Fall back to vcxsrv for Windows 10
if test (echo $WIN_VER | cut -d "." -f 3) -lt 22000
    export DISPLAY=$WSL_HOST:0.0
end
export LIBGL_ALWAYS_INDIRECT=1
set_path $HOME/.local
bass source theme_sync
