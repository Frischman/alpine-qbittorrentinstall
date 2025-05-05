# alpine-qbittorrentinstall
alpine 系统一键安装qbittorrent-install
支持alpine 3.16-3.21系统
支持x86_64版本和arm系统

安装说明： 
 1.重启服务
    
    apk update && apk add shadow wget curl bash

 2.下载并执行脚本
 
    wget https://raw.githubusercontent.com/Frischman/alpine-3.18-qbittorrent-install-4.39/main/qbittorrent-install -O qbittorrent-install.sh && chmod +x qbittorrent-install.sh && bash qbittorrent-install.sh

 3.重启服务
    
    rc-service qbittorrent restart

 4.查看服务状态
    
    rc-service qbittorrent status
