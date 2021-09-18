Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D394104B3
	for <lists+linux-mips@lfdr.de>; Sat, 18 Sep 2021 09:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237091AbhIRHZI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Sep 2021 03:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhIRHZI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Sep 2021 03:25:08 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2528FC061574;
        Sat, 18 Sep 2021 00:23:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id l6so2906039plh.9;
        Sat, 18 Sep 2021 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IRv3NJgBgBwsQqhq8YzFsJFYARsDI4nmAcbZDvpiweE=;
        b=Q2zNyvVePUMuKKJxUSFwRJSG9tm6wrJaYTp51lHRDzoeTk9+zMIZCaTHJxSaWROWAx
         bS9al1s4ebZabf1xV+eOmR+CbY1N6FZZfDYQ0gS49HJ4dvRuiOv89NRQ4dsuhWjhk0vy
         EAHN4kZgr+tjC5mcgu39zGaor6Y/PlAMsedSpNJE4nlK2HR5lvhEJNTDJRqgCifBdmRo
         Y7RQMVythbm+TVxNO5BNh3FJaUTXOL6oYXgivHq139BAXJ7pZXgSbW0pC+D1MdldRFJm
         K2qjFLM0LMucrJwN3FNIW5azvMStRBqCApfxNnxz06q3W+rLFKJuxO9U+RTbmoCLkOPJ
         +1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IRv3NJgBgBwsQqhq8YzFsJFYARsDI4nmAcbZDvpiweE=;
        b=03trHnSckfD220+ZgZyLiCwAYlVf8VFTpkvquUnm5iA4niK8d8zbbr9dltjQA93xcI
         SAHsfe5shbSQ1AF6h+MDcnJDRZjnuaA4gvGHO9hlVWI3L2upjwAhEKO2kshoFy1QyjYs
         +yWN1XI2Du1FN1H8c2QdJ2wIrgIyDSCx2tCJpqaQnNT5mGIkJ4Vsacbcd84hvt1VLuqs
         3c3SZfSSOFrCahFdTZmdjudhc0oheJlPPCTEFI9kme03yA+2fRjpCvKODRZ56Ex3VoLz
         QKxyvj7NX5AVYTkd/h776uhlLI0+Ry6S4JcrS9j7Qs+JI+BkFA/H7O9U2SNjpvOPJe2f
         uBzg==
X-Gm-Message-State: AOAM532gva2F8gnx87Jima6lyFUm7jyFarlnhQgzcVeL5uRqTFvnSARR
        LfUDZP14bp1PrCJO211DLe4=
X-Google-Smtp-Source: ABdhPJwl89bUNMYwK+oYsOln7Pyp3m3z+ryvzzN694svXjmXD1XlfKdblw9q6aJtzCZ7CxMPfvi9DQ==
X-Received: by 2002:a17:902:ec90:b0:13a:34f9:cfe9 with SMTP id x16-20020a170902ec9000b0013a34f9cfe9mr13229825plg.74.1631949824554;
        Sat, 18 Sep 2021 00:23:44 -0700 (PDT)
Received: from localhost.localdomain (mail.lemote.com. [222.92.8.138])
        by smtp.gmail.com with ESMTPSA id i27sm8144498pfq.184.2021.09.18.00.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 00:23:43 -0700 (PDT)
From:   Dian zheng <paniaguaholt597336@gmail.com>
X-Google-Original-From: Dian zheng <zhengd@lemote.com>
To:     jiaxun.yang@flygoat.com
Cc:     cand@gmx.com, chenhuacai@kernel.org, daniel.lezcano@linaro.org,
        drjones@redhat.com, fancer.lancer@gmail.com, huangll@lemote.com,
        john.garry@huawei.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, marcan@marcan.st,
        mgorman@techsingularity.net, ndesaulniers@google.com,
        paul@crapouillou.net, romain.naour@gmail.com,
        sudipm.mukherjee@gmail.com, sumanthk@linux.ibm.com,
        tanj@lemote.com, tglx@linutronix.de, tmricht@linux.ibm.com,
        tom.zanussi@linux.intel.com, tsbogend@alpha.franken.de,
        will@kernel.org, yangtiezhu@loongson.cn,
        zhangshaokun@hisilicon.com, zhengd@lemote.com,
        zhouyanjie@wanyeetech.com
Subject: [PATCH v1 1/3] MIPS: cevt-r4k: Enable intimer for Loongson CPUs with extimer Loongson64C and Loongson64G have extimer feature, which is sharing Cause.TI with intimer (which is cevt-r4k).
Date:   Sat, 18 Sep 2021 15:21:58 +0800
Message-Id: <20210918072200.95304-1-zhengd@lemote.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
References: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Dian Zheng <zhengd@lemote.com>

To ensure the cevt-r4k's usability, we need to add a callback for
clock device to ensure intimer is enabled when cevt-r4k is enabled.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Dian Zheng <zhengd@lemote.com>
---
 arch/mips/include/asm/cpu-features.h |  4 ++++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/kernel/cevt-r4k.c          | 25 +++++++++++++++++++++++++
 arch/mips/kernel/cpu-probe.c         |  6 +++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 3d71081afc55..787bd53be900 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -573,6 +573,10 @@
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
index d45a52f65b7a..8d221b4c3fa3 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -428,6 +428,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
 #define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
 #define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
+#define MIPS_CPU_EXTIMER	BIT_ULL(63)	/* CPU has External Timer (Loongson) */
 
 /*
  * CPU ASE encodings
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 32ec67c9ab67..91fc62001149 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -15,6 +15,8 @@
 
 #include <asm/time.h>
 #include <asm/cevt-r4k.h>
+#include <asm/cpu-features.h>
+#include <asm/mipsregs.h>
 
 static int mips_next_event(unsigned long delta,
 			   struct clock_event_device *evt)
@@ -290,6 +292,24 @@ core_initcall(r4k_register_cpufreq_notifier);
 
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
@@ -325,6 +345,11 @@ int r4k_clockevent_init(void)
 	cd->set_next_event	= mips_next_event;
 	cd->event_handler	= mips_event_handler;
 
+#ifdef CONFIG_CPU_LOONGSON64
+	cd->set_state_oneshot	= c0_compare_int_enable;
+	cd->set_state_shutdown	= c0_compare_int_disable;
+#endif
+
 	clockevents_config_and_register(cd, mips_hpt_frequency, min_delta, 0x7fffffff);
 
 	if (cp0_timer_irq_installed)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 630fcb4cb30e..8a9b028a1df7 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1723,6 +1723,9 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
 	if (cfg2 & LOONGSON_CFG2_LEXT2)
 		c->ases |= MIPS_ASE_LOONGSON_EXT2;
 
+	if (cfg2 & LOONGSON_CFG2_LLFTP)
+		c->options |= MIPS_CPU_EXTIMER;
+
 	if (cfg2 & LOONGSON_CFG2_LSPW) {
 		c->options |= MIPS_CPU_LDPTE;
 		c->guest.options |= MIPS_CPU_LDPTE;
@@ -1780,7 +1783,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		 * Also some early Loongson-3A2000 had wrong TLB type in Config
 		 * register, we correct it here.
 		 */
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE |
+			      MIPS_CPU_EXTIMER;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
-- 
2.18.1

