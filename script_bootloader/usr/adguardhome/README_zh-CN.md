# Readme for AdGuardHome

## 概述

1. 本插件用于安装、配置、启动和结束AdGuardHome
2. DNS服务器监听端口号：2153
3. AdGuardHome默认上游DNS服务器：114.114.114.114
4. 本插件不可与插件shadowsocks透明代理和v2ray透明代理共同使用
5. 本插件作为dnsmasq的上游DNS服务器运行，因此，不能以客户端为单位监控并记录DNS请求

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
| rwxrwxrwx | adguardhome_update          | 普通文件 | 升级文件（暂不可用）           |
| rwxrwxrwx | adguardhome_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | adguardhome_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/adguardhome/etc/`

| 权限      | 名称                | 属性     | 说明            |
| --------- | ------------------- | -------- | --------------- |
| rwxrwxrwx | monit.d/adguardhome | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/adguardhome/bin/adguardhome_install`。程序会根据路由器架构，自动安装适当版本的adguardhome

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构                 | 路由器型号                                                                                                                                                        |
   > | -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64**          | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7** (暂不支持) | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**           | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

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