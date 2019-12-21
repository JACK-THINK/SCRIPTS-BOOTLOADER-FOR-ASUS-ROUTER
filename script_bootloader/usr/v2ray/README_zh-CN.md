# Readme for v2ray

## 概述

1. 本插件用于安装、配置、启动和结束v2ray
2. 客户端需安装支持socks5协议/Vmess协议/Shadowsocks协议的代理工具连接本插件

   | 客户端  | 代理工具     |
   | ------- | ------------ |
   | Chrome  | SwitchyOmega |
   | iOS     | Quantumult   |
   | Android | BifrostV     |

3. 支持全局透明代理。华硕原厂固件仅能代理TCP流量，梅林固件可以代理TCP和UDP流量
4. 监听端口：1080, 2053, 45154, 22815, 22816, 22817, 22818

   | 协议        | 端口号 | 代理   | 使用场景                       |
   | ----------- | ------ | ------ | ------------------------------ |
   | socks5      | 1080   | VPS    | 内网设备科学上网               |
   | dokodemo    | 2053   | VPS    | 内网设备透明代理DNS转发        |
   | dokodemo    | 45154  | VPS    | 内网设备透明代理REDIRECT转发   |
   | vmess       | 22815  | VPS    | 外网设备接入路由器实现科学上网 |
   | shadowsocks | 22816  | VPS    | 外网设备接入路由器实现科学上网 |
   | vmess       | 22817  | 路由器 | 外网设备接入路由器实现回国上网 |
   | shadowsock  | 22818  | 路由器 | 外网设备接入路由器实现回国上网 |

## 安装前提

1. 必须安装并启用entware和monit
2. 必须安装fwd并启用fw_filter_INPUT_v2ray_proxy

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/v2ray/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/v2ray/bin/`

| 权限      | 名称                                         | 属性     | 说明                           |
| --------- | -------------------------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | v2ray_install                                | 普通文件 | 安装文件                       |
| rwxrwxrwx | v2ray_upgrade                                | 普通文件 | 升级文件                       |
| rwxrwxrwx | v2ray_enable.service                         | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | v2ray_disable.service                        | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | fw_v2ray_transparent_proxy_enable.service    | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | fw_v2ray_transparent_proxy_disable.service   | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | v2ray_transparent_proxy_enable_file.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | v2ray_transparent_proxy_disable_file.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | v2ray_transparent_proxy_enable_prog.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | v2ray_transparent_proxy_disable_prog.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/v2ray/etc/`

| 权限      | 名称                                 | 属性     | 说明                           |
| --------- | ------------------------------------ | -------- | ------------------------------ |
| rwxrwxrwx | config_proxy.json                    | 普通文件 | v2ray_enable.service的配置文件 |
| rwxrwxrwx | config_proxy_https.json              | 普通文件 | v2ray_enable.service的配置文件 |
| rwxrwxrwx | monit.d/v2ray                        | 普通文件 | monit.d配置文件                |
| rwxrwxrwx | monit.d/v2ray_transparent_proxy_file | 普通文件 | monit.d配置文件                |
| rwxrwxrwx | monit.d/v2ray_transparent_proxy_prog | 普通文件 | monit.d配置文件                |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/v2ray/bin/v2ray_install`。程序会根据路由器架构，自动安装适当版本的v2ray

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 调用方法

| 插件文件                                     | 插件调用者                           |
| -------------------------------------------- | ------------------------------------ |
| v2ray_enable.service                         | monit.d/v2ray                        |
| v2ray_disable.service                        | monit.d/v2ray                        |
| v2ray_transparent_proxy_enable_file.service  | monit.d/v2ray_transparent_proxy_file |
| v2ray_transparent_proxy_disable_file.service | monit.d/v2ray_transparent_proxy_file |
| v2ray_transparent_proxy_enable_prog.service  | monit.d/v2ray_transparent_proxy_prog |
| v2ray_transparent_proxy_disable_prog.service | monit.d/v2ray_transparent_proxy_prog |

## 需修改部分

`v2ray/etc/config_proxy.json`

| 行号 | 代码          | 说明                                       |
| ---- | --------------| ------------------------------------------ |
| 23   | `"address":`  | 上游DNS服务器的IP地址                      |
| 61   | `"id":`       | 使用vmess协议接入路由器所用的用户主ID      |
| 150  | `"password":` | 使用shadowsocks协议接入路由器所用的密码    |
| 166  | `"id":`       | 使用vmess协议接入路由器所用的用户主ID      |
| 255  | `"password":` | 使用shadowsocks协议接入路由器所用的密码    |
| 273  | `"address":`  | V2Ray服务器的IP地址或域名                  |
| 274  | `"port":`     | 使用vmess协议接入V2Ray服务器所用的监听端口 |
| 278  | `"id":`       | 使用vmess协议接入V2Ray服务器所用的用户主ID |

`v2ray/etc/config_proxy_https.json`

| 行号 | 代码            | 说明                                       |
| ---- | --------------- | ------------------------------------------ |
| 23   | `"address":`    | 上游DNS服务器的IP地址                      |
| 61   | `"id":`         | 使用vmess协议接入路由器所用的用户主ID      |
| 150  | `"password":`   | 使用shadowsocks协议接入路由器所用的密码    |
| 166  | `"id":`         | 使用vmess协议接入路由器所用的用户主ID      |
| 255  | `"password":`   | 使用shadowsocks协议接入路由器所用的密码    |
| 273  | `"address":`    | V2Ray服务器的域名                          |
| 278  | `"id":`         | 使用vmess协议接入V2Ray服务器所用的用户主ID |
| 293  | `"serverName":` | V2Ray服务器的域名                          |

## 注意事项

1. 安装完成后，必须首先修改文件`/opt/script_bootloader/usr/v2ray/etc/config_proxy.json`
2. 登录monit管理页面，可以看到V2RAY和V2RAY_TRANSPARENT_PROXY
3. V2RAY是浏览器代理。可以配合客户端代理工具使用，路由器和未使用代理工具的客户端均在墙内
4. V2RAY_TRANSPARENT_PROXY是全局透明代理。必须先在monit管理页面中停止V2RAY，然后再启用V2RAY_TRANSPARENT_PROXY。路由器和全体客户端均在墙外
5. 在部分地区8.8.8.8被运营商重定向了，导致V2RAY_TRANSPARENT_PROXY全局透明代理无法正常工作。如发生此情况，修改`/opt/script_bootloader/usr/v2ray/bin/fw_v2ray_transparent_proxy_enable.service`第82行为
   ```sh
   TPROXY_MODULES_STATUS=false
   ```
   保存后重启路由器即可
6. config_proxy.json使用TCP为出站底层传输配置，默认启用；config_proxy_https.json使用HTTP/2为出站底层传输配置，默认禁用。如需启用config_proxy_https.json，执行下述代码：
   ```sh
   cd /opt/script_bootloader/usr/v2ray/etc/
   mv config_proxy.json config_proxy_tcp.json
   mv config_proxy_https.json config_proxy.json
   reboot
   ```
