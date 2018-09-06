function set_path
    if [ (count $argv) -ne 1 ]
        echo Usage: $_ "<prefix>"
        return -1
    end

    set --global --export PREFIX (realpath $argv[1])
    set --global --export PATH $PREFIX/bin $PATH  # Special case
    set --global --export LD_LIBRARY_PATH "$PREFIX/lib:$LD_LIBRARY_PATH"
end
