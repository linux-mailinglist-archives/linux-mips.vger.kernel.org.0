Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8872D22E17D
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 18:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgGZQ7O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 12:59:14 -0400
Received: from crapouillou.net ([89.234.176.41]:59410 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgGZQ7O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 12:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595782746; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N9GAC2DLcqdUF2lLO8fmo4eBw5aIcCgyoAu7x4VF3+o=;
        b=Nij7KgRMLQ90I0QzugP98GUNVTVST9RpANFjsTOz9WwljbqmyCuOw504pfiWYdBEO0AWIj
        XADPu9edinNspBNh83bchRub6oHbWs60Yc9Tig2tA+thuHb+ImnwwB7LQpmgH4zgNOSc8f
        +FN+qUyFhffKDfqyM0unL1iCHujSCtg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MIPS: Remove legacy MIPS_MACHINE option
Date:   Sun, 26 Jul 2020 18:58:28 +0200
Message-Id: <20200726165828.55175-2-paul@crapouillou.net>
In-Reply-To: <20200726165828.55175-1-paul@crapouillou.net>
References: <20200726165828.55175-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The CONFIG_MIPS_MACHINE option is dead code that hasn't been used in
years. The Kconfig option is not selected anywhere, and the
<asm/mips_machine.h> is not included anywhere either.

To make things worse, for years it co-existed with a separate MIPS
machine implementation as <asm/machine.h>. The two defined the
'mips_machine' structure with different fields, and the 'MIPS_MACHINE'
macro with different parameters. The two used the same memory area
(defined by the linker script) to store data, and you could totally use
the two at the same time for all kinds of funny results.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig                    |  3 --
 arch/mips/include/asm/mips_machine.h | 46 ---------------------
 arch/mips/kernel/Makefile            |  1 -
 arch/mips/kernel/mips_machine.c      | 62 ----------------------------
 4 files changed, 112 deletions(-)
 delete mode 100644 arch/mips/include/asm/mips_machine.h
 delete mode 100644 arch/mips/kernel/mips_machine.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..d3d4f4e093f0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1169,9 +1169,6 @@ config MIPS_MSC
 config SYNC_R4K
 	bool
 
-config MIPS_MACHINE
-	def_bool n
-
 config NO_IOPORT_MAP
 	def_bool n
 
diff --git a/arch/mips/include/asm/mips_machine.h b/arch/mips/include/asm/mips_machine.h
deleted file mode 100644
index 4efecb70c24e..000000000000
--- a/arch/mips/include/asm/mips_machine.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  Copyright (C) 2008-2010 Gabor Juhos <juhosg@openwrt.org>
- */
-
-#ifndef __ASM_MIPS_MACHINE_H
-#define __ASM_MIPS_MACHINE_H
-
-#include <linux/init.h>
-#include <linux/stddef.h>
-
-#include <asm/bootinfo.h>
-
-struct mips_machine {
-	unsigned long		mach_type;
-	const char		*mach_id;
-	const char		*mach_name;
-	void			(*mach_setup)(void);
-};
-
-#define MIPS_MACHINE(_type, _id, _name, _setup)			\
-static const char machine_name_##_type[] __initconst		\
-			__aligned(1) = _name;			\
-static const char machine_id_##_type[] __initconst		\
-			__aligned(1) = _id;			\
-static struct mips_machine machine_##_type			\
-		__used __section(.mips.machines.init) =		\
-{								\
-	.mach_type	= _type,				\
-	.mach_id	= machine_id_##_type,			\
-	.mach_name	= machine_name_##_type,			\
-	.mach_setup	= _setup,				\
-};
-
-extern long __mips_machines_start;
-extern long __mips_machines_end;
-
-#ifdef CONFIG_MIPS_MACHINE
-int  mips_machtype_setup(char *id) __init;
-void mips_machine_setup(void) __init;
-#else
-static inline int mips_machtype_setup(char *id) { return 1; }
-static inline void mips_machine_setup(void) { }
-#endif /* CONFIG_MIPS_MACHINE */
-
-#endif /* __ASM_MIPS_MACHINE_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 8c7a043295ed..13a26d254829 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -93,7 +93,6 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 obj-$(CONFIG_EARLY_PRINTK_8250)	+= early_printk_8250.o
 obj-$(CONFIG_SPINLOCK_TEST)	+= spinlock_test.o
-obj-$(CONFIG_MIPS_MACHINE)	+= mips_machine.o
 obj-$(CONFIG_MIPSR2_TO_R6_EMULATOR)	+= mips-r2-to-r6-emul.o
 
 CFLAGS_cpu-bugs64.o	= $(shell if $(CC) $(KBUILD_CFLAGS) -Wa,-mdaddi -c -o /dev/null -x c /dev/null >/dev/null 2>&1; then echo "-DHAVE_AS_SET_DADDI"; fi)
diff --git a/arch/mips/kernel/mips_machine.c b/arch/mips/kernel/mips_machine.c
deleted file mode 100644
index 4c509641723c..000000000000
--- a/arch/mips/kernel/mips_machine.c
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2008-2010 Gabor Juhos <juhosg@openwrt.org>
- */
-#include <linux/mm.h>
-#include <linux/string.h>
-#include <linux/slab.h>
-
-#include <asm/mips_machine.h>
-#include <asm/prom.h>
-
-static struct mips_machine *mips_machine __initdata;
-
-#define for_each_machine(mach) \
-	for ((mach) = (struct mips_machine *)&__mips_machines_start; \
-	     (mach) && \
-	     (unsigned long)(mach) < (unsigned long)&__mips_machines_end; \
-	     (mach)++)
-
-__init int mips_machtype_setup(char *id)
-{
-	struct mips_machine *mach;
-
-	for_each_machine(mach) {
-		if (mach->mach_id == NULL)
-			continue;
-
-		if (strcmp(mach->mach_id, id) == 0) {
-			mips_machtype = mach->mach_type;
-			return 0;
-		}
-	}
-
-	pr_err("MIPS: no machine found for id '%s', supported machines:\n", id);
-	pr_err("%-24s %s\n", "id", "name");
-	for_each_machine(mach)
-		pr_err("%-24s %s\n", mach->mach_id, mach->mach_name);
-
-	return 1;
-}
-
-__setup("machtype=", mips_machtype_setup);
-
-__init void mips_machine_setup(void)
-{
-	struct mips_machine *mach;
-
-	for_each_machine(mach) {
-		if (mips_machtype == mach->mach_type) {
-			mips_machine = mach;
-			break;
-		}
-	}
-
-	if (!mips_machine)
-		return;
-
-	mips_set_machine_name(mips_machine->mach_name);
-
-	if (mips_machine->mach_setup)
-		mips_machine->mach_setup();
-}
-- 
2.27.0

