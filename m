Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D1077AED
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388041AbfG0Rxd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51042 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbfG0Rxd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so50476200wml.0;
        Sat, 27 Jul 2019 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WiKljKUQ604t7jVG0izx32h6+PHWmfGpbQIDbLa/UM0=;
        b=FhnHlEe8yO6636AcRpwWH8Rds0luKW+zTpZfoDSiW+5oXi/H+EI6SQ5xYHmQba+nfJ
         aawiM4M5Rt/twWzR1Zq88hjFKIynLR4tthDH4LmU/BClCdhAZI1UUobg2Wh31kS/9m2C
         +ojm0qp1teoQjxipLmLumj/Z8sFiXGXNgpQ3pUO+FTW6LKWt8dHovuTynW6F8I5khvCs
         9rPRx/LAhETZEaLUg9mXUHNG73c2JETA41Y4cMS56rhkEbrE/DcDpRRn6M55NXGrOKiP
         unuMY+roKrJw1nL5DSa/eEQEjFgdTSB5ZW0kM/9miTfngHq3BIdh3b5PDhzE0M8ITlQd
         vYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WiKljKUQ604t7jVG0izx32h6+PHWmfGpbQIDbLa/UM0=;
        b=Q9PSWb2E2C9LVpohbqWNLfJ4OVANrDvJjz8zlbEzAuVSzAGBSVxUqF8VLS3KyEwdso
         k8XfIuLNn+ZCI7O8UGgnKFVivWISIplFIYjTHQx88CVAz0p8aabqV3xeZEpXyRjfIg34
         BAX5/USqgM1DNQCyctxe9gHdKEGM8Trfn7XpljMZ+RU/47yoEIg65ClJ/1q18yEH9jhK
         Yh2jC4qef381gLlfxAc3YYMyXYDRq91qBQ8wzl6OYt7H59/VBEZ1Nr/176ur5rv52pod
         DHwjPbcotNR1gBA7cTKX6ARXApUY5sEEziZ7jFnuH1KUU6iAyOMlBdJDy3+SKPr0MVFB
         yvUA==
X-Gm-Message-State: APjAAAWZyLCRx6TCbLRRehwCHjJZXi3tl0VH/mUxvYnkohxoAXEk1oiR
        +J1nJNUVS8Ea5TNBZ+qW1Fs=
X-Google-Smtp-Source: APXvYqytLgsaCkQuODXF4pncHqjjM2FfhALTj3Hbli9qa0E8EMUl0YCp7x125BIUifgrK//ee27Jzw==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr95347913wmb.112.1564250010196;
        Sat, 27 Jul 2019 10:53:30 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:29 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/5] MIPS: lantiq: use a generic "EBU" driver for Falcon and XWAY SoCs
Date:   Sat, 27 Jul 2019 19:53:12 +0200
Message-Id: <20190727175315.28834-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Both SoC types have the EBU registers and exposing the ltq_ebu_membase
in (the SoC-independent) arch/mips/include/asm/mach-lantiq/lantiq.h.
The only difference is the initialization logic: XWAY clears the WRDIS
(write disable) bit of the BUSCON0 register, while Falcon leaves it as
is.

Move the existing EBU logic from the Falcon and XWAY SoC types into a
generic driver.
This will make it easier to add the PCI irq controller which is provided
by EBU on at least the XWAY SoCs.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../include/asm/mach-lantiq/xway/lantiq_soc.h |  2 -
 arch/mips/lantiq/Makefile                     |  2 +-
 arch/mips/lantiq/ebu.c                        | 89 +++++++++++++++++++
 arch/mips/lantiq/falcon/sysctrl.c             | 17 ++--
 arch/mips/lantiq/xway/sysctrl.c               | 21 ++---
 5 files changed, 100 insertions(+), 31 deletions(-)
 create mode 100644 arch/mips/lantiq/ebu.c

diff --git a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h b/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
index 4790cfa190d6..02a64ad6c0cc 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
+++ b/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
@@ -79,13 +79,11 @@ extern __iomem void *ltq_cgu_membase;
 #define LTQ_EARLY_ASC		KSEG1ADDR(LTQ_ASC1_BASE_ADDR)
 
 /* EBU - external bus unit */
-#define LTQ_EBU_BUSCON0		0x0060
 #define LTQ_EBU_PCC_CON		0x0090
 #define LTQ_EBU_PCC_IEN		0x00A4
 #define LTQ_EBU_PCC_ISTAT	0x00A0
 #define LTQ_EBU_BUSCON1		0x0064
 #define LTQ_EBU_ADDRSEL1	0x0024
-#define EBU_WRDIS		0x80000000
 
 /* WDT */
 #define LTQ_RST_CAUSE_WDTRST	0x20
diff --git a/arch/mips/lantiq/Makefile b/arch/mips/lantiq/Makefile
index e7234ca093b9..e92f62f02ec1 100644
--- a/arch/mips/lantiq/Makefile
+++ b/arch/mips/lantiq/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2010 John Crispin <john@phrozen.org>
 #
 
-obj-y := irq.o clk.o prom.o
+obj-y := irq.o clk.o ebu.o prom.o
 
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 
diff --git a/arch/mips/lantiq/ebu.c b/arch/mips/lantiq/ebu.c
new file mode 100644
index 000000000000..b2e84cf83f91
--- /dev/null
+++ b/arch/mips/lantiq/ebu.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ *  Copyright (C) 2011-2012 John Crispin <blogic@openwrt.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/export.h>
+#include <linux/ioport.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+
+#include <lantiq_soc.h>
+
+#define LTQ_EBU_BUSCON0				0x0060
+#define LTQ_EBU_BUSCON_WRDIS			BIT(31)
+
+void __iomem *ltq_ebu_membase;
+
+struct ltq_ebu_data {
+	bool		initialize_buscon0_wrdis;
+};
+
+static const struct ltq_ebu_data ltq_ebu_falcon_data = {
+	.initialize_buscon0_wrdis = false,
+};
+
+static const struct ltq_ebu_data ltq_ebu_xway_data = {
+	.initialize_buscon0_wrdis = true,
+};
+
+static const struct of_device_id of_ebu_ids[] __initconst = {
+	{
+		/* DEPRECATED */
+		.compatible = "lantiq,ebu-falcon",
+		.data = &ltq_ebu_falcon_data,
+	},
+	{
+		.compatible = "lantiq,falcon-ebu",
+		.data = &ltq_ebu_falcon_data,
+	},
+	{
+		/* DEPRECATED */
+		.compatible = "lantiq,ebu-xway",
+		.data = &ltq_ebu_xway_data,
+	},
+	{
+		.compatible = "lantiq,xway-ebu",
+		.data = &ltq_ebu_xway_data,
+	},
+	{ /* sentinel */ },
+};
+
+static int __init ltq_ebu_setup(void)
+{
+	const struct ltq_ebu_data *ebu_data;
+	const struct of_device_id *match;
+	struct resource res_ebu;
+	struct device_node *np;
+	u32 val;
+
+	np = of_find_matching_node_and_match(NULL, of_ebu_ids, &match);
+	if (!np)
+		panic("Failed to load the EBU node from devicetree");
+
+	if (of_address_to_resource(np, 0, &res_ebu))
+		panic("Failed to get the EBU resources");
+
+	if ((request_mem_region(res_ebu.start, resource_size(&res_ebu),
+				res_ebu.name) < 0))
+		pr_err("Failed to request the EBU resources");
+
+	ltq_ebu_membase = ioremap_nocache(res_ebu.start,
+						resource_size(&res_ebu));
+	if (!ltq_ebu_membase)
+		panic("Failed to remap the EBU resources");
+
+	ebu_data = match->data;
+
+	if (ebu_data && ebu_data->initialize_buscon0_wrdis) {
+		val = ltq_ebu_r32(LTQ_EBU_BUSCON0) & ~LTQ_EBU_BUSCON_WRDIS;
+		ltq_ebu_w32(val, LTQ_EBU_BUSCON0);
+	}
+
+	return 0;
+}
+
+arch_initcall(ltq_ebu_setup);
diff --git a/arch/mips/lantiq/falcon/sysctrl.c b/arch/mips/lantiq/falcon/sysctrl.c
index 037b08f3257e..1637c6f1d8f3 100644
--- a/arch/mips/lantiq/falcon/sysctrl.c
+++ b/arch/mips/lantiq/falcon/sysctrl.c
@@ -70,7 +70,7 @@
 #define status_r32(x)		ltq_r32(status_membase + (x))
 
 static void __iomem *sysctl_membase[3], *status_membase;
-void __iomem *ltq_sys1_membase, *ltq_ebu_membase;
+void __iomem *ltq_sys1_membase;
 
 void falcon_trigger_hrst(int level)
 {
@@ -184,23 +184,20 @@ void __init ltq_soc_init(void)
 {
 	struct device_node *np_status =
 		of_find_compatible_node(NULL, NULL, "lantiq,status-falcon");
-	struct device_node *np_ebu =
-		of_find_compatible_node(NULL, NULL, "lantiq,ebu-falcon");
 	struct device_node *np_sys1 =
 		of_find_compatible_node(NULL, NULL, "lantiq,sys1-falcon");
 	struct device_node *np_syseth =
 		of_find_compatible_node(NULL, NULL, "lantiq,syseth-falcon");
 	struct device_node *np_sysgpe =
 		of_find_compatible_node(NULL, NULL, "lantiq,sysgpe-falcon");
-	struct resource res_status, res_ebu, res_sys[3];
+	struct resource res_status, res_sys[3];
 	int i;
 
 	/* check if all the core register ranges are available */
-	if (!np_status || !np_ebu || !np_sys1 || !np_syseth || !np_sysgpe)
+	if (!np_status || !np_sys1 || !np_syseth || !np_sysgpe)
 		panic("Failed to load core nodes from devicetree");
 
 	if (of_address_to_resource(np_status, 0, &res_status) ||
-			of_address_to_resource(np_ebu, 0, &res_ebu) ||
 			of_address_to_resource(np_sys1, 0, &res_sys[0]) ||
 			of_address_to_resource(np_syseth, 0, &res_sys[1]) ||
 			of_address_to_resource(np_sysgpe, 0, &res_sys[2]))
@@ -208,8 +205,6 @@ void __init ltq_soc_init(void)
 
 	if ((request_mem_region(res_status.start, resource_size(&res_status),
 				res_status.name) < 0) ||
-		(request_mem_region(res_ebu.start, resource_size(&res_ebu),
-				res_ebu.name) < 0) ||
 		(request_mem_region(res_sys[0].start,
 				resource_size(&res_sys[0]),
 				res_sys[0].name) < 0) ||
@@ -223,11 +218,9 @@ void __init ltq_soc_init(void)
 
 	status_membase = ioremap_nocache(res_status.start,
 					resource_size(&res_status));
-	ltq_ebu_membase = ioremap_nocache(res_ebu.start,
-					resource_size(&res_ebu));
 
-	if (!status_membase || !ltq_ebu_membase)
-		panic("Failed to remap core resources");
+	if (!status_membase)
+		panic("Failed to remap status resource");
 
 	for (i = 0; i < 3; i++) {
 		sysctl_membase[i] = ioremap_nocache(res_sys[i].start,
diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index 156a95ac5c72..ae3f35884036 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -145,7 +145,6 @@ static u32 pmu_clk_cr_b[] = {
 
 static void __iomem *pmu_membase;
 void __iomem *ltq_cgu_membase;
-void __iomem *ltq_ebu_membase;
 
 static u32 ifccr = CGU_IFCCR;
 static u32 pcicr = CGU_PCICR;
@@ -406,42 +405,32 @@ static void clkdev_add_clkout(void)
 /* bring up all register ranges that we need for basic system control */
 void __init ltq_soc_init(void)
 {
-	struct resource res_pmu, res_cgu, res_ebu;
+	struct resource res_pmu, res_cgu;
 	struct device_node *np_pmu =
 			of_find_compatible_node(NULL, NULL, "lantiq,pmu-xway");
 	struct device_node *np_cgu =
 			of_find_compatible_node(NULL, NULL, "lantiq,cgu-xway");
-	struct device_node *np_ebu =
-			of_find_compatible_node(NULL, NULL, "lantiq,ebu-xway");
 
 	/* check if all the core register ranges are available */
-	if (!np_pmu || !np_cgu || !np_ebu)
+	if (!np_pmu || !np_cgu)
 		panic("Failed to load core nodes from devicetree");
 
 	if (of_address_to_resource(np_pmu, 0, &res_pmu) ||
-			of_address_to_resource(np_cgu, 0, &res_cgu) ||
-			of_address_to_resource(np_ebu, 0, &res_ebu))
+			of_address_to_resource(np_cgu, 0, &res_cgu))
 		panic("Failed to get core resources");
 
 	if (!request_mem_region(res_pmu.start, resource_size(&res_pmu),
 				res_pmu.name) ||
 		!request_mem_region(res_cgu.start, resource_size(&res_cgu),
-				res_cgu.name) ||
-		!request_mem_region(res_ebu.start, resource_size(&res_ebu),
-				res_ebu.name))
+				res_cgu.name))
 		pr_err("Failed to request core resources");
 
 	pmu_membase = ioremap_nocache(res_pmu.start, resource_size(&res_pmu));
 	ltq_cgu_membase = ioremap_nocache(res_cgu.start,
 						resource_size(&res_cgu));
-	ltq_ebu_membase = ioremap_nocache(res_ebu.start,
-						resource_size(&res_ebu));
-	if (!pmu_membase || !ltq_cgu_membase || !ltq_ebu_membase)
+	if (!pmu_membase || !ltq_cgu_membase)
 		panic("Failed to remap core resources");
 
-	/* make sure to unprotect the memory region where flash is located */
-	ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_BUSCON0) & ~EBU_WRDIS, LTQ_EBU_BUSCON0);
-
 	/* add our generic xway clocks */
 	clkdev_add_pmu("10000000.fpi", NULL, 0, 0, PMU_FPI);
 	clkdev_add_pmu("1e100a00.gptu", NULL, 1, 0, PMU_GPT);
-- 
2.22.0

