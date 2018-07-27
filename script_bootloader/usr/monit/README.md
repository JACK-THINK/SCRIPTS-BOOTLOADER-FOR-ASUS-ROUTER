# Readme for monit

## 概述

1. 本插件用于安装、配置monit
2. 默认端口：35490
3. 登录账号：
   - 用户名：admin
   - 密码：monit

## 安装前提

1. 必须安装并启用entware

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/monit/`

| 权限      | 名称      | 属性     | 说明             |
| --------- | --------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc       | 目录     | 配置文件目录 |

`ASUS_ROUTER/script_bootloader/usr/monit/bin/`

| 权限      | 名称                 | 属性     | 说明                                                         |
| --------- | -------------------- | -------- | ------------------------------------------------------------ |
| rwxrwxrwx | monit_install         | 普通文件 | 插件的安装程序                                               |

`ASUS_ROUTER/script_bootloader/usr/monit/etc/`

| 权限      | 名称         | 属性     | 说明         |
| --------- | ------------ | -------- | ------------ |
| rwxrwxrwx | monit.d | 目录 | 各服务监控配置文件目录 |
| rwxrwxrwx | mmonitrc | 普通文件 | monit配置文件 |
| rwxrwxrwx | mmonitrc.bak | 普通文件 | 安装时自动生成 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/monit/bin/monit_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   > 
   > | 架构        | 路由器型号                                                   |
   > | ----------- | ------------------------------------------------------------ |
   > | **aarch64** | RT-AC86U                                                     |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                    |

## 调用方法

由entware自动执行

## 特殊说明

1. `ASUS_ROUTER/script_bootloader/usr/monit/etc/monit.d`目录下存放了一些预置的服务监控配置文件，默认为禁用状态。若要启用，请将其重新命名为
   ```
   <原文件名>.awake
   ```