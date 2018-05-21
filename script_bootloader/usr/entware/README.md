# Readme for entware

## 概述

1. 本插件用于安装、配置、启动和禁用entware

## 安装前提

1. 必须安装并启用swap

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/entware/`（插件entware目录）

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |

`ASUS_ROUTER/script_bootloader/usr/entware/bin/`（插件entware可执行文件目录）

| 权限      | 名称                    | 属性     | 说明                                       |
| --------- | ----------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | entware_install         | 普通文件 | 安装文件                                   |
| rwxrwxrwx | entware_enable.service  | 普通文件 | （**必选**）插件的可执行程序，用于启动程序 |
| rwxrwxrwx | entware_disable.service | 普通文件 | （**必选**）插件的可执行程序，用于结束程序 |

## 调用方法

| 插件文件                | 插件调用者                   | 调用位置    |
| ----------------------- | ---------------------------- | ----------- |
| entware_enable.service  | script_bootloader_usb_mount  | 142-153行间 |
| entware_disable.service | script_bootloader_usb_umount |             |
