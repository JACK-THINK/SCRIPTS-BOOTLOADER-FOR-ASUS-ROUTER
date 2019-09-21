# Readme for ali_ddns

## 概述

1. 本插件用于启动和结束ali_ddns
2. 该插件仅适用于使用阿里云作为DNS服务提供商的域名
3. 安装本插件后，可直接实现DDNS，不依赖华硕路由器固件中DDNS客户端
4. 当路由器通过PPPoE方式拨号上网时，若获得的IP地址为私有IP，则自动禁用DDNS服务，并向指定邮箱发送提醒邮件

## 安装前提

1. 必须安装并启用entware、monit和aliyun

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/ali_ddns/`

| 权限      | 名称      | 属性     | 说明             |
| --------- | --------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc       | 目录     | 配置文件目录     |
| rwxrwxrwx | tmp       | 目录     | 临时文件目录     |
| rwxrwxrwx | usr       | 目录     | 外部软件资源目录 |

`ASUS_ROUTER/script_bootloader/usr/ali_ddns/bin/`

| 权限      | 名称                     | 属性     | 说明                           |
| --------- | ------------------------ | -------- | ------------------------------ |
| rwxrwxrwx | ali_ddns_install         | 普通文件 | 安装程序                       |
| rwxrwxrwx | ali_ddns_configure       | 普通文件 | 配置程序                       |
| rwxrwxrwx | ali_ddns_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ali_ddns_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/ali_ddns/etc/`

| 权限      | 名称             | 属性     | 说明            |
| --------- | ---------------- | -------- | --------------- |
| rwxrwxrwx | monit.d/ali_ddns | 普通文件 | monit.d配置文件 |

`ASUS_ROUTER/script_bootloader/usr/ali_ddns/tmp/`

| 权限      | 名称     | 属性     | 说明                       |
| --------- | -------- | -------- | -------------------------- |
| rwxrwxrwx | mail.tmp | 普通文件 | 使用curl发送邮件时自动生成 |

`ASUS_ROUTER/script_bootloader/usr/ali_ddns/usr/`

| 权限      | 名称                 | 属性     | 说明                           |
| --------- | -------------------- | -------- | ------------------------------ |
| rwxrwxrwx | NO_PUBLIC_IP_ADDRESS | 普通文件 | 通知邮件文件（用于无公网IP时） |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/ali_ddns/bin/ali_ddns_install`

## 调用方法

| 插件文件                 | 插件调用者       |
| ------------------------ | ---------------- |
| ali_ddns_enable.service  | monit.d/ali_ddns |
| ali_ddns_disable.service | monit.d/ali_ddns |