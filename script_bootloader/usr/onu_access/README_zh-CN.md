# Readme for onu_access

## 概述

1. 当通过桥接模式连接路由器和光猫（ONU）时（即路由器拨号上网），路由器后的设备往往不能够直接访问光猫的配置页面。本插件将彻底改变此情况

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/onu_access/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/onu_access/bin/`

| 权限      | 名称                 | 属性     | 说明     |
| --------- | -------------------- | -------- | -------- |
| rwxrwxrwx | onu_access_install   | 普通文件 | 安装程序 |
| rwxrwxrwx | onu_access_configure | 普通文件 | 配置程序 |

`ASUS_ROUTER/script_bootloader/usr/onu_access/etc/`

| 权限      | 名称                        | 属性     | 说明                |
| --------- | --------------------------- | -------- | ------------------- |
| rwxrwxrwx | monit.d/onu_access_template | 普通文件 | monit.d配置文件模板 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/onu_access/bin/onu_access_install`。程序会根据路由器架构，自动安装适当版本的onu_access

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |