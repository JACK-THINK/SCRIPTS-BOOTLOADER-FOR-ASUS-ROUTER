# Readme for anki_server

## 概述

1. 本插件用于安装、配置、启动和结束anki_server

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/anki_server/`

| 权限      | 名称      | 属性     | 说明             |
| --------- | --------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc       | 目录     | 配置文件目录     |
| rwxrwxrwx | usr       | 目录     | 外部软件资源目录 |
| rwxrwxrwx | var       | 目录     | 可变文件目录     |

`ASUS_ROUTER/script_bootloader/usr/anki_server/bin/`

| 权限      | 名称                        | 属性     | 说明                           |
| --------- | --------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | anki_server_install         | 普通文件 | 插件的安装程序                 |
| rwxrwxrwx | anki_server_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | anki_server_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/anki_server/etc/`

| 权限      | 名称                | 属性     | 说明            |
| --------- | ------------------- | -------- | --------------- |
| rwxrwxrwx | config.ankiserver   | 普通文件 | 安装时自动生成  |
| rwxrwxrwx | monit.d/anki_server | 普通文件 | monit.d配置文件 |

`ASUS_ROUTER/script_bootloader/usr/anki_server/usr/`

| 权限      | 名称            | 属性 | 说明               |
| --------- | --------------- | ---- | ------------------ |
| rwxrwxrwx | example         | 目录 | 软件配置模板目录   |
| rwxrwxrwx | venv_ankiserver | 目录 | Python虚拟环境目录 |

`ASUS_ROUTER/script_bootloader/usr/anki_server/usr/example`

| 权限      | 名称                        | 属性     | 说明             |
| --------- | --------------------------- | -------- | ---------------- |
| rwxrwxrwx | example.ini                 | 普通文件 | 软件配置模板文件 |
| rwxrwxrwx | logging.conf                | 普通文件 | 软件配置模板文件 |
| rwxrwxrwx | supervisor-anki-server.conf | 普通文件 | 软件配置模板文件 |

`ASUS_ROUTER/script_bootloader/usr/anki_server/var/`

| 权限      | 名称        | 属性     | 说明           |
| --------- | ----------- | -------- | -------------- |
| rwxrwxrwx | collections | 目录     | 软件同步目录   |
| rwxrwxrwx | session.db  | 普通文件 | 会话数据库     |
| rwxrwxrwx | auth.db     | 普通文件 | 用户账户数据库 |

`ASUS_ROUTER/script_bootloader/usr/anki_server/var/collections`

| 权限      | 名称     | 属性 | 说明         |
| --------- | -------- | ---- | ------------ |
| rwxrwxrwx | <用户名> | 目录 | 用户资源目录 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/anki_server/bin/anki_server_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件                    | 插件调用者          |
| --------------------------- | ------------------- |
| anki_server_enable.service  | monit.d/anki_server |
| anki_server_disable.service | monit.d/anki_server |

## 使用方法

> 默认用户名：路由器管理页面登陆用户名
>
> 默认密码：路由器管理页面登陆密码
>
> 自定义同步服务器：http://<路由器IP地址>:27701
>
> 数据集目录：`/opt/script_bootloader/usr/anki_server/var/collections/`