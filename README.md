# 🚀 Alpine-qBittorrentInstall

一键在 Alpine 系统上安装 `qBittorrent`，支持版本 **Alpine 3.16 ~ 3.21**，兼容 **x86_64** 和 **ARM** 架构。

---

## 📋 安装步骤

### ✅ 1. 安装必要依赖

```bash
apk update && apk add shadow wget curl bash
```

---

### 📶 2. 安装 BBR v3（仅适用于 Alpine 3.19）

```bash
wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/alpinebbr3.sh -O alpinebbr3.sh && chmod +x alpinebbr3.sh && bash alpinebbr3.sh
```

---

### 🔄 3. 重启 VPS

```bash
reboot
```

---

### 🧪 4. 检查是否成功启用 BBR v3

```bash
modinfo tcp_bbr
```

如果未启用，请执行以下命令：

```bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
```

验证状态：

```bash
lsmod | grep bbr
sysctl net.core.default_qdisc
```

---

### 🚦 5. 执行系统网络优化

```bash
wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/system_optimization.sh -O system_optimization.sh && chmod +x system_optimization.sh && bash system_optimization.sh
```

---

### 🔁 6. 再次重启 VPS

```bash
reboot
```

---

### 🧩 7. 安装 qBittorrent 4.5.2 + libtorrent 1.2.9

```bash
wget https://raw.githubusercontent.com/Frischman/alpine-qbittorrentinstall/refs/heads/main/qbittorrent-install -O qbittorrent-install.sh && chmod +x qbittorrent-install.sh && bash qbittorrent-install.sh
```

---

### 🛠️ 8. 重启 qBittorrent 服务

```bash
rc-service qbittorrent restart
```

---

### 📡 9. 查看服务状态

```bash
rc-service qbittorrent status
```

---

## ✨ 特性

- ✅ 兼容 Alpine 3.16 ~ 3.21
- 💻 支持 x86_64 和 ARM 架构
- ⚙️ 一键安装 qBittorrent
- 🚀 可选启用 BBRv3 + 系统网络优化
- 🔧 使用 OpenRC 守护进程管理

---

## 📌 注意事项

- BBR v3 仅支持 Alpine 3.19 内核
- 建议在纯净 Alpine 环境中运行本脚本
- 此脚本适合用于 PT 下载专用 VPS

---

## 🧑‍💻 作者

Maintained by [Frischman](https://github.com/Frischman)

---
