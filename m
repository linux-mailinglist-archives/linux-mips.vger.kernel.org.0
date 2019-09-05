Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE38AA65A
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389958AbfIEOrX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:47:23 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:40247 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389424AbfIEOrX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:47:23 -0400
Received: from mxback21j.mail.yandex.net (mxback21j.mail.yandex.net [IPv6:2a02:6b8:0:1619::221])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 57A6E940BE0;
        Thu,  5 Sep 2019 17:47:19 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback21j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id eoyPHuHK6s-lIQiEErp;
        Thu, 05 Sep 2019 17:47:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694839;
        bh=J7uqJDuEc4mgi25ryHv+4u3mROfFI+lLp5dI8/AuBdQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Lv8kBc2FYeGaSoALA0vk/EtnGL1PNFAAL9EaytKlWRIg5WV13y/bAxbhewXdTMiRa
         3MimA+NdsYuwPuVPDaGO0qEo/FN3QUw3WuC4L3FIP1GdQZvUAJmMr+42XmGVhDp22D
         vUyjhjiME14NqlKUAZX8Gj/Rmk8UrpcRfhseaH9o=
Authentication-Results: mxback21j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-lBxWPDBJ;
        Thu, 05 Sep 2019 17:47:16 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 15/19] MIPS: Loongson64: Load built-in dtbs
Date:   Thu,  5 Sep 2019 22:43:12 +0800
Message-Id: <20190905144316.12527-16-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Load proper dtb according to firmware passed parameters and
CPU PRID.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../asm/mach-loongson64/builtin_dtbs.h        | 16 ++++++++++++
 .../include/asm/mach-loongson64/loongson64.h  |  2 ++
 arch/mips/loongson64/env.c                    | 26 +++++++++++++++++++
 arch/mips/loongson64/setup.c                  | 16 ++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h

diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
new file mode 100644
index 000000000000..38063c7d20b1
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * Built-in Generic dtbs for MACH_LOONGSON64
+ */
+
+#ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
+#define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
+
+extern u32 __dtb_3a1000_780e_begin[];
+extern u32 __dtb_3a2000_780e_begin[];
+extern u32 __dtb_3a3000_780e_begin[];
+extern u32 __dtb_3b1x00_780e_begin[];
+
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/loongson64.h b/arch/mips/include/asm/mach-loongson64/loongson64.h
index ace91d52744e..58e07b7d835f 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson64.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson64.h
@@ -45,4 +45,6 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 
 extern const struct plat_smp_ops loongson3_smp_ops;
 extern void __init prom_init_lefi(void);
+extern void *loongson_fdt_blob;
+
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 93658cfbf3a6..34b4d77097f2 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -20,6 +20,7 @@
 
 #include <loongson64.h>
 #include <boot_param.h>
+#include <builtin_dtbs.h>
 #include <workarounds.h>
 
 u32 cpu_clock_freq;
@@ -126,6 +127,31 @@ void __init prom_init_lefi(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64) {
+		switch (read_c0_prid() & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON3A_R1:
+			loongson_fdt_blob = __dtb_3a1000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3A_R2_0:
+		case PRID_REV_LOONGSON3A_R2_1:
+			loongson_fdt_blob = __dtb_3a2000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3A_R3_0:
+		case PRID_REV_LOONGSON3A_R3_1:
+			loongson_fdt_blob = __dtb_3a3000_780e_begin;
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			loongson_fdt_blob = __dtb_3b1x00_780e_begin;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (!loongson_fdt_blob)
+		pr_err("Failed to determine built-in Loongson64 dtb\n");
+
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
 	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index ed014374780a..3b850b3128ea 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -7,9 +7,15 @@
 #include <asm/setup.h>
 #include <asm/smp-ops.h>
 #include <asm/cacheflush.h>
+#include <linux/libfdt.h>
+#include <linux/of_fdt.h>
+
+#include <asm/prom.h>
 
 #include <loongson64.h>
 
+void *loongson_fdt_blob;
+
 static void wbflush_loongson(void)
 {
 	asm(".set\tpush\n\t"
@@ -81,6 +87,8 @@ void __init prom_free_prom_memory(void)
 
 void __init plat_mem_setup(void)
 {
+	if (loongson_fdt_blob)
+		__dt_setup_arch(loongson_fdt_blob);
 }
 
 void __init plat_time_init(void)
@@ -89,3 +97,11 @@ void __init plat_time_init(void)
 	setup_hpet_timer();
 #endif
 }
+
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
+}
-- 
2.22.0

