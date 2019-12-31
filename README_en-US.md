# Introduction to SCRIPTS BOOTLOADER FOR ASUS ROUTER

[中文](./README.md) | [English](./README_en-US.md)

## Background

1. There are so many methods to boot scripts at startup for Asuswrt. Unfortunately, some of them are invalid and some of them are too complicated to use.

2. Most of those methods need to write at least one piece of code to the partition `/jffs` of the router, which will shorten the life expectency of the router according to RMerlin, the author of [Asuswrt-Merlin](https://www.asuswrt-merlin.net/). Because the flash chip in router could bear a limited number of write cycles. Once the flash sectors get worn out, the router will die. [Reference](https://github.com/RMerl/asuswrt-merlin/wiki/JFFS)

3. According to my experience, Merlin-Asuswrt does have some weak points. For example, some features in Asuswrt are not shipped in Merlin-Asuswrt, such as AiMesh.

As a consequence, I decide to develop this SCRIPTS BOOTLOADER FOR ASUS ROUTER which could be deployed in both Asuswrt and Asuswrt-Merlin without anything written to the partition `/jffs` of the router.

## Features of Function

1. Customized scripts designated in USB flash drive will be loaded at startup automatically. In this way, you can enrich functions of the router at your will.

2. Installation script of [Entware](https://entware.net/) has been rewritten thoroughly. It will deploy Entware matching the architecture of your router automatically in the USB flash drive with no attendence.

3. 512M swap will be created during installation and mounted automatically at every startup.

4. One-key deploying script of this system and addon-installation script are offered, which are very easy to use.

5. Management Webpage powered by [Monit](https://mmonit.com/monit/) is offered and you can start or stop your customized scripts, addons and services easily.

## Features of code

1. All the scripts can run perfectly on both Asuswrt and Asuswrt-Merlin.

2. All the scripts are written in shell script.

3. All the scripts are formatted unified and equipped with bilingual comments in English and Chinese, which demonstrate almost every line of code. Unsurprisingly, they are very intelligible and easy to read, understand, modify and use.

4. All the scripts are organized clearly and logically by naming policy and directories, which demostrates the function of each script clearly.

5. All the scripts and binaries are only deployed in the USB flash drive connected to the router, writing nothing to the partition `/jffs` of the router, in order to make the router live longer.

6. This system can be placed in any level of directories in the USB flash drive.

7. You can connect multiple USB flash drives to the router without any conflict, as long as there is **ONLY ONE** directory named `script_bootloader` in these USB flash drives.

## Online Installation

1. Back up all the data on the target USB flash drive (no less than 4GB) and connect it to the router.

2. Unplug all the USB flash drives from the router except the target one.

3. Login the router by `ssh` and run the line of code below to finish installation. If you want to [install the system offline](./How_to_Use_en-US.md#Installation-Offline), please refer to the *How to use*.

   > **Notice**
   > 
   > Make sure your username and password which are used to log into the web GUI contain **NO** character beyond the range of *underline, numbers and lower-case and upper-case letters*.

   ```shell
   cd /tmp && wget -q -O /tmp/install_online --no-check-certificate "https://raw.githubusercontent.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/master/script_bootloader/bin/install_online" && chmod 777 /tmp/install_online && /tmp/install_online
   ```

   > There are 3 stages in the installation:
   >
   > 1. STAGE 1: Set the router.
   >    - No attendance required.
   >
   > 2. STAGE 2: Deploy programs required by system.
   >    - No attendance required.
   >    - Long time needed, please wait patiently.
   >    - less than 5 errors in red or yellow color will appear during the process of python deployment, which is no need to worry.
   >
   > 3. STAGE 3: Install optional addons.
   >    - Choose the addon you want from the list shown on the screen by typing in its order number (just one addon every time) and pressing \<Enter\>.
   >    - Repeat the process stated above to install next addon.
   >    - When all the addons needed have been installed, type in `0` to finish installation.
   >    - The router will reboot automatically.

4. When the installation gets completed, visit

   ```
   http://<Address of the router>:35490

   username: username to web login of the router
   password: password to web login of the router
   ```

   to manage the addons installed.

   ![monit_in_use.png](./Documents_Assets/monit/web/monit_in_use.jpg)

## More materials

[Indexes for instructions](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/wiki/Indexes-for-instructions)

[Changelog](./ChangeLog_en-US.md)

[Download link](https://github.com/JACK-THINK/SCRIPTS-BOOTLOADER-FOR-ASUS-ROUTER/releases)