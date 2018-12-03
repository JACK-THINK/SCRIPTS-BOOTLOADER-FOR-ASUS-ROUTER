# Readme for sbl-firewalld

## 概述

1. 本插件用于配置、启动和结束sbl-firewalld
2. 安装本插件后，可以应用为单位组织防火墙规则，并通过monit管理页面随时启用和停用

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/sbl-firewalld/`

| 权限      | 名称      | 属性     | 说明           |
| --------- | --------- | -------- | -------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin       | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc       | 目录     | 配置文件目录 |

`ASUS_ROUTER/script_bootloader/usr/sbl-firewalld/bin/`

| 权限      | 名称                                | 属性     | 说明               |
| --------- | ---------------------------------   | -------- | ------------------ |
| rwxrwxrwx | sbl-firewalld_install | 普通文件 | 安装文件 |
| rwxrwxrwx | fw_filter_INPUT_v2ray_enable.service | 普通文件 | 防火墙打开端口规则启用程序 |
| rwxrwxrwx | fw_filter_INPUT_v2ray_disable.service | 普通文件 | 防火墙打开端口规则禁用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_ipsec_enable.service | 普通文件 | 防火墙端口转发规则启用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_ipsec_disable.service | 普通文件 | 防火墙端口转发规则禁用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_l2tp_enable.service | 普通文件 | 防火墙端口转发规则启用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_l2tp_disable.service | 普通文件 | 防火墙端口转发规则禁用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_qbittorrent_enable.service | 普通文件 | 防火墙端口转发规则启用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_qbittorrent_disable.service | 普通文件 | 防火墙端口转发规则禁用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_softether_vpn_enable.service | 普通文件 | 防火墙端口转发规则启用程序 |
| rwxrwxrwx | fw_nat_PREROUTING_softether_vpn_disable.service | 普通文件 | 防火墙端口转发规则禁用程序 |

`ASUS_ROUTER/script_bootloader/usr/sbl-firewalld/etc/`

| 权限      | 名称         | 属性     | 说明         | 默认状态 |
| --------- | ------------ | -------- | ------------ | -------- |
| rwxrwxrwx | monit.d/fw_filter_INPUT_v2ray | 普通文件 | monit.d配置文件 | 默认启用 |
| rwxrwxrwx | monit.d/fw_nat_PREROUTING_ipsec | 普通文件 | monit.d配置文件 | 默认启用 |
| rwxrwxrwx | monit.d/fw_nat_PREROUTING_l2tp | 普通文件 | monit.d配置文件 | 默认启用 |
| rwxrwxrwx | monit.d/fw_nat_PREROUTING_qbittorrent | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | monit.d/fw_nat_PREROUTING_softether_vpn | 普通文件 | monit.d配置文件 | 默认禁用 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/sbl-firewalld/bin/sbl-firewalld_install`

## 调用方法

| 插件文件                          | 插件调用者                   |
| --------------------------------- | ---------------------------- |
| fw_filter_INPUT_v2ray_enable.service  | monit.d/fw_filter_INPUT_v2ray |
| fw_filter_INPUT_v2ray_disable.service | fw_filter_INPUT_v2ray_enable.service和monit.d/fw_filter_INPUT_v2ray |
| fw_nat_PREROUTING_ipsec_enable.service  | monit.d/fw_nat_PREROUTING_ipsec |
| fw_nat_PREROUTING_ipsec_disable.service | fw_nat_PREROUTING_ipsec_enable.service和monit.d/fw_nat_PREROUTING_ipsec |
| fw_nat_PREROUTING_l2tp_enable.service  | monit.d/fw_nat_PREROUTING_l2tp |
| fw_nat_PREROUTING_l2tp_disable.service | fw_nat_PREROUTING_l2tp_enable.service和monit.d/fw_nat_PREROUTING_l2tp |
| fw_nat_PREROUTING_qbittorrent_enable.service  | monit.d/fw_nat_PREROUTING_qbittorrent |
| fw_nat_PREROUTING_qbittorrent_disable.service | fw_nat_PREROUTING_qbittorrent_enable.service和monit.d/fw_nat_PREROUTING_qbittorrent |
| fw_nat_PREROUTING_softether_vpn_enable.service  | monit.d/fw_nat_PREROUTING_softether_vpn |
| fw_nat_PREROUTING_softether_vpn_disable.service | fw_nat_PREROUTING_softether_vpn_enable.service和monit.d/fw_nat_PREROUTING_softether_vpn |

## 特殊说明

1. 本防火墙按应用组织具体的防火墙规则，普通用户无需自行配置具体规则
2. 考虑到日常使用场景，该防火墙仅提供了针对打开路由器自身的端口规则以及端口转发规则两种场景的程序。有其他需求的用户，请自行编写程序
3. 若用户需新建上述两种场景中的程序，可将我提供的程序作为模板，修改有关内容即可。注意，全部`fw_nat_PREROUTING_XXX_enable.service`规则（端口转发规则）在使用前都必须修改文件中`TARGET_SERVER=""`字段，指定端口转发目标主机
4. 防火墙启用/禁用程序的命名规则为`fw_表_默认链_应用名称_enable/disable.service`