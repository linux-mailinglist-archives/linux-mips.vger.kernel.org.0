Return-Path: <linux-mips+bounces-9694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF8AFE708
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CE53B5852
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8732328ECC0;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ518iuc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1128DF41;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=ngorWdaqLq+LXc78ydftbiEV+ki/lkXJ7ThdOELDkiU1ttH4R4pILtPXaQ4uLcW8HbklA8pXTkjyrEY9y39ajrLdtOs063Hr4cTD3my4kn3oGDTVuUSGglDFPr2G3K83cg0b2WYhKeqBfmCsalX/BNg/f5LS3J5wxmCTWMxPYoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=YezpPpr9MkIy8MdAiZQpsV+wych1Eokmh7cdGM1/b9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTuhaOM+bP29zeZdqTv3HnU0vaeIyzv3/LW7RJL3gnM+DCVyaLd8iFyOKaz48Ni8k4C4J+aSIeGxeY8XZG+JhZbSKWakDMrD6eofcymTkpd7lHfUPfawMzVVezoLXuu7yTcMQI9DFNejOAYNB30hoBO2hFQU8VDU28k/jRiXb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ518iuc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 114BFC19425;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059248;
	bh=YezpPpr9MkIy8MdAiZQpsV+wych1Eokmh7cdGM1/b9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fQ518iuccBMTml/aNL8P0y9g+Uil6Ri//kBjTVnmEgKlFFfSVr7pRl2Ky/LuAYYbD
	 Cy6n41d/YMzpeKyfUxwT0e95233avUeQekugGWGdliPhKkzdi5cgWqLLOEdxG+RRqc
	 Ns6G9RmxPjKwDMh7MjyK93GTCfYxYVANfaU2iw6Ni+ARncsqymJrqvv7SLNjeO7UCA
	 7Z5ptAR1ruhbBmSrMrQYlnJfra0c3m9WIQSyICxIhl5+i5Ag81/uPMat43T5CR1St6
	 tVjgDFinVgGW0uJeH3Z541TwK1Xb3QjAjhPJQfjCJs+cBjh/LSeprV8z3zFANA1Xdu
	 tmCs4c3alFRHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07004C83F0A;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:06:00 +0800
Subject: [PATCH v2 9/9] MIPS: configs: Consolidate Loongson1 defconfigs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-loongson1-arch-v2-9-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=10713;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=vXaIa8N3GToUGpAmk80FkzsQAYrU6OjHna1ZLvsKN7s=;
 b=gZLj5Lic2lnAk8QI1LEquid689ED367epMJXPyv/mDNt7JJeIVbJh5ZmOY1zqN+wGj5ucDtt7
 R4xd2+YyA1PAd9z3DHvZnwuGI+xiOsyKaaoc+sKsIFkDaB8/qCTASWk
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Unify loongson{1b,1c}_defconfig into a single loongson1_defconfig.

Enable the following options by default:
 - CONFIG_SERIAL_OF_PLATFORM
 - CONFIG_RTC_DRV_LOONGSON
 - CONFIG_LOONGSON1_APB_DMA
 - CONFIG_MTD_NAND_LOONGSON1
 - CONFIG_SND_LOONGSON1_AC97

Also disable unnecessary options.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 MAINTAINERS                                        |   1 +
 .../{loongson1b_defconfig => loongson1_defconfig}  |  94 +++++++++++++---
 arch/mips/configs/loongson1c_defconfig             | 121 ---------------------
 3 files changed, 78 insertions(+), 138 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d42a83656879..c73e25af147c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16684,6 +16684,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/boot/dts/loongson/loongson1*
+F:	arch/mips/configs/loongson1_defconfig
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
diff --git a/arch/mips/configs/loongson1b_defconfig b/arch/mips/configs/loongson1_defconfig
similarity index 51%
rename from arch/mips/configs/loongson1b_defconfig
rename to arch/mips/configs/loongson1_defconfig
index 68207b31dc20..81acae6f61c8 100644
--- a/arch/mips/configs/loongson1b_defconfig
+++ b/arch/mips/configs/loongson1_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -12,15 +11,16 @@ CONFIG_NAMESPACES=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_MACH_LOONGSON32=y
-# CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -31,6 +31,7 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
+# CONFIG_ETHTOOL_NETLINK is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_STANDALONE is not set
@@ -38,32 +39,75 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_LOONGSON1=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_SCSI=m
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=m
+# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_ASIX is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_DAVICOM is not set
+# CONFIG_NET_VENDOR_ENGLEDER is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_FUNGIBLE is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HISILICON is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
 # CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_LITEX is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_META is not set
 # CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_MICROSOFT is not set
+# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
 # CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
 CONFIG_STMMAC_ETH=y
+# CONFIG_DWMAC_GENERIC is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_VERTEXCOM is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WANGXUN is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+CONFIG_DAVICOM_PHY=y
+CONFIG_REALTEK_PHY=y
+# CONFIG_USB_NET_DRIVERS is not set
 # CONFIG_WLAN is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT_CONSOLE is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_LEGACY_PTY_COUNT=8
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
+# CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_LOONGSON1=y
 # CONFIG_HWMON is not set
@@ -71,7 +115,15 @@ CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_NOWAYOUT=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_LOONGSON1_WDT=y
-# CONFIG_VGA_CONSOLE is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_MIPS is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_LOONGSON1_AC97=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_HID_GENERIC=m
 CONFIG_USB_HID=m
 CONFIG_USB=y
@@ -86,17 +138,20 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_MTD=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_LOONGSON1=y
+# CONFIG_RTC_NVMEM is not set
+CONFIG_RTC_DRV_LOONGSON=y
+CONFIG_DMADEVICES=y
+CONFIG_LOONGSON1_APB_DMA=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_MIPS_PLATFORM_DEVICES is not set
 # CONFIG_IOMMU_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_NVMEM is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 # CONFIG_DNOTIFY is not set
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
@@ -105,16 +160,21 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_UBIFS_FS=y
 CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_UBIFS_ATIME_SUPPORT=y
+# CONFIG_UBIFS_FS_SECURITY is not set
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
-# CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_POWERPC is not set
+# CONFIG_XZ_DEC_ARM is not set
+# CONFIG_XZ_DEC_ARMTHUMB is not set
+# CONFIG_XZ_DEC_ARM64 is not set
+# CONFIG_XZ_DEC_SPARC is not set
+# CONFIG_XZ_DEC_RISCV is not set
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_FS=y
+# CONFIG_DEBUG_MISC is not set
 CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 # CONFIG_EARLY_PRINTK is not set
diff --git a/arch/mips/configs/loongson1c_defconfig b/arch/mips/configs/loongson1c_defconfig
deleted file mode 100644
index c3910a9dee9e..000000000000
--- a/arch/mips/configs/loongson1c_defconfig
+++ /dev/null
@@ -1,121 +0,0 @@
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_KERNEL_XZ=y
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_NAMESPACES=y
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_EXPERT=y
-CONFIG_PERF_EVENTS=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_MACH_LOONGSON32=y
-CONFIG_LOONGSON1_LS1C=y
-# CONFIG_SECCOMP is not set
-# CONFIG_SUSPEND is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-# CONFIG_BLK_DEV_BSG is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_STANDALONE is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_UBI=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_SCSI=m
-# CONFIG_SCSI_PROC_FS is not set
-CONFIG_BLK_DEV_SD=m
-# CONFIG_SCSI_LOWLEVEL is not set
-CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=y
-# CONFIG_NET_VENDOR_WIZNET is not set
-# CONFIG_WLAN is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_LEGACY_PTY_COUNT=8
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_LOONGSON1=y
-# CONFIG_HWMON is not set
-CONFIG_WATCHDOG=y
-CONFIG_WATCHDOG_NOWAYOUT=y
-CONFIG_WATCHDOG_SYSFS=y
-CONFIG_LOONGSON1_WDT=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_HID_GENERIC=m
-CONFIG_USB_HID=m
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_EHCI_HCD=y
-# CONFIG_USB_EHCI_TT_NEWSCHED is not set
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_STORAGE=m
-CONFIG_USB_SERIAL=m
-CONFIG_USB_SERIAL_PL2303=m
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_LOONGSON1=y
-# CONFIG_IOMMU_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_DNOTIFY is not set
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_UBIFS_FS=y
-CONFIG_UBIFS_FS_ADVANCED_COMPR=y
-CONFIG_UBIFS_ATIME_SUPPORT=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_ISO8859_1=m
-# CONFIG_CRYPTO_ECHAINIV is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
-# CONFIG_FTRACE is not set
-# CONFIG_EARLY_PRINTK is not set

-- 
2.43.0



