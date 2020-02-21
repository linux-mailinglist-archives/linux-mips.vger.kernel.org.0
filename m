Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D55166EDF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 06:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgBUFQe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 00:16:34 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17850 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726084AbgBUFQd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 00:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582262039;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=GMsmbrI9/BLBWFuYIg+sygdLa2erlXzlYRX1a5u/aA0=;
        b=aE4+C2RyPQ1+iVt2OeKlwdP0ZLsBN5bX5MKPwv0wkdmxNOpbvWfU7WSZWFsZWdQn
        iL8dvcAIvNgqiJ8/l6NMMgQBz4DaE4mE9ZPCRHBkX+AYqK6ZCQ4oxipAQjyqEbm6ZAp
        jfwU7qK3Vl1z1wSGf9yy/Z8vQodsLpbheMSUa+Q8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1582262037275559.787205491624; Fri, 21 Feb 2020 13:13:57 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200221050942.507775-10-jiaxun.yang@flygoat.com>
Subject: [PATCH v4 09/10] MIPS: Loongson64: Load built-in dtbs
Date:   Fri, 21 Feb 2020 13:09:24 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
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

diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mi=
ps/include/asm/mach-loongson64/builtin_dtbs.h
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
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/i=
nclude/asm/mach-loongson64/loongson.h
index a8fce112a9b0..fde1b75c45ea 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -25,6 +25,7 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
 extern void __init prom_init_env(void);
+extern void *loongson_fdt_blob;
=20
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
=20
 u32 cpu_clock_freq;
@@ -120,6 +121,28 @@ void __init prom_init_env(void)
 =09=09loongson_sysconf.cores_per_node - 1) /
 =09=09loongson_sysconf.cores_per_node;
=20
+=09if ((read_c0_prid() & PRID_IMP_MASK) =3D=3D PRID_IMP_LOONGSON_64C) {
+=09=09switch (read_c0_prid() & PRID_REV_MASK) {
+=09=09case PRID_REV_LOONGSON3A_R1:
+=09=09case PRID_REV_LOONGSON3A_R2_0:
+=09=09case PRID_REV_LOONGSON3A_R2_1:
+=09=09case PRID_REV_LOONGSON3A_R3_0:
+=09=09case PRID_REV_LOONGSON3A_R3_1:
+=09=09=09loongson_fdt_blob =3D __dtb_loongson3_4core_rs780e_begin;
+=09=09=09break;
+=09=09case PRID_REV_LOONGSON3B_R1:
+=09=09case PRID_REV_LOONGSON3B_R2:
+=09=09=09loongson_fdt_blob =3D __dtb_loongson3_8core_rs780e_begin;
+=09=09=09break;
+=09=09default:
+=09=09=09break;
+=09=09}
+=09}
+
+
+=09if (!loongson_fdt_blob)
+=09=09pr_err("Failed to determine built-in Loongson64 dtb\n");
+
 =09loongson_sysconf.pci_mem_start_addr =3D eirq_source->pci_mem_start_addr=
;
 =09loongson_sysconf.pci_mem_end_addr =3D eirq_source->pci_mem_end_addr;
 =09loongson_sysconf.pci_io_base =3D eirq_source->pci_io_start_addr;
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 4fd27f4f90ed..6fe3ffffcaa6 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -8,9 +8,15 @@
=20
 #include <asm/wbflush.h>
 #include <asm/bootinfo.h>
+#include <linux/libfdt.h>
+#include <linux/of_fdt.h>
+
+#include <asm/prom.h>
=20
 #include <loongson.h>
=20
+void *loongson_fdt_blob;
+
 static void wbflush_loongson(void)
 {
 =09asm(".set\tpush\n\t"
@@ -27,4 +33,14 @@ EXPORT_SYMBOL(__wbflush);
=20
 void __init plat_mem_setup(void)
 {
+=09if (loongson_fdt_blob)
+=09=09__dt_setup_arch(loongson_fdt_blob);
+}
+
+void __init device_tree_init(void)
+{
+=09if (!initial_boot_params)
+=09=09return;
+
+=09unflatten_and_copy_device_tree();
 }
--=20
2.25.0


