Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0912E2BF4
	for <lists+linux-mips@lfdr.de>; Fri, 25 Dec 2020 18:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLYRFl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 12:05:41 -0500
Received: from mout.gmx.net ([212.227.15.19]:38059 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgLYRFl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 12:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608915848;
        bh=/U79Em2ctFJzT+fmzS0aMR6P888RscDzAKcJlKZEkMI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=OfwXZD3VDU6ppsOJUFsMo6jDlAd0HZlCiHkD87fbUtjHSjoULl23LjlHm4v5Wexlm
         4ClKIoenMia4BKqOodq+2ExTc9DjZnHnCCGgt5k3jBZSrps5lXaUCqacnXiMnq2vCO
         t7i9IQktTFW6cnWprNVaVvLxcd4apPFJGjbrRKsU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MUGe1-1kSGz52YrL-00RIyr; Fri, 25
 Dec 2020 18:04:08 +0100
Date:   Fri, 25 Dec 2020 19:00:16 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 2/6] mips: Add N64 machine type
Message-Id: <20201225190016.286a0dfe49385f2bc39d04d4@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lE4j6cFjs+P1HuonD+3Ey93+YZhCoD5F0s/+T0Xtd4cVGiAOiez
 heD/0W+NnIqYn+PGMvtoUbXg5vGQsrVYEciaYnx7Sq9dBXyOpoGz9F5Vh8eKa+VqCcpua9G
 rAozkgx958W8mA8SQaPT+UuGjpoPntwh8em1CMWo92g5bF/0lffiVc9qMaQPv14FQNyxf18
 pLx94cuY5msLiFENQ3EMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yVYlYFcIi/Q=:1FsxoczhuWOk9TYxzy6Lii
 PvakDtd8X39oUvP5kybZWhz/PuIIKnGnGggJtUrxMxdZpdiDd8XWAXs/q/Hn9SEz7JNGlWyPU
 StkfrKpfuIjJ5p8wOc6r1eLBo94qiYkTIDSBZkdy8ureO+sGi/autVbddZwG2TMsw5c71u7vl
 wrD/9PehDUzpo69GZgz87Ro9K/wq1ejPSl869G9ln9bJjWQcmsXmHD6TuGM9iJ1xzLqdPoCpQ
 ZQKQYiTugGhdkIVKfFn7cRevXfvSRZEFX040Y89DLqPBLsbFpKH2Axb9OCKXBvegmGVPfcxNH
 NHZmvDaIJk0WRzJO85v3+hP7XtLpSuEwJmGLiWThkYBZWLaWJUUszvfd5FlvpPMfaX0j0Wc3u
 QFFzqiPTS/Jd0gCaxT2B5F0boNkpsUYz/tkDhsD8erro66AKglV6hjF2/n9ldsrZy+/hnPp0/
 UkYGiWrdMHZ4JYzta9DkiAiXK2uLz/iDiXosP6pMNfUvlhTsaHfDWI69xsraLaDMDShDAhm2v
 wKuofsyqo3WuYEaQGwHfyY5FgipFX1omMbp64Yq347e3vn5VGzEwiwVL8N9hH7Xb5GGy1mSkw
 nnjQRHMxsvpzJT3Hyr6KcJZBUFuxFpel0fXckl7l3zKpufs2RNjLD/pvbD9WFIJ5JtoxIGOhU
 iqlODydFHKdvI8EuhpgDRpKHiLabBDsLwROM8uJ38S7jC3ExtTil1Whml7FGIRyl1dWefMJGj
 yvMBfNSjl/EuGOaaBXPLjsa970KeWlQgXpZ56Wmmkk/bpjg0ymAq7bSdCPRCfbKZhcmhjgosJ
 9yCGrrW3dDZ1MuTHCPkCwigp26dSPXKm0f9l/2HEAB7JVPt/89XhGbYrlHuviQnXqEHyl7Kw3
 AjGVGATApAIOou/IOAhA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 arch/mips/Kbuild.platforms           |  1 +
 arch/mips/Kconfig                    | 12 ++++++++
 arch/mips/include/asm/mach-n64/irq.h |  9 ++++++
 arch/mips/include/asm/n64/irq.h      | 26 ++++++++++++++++
 arch/mips/n64/Makefile               |  6 ++++
 arch/mips/n64/Platform               |  7 +++++
 arch/mips/n64/init.c                 | 59 +++++++++++++++++++++++++++++++=
+++++
 arch/mips/n64/irq.c                  | 34 +++++++++++++++++++++
 8 files changed, 154 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-n64/irq.h
 create mode 100644 arch/mips/include/asm/n64/irq.h
 create mode 100644 arch/mips/n64/Makefile
 create mode 100644 arch/mips/n64/Platform
 create mode 100644 arch/mips/n64/init.c
 create mode 100644 arch/mips/n64/irq.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 5483e38..3e39590 100644
=2D-- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -18,6 +18,7 @@ platform-$(CONFIG_MACH_LOONGSON2EF)	+=3D loongson2ef/
 platform-$(CONFIG_MACH_LOONGSON32)	+=3D loongson32/
 platform-$(CONFIG_MACH_LOONGSON64)	+=3D loongson64/
 platform-$(CONFIG_MIPS_MALTA)		+=3D mti-malta/
+platform-$(CONFIG_MIPS_N64)		+=3D n64/
 platform-$(CONFIG_NLM_COMMON)		+=3D netlogic/
 platform-$(CONFIG_PIC32MZDA)		+=3D pic32/
 platform-$(CONFIG_MACH_PISTACHIO)	+=3D pistachio/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b52588..2922bb6 100644
=2D-- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -605,6 +605,18 @@ config MACH_VR41XX
 	select SYS_SUPPORTS_MIPS16
 	select GPIOLIB

+config MIPS_N64
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
index 0000000..bf5edba
=2D-- /dev/null
+++ b/arch/mips/n64/Platform
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Nintendo 64
+#
+
+cflags-$(CONFIG_MIPS_N64)    +=3D -I$(srctree)/arch/mips/include/asm/mach=
-n64
+load-$(CONFIG_MIPS_N64)      +=3D 0xffffffff80101000
diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
new file mode 100644
index 0000000..6fb622d
=2D-- /dev/null
+++ b/arch/mips/n64/init.c
@@ -0,0 +1,59 @@
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
+#include <linux/string.h>
+
+#include <asm/bootinfo.h>
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
+	int argc, i;
+	const char **argv;
+
+	argc =3D fw_arg0;
+	argv =3D (const char **)fw_arg1;
+
+	for (i =3D 1; i < argc; i++) {
+		strlcat(arcs_cmdline, argv[i], COMMAND_LINE_SIZE);
+		if (i < (argc - 1))
+			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
+	}
+}
+
+void __init prom_free_prom_memory(void)
+{
+}
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
index 0000000..3eb0079
=2D-- /dev/null
+++ b/arch/mips/n64/irq.c
@@ -0,0 +1,34 @@
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
+asmlinkage void plat_irq_dispatch(void)
+{
+	unsigned int pending =3D read_c0_cause() & read_c0_status() & ST0_IM;
+
+	if (pending & CAUSEF_IP7)
+		do_IRQ(TIMER_IRQ);
+	else if (pending & CAUSEF_IP4)
+		do_IRQ(PRENMI_IRQ);
+	else if (pending & CAUSEF_IP2)
+		do_IRQ(RCP_IRQ);
+	else if (pending & CAUSEF_IP0)
+		do_IRQ(MIPS_SOFTINT0_IRQ);
+	else if (pending & CAUSEF_IP1)
+		do_IRQ(MIPS_SOFTINT1_IRQ);
+	else
+		spurious_interrupt();
+}
+
+void __init arch_init_irq(void)
+{
+	mips_cpu_irq_init();
+}
=2D-
2.6.2

