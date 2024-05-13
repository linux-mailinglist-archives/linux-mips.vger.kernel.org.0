Return-Path: <linux-mips+bounces-3258-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D44038C46E7
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613E71F21996
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F1737153;
	Mon, 13 May 2024 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bUMjOVnS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0363D3B8;
	Mon, 13 May 2024 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625290; cv=none; b=P7MgV3/DQE0wKgxP7MD2FbzEmNHx4j61DbnE6murE2ZN6S3AshL+2wdvRjB7R/3B67QLq9l0ooGUb/ADci52nL8zd64vrHP6fXV8XfkOipsolyDYN32tp2vExrTrwooSU902sg8vwGS+ejGy+lXcV83X+o8UHfYaA0L18w7JkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625290; c=relaxed/simple;
	bh=lWp3qSP9yeWeEVRrF736edtP5bAdugOS1ziOGLFtlso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWNXQbLmEbTw0HwtDFeB/gbqzjgk6iodVMj4o+6ajQ45rbPBDPfXEaA/NQ1DvTbZU9ykt4ArucuzLohM1eB+8XFSSN9oY53Dw8/Soz9kl38zY8ItMWwGTPN4nwyGzrBNgNZqx/JAkfPdPEN8balT38y1Ngi7Kzni5wnTKZKNJ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bUMjOVnS; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42FEAC0002;
	Mon, 13 May 2024 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715625284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15TaJhhVE39xtbVy6DL0G5qguHdHmLrumCWfn8eUaIA=;
	b=bUMjOVnSosl1+o2wPXU8AfizTsnbHdUN1HOosaMjl9o2/DlesrG03+rvJ2ykpRkqnaCd2h
	pi3utVbne0op7m5sITWVSuv5QGHX9VpmQfcSCGvjNzt3HAvYOpkoRPC99z+4zhaIk4xz/t
	WuV8LjVEt/vaLXhXUswcOqTEo6GRYKRLuQV+McTssWvojroqffniqX//R99YUzHOYjK5sa
	Ic1T+6mKcz7l2PaiZDsaY3r28GbLvWBBMCdsdEPXGKbcfAF8FG9NK8QjgacCNGMRgOJyn1
	QBK4/tEq/yyevEvjBoxh2lUkgOo0LOF4F/u8ce3zHlAOiVnP93Np88oaiFFxSA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 13 May 2024 20:34:17 +0200
Subject: [PATCH v2 3/3] MIPS: mobileye: Add EyeQ6H support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240513-eyeq6h-v2-3-ae8c1974b52b@bootlin.com>
References: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
In-Reply-To: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8811;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=lWp3qSP9yeWeEVRrF736edtP5bAdugOS1ziOGLFtlso=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5pTrL3TovnHLdXWOZ83kGLcIRQVNuNV9+zUt6/91Hl23
 4x1TdnREcvCIMjEICumyCKxsuCMeLm+xza75uswc1iZQIYwcHEKwEQ2pTHM9z3U6azbfzGTyevJ
 24leCgU1QtmZDPMjktdvNNS+vuLxtKmLHzv95w+aKd0OAA==
X-Developer-Key: i=gregory.clement@bootlin.com; a=openpgp;
 fpr=18A970CC17772F48B63E83D70B06188E14723BD5
X-GND-Sasl: gregory.clement@bootlin.com

EyeQ6H (or “High”) is an other SoC from Mobileye still based on the
MIPS I6500 architecture as the EyeQ5. The 2 clusters of this SoC
contains 4 cores which are capable of running 4 threads. Besides this,
it features multiple controllers such as the classic UART, high speed
I2C, SPI, as well as CAN-FD, PCIe Gen4, Octal/Quad SPI Flash
interface, Gigabit Ethernet, MIPI CSI-2, MIPI DSI, and eMMC 5.1. It
also includes a Hardware Security Module, Functional Safety Hardware,
and video encoders and more.

This commit provides the infrastructure to build a kernel running on
EyeQ6H SoC. For now the support is limited and only one CPU core is
running.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kbuild.platforms           |   2 +-
 arch/mips/Kconfig                    |   7 ++-
 arch/mips/boot/dts/Makefile          |   2 +-
 arch/mips/boot/dts/mobileye/Makefile |   1 +
 arch/mips/configs/eyeq5_defconfig    |   1 +
 arch/mips/configs/eyeq6_defconfig    | 111 +++++++++++++++++++++++++++++++++++
 arch/mips/mobileye/Kconfig           |  26 ++++++++
 arch/mips/mobileye/Platform          |   1 +
 8 files changed, 146 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 5c145b67d3bf..bca37ddf974b 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -8,6 +8,7 @@ platform-$(CONFIG_BCM47XX)		+= bcm47xx/
 platform-$(CONFIG_BCM63XX)		+= bcm63xx/
 platform-$(CONFIG_BMIPS_GENERIC)	+= bmips/
 platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
+platform-$(CONFIG_EYEQ)			+= mobileye/
 platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
 platform-$(CONFIG_MACH_DECSTATION)	+= dec/
 platform-$(CONFIG_MIPS_GENERIC)		+= generic/
@@ -17,7 +18,6 @@ platform-$(CONFIG_MACH_LOONGSON2EF)	+= loongson2ef/
 platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
 platform-$(CONFIG_MACH_LOONGSON64)	+= loongson64/
 platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
-platform-$(CONFIG_MACH_EYEQ5)		+= mobileye/
 platform-$(CONFIG_MACH_NINTENDO64)	+= n64/
 platform-$(CONFIG_PIC32MZDA)		+= pic32/
 platform-$(CONFIG_RALINK)		+= ralink/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 516dc7022bd7..ac330b135346 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -575,8 +575,8 @@ config MACH_PIC32
 	  Microchip PIC32 is a family of general-purpose 32 bit MIPS core
 	  microcontrollers.
 
-config MACH_EYEQ5
-	bool "Mobileye EyeQ5 SoC"
+config EYEQ
+	bool "Mobileye EyeQ SoC"
 	select MACH_GENERIC_CORE
 	select ARM_AMBA
 	select PHYSICAL_START_BOOL
@@ -615,7 +615,7 @@ config MACH_EYEQ5
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
 	help
-	  Select this to build a kernel supporting EyeQ5 SoC from Mobileye.
+	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 
 	bool
 
@@ -1021,6 +1021,7 @@ source "arch/mips/generic/Kconfig"
 source "arch/mips/ingenic/Kconfig"
 source "arch/mips/jazz/Kconfig"
 source "arch/mips/lantiq/Kconfig"
+source "arch/mips/mobileye/Kconfig"
 source "arch/mips/pic32/Kconfig"
 source "arch/mips/ralink/Kconfig"
 source "arch/mips/sgi-ip27/Kconfig"
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index efff87cb33a9..e2476b12bb0c 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
+subdir-$(CONFIG_EYEQ)			+= mobileye
 subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
@@ -8,7 +9,6 @@ subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
 subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
-subdir-$(CONFIG_MACH_EYEQ5)		+= mobileye
 subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
 subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
 subdir-$(CONFIG_MACH_PIC32)		+= pic32
diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
index 01c01c3aad81..7cc89968aaac 100644
--- a/arch/mips/boot/dts/mobileye/Makefile
+++ b/arch/mips/boot/dts/mobileye/Makefile
@@ -2,3 +2,4 @@
 # Copyright 2023 Mobileye Vision Technologies Ltd.
 
 dtb-$(CONFIG_MACH_EYEQ5)		+= eyeq5-epm5.dtb
+dtb-$(CONFIG_MACH_EYEQ6H)		+= eyeq6h-epm6.dtb
diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index c35c29a4d479..84e26ef2e3a0 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -19,6 +19,7 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
+CONFIG_EYEQ=y
 CONFIG_MACH_EYEQ5=y
 CONFIG_FIT_IMAGE_FDT_EPM5=y
 CONFIG_PAGE_SIZE_16KB=y
diff --git a/arch/mips/configs/eyeq6_defconfig b/arch/mips/configs/eyeq6_defconfig
new file mode 100644
index 000000000000..6597d5e88b33
--- /dev/null
+++ b/arch/mips/configs/eyeq6_defconfig
@@ -0,0 +1,111 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_TASKSTATS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_RT_GROUP_SCHED=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_EYEQ=y
+CONFIG_MACH_EYEQ6H=y
+CONFIG_MIPS_CPS=y
+CONFIG_CPU_HAS_MSA=y
+CONFIG_NR_CPUS=16
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+CONFIG_JUMP_LABEL=y
+CONFIG_PAGE_SIZE_16KB=y
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SPARSEMEM_MANUAL=y
+CONFIG_USERFAULTFD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_NETFILTER=y
+CONFIG_CAN=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_DEBUG=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_CONNECTOR=y
+CONFIG_MTD=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_SCSI=y
+CONFIG_NETDEVICES=y
+CONFIG_MACVLAN=y
+CONFIG_IPVLAN=y
+CONFIG_MACB=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_CAN_M_CAN=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_MFD_SYSCON=y
+CONFIG_HID_A4TECH=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_CONTROLLER=y
+# CONFIG_NVMEM is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_FS_ENCRYPTION=y
+CONFIG_FUSE_FS=y
+CONFIG_CUSE=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UBIFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_CRYPTO_CRC32_MIPS=y
+CONFIG_FRAME_WARN=1024
+CONFIG_DEBUG_FS=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon"
diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
new file mode 100644
index 000000000000..f9abb2d6e178
--- /dev/null
+++ b/arch/mips/mobileye/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+if EYEQ
+
+choice
+	prompt "Mobileye EyeQ SoC selection"
+	default MACH_EYEQ5
+	help
+	  Select Mobileye EyeQ MIPS SoC type.
+
+	config MACH_EYEQ5
+		bool "Mobileye EyeQ5 SoC"
+
+	config MACH_EYEQ6H
+		bool "Mobileye EyeQ6H SoC"
+endchoice
+
+config FIT_IMAGE_FDT_EPM5
+	bool "Include FDT for Mobileye EyeQ5 development platforms"
+	depends on MACH_EYEQ5
+	default n
+	help
+	  Enable this to include the FDT for the EyeQ5 development platforms
+	  from Mobileye in the FIT kernel image.
+	  This requires u-boot on the platform.
+
+endif
diff --git a/arch/mips/mobileye/Platform b/arch/mips/mobileye/Platform
index c69f811dd13a..69f775bbbb1e 100644
--- a/arch/mips/mobileye/Platform
+++ b/arch/mips/mobileye/Platform
@@ -9,6 +9,7 @@
 #
 
 load-$(CONFIG_MACH_EYEQ5)	= 0xa800000808000000
+load-$(CONFIG_MACH_EYEQ6H)	= 0xa800000100800000
 all-$(CONFIG_MACH_EYEQ5)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S

-- 
2.43.0


