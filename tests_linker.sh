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
    log "[asmer] toa -p ."
    toa -p .
    echo "start linking..."
    # toa目前未全部兼容GNU，运行时c库需要采用gcc打包为.o文件
    # toa -p /usr/local/lib/coasm
    `gcc -c /usr/local/lib/coasm/*.s`
    log "[linker] tol -p ."
    tol -p .
    check
    chmod 777 a.out
    echo "exec a.out..."
    ./a.out
    check
    rm ./a.out
    rm *.s
    rm *.o
    echo "exec done..."

    return
#    failed "[compile] $input failed"
}
read_dir(){
    dir="$1"
    cd $dir
    for file in `ls *.to`
    do
     if [ -d $file ] ; then
        read_dir $file
     else
         rm *.s
         rm *.o
        assert "OK" $file
        log "[compile] $file passed!\n"
     fi
    done
    rm *.s
    rm *.o
    cd ..
}
install_env(){
    cd tests
    if [  "$?" != 0 ]; then
        failed "make failed"
    fi
}
install_env
for dir in `ls`
do
    if [ -d $dir ] ; then
        read_dir $dir
        rm $dir/*.o
        rm $dir/*.s
    fi
done 
log "all passing...."
