Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85301A68D6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731084AbgDMP2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:28:51 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41020 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbgDMP2u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791640; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JozVOlhhaXwzL1rYVN280fjSt31IQSmwyGoEolAGKz8=;
        b=tYsIZChJCu6ZYGo79an9Ruonf3OFftHOECiC+YyOdkVj3ozU4BC6GD5QKgJG8pMgWFD+m4
        +R9tBY/+IrhDEf9/N/y0mDUk7QMnw8Js+v4SItlAHuOi4PGmw8oTeh6QnntABFWjWAjrta
        N7gz/qYc8agfUtf6Ucz2xGuRApdQRA8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 12/13] MIPS: ingenic: GCW0: Update defconfig
Date:   Mon, 13 Apr 2020 17:26:32 +0200
Message-Id: <20200413152633.198301-12-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable support for the new hardware that was added in the devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/configs/gcw0_defconfig | 131 ++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 3 deletions(-)

diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
index a3e3eb3c5a8b..48131cb47e66 100644
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -1,27 +1,152 @@
+CONFIG_DEFAULT_HOSTNAME="gcw0"
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
 CONFIG_MACH_INGENIC=y
 CONFIG_JZ4770_GCW0=y
 CONFIG_HIGHMEM=y
 # CONFIG_SECCOMP is not set
-# CONFIG_SUSPEND is not set
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_BOUNCE is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
 CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+# CONFIG_WLAN_VENDOR_MARVELL is not set
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+# CONFIG_WLAN_VENDOR_RALINK is not set
+CONFIG_RTL8192CU=m
+# CONFIG_RTLWIFI_DEBUG is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
+# CONFIG_WLAN_VENDOR_QUANTENNA is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_JOYSTICK=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_UINPUT=y
+CONFIG_INPUT_PWM_VIBRA=y
+# CONFIG_SERIO is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_INGENIC=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_GPIO=y
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=y
+CONFIG_POWER_SUPPLY=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_JZ4740_WDT=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ACT8865=y
+CONFIG_DRM=y
+CONFIG_DRM_FBDEV_OVERALLOC=300
+CONFIG_DRM_PANEL_NOVATEK_NT39016=y
+CONFIG_DRM_INGENIC=y
+CONFIG_DRM_ETNAVIV=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_PROC_FS is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_MIPS is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_JZ4740_SOC_I2S=y
+CONFIG_SND_SOC_JZ4770_CODEC=y
+CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_USB_CONN_GPIO=y
 CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_OTG_BLACKLIST_HUB=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_NOP_USB_XCEIV=y
-CONFIG_TMPFS=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_GADGET=y
+CONFIG_USB_MUSB_JZ4740=y
+CONFIG_USB_INVENTRA_DMA=y
+CONFIG_JZ4770_PHY=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VBUS_DRAW=500
+CONFIG_USB_ETH=y
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_JZ4740=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_JZ4740=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
+# CONFIG_VIRTIO_MENU is not set
+CONFIG_STAGING=y
+CONFIG_R8188EU=m
+CONFIG_INGENIC_OST=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_IIO=y
+CONFIG_IIO_BUFFER=y
+CONFIG_IIO_BUFFER_CB=y
+CONFIG_IIO_KFIFO_BUF=y
+CONFIG_MXC6255=m
+CONFIG_INGENIC_ADC=y
+CONFIG_PWM=y
+CONFIG_PWM_JZ4740=y
+CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_FILE_DIRECT=y
+CONFIG_SQUASHFS_DECOMP_MULTI=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity"
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_FONTS=y
+CONFIG_FONT_6x10=y
+CONFIG_DEBUG_FS=y
-- 
2.25.1

