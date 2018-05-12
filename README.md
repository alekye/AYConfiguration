# AYConfiguration
备份一些常用的配置文件，希望能在更换电脑后，实现一键配置环境的功能

1. 执行自动配置脚本
```
curl "https://raw.githubusercontent.com/alekye/AYConfiguration/master/run.sh?v=$(date +%s)" > /tmp/run.sh && bash /tmp/run.sh && rm /tmp/run.sh
```