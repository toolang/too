#!/bin/bash
log(){
    str="$1"
    echo -e "\033[32m$str \033[0m "
}
failed(){
    str="$1"
    echo -e "\033[31m$str \033[0m"
    exit 1
}
check(){
    if [  "$?" != 0 ]; then
#        actual=`./a.out`
#        if [  "$?" != 0 ]; then
        failed "exec failed"
#        fi
#        rm ./a.out
    fi

}
assert(){
    expected="$1"
    input="$2"
    log "[compile] too -s $input ..."
    too -s $input
    check
    echo "gcc -g *.s -L/usr/local/lib/colib -linternal -lgc -los"
    gcc -g *.s -L/usr/local/lib/colib -linternal -lgc -los
    check
    ./a.out
    check
    rm ./a.out
    rm *.s
    rm *.o
    return
#    failed "[compile] $input failed"
}
read_dir(){
    dir="$1"
    cd $dir
    for file in `ls *.to`
    do
    echo $file
     if [ -d $file ] ; then
        read_dir $file
     else
        rm *.s
        rm *.o
        assert "OK" $file
        log "[compile] $file passed!"
     fi
    done
    cd ..
}
install_env(){
    cd tests
    if [  "$?" != 0 ]; then
        failed "make failed"
    fi
    rm *.s
}
install_env
if [ "$1" != "" ]; then
    read_dir $1
    exit 1
fi
for dir in `ls`
do
    if [ -d $dir ] ; then
        read_dir $dir
        rm $dir/*.o
        rm $dir/*.s
    fi
done 
log "all passing...."
