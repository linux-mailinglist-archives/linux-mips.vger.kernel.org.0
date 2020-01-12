Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B045013858D
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732435AbgALIXC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:23:02 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:57625 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732371AbgALIXB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:23:01 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 7407B1D40C97;
        Sun, 12 Jan 2020 11:16:37 +0300 (MSK)
Received: from mxback1q.mail.yandex.net (mxback1q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:25b3:aea5])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id 6F23ACF40007;
        Sun, 12 Jan 2020 11:16:37 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback1q.mail.yandex.net (mxback/Yandex) with ESMTP id Q7ZMkSEcVy-Gb8Gorow;
        Sun, 12 Jan 2020 11:16:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816997;
        bh=ZF4UnfCbDyKUT35YCijKiYicTuas0pwMkPes6YsV4VA=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=rGO//L39Zj4/svE77D63WP2DeNDcMUQVQbRvIeL4hYCZtYiRD1yH6liD4+RE6Uvt3
         U71+gxf/Ob8xe4zbGBrphlZHNVDmCBJr7Dll8MPqpvATeB3NDWtohrz8+JTOEl4eTz
         jNoMDCDTXIxiFEHwj7/2gjmxXkSyhq3fB7j8+iDQ=
Authentication-Results: mxback1q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-GPV4YZPD;
        Sun, 12 Jan 2020 11:16:30 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 10/10] MIPS: Loongson64: Load built-in dtbs
Date:   Sun, 12 Jan 2020 16:14:16 +0800
Message-Id: <20200112081416.722218-11-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
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
 .../asm/mach-loongson64/builtin_dtbs.h        | 13 +++++++++++
 .../include/asm/mach-loongson64/loongson.h    |  1 +
 arch/mips/loongson64/env.c                    | 23 +++++++++++++++++++
 arch/mips/loongson64/setup.c                  | 16 +++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h

diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
new file mode 100644
index 000000000000..853c6d80887b
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -0,0 +1,13 @@
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
+extern u32 __dtb_loongson3_4core_rs780e_begin[];
+extern u32 __dtb_loongson3_8core_rs780e_begin[];
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index a8fce112a9b0..fde1b75c45ea 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -25,6 +25,7 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
 extern void __init prom_init_env(void);
+extern void *loongson_fdt_blob;
 
 /* irq operation functions */
 extern void mach_irq_dispatch(unsigned int pending);
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 0daeb7bcf023..2554ef11170d 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -17,6 +17,7 @@
 #include <asm/bootinfo.h>
 #include <loongson.h>
 #include <boot_param.h>
+#include <builtin_dtbs.h>
 #include <workarounds.h>
 
 u32 cpu_clock_freq;
@@ -120,6 +121,28 @@ void __init prom_init_env(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C) {
+		switch (read_c0_prid() & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON3A_R1:
+		case PRID_REV_LOONGSON3A_R2_0:
+		case PRID_REV_LOONGSON3A_R2_1:
+		case PRID_REV_LOONGSON3A_R3_0:
+		case PRID_REV_LOONGSON3A_R3_1:
+			loongson_fdt_blob = __dtb_loongson3_4core_rs780e_begin;
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			loongson_fdt_blob = __dtb_loongson3_8core_rs780e_begin;
+			break;
+		default:
+			break;
+		}
+	}
+
+
+	if (!loongson_fdt_blob)
+		pr_err("Failed to determine built-in Loongson64 dtb\n");
+
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
 	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 4fd27f4f90ed..6fe3ffffcaa6 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -8,9 +8,15 @@
 
 #include <asm/wbflush.h>
 #include <asm/bootinfo.h>
+#include <linux/libfdt.h>
+#include <linux/of_fdt.h>
+
+#include <asm/prom.h>
 
 #include <loongson.h>
 
+void *loongson_fdt_blob;
+
 static void wbflush_loongson(void)
 {
 	asm(".set\tpush\n\t"
@@ -27,4 +33,14 @@ EXPORT_SYMBOL(__wbflush);
 
 void __init plat_mem_setup(void)
 {
+	if (loongson_fdt_blob)
+		__dt_setup_arch(loongson_fdt_blob);
+}
+
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
 }
-- 
2.24.1

