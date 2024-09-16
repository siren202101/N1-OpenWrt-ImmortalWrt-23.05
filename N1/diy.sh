#!/bin/bash

# Default IP
#sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate

# Remove packages
#rm -rf feeds/luci/applications/luci-app-passwall

# Add packages
git clone https://github.com/nantayo/My-Pkg package/my-pkg
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic

### 添加第三方订阅源
#sed -i '$a src-git kiddin9_openwrt_packages https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
sed -i '$a src-git kenzok8_openwrt_packages https://github.com/kenzok8/openwrt-packages.git' feeds.conf.default
sed -i '$a src-git kenzok8_small_package https://github.com/kenzok8/small-package.git' feeds.conf.default
sed -i '$a src-git-full xiaorouji_passwall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
sed -i '$a src-git-full sbwml_mosdns https://github.com/sbwml/luci-app-mosdns.git' feeds.conf.default

###修改信息###
sed -i 's/192.168.1.1/192.168.2.251/g' package/base-files/files/bin/config_generate
sed -i "s/hostname='ImmortalWrt'/hostname='OpenWRT-360T7'/g" package/base-files/files/bin/config_generate
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt By 神棍 $(date +"%Y%m%d")'/g" package/base-files/files/etc/openwrt_release

# Add luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git  package-temp/luci-app-amlogic
mv -f package-temp/luci-app-amlogic/luci-app-amlogic package/lean/
rm -rf package-temp
