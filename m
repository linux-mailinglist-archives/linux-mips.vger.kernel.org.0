Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313BF305D26
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 14:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238293AbhA0N15 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 08:27:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:43930 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238266AbhA0NZU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 08:25:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3A502ABDA;
        Wed, 27 Jan 2021 13:24:38 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] MIPS: of: Introduce helper function to get DTB
Date:   Wed, 27 Jan 2021 14:24:30 +0100
Message-Id: <20210127132431.143374-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Selection of the DTB to be used was burried in more or less readable
code in head.S. Move this code into a inline helper function and
use it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/ath79/setup.c               | 13 +++++------
 arch/mips/bmips/setup.c               |  7 +++---
 arch/mips/generic/init.c              |  5 ++---
 arch/mips/include/asm/bootinfo.h      | 22 ++++++++++++++++++-
 arch/mips/include/asm/octeon/octeon.h |  1 -
 arch/mips/kernel/head.S               | 31 ---------------------------
 arch/mips/kernel/setup.c              |  4 ----
 arch/mips/lantiq/prom.c               |  7 ++----
 arch/mips/pic32/pic32mzda/init.c      | 15 +------------
 arch/mips/ralink/of.c                 | 11 +++-------
 10 files changed, 39 insertions(+), 77 deletions(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 7e7bf9c2ad26..891f495c4c3c 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -213,16 +213,17 @@ unsigned int get_c0_compare_int(void)
 
 void __init plat_mem_setup(void)
 {
-	unsigned long fdt_start;
+	void *dtb;
 
 	set_io_port_base(KSEG1);
 
 	/* Get the position of the FDT passed by the bootloader */
-	fdt_start = fw_getenvl("fdt_start");
-	if (fdt_start)
-		__dt_setup_arch((void *)KSEG0ADDR(fdt_start));
-	else if (fw_passed_dtb)
-		__dt_setup_arch((void *)KSEG0ADDR(fw_passed_dtb));
+	dtb = (void *)fw_getenvl("fdt_start");
+	if (dtb == NULL)
+		dtb = get_fdt();
+
+	if (dtb)
+		__dt_setup_arch((void *)KSEG0ADDR(dtb));
 
 	ath79_reset_base = ioremap(AR71XX_RESET_BASE,
 					   AR71XX_RESET_SIZE);
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 10e31d91ca8f..95f8f10d8697 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -161,11 +161,10 @@ void __init plat_mem_setup(void)
 	/* intended to somewhat resemble ARM; see Documentation/arm/booting.rst */
 	if (fw_arg0 == 0 && fw_arg1 == 0xffffffff)
 		dtb = phys_to_virt(fw_arg2);
-	else if (fw_passed_dtb) /* UHI interface or appended dtb */
-		dtb = (void *)fw_passed_dtb;
-	else if (&__dtb_start != &__dtb_end)
-		dtb = (void *)__dtb_start;
 	else
+		dtb = get_fdt();
+
+	if (!dtb)
 		panic("no dtb found");
 
 	__dt_setup_arch(dtb);
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 68763fcde1d0..1842cddd8356 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -39,14 +39,13 @@ void __init *plat_get_fdt(void)
 		/* Already set up */
 		return (void *)fdt;
 
-	if (fw_passed_dtb && !fdt_check_header((void *)fw_passed_dtb)) {
+	fdt = (void *)get_fdt();
+	if (fdt && !fdt_check_header(fdt)) {
 		/*
 		 * We have been provided with the appropriate device tree for
 		 * the board. Make use of it & search for any machine struct
 		 * based upon the root compatible string.
 		 */
-		fdt = (void *)fw_passed_dtb;
-
 		for_each_mips_machine(check_mach) {
 			match = mips_machine_is_compatible(check_mach, fdt);
 			if (match) {
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index aa03b1237155..5be10ece3ef0 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -112,7 +112,27 @@ extern char arcs_cmdline[COMMAND_LINE_SIZE];
 extern unsigned long fw_arg0, fw_arg1, fw_arg2, fw_arg3;
 
 #ifdef CONFIG_USE_OF
-extern unsigned long fw_passed_dtb;
+#include <linux/libfdt.h>
+#include <linux/of_fdt.h>
+
+extern char __appended_dtb[];
+
+static inline void *get_fdt(void)
+{
+	if (IS_ENABLED(CONFIG_MIPS_RAW_APPENDED_DTB) ||
+	    IS_ENABLED(CONFIG_MIPS_ELF_APPENDED_DTB))
+		if (fdt_magic(&__appended_dtb) == FDT_MAGIC)
+			return &__appended_dtb;
+
+	if (fw_arg0 == -2) /* UHI interface */
+		return (void *)fw_arg1;
+
+	if (IS_ENABLED(CONFIG_BUILTIN_DTB))
+		if (&__dtb_start != &__dtb_end)
+			return &__dtb_start;
+
+	return NULL;
+}
 #endif
 
 /*
diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 08d48f37c046..7e714aefc76d 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -282,7 +282,6 @@ union octeon_cvmemctl {
 extern void octeon_check_cpu_bist(void);
 
 int octeon_prune_device_tree(void);
-extern const char __appended_dtb;
 extern const char __dtb_octeon_3xxx_begin;
 extern const char __dtb_octeon_68xx_begin;
 
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 61b73580b877..b825ed4476c7 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -93,33 +93,6 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	jr	t0
 0:
 
-#ifdef CONFIG_USE_OF
-#if defined(CONFIG_MIPS_RAW_APPENDED_DTB) || \
-	defined(CONFIG_MIPS_ELF_APPENDED_DTB)
-
-	PTR_LA		t2, __appended_dtb
-
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	li		t1, 0xd00dfeed
-#else  /* !CONFIG_CPU_BIG_ENDIAN */
-	li		t1, 0xedfe0dd0
-#endif /* !CONFIG_CPU_BIG_ENDIAN */
-	lw		t0, (t2)
-	beq		t0, t1, dtb_found
-#endif /* CONFIG_MIPS_RAW_APPENDED_DTB || CONFIG_MIPS_ELF_APPENDED_DTB */
-	li		t1, -2
-	move		t2, a1
-	beq		a0, t1, dtb_found
-
-#ifdef CONFIG_BUILTIN_DTB
-	PTR_LA	t2, __dtb_start
-	PTR_LA	t1, __dtb_end
-	bne		t1, t2, dtb_found
-#endif /* CONFIG_BUILTIN_DTB */
-
-	li		t2, 0
-dtb_found:
-#endif /* CONFIG_USE_OF */
 	PTR_LA		t0, __bss_start		# clear .bss
 	LONG_S		zero, (t0)
 	PTR_LA		t1, __bss_stop - LONGSIZE
@@ -133,10 +106,6 @@ dtb_found:
 	LONG_S		a2, fw_arg2
 	LONG_S		a3, fw_arg3
 
-#ifdef CONFIG_USE_OF
-	LONG_S		t2, fw_passed_dtb
-#endif
-
 	MTC0		zero, CP0_CONTEXT	# clear context register
 #ifdef CONFIG_64BIT
 	MTC0		zero, CP0_XCONTEXT
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e277437..3785c72bc3bc 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -792,10 +792,6 @@ void __init setup_arch(char **cmdline_p)
 unsigned long kernelsp[NR_CPUS];
 unsigned long fw_arg0, fw_arg1, fw_arg2, fw_arg3;
 
-#ifdef CONFIG_USE_OF
-unsigned long fw_passed_dtb;
-#endif
-
 #ifdef CONFIG_DEBUG_FS
 struct dentry *mips_debugfs_dir;
 static int __init debugfs_mips(void)
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 363937121617..bc9f58fcbdf9 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -73,11 +73,8 @@ void __init plat_mem_setup(void)
 
 	set_io_port_base((unsigned long) KSEG1);
 
-	if (fw_passed_dtb) /* UHI interface */
-		dtb = (void *)fw_passed_dtb;
-	else if (&__dtb_start != &__dtb_end)
-		dtb = (void *)__dtb_start;
-	else
+	dtb = get_fdt();
+	if (dtb == NULL)
 		panic("no dtb found");
 
 	/*
diff --git a/arch/mips/pic32/pic32mzda/init.c b/arch/mips/pic32/pic32mzda/init.c
index 1897aa863573..764f2d022fae 100644
--- a/arch/mips/pic32/pic32mzda/init.c
+++ b/arch/mips/pic32/pic32mzda/init.c
@@ -21,24 +21,11 @@ const char *get_system_type(void)
 	return "PIC32MZDA";
 }
 
-static ulong get_fdtaddr(void)
-{
-	ulong ftaddr = 0;
-
-	if (fw_passed_dtb && !fw_arg2 && !fw_arg3)
-		return (ulong)fw_passed_dtb;
-
-	if (&__dtb_start < &__dtb_end)
-		ftaddr = (ulong)__dtb_start;
-
-	return ftaddr;
-}
-
 void __init plat_mem_setup(void)
 {
 	void *dtb;
 
-	dtb = (void *)get_fdtaddr();
+	dtb = get_fdt();
 	if (!dtb) {
 		pr_err("pic32: no DTB found.\n");
 		return;
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 2c9af61efc20..8286c3521476 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -64,20 +64,15 @@ static int __init early_init_dt_find_memory(unsigned long node,
 
 void __init plat_mem_setup(void)
 {
-	void *dtb = NULL;
+	void *dtb;
 
 	set_io_port_base(KSEG1);
 
 	/*
 	 * Load the builtin devicetree. This causes the chosen node to be
-	 * parsed resulting in our memory appearing. fw_passed_dtb is used
-	 * by CONFIG_MIPS_APPENDED_RAW_DTB as well.
+	 * parsed resulting in our memory appearing.
 	 */
-	if (fw_passed_dtb)
-		dtb = (void *)fw_passed_dtb;
-	else if (&__dtb_start != &__dtb_end)
-		dtb = (void *)__dtb_start;
-
+	dtb = get_fdt();
 	__dt_setup_arch(dtb);
 
 	of_scan_flat_dt(early_init_dt_find_memory, NULL);
-- 
2.29.2

