Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C3B2AD590
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 12:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgKJLpZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 06:45:25 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42955 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729484AbgKJLpY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 06:45:24 -0500
X-Originating-IP: 82.65.9.182
Received: from localhost (82-65-9-182.subs.proxad.net [82.65.9.182])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8D16C40016;
        Tue, 10 Nov 2020 11:45:21 +0000 (UTC)
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
Subject: [PATCH v2 7/9] MIPS: mscc: build FIT image for Luton
Date:   Tue, 10 Nov 2020 12:45:06 +0100
Message-Id: <20201110114508.1197652-8-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110114508.1197652-1-gregory.clement@bootlin.com>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Luton now has already an u-boot port so let's build FIT images.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/generic/Kconfig           |  8 ++++++++
 arch/mips/generic/Platform          |  1 +
 arch/mips/generic/board-luton.its.S | 23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/mips/generic/board-luton.its.S

diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index eb2a3fa9fcd7..e5a7a1314e71 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -78,6 +78,14 @@ config FIT_IMAGE_FDT_OCELOT
 	  from Microsemi in the FIT kernel image.
 	  This requires u-boot on the platform.
 
+config FIT_IMAGE_FDT_LUTON
+	bool "Include FDT for Microsemi Luton development platforms"
+	select SOC_VCOREIII
+	help
+	  Enable this to include the FDT for the Luton development platforms
+	  from Microsemi in the FIT kernel image.
+	  This requires u-boot on the platform.
+
 config BOARD_INGENIC
 	bool "Support boards based on Ingenic SoCs"
 	select MACH_INGENIC_GENERIC
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index f8ef2f9d107e..4b6905daa39c 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -20,4 +20,5 @@ its-y					:= vmlinux.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= board-boston.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= board-ni169445.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_OCELOT)	+= board-ocelot.its.S
+its-$(CONFIG_FIT_IMAGE_FDT_LUTON)	+= board-luton.its.S
 its-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= board-xilfpga.its.S
diff --git a/arch/mips/generic/board-luton.its.S b/arch/mips/generic/board-luton.its.S
new file mode 100644
index 000000000000..39a543f62f25
--- /dev/null
+++ b/arch/mips/generic/board-luton.its.S
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/ {
+	images {
+		fdt@luton_pcb091 {
+			description = "MSCC Luton PCB091 Device Tree";
+			data = /incbin/("boot/dts/mscc/luton_pcb091.dtb");
+			type = "flat_dt";
+			arch = "mips";
+			compression = "none";
+			hash@0 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		pcb091 {
+			description = "Luton Linux kernel";
+			kernel = "kernel@0";
+			fdt = "fdt@luton_pcb091";
+		};
+	};
+};
-- 
2.28.0

