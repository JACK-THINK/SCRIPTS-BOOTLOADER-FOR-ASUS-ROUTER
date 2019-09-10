# Readme for shadowsocks

## 概述

1. 本插件用于安装、配置、启动和结束shadowsocks
2. ss_local客户端，用来连接远端shadowsocks服务器
3. 客户端需安装socks5代理工具连接ss_local

   | 客户端  | 代理工具     |
   | ------- | ------------ |
   | Chrome  | SwitchyOmega |
   | iOS     | Kitsunebi    |
   | Android | BifrostV     |

4. 支持全局透明代理（需手动在shell中执行ss_transparent_proxy_enable.service（DNS无混淆）或ss_transparent_proxy_overture_enable.service（全混淆）），但仅能代理TCP流量。代理UDP流量的功能须等到华硕官方固件支持tproxy

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/bin/`

| 权限      | 名称                                               | 属性     | 说明                           |
| --------- | -------------------------------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | shadowsocks_install                                | 普通文件 | 安装文件                       |
| rwxrwxrwx | fw_ss_transparent_proxy_enable.service             | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | fw_ss_transparent_proxy_disable.service            | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_local_enable.service                            | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_local_disable.service                           | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_redir_enable.service                            | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_redir_disable.service                           | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_server_enable.service                           | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_server_disable.service                          | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_tunnel_enable.service                           | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_tunnel_disable.service                          | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_enable_file.service           | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_disable_file.service          | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_enable_file.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_disable_file.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_enable_prog.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_disable_prog.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/etc/`

| 权限      | 名称                                       | 属性     | 说明                               |
| --------- | ------------------------------------------ | -------- | ---------------------------------- |
| rwxrwxrwx | config_local.json                          | 普通文件 | ss_local_enable.service的配置文件  |
| rwxrwxrwx | config_redir.json                          | 普通文件 | ss_redir_enable.service的配置文件  |
| rwxrwxrwx | config_server.json                         | 普通文件 | ss_server_enable.service的配置文件 |
| rwxrwxrwx | config_tunnel.json                         | 普通文件 | ss_tunnel_enable.service的配置文件 |
| rwxrwxrwx | monit.d/ss_local                           | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_redir                           | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_server                          | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_tunnel                          | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_transparent_proxy_file          | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_transparent_proxy_overture_file | 普通文件 | monit.d配置文件                    |
| rwxrwxrwx | monit.d/ss_transparent_proxy_overture_prog | 普通文件 | monit.d配置文件                    |

## 安装方法

1. 必须首先按照说明修改全部配置文件
2. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/shadowsocks/bin/shadowsocks_install`

## 需修改部分

`shadowsocks/etc/config_local.json`

| 行号 | 代码             | 说明                      |
| ---- | -----------------| ------------------------- |
| 2    | `"server":`      | Shadowsocks服务器IP地址   |
| 3    | `"server_port":` | Shadowsocks服务器监听端口 |
| 5    | `"local_port":`  | 本地监听端口              |
| 6    | `"password":`    | 密码                      |

`shadowsocks/etc/config_redir.json`

| 行号 | 代码             | 说明                      |
| ---- | -----------------| ------------------------- |
| 2    | `"server":`      | Shadowsocks服务器IP地址   |
| 3    | `"server_port":` | Shadowsocks服务器监听端口 |
| 5    | `"local_port":`  | 本地监听端口              |
| 6    | `"password":`    | 密码                      |

`shadowsocks/etc/config_tunnel.json`

| 行号 | 代码             | 说明                      |
| ---- | ---------------- | ------------------------- |
| 2    | `"server":`      | Shadowsocks服务器IP地址   |
| 3    | `"server_port":` | Shadowsocks服务器监听端口 |
| 5    | `"local_port":`  | 本地监听端口              |
| 6    | `"password":`    | 密码                      |