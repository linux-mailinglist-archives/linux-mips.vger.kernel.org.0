Return-Path: <linux-mips+bounces-700-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F89B80F305
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 17:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3E71C20D36
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8467F78E63;
	Tue, 12 Dec 2023 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bl13/Lkl"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1435610B;
	Tue, 12 Dec 2023 08:35:35 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 876196000A;
	Tue, 12 Dec 2023 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbVhFI1ZSGx1syULTaPHmMoUG7Z8rPeb2O8T42Bf6J0=;
	b=Bl13/LklFdMlZCq+xi34hEBNI5XOCfoKecmZRoJXC0V5Zv+kC/4dg46+mSjU8SyCDtxHVz
	Z7RK4V2/JNx2nRT0EL69glSn0cYryHwTptJOcVKlVCyJzhLqqo4U4+JmVXuWVsGUtrQuVi
	9D7SJCJwZ1QYsYP8A93mIk3ZkHzyu9B1aE77yRtuVtOJA9zxh10NXzRBGfylvxOLOq9VNA
	BDNOmIlYgacBoH0iwJZiYQXz4GH4Ls/oko06JFt7cnSIACm7/KhBs89msQTT70im/Zb40V
	gj42J1SlWOdHfbKofcofYWordNIeTKdJLtBJlJ+bCaDUixbNyAugpGF9U0XBMA==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 12/22] MIPS: Get rid of CONFIG_NO_EXCEPT_FILL
Date: Tue, 12 Dec 2023 17:34:44 +0100
Message-ID: <20231212163459.1923041-13-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212163459.1923041-1-gregory.clement@bootlin.com>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

NO_EXCEPT_FILL is employed to signal the platform that there is no
requirement to reserve EBASE memory at the beginning of the kernel.

This holds true for all R2+ platforms, as they dynamically allocate
ebase memory. It is also applicable to any platform that doesn't load
the kernel at the start of physical memory.

Eliminate this Kconfig symbol by employing a macro to identify the
mentioned conditions.

gc: use KSEG0 only for 32 bit configuration
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig       | 8 --------
 arch/mips/kernel/head.S | 7 +++++--
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 518376d578b70..59bc956859292 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -150,7 +150,6 @@ config MIPS_GENERIC_KERNEL
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
 	select MIPS_L1_CACHE_SHIFT_7
-	select NO_EXCEPT_FILL
 	select PCI_DRIVERS_GENERIC
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
@@ -244,7 +243,6 @@ config BMIPS_GENERIC
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select BOOT_RAW
-	select NO_EXCEPT_FILL
 	select USE_OF
 	select CEVT_R4K
 	select CSRC_R4K
@@ -288,7 +286,6 @@ config BCM47XX
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select SYS_HAS_CPU_MIPS32_R1
-	select NO_EXCEPT_FILL
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_MIPS16
@@ -424,7 +421,6 @@ config LANTIQ
 	select IRQ_MIPS_CPU
 	select CEVT_R4K
 	select CSRC_R4K
-	select NO_EXCEPT_FILL
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_BIG_ENDIAN
@@ -474,7 +470,6 @@ config MACH_LOONGSON64
 	select ISA
 	select I8259
 	select IRQ_MIPS_CPU
-	select NO_EXCEPT_FILL
 	select NR_CPUS_DEFAULT_64
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select PCI_DRIVERS_GENERIC
@@ -1157,9 +1152,6 @@ config PCI_GT64XXX_PCI0
 config PCI_XTALK_BRIDGE
 	bool
 
-config NO_EXCEPT_FILL
-	bool
-
 config MIPS_SPRAM
 	bool
 
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index b825ed4476c70..51a0ad49ac388 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -59,10 +59,13 @@
 #endif
 	.endm
 
-#ifndef CONFIG_NO_EXCEPT_FILL
+#if (MIPS_ISA_REV < 2) &&					     \
+    ((!defined( CONFIG_64BIT) && (VMLINUX_LOAD_ADDRESS == KSEG0)) || \
+    (VMLINUX_LOAD_ADDRESS == CKSEG0))
 	/*
 	 * Reserved space for exception handlers.
-	 * Necessary for machines which link their kernels at KSEG0.
+	 * Necessary for machines which link their kernels at KSEG0
+	 * and incapable of moving ebase.
 	 */
 	.fill	0x400
 #endif
-- 
2.42.0


