
生成 elf 可重定位 对象文件
```
$ cd linker/demo
$ gcc -c *.s -static -nostdlib -e main
```
通过tol链接器进行连接生成可执行文件
```
$ cd linker
$ ./bin/tol -p ./demo
[ 1/2] Reading elf object info ./demo//init.o
[ 2/2] Reading elf object info ./demo//main.o
[ 30%] Collecting object info
[ 40%] Checking symbol valid
[ 50%] Allocing address 
[ 60%] Relocating symbol
[ 80%] Relocating address
[ 90%] Building executable binary
[ 100%] Generating executable binary
[ 100%] Generate tol Passed
$ chmod 777 a.out

$ ./a.out
> hello toolang!
```