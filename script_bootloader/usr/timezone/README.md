# Readme for timezone

## 概述

1. 本插件用于安装、配置、启动和结束timezone

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/timezone/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/timezone/bin/`

| 权限      | 名称                     | 属性     | 说明                           |
| --------- | ------------------------ | -------- | ------------------------------ |
| rwxrwxrwx | timezone_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | timezone_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | timezone_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/timezone/etc/`

| 权限      | 名称      | 属性         | 说明           |
| --------- | --------- | ------------ | -------------- |
| rwxrwxrwx | localtime | 符号链接文件 | 安装时自动生成 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/timezone/bin/timezone_install`

## 调用方法

| 插件文件                 | 插件调用者                   | 调用位置                          |
| ------------------------ | ---------------------------- | --------------------------------- |
| timezone_enable.service  | script_bootloader_usb_mount  | 106-115行间（安装后默认开机加载） |
| timezone_disable.service | script_bootloader_usb_umount | 158-169行间（安装后默认关机加载） |