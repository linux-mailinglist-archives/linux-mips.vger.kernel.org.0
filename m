Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E06FF262F
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 05:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733115AbfKGECA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 23:02:00 -0500
Received: from forward101o.mail.yandex.net ([37.140.190.181]:46880 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727279AbfKGECA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 23:02:00 -0500
Received: from mxback19j.mail.yandex.net (mxback19j.mail.yandex.net [IPv6:2a02:6b8:0:1619::95])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id D108A3C02E64;
        Thu,  7 Nov 2019 07:01:54 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback19j.mail.yandex.net (mxback/Yandex) with ESMTP id PcGqPhNaut-1sdqviiC;
        Thu, 07 Nov 2019 07:01:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573099314;
        bh=eDGrwuuKlf9rNCgy3N04vacXs200ybtHo0qgCqGahfY=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Ulj0r8HnGiowaf4ZBfjw5pk8cB8tk2MTE4JclAqsYSfZHLlEMsitA212/w+Fg4W8Q
         8EK/XkBKlcDWJWJcnM1obUJtQQ1N6cVqvLVCdrDZNZYqf8/Oty8HGrAxKDA+gVoj87
         GfaGOajNQm9vNjcyS7iJaphh3jB529qr6iwwh2Q8=
Authentication-Results: mxback19j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id Z8DeRIVREY-1oVmdV40;
        Thu, 07 Nov 2019 07:01:52 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/5] MIPS: Loongson{2ef, 32, 64} convert to generic fw cmdline
Date:   Thu,  7 Nov 2019 12:01:15 +0800
Message-Id: <20191107040118.10685-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
References: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All of Loongson firmwares are passing boot cmdline/env
in the manner of YAMON/PMON. Thus we can remove duplicated
cmdline initialize code and convert to generic fw method.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson2ef/loongson.h   |  1 -
 arch/mips/include/asm/mach-loongson32/prom.h  | 20 -------
 .../include/asm/mach-loongson64/loongson.h    |  1 -
 arch/mips/loongson2ef/common/Makefile         |  2 +-
 arch/mips/loongson2ef/common/cmdline.c        | 44 --------------
 arch/mips/loongson2ef/common/env.c            | 26 ++------
 arch/mips/loongson2ef/common/init.c           |  4 +-
 arch/mips/loongson32/common/prom.c            | 59 ++++---------------
 arch/mips/loongson32/common/setup.c           | 11 ++--
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/cmdline.c                | 42 -------------
 arch/mips/loongson64/init.c                   |  3 +-
 12 files changed, 28 insertions(+), 187 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson32/prom.h
 delete mode 100644 arch/mips/loongson2ef/common/cmdline.c
 delete mode 100644 arch/mips/loongson64/cmdline.c

diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
index 8ed460a64d10..622456539add 100644
--- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -25,7 +25,6 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
-extern void __init prom_init_cmdline(void);
 extern void __init prom_init_machtype(void);
 extern void __init prom_init_env(void);
 #ifdef CONFIG_LOONGSON_UART_BASE
diff --git a/arch/mips/include/asm/mach-loongson32/prom.h b/arch/mips/include/asm/mach-loongson32/prom.h
deleted file mode 100644
index cb789f18d790..000000000000
--- a/arch/mips/include/asm/mach-loongson32/prom.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#ifndef __ASM_MACH_LOONGSON32_PROM_H
-#define __ASM_MACH_LOONGSON32_PROM_H
-
-#include <linux/io.h>
-#include <linux/init.h>
-#include <linux/irq.h>
-
-/* environment arguments from bootloader */
-extern unsigned long memsize, highmemsize;
-
-/* loongson-specific command line, env and memory initialization */
-extern char *prom_getenv(char *name);
-extern void __init prom_init_cmdline(void);
-
-#endif /* __ASM_MACH_LOONGSON32_PROM_H */
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index bc00c2d88225..a8fce112a9b0 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -24,7 +24,6 @@ extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
-extern void __init prom_init_cmdline(void);
 extern void __init prom_init_env(void);
 
 /* irq operation functions */
diff --git a/arch/mips/loongson2ef/common/Makefile b/arch/mips/loongson2ef/common/Makefile
index 684624f61f5a..10dd009a20a0 100644
--- a/arch/mips/loongson2ef/common/Makefile
+++ b/arch/mips/loongson2ef/common/Makefile
@@ -3,7 +3,7 @@
 # Makefile for loongson based machines.
 #
 
-obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
+obj-y += setup.o init.o env.o time.o reset.o irq.o \
     bonito-irq.o mem.o machtype.o platform.o serial.o
 obj-$(CONFIG_PCI) += pci.o
 
diff --git a/arch/mips/loongson2ef/common/cmdline.c b/arch/mips/loongson2ef/common/cmdline.c
deleted file mode 100644
index a735460682cf..000000000000
--- a/arch/mips/loongson2ef/common/cmdline.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Based on Ocelot Linux port, which is
- * Copyright 2001 MontaVista Software Inc.
- * Author: jsun@mvista.com or jsun@junsun.net
- *
- * Copyright 2003 ICT CAS
- * Author: Michael Guo <guoyi@ict.ac.cn>
- *
- * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
- * Author: Fuxin Zhang, zhangfx@lemote.com
- *
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-
-void __init prom_init_cmdline(void)
-{
-	int prom_argc;
-	/* pmon passes arguments in 32bit pointers */
-	int *_prom_argv;
-	int i;
-	long l;
-
-	/* firmware arguments are initialized in head.S */
-	prom_argc = fw_arg0;
-	_prom_argv = (int *)fw_arg1;
-
-	/* arg[0] is "g", the rest is boot parameters */
-	arcs_cmdline[0] = '\0';
-	for (i = 1; i < prom_argc; i++) {
-		l = (long)_prom_argv[i];
-		if (strlen(arcs_cmdline) + strlen(((char *)l) + 1)
-		    >= sizeof(arcs_cmdline))
-			break;
-		strcat(arcs_cmdline, ((char *)l));
-		strcat(arcs_cmdline, " ");
-	}
-
-	prom_init_machtype();
-}
diff --git a/arch/mips/loongson2ef/common/env.c b/arch/mips/loongson2ef/common/env.c
index 29c5fecb8282..6f20bdf9b242 100644
--- a/arch/mips/loongson2ef/common/env.c
+++ b/arch/mips/loongson2ef/common/env.c
@@ -15,39 +15,21 @@
  */
 #include <linux/export.h>
 #include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
 #include <loongson.h>
 
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
 
-unsigned long long smp_group[4];
-
-#define parse_even_earlier(res, option, p)				\
-do {									\
-	unsigned int tmp __maybe_unused;				\
-									\
-	if (strncmp(option, (char *)p, strlen(option)) == 0)		\
-		tmp = kstrtou32((char *)p + strlen(option"="), 10, &res); \
-} while (0)
-
 void __init prom_init_env(void)
 {
 	/* pmon passes arguments in 32bit pointers */
 	unsigned int processor_id;
-	int *_prom_envp;
-	long l;
 
-	/* firmware arguments are initialized in head.S */
-	_prom_envp = (int *)fw_arg2;
+	cpu_clock_freq = fw_getenvl("cpuclock");
+	memsize = fw_getenvl("memsize");
+	highmemsize = fw_getenvl("highmemsize");
 
-	l = (long)*_prom_envp;
-	while (l != 0) {
-		parse_even_earlier(cpu_clock_freq, "cpuclock", l);
-		parse_even_earlier(memsize, "memsize", l);
-		parse_even_earlier(highmemsize, "highmemsize", l);
-		_prom_envp++;
-		l = (long)*_prom_envp;
-	}
 	if (memsize == 0)
 		memsize = 256;
 
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index a45430365729..dab3ffda8b14 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -9,6 +9,7 @@
 #include <asm/traps.h>
 #include <asm/smp-ops.h>
 #include <asm/cacheflush.h>
+#include <asm/fw/fw.h>
 
 #include <loongson.h>
 
@@ -32,7 +33,8 @@ void __init prom_init(void)
 		ioremap(LOONGSON_ADDRWINCFG_BASE, LOONGSON_ADDRWINCFG_SIZE);
 #endif
 
-	prom_init_cmdline();
+	fw_init_cmdline();
+	prom_init_machtype();
 	prom_init_env();
 
 	/* init base address of io space */
diff --git a/arch/mips/loongson32/common/prom.c b/arch/mips/loongson32/common/prom.c
index c4e043ee53ff..73dd25142484 100644
--- a/arch/mips/loongson32/common/prom.c
+++ b/arch/mips/loongson32/common/prom.c
@@ -5,63 +5,25 @@
  * Modified from arch/mips/pnx833x/common/prom.c.
  */
 
+#include <linux/io.h>
+#include <linux/init.h>
 #include <linux/serial_reg.h>
 #include <asm/bootinfo.h>
+#include <asm/fw/fw.h>
 
 #include <loongson1.h>
-#include <prom.h>
 
-int prom_argc;
-char **prom_argv, **prom_envp;
-unsigned long memsize, highmemsize;
-
-char *prom_getenv(char *envname)
-{
-	char **env = prom_envp;
-	int i;
-
-	i = strlen(envname);
-
-	while (*env) {
-		if (strncmp(envname, *env, i) == 0 && *(*env + i) == '=')
-			return *env + i + 1;
-		env++;
-	}
-
-	return 0;
-}
-
-static inline unsigned long env_or_default(char *env, unsigned long dfl)
-{
-	char *str = prom_getenv(env);
-	return str ? simple_strtol(str, 0, 0) : dfl;
-}
-
-void __init prom_init_cmdline(void)
-{
-	char *c = &(arcs_cmdline[0]);
-	int i;
-
-	for (i = 1; i < prom_argc; i++) {
-		strcpy(c, prom_argv[i]);
-		c += strlen(prom_argv[i]);
-		if (i < prom_argc - 1)
-			*c++ = ' ';
-	}
-	*c = 0;
-}
+unsigned long memsize;
 
 void __init prom_init(void)
 {
 	void __iomem *uart_base;
-	prom_argc = fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
 
-	prom_init_cmdline();
+	fw_init_cmdline();
 
-	memsize = env_or_default("memsize", DEFAULT_MEMSIZE);
-	highmemsize = env_or_default("highmemsize", 0x0);
+	memsize = fw_getenvl("memsize");
+	if(!memsize)
+		memsize = DEFAULT_MEMSIZE;
 
 	if (strstr(arcs_cmdline, "console=ttyS3"))
 		uart_base = ioremap_nocache(LS1X_UART3_BASE, 0x0f);
@@ -77,3 +39,8 @@ void __init prom_init(void)
 void __init prom_free_prom_memory(void)
 {
 }
+
+void __init plat_mem_setup(void)
+{
+	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
+}
diff --git a/arch/mips/loongson32/common/setup.c b/arch/mips/loongson32/common/setup.c
index 8b03e18fc4d8..4733fe037176 100644
--- a/arch/mips/loongson32/common/setup.c
+++ b/arch/mips/loongson32/common/setup.c
@@ -3,15 +3,12 @@
  * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
  */
 
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/smp.h>
+#include <asm/cpu-info.h>
 #include <asm/bootinfo.h>
 
-#include <prom.h>
-
-void __init plat_mem_setup(void)
-{
-	add_memory_region(0x0, (memsize << 20), BOOT_MEM_RAM);
-}
-
 const char *get_system_type(void)
 {
 	unsigned int processor_id = (&current_cpu_data)->processor_id;
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index 0b3c65b52965..7821891bc5d0 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Loongson-3 family machines
 #
 obj-$(CONFIG_MACH_LOONGSON64) += irq.o cop2-ex.o platform.o acpi_init.o dma.o \
-				setup.o init.o cmdline.o env.o time.o reset.o \
+				setup.o init.o env.o time.o reset.o \
 
 obj-$(CONFIG_SMP)	+= smp.o
 obj-$(CONFIG_NUMA)	+= numa.o
diff --git a/arch/mips/loongson64/cmdline.c b/arch/mips/loongson64/cmdline.c
deleted file mode 100644
index fb1644b01471..000000000000
--- a/arch/mips/loongson64/cmdline.c
+++ /dev/null
@@ -1,42 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Based on Ocelot Linux port, which is
- * Copyright 2001 MontaVista Software Inc.
- * Author: jsun@mvista.com or jsun@junsun.net
- *
- * Copyright 2003 ICT CAS
- * Author: Michael Guo <guoyi@ict.ac.cn>
- *
- * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
- * Author: Fuxin Zhang, zhangfx@lemote.com
- *
- * Copyright (C) 2009 Lemote Inc.
- * Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-#include <asm/bootinfo.h>
-
-#include <loongson.h>
-
-void __init prom_init_cmdline(void)
-{
-	int prom_argc;
-	/* pmon passes arguments in 32bit pointers */
-	int *_prom_argv;
-	int i;
-	long l;
-
-	/* firmware arguments are initialized in head.S */
-	prom_argc = fw_arg0;
-	_prom_argv = (int *)fw_arg1;
-
-	/* arg[0] is "g", the rest is boot parameters */
-	arcs_cmdline[0] = '\0';
-	for (i = 1; i < prom_argc; i++) {
-		l = (long)_prom_argv[i];
-		if (strlen(arcs_cmdline) + strlen(((char *)l) + 1)
-		    >= sizeof(arcs_cmdline))
-			break;
-		strcat(arcs_cmdline, ((char *)l));
-		strcat(arcs_cmdline, " ");
-	}
-}
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 48b44f415059..5ac1a0f35ca4 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -9,6 +9,7 @@
 #include <asm/traps.h>
 #include <asm/smp-ops.h>
 #include <asm/cacheflush.h>
+#include <asm/fw/fw.h>
 
 #include <loongson.h>
 
@@ -24,7 +25,7 @@ static void __init mips_nmi_setup(void)
 
 void __init prom_init(void)
 {
-	prom_init_cmdline();
+	fw_init_cmdline();
 	prom_init_env();
 
 	/* init base address of io space */
-- 
2.20.1

