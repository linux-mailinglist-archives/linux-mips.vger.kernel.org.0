Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13241916D7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCXQti (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:49:38 -0400
Received: from condef-06.nifty.com ([202.248.20.71]:16495 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCXQti (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:49:38 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Mar 2020 12:49:36 EDT
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-06.nifty.com with ESMTP id 02OGerNW005898
        for <linux-mips@vger.kernel.org>; Wed, 25 Mar 2020 01:41:05 +0900
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 02OGeCI1005472;
        Wed, 25 Mar 2020 01:40:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 02OGeCI1005472
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585068013;
        bh=famtRWyjSfbAbF0DizSZCf3n5XKV3RZa5LsuHJNtpdI=;
        h=From:To:Cc:Subject:Date:From;
        b=OFracP2Ayh2CibAFHSv7zHXCGwaB3uQgJqaz7E14HAOSq1Aa1fhZQ8U3SH2P19yUo
         WeQjVOV5Jt7nvamRZ4Xl6ca49BJ4UdA5sh4QdN5dCqHuHhD9+wOFBliIfvimLR1LKn
         XNVj9kYPBgQmRp+qatxOv6EGmPuxH8WRqQc10HtdM2AzWG65Q7EVtUnRHvgouKyWU7
         mtIkzsExWFd4HSd/AsPwyNYkgGU7y417B2+QEZCEt63VYKGMW1Egfu9sj06h2Hz8Sm
         /9YzdB7RK0X6gvM0TY1ax52Zd84PJc+3MnjWUKgEJucQt0JTKRmUsOvmBdiiK5ueT8
         SglJqk+QTe9tA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        clang-built-linux@googlegroups.com
Subject: [PATCH] MIPS: mark some functions as weak to avoid conflict with Octeon ones
Date:   Wed, 25 Mar 2020 01:40:05 +0900
Message-Id: <20200324164005.8259-1-masahiroy@kernel.org>
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

As a groundwork, we must fix multiple definitions that have been
hidden by lib-y.

In this case, the generic implementations in arch/mips/lib/ are
weaker than the ones in arch/mips/cavium-octen/, so annotating __weak
is a straight-forward solution.

I also removed EXPORT_SYMBOL from the Octeon files to avoid the
'exported twice' warnings from modpost.

[1]: https://github.com/ClangBuiltLinux/linux/issues/515

Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/cavium-octeon/csrc-octeon.c   | 4 ----
 arch/mips/cavium-octeon/octeon-memcpy.S | 3 ---
 arch/mips/fw/lib/cmdline.c              | 2 +-
 arch/mips/lib/delay.c                   | 6 +++---
 arch/mips/lib/memcpy.S                  | 5 +++++
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/mips/cavium-octeon/csrc-octeon.c b/arch/mips/cavium-octeon/csrc-octeon.c
index 124817609ce0..fdc28fb5eda4 100644
--- a/arch/mips/cavium-octeon/csrc-octeon.c
+++ b/arch/mips/cavium-octeon/csrc-octeon.c
@@ -153,7 +153,6 @@ void __udelay(unsigned long us)
 	while (end > cur)
 		cur = read_c0_cvmcount();
 }
-EXPORT_SYMBOL(__udelay);
 
 void __ndelay(unsigned long ns)
 {
@@ -167,7 +166,6 @@ void __ndelay(unsigned long ns)
 	while (end > cur)
 		cur = read_c0_cvmcount();
 }
-EXPORT_SYMBOL(__ndelay);
 
 void __delay(unsigned long loops)
 {
@@ -179,8 +177,6 @@ void __delay(unsigned long loops)
 	while (end > cur)
 		cur = read_c0_cvmcount();
 }
-EXPORT_SYMBOL(__delay);
-
 
 /**
  * octeon_io_clk_delay - wait for a given number of io clock cycles to pass.
diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
index 0a7c9834b81c..3eb8d1a72d7f 100644
--- a/arch/mips/cavium-octeon/octeon-memcpy.S
+++ b/arch/mips/cavium-octeon/octeon-memcpy.S
@@ -147,11 +147,9 @@
  */
 	.align	5
 LEAF(memcpy)					/* a0=dst a1=src a2=len */
-EXPORT_SYMBOL(memcpy)
 	move	v0, dst				/* return value */
 __memcpy:
 FEXPORT(__copy_user)
-EXPORT_SYMBOL(__copy_user)
 	/*
 	 * Note: dst & src may be unaligned, len may be 0
 	 * Temps
@@ -438,7 +436,6 @@ s_exc:
 
 	.align	5
 LEAF(memmove)
-EXPORT_SYMBOL(memmove)
 	ADD	t0, a0, a2
 	ADD	t1, a1, a2
 	sltu	t0, a1, t0			# dst + len <= src -> memcpy
diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
index 6ecda64ad184..e1f9a0c23005 100644
--- a/arch/mips/fw/lib/cmdline.c
+++ b/arch/mips/fw/lib/cmdline.c
@@ -16,7 +16,7 @@ int fw_argc;
 int *_fw_argv;
 int *_fw_envp;
 
-void __init fw_init_cmdline(void)
+void __init __weak fw_init_cmdline(void)
 {
 	int i;
 
diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
index 68c495ed71e3..ba0ae7da5ced 100644
--- a/arch/mips/lib/delay.c
+++ b/arch/mips/lib/delay.c
@@ -24,7 +24,7 @@
 #define GCC_DADDI_IMM_ASM() "r"
 #endif
 
-void __delay(unsigned long loops)
+void __weak __delay(unsigned long loops)
 {
 	__asm__ __volatile__ (
 	"	.set	noreorder				\n"
@@ -48,7 +48,7 @@ EXPORT_SYMBOL(__delay);
  * a constant)
  */
 
-void __udelay(unsigned long us)
+void __weak __udelay(unsigned long us)
 {
 	unsigned int lpj = raw_current_cpu_data.udelay_val;
 
@@ -56,7 +56,7 @@ void __udelay(unsigned long us)
 }
 EXPORT_SYMBOL(__udelay);
 
-void __ndelay(unsigned long ns)
+void __weak __ndelay(unsigned long ns)
 {
 	unsigned int lpj = raw_current_cpu_data.udelay_val;
 
diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index f7994d936505..f2f58326b927 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -598,6 +598,9 @@ SEXC(1)
 	 nop
 	.endm
 
+	.weak memmove
+	.weak __rmemcpy
+
 	.align	5
 LEAF(memmove)
 EXPORT_SYMBOL(memmove)
@@ -655,6 +658,8 @@ LEAF(__rmemcpy)					/* a0=dst a1=src a2=len */
  * the number of uncopied bytes.
  * memcpy sets v0 to dst.
  */
+	.weak memcpy
+	.weak __copy_user
 	.align	5
 LEAF(memcpy)					/* a0=dst a1=src a2=len */
 EXPORT_SYMBOL(memcpy)
-- 
2.17.1

