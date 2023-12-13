# Readme for Xray

## 概述

1. 本插件用于安装、配置、启动和结束xray
2. 客户端需安装支持socks5协议/Vmess协议的代理工具连接本插件

   | 客户端  | 代理工具     |
   | ------- | ------------ |
   | Chrome  | SwitchyOmega |
   | iOS     | Shadowrocket |
   | Android | v2rayNG      |

3. 支持全局透明代理。华硕原厂固件仅能代理TCP流量，梅林固件可以代理TCP和UDP流量
4. 监听端口：1080, 9080, 2053, 45154, 55155, 22815, 22816

   | 协议        | 端口号 | 代理   | 使用场景                       |
   | ----------- | ------ | ------ | ------------------------------ |
   | socks5      | 1080   | VPS    | 内网设备科学上网               |
   | http        | 9080   | VPS    | 内网设备科学上网               |
   | dokodemo    | 2053   | VPS    | 内网设备透明代理DNS转发        |
   | dokodemo    | 45154  | VPS    | 内网设备透明代理REDIRECT转发   |
   | dokodemo    | 55155  | VPS    | 内网设备透明代理TPROXY转发     |
   | vmess       | 22815  | LAN    | 外网设备接入路由器实现回国上网 |
   | vmess       | 22816  | VPS    | 外网设备接入路由器实现科学上网 |

## 安装前提

1. 必须安装并启用entware和monit
2. 必须安装fwd并启用fw_filter_INPUT_xray_proxy

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/xray/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/xray/bin/`

| 权限      | 名称                                        | 属性     | 说明                           |
| --------- | ------------------------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | xray_install                                | 普通文件 | 安装程序                       |
| rwxrwxrwx | xray_update                                 | 普通文件 | 升级程序                       |
| rwxrwxrwx | xray_configure                              | 普通文件 | 配置程序                       |
| rwxrwxrwx | xray_proxy_enable.service                   | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | xray_proxy_disable.service                  | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | fw_xray_transparent_proxy_enable.service    | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | fw_xray_transparent_proxy_disable.service   | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | xray_transparent_proxy_enable_file.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | xray_transparent_proxy_disable_file.service | 普通文件 | 插件的可执行程序，用于结束程序 |
| rwxrwxrwx | xray_transparent_proxy_enable_prog.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | xray_transparent_proxy_disable_prog.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/xray/etc/`

| 权限      | 名称                                | 属性     | 说明                      |
| --------- | ----------------------------------- | -------- | ------------------------- |
| rwxrwxrwx | config_proxy.json.template          | 普通文件 | config_proxy.json文件模板 |
| rwxrwxrwx | fw.d/xray_proxy_open                | 普通文件 | fw.d配置文件              |
| rwxrwxrwx | monit.d/fw_filter_INPUT_xray_proxy  | 普通文件 | monit.d配置文件           |
| rwxrwxrwx | monit.d/xray_proxy                  | 普通文件 | monit.d配置文件           |
| rwxrwxrwx | monit.d/xray_transparent_proxy_file | 普通文件 | monit.d配置文件           |
| rwxrwxrwx | monit.d/xray_transparent_proxy_prog | 普通文件 | monit.d配置文件           |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/xray/bin/xray_install`。程序会根据路由器架构，自动安装适当版本的xray

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 调用方法

| 插件文件                                    | 插件调用者                          |
| ------------------------------------------- | ----------------------------------- |
| xray_proxy_enable.service                   | monit.d/xray_proxy                  |
| xray_proxy_disable.service                  | monit.d/xray_proxy                  |
| xray_transparent_proxy_enable_file.service  | monit.d/xray_transparent_proxy_file |
| xray_transparent_proxy_disable_file.service | monit.d/xray_transparent_proxy_file |
| xray_transparent_proxy_enable_prog.service  | monit.d/xray_transparent_proxy_prog |
| xray_transparent_proxy_disable_prog.service | monit.d/xray_transparent_proxy_prog |

## 注意事项

1. 登录monit管理页面，可以看到XRAY_PROXY和XRAY_TRANSPARENT_PROXY
2. XRAY_PROXY是浏览器代理。可以配合客户端代理工具使用，路由器和未使用代理工具的客户端均在墙内
3. XRAY_TRANSPARENT_PROXY是全局透明代理。必须先在monit管理页面中停止XRAY_PROXY，然后再启用XRAY_TRANSPARENT_PROXY。路由器和全体客户端均在墙外