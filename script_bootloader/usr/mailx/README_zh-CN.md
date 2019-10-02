# Readme for mailx

## 概述

1. 本插件用于安装、配置mailx

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/mailx/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/mailx/bin/`

| 权限      | 名称          | 属性     | 说明           |
| --------- | ------------- | -------- | -------------- |
| rwxrwxrwx | mailx_install | 普通文件 | 插件的安装程序 |

`ASUS_ROUTER/script_bootloader/usr/mailx/etc/`

| 权限      | 名称        | 属性     | 说明           |
| --------- | ----------- | -------- | -------------- |
| rwxrwxrwx | nail.rc.bak | 普通文件 | 安装时自动生成 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/mailx/bin/mailx_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 需修改部分

`mailx/bin/mailx_install`

| 行号 | 代码             | 说明                   |
| ---- | ---------------- | ---------------------- |
| 37   | `SMTP_SERVER=''` | 发件人的SMTP服务器地址 |
| 41   | `SENDER=''`      | 发件人邮箱地址         |
| 45   | `PASSWORD=""`    | 发件人密码             |