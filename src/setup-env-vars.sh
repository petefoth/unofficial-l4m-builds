#!/bin/bash

#########################################################
# - specify the release type
# - specify the branch name
# - set and export the environment variables needed by
#   - vendor/e
#   - vendor/extendrom if we're making a custom builds
# - copy our `before.sh` to userscripts directory

echo "Running unofficial-l4m-build/src/setup-env-vars.sh"

#########################################################
# specify the release type
# - '4microg-CUSTOM-PLUS-E' or '4microg-UNOFFICIAL'
# - comment/uncomment according to which you want
export EOS_RELEASE_TYPE=4microg-CUSTOM-PLUS-E
#export EOS_RELEASE_TYPE=4microg-UNOFFICIAL

#########################################################
# specify the /e/OS branch name: use /e/ naming scheme
# v1-q, v1-r, v1-s
export EOS_BRANCH_NAME=v1-r

#########################################################
# environment variables needed by vendor/e
export EOS_REPO=https://github.com/LineageOS/android.git
export EOS_SIGN_BUILDS=true
export EOS_SIGNATURE_SPOOFING=restricted
export CUSTOM_PACKAGES=''
export EOS_CUSTOM_PACKAGES=''
export EXTENDROM_PACKAGES=''
export EOS_CCACHE_DIR="$PWD/ccache/l4m"

## Temporary workaround for `--enforce-uses-libraries` issue #12
export RELAX_USES_LIBRARY_CHECK=true

l4m_custom_packages='AuroraStore AuroraServices BlissLauncher Bromite DAVx5 ICSx5 NextCloud  NextCloudNotes OpenTasks K9-Mail-latest Fennec QKSMS OpenCamera noLOSSnap noLOSEmail noLOSMessaging noLOSJelly'

case "$EOS_RELEASE_TYPE" in
  4microg-CUSTOM-PLUS-E)
    export WITH_GMS=true
    export ENABLE_EXTENDROM=true
    export EXTENDROM_PACKAGES=$l4m_custom_packages
  ;;

  4microg-UNOFFICIAL)
  export WITH_GMS=true
  export ENABLE_EXTENDROM=false
  ;;

  *)
  # 'vanilla' LinegaOS - no microG
  export WITH_GMS=false
  export ENABLE_EXTENDROM=false
  ;;

esac


########################################################
# copy before.sh to userscripts directory (.e/userscripts/)
userscripts_dir="${pwd}/.e/userscripts"
mkdir -p $userscripts_dir

chmod a+x ./before.sh
cp ./before.sh $userscripts_dir
