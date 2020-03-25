Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C86931921E0
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 08:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgCYHrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 03:47:10 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:62836 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgCYHrJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 03:47:09 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02P7jkld015692;
        Wed, 25 Mar 2020 16:45:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02P7jkld015692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585122347;
        bh=EUymPS1gsQvy5W5tjvkKRd13Qol+LTFsH2NwiaiOcDU=;
        h=From:To:Cc:Subject:Date:From;
        b=ERev4LjB49nkHIJaW1leS+1W5e0DEJO+Gce+TWBZez4IW0qZYUqD0Z7Arz6m7yILq
         Y1ep/XM+t6BspbAcKGYP7PpTNSZo9eHbDo292kdTI9qRHzAYBHsiPcBi+c7swR4osH
         SetwPxHiKQa/TLzw/RMPnUAbEqAF8iIM9LZsa60h0s9HcnYMexCzvyFXL7wcg/EIWE
         F8YTNi0Ux8eCaTPDIpmeuqhDlbzaAEW/A+WWBnXPo0RXqxgjY0S06vwyYb6A8bQb6g
         9tigY6sCVmC22CmsUjD4PbNBsaBQTUfVqNonWKMCcf3yDmaO5HmJoJKHim1bPf2wUq
         VyanKOgttWZSw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: do not compile generic functions for CONFIG_CAVIUM_OCTEON_SOC
Date:   Wed, 25 Mar 2020 16:45:29 +0900
Message-Id: <20200325074529.24772-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS provides multiple definitions for the following functions:

  fw_init_cmdline
  __delay
  __udelay
  __ndelay
  memmove
  __rmemcpy
  memcpy
  __copy_user

The generic ones are defined in lib-y objects, which are overridden by
the Octeon ones when CONFIG_CAVIUM_OCTEON_SOC is enabled.

The use of EXPORT_SYMBOL in static libraries potentially causes a
problem for the llvm linker [1]. So, I want to forcibly link lib-y
objects to vmlinux when CONFIG_MODULES=y.

As a groundwork, we must fix multiple definitions that have previously
been hidden by lib-y.

If you look at lib/string.c, arch can define __HAVE_ARCH_* to opt out
the generic implementation.

Similarly, this commit adds CONFIG_HAVE_PLAT_* to allow a platform
to opt out the MIPS generic code.

[1]: https://github.com/ClangBuiltLinux/linux/issues/515

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Use #ifdef instead of __weak. This avoids increasing image size.

 arch/mips/Kconfig          | 12 ++++++++++++
 arch/mips/fw/lib/cmdline.c |  2 ++
 arch/mips/lib/delay.c      |  4 ++++
 arch/mips/lib/memcpy.S     |  3 +++
 4 files changed, 21 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797d7f1ad5fe..4bf103e5c139 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -973,6 +973,9 @@ config CAVIUM_OCTEON_SOC
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_HAS_CPU_CAVIUM_OCTEON
 	select HAVE_PCI
+	select HAVE_PLAT_DELAY
+	select HAVE_PLAT_FW_INIT_CMDLINE
+	select HAVE_PLAT_MEMCPY
 	select ZONE_DMA32
 	select HOLES_IN_ZONE
 	select GPIOLIB
@@ -1229,6 +1232,15 @@ config GENERIC_ISA_DMA_SUPPORT_BROKEN
 	bool
 	select GENERIC_ISA_DMA
 
+config HAVE_PLAT_DELAY
+	bool
+
+config HAVE_PLAT_FW_INIT_CMDLINE
+	bool
+
+config HAVE_PLAT_MEMCPY
+	bool
+
 config ISA_DMA_API
 	bool
 
diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
index 6ecda64ad184..f24cbb4a39b5 100644
--- a/arch/mips/fw/lib/cmdline.c
+++ b/arch/mips/fw/lib/cmdline.c
@@ -16,6 +16,7 @@ int fw_argc;
 int *_fw_argv;
 int *_fw_envp;
 
+#ifndef CONFIG_HAVE_PLAT_FW_INIT_CMDLINE
 void __init fw_init_cmdline(void)
 {
 	int i;
@@ -41,6 +42,7 @@ void __init fw_init_cmdline(void)
 			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
 	}
 }
+#endif
 
 char * __init fw_getcmdline(void)
 {
diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
index 68c495ed71e3..2e8dfc1d59c8 100644
--- a/arch/mips/lib/delay.c
+++ b/arch/mips/lib/delay.c
@@ -24,6 +24,8 @@
 #define GCC_DADDI_IMM_ASM() "r"
 #endif
 
+#ifndef CONFIG_HAVE_PLAT_DELAY
+
 void __delay(unsigned long loops)
 {
 	__asm__ __volatile__ (
@@ -63,3 +65,5 @@ void __ndelay(unsigned long ns)
 	__delay((ns * 0x00000005ull * HZ * lpj) >> 32);
 }
 EXPORT_SYMBOL(__ndelay);
+
+#endif
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index f7994d936505..88065ee433cd 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -598,6 +598,7 @@ SEXC(1)
 	 nop
 	.endm
 
+#ifndef CONFIG_HAVE_PLAT_MEMCPY
 	.align	5
 LEAF(memmove)
 EXPORT_SYMBOL(memmove)
@@ -665,6 +666,8 @@ EXPORT_SYMBOL(__copy_user)
 	/* Legacy Mode, user <-> user */
 	__BUILD_COPY_USER LEGACY_MODE USEROP USEROP
 
+#endif
+
 #ifdef CONFIG_EVA
 
 /*
-- 
2.17.1

