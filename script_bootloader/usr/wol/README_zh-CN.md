# Readme for wol

## 概述

1. 本插件用于配置、启动和结束wol
2. 安装本插件后，可实现定时开机（需要计算机支持WOL）

## 安装前提

1. 无

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/wol/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/wol/bin/`

| 权限      | 名称                | 属性     | 说明                           |
| --------- | ------------------- | -------- | ------------------------------ |
| rwxrwxrwx | wol_install         | 普通文件 | 插件的安装程序                 |
| rwxrwxrwx | wol_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | wol_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/wol/etc/`

| 权限      | 名称        | 属性     | 说明            |
| --------- | ----------- | -------- | --------------- |
| rwxrwxrwx | monit.d/wol | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/wol/bin/wol_install`

## 调用方法

| 插件文件            | 插件调用者  |
| ------------------  | ------------|
| wol_enable.service  | monit.d/wol |
| wol_disable.service | monit.d/wol |

## 需修改部分

`wol/bin/wol_enable.service`

| 行号 | 代码                          | 说明                    |
| ---- | ----------------------------- | ----------------------- |
| 33   | `PC1="br0 XX:XX:XX:XX:XX:XX"` | 需被唤醒计算机的MAC地址 |
| 43   | `30 4 * * *`                  | 唤醒时间                |
| 44   | `AT 4:30 EVERYDAY`            | 提示信息                |