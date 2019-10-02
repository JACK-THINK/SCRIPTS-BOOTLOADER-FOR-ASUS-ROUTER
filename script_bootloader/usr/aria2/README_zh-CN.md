# Readme for aria2

## 概述

1. 本插件用于安装、配置、启动和结束aria2

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/aria2/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/aria2/bin/`

| 权限      | 名称                  | 属性     | 说明                           |
| --------- | --------------------- | -------- | ------------------------------ |
| rwxrwxrwx | aria2_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | aria2_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | aria2_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/aria2/etc/`

| 权限      | 名称          | 属性     | 说明            |
| --------- | ------------- | -------- | --------------- |
| rwxrwxrwx | aria2.conf    | 普通文件 | aria2的配置文件 |
| rwxrwxrwx | monit.d/aria2 | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/aria2/bin/aria2_install`。程序会根据路由器架构，自动安装适当版本的aria2

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件              | 插件调用者    |
| ------------------    | ------------  |
| aria2_enable.service  | monit.d/aria2 |
| aria2_disable.service | monit.d/aria2 |