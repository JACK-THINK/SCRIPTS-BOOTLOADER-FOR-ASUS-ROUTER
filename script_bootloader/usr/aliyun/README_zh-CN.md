# Readme for aliyun-cli

## 概述

1. 本插件是aliyun-cli

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/aliyun/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |

`ASUS_ROUTER/script_bootloader/usr/aliyun/bin/`

| 权限      | 名称           | 属性     | 说明     |
| --------- | -------------- | -------- | -------- |
| rwxrwxrwx | aliyun_install | 普通文件 | 安装文件 |
| rwxrwxrwx | aliyun_upgrade | 普通文件 | 升级文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/aliyun/bin/aliyun_install`。程序会根据路由器架构，自动安装适当版本的aliyun

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |