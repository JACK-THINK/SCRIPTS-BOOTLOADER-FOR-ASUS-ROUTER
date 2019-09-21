# Readme for onu_access

## 概述

1. 当通过桥接模式连接路由器和光猫（ONU）时（即路由器拨号上网），路由器后的设备往往不能够直接访问光猫的配置页面。本插件将彻底改变此情况

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/onu_access/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

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

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |