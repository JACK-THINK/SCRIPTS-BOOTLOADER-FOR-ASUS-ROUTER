# Readme for overture

## 概述

1. 本插件用于安装、配置、启动和结束overture
2. 本插件用于将本机的DNS请求转发至ss-local，实现杜绝DNS污染
3. 监听端口：依赖shadowsocks/etc/config_local.json和shadowsocks/etc/config_tunnel.json

## 安装前提

1. 必须安装并启用entware和monit
2. 必须安装shadowsocks

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/overture/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/overture/bin/`

| 权限      | 名称                   | 属性     | 说明                                                      |
| --------- | ---------------------- | -------- | --------------------------------------------------------- |
| rwxrwxrwx | overture_install          | 普通文件 | 安装文件                                                  |
| rwxrwxrwx | overture_enable.service   | 普通文件 | 插件的可执行程序，用于启动程序（路由器启用SS全局代理时使用） |
| rwxrwxrwx | overture_disable.service  | 普通文件 | 插件的可执行程序，用于结束程序（路由器启用SS全局代理时使用） |
| rwxrwxrwx | overture-linux-arm.zip    | 普通文件 | overture预编译文件，适用于arm架构                            |
| rwxrwxrwx | overture-linux-arm64.zip  | 普通文件 | overture预编译文件，适用于arm64架构                          |
| rwxrwxrwx | overture-linux-mipsle.zip | 普通文件 | overture预编译文件，适用于mipsle架构                         |

`ASUS_ROUTER/script_bootloader/usr/overture/etc/`

| 权限      | 名称          | 属性     | 说明                           |
| --------- | ------------- | -------- | ------------------------------ |
| rwxrwxrwx | config.json   | 普通文件 | overture_enable.service的配置文件 |
| rwxrwxrwx | monit.d/overture | 普通文件 | monit.d配置文件                |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/overture/bin/overture_install`。程序会根据路由器架构，自动安装适当版本的overture

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件              | 插件调用者    |
| ------------------    | ------------  |
| overture_enable.service  | monit.d/overture |
| overture_disable.service | monit.d/overture |