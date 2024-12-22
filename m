Return-Path: <linux-mips+bounces-7139-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A31A19FA2FC
	for <lists+linux-mips@lfdr.de>; Sun, 22 Dec 2024 01:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD34A188A694
	for <lists+linux-mips@lfdr.de>; Sun, 22 Dec 2024 00:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC31372;
	Sun, 22 Dec 2024 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tibXnB7M"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0710F7;
	Sun, 22 Dec 2024 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734825870; cv=none; b=oOQT2wlY6r28CGLADiMMTnEQDOuagj5MAD1bsIUo/a4mYvOlrKOUxnpyrdHDGo+xrSbmLQWkinXar9X2ICvFCOgYZA50eaB+mnvyTVdukf7LdReai9HsDvoP4G3dZFAMXaNOr2wpEj27By9G40MggQsAdinqkdJn5UJ/1Xw9pA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734825870; c=relaxed/simple;
	bh=Y3o2XvVQ4GtYROoCvyNl10HrUHrowKjJsiLdrAdU1mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwRoup6TdfaXEBGcfom4oGP2XZbZVECpfCe+/nbc+Jk/KUBT4Mu+SlLPIbtDDA26G7fyvywQm0Y00vSLUd6nxwrBIRrCbdANvY+FfY6mZKm1xPBHtib9PRRGnxUhahRQXbebB9T7nV9RaxEB3dZO98SCeX/1VqVqA5umoHj2Ne8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tibXnB7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD621C4CECE;
	Sun, 22 Dec 2024 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734825870;
	bh=Y3o2XvVQ4GtYROoCvyNl10HrUHrowKjJsiLdrAdU1mA=;
	h=From:To:Cc:Subject:Date:From;
	b=tibXnB7MTt7ZLcDp6I4t6NpX9Ncmz1uhpREqn7cfODgyOuSTZpg9m07svSXPO2zs8
	 JNYWQo64OdJGUv/Uy3M3RIto5RmsfCWCS+pgaVmmxsLUy58ej0I9k6K5sZryWWSryD
	 rW4wvLeuDldqCld1g3OTzYQRRNq6m3mK80M5ofNA7EI5r74iW7b8oFN8Trw70uZR/5
	 RSVN3SqKVhnyGUPyr16+oHyWuPuxHZdOxFr8cgnwSmKqvf9b8v3u/XBjx74bgLcyjo
	 nGKpmil+vGYXSrX26qgM1+iKghjufD7NbDN6+r8HFTe4SPCCvbZLdgkHURTQFIK+O7
	 RlZVJD4Ubr0bg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com,
	devicetree@vger.kernel.org
Subject: [PATCH] MIPS: migrate to generic rule for built-in DTBs
Date: Sun, 22 Dec 2024 09:04:13 +0900
Message-ID: <20241222000416.2577633-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
DTBs") introduced generic support for built-in DTBs.

Select GENERIC_BUILTIN_DTB and BUILTIN_DTB_ALL when the built-in DTB
support is enabled.

DTBs compiled under arch/mips/boot/dts/ will be wrapped by the generic
rule in scripts/Makefile.vmlinux.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/Kconfig                         | 2 ++
 arch/mips/Makefile                        | 3 ---
 arch/mips/boot/dts/Makefile               | 2 --
 arch/mips/boot/dts/brcm/Makefile          | 2 --
 arch/mips/boot/dts/cavium-octeon/Makefile | 2 --
 arch/mips/boot/dts/ingenic/Makefile       | 2 --
 arch/mips/boot/dts/lantiq/Makefile        | 2 --
 arch/mips/boot/dts/loongson/Makefile      | 2 --
 arch/mips/boot/dts/mscc/Makefile          | 3 ---
 arch/mips/boot/dts/mti/Makefile           | 2 --
 arch/mips/boot/dts/pic32/Makefile         | 2 --
 arch/mips/boot/dts/ralink/Makefile        | 2 --
 12 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 467b10f4361a..021656d6831b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -29,10 +29,12 @@ config MIPS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select BUILDTIME_TABLE_SORT
+	select BUILTIN_DTB_ALL if BUILTIN_DTB
 	select CLONE_BACKWARDS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE || SUSPEND
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_BUILTIN_DTB if BUILTIN_DTB
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 5785a3d5ccfb..be8cb44a89fd 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -423,9 +423,6 @@ endif
 
 CLEAN_FILES += vmlinux.32 vmlinux.64
 
-# device-trees
-core-y += arch/mips/boot/dts/
-
 archprepare:
 ifdef CONFIG_MIPS32_N32
 	@$(kecho) '  Checking missing-syscalls for N32'
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index e2476b12bb0c..ff468439a8c4 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -16,5 +16,3 @@ subdir-$(CONFIG_ATH79)			+= qca
 subdir-$(CONFIG_RALINK)			+= ralink
 subdir-$(CONFIG_MACH_REALTEK_RTL)	+= realtek
 subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
-
-obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index d85f446cc0ce..1798209697c6 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -33,5 +33,3 @@ dtb-$(CONFIG_DT_NONE) += \
 	bcm97420c.dtb \
 	bcm97425svmb.dtb \
 	bcm97435svmb.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/cavium-octeon/Makefile b/arch/mips/boot/dts/cavium-octeon/Makefile
index 17aef35f311b..48085bca666c 100644
--- a/arch/mips/boot/dts/cavium-octeon/Makefile
+++ b/arch/mips/boot/dts/cavium-octeon/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_CAVIUM_OCTEON_SOC)	+= octeon_3xxx.dtb octeon_68xx.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index 54aa0c4e6091..6e674f1a3aa3 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -5,5 +5,3 @@ dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
 dtb-$(CONFIG_X1000_CU1000_NEO)	+= cu1000-neo.dtb
 dtb-$(CONFIG_X1830_CU1830_NEO)	+= cu1830-neo.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/lantiq/Makefile b/arch/mips/boot/dts/lantiq/Makefile
index ae6e3e21ebeb..d8531b4653c0 100644
--- a/arch/mips/boot/dts/lantiq/Makefile
+++ b/arch/mips/boot/dts/lantiq/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_DT_EASY50712)	+= danube_easy50712.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 5c6433e441ee..5e3ab984d70f 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -5,5 +5,3 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
index eeb6b7aae83b..566dbec3c7fb 100644
--- a/arch/mips/boot/dts/mscc/Makefile
+++ b/arch/mips/boot/dts/mscc/Makefile
@@ -8,6 +8,3 @@ dtb-$(CONFIG_SOC_VCOREIII)	+= \
 	ocelot_pcb123.dtb \
 	serval_pcb105.dtb \
 	serval_pcb106.dtb
-
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mti/Makefile b/arch/mips/boot/dts/mti/Makefile
index b5f7426998b1..c1c7b27296dd 100644
--- a/arch/mips/boot/dts/mti/Makefile
+++ b/arch/mips/boot/dts/mti/Makefile
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_MIPS_MALTA)	+= malta.dtb
 dtb-$(CONFIG_LEGACY_BOARD_SEAD3)	+= sead3.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/pic32/Makefile b/arch/mips/boot/dts/pic32/Makefile
index fb57f36324db..4069cda2370c 100644
--- a/arch/mips/boot/dts/pic32/Makefile
+++ b/arch/mips/boot/dts/pic32/Makefile
@@ -3,5 +3,3 @@ dtb-$(CONFIG_DTB_PIC32_MZDA_SK)		+= pic32mzda_sk.dtb
 
 dtb-$(CONFIG_DTB_PIC32_NONE)		+= \
 					pic32mzda_sk.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index d27d7e8c700f..dc002152d843 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -10,5 +10,3 @@ dtb-$(CONFIG_SOC_MT7621) += \
 	mt7621-gnubee-gb-pc1.dtb \
 	mt7621-gnubee-gb-pc2.dtb \
 	mt7621-tplink-hc220-g5-v1.dtb
-
-obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
-- 
2.43.0


