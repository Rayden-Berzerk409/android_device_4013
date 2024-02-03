#!/bin/bash
 cd ../../../..

 cd packages/apps/Settings
 patch -p1 -b < ../../../device/4013/patches/android_settings_developer_info.patch
 git clean -f -d

 cd ../../../system/vold
 patch -p1 < ../../device/4013/patches/android_system_vold.patch
 
 cd ../sepolicy
 patch -p1 < ../../device/4013/patches/android_system_sepolicy.patch
 cd ../../external/icu
 patch -p1 < ../../device/4013/patches/android_external_icu.patch

 cd ../../frameworks/av
 patch -p1 < ../../device/4013/patches/android_frameworks_av.patch
 mkdir ../../device/4013/backup

 cd ../..
 cd packages/apps/FMRadio
 patch -p1 < ../../../device/4013/patches/android_packages_apps_FMRadio.patch

 cd ../../../
 
 cd vendor*/code*/telepho*
 cd ims/src/org/codeaurora/ims/utils/
 cp QtiImsExtUtils.java ../../../../../../../../../device/4013/backup/QtiImsExtUtils.java
 sudo rm -rf QtiImsExtUtils.java
 cp ../../../../../../../../../device/4013/patches/QtiImsExtUtils.java QtiImsExtUtils.java
 cd ../../../../../../../../../
 cd system/sepolicy
 cp mediaserver.te ../../device/4013/backup/mediaserver.te
 sudo rm -rf mediaserver.te
 cp ../../device/4013/patches/mediaserver.te mediaserver.te
 echo "Patch Success!"
 echo "IF Any Build Error, Restore the backups in repo/device/4013/backup"
