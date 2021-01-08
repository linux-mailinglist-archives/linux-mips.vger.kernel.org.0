Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693F72EEE9A
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 09:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbhAHIb3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 03:31:29 -0500
Received: from mout.gmx.net ([212.227.15.18]:38153 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbhAHIb3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 03:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610094595;
        bh=m9byucVO091/LdU9ukZICn2KjnI3jZ5sfSXN6yCzgyc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=W1Ci09gXXNFuI9kgupgCsa256Xi+0gLyanL0L0KSOkICSWWzHnrxm7KCpenyM0N16
         tnP4uPE+rS1LS4OMmEXEoGvx8YsX0zfOHGGUhHAh3OnwZ06pxiF5H6dW/PfKvLy1TP
         BEqJB5qBB6BX0pSbQoeBrJj9ecu33RKqheqliL+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1McH5a-1kNcze3I5c-00cdm4; Fri, 08
 Jan 2021 09:29:54 +0100
Date:   Fri, 8 Jan 2021 10:31:33 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 2/6 v2] mips: Add N64 machine type
Message-Id: <20210108103133.fcb577c891c56d009d5737a6@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KdBDsdgXJUJkwfhXDoWyOoqO+4Mck9toWLVGHhz0iW26KFhuR3g
 1gyKAlpNEll/IjLKYZURwssBPmBpCN5I2MGbyTjk0ckC6VRw/0oZQstyloQX7WoEL4XVq9l
 21w9zgAYI3rr55skXEt7Gbk/YDxD4mqcY4zItqRTLshF0B8iOZpkWQPIt/zLVYWCYqyBinx
 iopHTCgO3Doptih70YhAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L5bT5vXcSxs=:+sJVoNYCTCf0jySDtIAwR4
 8rBqlL1cZxvxYX0NVM3rkEm8dJ0zzpVm60A5J8yCMjLTQeQnKDF9mQFBBMikxuQsDk9tm+3dk
 O8m9Tm47i85fzVTPSKZo/K/CQbQ8vbEbHUH9noWo6NeQHJzudwpzYMjNxcceC9RZ9/bFGaOmv
 rSenBCvbj7Yeu4cLKavSS1FgjR6WYE7AkYCkxuw6P89gvl0+9+ZvGSJ8jX9ZcK7EcWYFVP6CB
 svBb/aUMXviXwWN9N+mDXp1jO++RVXd93NzWx2s7L+8YmZIP9w0pWdk03zixi10Fb56Di+jS0
 igcHynA66/5vM5GGVCzVq1On7m7A7ctYl29lwDo/Ts6yUrkxTIDkxvEGNUPagT3CGp0g5gM/u
 X81MlNlLtzJiUagAzdNtJfJcGzdnnQFBjJzrLrk9WjaulCjzklgDnED0Woq42ZK52yosYo6H8
 StSIwz51wCUPeKHpodcTOd2b+jTNwG+5pFanK1+Uf8QrcH+EjFDKRd8Ugw5azi6a6pNqWA7LN
 f4QY/e0nnTzAg+00NEeTIsAH/0SEX7gJnYdxoFl2r0AGPs5S+93DZnz5Mb9mk9eYiDU5o2Up0
 YAj+TzBZ6pugEGH3eCys5BnFgfA//x9jx6IGqNdb9vJ+WWPuTwYtnzIHRK8v7dst55jYc5NQX
 RhXamYJqxu2wxJm/SQLxIL4E+Y2tspHgsnxhPPEvRKHj4qfhUjDFG0MW+HglVhSW6uAPPItIw
 lOzO58Tch+GKhC85nxbejf84rEqrjW5ro0UpWnYTVdXMPMy4glM5B8rn3STdKqt3czVjlTgc7
 Nx5V84RUS61FXgK+4rGHoCnb2KI7wZbss34HUHlhQvC+y8GK85iL77qCwvVSg5fSAxkjpn4KX
 N33DS9ZY10YiZIMsKFfg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v2:
smaller kmalloc align
irq header cleanup
no cpp comments
remove prom_free_prom_memory

 arch/mips/Kbuild.platforms               |   1 +
 arch/mips/Kconfig                        |  12 ++++
 arch/mips/include/asm/mach-n64/irq.h     |  22 ++++++
 arch/mips/include/asm/mach-n64/kmalloc.h |   8 +++
 arch/mips/n64/Makefile                   |   6 ++
 arch/mips/n64/Platform                   |   7 ++
 arch/mips/n64/init.c                     | 115 ++++++++++++++++++++++++++=
+++++
 arch/mips/n64/irq.c                      |  16 +++++
 8 files changed, 187 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-n64/irq.h
 create mode 100644 arch/mips/include/asm/mach-n64/kmalloc.h
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
index 0000000..125e301
=2D-- /dev/null
+++ b/arch/mips/include/asm/mach-n64/irq.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_N64_IRQ_H
+#define __ASM_MACH_N64_IRQ_H
+
+#define NR_IRQS 8
+
+/*
+ * System-specifc irq names for clarity
+ */
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
+#include <asm/mach-generic/irq.h>
+
+#endif /* __ASM_MACH_N64_IRQ_H */
diff --git a/arch/mips/include/asm/mach-n64/kmalloc.h b/arch/mips/include/=
asm/mach-n64/kmalloc.h
new file mode 100644
index 0000000..e8b8d0b
=2D-- /dev/null
+++ b/arch/mips/include/asm/mach-n64/kmalloc.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_N64_KMALLOC_H
+#define __ASM_MACH_N64_KMALLOC_H
+
+/* The default of 128 bytes wastes too much, use 32 (the largest cachelin=
e, I) */
+#define ARCH_DMA_MINALIGN L1_CACHE_BYTES
+
+#endif /* __ASM_MACH_N64_KMALLOC_H */
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
index 0000000..8861ac3d
=2D-- /dev/null
+++ b/arch/mips/n64/init.c
@@ -0,0 +1,115 @@
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
+#define W 320
+#define H 240
+#define REG_BASE ((u32 *) CKSEG1ADDR(0x4400000))
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
+	memblock_add(0x0, 8 * 1024 * 1024); /* Bootloader blocks the 4mb config =
*/
+}
+
+void __init plat_time_init(void)
+{
+	/* 93.75 MHz cpu, count register runs at half rate */
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

