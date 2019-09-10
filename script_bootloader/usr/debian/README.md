# Readme for debian

## 概述

1. 本插件用于安装、卸载debian
2. 安装本插件后，可直接在路由器上开启debian环境，安装海量软件（远多于entware）

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/debian/`

| 权限      | 名称      | 属性     | 说明             |
| --------- | --------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc       | 目录     | 配置文件目录     |
| rwxrwxrwx | usr       | 目录     | 外部软件资源目录 |

`ASUS_ROUTER/script_bootloader/usr/debian/bin/`

| 权限      | 名称             | 属性     | 说明           |
| --------- | ---------------- | -------- | -------------- |
| rwxrwxrwx | debian_install   | 普通文件 | 插件的安装程序 |
| rwxrwxrwx | debian_uninstall | 普通文件 | 插件的卸载程序 |

`ASUS_ROUTER/script_bootloader/usr/debian/etc/`

| 权限      | 名称                 | 属性     | 说明               |
| --------- | -------------------- | -------- | ------------------ |
| rwxrwxrwx | chroot-services.list | 普通文件 | debian服务列表     |
| rwxrwxrwx | S99debian            | 普通文件 | debian环境启动程序 |

`ASUS_ROUTER/script_bootloader/usr/debian/usr/`

| 权限      | 名称                           | 属性     | 说明       |
| --------- | ------------------------------ | -------- | ---------- |
| rwxrwxrwx | debian_jessie8.9-arm_clean.tgz | 普通文件 | debian环境 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/debian/bin/debian_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构      | 路由器型号                                                                         |
   > | --------- | ---------------------------------------------------------------------------------- |
   > | **armv7** | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |

## 调用方法

由entware自动执行