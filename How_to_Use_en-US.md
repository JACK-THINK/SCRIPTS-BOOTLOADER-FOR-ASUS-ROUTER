# SCRIPTS BOOTLOADER FOR ASUS ROUTER MANUAL

[中文](./How_to_Use_zh-CN.md) | [English](./How_to_Use_en-US.md)

## Requisite Firmware

- [Asuswrt](https://www.asus.com.cn): The stock firmware for ASUS Routers.
- [Asuswrt-Merlin](https://www.asuswrt-merlin.net/): The internationally renowned 3rd-party firmware for ASUS Routers.

> **CAVEAT**: NO COMPLIANCE FOR OTHER FIRMWARE GUARANTEED.

## Notice

1. Make sure your username and password which are used to log into the web GUI contain **ONLY** characters within the range of *underline, numbers and lower-case and upper-case letters*.

## Installation (Online)

> **LEGEND**
>
> 1. White characters with purple background: notice of stage.
> 2. White characters with green background: notice of success.
> 3. White characters with red background: notice of failure.
>    - The line above the notice of failure will show the name of script which runs into error and relevant details.

1. Insert a USB flash drive (not less than 4GB; MBR) with no files into a USB port of the Router.

2. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/install/online_step2.jpg)

3. Execute the code below.

   ```shell
   cd /tmp && wget -q -O /tmp/install_online --no-check-certificate "https://raw.githubusercontent.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/master/script_bootloader/bin/install_online" && chmod 777 /tmp/install_online && /tmp/install_online
   ```

   ![](./Documents_Assets/How_to_Use/install/online_step3_en-US.jpg)

4. Read the WARNING, and input `YES` to continue the installation.

   ![](./Documents_Assets/How_to_Use/install/online_step4_en-US.jpg)

5. Demonstration of the installation process:

   - Re-partition and format the USB flash drive.

     ![](./Documents_Assets/How_to_Use/install/online_step5-1.jpg)

   - Download files for installation.

     ![](./Documents_Assets/How_to_Use/install/online_step5-2.jpg)

   - Create log of installation.

     ![](./Documents_Assets/How_to_Use/install/online_step5-3.jpg)

   - **STAGE 1**: Set boot parameters.

     ![](./Documents_Assets/How_to_Use/install/online_step5-4.jpg)

   - **STAGE 2**: Install the requisite components.

     - Input and confirm the size of swap (512M is adopted in this example), and then install and enable component swap.

       ![](./Documents_Assets/How_to_Use/install/online_step5-5-1.jpg)
       ![](./Documents_Assets/How_to_Use/install/online_step5-5-2.jpg)

     - Install and enable component entware.

       ![](./Documents_Assets/How_to_Use/install/online_step5-6.jpg)

     - Install and enable component timezone.

       ![](./Documents_Assets/How_to_Use/install/online_step5-7.jpg)

     - Install and enable component dependency.

       > It's OK even if some caveats show up on the screen.

       ![](./Documents_Assets/How_to_Use/install/online_step5-8.jpg)

     - Install and enable component monit.

       ![](./Documents_Assets/How_to_Use/install/online_step5-9.jpg)

     - Install and enable component dnsmasq.d.

       ![](./Documents_Assets/How_to_Use/install/online_step5-10.jpg)

     - Install component fwd.

       ![](./Documents_Assets/How_to_Use/install/online_step5-11.jpg)

     - STAGE 2 is completed.

       ![](./Documents_Assets/How_to_Use/install/online_step5-12.jpg)

   - **STAGE 3**: Install the optional components (the add-ons).

     - Input and confirm your username and password which are used to log into the web GUI. (This is only executed when you first run `addons_install`)

       ![](./Documents_Assets/How_to_Use/install/online_step5-13-1.jpg)
       ![](./Documents_Assets/How_to_Use/install/online_step5-13-2.jpg)
       ![](./Documents_Assets/How_to_Use/install/online_step5-13-3.jpg)

     - Input the index number of the favored add-on according to the menu.

       ![](./Documents_Assets/How_to_Use/install/online_step5-14.jpg)

     - When the previous add-on has been installed successfully, install the next add-on.

       ![](./Documents_Assets/How_to_Use/install/online_step5-15.jpg)

     - Input `0` to exit the installation and reboot the router after all the favored add-ons are installed.

       ![](./Documents_Assets/How_to_Use/install/online_step5-16.jpg)

## Installation (Offline)

1. Insert a USB flash drive (not less than 4GB; MBR) with no files into a USB port of the Router.

2. Login the router with ssh client.

3. Download the latest installation package from [here](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/wiki/Indexes-for-instructions#installation-offline) and upload it to `/tmp/home/root` of the router.

   ![](./Documents_Assets/How_to_Use/install/offline_step3_en-US.jpg)

4. Execute the code below to unzip the installation package.

   ```shell
   cd /tmp/home/root
   tar -xzvf SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER*.tar.gz
   rm -f SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER*.tar.gz
   ```

5. Execute the code below to move the files and change their rights.

   ```shell
   mv SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER*/script_bootloader ./
   rm -rf SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER*
   chmod -R 777 script_bootloader
   cp script_bootloader/bin/prerequisite_checker /tmp
   cp script_bootloader/bin/drive_modifier /tmp
   cd /tmp
   ```

6. Execute the code below to check the environment. Everything goes well if the output is nothing.

   ```shell
   /tmp/prerequisite_checker
   ```

7. Execute the code below to re-partition and format the USB flash drive.

   ```shell
   /tmp/drive_modifier
   ```

8. Execute the code below to move the files.

   ```shell
   mv /tmp/home/root/script_bootloader /tmp/mnt/ASUS_ROUTER
   ```

9. (Optional) If you need to install specific version of Entware offline or have no plan to update or upgrade packages from it in the future, download the Entware offline repository from [here](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/wiki/Indexes-for-instructions#entware-repository-offline) and upload it to `/tmp/mnt/ASUS_ROUTER/script_bootloader/usr/entware/usr/` of the router.

10. Execute the code below to start installation.

   ```shell
   /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/install
   ```

11. (Optional) If command `tee` doesn't exist in the firmware, installation will come to an end after outputing `***** STAGE 3: INSTALL ADDONS *****`. Execute the code below to install add-ons. (After installation of SCRIPTS BOOTLOADER FOR ASUS ROUTER, you can still execute this code to install other add-ons.)

   ```shell
   /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/addons_install
   ```

12. Execute the code below to reboot the router after all the favored add-ons are installed.

   ```shell
   /tmp/sbl_restart_router
   ```

## Modification to source files

Modify the source files of the target add-on according to the README_en-US.md in its own directory in `/opt/script_bootloader/usr/`.

> **NOTICE**
>
> - `LF` needs to be set in Windows before you edit the source files. Otherwise the files will be damaged.
> - NO extra setting is required in Linux before you edit the source files.

## Enable/Disable add-ons

> Add-on Management system is composed of 2 parts below.
>
> | Add-on Management system    | Type of add-ons                                            | Instruction                                                    |
> | --------------------------- | ---------------------------------------------------------- | -----------                                                    |
> | list_of_user_custom_scripts | Add-ons which run at startup with no surveillance required | Read the instruction below.                                    |
> | Monit                       | All add-ons except the type listed above                   | [Click to read](./script_bootloader/usr/monit/README_en-US.md) |

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

5. Execute the code below to reboot the router and all the favored add-ons will boot along with the router.

   ```shell
   cd /tmp && /tmp/sbl_restart_router
   ```

   ![](./Documents_Assets/How_to_Use/services_once/step5.jpg)

## Update (Online)

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/update/step1.jpg)

2. Execute the code below to update the system.

   ```shell
   cd /tmp && /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/update
   ```

   ![](./Documents_Assets/How_to_Use/update/step2.jpg)

## Upgrade (Online)

> When new version of Entware is released, execute upgrade, which could preserve all the files in directory `/tmp/mnt/ASUS_ROUTER/home` and reinstall the system.

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/upgrade/step1.jpg)

2. Execute the code below to upgrade the system.

   ```shell
   cd /tmp && /tmp/sbl_upgrade
   ```

   ![](./Documents_Assets/How_to_Use/upgrade/step2.jpg)

3. Execute the code below after restart.

   ```shell
   cp -f "/tmp/mnt/ASUS_ROUTER/script_bootloader/bin/upgrade" "/tmp/sbl_upgrade" && cd "/tmp" && "/tmp/sbl_upgrade"
   ```

   ![](./Documents_Assets/How_to_Use/upgrade/step3.jpg)

4. Following steps are same with those in section [Installation (Online)](#installation-online).

## Upgrade (Offline)

> When new version of Entware is released, execute upgrade, which could preserve all the files in directory `/tmp/mnt/ASUS_ROUTER/home` and reinstall the system.

1. Login the router with ssh client.

2. Download the latest upgrade package from [here](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/wiki/Indexes-for-instructions#upgrade-offline) and upload it to `/tmp/mnt/ASUS_ROUTER/home/root` of the router.

   ![](./Documents_Assets/How_to_Use/upgrade/offline_step2_en-US.jpg)

3. Following steps are same with those in section [Upgrade (Online)](#upgrade-online).

## Uninstallation

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/uninstall/step1.jpg)

2. Execute the code below to uninstall the system.

   ```shell
   cd /tmp && /tmp/sbl_uninstall
   ```

   ![](./Documents_Assets/How_to_Use/uninstall/step2.jpg)

## Restoration

1. Login the router with ssh client.

   ![](./Documents_Assets/How_to_Use/restore/step1.jpg)

2. Execute the code below to restore the system.

   ```shell
   cp -f /tmp/mnt/ASUS_ROUTER/script_bootloader/bin/restore /tmp && cd /tmp && /tmp/restore
   ```

   ![](./Documents_Assets/How_to_Use/restore/step2.jpg)

## Reinstallation or Upgradation

1. [Uninstall](#Uninstallation) the system.

2. [Installation (Online)](#installation-online) the system again.

## Upgrade firmware/restore to factory default

1. [Uninstall](#Uninstallation) the system.

2. Remove all the USB devices from the router after restart.

3. Upgrade firmware/restore to factory default.

4. Re-configure the router.

5. Re-plug **ONLY** the USB flash drive containing the system to a USB port of the Router.

6. [Restore](#Restoration) the system.

7. Re-plug other USB devices to the router after restart.