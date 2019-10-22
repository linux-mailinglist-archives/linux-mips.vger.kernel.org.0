Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56628E0862
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 18:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389283AbfJVQNY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 12:13:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:59826 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732216AbfJVQNX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Oct 2019 12:13:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6FFBBB388;
        Tue, 22 Oct 2019 16:13:21 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] MIPS: SGI-IP27: reduce ARC usage to a minimum
Date:   Tue, 22 Oct 2019 18:13:15 +0200
Message-Id: <20191022161315.4194-5-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191022161315.4194-1-tbogendoerfer@suse.de>
References: <20191022161315.4194-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IP27 uses ARC prom only for parsing prom arguments and has a hack
for IP27 to make the ARC code behave. By introducing config symbol
ARC_CMDLINE_ONLY IP27 only drags in ARC cmdline parsing and does
everything else in IP27 specific code.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig              |  4 ++++
 arch/mips/fw/arc/Makefile      |  4 ++++
 arch/mips/fw/arc/identify.c    | 10 ----------
 arch/mips/sgi-ip27/ip27-init.c | 14 ++++++++++++++
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2ef3129cc4ad..376d0ec0d1d6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -674,6 +674,7 @@ config SGI_IP27
 	select ARCH_SPARSEMEM_ENABLE
 	select FW_ARC
 	select FW_ARC64
+	select ARC_CMDLINE_ONLY
 	select BOOT_ELF64
 	select DEFAULT_SGI_PARTITION
 	select SYS_HAS_EARLY_PRINTK
@@ -1377,6 +1378,9 @@ config MIPS_L1_CACHE_SHIFT
 config HAVE_STD_PC_SERIAL_PORT
 	bool
 
+config ARC_CMDLINE_ONLY
+	bool
+
 config ARC_CONSOLE
 	bool "ARC console support"
 	depends on SGI_IP22 || SGI_IP28 || (SNI_RM && CPU_LITTLE_ENDIAN)
diff --git a/arch/mips/fw/arc/Makefile b/arch/mips/fw/arc/Makefile
index 3cc82d7fe548..64d685efcc77 100644
--- a/arch/mips/fw/arc/Makefile
+++ b/arch/mips/fw/arc/Makefile
@@ -3,8 +3,12 @@
 # Makefile for the ARC prom monitor library routines under Linux.
 #
 
+ifdef CONFIG_ARC_CMDLINE_ONLY
+lib-y				+= cmdline.o
+else
 lib-y				+= cmdline.o env.o file.o identify.o init.o \
 				   misc.o
+endif
 
 lib-$(CONFIG_ARC_MEMORY)	+= memory.o
 lib-$(CONFIG_ARC_CONSOLE)	+= arc_con.o
diff --git a/arch/mips/fw/arc/identify.c b/arch/mips/fw/arc/identify.c
index 7530c7b2fd39..5527e0f54079 100644
--- a/arch/mips/fw/arc/identify.c
+++ b/arch/mips/fw/arc/identify.c
@@ -31,10 +31,6 @@ static struct smatch mach_table[] = {
 		.arcname	= "SGI-IP22",
 		.liname		= "SGI Indy",
 		.flags		= PROM_FLAG_ARCS,
-	}, {
-		.arcname	= "SGI-IP27",
-		.liname		= "SGI Origin",
-		.flags		= PROM_FLAG_ARCS,
 	}, {
 		.arcname	= "SGI-IP28",
 		.liname		= "SGI IP28",
@@ -103,13 +99,7 @@ void __init prom_identify_arch(void)
 	 */
 	p = ArcGetChild(PROM_NULL_COMPONENT);
 	if (p == NULL) {
-#ifdef CONFIG_SGI_IP27
-		/* IP27 PROM misbehaves, seems to not implement ARC
-		   GetChild().	So we just assume it's an IP27.	 */
-		iname = "SGI-IP27";
-#else
 		iname = "Unknown";
-#endif
 	} else
 		iname = (char *) (long) p->iname;
 
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index d160fb219d6d..971aa0d5d534 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -13,9 +13,11 @@
 #include <linux/mm.h>
 #include <linux/export.h>
 #include <linux/cpumask.h>
+#include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/io.h>
 #include <asm/pgtable.h>
+#include <asm/sgialib.h>
 #include <asm/time.h>
 #include <asm/sn/types.h>
 #include <asm/sn/sn0/addrs.h>
@@ -160,3 +162,15 @@ void __init plat_mem_setup(void)
 	ioport_resource.end = ~0UL;
 	set_io_port_base(IO_BASE);
 }
+
+const char *get_system_type(void)
+{
+	return "SGI Origin";
+}
+
+void __init prom_init(void)
+{
+	prom_init_cmdline(fw_arg0, (LONG *)fw_arg1);
+	prom_meminit();
+}
+
-- 
2.16.4

