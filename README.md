# 使用说明

### 运行环境

华硕路由器官方固件和梅林固件

### 开机自动运行原理

1. 每次路由器启动时，都会自动挂载插入的U盘
2. 通过设置script_usbmount参数，可使路由器在成功挂载U盘后，自动执行该参数指向的任何可执行脚本（本例中，该脚本为/tmp/mnt/sda1/mount_script）
3. 设置被script_usbmount参数引用的脚本（本例中，该脚本为/tmp/mnt/sda1/mount_script），使其先确定路由器已经成功启动，然后调用用户自定义脚本列表（本例中，该脚本为/tmp/mnt/sda1/scripts/userscripts），按顺序逐一执行用户的自定义脚本

### 文件结构

`sda1/`（U盘根目录）

| 权限      | 名称            | 属性     |
| --------- | --------------- | -------- |
| rwxrwxrwx | `install`       | 普通文件 |
| rwxrwxrwx | `uninstall`     | 普通文件 |
| rwxrwxrwx | `mount_script`  | 普通文件 |
| rwxrwxrwx | `umount_script` | 普通文件 |
| rwxrwxrwx | `scripts`       | 目录     |
| rwxrwxrwx | `usr`           | 目录     |

`sda1/scripts/`（该目录存储自定义脚本列表`userscripts和`以`自定义脚本名`为名称的子目录）

| 权限      | 名称                             | 属性     |
| --------- | -------------------------------- | -------- |
| rwxrwxrwx | `userscripts`                    | 普通文件 |
| rwxrwxrwx | `自定义脚本名（本例中为vlmcsd）` | 目录     |

`sda1/scripts/自定义脚本名（本例中为vlmcsd）/`（该目录存储相应的自定义可执行脚本）

| 权限      | 名称                                     | 属性     |
| --------- | ---------------------------------------- | -------- |
| rwxrwxrwx | `自定义脚本名（本例中为vlmcsd.service）` | 普通文件 |

`sda1/usr/`（该目录存储自定义脚本所需调用的外部程序，所有程序都必须是针对相应的路由器编译而成的。对于不需要调用外部程序的脚本，可无需关注此目录及其内容）

| 权限      | 名称                           | 属性 |
| --------- | ------------------------------ | ---- |
| rwxrwxrwx | `外部程序名（本例中为vlmcsd）` | 目录 |

`sda1/usr/外部程序名（本例中为vlmcsd）/`（该目录存储相应的外部程序的文件）

| 权限      | 名称                               | 属性     |
| --------- | ---------------------------------- | -------- |
| rwxrwxrwx | `外部程序名（本例中为vlmcsd）`[^1] | 普通文件 |

### 使用说明

##### 安装前准备（已经能够访问插在路由器上U盘的用户，此节可跳过）

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
6. 执行`mkfs.ext3 /dev/sda1`，格式化U盘分区
7. 执行`mount /dev/sda1 /tmp/mnt/`，重新挂载U盘
8. 使用scp将文件`ASUS_stock_firmware_configuration.tar.gz`上传至路由器`/tmp/mnt/sda1/`目录中
9. 执行`tar xzvf ASUS_stock_firmware_configuration.tar.gz`，将全部文件解压
10. 执行`chown -R 路由器登录名（例如routeradmin）:root install mount_script umount_script uninstall scripts/ usr/`改变文件属主
11. 执行`chmod -R 777 install mount_script umount_script uninstall scripts/ usr/`改变文件权限

##### 修改脚本

阅读每个脚本文件的中文注释，按个人需求对脚本进行修改

| 建议修改的文件   | 不建议修改的文件 |
| ---------------- | ---------------- |
| `userscripts`    | `install`        |
| `umount_script`  | `uninstall`      |
| `vlmcsd.service` | `mount_script`   |

##### 安装

1. 用ssh登陆路由器后台
2. 执行`/tmp/mnt/sda1/install`。路由器自动重启后，安装完毕

##### 卸载

1. 用ssh登陆路由器后台
2. 执行`/tmp/mnt/sda1/uninstall`。路由器自动重启后，卸载完毕



[^1]: 引用vlmcsd仅为说明本系统的使用方法，本系统不包含任何第三方脚本或外部程序。特此说明！
