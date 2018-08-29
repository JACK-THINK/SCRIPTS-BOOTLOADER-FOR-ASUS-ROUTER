# Readme for v2ray

## 概述

1. 本插件用于安装、配置、启动和结束v2ray
2. v2ray客户端，用来连接远端v2ray服务器
3. 客户端需安装socks5代理工具连接本插件

   | 客户端    | 代理工具      |
   | --------- | ---------     |
   | Chrome    | SwitchyOmega  |
   | iOS       | Kitsunebi     |
   | Android   | BifrostV      |

4. 暂不开发透明代理，直到华硕官方固件支持tproxy
5. 远端端口：22815；本地端口：1080

## 安装前提

1. 必须安装并启用entware和monit
2. 如需使用v2ray_server，还需安装sbl-firewalld并启用fw_filter_INPUT_v2ray_server
   
   | 协议          | 端口号    |
   | ---           | ----      |
   | vmess         | 22815     |
   | shadowsocks   | 22816     |

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/v2ray/`

| 权限      | 名称     | 属性     | 说明   |
| --------- | -------- | -------- | -------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件 |
| rwxrwxrwx | bin    | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc    | 目录     | 配置文件目录 |

`ASUS_ROUTER/script_bootloader/usr/v2ray/bin/`

| 权限      | 名称                     | 属性     | 说明                                       |
| --------- | ------------------------ | -------- | ------------------------------------------ |
| rwxrwxrwx | v2ray_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | v2ray_client_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | v2ray_client_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | v2ray_server_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | v2ray_server_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | v2ray-linux-arm.zip | 普通文件 | v2ray预编译文件，适用于arm架构 |
| rwxrwxrwx | v2ray-linux-arm64.zip | 普通文件 | v2ray预编译文件，适用于arm64架构 |
| rwxrwxrwx | v2ray-linux-mipsle.zip | 普通文件 | v2ray预编译文件，适用于mipsle架构 |

`ASUS_ROUTER/script_bootloader/usr/v2ray/etc/`

| 权限      | 名称          | 属性     | 说明                 |
| --------- | ------------- | -------- | -------------------- |
| rwxrwxrwx | config_client.json | 普通文件 | v2ray_client_enable.service的配置文件 |
| rwxrwxrwx | config_server.json | 普通文件 | v2ray_server_enable.service的配置文件 |
| rwxrwxrwx | monit.d/v2ray_client | 普通文件 | monit.d配置文件 |
| rwxrwxrwx | monit.d/v2ray_server | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/v2ray/bin/v2ray_install`。程序会根据路由器架构，自动安装适当版本的v2ray

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                   |
   > | ----------- | ------------------------------------------------------------ |
   > | **aarch64** | RT-AC86U                                                     |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                    |

## 调用方法

| 插件文件                     | 插件调用者            |
| -----------------------      | --------------------- |
| v2ray_client_enable.service  | monit.d/v2ray_client  |
| v2ray_client_disable.service | monit.d/v2ray_client  |
| v2ray_server_enable.service  | monit.d/v2ray_server  |
| v2ray_server_disable.service | monit.d/v2ray_server  |

## 需修改部分

`v2ray/etc/config_client.json`

| 行号 | 代码                         | 说明                   |
| ---- | ---------------------------- | ---------------------- |
| 4   | `"port":`           | 浏览器使用的socks5监听端口       |
| 25   | `"address":`      | V2RAY服务器IP地址           |
| 26   | `"port":` | V2RAY监听端口 |
| 30   | `"id":`           | VMess用户的主ID           |

`v2ray/etc/config_server.json`

| 行号 | 代码                         | 说明                   |
| ---- | ---------------------------- | ---------------------- |
| 12   | `"id":`           | VMess用户的主ID       |
| 42   | `"password":`           | Shadowsocks密码           |