#!/bin/sh

# 系统优化脚本 for Alpine Linux
echo ">>> 开始系统优化..."

# 启用 BBRv3/B既定（可选）
echo ">>> 检测并配置 BBR 模块（可选）"
if ! uname -r | grep -qi "bbr"; then
    echo "警告：当前内核可能不支持 BBRv3/B或未启用 BBR 模块"
    echo "建议使用支持 BBRv3 的内核，如 linux-edge，并在 grub 中启用"
else
    echo ">>> 已启用 BBR 相关内核"
fi

# 内存与 TCP 缓冲区优化
cat >> /etc/sysctl.conf <<EOF

# 内存和网络缓冲优化参数
vm.swappiness=10
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
net.ipv4.tcp_congestion_control=bbr
net.ipv4.tcp_notsent_lowat=16384
fs.file-max=1048576
EOF

sysctl -p

# CPU 优化（performance）
echo ">>> 设置 CPU 为 performance 模式"
for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
    echo performance > "$cpu/cpufreq/scaling_governor" 2>/dev/null || true
done

# 安装 irqbalance（如有必要）
apk add --no-cache irqbalance
rc-update add irqbalance default
rc-service irqbalance start

# 建议：使用 XFS 文件系统，并挂载时使用 noatime、nobarrier 等参数以优化 I/O

echo ">>> 系统优化完成，如涉及内核变更，请重启系统以生效。"
