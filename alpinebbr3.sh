#!/bin/bash

[ -e /etc/os-release ] && cat /etc/os-release | grep -i "PRETTY_NAME" | grep -qi "Alpine Linux v3.19" && os_alpine='1'

pre_check() {
    apk add virt-what

    [ "$os_alpine" != 1 ] && echo "本脚本仅支持 Alpine 3.19！" && exit 1

    # check root
    [[ $EUID -ne 0 ]] && echo -e "${red}错误: ${plain} 必须使用root用户运行此脚本！\n" && exit 1

    if [[ $(uname -m | grep 'x86_64') = "" ]]; then
        echo "本脚本仅支持 x86_64 架构！"
        exit 1
    fi

    if [[ $(virt-what | grep 'lxc\|openvz\|docker') != "" ]]; then
        echo "不支持容器虚拟化！"
        exit 1
    fi

    if [[ $(uname -r | grep 'virt') != "" ]]; then
        KERNEL_TYPE=virt
    elif [[ $(uname -r | grep 'lts') != "" ]]; then
        KERNEL_TYPE=lts
    else
        echo "不支持您的内核类型。"
        exit 1
    fi
}

install() {
    echo "下载公钥中"
    rm /etc/apk/keys/uub@email.address-65f7ef79.rsa.pub >/dev/null 2>&1
    wget -qP /etc/apk/keys https://cdn.pyzx.eu.org/p/uub@email.address-65f7ef79.rsa.pub
    echo "下载内核文件"
    rm -rf /tmp/linux-${KERNEL_TYPE}-*.apk >/dev/null 2>&1
    wget -qP /tmp https://cdn.pyzx.eu.org/p/linux-${KERNEL_TYPE}-6.6.21-r0.apk
    wget -qP /tmp https://cdn.pyzx.eu.org/p/linux-${KERNEL_TYPE}-dev-6.6.21-r0.apk
    if [[ $KERNEL_TYPE = lts ]]; then
        wget -qP /tmp https://cdn.pyzx.eu.org/p/linux-${KERNEL_TYPE}-doc-6.6.21-r0.apk
    fi
    echo "开始安装"
    if apk add /tmp/linux-${KERNEL_TYPE}-*.apk; then
        echo "安装成功，请重启。默认不进行启用操作，请自行启用bbr"
    else
        echo "安装失败"
    fi
}

pre_check
install
