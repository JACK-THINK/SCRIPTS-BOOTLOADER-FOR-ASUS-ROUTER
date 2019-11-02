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

## fwd规则说明

1. 全部fwd规则文件位于目录`/opt/etc/fw.d`中
2. 工作链为`monit`->`/opt/etc/monit.d/monit规则文件`->`fwd`->`/opt/etc/fw.d/fwd规则文件`。若要自行编写fwd规则，还需相应地编写monit规则，然后使用monit进行调用
3. fwd规则文件内容全部大写
4. 关键字只有`NAME`和`RULE`
5. 关键字与其参数用`=`连接，`=`两侧无空格
6. 参数必须用`"`包围
7. 关键字`NAME`指定服务名
8. 关键字`RULE`指定具体规则
9. fwd规则支持`OPEN`，`CLOSE`，`FORWARD`三种动作和`TCP`，`UDP`两种协议
   - `OPEN`动作说明
            
     此指令用于打开路由器特定端口。书写格式
     ```
     OPEN#协议#路由器端口号
     ```

   - `CLOSE`动作说明
            
     此指令用于关闭路由器特定端口。书写格式
     ```
     CLOSE#协议#路由器端口号
     ```

   - `FORWARD`动作说明
            
     此指令用于转发路由器特定端口。书写格式
     ```
     FORWARD#协议#路由器端口号#目标主机IP地址#目标主机端口号
     ```
10. 示例
    - `/opt/etc/fw.d/example`文件
      ```
      NAME="EXAMPLE"
      RULE="OPEN#TCP#443"
      RULE="CLOSE#UDP#500"
      RULE="FORWARD#TCP#8888#192.168.1.88#9999"
      ```
      `/opt/etc/fw.d/example`规则做如下操作：
         
      - 指定规则名为`EXAMPLE`
      - 打开路由器端口443/tcp
      - 关闭路由器端口500/udp，使用`DROP`动作
      - 转发路由器端口8888/tcp至主机192.168.1.88的端口9999/tcp

    - `/opt/etc/monit.d/example.on`文件
      ```
      check program FW_EXAMPLE with path "/opt/bin/fwd enable /opt/etc/fw.d/example" every 6 cycles
      start program = "/opt/bin/fwd enable /opt/etc/fw.d/example"
      stop program = "/opt/bin/fwd disable /opt/etc/fw.d/example"
      if status == 1 then alert
      ```
      `/opt/etc/monit.d/example.on`规则做如下操作：

      - 指定monit服务名为`FW_EXAMPLE`
      - 每6个执行周期（每个执行周期默认为30秒）执行一次`/opt/bin/fwd enable /opt/etc/fw.d/example`并检查返回状态
      - 如果返回值不为0（即执行失败），则发出警告
      - 指定Monit管理页面中`FW_EXAMPLE`规则的`Start Service`按钮执行`/opt/bin/fwd enable /opt/etc/fw.d/example`命令，启动/检查防火墙规则`/opt/etc/fw.d/example`
      - 指定Monit管理页面中`FW_EXAMPLE`规则的`Stop Service`按钮执行`/opt/bin/fwd disable /opt/etc/fw.d/example`命令，停止防火墙规则`/opt/etc/fw.d/example`