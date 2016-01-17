called=$_
[[ $called != $0 ]] || echo "jrk.bash should be sourced not run!"

function apps {
    cat apps.txt appraces.txt tests.txt | ruby -e "STDIN.read.split.each {|a| puts a+\"/${1}\"}"
}

appdir=$(dirname "${BASH_SOURCE[0]}")
export PATH=${PATH}:${appdir}

alias m=out-of-tree.sh

function gen_rand_id {
    LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | fold -w ${1:-16} | head -n 1
}