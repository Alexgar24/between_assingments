# !/bin/bash

remove_path() {
    local path=$1

    # Check if the path exists
    if [ -e "$path" ]; then
        # Check if the path points to a directory
        if [ -d "$path" ]; then
            # Remove the directory recursively
            rm -rf "$path"
            echo "Directory removed: $path"
        else
            # Remove the file
            rm "$path"
            echo "File removed: $path"
        fi
    fi
}

paths=(
    "__pycache__"
    "build"
    "_one.cpython-310-x86_64-linux-gnu.so"
    "one_wrap.cxx"
    "one.py"
    "one.egg-info"
    "dist"
)

for path in "${paths[@]}"; do
    remove_path "$path"
done