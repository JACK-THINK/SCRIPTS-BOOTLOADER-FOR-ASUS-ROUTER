# Readme for dnsmasq.d

## 概述

1. 本插件用于安装、配置、启动和结束dnsmasq.d
2. 使dnsmasq加载用户自行编写的配置文件
3. 自动监控/opt/etc/dnsmasq.d目录。当其中的文件发生改动，则自动加载

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/dnsmasq.d/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/dnsmasq.d/bin/`

| 权限      | 名称                      | 属性     | 说明                           |
| --------- | ------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | dnsmasq.d_install         | 普通文件 | 安装文件                       |
| rwxrwxrwx | dnsmasq.d_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | dnsmasq.d_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/dnsmasq.d/etc/`

| 权限      | 名称                            | 属性     | 说明                |
| --------- | ------------------------------- | -------- | ------------------- |
| rwxrwxrwx | dnsmasq.d/dnsmasq_extended.conf | 普通文件 | dnsmasq.d配置文件   |
| rwxrwxrwx | monit.d/dnsmasq.d               | 普通文件 | monit.d配置文件     |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/dnsmasq.d/bin/dnsmasq.d_install`。程序会根据路由器架构，自动安装适当版本的dnsmasq.d

   > 受支持的路由器型号：
   >
   > | 架构        | 路由器型号                                                                         |
   > | ----------- | ---------------------------------------------------------------------------------- |
   > | **aarch64** | RT-AC86U                                                                           |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300, GT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                                          |

## 调用方法

| 插件文件                  | 插件调用者        |
| ------------------------- | ----------------- |
| dnsmasq.d_enable.service  | monit.d/dnsmasq.d |
| dnsmasq.d_disable.service | monit.d/dnsmasq.d |

## 注意事项

1. 支持tag功能，但要直接写tag的值，不能出现“tag:”标头