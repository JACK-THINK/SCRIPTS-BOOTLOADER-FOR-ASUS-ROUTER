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

4. 支持全局透明代理，但仅能代理TCP流量。代理UDP流量的功能须等到华硕官方固件支持tproxy

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/`

| 权限      | 名称            | 属性     | 说明             |
| --------- | --------------- | -------- | ---------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件         |
| rwxrwxrwx | alternative     | 目录     | 备用安装文件目录 |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc             | 目录     | 配置文件目录     |

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/bin/`

| 权限      | 名称                                                  | 属性     | 说明                           |
| --------- | ----------------------------------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | shadowsocks_install                                   | 普通文件 | 安装程序                       |
| rwxrwxrwx | shadowsocks_configure                                 | 普通文件 | 配置程序                       |
| rwxrwxrwx | shadowsocks_uninstall                                 | 普通文件 | 卸载程序                       |
| rwxrwxrwx | fw_ss_transparent_proxy_enable.service                | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | fw_ss_transparent_proxy_disable.service               | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_local_enable.service                               | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_local_disable.service                              | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_redir_enable.service                               | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_redir_disable.service                              | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_server_enable.service                              | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_server_disable.service                             | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_tunnel_enable.service                              | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_tunnel_disable.service                             | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_enable_file.service              | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_disable_file.service             | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_enable_file.service     | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_disable_file.service    | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_enable_prog.service     | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_overture_disable_prog.service    | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | ss_transparent_proxy_without_dns_enable_file.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | ss_transparent_proxy_without_dns_disable_file.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/shadowsocks/etc/`

| 权限      | 名称                                          | 属性     | 说明                                   |
| --------- | --------------------------------------------- | -------- | -------------------------------------- |
| rwxrwxrwx | config_local.json.template                    | 普通文件 | ss_local_enable.service的配置模版文件  |
| rwxrwxrwx | config_redir.json.template                    | 普通文件 | ss_redir_enable.service的配置模版文件  |
| rwxrwxrwx | config_server.json.template                   | 普通文件 | ss_server_enable.service的配置模版文件 |
| rwxrwxrwx | config_tunnel.json.template                   | 普通文件 | ss_tunnel_enable.service的配置模版文件 |
| rwxrwxrwx | fw.d/ss_server_open                           | 普通文件 | fw.d配置文件                           |
| rwxrwxrwx | monit.d/fw_filter_INPUT_ss_server             | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_local                              | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_redir                              | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_server                             | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_tunnel                             | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_transparent_proxy_file             | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_transparent_proxy_overture_file    | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_transparent_proxy_overture_prog    | 普通文件 | monit.d配置文件                        |
| rwxrwxrwx | monit.d/ss_transparent_proxy_without_dns_file | 普通文件 | monit.d配置文件                        |

## 安装方法

1. 必须首先按照说明修改全部配置文件
2. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/shadowsocks/bin/shadowsocks_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 需修改部分

`shadowsocks/etc/config_local.json`

| 行号 | 代码             | 说明                            |
| ---- | -----------------| ------------------------------- |
| 2    | `"server":`      | Shadowsocks服务器的IP地址或域名 |
| 3    | `"server_port":` | Shadowsocks服务器的监听端口     |
| 6    | `"password":`    | 密码                            |

`shadowsocks/etc/config_redir.json`

| 行号 | 代码             | 说明                            |
| ---- | -----------------| ------------------------------- |
| 2    | `"server":`      | Shadowsocks服务器的IP地址或域名 |
| 3    | `"server_port":` | Shadowsocks服务器的监听端口     |
| 6    | `"password":`    | 密码                            |

`shadowsocks/etc/config_server.json`

| 行号 | 代码          | 说明 |
| ---- | ------------- | ---- |
| 4    | `"password":` | 密码 |

`shadowsocks/etc/config_tunnel.json`

| 行号 | 代码             | 说明                            |
| ---- | ---------------- | ------------------------------- |
| 2    | `"server":`      | Shadowsocks服务器的IP地址或域名 |
| 3    | `"server_port":` | Shadowsocks服务器的监听端口     |
| 6    | `"password":`    | 密码                            |

## 注意事项

1. 登录monit管理页面，可以看到SS_LOCAL和SS_TRANSPARENT_PROXY
2. SS_LOCAL是浏览器代理。可以配合客户端代理工具使用，路由器和未使用代理工具的客户端均在墙内
3. SS_TRANSPARENT_PROXY是全局透明代理。必须先在monit管理页面中停止SS_LOCAL，然后再启用SS_TRANSPARENT_PROXY。路由器和全体客户端均在墙外
4. 若配合Adguard-Home使用，需禁用ss_transparent_proxy_overture_file，启用ss_transparent_proxy_without_dns_file，并将Adguard-Home的上游DNS服务器设置为`https://dns.adguard.com/dns-query`

## 使用方法

- Socks5代理服务器

   功能：全局代理，配合客户端socks5代理工具使用

   路由器：在monit管理页面中，停止服务`SS_TRANSPARENT_PROXY`，启动服务`SS_LOCAL`

   客户端：按照文件`shadowsocks/etc/config_local.json`中相关参数配置代理程序

- 透明代理服务器（使用overture作为DNS代理，默认）

   功能：全局代理，客户端免配置使用

   路由器：在monit管理页面中，停止服务`SS_LOCAL`，启动服务`SS_TRANSPARENT_PROXY`

   客户端：免配置

- 透明代理服务器（使用adguardhome作为DNS代理）

   功能：全局代理，客户端免配置使用，可过滤广告

   路由器：安装插件adguardhome；在adguardhome管理页面中，将上游DNS服务器设置为`https://dns.adguard.com/dns-query`；参考[Monit说明文件](../monit/README_zh-CN.md)，禁用插件`ss_transparent_proxy_overture_file`，启用插件`ss_transparent_proxy_without_dns_file`；在monit管理页面中，启动服务`ADGUARD_HOME`，启动服务`SS_TRANSPARENT_PROXY`

   客户端：免配置

- ShadowsSocks服务器

   功能：使外网客户端接入局域网，配合客户端socks5代理工具使用

   路由器：执行`/opt/script_bootloader/usr/shadowsocks/bin/shadowsocks_configure server`编辑配置文件；参考[Monit说明文件](../monit/README_zh-CN.md)，启用插件`fw_filter_INPUT_ss_server`，启用插件`ss_server`；在monit管理页面中，启动服务`FW_PORT_OPENING_SS_SERVER`，启动服务`SS_SERVER`

   客户端：按照文件`shadowsocks/etc/config_server.json`中相关参数配置代理程序