# alpine-3.18-qbittorrent-install-4.39
alpine 3.18 系统一键安装qbittorrent-install  4.39

安装说明：
1. 更新包服务并安装依赖
   

apk update&&apk add shadow wget curl bash

2.下载并执行脚本
 
    wget https://raw.githubusercontent.com/Frischman/alpine-3.18-qbittorrent-install-4.39/main/qbittorrent-install -O qbittorrent-install.sh && chmod +x qbittorrent-install.sh && bash qbittorrent-install.sh

 3.重启服务
    
    rc-service qbittorrent restart

 4.查看服务状态
    
    rc-service qbittorrent status
