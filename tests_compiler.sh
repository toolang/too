#!/bin/bash
log(){
    str="$1"
    echo -e "\033[32m$str \033[0m "
}
clean() {
    if ls $1 > /dev/null 2>&1; then
        rm -rf $1
    fi
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
    echo "gcc -g *.s /usr/local/lib/coasm/*.s -rdynamic -static -nostdlib -e main"
    gcc -g *.s /usr/local/lib/coasm/*.s -rdynamic -static -nostdlib -e main 
    check
    ./a.out
    check
    rm ./a.out
    clean "./*.s"
    clean "./*.o"
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
        clean "./*.s"
        clean "./*.o"
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
    clean "./*.s"
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
        clean "$dir/*.o"   
        clean "$dir/*.s"
    fi
done 
log "all passing...."
