Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EA825F03A
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgIFTbz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:55 -0400
Received: from crapouillou.net ([89.234.176.41]:36094 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgIFTbw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420600; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gYVmePRSFwzki6IKOxXj7qGdEYVRkaQ8DmySyjRyYVE=;
        b=XV5IZg7AqMaA0pAIBTCEagTh8sCO+nSDvAFNvVe+KzbGlukPhymAcfci5G0uU0bdBUIx2M
        peuQYi8JtKj22sOrcw4uFxZs7z5X9L9BHzrU1XB71Vpw2EO8j7ijZElC+REE1vY7JPR5Wt
        YCD/J5IroGBgetK40nwowdtkTax942Q=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 14/15] MIPS: configs: Regenerate configs of Ingenic boards
Date:   Sun,  6 Sep 2020 21:29:34 +0200
Message-Id: <20200906192935.107086-15-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For each board the MACH_INGENIC_SOC option was selected instead of
MACH_INGENIC. Nothing else was changed in the menuconfig.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Update cu1830-neo board config as well.
    
    v3: Adapt patch on top so that it applies on top of patch 1

 arch/mips/configs/ci20_defconfig       |  4 ++--
 arch/mips/configs/cu1000-neo_defconfig | 15 ++-------------
 arch/mips/configs/cu1830-neo_defconfig | 15 ++-------------
 arch/mips/configs/gcw0_defconfig       |  2 +-
 arch/mips/configs/qi_lb60_defconfig    |  6 ++----
 arch/mips/configs/rs90_defconfig       |  4 ++--
 6 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 0a46199fdc3f..052c5ad0f2b1 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,7 +22,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
@@ -42,7 +42,7 @@ CONFIG_IP_PNP_DHCP=y
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
-# CONFIG_FW_LOADER is not set
+CONFIG_FW_LOADER=m
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_MTD=y
 CONFIG_MTD_RAW_NAND=y
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index e924c817f73d..55d0690a3ffe 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -1,5 +1,3 @@
-CONFIG_LOCALVERSION_AUTO=y
-CONFIG_KERNEL_GZIP=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
@@ -9,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_KMEM=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
@@ -22,7 +19,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1000_CU1000_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
@@ -31,7 +28,6 @@ CONFIG_HZ_100=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
-CONFIG_CMA_AREAS=7
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -40,19 +36,16 @@ CONFIG_CFG80211=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
-# CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_NETDEVICES=y
 CONFIG_STMMAC_ETH=y
 CONFIG_SMSC_PHY=y
 CONFIG_BRCMFMAC=y
-# CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_LEGACY_PTY_COUNT=2
-CONFIG_SERIAL_EARLYCON=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=3
@@ -66,8 +59,6 @@ CONFIG_GPIO_SYSFS=y
 CONFIG_SENSORS_ADS7828=y
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
@@ -82,8 +73,6 @@ CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_NVMEM=y
-CONFIG_NVMEM_SYSFS=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -108,8 +97,8 @@ CONFIG_CONSOLE_LOGLEVEL_QUIET=15
 CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
 CONFIG_DEBUG_INFO=y
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index cbfb62900273..e7064851a47a 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -1,5 +1,3 @@
-CONFIG_LOCALVERSION_AUTO=y
-CONFIG_KERNEL_GZIP=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
@@ -9,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_KMEM=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
@@ -22,7 +19,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1830_CU1830_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
@@ -31,7 +28,6 @@ CONFIG_HZ_100=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
-CONFIG_CMA_AREAS=7
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -40,7 +36,6 @@ CONFIG_CFG80211=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
-# CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=y
@@ -49,13 +44,11 @@ CONFIG_NETDEVICES=y
 CONFIG_STMMAC_ETH=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_BRCMFMAC=y
-# CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_LEGACY_PTY_COUNT=2
-CONFIG_SERIAL_EARLYCON=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=2
@@ -69,8 +62,6 @@ CONFIG_GPIO_SYSFS=y
 CONFIG_SENSORS_ADS7828=y
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
@@ -85,8 +76,6 @@ CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_NVMEM=y
-CONFIG_NVMEM_SYSFS=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
@@ -111,8 +100,8 @@ CONFIG_CONSOLE_LOGLEVEL_QUIET=15
 CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
 CONFIG_DEBUG_INFO=y
 CONFIG_STRIP_ASM_SYMS=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=10
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
index 4994749b9eaa..7e28a4fe9d84 100644
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -4,7 +4,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_EMBEDDED=y
 CONFIG_PROFILING=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4770_GCW0=y
 CONFIG_HIGHMEM=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 9c2c183085d1..b4448d0876d5 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -7,7 +7,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_QI_LB60=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
@@ -73,9 +73,7 @@ CONFIG_DRM=y
 CONFIG_DRM_FBDEV_OVERALLOC=200
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_INGENIC=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -171,9 +169,9 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_READABLE_ASM=y
+CONFIG_KGDB=y
 CONFIG_DEBUG_KMEMLEAK=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_FTRACE is not set
-CONFIG_KGDB=y
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index de6752051ecc..dfbb9fed9a42 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -19,7 +19,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_PERF_EVENTS is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_MACH_INGENIC=y
+CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_RS90=y
 CONFIG_PAGE_SIZE_16KB=y
 CONFIG_HZ_100=y
@@ -80,8 +80,8 @@ CONFIG_KEYBOARD_GPIO=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_LEGACY_PTY_COUNT=2
-# CONFIG_DEVMEM is not set
 # CONFIG_HW_RANDOM is not set
+# CONFIG_DEVMEM is not set
 # CONFIG_I2C_COMPAT is not set
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_POWER_SUPPLY=y
-- 
2.28.0

