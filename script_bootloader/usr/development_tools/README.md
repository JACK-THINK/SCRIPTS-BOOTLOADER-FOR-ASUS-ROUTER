# Readme for development_tools

## 概述

1. 本插件用于安装、配置、启动和结束development_tools
2. 安装本插件后，可直接使用全部coreutils、gcc、python3、pip3等，无需另行配置

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/development_tools/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/development_tools/bin/`

| 权限      | 名称                              | 属性     | 说明                                       |
| --------- | --------------------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | development_tools_install         | 普通文件 | 插件的安装程序                                   |
| rwxrwxrwx | development_tools_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | development_tools_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/development_tools/etc/`

| 权限      | 名称                     | 属性     | 说明                              |
| --------- | ------------------------ | -------- | --------------------------------- |
| rwxrwxrwx | aarch64_list_of_packages | 普通文件 | 适用于aarch64架构的程序包安装列表 |
| rwxrwxrwx | armv7l_list_of_packages  | 普通文件 | 适用于armv7l架构的程序包安装列表  |
| rwxrwxrwx | profile.bak  | 普通文件 | 安装时自动生成  |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/development_tools/bin/development_tools_install`。程序会根据路由器架构，自动安装适当版本的development_tools

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                   |
   > | ----------- | ------------------------------------------------------------ |
   > | **aarch64** | RT-AC86U                                                     |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |

## 调用方法

| 插件文件                          | 插件调用者                   | 调用位置  |
| --------------------------------- | ---------------------------- | --------- |
| development_tools_enable.service  | list_of_user_custom_scripts | 第49行（安装后需手动配置开机加载。启用：删除行首`#`；禁用：恢复行首`#`） |
| development_tools_disable.service | script_bootloader_usb_umount | 自动调用 |