# Readme for v2ray

## 概述

1. 本插件用于安装、配置、启动和结束v2ray
2. 客户端需安装支持socks5协议/Vmess协议/Shadowsocks协议的代理工具连接本插件

   | 客户端    | 代理工具      |
   | --------- | ------------- |
   | Chrome    | SwitchyOmega  |
   | iOS       | Quantumult    |
   | Android   | BifrostV      |

3. 支持全局透明代理（需手动在shell中执行v2ray_transparent_proxy_enable.service（全混淆））。华硕原厂固件仅能代理TCP流量，梅林固件可以代理TCP和UDP流量
4. 监听端口：1080, 1081, 22815, 22816, 22817, 22818
   
   | 协议        | 端口号 | 代理   | 使用场景                        |
   | ----------- | ------ | ------ | ------------------------------- |
   | socks5      | 1080   | VPS    | 内网设备科学上网                |
   | vmess       | 22815  | VPS    | 外网设备接入路由器实现科学上网  |
   | shadowsocks | 22816  | VPS    | 外网设备接入路由器实现科学上网  |
   | vmess       | 22817  | 路由器 | 外网设备接入路由器实现回国上网  |
   | shadowsock  | 22818  | 路由器 | 外网设备接入路由器实现回国上网  |

## 安装前提

1. 必须安装并启用entware和monit
2. 必须安装sbl-firewalld并启用fw_filter_INPUT_v2ray

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/v2ray/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/v2ray/bin/`

| 权限      | 名称                                    | 属性     | 说明                                       |
| --------- | --------------------------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | v2ray_install                           | 普通文件 | 安装文件                                   |
| rwxrwxrwx | v2ray_enable.service                    | 普通文件 | 插件的可执行程序，用于启动程序             |
| rwxrwxrwx | v2ray_disable.service                   | 普通文件 | 插件的可执行程序，用于结束程序             |
| rwxrwxrwx | v2ray_fw_enable.service                 | 普通文件 | 插件的可执行程序，用于启动程序             |
| rwxrwxrwx | v2ray_fw_disable.service                | 普通文件 | 插件的可执行程序，用于结束程序             |
| rwxrwxrwx | v2ray_transparent_proxy_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序             |
| rwxrwxrwx | v2ray_transparent_proxy_disable.service | 普通文件 | 插件的可执行程序，用于结束程序             |
| rwxrwxrwx | v2ray-linux-arm.zip                     | 普通文件 | v2ray预编译文件，适用于arm架构             |
| rwxrwxrwx | v2ray-linux-arm64.zip                   | 普通文件 | v2ray预编译文件，适用于arm64架构           |
| rwxrwxrwx | v2ray-linux-mipsle.zip                  | 普通文件 | v2ray预编译文件，适用于mipsle架构          |

`ASUS_ROUTER/script_bootloader/usr/v2ray/etc/`

| 权限      | 名称          | 属性     | 说明                           |
| --------- | ------------- | -------- | ------------------------------ |
| rwxrwxrwx | config.json   | 普通文件 | v2ray_enable.service的配置文件 |
| rwxrwxrwx | monit.d/v2ray | 普通文件 | monit.d配置文件                |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/v2ray/bin/v2ray_install`。程序会根据路由器架构，自动安装适当版本的v2ray

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件                                | 插件调用者                      |
| ------------------                      | ------------------------------- |
| v2ray_enable.service                    | monit.d/v2ray                   |
| v2ray_disable.service                   | monit.d/v2ray                   |
| v2ray_transparent_proxy_enable.service  | monit.d/v2ray_transparent_proxy |
| v2ray_transparent_proxy_disable.service | monit.d/v2ray_transparent_proxy |

## 需修改部分

`v2ray/etc/config.json`

| 行号 | 代码          | 说明                                  |
| ---- | --------------| ------------------------------------- |
| 23   | `"address":`  | 上游DNS地址                           |
| 61   | `"id":`       | 使用vmess协议接入路由器所用的用户主ID |
| 148  | `"password":` | 接入路由器所用的Shadowsocks密码       |
| 164  | `"id":`       | 使用vmess协议接入路由器所用的用户主ID |
| 251  | `"password":` | 接入路由器所用的Shadowsocks密码       |
| 269  | `"address":`  | VPS的IP地址或域名                     |
| 270  | `"port":`     | 使用vmess协议接入VPS所用的监听端口    |
| 274  | `"id":`       | 使用vmess协议接入VPS所用的用户主ID    |