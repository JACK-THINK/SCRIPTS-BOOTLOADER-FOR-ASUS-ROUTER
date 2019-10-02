# Readme for ariang

## 概述

1. 本插件用于安装、启动和结束ariang
2. 默认端口：18914

## 安装前提

1. 必须安装并启用entware，swap和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/ariang/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------  | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/ariang/bin/`

| 权限      | 名称                   | 属性     | 说明                           |
| --------- | ---------------------- | -------- | ------------------------------ |
| rwxrwxrwx | ariang_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | ariang_upgrade         | 普通文件 | 升级文件                       |
| rwxrwxrwx | ariang_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ariang_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/ariang/etc/`

| 权限      | 名称                 | 属性     | 说明            |
| --------- | -------------------- | -------- | --------------- |
| rwxrwxrwx | ariang_lighttpd.conf | 普通文件 | 安装时自动生成  |
| rwxrwxrwx | monit.d/ariang       | 普通文件 | monit.d配置文件 |

`ASUS_ROUTER/script_bootloader/usr/ariang/usr/`

| 权限      | 名称       | 属性     | 说明           |
| --------- | ---------- | -------- | -------------- |
| rwxrwxrwx | index.html | 普通文件 | 安装时自动生成 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/ariang/bin/ariang_install`。程序会根据路由器架构，自动安装适当版本的ariang

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件               | 插件调用者     |
| ---------------------- | -------------- |
| ariang_enable.service  | monit.d/ariang |
| ariang_disable.service | monit.d/ariang |