# Readme for monit

## 概述

1. 本插件用于安装、配置Monit进程管理系统

## 安装前提

1. 必须安装并启用entware

## 文件结构

`/opt/script_bootloader/usr/monit/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |

`/opt/script_bootloader/usr/monit/bin/`

| 权限      | 名称          | 属性     | 说明           |
| --------- | ------------- | -------- | -------------- |
| rwxrwxrwx | monit_install | 普通文件 | 插件的安装程序 |

## 安装方法

执行`/opt/script_bootloader/usr/monit/bin/monit_install`

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 调用方法

由entware自动执行

## 使用方法

#### 启用/禁用插件

1. 用ssh登陆路由器后台

   ![](../../../Documents_Assets/monit/enable_services/step1.jpg)

2. 执行下列代码，进入monit配置文件目录

   ```shell
   cd /opt/etc/monit.d/
   ```

   ![](../../../Documents_Assets/monit/enable_services/step2.jpg)

3. 启用/禁用特定插件

   - 启用插件：`mv 目标插件 目标插件.on`

     ![](../../../Documents_Assets/monit/enable_services/step3-1.jpg)

   - 禁用插件：`mv 目标插件.on 目标插件`

     ![](../../../Documents_Assets/monit/enable_services/step3-2.jpg)

4. 执行`monit reload`，应用修改

   > 被启用的插件将可见于Monit进程管理器管理页面
   >
   > 被禁用的插件将消失于Monit进程管理器管理页面

   ![](../../../Documents_Assets/monit/enable_services/step4.jpg)

#### 使用Web管理页面

1. 在浏览器地址栏输入`http://路由器地址:35490`

   ![](../../../Documents_Assets/monit/web/step1.jpg)

2. 在弹出的对话框中输入用户名和密码

   > 用户名：路由器管理页面登陆用户名
   >
   > 密码：路由器管理页面登陆密码

   ![](../../../Documents_Assets/monit/web/step2.jpg)

3. 单击“登录”，进入Monit进程管理器管理页面

   > 此处显示各插件的概要信息：运行状态，运行时间，CPU占用，内存占用等

   ![](../../../Documents_Assets/monit/web/step3.jpg)

4. 单击插件名（例如dnsmasq.d），可进一步查看该插件的详细信息并进行管理（包括启动监控、启动、停止、重启和停止监控）

   ![](../../../Documents_Assets/monit/web/step4.jpg)