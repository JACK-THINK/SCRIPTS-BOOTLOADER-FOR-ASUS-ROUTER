# Readme for fwd

## 概述

1. 本插件用于配置、启动和结束fwd
2. 安装本插件后，可以应用为单位组织防火墙规则，并通过monit管理页面随时启用和停用

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/fwd/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/fwd/bin/`

| 权限      | 名称        | 属性     | 说明           |
| --------- | ----------- | -------- | -------------- |
| rwxrwxrwx | fwd         | 普通文件 | 防火墙执行程序 |
| rwxrwxrwx | fwd_install | 普通文件 | 安装文件       |

`ASUS_ROUTER/script_bootloader/usr/fwd/etc/fw.d`

| 权限      | 名称                 | 属性     | 说明         |
| --------- | -------------------- | -------- | ------------ |
| rwxrwxrwx | https_open           | 普通文件 | fw.d配置文件 |
| rwxrwxrwx | ss_server_open       | 普通文件 | fw.d配置文件 |
| rwxrwxrwx | v2ray_proxy_open     | 普通文件 | fw.d配置文件 |
| rwxrwxrwx | ipsec_forward        | 普通文件 | fw.d配置文件 |
| rwxrwxrwx | qbittorrent_forward  | 普通文件 | fw.d配置文件 |
| rwxrwxrwx | softethervpn_forward | 普通文件 | fw.d配置文件 |

`ASUS_ROUTER/script_bootloader/usr/fwd/etc/monit.d`

| 权限      | 名称                           | 属性     | 说明            | 默认状态 |
| --------- | ------------------------------ | -------- | --------------- | -------- |
| rwxrwxrwx | fw_filter_INPUT_https          | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | fw_filter_INPUT_ss_server      | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | fw_filter_INPUT_v2ray_proxy    | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | fw_nat_PREROUTING_ipsec        | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | fw_nat_PREROUTING_qbittorrent  | 普通文件 | monit.d配置文件 | 默认禁用 |
| rwxrwxrwx | fw_nat_PREROUTING_softethervpn | 普通文件 | monit.d配置文件 | 默认禁用 |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/fwd/bin/fwd_install`

## fw.d规则说明

1. 文件全部大写
2. 关键字只有`NAME`和`RULE`
3. 关键字与其参数用`=`连接，`=`两侧无空格
4. 参数必须用`"`包围
5. 关键字`NAME`为服务名
6. 关键字`RULE`为具体规则
7. 规则支持`OPEN`，`CLOSE`，`FORWARD`三种动作
   - `OPEN`动作详解
            
     此指令用于打开路由器特定端口，按照`OPEN#协议#路由器端口号`格式书写

   - `CLOSE`动作详解
            
     此指令用于关闭路由器特定端口，按照`CLOSE#协议#路由器端口号`格式书写

   - `FORWARD`动作详解
            
     此指令用于转发路由器特定端口，按照`FORWARD#协议#路由器端口号#目标主机IP地址#目标主机端口号`格式书写