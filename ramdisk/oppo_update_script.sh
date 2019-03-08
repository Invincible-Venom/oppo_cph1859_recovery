#!/sbin/sh
para_list=$@

#Symlink funtion
if [ "$1" = "symlink" ]; then
    shift
    link_src=$1
    shift
    for link_dest in "$@"
    do
        if [ ${link_dest:0:1} != "/" ]; then
            echo "link dest path not start with root dir"
            exit 1
        fi

        link_dir=$(dirname ${link_dest})
        rm -rf link_dest
        cd ${link_dir}
        ln -sf ${link_src} ${link_dest}
    done
    exit 0
fi

#Other fuction
