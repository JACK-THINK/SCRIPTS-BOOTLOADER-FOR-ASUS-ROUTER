# 插件开发标准

## 文件结构及命名标准

#### 总则

1. 大小写**敏感**
2. 仅能含有英文字母、数字、下划线、句点（英文），禁止使用任何空白
3. 必须以**英文字母**开头

#### 详解

以下表格**名称**一列中，**无下划线英文部分必须保留**

`USB_ROOT_DIRECTORY/script_bootloader/usr/`

| 权限      | 名称                                | 属性 | 说明                     |
| --------- | ----------------------------------- | ---- | ------------------------ |
| rwxrwxrwx | 插件名称（本例中为<u>software</u>） | 目录 | 此目录放置全部插件的目录 |

`USB_ROOT_DIRECTORY/script_bootloader/usr/插件名称（本例中为software）/`

| 权限      | 名称     | 属性     | 说明             |
| --------- | -------- | -------- | ---------------- |
| rwxrwxrwx | README.md | 普通文件 | 说明文件         |
| rwxrwxrwx | bin    | 目录     | 可执行文件目录   |
| rwxrwxrwx | etc    | 目录     | 配置文件目录     |
| rwxrwxrwx | tmp    | 目录     | 临时文件目录     |
| rwxrwxrwx | usr    | 目录     | 外部软件资源目录 |
| rwxrwxrwx | var    | 目录     | 可变文件目录     |

`USB_ROOT_DIRECTORY/script_bootloader/usr/自定义程序名（本例中为software）/bin/`（此程序可执行文件目录）

| 权限      | 名称                            | 属性     | 说明                                       |
| --------- | ------------------------------- | -------- | ------------------------------------------ |
| rwxrwxrwx | <u>software</u>_install.service | 普通文件 | （**可选**）插件的安装程序 |
| rwxrwxrwx | <u>software</u>_enable.service  | 普通文件 | （**必选**）插件的可执行程序，用于启动程序 |
| rwxrwxrwx | <u>software</u>_disable.service | 普通文件 | （**必选**）插件的可执行程序，用于结束程序 |

`USB_ROOT_DIRECTORY/script_bootloader/usr/自定义程序名（本例中为software）/etc/`（此程序配置文件目录）

| 权限      | 名称                 | 属性     | 说明                       |
| --------- | -------------------- | -------- | -------------------------- |
| rwxrwxrwx | <u>software</u>.conf | 普通文件 | （**可选**）插件的配置文件 |

`USB_ROOT_DIRECTORY/script_bootloader/usr/自定义程序名（本例中为software）/tmp/`（此程序临时文件目录）

| 权限      | 名称                | 属性     | 说明                       |
| --------- | ------------------- | -------- | -------------------------- |
| rwxrwxrwx | <u>software</u>.tmp | 普通文件 | （**可选**）插件的临时文件 |

`USB_ROOT_DIRECTORY/script_bootloader/usr/自定义程序名（本例中为software）/usr/`（此程序外部软件资源目录）

| 权限      | 名称            | 属性     | 说明                               |
| --------- | --------------- | -------- | ---------------------------------- |
| rwxrwxrwx | <u>software</u> | 普通文件 | （**可选**）插件的外部软件资源文件 |

`USB_ROOT_DIRECTORY/script_bootloader/usr/自定义程序名（本例中为software）/var/`（此程序可变文件目录）

| 权限      | 名称                | 属性     | 说明                       |
| --------- | ------------------- | -------- | -------------------------- |
| rwxrwxrwx | <u>software</u>.var | 普通文件 | （**可选**）插件的可变文件 |

## 调用方法

| 插件文件                        | 插件调用者                   | 调用位置  |
| ------------------------------- | ---------------------------- | --------- |
| <u>software</u>_enable.service  | list_of_user_custom_scripts  | 37-49行间 |
| <u>software</u>_disable.service | script_bootloader_usb_umount | 自动调用  |

各插件私有目录内文件均由插件自身调用，与系统无关

## 注意事项

1. 重启时，华硕官方固件不会自动调用script_bootloader_usb_umount，因此全部software_disable.service都不会被调用。因此，所有修改了非易失性存储器中文件的插件，都必须在其software_enable.service中，首先撤销修改，而后再进行修改。否则，被修改文件将会出现很多问题。梅林固件会自动调用script_bootloader_usb_umount，无此问题