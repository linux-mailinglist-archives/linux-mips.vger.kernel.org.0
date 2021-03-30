Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07FB34F04D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbhC3R5f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:57:35 -0400
Received: from alln-iport-7.cisco.com ([173.37.142.94]:57167 "EHLO
        alln-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbhC3R5X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4151; q=dns/txt; s=iport;
  t=1617127043; x=1618336643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EjJugBDCAD3rUkTSbtxc1b6KQ4ZbfCBpeFGgVbm8wnQ=;
  b=cU0PAWuc0h+/8LXKj3aJ3ZIenfE87PjfR7JDZDhjhit2mlrzthpv1Q79
   p1Pi4KIcqpycgoeRPR14Pji/KA6Glf5XTZh43chbzenIX+VBIBUun4oJo
   1Dt6prSiWs7x733DTkDJIA1y+hR/HfCxIatb6y7SCPsyCt/IzkX7Qrkm/
   I=;
X-IPAS-Result: =?us-ascii?q?A0ABAACmZWNgmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBg3YBOTGMZYksii6QOIF8CwEBAQ80BAEBhFACg?=
 =?us-ascii?q?XoCJTQJDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBAQEBAYZDhkUDAzIBO?=
 =?us-ascii?q?A4QUSE2BgESgnCCVgMvqzKCKYgbDWOBRBSBJQGIY3SDciYcgUlCgRIzgyeCH?=
 =?us-ascii?q?ogYBIJGAXUZAQolAYFUgRuQS4Jxik2bR1uDEYEjlhOFMiKkUpUHjnSUQIFUO?=
 =?us-ascii?q?IFbMxoIGxWDJFAZDY4rDQmNagFbIQMvOAIGCgEBAwmJHwEB?=
IronPort-HdrOrdr: A9a23:PcVGDqAnpbaMxZHlHejxsceALOonbusQ8zAX/mp6ICY4TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhbU5EL++UGDd1leAA5pl6eLZqQHIOyq7zeJF0L
 clTq4WMqySMXFfreLXpDa1CMwhxt7vytHMuc77w212RQ9nL4Fshj0ZNi+hHkd7RBZLCPMCff
 L22uN9qzWtYngRZMigb0N1PdTrncHBl57tfHc9aCIP1Q/mt16VwY+/OwSE2FMkXylXx7A5/S
 z+jxXh/am4qZiAu3jh/l6Wy5xXndf7o+EiOOW8zu4INz7rlgGkIKNmVrHqhkFNnMifrHA3jd
 LLvxAse/5W1kqUVGS0rRzxsjOQtgoT1w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; 
   d="scan'208";a="670280382"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2021 17:57:22 +0000
Received: from zorba.cisco.com ([10.24.8.123])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CK024502;
        Tue, 30 Mar 2021 17:57:20 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>
Cc:     xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] CMDLINE: x86: convert to generic builtin command line
Date:   Tue, 30 Mar 2021 10:57:02 -0700
Message-Id: <19776ce76932e1957faa21250f303481db39fb32.1617126961.git.danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This updates the x86 code to use the CONFIG_GENERIC_CMDLINE
option.

Cc: xe-linux-external@cisco.com
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/x86/Kconfig        | 44 +----------------------------------------
 arch/x86/kernel/setup.c | 18 ++---------------
 2 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..73ea9589e50d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -118,6 +118,7 @@ config X86
 	select EDAC_SUPPORT
 	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_APIC)
 	select GENERIC_CLOCKEVENTS_MIN_ADJUST
+	select GENERIC_CMDLINE
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES
@@ -2358,49 +2359,6 @@ choice
 
 endchoice
 
-config CMDLINE_BOOL
-	bool "Built-in kernel command line"
-	help
-	  Allow for specifying boot arguments to the kernel at
-	  build time.  On some systems (e.g. embedded ones), it is
-	  necessary or convenient to provide some or all of the
-	  kernel boot arguments with the kernel itself (that is,
-	  to not rely on the boot loader to provide them.)
-
-	  To compile command line arguments into the kernel,
-	  set this option to 'Y', then fill in the
-	  boot arguments in CONFIG_CMDLINE.
-
-	  Systems with fully functional boot loaders (i.e. non-embedded)
-	  should leave this option set to 'N'.
-
-config CMDLINE
-	string "Built-in kernel command string"
-	depends on CMDLINE_BOOL
-	default ""
-	help
-	  Enter arguments here that should be compiled into the kernel
-	  image and used at boot time.  If the boot loader provides a
-	  command line at boot time, it is appended to this string to
-	  form the full kernel command line, when the system boots.
-
-	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
-	  change this behavior.
-
-	  In most cases, the command line (whether built-in or provided
-	  by the boot loader) should specify the device for the root
-	  file system.
-
-config CMDLINE_OVERRIDE
-	bool "Built-in command line overrides boot loader arguments"
-	depends on CMDLINE_BOOL && CMDLINE != ""
-	help
-	  Set this option to 'Y' to have the kernel ignore the boot loader
-	  command line, and use ONLY the built-in command line.
-
-	  This is used to work around broken boot loaders.  This should
-	  be set to 'N' under normal conditions.
-
 config MODIFY_LDT_SYSCALL
 	bool "Enable the LDT (local descriptor table)" if EXPERT
 	default y
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index d883176ef2ce..6444a5f1fabf 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -47,6 +47,7 @@
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
 #include <linux/vmalloc.h>
+#include <linux/cmdline.h>
 
 /*
  * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
@@ -161,9 +162,6 @@ unsigned long saved_video_mode;
 #define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
-#ifdef CONFIG_CMDLINE_BOOL
-static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
-#endif
 
 #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
 struct edd edd;
@@ -883,19 +881,7 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = __pa_symbol(__bss_start);
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
-#ifdef CONFIG_CMDLINE_BOOL
-#ifdef CONFIG_CMDLINE_OVERRIDE
-	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-#else
-	if (builtin_cmdline[0]) {
-		/* append boot loader cmdline to builtin */
-		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
-		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
-		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
-	}
-#endif
-#endif
-
+	cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
 	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
-- 
2.25.1

