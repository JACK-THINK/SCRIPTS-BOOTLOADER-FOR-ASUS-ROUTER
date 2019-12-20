# Readme for AdGuardHome

## 概述

1. 本插件用于安装、配置、启动和结束AdGuardHome
2. DNS服务器监听端口号：2153
3. AdGuardHome默认上游DNS服务器：114.114.114.114
4. 本插件不可与插件shadowsocks透明代理和v2ray透明代理共同使用

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/adguardhome/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/adguardhome/bin/`

| 权限      | 名称                        | 属性     | 说明                           |
| --------- | --------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | bcrypt-tool                 | 目录     | bcrypt-tool加密工具目录        |
| rwxrwxrwx | adguardhome_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | adguardhome_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | adguardhome_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | adguardhome_upgrade         | 普通文件 | 升级文件                       |

`ASUS_ROUTER/script_bootloader/usr/adguardhome/etc/`

| 权限      | 名称                | 属性     | 说明            |
| --------- | ------------------- | -------- | --------------- |
| rwxrwxrwx | monit.d/adguardhome | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/adguardhome/bin/adguardhome_install`。程序会根据路由器架构，自动安装适当版本的adguardhome

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号 |
   > | ----------- | ---------- |
   > | **aarch64** | RT-AC86U   |

## 调用方法

| 插件文件                    | 插件调用者          |
| --------------------------- | ------------------- |
| adguardhome_enable.service  | monit.d/adguardhome |
| adguardhome_disable.service | monit.d/adguardhome |

## 使用方法

> 默认用户名：路由器管理页面登陆用户名
>
> 默认密码：路由器管理页面登陆密码
>
> 自定义同步服务器：http://<路由器IP地址>:14711
>
> 工作目录：`/opt/script_bootloader/usr/adguardhome/etc/`