################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="RTL8821CU"
PKG_VERSION="8ac1de7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/El-SiD/rtl8821CU"
PKG_GIT_URL="https://github.com/El-SiD/rtl8821CU.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_PRIORITY="optional"
PKG_SECTION="driver"
PKG_SHORTDESC="Realtek RTL8821CU driver"
PKG_LONGDESC="Realtek RTL8821CU driver"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_PREFIX \
       CONFIG_POWER_SAVING=n \
       CONFIG_RTW_DEBUG=y \
       CONFIG_RTW_CFGVEDNOR_RSSIMONITOR=n \
       CONFIG_RTW_CFGVENDOR_RANDOM_MAC_OUI=n \
       CONFIG_XMIT_ACK=n
}

makeinstall_target() {
  mkdir -p $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/lib/modules/$(get_module_dir)/$PKG_NAME
}
