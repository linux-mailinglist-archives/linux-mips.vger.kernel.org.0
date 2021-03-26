Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEAF234ACD1
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 17:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhCZQsa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 12:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhCZQsO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 12:48:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1A6C0613AA
        for <linux-mips@vger.kernel.org>; Fri, 26 Mar 2021 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=zqITNKbzzfrnYJAa38ZN+PRoTdtxwRPF1pnSou7m/p8=; b=hL+Ue07K8btchdrgRTvwCl44Tf
        XlZ85Ci663eqs1ZhiX1+TV1HHwjT5G645FGa+NEUdaCoYPrZcWpZ16bt3hpqZJ3F05bHlHUALj+8j
        /od/P3OzEQJUNR6Xv41GphwLE8kBlxbB6H6pH+1u4xmF8SvWgqwhd0zsVNeXxPK4JfvlgZwMIOVha
        oK79SbnrS9kQPonM2WCxXyniGb1eFylYojzWSnw7rwRwoJKl3LbySwMSI4WXTJC7fpSTC+oxsmFGk
        G11Z5tMHf1RD1gSgPcygOaUen7Y2I/4uToPXXqyIVVanTLs+OHTj+kCwKvmfeziMH4bITY6DUytDX
        gCMzBP5A==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPpd5-0004ur-FH; Fri, 26 Mar 2021 18:48:12 +0200
Received: by ubuntu (sSMTP sendmail emulation); Fri, 26 Mar 2021 18:48:11 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de
Subject: [PATCH v2 1/1] Revert "MIPS: of: Introduce helper function to get DTB"
Date:   Fri, 26 Mar 2021 18:46:45 +0200
Message-Id: <20210326164645.433147-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326164645.433147-1-sandberg@mailfence.com>
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210326164645.433147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ath79 does not compile if CONFIG_MIPS_ELF_APPENDED_DTB is enabled. Simple
removal of 'const' fixes compilation but booting a device is stopped
short.

This reverts commit b83ba0b9df56f8404ccc6ebcc7050fb8294f0f20.

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 arch/mips/ath79/setup.c               | 13 ++++++-----
 arch/mips/bmips/setup.c               |  7 +++---
 arch/mips/generic/init.c              |  5 +++--
 arch/mips/include/asm/bootinfo.h      | 22 +------------------
 arch/mips/include/asm/octeon/octeon.h |  1 +
 arch/mips/kernel/head.S               | 31 +++++++++++++++++++++++++++
 arch/mips/kernel/setup.c              |  4 ++++
 arch/mips/lantiq/prom.c               |  7 ++++--
 arch/mips/pic32/pic32mzda/init.c      | 15 ++++++++++++-
 arch/mips/ralink/of.c                 | 11 +++++++---
 10 files changed, 77 insertions(+), 39 deletions(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 891f495c4c3c..7e7bf9c2ad26 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -213,17 +213,16 @@ unsigned int get_c0_compare_int(void)
 
 void __init plat_mem_setup(void)
 {
-	void *dtb;
+	unsigned long fdt_start;
 
 	set_io_port_base(KSEG1);
 
 	/* Get the position of the FDT passed by the bootloader */
-	dtb = (void *)fw_getenvl("fdt_start");
-	if (dtb == NULL)
-		dtb = get_fdt();
-
-	if (dtb)
-		__dt_setup_arch((void *)KSEG0ADDR(dtb));
+	fdt_start = fw_getenvl("fdt_start");
+	if (fdt_start)
+		__dt_setup_arch((void *)KSEG0ADDR(fdt_start));
+	else if (fw_passed_dtb)
+		__dt_setup_arch((void *)KSEG0ADDR(fw_passed_dtb));
 
 	ath79_reset_base = ioremap(AR71XX_RESET_BASE,
 					   AR71XX_RESET_SIZE);
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 31bcfa4e08b9..7392edbd19e7 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -161,10 +161,11 @@ void __init plat_mem_setup(void)
 	/* intended to somewhat resemble ARM; see Documentation/arm/booting.rst */
 	if (fw_arg0 == 0 && fw_arg1 == 0xffffffff)
 		dtb = phys_to_virt(fw_arg2);
+	else if (fw_passed_dtb) /* UHI interface or appended dtb */
+		dtb = (void *)fw_passed_dtb;
+	else if (&__dtb_start != &__dtb_end)
+		dtb = (void *)__dtb_start;
 	else
-		dtb = get_fdt();
-
-	if (!dtb)
 		panic("no dtb found");
 
 	__dt_setup_arch(dtb);
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 1842cddd8356..68763fcde1d0 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -39,13 +39,14 @@ void __init *plat_get_fdt(void)
 		/* Already set up */
 		return (void *)fdt;
 
-	fdt = (void *)get_fdt();
-	if (fdt && !fdt_check_header(fdt)) {
+	if (fw_passed_dtb && !fdt_check_header((void *)fw_passed_dtb)) {
 		/*
 		 * We have been provided with the appropriate device tree for
 		 * the board. Make use of it & search for any machine struct
 		 * based upon the root compatible string.
 		 */
+		fdt = (void *)fw_passed_dtb;
+
 		for_each_mips_machine(check_mach) {
 			match = mips_machine_is_compatible(check_mach, fdt);
 			if (match) {
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 5be10ece3ef0..aa03b1237155 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -112,27 +112,7 @@ extern char arcs_cmdline[COMMAND_LINE_SIZE];
 extern unsigned long fw_arg0, fw_arg1, fw_arg2, fw_arg3;
 
 #ifdef CONFIG_USE_OF
-#include <linux/libfdt.h>
-#include <linux/of_fdt.h>
-
-extern char __appended_dtb[];
-
-static inline void *get_fdt(void)
-{
-	if (IS_ENABLED(CONFIG_MIPS_RAW_APPENDED_DTB) ||
-	    IS_ENABLED(CONFIG_MIPS_ELF_APPENDED_DTB))
-		if (fdt_magic(&__appended_dtb) == FDT_MAGIC)
-			return &__appended_dtb;
-
-	if (fw_arg0 == -2) /* UHI interface */
-		return (void *)fw_arg1;
-
-	if (IS_ENABLED(CONFIG_BUILTIN_DTB))
-		if (&__dtb_start != &__dtb_end)
-			return &__dtb_start;
-
-	return NULL;
-}
+extern unsigned long fw_passed_dtb;
 #endif
 
 /*
diff --git a/arch/mips/include/asm/octeon/octeon.h b/arch/mips/include/asm/octeon/octeon.h
index 7e714aefc76d..08d48f37c046 100644
--- a/arch/mips/include/asm/octeon/octeon.h
+++ b/arch/mips/include/asm/octeon/octeon.h
@@ -282,6 +282,7 @@ union octeon_cvmemctl {
 extern void octeon_check_cpu_bist(void);
 
 int octeon_prune_device_tree(void);
+extern const char __appended_dtb;
 extern const char __dtb_octeon_3xxx_begin;
 extern const char __dtb_octeon_68xx_begin;
 
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index b825ed4476c7..61b73580b877 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -93,6 +93,33 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	jr	t0
 0:
 
+#ifdef CONFIG_USE_OF
+#if defined(CONFIG_MIPS_RAW_APPENDED_DTB) || \
+	defined(CONFIG_MIPS_ELF_APPENDED_DTB)
+
+	PTR_LA		t2, __appended_dtb
+
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	li		t1, 0xd00dfeed
+#else  /* !CONFIG_CPU_BIG_ENDIAN */
+	li		t1, 0xedfe0dd0
+#endif /* !CONFIG_CPU_BIG_ENDIAN */
+	lw		t0, (t2)
+	beq		t0, t1, dtb_found
+#endif /* CONFIG_MIPS_RAW_APPENDED_DTB || CONFIG_MIPS_ELF_APPENDED_DTB */
+	li		t1, -2
+	move		t2, a1
+	beq		a0, t1, dtb_found
+
+#ifdef CONFIG_BUILTIN_DTB
+	PTR_LA	t2, __dtb_start
+	PTR_LA	t1, __dtb_end
+	bne		t1, t2, dtb_found
+#endif /* CONFIG_BUILTIN_DTB */
+
+	li		t2, 0
+dtb_found:
+#endif /* CONFIG_USE_OF */
 	PTR_LA		t0, __bss_start		# clear .bss
 	LONG_S		zero, (t0)
 	PTR_LA		t1, __bss_stop - LONGSIZE
@@ -106,6 +133,10 @@ NESTED(kernel_entry, 16, sp)			# kernel entry point
 	LONG_S		a2, fw_arg2
 	LONG_S		a3, fw_arg3
 
+#ifdef CONFIG_USE_OF
+	LONG_S		t2, fw_passed_dtb
+#endif
+
 	MTC0		zero, CP0_CONTEXT	# clear context register
 #ifdef CONFIG_64BIT
 	MTC0		zero, CP0_XCONTEXT
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be0153f8b..2546f2fd2eb6 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -784,6 +784,10 @@ void __init setup_arch(char **cmdline_p)
 unsigned long kernelsp[NR_CPUS];
 unsigned long fw_arg0, fw_arg1, fw_arg2, fw_arg3;
 
+#ifdef CONFIG_USE_OF
+unsigned long fw_passed_dtb;
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *mips_debugfs_dir;
 static int __init debugfs_mips(void)
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index bc9f58fcbdf9..363937121617 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -73,8 +73,11 @@ void __init plat_mem_setup(void)
 
 	set_io_port_base((unsigned long) KSEG1);
 
-	dtb = get_fdt();
-	if (dtb == NULL)
+	if (fw_passed_dtb) /* UHI interface */
+		dtb = (void *)fw_passed_dtb;
+	else if (&__dtb_start != &__dtb_end)
+		dtb = (void *)__dtb_start;
+	else
 		panic("no dtb found");
 
 	/*
diff --git a/arch/mips/pic32/pic32mzda/init.c b/arch/mips/pic32/pic32mzda/init.c
index 764f2d022fae..1897aa863573 100644
--- a/arch/mips/pic32/pic32mzda/init.c
+++ b/arch/mips/pic32/pic32mzda/init.c
@@ -21,11 +21,24 @@ const char *get_system_type(void)
 	return "PIC32MZDA";
 }
 
+static ulong get_fdtaddr(void)
+{
+	ulong ftaddr = 0;
+
+	if (fw_passed_dtb && !fw_arg2 && !fw_arg3)
+		return (ulong)fw_passed_dtb;
+
+	if (&__dtb_start < &__dtb_end)
+		ftaddr = (ulong)__dtb_start;
+
+	return ftaddr;
+}
+
 void __init plat_mem_setup(void)
 {
 	void *dtb;
 
-	dtb = get_fdt();
+	dtb = (void *)get_fdtaddr();
 	if (!dtb) {
 		pr_err("pic32: no DTB found.\n");
 		return;
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 8286c3521476..2c9af61efc20 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -64,15 +64,20 @@ static int __init early_init_dt_find_memory(unsigned long node,
 
 void __init plat_mem_setup(void)
 {
-	void *dtb;
+	void *dtb = NULL;
 
 	set_io_port_base(KSEG1);
 
 	/*
 	 * Load the builtin devicetree. This causes the chosen node to be
-	 * parsed resulting in our memory appearing.
+	 * parsed resulting in our memory appearing. fw_passed_dtb is used
+	 * by CONFIG_MIPS_APPENDED_RAW_DTB as well.
 	 */
-	dtb = get_fdt();
+	if (fw_passed_dtb)
+		dtb = (void *)fw_passed_dtb;
+	else if (&__dtb_start != &__dtb_end)
+		dtb = (void *)__dtb_start;
+
 	__dt_setup_arch(dtb);
 
 	of_scan_flat_dt(early_init_dt_find_memory, NULL);
-- 
2.25.1

