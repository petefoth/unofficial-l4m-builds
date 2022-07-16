# Unofficial builds of LineageOS for microG

The purpose of this project is to make and manage unofficial builds of [LineageOS for microG](https://lineage.microg.org/), for devices which are not supported by official LineageOS builds.

The builds are based on the unofficial LineageOS ROMs, details of which can be found in the appropriate XDA Forum thread(s). I am very grateful to the developers and maintainers of these ROMs, who have been very helpful to me, and to others in the community. Big thanks also to the /e/ developers, and to the contributors to the [/e/ Community Forums](https://community.e.foundation/)

Initially the builds will be for the following Sony Xperia devices, the first two of which I happen to own and use:
- [Z5 Compact](https://www.gsmarena.com/sony_xperia_z5_compact-7535.php) (`suzuran`)
   - Based on Professor-Berni / Berni-0815's [LineageOS 18.1](https://forum.xda-developers.com/t/rom-unofficial-11-r-lineageos-18-1-for-z5c-suzuran.4205135/) ROMs
- [XZ1 Compact](https://www.gsmarena.com/sony_xperia_xz1_compact-8610.php) (`lilac`)
   - Based on Alexander Grund / Flamefire's [LineageOS 17.1/18.1](https://forum.xda-developers.com/t/rom-unofficial-10-q-lineageos-17-1-for-z5c-suzuran.4052973/) ROMs, (based in turn on the work of `Modpunk & Derfelot`)  
- [Z3 Tablet Compact](https://www.gsmarena.com/sony_xperia_z3_tablet_compact-6633.php)
   - Based @evil-God's [LineageOS 18.1](https://forum.xda-developers.com/t/rom-z3tc-lineageos-18-1-sgp621-unofficial.4256523/) ROMs

I am building two types of ROM
- an unofficial 'vanilla' build, which is intended to be identical (or nearly so) to the official LineageOS for microG builds for similar devices
- a custom build, aimed at users of the privacy-friendly [/e/OS](https://e.foundation/e-os/) and their cloud ecosystem. /e/OS is based on LineageOS for microG, and is intended to be usable "out of the box" with the /e/ cloud services. It achieves this by including forks of various apps, which they have modified to have a consistent UI. They also include their own homescreen / launcher app, an alternative app store, and, in the most recent builds, an "Advanced Privacy" app. My custom build is aimed at users who 
  - would prefer to use the original "upstream" apps rather than /e/'s forks;
  - are happy with the privacy-friendiness and level of "de-Gooling" in LineageOS for microG;
  - are happy to get apps they need from the mature F-Droid and Aurora Store, rather than a new, less mature app from /e/.

For XZ1 Compact, I have made both `lineage-17.1` and `lineage-18.1` builds, as many users prefer the Sony stock Camera app, which works in `17.1` but not in `18.1`. For Z5 Compact I have only made `18.1` builds, since `18.1` works well.

## The builds

The builds can be downloaded from AndroidFileHost

**Z5 Compact**

The latest builds will always be available in [this directory](https://www.androidfilehost.com/?w=files&flid=322410)

Most recent builds:
- unofficial "vanilla" build
  - [lineage-18.1-20220715-4microg-UNOFFICIAL-suzuran.zip](https://www.androidfilehost.com/?fid=15664248565197189838)
- custom "PLUS E" build
  - [`lineage-18.1-20220714-4microg-CUSTOM-PLUS-E-suzuran.zip`](https://www.androidfilehost.com/?fid=15664248565197189483)

**XZ1 Compact**

The latest builds will always be available in [this directory](https://androidfilehost.com/?w=files&flid=322414)

Most recent builds:
- unofficial "vanilla" builds
  - `17.1`  [lineage-17.1-20220617-4microg-UNOFFICIAL-lilac.zip](https://androidfilehost.com/?fid=15664248565197184329)
  - `18.1` [lineage-18.1-20220621-4microg-UNOFFICIAL-lilac.zip](https://androidfilehost.com/?fid=15664248565197184314)
- custom "PLUS E" builds
  - `17.1` [lineage-17.1-20220617-4microg-CUSTOM-PLUS-E-lilac.zip](https://androidfilehost.com/?fid=15664248565197184330)
  - `18.1` [lineage-18.1-20220621-4microg-CUSTOM-PLUS-E-lilac.zip](https://androidfilehost.com/?fid=15664248565197184322)

**Z3 Tablet Compact**

The latest builds will always be available in [this directory](https://www.androidfilehost.com/?w=files&flid=335191)

Most recent builds:
- unofficial "vanilla" build
  - `Wifi+4g` device `SGP621` [lineage-18.1-20220710-4microg-UNOFFICIAL-z3tc.zip](https://www.androidfilehost.com/?fid=15664248565197188468)
  - `Wifi only` device `SGP611` [lineage-18.1-20220712-4microg-UNOFFICIAL-z3tcw.zip](https://www.androidfilehost.com/?fid=15664248565197188647)
- custom "PLUS E" build
  - `Wifi+4g` device `SGP621` [lineage-18.1-20220713-4microg-CUSTOM-PLUS-E-z3tc.zip](https://www.androidfilehost.com/?fid=15664248565197188964)
  - `Wifi only` device `SGP611` [lineage-18.1-20220713-4microg-CUSTOM-PLUS-E-z3tcw.zip](https://www.androidfilehost.com/?fid=15664248565197188908)

## Details of Custom build
This build differs from the standard /e/OS and L4m builds as follows. (Unless otherwise stated, all the following come from F-Droid, and receive updates via F-Droid). The build includes
- Aurora Store and Aurora Services for installing and updating apps from Google's Play Store, in addition to L4m's F-Droid, and in place of /e/'s Apps / App Lounge;
- /e/'s Bliss launcher alongside LOS's Trebuchet. Users choose which to use as default during first time setup. They can swap using Settings | Apps | Default apps;
- QKSMS in place of /e/'s fork and LOS's Messaging
- K-9 Mail in place of /e/'s fork and LOS's Email
- OpenCamera in place of /e/'s fork and LOS's Snap
- Bromite in place of /e/'s fork and LOS's Jelly. (This comes from Bromite's F-Droid repo, which is added to F-Droid's repos, allowing it to receive updates via F-Droid)
- Fennec browser, to allow users a choice between Chromium-based and Firefox-based browsers;
- NextCloud sync client in place of /e/'s eDrive 
- NextCloud Notes, OpenTasks in place of /e/'s forks
- DAVx5 and ICSx5 in place of /e/'s Account Manager

## Building the ROMs

*To do:*
- *link to my manifests and build script*
- *links to my `extendrom` fork repo and the upstream*

## Feedback - Comments / Issues

I'm using [Github Discussions](https://github.com/petefoth/unofficial-l4m-builds/discussions/) as a means to provide feedback - comments, issues, suggestions. Please keep contributions civil and relevant. I will remove any that I decide are not :)

If you have found something that you think is a bug, please feel free to [create an issue here](https://github.com/petefoth/unofficial-l4m-builds/issues)
