Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940C42E9641
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 14:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbhADNnz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 08:43:55 -0500
Received: from mout.gmx.net ([212.227.15.19]:34003 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbhADNnz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609767740;
        bh=7/8SFtQFQZ9J5RdoPAEE4o18g4xoje7EMEu4dh4R6ug=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=VGXZ6am3YiUZd1fy1ZsB7Z5Tsf1MfPxY/zqWQgxvfEAOkCwzlVGIl0SuXFrp+BvaV
         nMmnnNe5fm/3HnZ0a4ZSxJQ3QTVhHJdDpOJ3nHUCAy4QSj5k2PWtA7S2AFLlb0OzoU
         vG2v1Pnu3Z5X3Z0rsQK74K7ZqMb6/jj2R+k6vb4g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MHXFr-1kixiM2oIT-00DWwI; Mon, 04
 Jan 2021 14:42:19 +0100
Date:   Mon, 4 Jan 2021 15:43:57 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 2/6] mips: Add N64 machine type
Message-Id: <20210104154357.6cf126150407ba4839630177@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OJQzYlAQHGvqglhzmMNYAoNi/+B4rR+IEp7KJrljjbZ79+SgfB1
 +9e5q17kWg6JckSicw9p21whxskThRB+unmUT4gqF73PgKOJT6mi84ibVY99lntDvUJcUaH
 nLSqKRklLNRkzzDXHfzzuTMJl/AxBPyuBEhSDIxYAALlJbT3qYPm7rmxCV78SblRHAkuU0G
 lNWytrkNzObwHAZHY3vpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9MZtAmzKUHE=:rzyc0jc63jrfWCOg7VP7mS
 A0tbpXtM6U/J/m3sRV0vsU4Q/Xs25eEGg7KieQ6BdJuI4mOZXWpxKjOzZBQFRkAcht2cJA9Z3
 XP7z+6VZuLLQgXkVlEAXbpnql0NkJpqiKp6NvDaX8WWLiuENcbZE5sbdl1W+RAeKw+PwLZM7p
 hVzTLRA/BeRjXVpS/WAMA39MHAb0Ug/jps7/f/H1BsMioC23X9R88imgUzpBEQWTTYYq+S5AW
 GZngwkWhD178H/OHkNJx07GGTQKXblO2oK4GTy1CE7nvrDLy0CGudc3x0CrS7lwJvZ5BZiL+r
 iFT649lQkvNtlBzYMflHqN6AWvMYUvqnlA7ryC9rJVQOXCwbuu/IkjUFa+a9T/FTORnwVreC/
 5JcpTxF/nx4OcgVdysZ4aUjCP9u3djh1l9xrOdAnf76CIQovIIrKutgPKTzRbnwyvs9k7AZQy
 G659fu0cQvDF6KvTyQJkA4uAoYv3IjvRfiqD274D6AWkXtpcFKkiJzhFgBph64InMyNa9Fcwi
 yNhYwydjgRSoyLkPB8vi7wi52jK3uUe8hR1qOwzxD/91W6W+iCeRSJhQMAqjW/VvAJFJwM8Ot
 +UqnpqRV/ZRvtXPMvdWlXY2YThFr36C/bAJuK1JsdyfeLsl7RmnR5N7V1nUVILHp22CQhCNHJ
 7Oh0pNTS7cOfGhmsxHCQ9nqdTmX8xS62QrM8lg1/ebGx0DfsHRFMMDjoB5RAE7F2GW2u+Yu6K
 VX5/hf7r+inqvZEL6IbhMBArqOwwQU3Z3j6mTFqdXyRihl/lJy3CaL/uLjprEGBNqoq2HODqY
 XEHxxCLQbv0r5Q7Gwn7aNNr/XT6WHYBuX8DERnrry7n6cxXbezGocShpr3y5YAi9IxlKx/u57
 aX9+bZoX8IcVBWo/fvdw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 arch/mips/Kbuild.platforms           |   1 +
 arch/mips/Kconfig                    |  12 ++++
 arch/mips/include/asm/mach-n64/irq.h |   9 +++
 arch/mips/include/asm/n64/irq.h      |  26 ++++++++
 arch/mips/n64/Makefile               |   6 ++
 arch/mips/n64/Platform               |   7 +++
 arch/mips/n64/init.c                 | 119 ++++++++++++++++++++++++++++++=
+++++
 arch/mips/n64/irq.c                  |  16 +++++
 8 files changed, 196 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-n64/irq.h
 create mode 100644 arch/mips/include/asm/n64/irq.h
 create mode 100644 arch/mips/n64/Makefile
 create mode 100644 arch/mips/n64/Platform
 create mode 100644 arch/mips/n64/init.c
 create mode 100644 arch/mips/n64/irq.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 5483e38..e4f6e49 100644
=2D-- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -18,6 +18,7 @@ platform-$(CONFIG_MACH_LOONGSON2EF)	+=3D loongson2ef/
 platform-$(CONFIG_MACH_LOONGSON32)	+=3D loongson32/
 platform-$(CONFIG_MACH_LOONGSON64)	+=3D loongson64/
 platform-$(CONFIG_MIPS_MALTA)		+=3D mti-malta/
+platform-$(CONFIG_MACH_NINTENDO64)	+=3D n64/
 platform-$(CONFIG_NLM_COMMON)		+=3D netlogic/
 platform-$(CONFIG_PIC32MZDA)		+=3D pic32/
 platform-$(CONFIG_MACH_PISTACHIO)	+=3D pistachio/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b52588..1b0aae0 100644
=2D-- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -605,6 +605,18 @@ config MACH_VR41XX
 	select SYS_SUPPORTS_MIPS16
 	select GPIOLIB

+config MACH_NINTENDO64
+	bool "Nintendo 64 console"
+	select CEVT_R4K
+	select CSRC_R4K
+	select SYS_HAS_CPU_R4300
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_ZBOOT
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+
 config RALINK
 	bool "Ralink based machines"
 	select CEVT_R4K
diff --git a/arch/mips/include/asm/mach-n64/irq.h b/arch/mips/include/asm/=
mach-n64/irq.h
new file mode 100644
index 0000000..4d4a1ea
=2D-- /dev/null
+++ b/arch/mips/include/asm/mach-n64/irq.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_N64_IRQ_H
+#define __ASM_MACH_N64_IRQ_H
+
+#include <asm/n64/irq.h> /* for MIPS_CPU_IRQ_BASE */
+
+#include <asm/mach-generic/irq.h>
+
+#endif /* __ASM_MACH_N64_IRQ_H */
diff --git a/arch/mips/include/asm/n64/irq.h b/arch/mips/include/asm/n64/i=
rq.h
new file mode 100644
index 0000000..00f89ca
=2D-- /dev/null
+++ b/arch/mips/include/asm/n64/irq.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Interrupt numbers for N64
+ *
+ * Copyright (C) 2020 Lauri Kasanen
+ */
+#ifndef __N64_IRQ_H
+#define __N64_IRQ_H
+
+#define NR_IRQS 8
+
+/*
+ * CPU core Interrupt Numbers
+ */
+#define MIPS_CPU_IRQ_BASE	0
+#define MIPS_CPU_IRQ(x)		(MIPS_CPU_IRQ_BASE + (x))
+#define MIPS_SOFTINT0_IRQ	MIPS_CPU_IRQ(0)
+#define MIPS_SOFTINT1_IRQ	MIPS_CPU_IRQ(1)
+#define RCP_IRQ			MIPS_CPU_IRQ(2)
+#define CART_IRQ		MIPS_CPU_IRQ(3)
+#define PRENMI_IRQ		MIPS_CPU_IRQ(4)
+#define RDBR_IRQ		MIPS_CPU_IRQ(5)
+#define RDBW_IRQ		MIPS_CPU_IRQ(6)
+#define TIMER_IRQ		MIPS_CPU_IRQ(7)
+
+#endif /* __N64_IRQ_H */
diff --git a/arch/mips/n64/Makefile b/arch/mips/n64/Makefile
new file mode 100644
index 0000000..b64a05a
=2D-- /dev/null
+++ b/arch/mips/n64/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Nintendo 64
+#
+
+obj-y :=3D init.o irq.o
diff --git a/arch/mips/n64/Platform b/arch/mips/n64/Platform
new file mode 100644
index 0000000..2464783
=2D-- /dev/null
+++ b/arch/mips/n64/Platform
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Nintendo 64
+#
+
+cflags-$(CONFIG_MACH_NINTENDO64)    +=3D -I$(srctree)/arch/mips/include/a=
sm/mach-n64
+load-$(CONFIG_MACH_NINTENDO64)      +=3D 0xffffffff80101000
diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
new file mode 100644
index 0000000..47f29d6
=2D-- /dev/null
+++ b/arch/mips/n64/init.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Nintendo 64 init.
+ *
+ *  Copyright (C) 2020	Lauri Kasanen
+ */
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/memblock.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/string.h>
+
+#include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
+#include <asm/time.h>
+
+#define IO_MEM_RESOURCE_START	0UL
+#define IO_MEM_RESOURCE_END	0x1fffffffUL
+
+static void __init iomem_resource_init(void)
+{
+	iomem_resource.start =3D IO_MEM_RESOURCE_START;
+	iomem_resource.end =3D IO_MEM_RESOURCE_END;
+}
+
+const char *get_system_type(void)
+{
+	return "Nintendo 64";
+}
+
+void __init prom_init(void)
+{
+	fw_init_cmdline();
+}
+
+void __init prom_free_prom_memory(void)
+{
+}
+
+#define W 320
+#define H 240
+#define REG_BASE ((u32 *) TO_UNCAC(0x4400000))
+
+static void __init n64rdp_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, REG_BASE + reg);
+}
+
+#undef REG_BASE
+
+static const u32 ntsc_320[] __initconst =3D {
+	0x00013212, 0x00000000, 0x00000140, 0x00000200,
+	0x00000000, 0x03e52239, 0x0000020d, 0x00000c15,
+	0x0c150c15, 0x006c02ec, 0x002501ff, 0x000e0204,
+	0x00000200, 0x00000400
+};
+
+static int __init n64_platform_init(void)
+{
+	static const char simplefb_resname[] =3D "FB";
+	static const struct simplefb_platform_data mode =3D {
+		.width =3D W,
+		.height =3D H,
+		.stride =3D W * 2,
+		.format =3D "r5g5b5a1"
+	};
+	struct resource res;
+	void *orig;
+	unsigned long phys;
+	unsigned i;
+
+	platform_device_register_simple("n64audio", -1, NULL, 0);
+
+	/* The framebuffer needs 64-byte alignment */
+	orig =3D kzalloc(W * H * 2 + 63, GFP_DMA | GFP_KERNEL);
+	if (!orig)
+		return -ENOMEM;
+	phys =3D virt_to_phys(orig);
+	phys +=3D 63;
+	phys &=3D ~63;
+
+	for (i =3D 0; i < ARRAY_SIZE(ntsc_320); i++) {
+		if (i =3D=3D 1)
+			n64rdp_write_reg(i, phys);
+		else
+			n64rdp_write_reg(i, ntsc_320[i]);
+	}
+
+	/* setup IORESOURCE_MEM as framebuffer memory */
+	memset(&res, 0, sizeof(res));
+	res.flags =3D IORESOURCE_MEM;
+	res.name =3D simplefb_resname;
+	res.start =3D phys;
+	res.end =3D phys + W * H * 2 - 1;
+
+	platform_device_register_resndata(NULL, "simple-framebuffer", 0,
+					  &res, 1, &mode, sizeof(mode));
+
+	return 0;
+}
+
+#undef W
+#undef H
+
+arch_initcall(n64_platform_init);
+
+void __init plat_mem_setup(void)
+{
+	iomem_resource_init();
+	memblock_add(0x0, 8 * 1024 * 1024); // Bootloader blocks the 4mb config
+}
+
+void __init plat_time_init(void)
+{
+	// 93.75 MHz cpu, count register runs at half rate
+	mips_hpt_frequency =3D 93750000 / 2;
+}
diff --git a/arch/mips/n64/irq.c b/arch/mips/n64/irq.c
new file mode 100644
index 0000000..9f833cb
=2D-- /dev/null
+++ b/arch/mips/n64/irq.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  N64 IRQ
+ *
+ *  Copyright (C) 2020 Lauri Kasanen
+ */
+#include <linux/export.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+
+#include <asm/irq_cpu.h>
+
+void __init arch_init_irq(void)
+{
+	mips_cpu_irq_init();
+}
=2D-
2.6.2

