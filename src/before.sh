#!/bin/bash

#########################################################
# - Get and apply the restricted signature spoofing patches
# - Sort out zip file naming
# - modify common makefile to use vendor/e
# - modify common makefile to use extendrom (if it's enabled)
# - call the extendrom get_prebuilts script to download packages
#   and modify its makefile
#
# this file is copied to the userscripts directory by
# setup-env-vars.sh, so it will be called by
# android_vendor_e/post-sync.sh
#########################################################

#########################################################
# Get and apply the restricted signature spoofing patches
#    we get the patches from the L4M docker-lineage-cicd repo
#    and the logic from their Dockerfile
#
rm -rf ${TMP_DIR}/l4m-cicd
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
git reset --hard
echo ">> [$(date)] Applying the restricted signature spoofing patch (based on $frameworks_base_patch) to frameworks/base"

sed 's/android:protectionLevel="dangerous"/android:protectionLevel="signature|privileged"/' "${TMP_DIR}/l4m-cicd/src/signature_spoofing_patches/$frameworks_base_patch" | patch --force -p1

git clean -q -f
cd ../..
#########################################################

#########################################################
# Sort out zip file naming

# which makefile does the filtering of 'random build_types?'

makefile_containing_version="vendor/$vendor/config/common.mk"

if [ -f "vendor/$vendor/config/version.mk" ]; then
  makefile_containing_version="vendor/$vendor/config/version.mk"
fi

# remove the lines that do the filtering

echo ">> [$(date)] Setting \"$RELEASE_TYPE\" as release type"
sed -i "/\$(filter .*\$(${vendor^^}_BUILDTYPE)/,/endif/d" "$makefile_containing_version"
#########################################################

#########################################################
# modify common makefile to use vendor/e
if grep -q 'vendor/e/config/common.mk' $PWD/vendor/lineage/config/common.mk ; then
  echo "vendor e already enabled in /vendor/lineage/config/common.mk"
else
  echo "enabling vendor/e in /vendor/lineage/config/common.mk"
  echo "\$(call inherit-product-if-exists, vendor/e/config/common.mk)" >> $PWD/vendor/lineage/config/common.mk
fi
#########################################################


#########################################################
# modify common makefile to use vendor/extendrom

if [ "$ENABLE_EXTENDROM" = true ]; then

  if grep -q 'inherit-product-if-exists, vendor/extendrom/config/common.mk' $PWD/vendor/lineage/config/common.mk ; then
    echo "extendrom already enabled in /vendor/lineage/config/common.mk"
  else
    echo "enabling extendrom in /vendor/lineage/config/common.mk"
    echo "\$(call inherit-product-if-exists, vendor/extendrom/config/common.mk)" >> $PWD/vendor/lineage/config/common.mk
  fi

# call the extendrom script to download packages and modify its makefile
  $PWD/vendor/extendrom/get_prebuilts.sh

fi
#########################################################
