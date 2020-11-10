Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064BD2AD58A
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 12:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgKJLpU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 06:45:20 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45697 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgKJLpT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 06:45:19 -0500
X-Originating-IP: 82.65.9.182
Received: from localhost (82-65-9-182.subs.proxad.net [82.65.9.182])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BD1F11C000C;
        Tue, 10 Nov 2020 11:45:16 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 3/9] MIPS: mscc: Prepare configuration to handle more SoCs
Date:   Tue, 10 Nov 2020 12:45:02 +0100
Message-Id: <20201110114508.1197652-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110114508.1197652-1-gregory.clement@bootlin.com>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ocelot belongs to a family of SoC named the VCore III. In order to add
these new Soc, use the new symbol SOC_VCOREIII instead of a one
dedicated to Ocelot.

In order to avoid regression on driver building, the MSCC_OCELOT
configuration symbol is kept until the driver will be converted.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/Makefile      |  2 +-
 arch/mips/boot/dts/mscc/Makefile |  2 +-
 arch/mips/generic/Kconfig        | 11 ++++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 19027129add8..0259238d7a2e 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -6,7 +6,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
 subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
-subdir-$(CONFIG_MSCC_OCELOT)		+= mscc
+subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
 subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
 subdir-$(CONFIG_NLM_XLP_BOARD)		+= netlogic
diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
index eb71515871f6..5015ccbbfb23 100644
--- a/arch/mips/boot/dts/mscc/Makefile
+++ b/arch/mips/boot/dts/mscc/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_MSCC_OCELOT)	+= ocelot_pcb123.dtb ocelot_pcb120.dtb
+dtb-$(CONFIG_SOC_VCOREIII)	+= ocelot_pcb123.dtb ocelot_pcb120.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 55d9aed7ced9..45431b88dded 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -34,14 +34,19 @@ config LEGACY_BOARD_OCELOT
 	bool "Support MSCC Ocelot boards"
 	depends on LEGACY_BOARD_SEAD3=n
 	select LEGACY_BOARDS
-	select MSCC_OCELOT
+	select SOC_VCOREIII
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 
-config MSCC_OCELOT
+config SOC_VCOREIII
 	bool
 	select GPIOLIB
 	select MSCC_OCELOT_IRQ
+	select MSCC_OCELOT #will be removed when driver no more use it
+
+#Will be removed when the driver using it will be converted to SOC_VCOREIII
+config MSCC_OCELOT
+	bool
 
 comment "FIT/UHI Boards"
 
@@ -67,7 +72,7 @@ config FIT_IMAGE_FDT_XILFPGA
 
 config FIT_IMAGE_FDT_OCELOT
 	bool "Include FDT for Microsemi Ocelot development platforms"
-	select MSCC_OCELOT
+	select SOC_VCOREIII
 	help
 	  Enable this to include the FDT for the Ocelot development platforms
 	  from Microsemi in the FIT kernel image.
-- 
2.28.0

