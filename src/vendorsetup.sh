########## extendrom section ###########
export ENABLE_EXTENDROM=false

# RELEASE_TYPE '4microg-CUSTOM-PLUS-E' or '4microg-PLUS-E-UNOFFICIAL'
export EOS_RELEASE_TYPE='4microg-CUSTOM-PLUS-E'
export EOS_RELEASE_TYPE='4microg-UNOFFICIAL' 

# EOS_BRANCH_NAME is the `lineage-n.1` branch is set in the `repo init -u https://github.com/LineageOS/android.git -b lineage-18.1`
export EOS_BRANCH_NAME=v1-r
# or do we need to do it here
#export EOS_BRANCH_NAME=lineage-18.1

export EOS_REPO=https://github.com/LineageOS/android.git
export EOS_SIGN_BUILDS=true 
export EOS_SIGNATURE_SPOOFING=restricted 
export CUSTOM_PACKAGES=''
export EXTENDROM_PACKAGES=''

l4m_custom_packages='AuroraStore AuroraServices BlissLauncher Bromite DAVx5 Etar ICSx5 NextCloud  NextCloudNotes OpenTasks K9-Mail Fennec QKSMS OpenCamera noLOSSnap noLOSEmail noLOSMessaging noLOSJelly'

if [ "$EOS_RELEASE_TYPE" = '4microg-CUSTOM-PLUS-E' ]; then

  ########### l4m plus e custom build ###########
  if [ "$ENABLE_EXTENDROM" = true ]; then
    export EXTENDROM_PACKAGES=$l4m_custom_packages
    
    if grep -q 'inherit-product-if-exists, vendor/extendrom/config/common.mk' $PWD/vendor/lineage/config/common.mk ; then
      echo "extendrom already there"
    else
      echo "adding extendrom"
      echo "\$(call inherit-product-if-exists, vendor/extendrom/config/common.mk)" >> $PWD/vendor/lineage/config/common.mk
    fi

    $PWD/vendor/extendrom/get_prebuilts.sh

  else
    export CUSTOM_PACKAGES=$l4m_custom_packages
    export EOS_CUSTOM_PACKAGES=$l4m_custom_packages
  fi
  
# else
  ########### l4m vanilla unofficial build ###########
  # nothing to do!
  
fi
