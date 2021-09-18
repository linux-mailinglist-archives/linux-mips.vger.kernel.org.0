Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483344104B5
	for <lists+linux-mips@lfdr.de>; Sat, 18 Sep 2021 09:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243014AbhIRHZS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Sep 2021 03:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhIRHZR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Sep 2021 03:25:17 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056EC061574;
        Sat, 18 Sep 2021 00:23:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j6so11350536pfa.4;
        Sat, 18 Sep 2021 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ckRfr93jBVrtk8m8fXQMVODVnsoXUNlxu8pmu/jGZwU=;
        b=V40M3+XujcVD9Mu31p8qoTcaqOpcMCaBwTOCkyK5pha9fCoD7gUHJcPIeko1b41OlW
         6U/vO+M/gAvyZ7jUWPaonLX1Ft7SRBEKrEBPiAxEhOv/cC/IK4Mqf83DhR3YT20IQcdS
         yoMZBTxwg2Iyv8kOCDPV2Rwi3DrueJi73q6dPr+M7Nti/2UyQ3T+FIOEh0bp4Ufc9Rhg
         sFxRm4s/Vt5hglVt+skwefl7wjn6MSk4B13PtlvXWHyFRdetb23lS1SdHvJM6ysWjOoM
         AKk3chMBZ5/QugQeZJFuWTDsldudNbcDQIAKuRwrlM85nexl57wqZ4Mf5K5V5jOKVjNs
         l4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ckRfr93jBVrtk8m8fXQMVODVnsoXUNlxu8pmu/jGZwU=;
        b=q0veAL2cbdNf+0VDMOTKnKBBtbYDv10uRPjRgaizwVKjl8cPLfzUaTGnCOxmf6aB40
         rV8yfyY4Lg9jHJ7uwg3qA1W56+TBnBCgo7sFyif616zglcMuf9I9fVBLbYUemp4yg1zY
         zn+vS4aTFWnQvWtFp55zNaL2LdXknnqaBD1VM9+CZHG2DNzTcAr5RBxVz6CePqi9Mxm9
         X7SkOMmrxTuqDxZbLAtfbR3PoyH5DzfgGVRSKNVMxKm1O4sEq4+mOC+whzneUhIO6x+M
         ejqpAEKbP7Ty/su1aR7WyyfBqZ8wNbGgD8KDAb7CnDKjP9YIjrLgwsuQ6raJ3MpSBn3f
         62tQ==
X-Gm-Message-State: AOAM533kTjrqYiVlWbUfn5yeSEGCgBYUi1OyjmMBXGpYW4N19A9BBoS6
        bEOnF4MqvegpsByCwfaOTgc=
X-Google-Smtp-Source: ABdhPJxx1DKWw5kauwnMk0diOZasSfNwdkeqJALPc/oDmor2aynQZj6EF8FQEEYdZqLMDK+pO4lLAQ==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr13626066pga.230.1631949834391;
        Sat, 18 Sep 2021 00:23:54 -0700 (PDT)
Received: from localhost.localdomain (mail.lemote.com. [222.92.8.138])
        by smtp.gmail.com with ESMTPSA id i27sm8144498pfq.184.2021.09.18.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 00:23:53 -0700 (PDT)
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
Subject: [PATCH v1 2/3] MIPS: time: Add plat_have_sched_clock That variable That variable would allow platform to register their own sched_clock instead of csrc-r4k.
Date:   Sat, 18 Sep 2021 15:21:59 +0800
Message-Id: <20210918072200.95304-2-zhengd@lemote.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210918072200.95304-1-zhengd@lemote.com>
References: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
 <20210918072200.95304-1-zhengd@lemote.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Dian Zheng <zhengd@lemote.com>

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Dian Zheng <zhengd@lemote.com>
---
 arch/mips/include/asm/time.h | 3 +++
 arch/mips/kernel/csrc-r4k.c  | 5 ++---
 arch/mips/kernel/time.c      | 3 +++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
index e855a3611d92..e235b8a27768 100644
--- a/arch/mips/include/asm/time.h
+++ b/arch/mips/include/asm/time.h
@@ -28,6 +28,9 @@ extern void plat_time_init(void);
  */
 extern unsigned int mips_hpt_frequency;
 
+/* True if platform registered sched_clock by itself */
+extern bool plat_have_sched_clock __initdata;
+
 /*
  * The performance counter IRQ on MIPS is a close relative to the timer IRQ
  * so it lives here.
diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index edc4afc080fa..b50a24da6528 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -122,9 +122,8 @@ int __init init_r4k_clocksource(void)
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 
-#ifndef CONFIG_CPU_FREQ
-	sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
-#endif
+	if (!IS_ENABLED(CONFIG_CPU_FREQ) && !plat_have_sched_clock)
+		sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
 
 	return 0;
 }
diff --git a/arch/mips/kernel/time.c b/arch/mips/kernel/time.c
index caa01457dce6..baf33da8c79d 100644
--- a/arch/mips/kernel/time.c
+++ b/arch/mips/kernel/time.c
@@ -123,6 +123,9 @@ EXPORT_SYMBOL(perf_irq);
 unsigned int mips_hpt_frequency;
 EXPORT_SYMBOL_GPL(mips_hpt_frequency);
 
+/* True if platform registered sched_clock by itself */
+bool plat_have_sched_clock __initdata;
+
 static __init int cpu_has_mfc0_count_bug(void)
 {
 	switch (current_cpu_type()) {
-- 
2.18.1

