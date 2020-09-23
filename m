Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274322756CB
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 13:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgIWLDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 07:03:09 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:45938 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWLDJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 07:03:09 -0400
X-Greylist: delayed 1779 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 07:03:09 EDT
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 5CF6A200D5;
        Wed, 23 Sep 2020 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1600858988; bh=8UzSsVxoIKJVhVNdAG2c2Jv8NMwq0w03s0nIdW5bH6A=;
        h=From:To:Cc:Subject:Date:From;
        b=V5IYkAq/PbKpwn3yVhGgfAh5sopyu2xZwX1L1Eu4qZJZ8EcrTLS1LMx4j8mngAQje
         jGFbs00OtqzXxNSsU4/I/iOLLAutup4+EzSV94WrGkKj2CyCeBkF6EKusLkT2Ukp/z
         vca0O9y+NbBaXoAW12HYr37V3B2CsZdnglVPn3u/kyDUHoPRA8Qwa3YTgqO4j5zK/C
         W54WybhNuQR725MejyRhtqhevkzvy6RtZU/aZ1eVi7rIa+2wtVZOOVPrBlkcsYtQ9B
         NfQBmM8XoVXboeRLDtTA1dRZdbXLvQvNxLGWki6b15mhWYXtsmlyZ2G77/8oTpWt/P
         P2GUCeji6Os9Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: cevt-r4k: Enable intimer for Loongson64 CPUs with extimer
Date:   Wed, 23 Sep 2020 19:02:54 +0800
Message-Id: <20200923110301.58125-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson64C and Loongson64G have extimer feature, which is a
timer sharing Cause.TI with cevt-r4k (named intimer).

To ensure the cevt-r4k's usability, we need to add a callback for
clock device to switch intimer.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h |  4 ++++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/kernel/cevt-r4k.c          | 25 +++++++++++++++++++++++++
 arch/mips/kernel/cpu-probe.c         |  6 +++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 78cf7e300f12..aec458eee2a5 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -576,6 +576,10 @@
 # define cpu_has_gsexcex	__opt(MIPS_CPU_GSEXCEX)
 #endif
 
+#ifndef cpu_has_extimer
+# define cpu_has_extimer	__opt(MIPS_CPU_EXTIMER)
+#endif
+
 #ifdef CONFIG_SMP
 /*
  * Some systems share FTLB RAMs between threads within a core (siblings in
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 388a82f28a87..854e1b44254b 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -429,6 +429,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
 #define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
 #define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
+#define MIPS_CPU_EXTIMER	BIT_ULL(63)	/* CPU has External Timer (Loongson) */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 995ad9e69ded..fae49e9215b4 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -15,6 +15,8 @@
 
 #include <asm/time.h>
 #include <asm/cevt-r4k.h>
+#include <asm/cpu-features.h>
+#include <asm/mipsregs.h>
 
 static int mips_next_event(unsigned long delta,
 			   struct clock_event_device *evt)
@@ -294,6 +296,24 @@ core_initcall(r4k_register_cpufreq_notifier);
 
 #endif /* !CONFIG_CPU_FREQ */
 
+#ifdef CONFIG_CPU_LOONGSON64
+static int c0_compare_int_enable(struct clock_event_device *cd)
+{
+	if (cpu_has_extimer)
+		set_c0_config6(LOONGSON_CONF6_INTIMER);
+
+	return 0;
+}
+
+static int c0_compare_int_disable(struct clock_event_device *cd)
+{
+	if (cpu_has_extimer)
+		clear_c0_config6(LOONGSON_CONF6_INTIMER);
+
+	return 0;
+}
+#endif
+
 int r4k_clockevent_init(void)
 {
 	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
@@ -329,6 +349,11 @@ int r4k_clockevent_init(void)
 	cd->set_next_event	= mips_next_event;
 	cd->event_handler	= mips_event_handler;
 
+#ifdef CONFIG_CPU_LOONGSON64
+	cd->set_state_oneshot = c0_compare_int_enable;
+	cd->set_state_shutdown = c0_compare_int_disable;
+#endif
+
 	clockevents_config_and_register(cd, mips_hpt_frequency, min_delta, 0x7fffffff);
 
 	if (cp0_timer_irq_installed)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6be23f205e74..4f1e9ef2644e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2030,6 +2030,9 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
 	if (cfg2 & LOONGSON_CFG2_LEXT2)
 		c->ases |= MIPS_ASE_LOONGSON_EXT2;
 
+	if (cfg2 & LOONGSON_CFG2_LLFTP)
+		c->options |= MIPS_CPU_EXTIMER;
+
 	if (cfg2 & LOONGSON_CFG2_LSPW) {
 		c->options |= MIPS_CPU_LDPTE;
 		c->guest.options |= MIPS_CPU_LDPTE;
@@ -2088,7 +2091,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		 * Also some early Loongson-3A2000 had wrong TLB type in Config
 		 * register, we correct it here.
 		 */
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE |
+			      MIPS_CPU_EXTIMER;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
-- 
2.28.0

