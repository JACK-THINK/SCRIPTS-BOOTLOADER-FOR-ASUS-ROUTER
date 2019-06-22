# Readme for ipmitool

## 概述

1. 本插件用于安装ipmitool

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/ipmitool/`

| 权限      | 名称        | 属性     | 说明             |
| --------- | ----------- | -------- | --------------   |
| rwxrwxrwx | README.md   | 普通文件 | 说明文件         |
| rwxrwxrwx | bin         | 目录     | 可执行文件目录   |
| rwxrwxrwx | alternative | 目录     | 备用安装文件目录 |

`ASUS_ROUTER/script_bootloader/usr/ipmitool/bin/`

| 权限      | 名称             | 属性     | 说明     |
| --------- | ---------------- | -------- | -------- |
| rwxrwxrwx | ipmitool_install | 普通文件 | 安装文件 |

`ASUS_ROUTER/script_bootloader/usr/ipmitool/alternative/`

| 权限      | 名称                                            | 属性     | 说明                 |
| --------- | ----------------------------------------------- | -------- | -------------------- |
| rwxrwxrwx | aarch64-3.10/ipmitool_1.8.18-3_aarch64-3.10.ipk | 普通文件 | ipmitool备用安装文件 |
| rwxrwxrwx | armv7-2.6/ipmitool_1.8.18-3_armv7-2.6.ipk       | 普通文件 | ipmitool备用安装文件 |

## 安装方法

1. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/ipmitool/bin/ipmitool_install`