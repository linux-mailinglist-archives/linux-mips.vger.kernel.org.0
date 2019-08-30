Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45D9A2E8D
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfH3EfO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:35:14 -0400
Received: from forward103p.mail.yandex.net ([77.88.28.106]:47682 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726480AbfH3EfO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:35:14 -0400
Received: from mxback29j.mail.yandex.net (mxback29j.mail.yandex.net [IPv6:2a02:6b8:0:1619::229])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id 8232518C0C7E;
        Fri, 30 Aug 2019 07:35:10 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback29j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Way484iZ88-ZAe8O3hD;
        Fri, 30 Aug 2019 07:35:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139710;
        bh=uODOggA2sU/UqD6k394mdw/7H2tJIvZOdHb9aJWDEtI=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=rRs7Eb9Fh0fasVVgk3J0m4lYJ/1L0jzsGA4LeUXsDafxFE8U9OaZhWO0Imd7noP1G
         GLiDnJSp+Sa2pwBxO6gVWAa7FF7LwQ07kwinE2Kvfi4I5Lw/FgesFupH9O+znGZhFY
         eIoUaFvD/ufcHyJqfJ9yRKAwxgxxv6p/hlcMlgCU=
Authentication-Results: mxback29j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-Z1DGWT5u;
        Fri, 30 Aug 2019 07:35:08 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 15/18] MIPS: Loongson64: Load built-in dtbs
Date:   Fri, 30 Aug 2019 12:32:29 +0800
Message-Id: <20190830043232.20191-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
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
 .../asm/mach-loongson64/builtin_dtbs.h        | 26 +++++++
 .../include/asm/mach-loongson64/loongson64.h  |  2 +
 arch/mips/loongson64/env.c                    | 67 +++++++++++++++++++
 arch/mips/loongson64/setup.c                  | 15 +++++
 4 files changed, 110 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h

diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
new file mode 100644
index 000000000000..106287d54069
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -0,0 +1,26 @@
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
+extern u32 __dtb_ls3a1000_780e_1way_begin[];
+extern u32 __dtb_ls3a1000_780e_2way_begin[];
+extern u32 __dtb_ls3a1000_780e_4way_begin[];
+
+extern u32 __dtb_ls3b_780e_1way_begin[];
+extern u32 __dtb_ls3b_780e_2way_begin[];
+
+extern u32 __dtb_ls3a2000_780e_1way_begin[];
+extern u32 __dtb_ls3a2000_780e_2way_begin[];
+extern u32 __dtb_ls3a2000_780e_4way_begin[];
+
+extern u32 __dtb_ls3a3000_780e_1way_begin[];
+extern u32 __dtb_ls3a3000_780e_2way_begin[];
+extern u32 __dtb_ls3a3000_780e_4way_begin[];
+
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/loongson64.h b/arch/mips/include/asm/mach-loongson64/loongson64.h
index d877adb99d33..78daa3fb3fa7 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson64.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson64.h
@@ -45,4 +45,6 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 
 extern const struct plat_smp_ops loongson3_smp_ops;
 extern void __init prom_init_lefi(void);
+extern void *loongson_fdt_blob;
+
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 93658cfbf3a6..e46203c4a348 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -20,6 +20,7 @@
 
 #include <loongson64.h>
 #include <boot_param.h>
+#include <builtin_dtbs.h>
 #include <workarounds.h>
 
 u32 cpu_clock_freq;
@@ -126,6 +127,72 @@ void __init prom_init_lefi(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64) {
+		switch (read_c0_prid() & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON3A_R1:
+			switch (loongson_sysconf.nr_nodes) {
+			case 4:
+				loongson_fdt_blob = __dtb_ls3a1000_780e_4way_begin;
+				break;
+			case 2:
+				loongson_fdt_blob = __dtb_ls3a1000_780e_2way_begin;
+				break;
+			case 1:
+			default:
+				loongson_fdt_blob = __dtb_ls3a1000_780e_1way_begin;
+				break;
+			}
+			break;
+		case PRID_REV_LOONGSON3A_R2_0:
+		case PRID_REV_LOONGSON3A_R2_1:
+			switch (loongson_sysconf.nr_nodes) {
+			case 4:
+				loongson_fdt_blob = __dtb_ls3a2000_780e_4way_begin;
+				break;
+			case 2:
+				loongson_fdt_blob = __dtb_ls3a2000_780e_2way_begin;
+				break;
+			case 1:
+			default:
+				loongson_fdt_blob = __dtb_ls3a2000_780e_1way_begin;
+				break;
+			}
+			break;
+		case PRID_REV_LOONGSON3A_R3_0:
+		case PRID_REV_LOONGSON3A_R3_1:
+			switch (loongson_sysconf.nr_nodes) {
+			case 4:
+				loongson_fdt_blob = __dtb_ls3a3000_780e_4way_begin;
+				break;
+			case 2:
+				loongson_fdt_blob = __dtb_ls3a3000_780e_2way_begin;
+				break;
+			case 1:
+			default:
+				loongson_fdt_blob = __dtb_ls3a3000_780e_1way_begin;
+				break;
+			}
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			switch (loongson_sysconf.nr_nodes) {
+			case 4:
+				loongson_fdt_blob = __dtb_ls3b_780e_2way_begin;
+				break;
+			case 2:
+			default:
+				loongson_fdt_blob = __dtb_ls3b_780e_1way_begin;
+				break;
+			}
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
index 24432adc8350..3b850b3128ea 100644
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
@@ -90,3 +98,10 @@ void __init plat_time_init(void)
 #endif
 }
 
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
+}
-- 
2.22.0

