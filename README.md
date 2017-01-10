# FDsymbolicatecrash

这是一个用来解析iOS crash文件的脚本，目前就是简单对symbolicatecrash工具对封装，可以用一句话完成crash文件的解析。

# 注意事项：
1. 脚本用到了wget，需提前安装好（也用到了unzip，不过这个应该是系统默认已经装好了）。
2. 把原始crash文件命名成 original.crash
3. 会把crash文件对应的uuid和dSYM文件中的都给打印出来，如果发现失败了，可以自己比对一下。
4. 脚本可以传入dSYMFileUrl文件作为参数，此时该脚本会删除当前目录下的*.dSYM 文件和*.zip 文件。然后根据输入的dSYMFileUrl重新下载。
5. 如果脚本没有传入参数，此时该脚本会根据当前目录下的*.dSYM 进行解析，最好此时保证当前目录只有一个.dSYM文件。
6. symbolicatecrash 的文件我写死成

 ~~~
 /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash
 ~~~
 当然我可以每次都find，不过那样太浪费时间了。如果后续Xcode版本升级了，可以改一下这个目录。 用 
 
 ~~~
 find /Applications/Xcode.app -name symbolicatecrash -type f 
 ~~~
 
 命令可以找到所在都路径。


# 使用方法：
1. 把脚本下载到本地文件夹中
2. chmod +x FDsymbolicatecrash.sh
3. 新建一个文件original.crash
4. 执行 ./FDsymbolicatecrash.sh dSYMFileUrl 这种方式可以先下载再解析。
5. 执行 ./FDsymbolicatecrash.sh 会根据本地已经有的dSYM文件进行解析。
