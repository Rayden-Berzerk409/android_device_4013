# Device Tree For Alcatel Pixi 3 (4.0) - 3.4.67 - MT6572 / Resurrection Remix OS v5.8.5 Android Nougat (7.1.2) Branch


| Basic   | Spec Sheet |
| -------:|:------------------------- | 
| CPU     | Dual Core 1.3 GHz |
| CHIPSET | Mediatek MT6572 Cortex-A7 |
| GPU     | Mali-400 |
| Memory  | 512MB RAM |
| Android | 4.4.2/5.1.1/6.0.1/7.1 |
| Storage | 4 GB |
| MicroSD | Up to 32GB |
| Battery | 1500 mAh |
| Display | 4.5 Inch |
| Rear Camera  | 5 MP, 480p@20f ,LED flash |
| Front Camera  | 2 MP |

# Whats Working:

| What  | Work Or Not? |
| -------:|:------------------------- | 
| Camera  | Yes and SURE!! |
| Vid Rec/Enc | Yes,SW and HW. |
| Flashlight  | Yup |
| Audio   | Fully |
| FM      | N/A   |
| Storages | Yeah  |
| Blutooth | YH    |
| WiFi     | Always |
| Graphics | Ey     |
| VPN      | With Some APPS ONLY |
| RIL      | Yes,Maybe ONE SIM only |
| DataConnc| Yes |

# Tree Powered By: SaMad SegMane.

# Credits:
| Thax U  |
| -------:|
| Aditya Kr  | 
| Teja K |
| tribtmen |
| Lineage MTK |
| fire855| 
| ferhug | 
| MAD |
| AMD | 
| Maybe More | 
| Melek Saidani |

Steps to build RR for 4013M
===================

Resurrection Remix OS Nougat Source 2018
===================

[Crowdin for translations](https://crowdin.com/project/resurrectionremix/)

[![Crowdin](https://d322cqt584bo4o.cloudfront.net/resurrectionremix/localized.svg)](https://crowdin.com/project/resurrectionremix)


Getting Started
---------------
To get started with building from Resurrection Remix sources, you'll need to get
familiar with [Establishing a build environment](http://source.android.com/source/initializing.html).

How to build Resurrection Remix ROM for your device - Tutorial
--------
### New way to set up and build Resurrection Remix.

##### Refer to [scripts](https://github.com/akhilnarang/scripts) to setup build env

Once done, the source code should be already set up and you can head on to build RR by using the build script in the root of source code
 
so simply copy and paste this in a terminal window:

     $ bash build.sh

---

### Old way to set up and build Resurrection Remix.

### Build Environment

- Tested and Working on any version of Ubuntu - 14.04,14.10,15.04 (64-bit)
- Any other distribution based of the Ubuntu Distro such as Lubuntu, Xubuntu and etc.
- Any form of Terminal
- Decent hardware (minimum of at least a dual core CPU and 8 GB of RAM)
- A storage unit of any kind (We recommend utilizing SSDs as Mechanical HDDs slow down the build proccess drastically and the minimum storage size is 70GB. Having more will be useful with CCache[More on that later])
- Required Packages should have been installed

### Required Packages
##### Simply copy and paste this in a terminal window:
[Hint: This command updates the Ubuntu Packages List (Install Listing) and install the required version of Java]

     $ sudo apt-get install openjdk-8-jdk

### Let that install and then proceed.

### More copy and paste:
[Hint: Running this command installs the other required packages to build android]

     $ sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev gcc-multilib maven tmux screen w3m ncftp

### Getting the source
- Making required directories
- Obtaining the repo binary
- Adding repo binary to your path
- Giving the repo binary proper permissions
- Initializing an empty repo
- Syncing the repo

Alright, so now we’re getting there. I have outlined the basics of what we’re about to do and broke them down as I know them. This is all pretty much going to be copy/paste so it’ll be fairly difficult to screw this up :)

##### Make directory for the repo binary

      $ mkdir ~/bin

##### Add directory for the repo binary to its path

      $ PATH=~/bin:$PATH

##### Downloading repo binary and placing it in the proper directory

      $ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

##### Giving the repo binary the proper permissions

      $ chmod a+x ~/bin/repo

##### Creating directory for where the RR repo will be stored and synced

      $ mkdir ~/RR
      $ cd ~/RR

##### Initializing the RR repo and downloading the manifest

      $  repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b nougat

##### Syncing the source
[Hint: This might take a long time as the source is ~20GB]

      $  repo sync -f --force-sync --no-clone-bundle

###Building the Resurrection Remix ROM
- Preparing Required Binaries and Device Drivers
- Setting Up CCache (Optional)
- Building Resurrection Remix

Congratulations on the succesfull build initialization! Now, we shall go ahead and prepare to build for your device!

## Preparing Resurrection Remix ROM for 4013

Once you're done syncing RR, go ahead and clone 4013's device trees:

[Device Tree](https://github.com/Rayden-Berzerk409/android_device_4013/tree/rr-nougat)

[Kernel Tree](https://github.com/Rayden-Berzerk409/android_kernel_4013/tree/3.4.67)

[Vendor Tree](https://github.com/Rayden-Berzerk409/android_vendor_4013/tree/rr-nougat)

To do so, use this commands:

### For device tree

    $ git clone https://github.com/Rayden-Berzerk409/android_device_4013.git -b rr-nougat device/alcatel/4013

### For kernel tree

    $ git clone https://github.com/Rayden-Berzerk409/android_kernel_4013.git -b 3.4.67 kernel/alcatel/mt6572

### For vendor tree

    $ git clone https://github.com/Rayden-Berzerk409/android_vendor_4013.git -b rr-nougat vendor/alcatel/4013

##### Setting Up CCache
- CCache is a method of utilizing a specified storage space to speed up building. It can be referred to as the same caching your android device does to speed up application and system boot times. In this case, CCache will help build Resurrection Remix faster than standard build times (Able to cut-down 50% of time taken to build).
- To set up CCache, follow the following:


        $ echo "export USE_CCACHE=1" >> ~/.bashrc
      
        $ ~/RR/prebuilts/misc/linux-x86/ccache/ccache -M 50G

     -M 50G
The number before the letter G at the end specifies the amount of space CCache can use in your storage unit. As such, ensure that not too much of space is specified as this might result in unexpected errors although, the more storage you have, its recommended to have more CCache as it will increase the build times. Most efficient build systems are able to utilize CCache to about 120G or more.

##### To build Resurrection Remix ROM

      $ cd ~/RR
      $ . build/envsetup.sh && brunch rr-4013_userdebug

##### Obtaining the zip created from the build process
To get the zip file that has been built, navigate to the following directory and find for the zip file:

      $ cd ~/RR/out/target/product/4013/

If you found it, then congratulations! If you didn't, try retrying the build process but before doing so, ensure you do the following to make sure your next build is clean;

      $ cd ~/RR
      $ make clean
      $ repo sync --force-sync

After doing so, redo everything stated from the Building Section.

##### For those who successfully built Resurrection Remix

Well, Congratulations on your victory! Now, you have a .zip file that flashable to your device! Share it to the internet as you wish but be sure to contribute back and also give credits to the Resurrection Remix Team and its contributors!Also keep in mind that if an official build exists for a device, no unofficial builds should be released publicly. Do come and build Resurrection Remix another time as source code is routinely being improved upon. If you wish to contibute, feel free to make a pull request to the Resurrection Remix Team! See you again builder!Note:If you decide to create a thread on xda, please limit the thread to only one per device.more than one thread will not be allowed per device as it creates confusion amongst users and makes it hard for us to track bug reports.If you have unofficial builds, post them up on g+ so users can use and report issues in the post itself.
