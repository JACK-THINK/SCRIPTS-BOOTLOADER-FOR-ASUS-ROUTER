# Readme for development_tools

## 概述

1. 本插件用于安装、配置、启动和禁用development_tools
2. 安装本插件后，可直接使用全部coreutils、gcc、python3、pip3等，无需另行配置

## 安装前提

1. 必须安装并启用entware

## 文件结构

`development_tools/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`development_tools/bin/`

| 权限      | 名称                              | 属性     | 说明                                       |
| --------- | --------------------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | development_tools_install         | 普通文件 | 安装文件                                   |
| rwxrwxrwx | development_tools_enable.service  | 普通文件 | （**必选**）插件的可执行程序，用于启动程序 |
| rwxrwxrwx | development_tools_disable.service | 普通文件 | （**必选**）插件的可执行程序，用于结束程序 |

`development_tools/etc/`

| 权限      | 名称                     | 属性     | 说明                              |
| --------- | ------------------------ | -------- | --------------------------------- |
| rwxrwxrwx | aarch64_list_of_packages | 普通文件 | 适用于aarch64架构的程序包安装列表 |
| rwxrwxrwx | armv7l_list_of_packages  | 普通文件 | 适用于armv7l架构的程序包安装列表  |

## 调用方法

| 插件文件                          | 插件调用者                   | 调用位置  |
| --------------------------------- | ---------------------------- | --------- |
| development_tools_enable.service  | list_of_user_custom_scripts  | 37-49行间（默认禁用，需手动启用） |
| development_tools_disable.service | script_bootloader_usb_umount |           |
