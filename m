Return-Path: <linux-mips+bounces-12509-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F7CC7EC7
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB2FD3016C6F
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B180935C186;
	Wed, 17 Dec 2025 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1zVS5GxA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44133587D6;
	Wed, 17 Dec 2025 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978601; cv=none; b=fnPJ8sy08tTeClkP28krI2AomKAWU9w2CVy0vPCFtBLM21Wl1G9hdpHI+760ZaHTR8Dspk6hIRkNn5O6fKWAvdkWqN+X24xSPhIw3p2Pr6fKOzoRyXLqKmOAtrgKjQoPePq0KZgFQqIndxtDCIVDJByQju0KswjPOOoWgQoiUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978601; c=relaxed/simple;
	bh=aEGZB9dbzCDIkpskD+RbNa9/u8hFNPvaVZr+hfUUYhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=quSnskl56ZzCP9Rv2jrdo06Ixz+3TG8KIwE1UpBCE7Tqi0BowM8n5HrCs6KXM14+Wav2lQ2GQXSqtR2wAAmp4BIVQynHS/vy/vKEp/RIp5rF8ytWzNc8g1QV1XOnCjJYWt4NHlRh1M3PoWFHS7Duvnm6FPT5O+I8gWNEa5Kwyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1zVS5GxA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A59264E41C60;
	Wed, 17 Dec 2025 13:36:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A4D86072F;
	Wed, 17 Dec 2025 13:36:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23E3E102F0ACF;
	Wed, 17 Dec 2025 14:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p2gTeNSYVX7Yiw3WAxs+iLX7qDNvKdngDfWHsbEhhP8=;
	b=1zVS5GxAJOrE7KYss+uFJtHA4a5+n4RheiXsKHyxd4qUwLgoc49PHts0Ch2a3c1SoFXC/a
	CgdD5dkBlTf4gcWQV9/iQ8u4bikDCQ8tQiEg9QEbhXiZCLfyAar/edAmpYYRy4M/ldcxVA
	++m0RGtopjmVSwggLXSHlbSBLIz7zd0er+5rjFej7c6qtC8/1htgBI86ic+oMaroy+iCwh
	Ts9j4rIFlUsG4V/+UFneM2siv4JW+dUOLZO4goL7lLNE19vVg1Ju/iyR54u8+KcWC7b1kl
	+bFf4nxhhOpsLsyJe3XQJ8jJl1hSAeo9c1oXcEasmFyjMwONDqIH9BzWALnWtA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:36:02 +0100
Subject: [PATCH 12/13] MIPS: config: add eyeq6lplus_defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-12-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add a default configuration for Mobileye EyeQ6Lplus evaluation board.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/configs/eyeq6lplus_defconfig | 119 +++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/mips/configs/eyeq6lplus_defconfig b/arch/mips/configs/eyeq6lplus_defconfig
new file mode 100644
index 000000000000..dc54c3fd1b8a
--- /dev/null
+++ b/arch/mips/configs/eyeq6lplus_defconfig
@@ -0,0 +1,119 @@
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
+CONFIG_MACH_EYEQ6LPLUS=y
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
+CONFIG_MTD_SPI_NAND=y
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
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_SPI=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_SPI_SLAVE=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_DWAPB=y
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
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_CADENCE=y
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
+CONFIG_FRAME_WARN=1024
+CONFIG_DEBUG_FS=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set

-- 
2.52.0


