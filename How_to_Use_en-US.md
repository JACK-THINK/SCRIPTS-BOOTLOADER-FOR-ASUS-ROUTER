# SCRIPTS BOOTLOADER FOR ASUS ROUTER MANUAL

[中文](./How_to_Use_zh-CN.md) | [English](./How_to_Use_en-US.md)

## Requisite Firmware

- [Asuswrt](https://www.asus.com.cn): The stock firmware for ASUS Routers.
- [Asuswrt-Merlin](https://www.asuswrt-merlin.net/): The internationally renowned 3rd firmware for ASUS Routers.

> **CAVEAT**: NO COMPLIANCE FOR OTHER FIRMWARE GUARANTEED.

## Installation (Online)

> Legend
>
> 1. White characters with purple background: notice of stage.
> 2. White characters with green background: notice of success.
> 3. White characters with red background: notice of failure.
>    - Above the notice of failure should be the line stating the related file which runs into error.

1. Insert a USB flash drive with no files into a USB port of the Router.

2. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/install/online_step2.jpg)

3. Execute the code below.

   ```shell
   cd /tmp && wget -O /tmp/install_online --no-check-certificate "https://raw.githubusercontent.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/master/script_bootloader/bin/install_online" && chmod 777 /tmp/install_online && /tmp/install_online
   ```

   ![](./Documents_Assets/How_to_Use/install/online_step3.jpg)

4. Read the WARNING, and input `YES` to continue the installation.

   ![](./Documents_Assets/How_to_Use/install/online_step4.jpg)

5. Demonstration of the installation process:

   - Format the USB flash drive.

     ![](./Documents_Assets/How_to_Use/install/online_step5-1.jpg)

   - Download files for installation.

     ![](./Documents_Assets/How_to_Use/install/online_step5-2.jpg)

   - STAGE 1: Set the router.

     ![](./Documents_Assets/How_to_Use/install/online_step5-3.jpg)

   - STAGE 2: Install the requisite components.

     - Install and enable component swap (512M).

       ![](./Documents_Assets/How_to_Use/install/online_step5-4.jpg)

     - Install and enable component entware.

       ![](./Documents_Assets/How_to_Use/install/online_step5-5.jpg)

     - Install and enable component timezone.

       ![](./Documents_Assets/How_to_Use/install/online_step5-6.jpg)

     - Install and enable component dependency.

       > It's OK even if some yellow characters show up on the screen.

       ![](./Documents_Assets/How_to_Use/install/online_step5-7.jpg)

     - Install and enable component monit.

       ![](./Documents_Assets/How_to_Use/install/online_step5-8.jpg)

     - Install and enable component dnsmasq.d.

       ![](./Documents_Assets/How_to_Use/install/online_step5-9.jpg)

     - Stage 2 completed

       ![](./Documents_Assets/How_to_Use/install/online_step5-10.jpg)

   - STAGE 3: Install the optional components (the add-ons).

     - Input the index number of the favored add-on according to the menu.

       ![](./Documents_Assets/How_to_Use/install/online_step6-1.jpg)

     - Input `0` to exit the installation and reboot the router after all the favored add-ons are installed.

       ![](./Documents_Assets/How_to_Use/install/online_step6-2.jpg)

## Modification to source files

Modify the source files of the target add-on according to the README.md in its own directory in `/opt/script_bootloader/usr/`.

> NOTICE
>
> - LF needs to be set in Windows before you edit the source files. Otherwise the files will be damaged.
> - NO extra setting is required in Linux before you edit the source files.

## Enable/Disable add-ons

> Add-on Management system is composed of 2 parts below.
>
> | Add-on Management system    | Type of add-ons                                            | Instruction                                              |
> | --------------------------- | ---------------------------------------------------------- | -----------                                              |
> | list_of_user_custom_scripts | Add-ons which run at startup with no surveillance required | Read the instruction below.                              |
> | Monit                       | All add-ons except the type listed above                   | [Click to read](./script_bootloader/usr/monit/README.md) |

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/services_once/step1.jpg)

2. Execute the code below to edit list_of_user_custom_scripts.

   ```shell
   vim /opt/script_bootloader/bin/list_of_user_custom_scripts
   ```

   ![](./Documents_Assets/How_to_Use/services_once/step2.jpg)

   ![](./Documents_Assets/How_to_Use/services_once/step3.jpg)

3. Enable/Disable the target add-ons.

   - Enable add-ons: Remove the `#` at the start of the path to target add-ons.
   - Disableadd-ons: Insert a `#` at the start of the path to target add-ons.

   ![](./Documents_Assets/How_to_Use/services_once/step4.jpg)

4. Save and exit.

   \<ESC\>→\<:\>→\<w\>→\<q\>→\<Enter\>

5. Execute `reboot` and all the favored add-ons will boot along with the router.

   ![](./Documents_Assets/How_to_Use/services_once/step5.jpg)

## Uninstallation

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/uninstall/step1.jpg)

2. Execute the code below to uninstall this system.

   ```shell
   cd /tmp && /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/uninstall
   ```

   ![](./Documents_Assets/How_to_Use/uninstall/step2.jpg)

## Restoration

> You have to unplug the USB flash drive containing this system from the router before upgrade the firmware of the router every time. After the upgradation is OK, re-plug the USB flash drive containing this system to a USB port of the Router.

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/restore/step1.jpg)

2. Execute the code below to restore this system.

   ```shell
   cd /tmp && /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/restore
   ```

   ![](./Documents_Assets/How_to_Use/restore/step2.jpg)

## Reinstallation or Upgradation

1. [Uninstall](#Uninstallation) this system.

2. [Install](#Installation\ (Online)) this system again.