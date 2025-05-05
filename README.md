# alpine-qbittorrentinstall
alpine 系统一键安装qbittorrent-install
支持alpine 3.16-3.21系统
支持x86_64版本和arm系统

安装说明： 
 1.重启服务
    
    apk update && apk add shadow wget curl bash


 2.安装bbr_v3（仅支持alpine 3.19系统）

   wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/alpinebbr3.sh -O alpinebbr3.sh && chmod +x alpinebbr3.sh && bash alpinebbr3.sh
   

 
 3.系统网络优化

   wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/system_optimization.sh -O system_optimization.sh && chmod +x system_optimization.sh && bash system_optimization.sh
   

 4.重启vps  
 
 
 5.安装qb4.5.2+lib1.2.9
 
    wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/qbittorrent-install -O qbittorrent-install.sh && chmod +x qbittorrent-install.sh && bash qbittorrent-install.sh

 6.重启服务
    
    rc-service qbittorrent restart

 7.查看服务状态
    
    rc-service qbittorrent status
