Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70798D1009
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731437AbfJIN1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 09:27:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:47426 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731259AbfJIN1b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 09:27:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C68EEAD31;
        Wed,  9 Oct 2019 13:27:28 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] MIPS: fw: arc: remove unused ARC code
Date:   Wed,  9 Oct 2019 15:27:12 +0200
Message-Id: <20191009132718.25346-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191009132718.25346-1-tbogendoerfer@suse.de>
References: <20191009132718.25346-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Current kernel uses only a few ARC calls. Drop all unused ARC functions.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/arc/Makefile       |   2 +-
 arch/mips/fw/arc/env.c          |   6 --
 arch/mips/fw/arc/file.c         |  49 ----------------
 arch/mips/fw/arc/identify.c     |   5 ++
 arch/mips/fw/arc/misc.c         |  59 -------------------
 arch/mips/fw/arc/salone.c       |  25 --------
 arch/mips/fw/arc/time.c         |  25 --------
 arch/mips/fw/arc/tree.c         | 127 ----------------------------------------
 arch/mips/include/asm/sgialib.h |  12 ----
 9 files changed, 6 insertions(+), 304 deletions(-)
 delete mode 100644 arch/mips/fw/arc/salone.c
 delete mode 100644 arch/mips/fw/arc/time.c
 delete mode 100644 arch/mips/fw/arc/tree.c

diff --git a/arch/mips/fw/arc/Makefile b/arch/mips/fw/arc/Makefile
index 31dd7305d643..3cc82d7fe548 100644
--- a/arch/mips/fw/arc/Makefile
+++ b/arch/mips/fw/arc/Makefile
@@ -4,7 +4,7 @@
 #
 
 lib-y				+= cmdline.o env.o file.o identify.o init.o \
-				   misc.o salone.o time.o tree.o
+				   misc.o
 
 lib-$(CONFIG_ARC_MEMORY)	+= memory.o
 lib-$(CONFIG_ARC_CONSOLE)	+= arc_con.o
diff --git a/arch/mips/fw/arc/env.c b/arch/mips/fw/arc/env.c
index 1118a26b32ee..02407a7bb38e 100644
--- a/arch/mips/fw/arc/env.c
+++ b/arch/mips/fw/arc/env.c
@@ -19,9 +19,3 @@ ArcGetEnvironmentVariable(CHAR *name)
 {
 	return (CHAR *) ARC_CALL1(get_evar, name);
 }
-
-LONG __init
-ArcSetEnvironmentVariable(PCHAR name, PCHAR value)
-{
-	return ARC_CALL2(set_evar, name, value);
-}
diff --git a/arch/mips/fw/arc/file.c b/arch/mips/fw/arc/file.c
index 49fd3ff13fe5..b0d8535c80cc 100644
--- a/arch/mips/fw/arc/file.c
+++ b/arch/mips/fw/arc/file.c
@@ -12,63 +12,14 @@
 #include <asm/fw/arc/types.h>
 #include <asm/sgialib.h>
 
-LONG
-ArcGetDirectoryEntry(ULONG FileID, struct linux_vdirent *Buffer,
-		     ULONG N, ULONG *Count)
-{
-	return ARC_CALL4(get_vdirent, FileID, Buffer, N, Count);
-}
-
-LONG
-ArcOpen(CHAR *Path, enum linux_omode OpenMode, ULONG *FileID)
-{
-	return ARC_CALL3(open, Path, OpenMode, FileID);
-}
-
-LONG
-ArcClose(ULONG FileID)
-{
-	return ARC_CALL1(close, FileID);
-}
-
 LONG
 ArcRead(ULONG FileID, VOID *Buffer, ULONG N, ULONG *Count)
 {
 	return ARC_CALL4(read, FileID, Buffer, N, Count);
 }
 
-LONG
-ArcGetReadStatus(ULONG FileID)
-{
-	return ARC_CALL1(get_rstatus, FileID);
-}
-
 LONG
 ArcWrite(ULONG FileID, PVOID Buffer, ULONG N, PULONG Count)
 {
 	return ARC_CALL4(write, FileID, Buffer, N, Count);
 }
-
-LONG
-ArcSeek(ULONG FileID, struct linux_bigint *Position, enum linux_seekmode SeekMode)
-{
-	return ARC_CALL3(seek, FileID, Position, SeekMode);
-}
-
-LONG
-ArcMount(char *name, enum linux_mountops op)
-{
-	return ARC_CALL2(mount, name, op);
-}
-
-LONG
-ArcGetFileInformation(ULONG FileID, struct linux_finfo *Information)
-{
-	return ARC_CALL2(get_finfo, FileID, Information);
-}
-
-LONG ArcSetFileInformation(ULONG FileID, ULONG AttributeFlags,
-			   ULONG AttributeMask)
-{
-	return ARC_CALL3(set_finfo, FileID, AttributeFlags, AttributeMask);
-}
diff --git a/arch/mips/fw/arc/identify.c b/arch/mips/fw/arc/identify.c
index f90266c02c9d..7530c7b2fd39 100644
--- a/arch/mips/fw/arc/identify.c
+++ b/arch/mips/fw/arc/identify.c
@@ -87,6 +87,11 @@ const char *get_system_type(void)
 	return system_type;
 }
 
+static pcomponent * __init ArcGetChild(pcomponent *Current)
+{
+	return (pcomponent *) ARC_CALL1(child_component, Current);
+}
+
 void __init prom_identify_arch(void)
 {
 	pcomponent *p;
diff --git a/arch/mips/fw/arc/misc.c b/arch/mips/fw/arc/misc.c
index 19f710117d97..d5b2d5901324 100644
--- a/arch/mips/fw/arc/misc.c
+++ b/arch/mips/fw/arc/misc.c
@@ -20,47 +20,6 @@
 #include <asm/sgialib.h>
 #include <asm/bootinfo.h>
 
-VOID __noreturn
-ArcHalt(VOID)
-{
-	bc_disable();
-	local_irq_disable();
-	ARC_CALL0(halt);
-
-	unreachable();
-}
-
-VOID __noreturn
-ArcPowerDown(VOID)
-{
-	bc_disable();
-	local_irq_disable();
-	ARC_CALL0(pdown);
-
-	unreachable();
-}
-
-/* XXX is this a soft reset basically? XXX */
-VOID __noreturn
-ArcRestart(VOID)
-{
-	bc_disable();
-	local_irq_disable();
-	ARC_CALL0(restart);
-
-	unreachable();
-}
-
-VOID __noreturn
-ArcReboot(VOID)
-{
-	bc_disable();
-	local_irq_disable();
-	ARC_CALL0(reboot);
-
-	unreachable();
-}
-
 VOID __noreturn
 ArcEnterInteractiveMode(VOID)
 {
@@ -71,24 +30,6 @@ ArcEnterInteractiveMode(VOID)
 	unreachable();
 }
 
-LONG
-ArcSaveConfiguration(VOID)
-{
-	return ARC_CALL0(cfg_save);
-}
-
-struct linux_sysid *
-ArcGetSystemId(VOID)
-{
-	return (struct linux_sysid *) ARC_CALL0(get_sysid);
-}
-
-VOID __init
-ArcFlushAllCaches(VOID)
-{
-	ARC_CALL0(cache_flush);
-}
-
 DISPLAY_STATUS * __init ArcGetDisplayStatus(ULONG FileID)
 {
 	return (DISPLAY_STATUS *) ARC_CALL1(GetDisplayStatus, FileID);
diff --git a/arch/mips/fw/arc/salone.c b/arch/mips/fw/arc/salone.c
deleted file mode 100644
index 2d99f44d5576..000000000000
--- a/arch/mips/fw/arc/salone.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Routines to load into memory and execute stand-along program images using
- * ARCS PROM firmware.
- *
- * Copyright (C) 1996 David S. Miller (davem@davemloft.net)
- */
-#include <linux/init.h>
-#include <asm/sgialib.h>
-
-LONG __init ArcLoad(CHAR *Path, ULONG TopAddr, ULONG *ExecAddr, ULONG *LowAddr)
-{
-	return ARC_CALL4(load, Path, TopAddr, ExecAddr, LowAddr);
-}
-
-LONG __init ArcInvoke(ULONG ExecAddr, ULONG StackAddr, ULONG Argc, CHAR *Argv[],
-	CHAR *Envp[])
-{
-	return ARC_CALL5(invoke, ExecAddr, StackAddr, Argc, Argv, Envp);
-}
-
-LONG __init ArcExecute(CHAR *Path, LONG Argc, CHAR *Argv[], CHAR *Envp[])
-{
-	return ARC_CALL4(exec, Path, Argc, Argv, Envp);
-}
diff --git a/arch/mips/fw/arc/time.c b/arch/mips/fw/arc/time.c
deleted file mode 100644
index 190cdb50b895..000000000000
--- a/arch/mips/fw/arc/time.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Extracting time information from ARCS prom.
- *
- * Copyright (C) 1996 David S. Miller (davem@davemloft.net)
- */
-#include <linux/init.h>
-
-#include <asm/fw/arc/types.h>
-#include <asm/sgialib.h>
-
-struct linux_tinfo * __init
-ArcGetTime(VOID)
-{
-	return (struct linux_tinfo *) ARC_CALL0(get_tinfo);
-}
-
-ULONG __init
-ArcGetRelativeTime(VOID)
-{
-	return ARC_CALL0(get_rtime);
-}
diff --git a/arch/mips/fw/arc/tree.c b/arch/mips/fw/arc/tree.c
deleted file mode 100644
index 924a37dc2569..000000000000
--- a/arch/mips/fw/arc/tree.c
+++ /dev/null
@@ -1,127 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * PROM component device tree code.
- *
- * Copyright (C) 1996 David S. Miller (davem@davemloft.net)
- * Copyright (C) 1999 Ralf Baechle (ralf@gnu.org)
- * Copyright (C) 1999 Silicon Graphics, Inc.
- */
-#include <linux/init.h>
-#include <asm/fw/arc/types.h>
-#include <asm/sgialib.h>
-
-#undef DEBUG_PROM_TREE
-
-pcomponent * __init
-ArcGetPeer(pcomponent *Current)
-{
-	if (Current == PROM_NULL_COMPONENT)
-		return PROM_NULL_COMPONENT;
-
-	return (pcomponent *) ARC_CALL1(next_component, Current);
-}
-
-pcomponent * __init
-ArcGetChild(pcomponent *Current)
-{
-	return (pcomponent *) ARC_CALL1(child_component, Current);
-}
-
-pcomponent * __init
-ArcGetParent(pcomponent *Current)
-{
-	if (Current == PROM_NULL_COMPONENT)
-		return PROM_NULL_COMPONENT;
-
-	return (pcomponent *) ARC_CALL1(parent_component, Current);
-}
-
-LONG __init
-ArcGetConfigurationData(VOID *Buffer, pcomponent *Current)
-{
-	return ARC_CALL2(component_data, Buffer, Current);
-}
-
-pcomponent * __init
-ArcAddChild(pcomponent *Current, pcomponent *Template, VOID *ConfigurationData)
-{
-	return (pcomponent *)
-	       ARC_CALL3(child_add, Current, Template, ConfigurationData);
-}
-
-LONG __init
-ArcDeleteComponent(pcomponent *ComponentToDelete)
-{
-	return ARC_CALL1(comp_del, ComponentToDelete);
-}
-
-pcomponent * __init
-ArcGetComponent(CHAR *Path)
-{
-	return (pcomponent *)ARC_CALL1(component_by_path, Path);
-}
-
-#ifdef DEBUG_PROM_TREE
-
-static char *classes[] = {
-	"system", "processor", "cache", "adapter", "controller", "peripheral",
-	"memory"
-};
-
-static char *types[] = {
-	"arc", "cpu", "fpu", "picache", "pdcache", "sicache", "sdcache",
-	"sccache", "memdev", "eisa adapter", "tc adapter", "scsi adapter",
-	"dti adapter", "multi-func adapter", "disk controller",
-	"tp controller", "cdrom controller", "worm controller",
-	"serial controller", "net controller", "display controller",
-	"parallel controller", "pointer controller", "keyboard controller",
-	"audio controller", "misc controller", "disk peripheral",
-	"floppy peripheral", "tp peripheral", "modem peripheral",
-	"monitor peripheral", "printer peripheral", "pointer peripheral",
-	"keyboard peripheral", "terminal peripheral", "line peripheral",
-	"net peripheral", "misc peripheral", "anonymous"
-};
-
-static char *iflags[] = {
-	"bogus", "read only", "removable", "console in", "console out",
-	"input", "output"
-};
-
-static void __init
-dump_component(pcomponent *p)
-{
-	printk("[%p]:class<%s>type<%s>flags<%s>ver<%d>rev<%d>",
-	       p, classes[p->class], types[p->type],
-	       iflags[p->iflags], p->vers, p->rev);
-	printk("key<%08lx>\n\tamask<%08lx>cdsize<%d>ilen<%d>iname<%s>\n",
-	       p->key, p->amask, (int)p->cdsize, (int)p->ilen, p->iname);
-}
-
-static void __init
-traverse(pcomponent *p, int op)
-{
-	dump_component(p);
-	if(ArcGetChild(p))
-		traverse(ArcGetChild(p), 1);
-	if(ArcGetPeer(p) && op)
-		traverse(ArcGetPeer(p), 1);
-}
-
-void __init
-prom_testtree(void)
-{
-	pcomponent *p;
-
-	p = ArcGetChild(PROM_NULL_COMPONENT);
-	dump_component(p);
-	p = ArcGetChild(p);
-	while(p) {
-		dump_component(p);
-		p = ArcGetPeer(p);
-	}
-}
-
-#endif /* DEBUG_PROM_TREE  */
diff --git a/arch/mips/include/asm/sgialib.h b/arch/mips/include/asm/sgialib.h
index 0d9fad5915fe..21d17eb25ed8 100644
--- a/arch/mips/include/asm/sgialib.h
+++ b/arch/mips/include/asm/sgialib.h
@@ -47,12 +47,6 @@ extern void prom_meminit(void);
 /* PROM device tree library routines. */
 #define PROM_NULL_COMPONENT ((pcomponent *) 0)
 
-/* Get sibling component of THIS. */
-extern pcomponent *ArcGetPeer(pcomponent *this);
-
-/* Get child component of THIS. */
-extern pcomponent *ArcGetChild(pcomponent *this);
-
 /* This is called at prom_init time to identify the
  * ARC architecture we are running on
  */
@@ -60,7 +54,6 @@ extern void prom_identify_arch(void);
 
 /* Environment variable routines. */
 extern PCHAR ArcGetEnvironmentVariable(PCHAR name);
-extern LONG ArcSetEnvironmentVariable(PCHAR name, PCHAR value);
 
 /* ARCS command line parsing. */
 extern void prom_init_cmdline(void);
@@ -70,12 +63,7 @@ extern LONG ArcRead(ULONG fd, PVOID buf, ULONG num, PULONG cnt);
 extern LONG ArcWrite(ULONG fd, PVOID buf, ULONG num, PULONG cnt);
 
 /* Misc. routines. */
-extern VOID ArcHalt(VOID) __noreturn;
-extern VOID ArcPowerDown(VOID) __noreturn;
-extern VOID ArcRestart(VOID) __noreturn;
-extern VOID ArcReboot(VOID) __noreturn;
 extern VOID ArcEnterInteractiveMode(VOID) __noreturn;
-extern VOID ArcFlushAllCaches(VOID);
 extern DISPLAY_STATUS *ArcGetDisplayStatus(ULONG FileID);
 
 #endif /* _ASM_SGIALIB_H */
-- 
2.16.4

