# Readme for swap

## 概述

1. 本插件用于安装、配置、启动和结束虚拟内存（swap）

## 安装前提

1. 无

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/swap/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | var       | 目录     | 可变文件目录   |

`ASUS_ROUTER/script_bootloader/usr/swap/bin/`

| 权限      | 名称                 | 属性     | 说明                                       |
| --------- | -------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | swap_install         | 普通文件 | 安装文件                                   |
| rwxrwxrwx | swap_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | swap_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/swap/var/`

| 权限      | 名称         | 属性     | 说明                       |
| --------- | ------------ | -------- | -------------------------- |
| rwxrwxrwx | swapfile.var | 普通文件 | 安装时自动生成 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/swap/bin/swap_install`。安装512M虚拟内存

## 调用方法

| 插件文件             | 插件调用者                   | 调用位置    |
| -------------------- | ---------------------------- | ----------- |
| swap_enable.service  | script_bootloader_usb_mount  | 128-139行间（安装后默认开机加载） |
| swap_disable.service | script_bootloader_usb_umount | 131-142行间（安装后默认关机加载） |