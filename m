Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C00A2F4E42
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbhAMPO5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:14:57 -0500
Received: from mout.gmx.net ([212.227.17.22]:41283 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727097AbhAMPO4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550803;
        bh=T/6b+3todXSSG5409OuwHyo42/2sCdV+KtuJQSRBK+g=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=FWh3nXwg2U7kY3/f+i1LZYv1f88MH7Z7Ak+jLDQe6RZ+IIj9EJnKHnuiHhyXo1/i4
         +d+rev25knhfNDIRWLlOsHGgfslPC+Y5kdo3uWMKRqUQBFAK/1V4g0lXZmjTv0HHwf
         Ny9cVoEpYCJKuC7D7FXQl4UekeF/Ul2KpCWapoqE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MKsnF-1keacQ01sr-00LDuL; Wed, 13
 Jan 2021 16:13:23 +0100
Date:   Wed, 13 Jan 2021 17:11:23 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 2/6 v6] mips: Add N64 machine type
Message-Id: <20210113171123.7c819ee9cb9f07f0a4e80e5a@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0UMD4F8XDgJO3tszpN6bdNHvtfSQ8SsGfpA4VQecV0JQxho6KeM
 uQyy23qVazc9VxYHjC1isBgHwSYw+8rqVFVgxN+Ec8N4fk2+rv7oWsw4FmLAjzgYwOvrrNO
 Jh8itf9cMnV0M4oJD6xcmU4qIA2heI+NdXchUtRaoIx1T6DSEGLdW1M7hCAcN1AYvIPINAM
 gCXNh5q9TtCmjn1Qg8GPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TM496gGslcA=:POk1WtZTaDLzW33DloGENu
 Qfpcz0LO+PFjVJ0KgmXQ++dx5gHq6Yfxr3rcV1NK2IT4KQJwR4uY+3zAlDyyx8lXwxCg8fihU
 Gn8q7ozkX0yhyA5TjSZ6DwE2lKZ3D36ITCX2P2E/mk6lAXGVymC6K2kLexXrGiB8/YXZU90cE
 sbExgLZmi1n9AXUb4P5NfUaj2bDHxvHODrXIARAZtvVkeyIO93p6NaPpMDwHU3rUiyL5w+Z2+
 xto5fmz499g8VpaRZAikEKkdh32Vmlq7hgPp3qwl6PcELLgA2PwokOxdG77H8pLE7poklflSF
 KGd6anCkb4cEVDhrnnkrbAj3Y8YIrsdO8CHFWgnA5JKeeTb/wIlKrVoUc0AIFzQ1c6CGMfYTU
 iylBMdCH0TaC9BRZRjMP9UoKQzNchy8QYjctV5GFbNYO7k7EQ5ghrmi4OARKXuag8+3SzjzQZ
 iHvxg1dbGszm+yc/E9RmVxT9bljqoYw0+v7wr0UclvvZ161vTh6Qq+qfcvcBRJrL242eaaTkH
 YjqnGOrJw15J90U9yfdH1g1vvaswkob/26A+5C8m2ucyZcZtvF9VPbPxEuAULyvZAcHXd+V7C
 xl84oOKXffjaFqhsLs8VyQPUZGWZcxVhMkPFipaLfk/WOlJ0vIZJWEMpkn+2jnJJ/oBvJKQ2/
 MZb0FyfVSh+D5t86VzrSxb6UHuO2H94j0bA8IPBhISiNn7+mXiV1S8/p+FhQ6Jrv04zfCy7yX
 r85aBu7l/YaoGinBfp2jzwV10B67+TU1TxsdB9zlS521Bmy6M20L8pO004uqlT16t5UZM+JZs
 odiMxSCsDlJu5ogJq81Q/qKhxs26Ky290OOkfeS6wFuWQvL4ABRqH4tphU++CvI2Q1bPJ45VW
 K4L+Q+A+aAYaEgE4FCOA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the Nintendo 64.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 arch/mips/Kbuild.platforms               |   1 +
 arch/mips/Kconfig                        |  12 +++
 arch/mips/include/asm/mach-n64/irq.h     |   9 ++
 arch/mips/include/asm/mach-n64/kmalloc.h |   8 ++
 arch/mips/n64/Makefile                   |   6 ++
 arch/mips/n64/Platform                   |   7 ++
 arch/mips/n64/init.c                     | 164 ++++++++++++++++++++++++++=
+++++
 arch/mips/n64/irq.c                      |  16 +++
 8 files changed, 223 insertions(+)
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
index 0000000..7e260fc
=2D-- /dev/null
+++ b/arch/mips/include/asm/mach-n64/irq.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_N64_IRQ_H
+#define __ASM_MACH_N64_IRQ_H
+
+#define NR_IRQS 8
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
index 0000000..dfbd864
=2D-- /dev/null
+++ b/arch/mips/n64/init.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Nintendo 64 init.
+ *
+ *  Copyright (C) 2021	Lauri Kasanen
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
+#define MI_REG_BASE 0x4300000
+#define NUM_MI_REGS 4
+#define AI_REG_BASE 0x4500000
+#define NUM_AI_REGS 6
+#define PI_REG_BASE 0x4600000
+#define NUM_PI_REGS 5
+#define SI_REG_BASE 0x4800000
+#define NUM_SI_REGS 7
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
+	struct resource res[3];
+	void *orig;
+	unsigned long phys;
+	unsigned i;
+
+	memset(res, 0, sizeof(struct resource) * 3);
+	res[0].flags =3D IORESOURCE_MEM;
+	res[0].start =3D MI_REG_BASE;
+	res[0].end =3D MI_REG_BASE + NUM_MI_REGS * 4 - 1;
+
+	res[1].flags =3D IORESOURCE_MEM;
+	res[1].start =3D AI_REG_BASE;
+	res[1].end =3D AI_REG_BASE + NUM_AI_REGS * 4 - 1;
+
+	res[2].flags =3D IORESOURCE_IRQ;
+	res[2].start =3D RCP_IRQ;
+	res[2].end =3D RCP_IRQ;
+
+	platform_device_register_simple("n64audio", -1, res, 3);
+
+	memset(&res[0], 0, sizeof(res[0]));
+	res[0].flags =3D IORESOURCE_MEM;
+	res[0].start =3D PI_REG_BASE;
+	res[0].end =3D PI_REG_BASE + NUM_PI_REGS * 4 - 1;
+
+	platform_device_register_simple("n64cart", -1, res, 1);
+
+	memset(&res[0], 0, sizeof(res[0]));
+	res[0].flags =3D IORESOURCE_MEM;
+	res[0].start =3D SI_REG_BASE;
+	res[0].end =3D SI_REG_BASE + NUM_SI_REGS * 4 - 1;
+
+	platform_device_register_simple("n64joy", -1, res, 1);
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
+	memset(&res[0], 0, sizeof(res[0]));
+	res[0].flags =3D IORESOURCE_MEM;
+	res[0].name =3D simplefb_resname;
+	res[0].start =3D phys;
+	res[0].end =3D phys + W * H * 2 - 1;
+
+	platform_device_register_resndata(NULL, "simple-framebuffer", 0,
+					  &res[0], 1, &mode, sizeof(mode));
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
index 0000000..1861e96
=2D-- /dev/null
+++ b/arch/mips/n64/irq.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  N64 IRQ
+ *
+ *  Copyright (C) 2021 Lauri Kasanen
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

