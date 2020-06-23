Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1EA205A82
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbgFWSZf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:25:35 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52196 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733075AbgFWSZf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936689; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EPdm0Yhn/83KdV9iPjfd0sOIgIxMXCsj5QXkNwC1Uwo=;
        b=EL3fcqKkyd6KqdKZRIqAwoXlabo1AeUTWKWHITV+xL00oaeGYbvHD4bX151bVTror+sazA
        dM9WoBAslVZFiEn5nuMcy7qvURD65zZT9GEeJs4Qu9YKeAxfLG+gCGAoOw1D5WUFXl4yUQ
        82dW1WXP7cuZ4bj917s42u/3VVe9vHg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 7/7] MIPS: ingenic: RS90: Added defconfig
Date:   Tue, 23 Jun 2020 20:24:32 +0200
Message-Id: <20200623182432.187843-7-paul@crapouillou.net>
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a basic default config for the RS-90 RetroMini board.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/configs/rs90_defconfig | 182 +++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 arch/mips/configs/rs90_defconfig

diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
new file mode 100644
index 000000000000..433ac5c0266a
--- /dev/null
+++ b/arch/mips/configs/rs90_defconfig
@@ -0,0 +1,182 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_DEFAULT_HOSTNAME="rs90"
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
+# CONFIG_SGETMASK_SYSCALL is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_ELF_CORE is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_EMBEDDED=y
+# CONFIG_PERF_EVENTS is not set
+CONFIG_SLAB=y
+CONFIG_PROFILING=y
+CONFIG_MACH_INGENIC=y
+CONFIG_JZ4740_RS90=y
+CONFIG_PAGE_SIZE_16KB=y
+CONFIG_HZ_100=y
+# CONFIG_SECCOMP is not set
+CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_OPROFILE=y
+CONFIG_JUMP_LABEL=y
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_FRONTSWAP=y
+CONFIG_CMA=y
+CONFIG_ZSMALLOC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
+# CONFIG_INET_DIAG is not set
+CONFIG_TCP_CONG_ADVANCED=y
+# CONFIG_TCP_CONG_BIC is not set
+# CONFIG_TCP_CONG_CUBIC is not set
+# CONFIG_TCP_CONG_HTCP is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_JZ4780=y
+CONFIG_MTD_NAND_JZ4725B_BCH=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_FASTMAP=y
+CONFIG_ZRAM=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_ADC=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_LEGACY_PTY_COUNT=2
+# CONFIG_DEVMEM is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_I2C_COMPAT is not set
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_BATTERY_INGENIC=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
+CONFIG_JZ4740_WDT=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_DRM=y
+CONFIG_DRM_FBDEV_OVERALLOC=300
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_INGENIC=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_PCM_TIMER is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_PROC_FS is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_MIPS is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_JZ4740_SOC_I2S=y
+CONFIG_SND_SOC_JZ4725B_CODEC=y
+CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
+CONFIG_SND_SIMPLE_CARD=y
+# CONFIG_HID is not set
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_JZ4740=y
+CONFIG_USB_INVENTRA_DMA=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VBUS_DRAW=500
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_ECM_SUBSET=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_JZ4740=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_HCTOSYS is not set
+# CONFIG_RTC_SYSTOHC is not set
+# CONFIG_RTC_NVMEM is not set
+# CONFIG_RTC_INTF_PROC is not set
+CONFIG_RTC_DRV_JZ4740=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_JZ4780=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_MIPS_PLATFORM_DEVICES is not set
+CONFIG_INGENIC_OST=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_MEMORY=y
+CONFIG_IIO=y
+CONFIG_INGENIC_ADC=y
+CONFIG_IIO_RESCALE=y
+CONFIG_PWM=y
+CONFIG_PWM_JZ4740=y
+# CONFIG_NVMEM is not set
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+# CONFIG_UBIFS_FS_ZSTD is not set
+# CONFIG_UBIFS_FS_XATTR is not set
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_FILE_DIRECT=y
+CONFIG_SQUASHFS_DECOMP_MULTI=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_FONTS=y
+CONFIG_FONT_6x10=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+CONFIG_STRIP_ASM_SYMS=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+# CONFIG_DEBUG_MISC is not set
+CONFIG_PANIC_ON_OOPS=y
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.27.0

