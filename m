Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E465D9E358
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfH0IzU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:55:20 -0400
Received: from forward104j.mail.yandex.net ([5.45.198.247]:46189 "EHLO
        forward104j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfH0IzT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:55:19 -0400
Received: from mxback15o.mail.yandex.net (mxback15o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::66])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 7A8A14A1B5A;
        Tue, 27 Aug 2019 11:55:15 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback15o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 3r8G3bhQvA-tE5Ogajn;
        Tue, 27 Aug 2019 11:55:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896115;
        bh=9x9JHKkA5s2saezMDxxt5Ql6wxmaHniD/+8n/iFpUTE=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=NashDxeo1Tfl+b8j0QMdUXOR7BeLWTXdY8jILSaOTvTLo9cRK799i6XOwJg4sZsxZ
         hiMCBBtYujEVUxH1hGtBN40UDAGTeVO5Wds7nbQ7nopLgsvApmMAcWu2GGlx6OP7JQ
         ngUulvIjgzIfc9cNNDo2pQsAm288nW2UDU4oNu+4=
Authentication-Results: mxback15o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-t9tClHm7;
        Tue, 27 Aug 2019 11:55:13 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 13/13] MIPS: Loongson64: Load built-in dtbs
Date:   Tue, 27 Aug 2019 16:53:02 +0800
Message-Id: <20190827085302.5197-14-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
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
index 000000000000..234803ba9d82
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
index 93658cfbf3a6..4336bd7c1b94 100644
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
+	if(!loongson_fdt_blob)
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

