#!/bin/bash

#########################################################
# Get and apply the restricted signature spoofing patches
#
# we get the patches from the L4M docker-lineage-cicd repo
# and the logic from their Dockerfile
#
# this file should be copied to the userscripts directory
# .e.userscripts, so it will be called by android_vendor_e/post-sync.sh
#########################################################

git clone https://github.com/lineageos4microg/docker-lineage-cicd.git ${TMP_DIR}/l4m-cicd

# The patch to use depends on android_version_major
case "$android_version_major" in
  "10")
  frameworks_base_patch="android_frameworks_base-Q.patch"
  ;;

  "11")
  frameworks_base_patch="android_frameworks_base-R.patch"
  ;;

  "12")
  frameworks_base_patch="android_frameworks_base-S.patch"
  ;;
esac

# apply the patch
cd frameworks/base
echo ">> [$(date)] Applying the restricted signature spoofing patch (based on $frameworks_base_patch) to frameworks/base"

sed 's/android:protectionLevel="dangerous"/android:protectionLevel="signature|privileged"/' "${TMP_DIR}/l4m-cicd/signature_spoofing_patches/$frameworks_base_patch" | patch --force -p1

git clean -q -f
cd ../..
