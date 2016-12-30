# FDsymbolicatecrash

这是一个用来解析iOS崩溃内容的脚本，书写的目的是为了提高工作效率。

# 注意事项：
1. 脚本用到了wget，需提前安装好（也用到了unzip，不过这个应该不用特地安装）
2. 把原始crash文件命名成 original.crash
3. 会把crash文件对应的uuid和dSYM文件中的都给打印出来，如果发现失败了，可以自己比对一下。
4. 最好保证运行脚本时，只有两个文件original.crash和FDsymbolicatecrash.sh。因为脚本在搜索dSYM文件都是通过后缀查找，最好保证目录下只有一个通过下载得到的。
5. symbolicatecrash 的文件我写死成

 ~~~
 /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash
 ~~~
 当然我可以每次都find，不过那样太浪费时间了。如果后续Xcode版本升级了，可以改一下这个目录。
 
6. 用 find /Applications/Xcode.app -name symbolicatecrash -type f 命令可以找到所在都路径。


# 使用方法：
1. 把脚本下载到本地文件夹中
2. chmod +x FDsymbolicatecrash.sh
3. 新建一个文件original.crash，此时目录底下只有两个文件
4. /FDsymbolicatecrash.sh dSYMFileUrl
