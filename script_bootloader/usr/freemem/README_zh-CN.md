# Readme for freemem

## 概述

1. 本插件用于配置、启动和结束freemem
2. 安装本插件后，可实现自动清理内存

## 安装前提

1. 无

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/freemem/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/freemem/bin/`

| 权限      | 名称                    | 属性     | 说明                           |
| --------- | ----------------------- | -------- | ------------------------------ |
| rwxrwxrwx | freemem_install         | 普通文件 | 插件的安装程序                 |
| rwxrwxrwx | freemem_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | freemem_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/freemem/etc/`

| 权限      | 名称            | 属性     | 说明            |
| --------- | --------------- | -------- | --------------- |
| rwxrwxrwx | monit.d/freemem | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/freemem/bin/freemem_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 调用方法

| 插件文件                | 插件调用者      |
| ----------------------- | --------------- |
| freemem_enable.service  | monit.d/freemem |
| freemem_disable.service | monit.d/freemem |