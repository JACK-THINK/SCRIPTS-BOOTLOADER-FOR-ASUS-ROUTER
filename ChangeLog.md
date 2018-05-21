# 更新日志

## 版本6.0（2018-05-21）

- **新增**
  1. 新增[开发工具插件](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/tree/master/script_bootloader/usr/development_tools)（含gcc，python3，pip3，coreutils及全部include文件）。本插件安装的程序较多，对U盘空间要求较高
- **变更**
  1. 取消强制开启虚拟内存功能。将swap功能做成插件，供有需要的用户手动安装
  2. 将entware安装程序及swap安装程序移至各自的bin目录
- **删除**
  1. 无

## 版本5.0（2018-05-15）

- **新增**
  1. 新增插件[开发标准文档](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/blob/master/Instruction_for_Add-on_Development.md)，并配有[示例](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/blob/master/script_bootloader/usr/software)
  2. 系统安装日志会表明路由器型号
  3. 自动维护插件程序结束列表，不再需要用户手动编写
- **变更**
  1. 重新调整程序执行逻辑
  2. 进一步使用软编码，提高程序健壮性
  3. 为便于插件开发，大幅调整目录结构。使用本版本必须全新安装，不能基于旧版升级
- **删除**
  1. 无

## 版本4.0（2018-05-12）

- **新增**
  1. 新增对U盘目录`/home/`的操作提示
  2. 新增注释，明确文件类型
  3. 新增默认开启虚拟内存
  4. 重新调整程序执行逻辑
  5. 全新采用软编码，程序可自适应U盘卷标
- **变更**
  1. 提高Entware安装程序的兼容性
- **删除**
  1. 无

## 版本3.1（2018-05-06）

- **新增**
  1. 无
- **变更**
  1. 在使用过程中发现Entware的部分软件对`/home`目录没有写权限，本次更新将`/home`目录迁移至U盘中，以解决此问题
- **删除**
  1. 无

## 版本3.0（2018-05-01）

- **新增**
  1. 新增华硕路由器固件类型检测功能，可根据固件种类自动配置运行环境
  2. 新增**虚拟内存**功能（swap），以确保Entware在部分型号路由器上流畅运行（默认禁用，启用方法见[使用说明](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/blob/master/How_to_Use.md)）
- **变更**
  1. 前一版本出现重大bug：Entware不能安装于运行华硕官方固件的部分型号的华硕路由器，本版已修正
- **删除**
  1. 无

## 版本2.2（2018-04-30）

- **新增**
  1. 提升兼容性，避免路由器上插2个及以上U盘时，`sda1`引用错误U盘的情况
  2. 提供U盘卷标修改工具`label_modifier`，默认会修改U盘卷标为`ASUS_ROUTER`并格式化。**使用前必须做好内容备份，并拔掉路由器上的其它全部U盘**
- **变更**
  1. 无
- **删除**
  1. 无

## 版本2.1（2018-04-30）

- **新增**
  1. 无
- **变更**
  1. 修改源代码注释拼写错误
- **删除**
  1. 无

## 版本2.0（2018-04-29）

- **新增**
  1. 新增[Entware](https://github.com/Entware/Entware)安装程序`Entware_install`，可根据路由器型号自动安装匹配的Entware版本，无需用户参与安装过程
  2. 本系统（含Entware）运行于U盘，完全脱离路由器`/jffs`分区
  3. 本系统（含Entware）适用于华硕原厂固件和华硕梅林固件
- **变更**
  1. 采用全新项目名称**SCRIPTS BOOTLOADER FOR ASUS ROUTER**
  2. 采用全新的目录结构及文件名，以兼容[Entware](https://github.com/Entware/Entware)
  3. 重新编写每个程序内容，统一编码及注释风格，便于用户阅读
- **删除**
  1. 删除系统中全部`vlmcsd`字样

## 版本1.0（2018-04-27）

1. **ASUSWRT-and-ASUS_MERLIN-Self-Starting-Scripts**版本1.0发布