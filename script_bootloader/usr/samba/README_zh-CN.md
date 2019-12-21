# Readme for samba

## 概述

1. 本插件用于安装、配置、启动和结束samba
2. 为提高安全性，仅支持SMB2及更高版本协议
3. 不支持nmbd
4. 特别感谢[KOOLSHARE论坛](https://koolshare.cn/forum.php)**坛友JACK-**的[作品](https://github.com/JackMerlin/USBAccelerator)及[SNBForums论坛](https://www.snbforums.com/forums/)**众多网友**关于[提升USB性能的讨论](https://www.snbforums.com/threads/ac86u-smb-tweaking.44729/)，本插件中关于提高SAMBA性能参数的部分参考了他们的方案及讨论内容，在此**特别提出感谢**
5. 新增回收站功能

## 安装前提

1. 必须安装并启用entware和monit

## 文件结构

`ASUS_ROUTER/script_bootloader/usr/samba/`

| 权限      | 名称            | 属性     | 说明           |
| --------- | --------------- | -------- | -------------- |
| rwxrwxrwx | README_zh-CN.md | 普通文件 | 说明文件       |
| rwxrwxrwx | bin             | 目录     | 可执行文件目录 |
| rwxrwxrwx | etc             | 目录     | 配置文件目录   |

`ASUS_ROUTER/script_bootloader/usr/samba/bin/`

| 权限      | 名称                         | 属性     | 说明                           |
| --------- | ---------------------------- | -------- | ------------------------------ |
| rwxrwxrwx | samba_install                | 普通文件 | 安装文件                       |
| rwxrwxrwx | samba_uninstall              | 普通文件 | 卸载文件                       |
| rwxrwxrwx | samba_server_enable.service  | 普通文件 | 插件的可执行程序，用于启动程序 |
| rwxrwxrwx | samba_server_disable.service | 普通文件 | 插件的可执行程序，用于结束程序 |

`ASUS_ROUTER/script_bootloader/usr/samba/etc/`

| 权限      | 名称                 | 属性     | 说明                |
| --------- | -------------------- | -------- | ------------------- |
| rwxrwxrwx | smb.conf.add         | 普通文件 | samba附加配置文件   |
| rwxrwxrwx | monit.d/samba_server | 普通文件 | monit.d配置文件     |
| rwxrwxrwx | avahi/smb.service    | 普通文件 | avahi配置文件       |

## 安装方法

执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/samba/bin/samba_install`。程序会根据路由器架构，自动安装适当版本的samba

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                                                                                                                        |
   > | ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   > | **aarch64** | GT-AC2900, GT-AC5300, GT-AX11000, RT-AC86U, RT-AX88U, RT-AX92U                                                                                                    |
   > | **armv7**   | Lyra Voice, RT-AC56U, RT-AC66U B1, RT-AC68P, RT-AC68U, RT-AC87U, RT-AC88U, RT-AC1200G, RT-AC1900P, RT-AC3100, RT-AC3200, RT-AC5300, RT-ACRH13, RT-AX56U, RT-AX58U |
   > | **mipsel**  | RT-N16, RT-N56U, RT-N66R, RT-N600, RT-AC51U, RT-AC66U, RT-AC66R, RT-AC1200, RT-AC1750, RT-AC1750 B1                                                               |

## 调用方法

| 插件文件                     | 插件调用者           |
| ---------------------------- | -------------------- |
| samba_server_enable.service  | monit.d/samba_server |
| samba_server_disable.service | monit.d/samba_server |

## 使用方法

> 默认共享目录：`/home/root`
>
> 默认回收站目录：`/home/root/.recycle`
>
> 默认用户名：路由器管理页面登陆用户名
>
> 默认密码：路由器管理页面登陆密码

#### Windows

1. 在“文件资源管理器”-“网络”中，找到路由器名称并双击，连接路由器共享
2. 右击名称以“smb-share”结尾的文件夹，单击“映射网络驱动器”
3. 按需求选择适当的驱动器号，并勾选“使用其它凭据连接”。单击“完成”
4. 在弹出窗口中依次输入上述用户名和密码，并勾选“记住我的凭据”。单击“确定”