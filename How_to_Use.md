# SCRIPTS BOOTLOADER FOR ASUS ROUTER 使用说明

## 运行环境

华硕路由器官方固件和梅林固件

## 开机自动运行原理

1. 每次路由器启动时，都会自动挂载插入的U盘
2. 通过设置`script_usbmount`参数，可使路由器在成功挂载U盘后，自动执行该参数指向的任何可执行程序（本例中，该程序为`/tmp/mnt/ASUS_ROUTER/script_bootloader/script_bootloader_usb_mount`）
3. 设置被`script_usbmount`参数引用的程序（本例中，该程序为`/tmp/mnt/ASUS_ROUTER/script_bootloader/script_bootloader_usb_mount`），使其先确定路由器已经成功启动，然后调用用户自定义程序列表（本例中，该程序为`/tmp/mnt/ASUS_ROUTER/script_bootloader/user_scripts/list_of_user_custom_scripts`），按顺序逐一执行用户的自定义程序

## 文件结构

`ASUS_ROUTER/`（U盘根目录）

| 权限      | 名称                | 属性 |
| --------- | ------------------- | ---- |
| rwxrwxrwx | `script_bootloader` | 目录 |

`ASUS_ROUTER/script_bootloader/`（SCRIPTS BOOTLOADER FOR ASUS ROUTER系统目录）

| 权限      | 名称                           | 属性     |
| --------- | ------------------------------ | -------- |
| rwxrwxrwx | `install`                      | 普通文件 |
| rwxrwxrwx | `uninstall`                    | 普通文件 |
| rwxrwxrwx | `script_bootloader_usb_mount`  | 普通文件 |
| rwxrwxrwx | `script_bootloader_usb_umount` | 普通文件 |
| rwxrwxrwx | `Entware_install`              | 普通文件 |
| rwxrwxrwx | `label_modifier`               | 普通文件 |
| rwxrwxrwx | `user_scripts`                 | 目录     |
| rwxrwxrwx | `usr`                          | 目录     |
| rwxrwxrwx | `var`                          | 目录     |

`ASUS_ROUTER/script_bootloader/user_scripts/`（该目录存储自定义程序列表`list_of_user_custom_scripts`和以`自定义程序名`为名称的子目录）

| 权限      | 名称                               | 属性     |
| --------- | ---------------------------------- | -------- |
| rwxrwxrwx | `list_of_user_custom_scripts`      | 普通文件 |
| rwxrwxrwx | `自定义程序名（本例中为software）` | 目录     |
| rwxrwxrwx | `swap`                             | 目录     |

`ASUS_ROUTER/script_bootloader/user_scripts/自定义程序名（本例中为software）/`（该目录存储相应的自定义可执行程序）

| 权限      | 名称                                       | 属性     |
| --------- | ------------------------------------------ | -------- |
| rwxrwxrwx | `自定义脚本名（本例中为software.service）` | 普通文件 |

`ASUS_ROUTER/script_bootloader/user_scripts/swap/`（该目录存储**虚拟内存**启用及禁用程序）

| 权限      | 名称                   | 属性     |
| --------- | ---------------------- | -------- |
| rwxrwxrwx | `swap_enable.service`  | 普通文件 |
| rwxrwxrwx | `swap_disable.service` | 普通文件 |

`ASUS_ROUTER/script_bootloader/usr/`（该目录存储自定义程序所需调用的外部程序，所有程序都必须是针对相应的路由器编译而成的。对于不需要调用外部程序的程序，可无需关注此目录及其内容）

| 权限      | 名称                             | 属性 |
| --------- | -------------------------------- | ---- |
| rwxrwxrwx | `外部程序名（本例中为software）` | 目录 |

`ASUS_ROUTER/script_bootloader/usr/外部程序名（本例中为software）/`（该目录存储相应的外部程序的文件）

| 权限      | 名称                             | 属性     |
| --------- | -------------------------------- | -------- |
| rwxrwxrwx | `外部程序名（本例中为software）` | 普通文件 |

## 使用说明

#### 安装前准备（已经能够访问插在路由器上U盘的用户，此节可跳过）

1. 将一个空白U盘插入路由器的USB2.0插口
2. 用ssh登陆路由器后台
3. 执行`umount /dev/sda1`卸载U盘
4. 对U盘分区
   - 执行`fdisk /dev/sda`
   - 输入`m`，查看使用方法
   - 输入`p`，查看分区表（如提示所有的分区都不可识别，则直接输入`o`，创建全新的空DOS分区表，然后直接输入`n`，创建新分区）
   - 输入`d`，按提示输入数字1，删除U盘上的分区1。重复该过程，直至删除U盘上的全部分区
   - 输入`p`，查看分区表，检查是否已经删除U盘上的全部分区
   - 输入`n`，创建新分区
   - 输入`p`，设置新分区类型为主分区
   - 输入`1`，设置主分区数量为1
   - 什么都不输，直接按回车，设置第一柱面为1
   - 什么都不输，直接按回车，设置最后柱面为最大值
   - 输入`w`，将分区表写入U盘
5. 执行`umount /dev/sda1`卸载U盘
6. 执行`mkfs.ext3 -L ASUS_ROUTER /dev/sda1`，格式化U盘分区
7. 格式化完成之后，执行`reboot`，重启路由器
8. 使用scp将文件`script_bootloader.tar.gz`上传至路由器`/tmp/mnt/ASUS_ROUTER/`目录中
9. 执行`cd /tmp/mnt/ASUS_ROUTER/`，进入该目录
10. 执行`tar xzvf script_bootloader.tar.gz`，将全部文件解压
11. 执行`chown -R 路由器登录名（例如routeradmin）:root script_bootloader/`改变全部文件属主
12. 执行`chmod -R 777 script_bootloader/`改变全部文件权限

#### 修改程序

阅读每个程序文件的中文注释，按个人需求对程序进行修改

| 建议修改的文件                 | 不建议修改的文件              |
| ------------------------------ | ----------------------------- |
| `list_of_user_custom_scripts`  | `install`                     |
| `script_bootloader_usb_umount` | `uninstall`                   |
| `software.service`             | `script_bootloader_usb_mount` |
|                                | `Entware_install`             |
|                                | `label_modifier`              |
|                                | `swap_enable.service`         |
|                                | `swap_disable.service`        |

#### 安装（按照下述顺序执行）

1. 用ssh登陆路由器后台

2. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/install`。路由器自动重启后，SCRIPTS BOOTLOADER FOR ASUS ROUTER系统安装完毕

3. （可选）执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/Entware_install`。程序将根据路由器型号，自动安装匹配的Entware

   > [受支持的路由器型号](https://github.com/Entware/Entware/wiki/Install-on-Asus-stock-firmware)：
   >
   > | 架构        | 路由器型号                                                   |
   > | ----------- | ------------------------------------------------------------ |
   > | **aarch64** | RT-AC86U                                                     |
   > | **armv7**   | RT-AC68U, RT-AC56U, RT-AC87U, RT-AC3200, RT-AC88U, RT-AC3100, RT-AC5300 |
   > | **mipsel**  | RT-N66U, RT-AC66U, RT-N16                                    |

#### 卸载

1. 用ssh登陆路由器后台
2. 执行`/tmp/mnt/ASUS_ROUTER/script_bootloader/uninstall`。路由器自动重启后，卸载完毕

## 虚拟内存

1. 启用方法

   删除`list_of_user_custom_scripts`文件第29行行首的`#`，保存退出后，重启路由器即可获得512M虚拟内存

2. 禁用方法

   运行`swap_disable.service`即可

