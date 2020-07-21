Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A6A22885E
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 20:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgGUShw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 14:37:52 -0400
Received: from [115.28.160.31] ([115.28.160.31]:56244 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726658AbgGUShw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jul 2020 14:37:52 -0400
Received: from ld50.lan (unknown [112.65.61.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9C8C060132;
        Wed, 22 Jul 2020 02:37:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595356668; bh=MoRswcmo8qEThBnTUwCq4pafUKDXMLYayfbMHpTu1tc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1EWyBR2uxBmKGXnu5Cj65S8fSYWXJkKGcrJGr40kUN+3+xmL100YOJjI5pSW22ns
         yog82FDi1zf2cb7znqLaz7iQwJfytOEOc/y2/B4tHRz9CPMcnp6CFi8VGb/YKS9Tv/
         21fXQaW9d/wTP1Se3+WOqPq7wDf5qmQicRbRFOUA=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>,
        Markos Chandras <markos.chandras@imgtec.com>,
        John Crispin <blogic@openwrt.org>,
        Paul Burton <paulburton@kernel.org>
Subject: [PATCH v2 1/3] MIPS: only register FTLBPar exception handler for supported models
Date:   Wed, 22 Jul 2020 02:37:37 +0800
Message-Id: <20200721183739.1410221-2-git@xen0n.name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721183739.1410221-1-git@xen0n.name>
References: <20200721183739.1410221-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously ExcCode 16 is unconditionally treated as the FTLB parity
exception (FTLBPar), but in fact its semantic is implementation-
dependent. Looking at various manuals it seems the FTLBPar exception is
only present on some recent MIPS Technologies cores, so only register
the handler on these.

Fixes: 75b5b5e0a262790f ("MIPS: Add support for FTLBs")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: John Crispin <blogic@openwrt.org>
Cc: Paul Burton <paulburton@kernel.org>
---
 arch/mips/include/asm/cpu-features.h |  4 ++++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/kernel/cpu-probe.c         | 13 +++++++++++++
 arch/mips/kernel/traps.c             |  3 ++-
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 724dfddcab92..0b1bc7ed913b 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -568,6 +568,10 @@
 # define cpu_has_mac2008_only	__opt(MIPS_CPU_MAC_2008_ONLY)
 #endif
 
+#ifndef cpu_has_ftlbparex
+# define cpu_has_ftlbparex	__opt(MIPS_CPU_FTLBPAREX)
+#endif
+
 #ifdef CONFIG_SMP
 /*
  * Some systems share FTLB RAMs between threads within a core (siblings in
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 104a509312b3..3a4773714b29 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -425,6 +425,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_MM_SYSAD	BIT_ULL(58)	/* CPU supports write-through SysAD Valid merge */
 #define MIPS_CPU_MM_FULL	BIT_ULL(59)	/* CPU supports write-through full merge */
 #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
+#define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c231c1b67889..9e325862e810 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1827,6 +1827,19 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 	default:
 		break;
 	}
+
+	/* Recent MIPS cores use the implementation-dependent ExcCode 16 for
+	 * cache/FTLB parity exceptions.
+	 */
+	switch (__get_cpu_type(c->cputype)) {
+	case CPU_PROAPTIV:
+	case CPU_P5600:
+	case CPU_P6600:
+	case CPU_I6400:
+	case CPU_I6500:
+		c->options |= MIPS_CPU_FTLBPAREX;
+		break;
+	}
 }
 
 static inline void cpu_probe_alchemy(struct cpuinfo_mips *c, unsigned int cpu)
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 7c32c956156a..25a8a0d441be 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2454,7 +2454,8 @@ void __init trap_init(void)
 	if (cpu_has_fpu && !cpu_has_nofpuex)
 		set_except_vector(EXCCODE_FPE, handle_fpe);
 
-	set_except_vector(MIPS_EXCCODE_TLBPAR, handle_ftlb);
+	if (cpu_has_ftlbparex)
+		set_except_vector(MIPS_EXCCODE_TLBPAR, handle_ftlb);
 
 	if (cpu_has_rixiex) {
 		set_except_vector(EXCCODE_TLBRI, tlb_do_page_fault_0);
-- 
2.25.1

