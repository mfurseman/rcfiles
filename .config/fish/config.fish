export WSL_HOST=(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export DISPLAY=$WSL_HOST:0.0
set PATH /mnt/c/Windows/ $PATH
set PATH /mnt/c/Windows/System32 $PATH
