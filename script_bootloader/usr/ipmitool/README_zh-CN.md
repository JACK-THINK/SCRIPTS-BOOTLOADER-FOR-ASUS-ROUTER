# Readme for ipmitool

## 概述

1. 本插件用于安装ipmitool

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/ipmitool/`

| 权限      | 名称              | 属性     | 说明             |
| --------- | ----------------- | -------- | --------------   |
| rwxrwxrwx | README_zh-CN.md   | 普通文件 | 说明文件         |
| rwxrwxrwx | bin               | 目录     | 可执行文件目录   |

`ASUS_ROUTER/script_bootloader/usr/ipmitool/bin/`

| 权限      | 名称             | 属性     | 说明     |
| --------- | ---------------- | -------- | -------- |
| rwxrwxrwx | ipmitool_install | 普通文件 | 安装程序 |

## 安装方法

1. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/ipmitool/bin/ipmitool_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |