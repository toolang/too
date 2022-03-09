<p>
<img alt="GitHub" src="https://img.shields.io/github/license/toolang/too">
<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/toolang/too">
</p>

toolang是一种编程语言，旨在创造一种非常简单的语言，已屏蔽了基于c/c++实现的compiler、asmer、linker，目前正在自举中...
```asciidoc
too      [options] file.to        
    -s    file  ast -> asm       编译.to代码 生成.s汇编文件
    -run  file  ast -> asm       gcc编译后链接glic生成可执行程序
    -p    file                   打印token
toa      [options] file.s        
    -c    file.s  -> file.o      编译.s自定义汇编语言,翻译机器码并生成.o elf|pe/coff文件
    -p    path path...           批量扫描目录编译.s文件生成.o elf文件
    -print                       打印token
tol      [options|file.o...] 
    -p    path ... -> a.out      指定多个目录,自动扫描所有.0文件进行链接生成可执行程序
    file.o  ...-> a.out          指定多个file.o进行链接    
```
## progress
更多语法测试用例在`/tests`目录下，包含了各种数据结构、运算、gc、demo测试

- [ ] compiler
  - [ ] run 自动编译链接后执行
  - [ ] -s  编译为低等级汇编码
- [ ] asmer 
  - [ ] -c  翻译指定汇编码为linux(elf),windows(pe/coff)
  - [ ] -p  批量扫描路径下的汇编
- [ ] linker 
  - [x] *.o 链接指定的linux(elf) 文件生成可执行程序
  - [ ] *.o 链接指定的windows(coff) 文件生成可执行pe程序
  - [x] -p  链接指定目录生成可执行程序
- [x] runtime
  - [x] garbage collect
  - [x] standard library
  - [x] syscall
 
  
## env & install & tests 
`NOTICE`:environment install first
```asciidoc
....
> sh tests_compiler.sh
> sh tests_asmer.sh
> sh tests_linker.sh

```
## @data struct
- [x] long int
- [x] string
- [x] bool
- [x] map
- [x] array
- [x] object
- [x] closure
- [ ] float
```
use fmt
class http{
    # member
    request
    func handler(){
        fmt.println("hello world!",request,this.request)
    }
}
http::closure(){
    return func(){
        return ["arr1","arr2",3,4]
    }
}
func main(){
    a = "this is a string" #string
    fmt.println(a)
    a = 1000 # int
    fmt.println(a)
    a = ["1",2,"33",4,"some string word"] #array
    fmt.print(a[0],a[1],a[2],a[3],a[4]) #or fmt.print(a)
    b = {"sdfds":"sdfsd",1:2,"sdfds":3,"a":a} #map
    fmt.print(b["a"],b["sdfds"])
    obj = new http() #object
    obj.request = {"method":"POST"}
    obj.handler()
    cfunc = obj.closure() #closure
    fmt.println(cfunc())
    
}
```
## @keywords
- [x] func
- [x] return
- [x] use
- [x] if 
- [x] while,for|range for
- [x] continue,break,match

```
use fmt
use os
func main(){
    arr = [0,1,2,3,4]
    map = {"1":"a","hello":"world","2":"b",3:"c","map":arr}
    for( k,v : map)
    {
        if k == "map" {
            for(v2 : v){}
        }
        fmt.println(k,v)
    }

    match map["hello"] {
        arr[0] : os.die("not this one")
        999    : os.die("not this one")
        "world": {
            fmt.println("got it",map["hello"])
        }
        _      : {
            os.die("not default")
        }
    }
}
```