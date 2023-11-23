Return-Path: <linux-mips+bounces-238-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3717F62ED
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30E2CB214B4
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 15:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209E43B2B0;
	Thu, 23 Nov 2023 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jeKgKp9I"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825361730;
	Thu, 23 Nov 2023 07:27:14 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D530E60010;
	Thu, 23 Nov 2023 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Yyo/N4mKC4G/gBxTIkTwVlDYBPjrl8CA2tLzZW3Lhs=;
	b=jeKgKp9I2HTXFR7yHCQXHvIsIk3PNdRiYbKP2xCJzujuVtAQqtBRv1TCKH3fme0oIOhBb9
	QtxZoHNZaN6Db4QzX4LSR4howSKqAQHPH+T6cWuO5V0TRI17pb4kNyOc1zIpSR/arT2rBF
	nzfu4wxYPE0MhuWRWaU53XAaYoNZ5YvD7MkCw8rIMitLBm48oLEcw2pg1jHiIMU/xyel7B
	Jfp2AG9zCpl1ZRsCwTz657plTqnDRjyoE8y8SzXQw1VyANrWcklCoxCU9f7nMB087Z6yAT
	Pq0jWt4X2bGKhGGzyOhiqLTO2bkYPi3IKpTcwH1NFvqAKmXRbjmsZkCtJIsVjQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 20/21] MIPS: generic: Add support for Mobileye EyeQ5
Date: Thu, 23 Nov 2023 16:26:37 +0100
Message-ID: <20231123152639.561231-21-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123152639.561231-1-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Introduce support for the MIPS based Mobileye EyeQ5 SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/configs/generic/board-eyeq5.config | 43 ++++++++++++++++++++
 arch/mips/generic/Kconfig                    | 15 +++++++
 arch/mips/generic/Platform                   |  2 +
 arch/mips/generic/board-epm5.its.S           | 24 +++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 arch/mips/configs/generic/board-eyeq5.config
 create mode 100644 arch/mips/generic/board-epm5.its.S

diff --git a/arch/mips/configs/generic/board-eyeq5.config b/arch/mips/configs/generic/board-eyeq5.config
new file mode 100644
index 0000000000000..d5109fda6e821
--- /dev/null
+++ b/arch/mips/configs/generic/board-eyeq5.config
@@ -0,0 +1,43 @@
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_FIT_IMAGE_FDT_EPM5=y
+CONFIG_BOARD_EYEQ5=y
+CONFIG_USE_XKPHYS=y
+CONFIG_PHYSICAL_START=0xa800000808000000
+CONFIG_ZBOOT_LOAD_ADDRESS=0xA800000080480000
+CONFIG_CPU_HAS_MSA=y
+CONFIG_NET_KEY=y
+CONFIG_CAN=y
+CONFIG_PCI=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_DEBUG=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_CONNECTOR=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_BLOCK2MTD=y
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_BLOCK=y
+CONFIG_NETDEVICES=y
+CONFIG_MACVLAN=y
+CONFIG_IPVLAN=y
+CONFIG_MACB=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_CAN_M_CAN=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_PINCTRL=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_FANOTIFY=y
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_BOTH=y
+CONFIG_PAGE_SIZE_16KB=y
\ No newline at end of file
diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 7dc5b3821cc6e..04e1fc6f789b5 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -48,6 +48,13 @@ config SOC_VCOREIII
 config MSCC_OCELOT
 	bool
 
+config SOC_EYEQ5
+	select ARM_AMBA
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
+	select PHYSICAL_START_BOOL
+	bool
+
 comment "FIT/UHI Boards"
 
 config FIT_IMAGE_FDT_BOSTON
@@ -124,4 +131,12 @@ config VIRT_BOARD_RANCHU
 	  Android emulator. Android emulator is based on Qemu, and contains
 	  the support for the same set of virtual devices.
 
+config FIT_IMAGE_FDT_EPM5
+	bool "Include FDT for Mobileye EyeQ5 development platforms"
+	select SOC_EYEQ5
+	default n
+	help
+	  Enable this to include the FDT for the EyeQ5 development platforms
+	  from Mobileye in the FIT kernel image.
+	  This requires u-boot on the platform.
 endif
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f38970..45db9824a11d6 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -24,3 +24,5 @@ its-$(CONFIG_FIT_IMAGE_FDT_JAGUAR2)	+= board-jaguar2.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_SERVAL)	+= board-serval.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= board-xilfpga.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_MARDUK)	+= board-marduk.its.S
+its-$(CONFIG_FIT_IMAGE_FDT_EPM5)	+= board-epm5.its.S
+
diff --git a/arch/mips/generic/board-epm5.its.S b/arch/mips/generic/board-epm5.its.S
new file mode 100644
index 0000000000000..08e8c4f183d63
--- /dev/null
+++ b/arch/mips/generic/board-epm5.its.S
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/ {
+	images {
+		fdt-mobileye-epm5 {
+			description = "Mobileeye MP5 Device Tree";
+			data = /incbin/("boot/dts/mobileye/eyeq5-epm5.dtb");
+			type = "flat_dt";
+			arch = "mips";
+			compression = "none";
+			hash {
+				algo = "sha1";
+			};
+		};
+	};
+
+    configurations {
+		default = "conf-1";
+		conf-1 {
+			description = "Mobileye EPM5 Linux kernel";
+			kernel = "kernel";
+			fdt = "fdt-mobileye-epm5";
+		};
+	};
+};
-- 
2.42.0


