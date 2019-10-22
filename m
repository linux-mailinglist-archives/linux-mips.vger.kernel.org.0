Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D54E0869
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 18:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389288AbfJVQNY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 12:13:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:59806 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732215AbfJVQNX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Oct 2019 12:13:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2CFB2B386;
        Tue, 22 Oct 2019 16:13:21 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] MIPS: arc: use function argument for passing argc/argv to prom_init_cmdline
Date:   Tue, 22 Oct 2019 18:13:14 +0200
Message-Id: <20191022161315.4194-4-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191022161315.4194-1-tbogendoerfer@suse.de>
References: <20191022161315.4194-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

prom_argc and prom_argv are only used by prom_init_cmdline(), so
we could pass them directly as function argument.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/arc/cmdline.c      | 16 +++++++++++-----
 arch/mips/fw/arc/init.c         |  7 +------
 arch/mips/include/asm/sgialib.h |  9 +--------
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/mips/fw/arc/cmdline.c b/arch/mips/fw/arc/cmdline.c
index c0122a1dc587..155c5e911723 100644
--- a/arch/mips/fw/arc/cmdline.c
+++ b/arch/mips/fw/arc/cmdline.c
@@ -17,6 +17,12 @@
 
 #undef DEBUG_CMDLINE
 
+/*
+ * A 32-bit ARC PROM pass arguments and environment as 32-bit pointer.
+ * These macro take care of sign extension.
+ */
+#define prom_argv(index) ((char *) (long)argv[(index)])
+
 static char *ignored[] = {
 	"ConsoleIn=",
 	"ConsoleOut=",
@@ -32,14 +38,14 @@ static char *used_arc[][2] = {
 	{ "OSLoadOptions=", "" }
 };
 
-static char * __init move_firmware_args(char* cp)
+static char __init *move_firmware_args(int argc, LONG *argv, char *cp)
 {
 	char *s;
 	int actr, i;
 
 	actr = 1; /* Always ignore argv[0] */
 
-	while (actr < prom_argc) {
+	while (actr < argc) {
 		for(i = 0; i < ARRAY_SIZE(used_arc); i++) {
 			int len = strlen(used_arc[i][0]);
 
@@ -64,7 +70,7 @@ static char * __init move_firmware_args(char* cp)
 	return cp;
 }
 
-void __init prom_init_cmdline(void)
+void __init prom_init_cmdline(int argc, LONG *argv)
 {
 	char *cp;
 	int actr, i;
@@ -76,9 +82,9 @@ void __init prom_init_cmdline(void)
 	 * Move ARC variables to the beginning to make sure they can be
 	 * overridden by later arguments.
 	 */
-	cp = move_firmware_args(cp);
+	cp = move_firmware_args(argc, argv, cp);
 
-	while (actr < prom_argc) {
+	while (actr < argc) {
 		for (i = 0; i < ARRAY_SIZE(ignored); i++) {
 			int len = strlen(ignored[i]);
 
diff --git a/arch/mips/fw/arc/init.c b/arch/mips/fw/arc/init.c
index c713292462aa..f9d1dea9b2ca 100644
--- a/arch/mips/fw/arc/init.c
+++ b/arch/mips/fw/arc/init.c
@@ -18,8 +18,6 @@
 
 /* Master romvec interface. */
 struct linux_romvec *romvec;
-int prom_argc;
-LONG *_prom_argv;
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_FW_ARC32)
 /* stack for calling 32bit ARC prom */
@@ -32,9 +30,6 @@ void __init prom_init(void)
 
 	romvec = ROMVECTOR;
 
-	prom_argc = fw_arg0;
-	_prom_argv = (LONG *) fw_arg1;
-
 	if (pb->magic != 0x53435241) {
 		printk(KERN_CRIT "Aieee, bad prom vector magic %08lx\n",
 		       (unsigned long) pb->magic);
@@ -42,7 +37,7 @@ void __init prom_init(void)
 			;
 	}
 
-	prom_init_cmdline();
+	prom_init_cmdline(fw_arg0, (LONG *)fw_arg1);
 	prom_identify_arch();
 	printk(KERN_INFO "PROMLIB: ARC firmware Version %d Revision %d\n",
 	       pb->ver, pb->rev);
diff --git a/arch/mips/include/asm/sgialib.h b/arch/mips/include/asm/sgialib.h
index 40ab4ef0b1dc..80f900417f7e 100644
--- a/arch/mips/include/asm/sgialib.h
+++ b/arch/mips/include/asm/sgialib.h
@@ -15,13 +15,6 @@
 #include <asm/sgiarcs.h>
 
 extern struct linux_romvec *romvec;
-extern int prom_argc;
-
-extern LONG *_prom_argv;
-
-/* A 32-bit ARC PROM pass arguments and environment as 32-bit pointer.
-   These macros take care of sign extension.  */
-#define prom_argv(index) ((char *) (long) _prom_argv[(index)])
 
 extern int prom_flags;
 
@@ -55,7 +48,7 @@ extern void prom_identify_arch(void);
 extern PCHAR ArcGetEnvironmentVariable(PCHAR name);
 
 /* ARCS command line parsing. */
-extern void prom_init_cmdline(void);
+extern void prom_init_cmdline(int argc, LONG *argv);
 
 /* File operations. */
 extern LONG ArcRead(ULONG fd, PVOID buf, ULONG num, PULONG cnt);
-- 
2.16.4

