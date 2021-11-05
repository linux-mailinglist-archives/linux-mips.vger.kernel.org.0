Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EA64467F0
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 18:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbhKEReA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 13:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbhKEReA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 13:34:00 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDEBC061714;
        Fri,  5 Nov 2021 10:31:20 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id x16-20020a17090a789000b001a69735b339so3866944pjk.5;
        Fri, 05 Nov 2021 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WMzkrHr59m2ZG/jV9qg4q2Bh66A+DhAoboqBDdBPlwg=;
        b=pdlwk+zN2ZMDIIXzMkslenGOvmjPTuvGGmLn+qdCn989MTXXwA3De2/CbKNh4S+Kc3
         pgCsO9ayyQZkAWbAhwW4lGBKXCWje8RFKvZgDxVw7vL4Fxmx5TReQRHX2RhVXEyPpG3/
         EpXAGwtXOXM02IRlXYCW53epZQt3EUtDxJpy3WtaLVTPpE/Tc1bBvY0gXUK7RJvfbOVt
         kTGmEdNeVD0NgP7SLOwFiQuDruXZaDeP9uWeypkxJb8HoTSRgud7hKaWn0e3iZ/w/uL4
         WbhtdNsqr5RKxw76ACrihbPcZoBDRgTql2PAd/hl2rkVZwdwo6a32Bourv/8HEn6RxG7
         pTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WMzkrHr59m2ZG/jV9qg4q2Bh66A+DhAoboqBDdBPlwg=;
        b=qXN5DqypIQ7WmPh5LG36m6pZtrrF7/iIX1w91WtZA2DZr/wUedUUBgU0AvfCThhFlM
         5QebsQ5GpTrbdk+6h/eU34atQwHgOIKQP1z439uI1XQnvsQeJXqdnbnQOLbjCla4T8pD
         Ufn35eggeBrKfUpXbH/Co6uGXmTiA/r5Ty2cKJcvhVWDKWXywsgKHNFTyEjxo/yJMpTn
         DEfn2Vw1o3tGLRlahc7EwjjQUCjMGwTc+4c8513tgzTH2FFdQrjQ/9c9c9QHXHtNeu61
         TBlkTClmcch8hCONN+0vTODfJUksex3/M3O8mWPskhP4y25SFLcYCiFGXf3EWG3LQUIa
         qx7Q==
X-Gm-Message-State: AOAM532PBFPbFQP8bRAdBnnqcXwOM1qjsl26bQcT3TnvXTRbF0GaZ9uD
        BNFiW3oN+ZKnRMslplLED8e14qJQTBs=
X-Google-Smtp-Source: ABdhPJzmp+xnqaWBEP9kTG6D6csISGiyYk0RplIYzxHtvj2OSjn7ggvkM6+PWO5l8XsQn2qFisrYYQ==
X-Received: by 2002:a17:902:be0c:b0:13e:2b53:d3 with SMTP id r12-20020a170902be0c00b0013e2b5300d3mr52680305pls.86.1636133479647;
        Fri, 05 Nov 2021 10:31:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y9sm10183768pjt.27.2021.11.05.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 10:31:19 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE), Mike Rapoport <rppt@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Serge Semin <fancer.lancer@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Liam Howlett <liam.howlett@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH] MIPS: Allow modules to set board_be_handler
Date:   Fri,  5 Nov 2021 10:30:47 -0700
Message-Id: <20211105173110.1237734-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After making the brcmstb_gisb driver modular with 707a4cdf86e5 ("bus:
brcmstb_gisb: Allow building as module") Guenter reported that mips
allmodconfig failed to link because board_be_handler was referenced.

Thomas indicated that if we were to continue making the brcmstb_gisb
driver modular for MIPS we would need to introduce a function that
allows setting the board_be_handler and export that function towards
modules.

This is what is being done here: board_be_handler is made static and is
now settable with a mips_set_be_handler() function which is exported.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Fixes: 707a4cdf86e5 ("bus: brcmstb_gisb: Allow building as module")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/dec/setup.c                 | 6 +++---
 arch/mips/include/asm/traps.h         | 2 +-
 arch/mips/kernel/traps.c              | 8 +++++++-
 arch/mips/sgi-ip22/ip22-berr.c        | 2 +-
 arch/mips/sgi-ip22/ip28-berr.c        | 2 +-
 arch/mips/sgi-ip27/ip27-berr.c        | 2 +-
 arch/mips/sgi-ip32/ip32-berr.c        | 2 +-
 arch/mips/sibyte/swarm/setup.c        | 2 +-
 arch/mips/txx9/generic/setup_tx4927.c | 2 +-
 arch/mips/txx9/generic/setup_tx4938.c | 2 +-
 arch/mips/txx9/generic/setup_tx4939.c | 2 +-
 drivers/bus/brcmstb_gisb.c            | 2 +-
 12 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index eaad0ed4b523..a8a30bb1dee8 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -117,21 +117,21 @@ static void __init dec_be_init(void)
 {
 	switch (mips_machtype) {
 	case MACH_DS23100:	/* DS2100/DS3100 Pmin/Pmax */
-		board_be_handler = dec_kn01_be_handler;
+		mips_set_be_handler(dec_kn01_be_handler);
 		busirq_handler = dec_kn01_be_interrupt;
 		busirq_flags |= IRQF_SHARED;
 		dec_kn01_be_init();
 		break;
 	case MACH_DS5000_1XX:	/* DS5000/1xx 3min */
 	case MACH_DS5000_XX:	/* DS5000/xx Maxine */
-		board_be_handler = dec_kn02xa_be_handler;
+		mips_set_be_handler(dec_kn02xa_be_handler);
 		busirq_handler = dec_kn02xa_be_interrupt;
 		dec_kn02xa_be_init();
 		break;
 	case MACH_DS5000_200:	/* DS5000/200 3max */
 	case MACH_DS5000_2X0:	/* DS5000/240 3max+ */
 	case MACH_DS5900:	/* DS5900 bigmax */
-		board_be_handler = dec_ecc_be_handler;
+		mips_set_be_handler(dec_ecc_be_handler);
 		busirq_handler = dec_ecc_be_interrupt;
 		dec_ecc_be_init();
 		break;
diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index b710e76c9c65..15cde638b407 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -15,7 +15,7 @@
 #define MIPS_BE_FATAL	2		/* treat as an unrecoverable error */
 
 extern void (*board_be_init)(void);
-extern int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
+void mips_set_be_handler(int (*handler)(struct pt_regs *reg, int is_fixup));
 
 extern void (*board_nmi_handler_setup)(void);
 extern void (*board_ejtag_handler_setup)(void);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6f07362de5ce..d26b0fb8ea06 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -103,13 +103,19 @@ extern asmlinkage void handle_reserved(void);
 extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
-int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
+static int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
 void (*board_nmi_handler_setup)(void);
 void (*board_ejtag_handler_setup)(void);
 void (*board_bind_eic_interrupt)(int irq, int regset);
 void (*board_ebase_setup)(void);
 void(*board_cache_error_setup)(void);
 
+void mips_set_be_handler(int (*handler)(struct pt_regs *regs, int is_fixup))
+{
+	board_be_handler = handler;
+}
+EXPORT_SYMBOL_GPL(mips_set_be_handler);
+
 static void show_raw_backtrace(unsigned long reg29, const char *loglvl,
 			       bool user)
 {
diff --git a/arch/mips/sgi-ip22/ip22-berr.c b/arch/mips/sgi-ip22/ip22-berr.c
index dc0110a607a5..afe8a61078e4 100644
--- a/arch/mips/sgi-ip22/ip22-berr.c
+++ b/arch/mips/sgi-ip22/ip22-berr.c
@@ -112,5 +112,5 @@ static int ip22_be_handler(struct pt_regs *regs, int is_fixup)
 
 void __init ip22_be_init(void)
 {
-	board_be_handler = ip22_be_handler;
+	mips_set_be_handler(ip22_be_handler);
 }
diff --git a/arch/mips/sgi-ip22/ip28-berr.c b/arch/mips/sgi-ip22/ip28-berr.c
index c61362d9ea95..16ca470deb80 100644
--- a/arch/mips/sgi-ip22/ip28-berr.c
+++ b/arch/mips/sgi-ip22/ip28-berr.c
@@ -468,7 +468,7 @@ static int ip28_be_handler(struct pt_regs *regs, int is_fixup)
 
 void __init ip22_be_init(void)
 {
-	board_be_handler = ip28_be_handler;
+	mips_set_be_handler(ip28_be_handler);
 }
 
 int ip28_show_be_info(struct seq_file *m)
diff --git a/arch/mips/sgi-ip27/ip27-berr.c b/arch/mips/sgi-ip27/ip27-berr.c
index 5a38ae6bdfa9..923a63a51cda 100644
--- a/arch/mips/sgi-ip27/ip27-berr.c
+++ b/arch/mips/sgi-ip27/ip27-berr.c
@@ -85,7 +85,7 @@ void __init ip27_be_init(void)
 	int cpu = LOCAL_HUB_L(PI_CPU_NUM);
 	int cpuoff = cpu << 8;
 
-	board_be_handler = ip27_be_handler;
+	mips_set_be_handler(ip27_be_handler);
 
 	LOCAL_HUB_S(PI_ERR_INT_PEND,
 		    cpu ? PI_ERR_CLEAR_ALL_B : PI_ERR_CLEAR_ALL_A);
diff --git a/arch/mips/sgi-ip32/ip32-berr.c b/arch/mips/sgi-ip32/ip32-berr.c
index c860f95ab7ed..478b63b4c808 100644
--- a/arch/mips/sgi-ip32/ip32-berr.c
+++ b/arch/mips/sgi-ip32/ip32-berr.c
@@ -34,5 +34,5 @@ static int ip32_be_handler(struct pt_regs *regs, int is_fixup)
 
 void __init ip32_be_init(void)
 {
-	board_be_handler = ip32_be_handler;
+	mips_set_be_handler(ip32_be_handler);
 }
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index f07b15dd1c1a..72a31eeeebba 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -122,7 +122,7 @@ void __init plat_mem_setup(void)
 #error invalid SiByte board configuration
 #endif
 
-	board_be_handler = swarm_be_handler;
+	mips_set_be_handler(swarm_be_handler);
 
 	if (xicor_probe())
 		swarm_rtc_type = RTC_XICOR;
diff --git a/arch/mips/txx9/generic/setup_tx4927.c b/arch/mips/txx9/generic/setup_tx4927.c
index 46e9c4101386..63f9725b2eb0 100644
--- a/arch/mips/txx9/generic/setup_tx4927.c
+++ b/arch/mips/txx9/generic/setup_tx4927.c
@@ -80,7 +80,7 @@ static int tx4927_be_handler(struct pt_regs *regs, int is_fixup)
 }
 static void __init tx4927_be_init(void)
 {
-	board_be_handler = tx4927_be_handler;
+	mips_set_be_handler(tx4927_be_handler);
 }
 
 static struct resource tx4927_sdram_resource[4];
diff --git a/arch/mips/txx9/generic/setup_tx4938.c b/arch/mips/txx9/generic/setup_tx4938.c
index 17395d5d15ca..ba646548c5f6 100644
--- a/arch/mips/txx9/generic/setup_tx4938.c
+++ b/arch/mips/txx9/generic/setup_tx4938.c
@@ -82,7 +82,7 @@ static int tx4938_be_handler(struct pt_regs *regs, int is_fixup)
 }
 static void __init tx4938_be_init(void)
 {
-	board_be_handler = tx4938_be_handler;
+	mips_set_be_handler(tx4938_be_handler);
 }
 
 static struct resource tx4938_sdram_resource[4];
diff --git a/arch/mips/txx9/generic/setup_tx4939.c b/arch/mips/txx9/generic/setup_tx4939.c
index bf8a3cdababf..f5f59b7401a3 100644
--- a/arch/mips/txx9/generic/setup_tx4939.c
+++ b/arch/mips/txx9/generic/setup_tx4939.c
@@ -86,7 +86,7 @@ static int tx4939_be_handler(struct pt_regs *regs, int is_fixup)
 }
 static void __init tx4939_be_init(void)
 {
-	board_be_handler = tx4939_be_handler;
+	mips_set_be_handler(tx4939_be_handler);
 }
 
 static struct resource tx4939_sdram_resource[4];
diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index 4c2f7d61cb9b..183d5cc37d42 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -485,7 +485,7 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
 	list_add_tail(&gdev->next, &brcmstb_gisb_arb_device_list);
 
 #ifdef CONFIG_MIPS
-	board_be_handler = brcmstb_bus_error_handler;
+	mips_set_be_handler(brcmstb_bus_error_handler);
 #endif
 
 	if (list_is_singular(&brcmstb_gisb_arb_device_list)) {
-- 
2.25.1

