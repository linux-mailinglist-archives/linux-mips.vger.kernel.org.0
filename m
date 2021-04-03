Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E4A3532CE
	for <lists+linux-mips@lfdr.de>; Sat,  3 Apr 2021 08:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhDCGTU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 02:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhDCGTU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Apr 2021 02:19:20 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227A7C0613E6;
        Fri,  2 Apr 2021 23:19:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f17so3405549plr.0;
        Fri, 02 Apr 2021 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBCIQHgUyAG2ZGSKzfcjypqTPr8Hjug+h1YTnKY5wjs=;
        b=etTmaMG/X35UknYs65i78HG3uAez5LaE097mDlhRe4dJsujsEPlNTBIxs0GUv9ryCH
         OJEAWEH2S58EBcd72jum8klzXCke0zQPaJlpFUqWhVpi1PZmyLNKlTWg1vHjZbVhsBhS
         s/R3+5n3kp3pkF7EcWSDy7SswrKs927B4MJc0njNYDWX29PzixubDUq7ILsqNQU26/w4
         95R1AW4amePmNvDCWkALRcziiR6g4edrsXhazDOwOqnjn2atSBDdRGH7UBL2q2mRxZjg
         Bz5FEw9wj/wtu0EpXWk5HopwYbKxOFteyDd2u8YKIYR7IJxv17T8Dj1Tw16rhUHQidWd
         GwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBCIQHgUyAG2ZGSKzfcjypqTPr8Hjug+h1YTnKY5wjs=;
        b=KoO571I9A2WARUD/4kVXjhesBZ5nVYmLrx9V6Fu1orOCCWyvs6mQ7pcC8M82Ts5sZN
         FkrpJUJtgtidBE3JHYOlRtAI5DlMWdvTXj0F4X1wZ0V2/fuAIz3hS8QFOHf7xeKYgfAN
         yMXD/bkVLzPs8AcCgkDy5UJ+Tq/cLdJVbakwipkjWzFpAeCVq+ImkfxxulwfVpoiTz+9
         uKsVsNR8Lh51c8Ck/2XVe07ZOaMwQwIHDPW9CS9l0+FdYqbR8x1hAgCedE8RXxJyUZkB
         fjOdBnEQfh35dzPmIpp0jPZoJ8V4Q+AlgYRBp+3dTEB/6GT83BrxTbHNPU29NlhG1M88
         2oKg==
X-Gm-Message-State: AOAM531iZwFheb7ZNGSsBjjjLrApHtdUknhTkSJmg1OdwczF9COrWjXq
        46AF+rCKGADkid9MUb4aJDk=
X-Google-Smtp-Source: ABdhPJzBvu4vNX3rq+Sr9fLDESRf+liLR4Ve21s0wdbMVPiZ8RDtaz9hNeI6G66m9jvKmmkDEcRZeQ==
X-Received: by 2002:a17:90b:3692:: with SMTP id mj18mr16606663pjb.44.1617430757530;
        Fri, 02 Apr 2021 23:19:17 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id n25sm9436174pff.154.2021.04.02.23.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 23:19:16 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] MIPS: add support for buggy MT7621S core detection
Date:   Fri,  2 Apr 2021 23:19:12 -0700
Message-Id: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most MT7621 SoCs have 2 cores, which is detected and supported properly
by CPS.

Unfortunately, MT7621 SoC has a less common S variant with only one core.
On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
starting SMP. CPULAUNCH registers can be used in that case to detect the
absence of the second core and override the GCR_CONFIG PCORES field.

Rework a long-standing OpenWrt patch to override the value of
mips_cps_numcores on single-core MT7621 systems.

Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
MT7621 device (Netgear R6220).

Original 4.14 OpenWrt patch:
Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
Current 5.10 OpenWrt patch:
Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904

Suggested-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/bugs.h | 18 ++++++++++++++++++
 arch/mips/kernel/smp-cps.c   |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d72dc6e1cf3c..d32f0c4e61f7 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -16,6 +16,7 @@
 
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
+#include <asm/mips-boards/launch.h>
 
 extern int daddiu_bug;
 
@@ -50,4 +51,21 @@ static inline int r4k_daddiu_bug(void)
 	return daddiu_bug != 0;
 }
 
+static inline void cm_gcr_pcores_bug(unsigned int *ncores)
+{
+	struct cpulaunch *launch;
+
+	if (!IS_ENABLED(CONFIG_SOC_MT7621) || !ncores)
+		return;
+
+	/*
+	 * Ralink MT7621S SoC is single core, but GCR_CONFIG always reports 2 cores.
+	 * Use legacy amon method to detect if the second core is missing.
+	 */
+	launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
+	launch += 2; /* MT7621 has 2 VPEs per core */
+	if (!(launch->flags & LAUNCH_FREADY))
+		*ncores = 1;
+}
+
 #endif /* _ASM_BUGS_H */
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bcd6a944b839..e1e9c11e8a7c 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -15,6 +15,7 @@
 #include <linux/irq.h>
 
 #include <asm/bcache.h>
+#include <asm/bugs.h>
 #include <asm/mips-cps.h>
 #include <asm/mips_mt.h>
 #include <asm/mipsregs.h>
@@ -60,6 +61,7 @@ static void __init cps_smp_setup(void)
 		pr_cont("{");
 
 		ncores = mips_cps_numcores(cl);
+		cm_gcr_pcores_bug(&ncores);
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
 
@@ -170,6 +172,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 
 	/* Allocate core boot configuration structs */
 	ncores = mips_cps_numcores(0);
+	cm_gcr_pcores_bug(&ncores);
 	mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
 					GFP_KERNEL);
 	if (!mips_cps_core_bootcfg) {
-- 
2.31.1

