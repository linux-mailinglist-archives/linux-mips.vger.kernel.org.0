Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F3F361899
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 06:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhDPEKN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 00:10:13 -0400
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:52345 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238474AbhDPEKI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 00:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3563; q=dns/txt; s=iport;
  t=1618546184; x=1619755784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GO4wmk8aV0OUxVhW9VMyBb9l4wFj18+YTePQSCcYNiM=;
  b=hOKSlLbS8396cnJ2xOKjGJomhaHdUY6/LjXMxY28HylRoLPtLn8o05BS
   eZ4JPhbZDXHW+Hvt9X9xdxyifhTB4ofI1CmN1fUVb/VfduAabrh03+oIs
   hXpJsNYbhSHqhbSMUk/Ho56NKHMhgmOAz1i4NpdE6HDXUD/ifDFPdMuC6
   A=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AIILAOaPeW6nIHMBcT5z155DYdL4zR+YMi2?=
 =?us-ascii?q?QD/UoZc3BoW+afkN2jm+le6AT9jywfVGpltdeLPqSBRn20z+8Q3aA9NaqvNT?=
 =?us-ascii?q?OJhEKGN4dnhLGJ/xTBHGnE+vdZxeNcdcFFeb7NJHxbqeq/3wWiCdYnx7C8gc?=
 =?us-ascii?q?WVrMPT1W1kQw0vS6wI1WZEIz2WGEF3WwVKbKBRfPGhz/FKqDa6dXMcYt7TPA?=
 =?us-ascii?q?hmY8H4u9bJmJj6CCRoOzcb7mC14A+A2frTDwWfmiwTSSpIxq0vtVLYihXj6r?=
 =?us-ascii?q?+42svLrSP05iv255RSlMCJ8Lt+Lf3JrNQJITPxjQvtQ4JtV9S5zUkIidDqzk?=
 =?us-ascii?q?o2m9/RpBplBeBP0jf6e2G4pgaF4XiH7AoT?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BMAAAiDXlg/4sNJK1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQGBfgcBAQsBAYIpgU0BOTGMZ6Q7gXwLAQEBDzQEAQGEUAKBcwI?=
 =?us-ascii?q?lNAkOAgMBAQwBAQUBAQECAQYEcROFXUMWAYVrBjIBRhBRVwYBEoJxgwisCII?=
 =?us-ascii?q?rgQGIM4FEFIElAYhrdIN1JxyBSUKEc4o5BIJGAYEPggRskQQEjVOcLYMWgSa?=
 =?us-ascii?q?bUQ8jpHyVGJ5YhQqBVDqBWTMaCBsVgyRQGQ6OKxaNawFbIQMvOAIGCgEBAwm?=
 =?us-ascii?q?JToNAAQE?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613433600"; 
   d="scan'208";a="861122364"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Apr 2021 04:09:41 +0000
Received: from zorba.cisco.com ([10.24.7.67])
        by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTP id 13G49OHn016753;
        Fri, 16 Apr 2021 04:09:40 GMT
From:   Daniel Walker <danielwa@cisco.com>
To:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     xe-linux-external@cisco.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] CMDLINE: arm64: convert to generic builtin command line
Date:   Thu, 15 Apr 2021 21:09:19 -0700
Message-Id: <20210416040924.2882771-9-danielwa@cisco.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416040924.2882771-1-danielwa@cisco.com>
References: <20210416040924.2882771-1-danielwa@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.7.67, [10.24.7.67]
X-Outbound-Node: alln-core-6.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This removes arm64 from the device tree handling of the
command line arguments.

The boot_command_line variable is populated inside the earliest
user of the command line, which is in idreg-override.c.

The device tree should not be needed to do any further handling
of the boot command line options.

Cc: xe-linux-external@cisco.com
Signed-off-by: Daniel Walker <danielwa@cisco.com>
---
 arch/arm64/Kconfig                 | 33 +-----------------------------
 arch/arm64/include/asm/setup.h     |  2 ++
 arch/arm64/kernel/idreg-override.c |  9 ++++----
 3 files changed, 8 insertions(+), 36 deletions(-)

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
 
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index d3320618ed14..1f5b6d8f2433 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -5,7 +5,9 @@
 
 #include <uapi/asm/setup.h>
 
+#ifndef __ASSEMBLY__
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
+#endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/arch/arm64/kernel/idreg-override.c b/arch/arm64/kernel/idreg-override.c
index 83f1c4b92095..0a3fcae13043 100644
--- a/arch/arm64/kernel/idreg-override.c
+++ b/arch/arm64/kernel/idreg-override.c
@@ -9,6 +9,7 @@
 #include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
+#include <linux/cmdline.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -188,11 +189,11 @@ static __init void parse_cmdline(void)
 {
 	const u8 *prop = get_bootargs_cmdline();
 
-	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !prop)
-		__parse_cmdline(CONFIG_CMDLINE, true);
+	strscpy(boot_command_line, prop, COMMAND_LINE_SIZE);
+	cmdline_add_builtin(boot_command_line);
+
+	__parse_cmdline(boot_command_line, true);
 
-	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && prop)
-		__parse_cmdline(prop, true);
 }
 
 /* Keep checkers quiet */
-- 
2.25.1

