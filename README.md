Arduino手动编译工具

MAKE跟mksketch文件夹全是从proteus牛过来的嘻嘻😜。

运行setupEnv会在当前用户的环境变量中添加：

    ARDUINO_PATH
    AVR_HOME
    MAKE_HOME
    MKSKETCH_HOME
    AVRDUDE_CONF_PATH

    4个环境变量，并且加入用户的Path环境变量。

第二行"D:\Program Files\Arduino"请替换成自己arduino的安装路径

设置完环境变量就可以愉快的在vscode手动make编译arduino的程序了😜。

注意：在修改环境变量前先打开了vscode，改完环境变量后vscode可能不知道改了环境变量，重启下vscode就好了。