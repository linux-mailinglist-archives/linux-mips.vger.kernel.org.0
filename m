Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4048034F04C
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbhC3R5f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:57:35 -0400
Received: from alln-iport-3.cisco.com ([173.37.142.90]:49033 "EHLO
        alln-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbhC3R5Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3559; q=dns/txt; s=iport;
  t=1617127044; x=1618336644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qd9oUIm458Aa8NrbzxxHcRM50MFT4YpUd/nN6uaHB5Q=;
  b=GgjxOOgB8qlwWHS9j5Hiw8e40WhxT58C8EeN26k90JOk5k1XylNGJcDF
   Vygm06NJfF0nIjOPo7w2Bj1MOeAr2IT/tX5ed24Q+iLpdcsBiAMYobFuJ
   dg/lcEdNG052i2yb7+h+KhQJ+VOiM1qkC2tIAUyZn2pJzqeZdQ1yxlXgi
   0=;
X-IPAS-Result: =?us-ascii?q?A0AEAACmZWNg/5ldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBgiqBTAE5MYxlpBKBfAsBAQEPNAQBAYRQAoF6A?=
 =?us-ascii?q?iU0CQ4CAwEBAQMCAwEBAQEBBQEBAQIBBgRxhW6GRQYyAUYQUVcGARKFeKsyg?=
 =?us-ascii?q?imJC4FEFIElAYhjdINyJhyBSUKBEjODJ4o2BIJGAYEPggSRYgSNPpwigxGBI?=
 =?us-ascii?q?5tFIqRSlQeeLYUHgVQ6gVkzGggbFYMkUBkNjisWjWoBWyEDLzgCBgoBAQMJi?=
 =?us-ascii?q?R8BAQ?=
IronPort-HdrOrdr: A9a23:zZeFBaHz0wV689mgpLqFtZHXdLJzesId70hD6mlaQ3VuHvCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO0sFJqrQQWOggWVBa5464+K+VfdMg34stVQzK
 JxN5V5YeeAbmRSqebfzE2GH807wN+BmZrY4Nv263t2VwllZ+VB4m5CazqzKUF9SAlYCZdRLv
 P1jfZvnDaudW8aac62HBA+Lor+jufWn5HrawNuPXEawTSJ5AnE1JfKVzCFwxFbaD9U2LEk62
 SAqRDh/76uqevT8G6660bjq7BfmN7s0bJ4ZPCku4wyNijmjBquacBHXbCP1QpF2d2H2RINjM
 TGpQsmMoBIz07pOkuxoRfrxmDboVAT10M=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; 
   d="scan'208";a="671912618"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Mar 2021 17:57:24 +0000
Received: from zorba.cisco.com ([10.24.8.123])
        by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 12UHv6CL024502;
        Tue, 30 Mar 2021 17:57:22 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     xe-linux-external@cisco.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] CMDLINE: arm64: convert to generic builtin command line
Date:   Tue, 30 Mar 2021 10:57:03 -0700
Message-Id: <be8847438abbfa4972dd792eb616973816af9290.1617126961.git.danielwa@cisco.com>
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

This updates the arm64 code to use the CONFIG_GENERIC_CMDLINE
option.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/arm64/Kconfig                 | 33 +-----------------------------
 arch/arm64/kernel/idreg-override.c |  8 +++++---
 arch/arm64/kernel/setup.c          |  4 ++++
 3 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e4e1b6550115..9781ba3758b1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -105,6 +105,7 @@ config ARM64
 	select GENERIC_ALLOCATOR
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS_BROADCAST
+	select GENERIC_CMDLINE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
@@ -1841,38 +1842,6 @@ config ARM64_ACPI_PARKING_PROTOCOL
 	  protocol even if the corresponding data is present in the ACPI
 	  MADT table.
 
-config CMDLINE
-	string "Default kernel command string"
-	default ""
-	help
-	  Provide a set of default command-line options at build time by
-	  entering them here. As a minimum, you should specify the the
-	  root device (e.g. root=/dev/nfs).
-
-choice
-	prompt "Kernel command line type" if CMDLINE != ""
-	default CMDLINE_FROM_BOOTLOADER
-	help
-	  Choose how the kernel will handle the provided default kernel
-	  command line string.
-
-config CMDLINE_FROM_BOOTLOADER
-	bool "Use bootloader kernel arguments if available"
-	help
-	  Uses the command-line options passed by the boot loader. If
-	  the boot loader doesn't provide any, the default kernel command
-	  string provided in CMDLINE will be used.
-
-config CMDLINE_FORCE
-	bool "Always use the default kernel command string"
-	help
-	  Always use the default kernel command string, even if the boot
-	  loader passes other arguments to the kernel.
-	  This is useful if you cannot or don't want to change the
-	  command-line options your boot loader passes to the kernel.
-
-endchoice
-
 config EFI_STUB
 	bool
 
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 83f1c4b92095..fb10cd860a26 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -9,6 +9,7 @@
 #include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
+#include <linux/cmdline.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -188,11 +189,12 @@ static __init void parse_cmdline(void)
 {
 	const u8 *prop = get_bootargs_cmdline();
 
-	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !prop)
-		__parse_cmdline(CONFIG_CMDLINE, true);
+	__parse_cmdline(CMDLINE_PREPEND, true);
 
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && prop)
+	if (IS_ENABLED(CMDLINE_OVERRIDE) && prop)
 		__parse_cmdline(prop, true);
+
+	__parse_cmdline(CMDLINE_APPEND, true);
 }
 
 /* Keep checkers quiet */
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 61845c0821d9..01791ce5244c 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/psci.h>
 #include <linux/sched/task.h>
 #include <linux/mm.h>
+#include <linux/cmdline.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -322,6 +323,9 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	 * cpufeature code and early parameters.
 	 */
 	jump_label_init();
+
+	cmdline_add_builtin(boot_command_line, NULL, COMMAND_LINE_SIZE);
+
 	parse_early_param();
 
 	/*
-- 
2.25.1

