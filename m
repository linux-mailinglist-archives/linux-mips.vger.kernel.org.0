Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0643632CBB4
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 05:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbhCDE6b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 23:58:31 -0500
Received: from rcdn-iport-8.cisco.com ([173.37.86.79]:46713 "EHLO
        rcdn-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbhCDE6A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 23:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6247; q=dns/txt; s=iport;
  t=1614833880; x=1616043480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uPHyrqhndx2XuHWJn770Fcm2MeEJLaI/H/apMZaWTS4=;
  b=ksWo79qRGjVZtsOhsmE7heAOJ4qlebf5Gq62FM90NU15/Un+EDTGoIya
   8PsyYJJF+2+nJmpM84ZgTfDzhq8cPnpK2rvsSIf0akEdfXrIvnok2XcYy
   SfuhpEMayh646uLrBoMD8ziBTSMUCMMP3xve8ythylSoHC1AJjv5Fl18r
   0=;
X-IronPort-AV: E=Sophos;i="5.81,221,1610409600"; 
   d="scan'208";a="868193947"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 04 Mar 2021 04:48:13 +0000
Received: from zorba.cisco.com ([10.24.7.178])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 1244m4X0015988;
        Thu, 4 Mar 2021 04:48:12 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        Ruslan Bilovol <rbilovol@cisco.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] CMDLINE: mips: convert to generic builtin command line
Date:   Wed,  3 Mar 2021 20:48:01 -0800
Message-Id: <20210304044803.812204-4-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.178, [10.24.7.178]
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This updates the mips code to use the CONFIG_GENERIC_CMDLINE
option.

This deletes the option for MIPS_CMDLINE_BUILTIN_EXTEND
and replaces the functionality with generic code.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/mips/Kconfig        |  4 +---
 arch/mips/Kconfig.debug  | 44 ----------------------------------------
 arch/mips/kernel/setup.c | 37 +++++----------------------------
 3 files changed, 6 insertions(+), 79 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0a17bedf4f0d..7c07b3bca9fc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -23,6 +23,7 @@ config MIPS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 	select CPU_PM if CPU_IDLE
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_GETTIMEOFDAY
@@ -3171,9 +3172,6 @@ choice
 	config MIPS_CMDLINE_FROM_BOOTLOADER
 		bool "Bootloader kernel arguments if available"
 
-	config MIPS_CMDLINE_BUILTIN_EXTEND
-		depends on CMDLINE_BOOL
-		bool "Extend builtin kernel arguments with bootloader arguments"
 endchoice
 
 endmenu
diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 7a8d94cdd493..b5a099c74eb6 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -30,50 +30,6 @@ config EARLY_PRINTK_8250
 config USE_GENERIC_EARLY_PRINTK_8250
 	bool
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
-	help
-	  For most systems, it is firmware or second stage bootloader that
-	  by default specifies the kernel command line options.  However,
-	  it might be necessary or advantageous to either override the
-	  default kernel command line or add a few extra options to it.
-	  For such cases, this option allows you to hardcode your own
-	  command line options directly into the kernel.  For that, you
-	  should choose 'Y' here, and fill in the extra boot arguments
-	  in CONFIG_CMDLINE.
-
-	  The built-in options will be concatenated to the default command
-	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
-	  command line will be ignored and replaced by the built-in string.
-
-	  Most MIPS systems will normally expect 'N' here and rely upon
-	  the command line from the firmware or the second-stage bootloader.
-
-config CMDLINE
-	string "Default kernel command string"
-	depends on CMDLINE_BOOL
-	help
-	  On some platforms, there is currently no way for the boot loader to
-	  pass arguments to the kernel.  For these platforms, and for the cases
-	  when you want to add some extra options to the command line or ignore
-	  the default command line, you can supply some command-line options at
-	  build time by entering them here.  In other cases you can specify
-	  kernel args so that you don't have to set them up in board prom
-	  initialization routines.
-
-	  For more information, see the CMDLINE_BOOL and CMDLINE_OVERRIDE
-	  options.
-
-config CMDLINE_OVERRIDE
-	bool "Built-in command line overrides firmware arguments"
-	depends on CMDLINE_BOOL
-	help
-	  By setting this option to 'Y' you will have your kernel ignore
-	  command line arguments from firmware or second stage bootloader.
-	  Instead, the built-in command line will be used exclusively.
-
-	  Normally, you will choose 'N' here.
-
 config SB1XXX_CORELIS
 	bool "Corelis Debugger"
 	depends on SIBYTE_SB1xxx_SOC
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e277437..b7e9c1ffffc9 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -23,6 +23,7 @@
 #include <linux/debugfs.h>
 #include <linux/kexec.h>
 #include <linux/sizes.h>
+#include <linux/cmdline.h>
 #include <linux/device.h>
 #include <linux/dma-map-ops.h>
 #include <linux/decompress/generic.h>
@@ -67,12 +68,6 @@ EXPORT_SYMBOL(mips_machtype);
 static char __initdata command_line[COMMAND_LINE_SIZE];
 char __initdata arcs_cmdline[COMMAND_LINE_SIZE];
 
-#ifdef CONFIG_CMDLINE_BOOL
-static const char builtin_cmdline[] __initconst = CONFIG_CMDLINE;
-#else
-static const char builtin_cmdline[] __initconst = "";
-#endif
-
 /*
  * mips_io_port_base is the begin of the address space to which x86 style
  * I/O ports are mapped.
@@ -546,27 +541,7 @@ static void __init bootcmdline_init(void)
 {
 	bool dt_bootargs = false;
 
-	/*
-	 * If CMDLINE_OVERRIDE is enabled then initializing the command line is
-	 * trivial - we simply use the built-in command line unconditionally &
-	 * unmodified.
-	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-		return;
-	}
-
-	/*
-	 * If the user specified a built-in command line &
-	 * MIPS_CMDLINE_BUILTIN_EXTEND, then the built-in command line is
-	 * prepended to arguments from the bootloader or DT so we'll copy them
-	 * to the start of boot_command_line here. Otherwise, empty
-	 * boot_command_line to undo anything early_init_dt_scan_chosen() did.
-	 */
-	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	else
-		boot_command_line[0] = 0;
+	boot_command_line[0] = 0;
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
 	/*
@@ -589,12 +564,9 @@ static void __init bootcmdline_init(void)
 		bootcmdline_append(arcs_cmdline, COMMAND_LINE_SIZE);
 
 	/*
-	 * If the user specified a built-in command line & we didn't already
-	 * prepend it, we append it to boot_command_line here.
+	 * Use the generic system for builtin prepend and append.
 	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) &&
-	    !IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
-		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
+	cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
 }
 
 /*
@@ -626,6 +598,7 @@ static void __init arch_mem_init(char **cmdline_p)
 	memblock_set_bottom_up(true);
 
 	bootcmdline_init();
+
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.25.1

