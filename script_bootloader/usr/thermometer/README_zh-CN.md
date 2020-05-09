# Readme for thermometer

## 概述

1. 本插件用于配置、启动和结束thermometer
2. 安装本插件后，可实现自动监控温度
3. 特别感谢[KOOLSHARE论坛](https://koolshare.cn/forum.php)**坛友arhao**提供的[程序](https://koolshare.cn/forum.php?mod=viewthread&tid=138615&page=41#pid2286129)及[52ASUS论坛](http://www.52asus.com/)**坛友Jack**提供的[华硕路由器官方固件查看 CPU、无线 温度的方法](http://www.52asus.com/thread-3819-1-1.html)，本插件参考了他们提供的相关信息，在此**特别提出感谢**

## 安装前提

1. 无

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/thermometer/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/thermometer/bin/`

| 权限      | 名称                        | 属性     | 说明                           |
| --------- | --------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | thermometer_install         | 普通文件 | 插件的安装程序                 |
| rwxrwxrwx | thermometer_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |

`ASUS_ROUTER/script_bootloader/usr/thermometer/etc/`

| 权限      | 名称                | 属性     | 说明            |
| --------- | ------------------- | -------- | --------------- |
| rwxrwxrwx | monit.d/thermometer | 普通文件 | monit.d配置文件 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/thermometer/bin/thermometer_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |

## 调用方法

| 插件文件                    | 插件调用者          |
| --------------------------- | ------------------- |
| thermometer_enable.service  | monit.d/thermometer |