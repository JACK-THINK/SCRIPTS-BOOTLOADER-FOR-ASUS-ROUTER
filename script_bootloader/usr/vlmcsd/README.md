# Readme for vlmcsd

## 概述

1. 本插件用于安装、启动和结束vlmcsd

## 安装前提

1. 无

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/vlmcsd/`

| 权限      | 名称      | 属性     | 说明             |
| --------- | --------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc       | 目录     | 配置文件目录     |
| rwxrwxrwx | usr       | 目录     | 外部软件资源目录 |

`ASUS_ROUTER/script_bootloader/usr/vlmcsd/bin/`

| 权限      | 名称                   | 属性     | 说明                           |
| --------- | ---------------------- | -------- | ------------------------------ |
| rwxrwxrwx | vlmcsd_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | vlmcsd_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | vlmcsd_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/vlmcsd/etc/`

| 权限      | 名称                  | 属性     | 说明              |
| --------- | --------------------- | -------- | ----------------- |
| rwxrwxrwx | dnsmasq.d/vlmcsd.conf | 普通文件 | dnsmasq.d配置文件 |
| rwxrwxrwx | monit.d/vlmcsd        | 普通文件 | monit.d配置文件   |

`ASUS_ROUTER/script_bootloader/usr/vlmcsd/usr/`

| 权限      | 名称                                                 | 属性         | 说明             |
| --------- | ---------------------------------------------------- | ------------ | ---------------- |
| rwxrwxrwx | vlmcsdmulti-armelv7-bcm47xx_53xx-openwrt-musl-static | 普通文件     | arm架构外部程序  |
| rwxrwxrwx | vlmcsdmulti-mips16el-asus-rt-n66u-uclibc-static      | 普通文件     | mips架构外部程序 |
| rwxrwxrwx | vlmcs                                                | 符号链接文件 | 安装时自动生成   |
| rwxrwxrwx | vlmcsd                                               | 符号链接文件 | 安装时自动生成   |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/vlmcsd/bin/vlmcsd_install`。程序会根据路由器架构，自动安装适当版本的vlmcsd

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
| vlmcsd_enable.service  | monit.d/vlmcsd |
| vlmcsd_disable.service | monit.d/vlmcsd |