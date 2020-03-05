Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059E417A4AF
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 12:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgCEL6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 06:58:18 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45275 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbgCEL6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 06:58:18 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22so2534248pls.12;
        Thu, 05 Mar 2020 03:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YBCWIftnji8KXlcP4FlcX6AwfPMaFSNsITfb4TouwxE=;
        b=dMG7Pl8s/RaOvOWL+15vuLA1Qvu0KErUNwpyjHijqhlIEPd16I1h1qPVL8Y8ElmBrX
         0egDKXGFIGAcEG0mqQRyGuN+hTrH/QkbYnkqMdzPizA5pR+ywFXVkWqi2cjIGSNlagf0
         7arU9PPPt2Cnp7I+U47cB76SgehpMVs4bDc1OjEb6T7ctQd/ESNPoGnWxH11GsLOK7Mr
         VCITCnHmT49GG/z1ghUaSEZ56jJPRxheIIB2s4n/inr+6TtYHh7wMi8xJaZzPSwVbkjt
         cMyhEXC0AXwuDwfr1GMjkxi3dt7c4RIBBThj5xfBARsgYvd9fzWlxKvyRYYa0kJ8qDbj
         M17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YBCWIftnji8KXlcP4FlcX6AwfPMaFSNsITfb4TouwxE=;
        b=R0bAPrP4gd+c6xq5+vVCRej6keFfCTD9beEC1KDRyezLlYh4sdlT0P2TMF6jasvDqO
         fa359ByJ57z5jbmWJehOLmzVMgGELd/J6M5Xy/QsIBmUMACF/0BvXKD779x2vyCQOMRI
         J+khle9G6PkkQh6Moo+7H4Glwje41r1HiSE4XBWkAeoLhgOv2COSbk6izNSSkgwFHy8U
         EFTrezuYIKtd0sxClrI2cC61hhZc/Qbq2WCPSsUgcRZB7NzDyJ03tIveYd/rKl7OLUjT
         Zd7C0/VJIl04PtxDJwaYllZkqrH8t7QCklB5qYs0uBklkk5RqebiWNnQmP4XkAAcodL1
         fQog==
X-Gm-Message-State: ANhLgQ3tk8l/GBtHnONg5sPUNnoxWwQWCIenTmAYyQxbrVQsswjiqjHX
        cMtOxi7+4jQCGa0hyr4/GUDD+nhK
X-Google-Smtp-Source: ADFU+vsY/Alvug7Lcl6tymiZt4TfBuwssYhIUV/YzYYDWaEW/c0ZRgTw1YULriVoYRJFIgiMyvBVmw==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr8170822pjb.155.1583409493771;
        Thu, 05 Mar 2020 03:58:13 -0800 (PST)
Received: from localhost.localdomain ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id b27sm31753372pgl.77.2020.03.05.03.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 03:58:12 -0800 (PST)
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Date:   Thu,  5 Mar 2020 17:27:53 +0530
Message-Id: <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200304203144.GA4323@alpha.franken.de>
References: <20200304203144.GA4323@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

request_irq() is preferred over setup_irq(). Invocations of setup_irq()
occur after memory allocators are ready.

Per tglx[1], setup_irq() existed in olden days when allocators were not
ready by the time early interrupts were initialized.

Hence replace setup_irq() by request_irq().

remove_irq() has been replaced by free_irq() as well.

There were build error's during previous version, couple of which was
reported by kbuild test robot <lkp@intel.com> of which one was reported
by Thomas Bogendoerfer <tsbogend@alpha.franken.de> as well. There were a
few more issues including build errors, those also have been fixed.

[1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---

Link to v3, v2 & v1,
[v3] https://lkml.kernel.org/r/20200304005549.5832-1-afzal.mohd.ma@gmail.com
[v2] https://lkml.kernel.org/r/cover.1582471508.git.afzal.mohd.ma@gmail.com
[v1] https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

v4:
 * Fix build errors reported by Thomas & kbuild test robot as well as
	additional issues including build errors

v3:
 * Split out from tree wide series, as Thomas suggested to get it thr'
	respective maintainers
 * Modify pr_err displayed in case of error
 * Re-arrange code & choose pr_err args as required to improve readability
 * Remove irrelevant parts from commit message & improve
 
v2:
 * Replace pr_err("request_irq() on %s failed" by
           pr_err("%s: request_irq() failed"
 * Commit message massage

 arch/mips/alchemy/common/time.c               | 11 +---
 arch/mips/ar7/irq.c                           | 16 ++---
 arch/mips/ath25/ar2315.c                      |  9 +--
 arch/mips/ath25/ar5312.c                      |  9 +--
 arch/mips/bcm63xx/irq.c                       | 41 +++++--------
 arch/mips/cobalt/irq.c                        | 18 +++---
 arch/mips/dec/setup.c                         | 59 ++++++++-----------
 arch/mips/emma/markeins/irq.c                 | 21 ++++---
 arch/mips/include/asm/sni.h                   |  4 +-
 arch/mips/jazz/irq.c                          | 12 +---
 arch/mips/kernel/cevt-bcm1480.c               | 11 +---
 arch/mips/kernel/cevt-ds1287.c                |  9 +--
 arch/mips/kernel/cevt-gt641xx.c               |  9 +--
 arch/mips/kernel/cevt-r4k.c                   |  4 +-
 arch/mips/kernel/cevt-sb1250.c                | 11 +---
 arch/mips/kernel/cevt-txx9.c                  | 11 +---
 arch/mips/kernel/i8253.c                      | 11 ++--
 arch/mips/kernel/rtlx-mt.c                    |  8 +--
 arch/mips/kernel/smp.c                        | 33 ++++-------
 arch/mips/lasat/interrupt.c                   | 10 +---
 arch/mips/loongson2ef/common/bonito-irq.c     |  9 +--
 .../loongson2ef/common/cs5536/cs5536_mfgpt.c  | 10 +---
 arch/mips/loongson2ef/fuloong-2e/irq.c        | 16 ++---
 arch/mips/loongson2ef/lemote-2f/irq.c         | 20 ++-----
 arch/mips/loongson32/common/irq.c             | 21 ++++---
 arch/mips/loongson32/common/time.c            | 12 ++--
 arch/mips/loongson64/hpet.c                   | 10 +---
 arch/mips/mti-malta/malta-int.c               | 10 +---
 arch/mips/netlogic/xlr/fmn.c                  | 11 +---
 arch/mips/pmcs-msp71xx/msp_irq.c              | 28 ++++-----
 arch/mips/pmcs-msp71xx/msp_smp.c              | 22 ++-----
 arch/mips/pmcs-msp71xx/msp_time.c             |  8 ++-
 arch/mips/ralink/cevt-rt3352.c                | 18 +++---
 arch/mips/sgi-ip22/ip22-eisa.c                | 10 +---
 arch/mips/sgi-ip22/ip22-int.c                 | 49 +++++----------
 arch/mips/sgi-ip32/ip32-irq.c                 | 18 ++----
 arch/mips/sni/a20r.c                          |  4 +-
 arch/mips/sni/irq.c                           |  8 +--
 arch/mips/sni/pcit.c                          |  8 ++-
 arch/mips/sni/rm200.c                         | 23 +++-----
 arch/mips/sni/time.c                          | 12 +---
 arch/mips/vr41xx/common/irq.c                 |  9 +--
 42 files changed, 240 insertions(+), 413 deletions(-)

diff --git a/arch/mips/alchemy/common/time.c b/arch/mips/alchemy/common/time.c
index 3a21a6a18da7..d794ffb67412 100644
--- a/arch/mips/alchemy/common/time.c
+++ b/arch/mips/alchemy/common/time.c
@@ -72,13 +72,6 @@ static struct clock_event_device au1x_rtcmatch2_clockdev = {
 	.cpumask	= cpu_possible_mask,
 };
 
-static struct irqaction au1x_rtcmatch2_irqaction = {
-	.handler	= au1x_rtcmatch2_irq,
-	.flags		= IRQF_TIMER,
-	.name		= "timer",
-	.dev_id		= &au1x_rtcmatch2_clockdev,
-};
-
 static int __init alchemy_time_init(unsigned int m2int)
 {
 	struct clock_event_device *cd = &au1x_rtcmatch2_clockdev;
@@ -130,7 +123,9 @@ static int __init alchemy_time_init(unsigned int m2int)
 	cd->min_delta_ns = clockevent_delta2ns(9, cd);
 	cd->min_delta_ticks = 9;	/* ~0.28ms */
 	clockevents_register_device(cd);
-	setup_irq(m2int, &au1x_rtcmatch2_irqaction);
+	if (request_irq(m2int, au1x_rtcmatch2_irq, IRQF_TIMER, "timer",
+			&au1x_rtcmatch2_clockdev))
+		pr_err("Failed to register timer interrupt\n");
 
 	printk(KERN_INFO "Alchemy clocksource installed\n");
 
diff --git a/arch/mips/ar7/irq.c b/arch/mips/ar7/irq.c
index 93a331fe0641..f0a7942d393e 100644
--- a/arch/mips/ar7/irq.c
+++ b/arch/mips/ar7/irq.c
@@ -83,12 +83,6 @@ static struct irq_chip ar7_sec_irq_type = {
 	.irq_ack = ar7_ack_sec_irq,
 };
 
-static struct irqaction ar7_cascade_action = {
-	.handler = no_action,
-	.name = "AR7 cascade interrupt",
-	.flags = IRQF_NO_THREAD,
-};
-
 static void __init ar7_irq_init(int base)
 {
 	int i;
@@ -116,8 +110,14 @@ static void __init ar7_irq_init(int base)
 						 handle_level_irq);
 	}
 
-	setup_irq(2, &ar7_cascade_action);
-	setup_irq(ar7_irq_base, &ar7_cascade_action);
+	if (request_irq(2, no_action, IRQF_NO_THREAD, "AR7 cascade interrupt",
+			NULL))
+		pr_err("Failed to request irq 2 (AR7 cascade interrupt)\n");
+	if (request_irq(ar7_irq_base, no_action, IRQF_NO_THREAD,
+			"AR7 cascade interrupt", NULL)) {
+		pr_err("Failed to request irq %d (AR7 cascade interrupt)\n",
+		       ar7_irq_base);
+	}
 	set_c0_status(IE_IRQ0);
 }
 
diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index 24f619199ee7..e7b53e3960c8 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -64,11 +64,6 @@ static irqreturn_t ar2315_ahb_err_handler(int cpl, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction ar2315_ahb_err_interrupt  = {
-	.handler	= ar2315_ahb_err_handler,
-	.name		= "ar2315-ahb-error",
-};
-
 static void ar2315_misc_irq_handler(struct irq_desc *desc)
 {
 	u32 pending = ar2315_rst_reg_read(AR2315_ISR) &
@@ -159,7 +154,9 @@ void __init ar2315_arch_init_irq(void)
 		panic("Failed to add IRQ domain");
 
 	irq = irq_create_mapping(domain, AR2315_MISC_IRQ_AHB);
-	setup_irq(irq, &ar2315_ahb_err_interrupt);
+	if (request_irq(irq, ar2315_ahb_err_handler, 0, "ar2315-ahb-error",
+			NULL))
+		pr_err("Failed to register ar2315-ahb-error interrupt\n");
 
 	irq_set_chained_handler_and_data(AR2315_IRQ_MISC,
 					 ar2315_misc_irq_handler, domain);
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index 47f3e98974fc..42bf2afb4765 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -68,11 +68,6 @@ static irqreturn_t ar5312_ahb_err_handler(int cpl, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction ar5312_ahb_err_interrupt  = {
-	.handler = ar5312_ahb_err_handler,
-	.name    = "ar5312-ahb-error",
-};
-
 static void ar5312_misc_irq_handler(struct irq_desc *desc)
 {
 	u32 pending = ar5312_rst_reg_read(AR5312_ISR) &
@@ -154,7 +149,9 @@ void __init ar5312_arch_init_irq(void)
 		panic("Failed to add IRQ domain");
 
 	irq = irq_create_mapping(domain, AR5312_MISC_IRQ_AHB_PROC);
-	setup_irq(irq, &ar5312_ahb_err_interrupt);
+	if (request_irq(irq, ar5312_ahb_err_handler, 0, "ar5312-ahb-error",
+			NULL))
+		pr_err("Failed to register ar5312-ahb-error interrupt\n");
 
 	irq_set_chained_handler_and_data(AR5312_IRQ_MISC,
 					 ar5312_misc_irq_handler, domain);
diff --git a/arch/mips/bcm63xx/irq.c b/arch/mips/bcm63xx/irq.c
index ec694b9628c0..2548013442f6 100644
--- a/arch/mips/bcm63xx/irq.c
+++ b/arch/mips/bcm63xx/irq.c
@@ -399,26 +399,6 @@ static struct irq_chip bcm63xx_external_irq_chip = {
 	.irq_set_type	= bcm63xx_external_irq_set_type,
 };
 
-static struct irqaction cpu_ip2_cascade_action = {
-	.handler	= no_action,
-	.name		= "cascade_ip2",
-	.flags		= IRQF_NO_THREAD,
-};
-
-#ifdef CONFIG_SMP
-static struct irqaction cpu_ip3_cascade_action = {
-	.handler	= no_action,
-	.name		= "cascade_ip3",
-	.flags		= IRQF_NO_THREAD,
-};
-#endif
-
-static struct irqaction cpu_ext_cascade_action = {
-	.handler	= no_action,
-	.name		= "cascade_extirq",
-	.flags		= IRQF_NO_THREAD,
-};
-
 static void bcm63xx_init_irq(void)
 {
 	int irq_bits;
@@ -531,7 +511,7 @@ static void bcm63xx_init_irq(void)
 
 void __init arch_init_irq(void)
 {
-	int i;
+	int i, irq;
 
 	bcm63xx_init_irq();
 	mips_cpu_irq_init();
@@ -544,14 +524,25 @@ void __init arch_init_irq(void)
 					 handle_edge_irq);
 
 	if (!is_ext_irq_cascaded) {
-		for (i = 3; i < 3 + ext_irq_count; ++i)
-			setup_irq(MIPS_CPU_IRQ_BASE + i, &cpu_ext_cascade_action);
+		for (i = 3; i < 3 + ext_irq_count; ++i) {
+			irq = MIPS_CPU_IRQ_BASE + i;
+			if (request_irq(irq, no_action, IRQF_NO_THREAD,
+					"cascade_extirq", NULL)) {
+				pr_err("Failed to request irq %d (cascade_extirq)\n",
+				       irq);
+			}
+		}
 	}
 
-	setup_irq(MIPS_CPU_IRQ_BASE + 2, &cpu_ip2_cascade_action);
+	irq = MIPS_CPU_IRQ_BASE + 2;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD,	"cascade_ip2", NULL))
+		pr_err("Failed to request irq %d (cascade_ip2)\n", irq);
 #ifdef CONFIG_SMP
 	if (is_ext_irq_cascaded) {
-		setup_irq(MIPS_CPU_IRQ_BASE + 3, &cpu_ip3_cascade_action);
+		irq = MIPS_CPU_IRQ_BASE + 3;
+		if (request_irq(irq, no_action,	IRQF_NO_THREAD, "cascade_ip3",
+				NULL))
+			pr_err("Failed to request irq %d (cascade_ip3)\n", irq);
 		bcm63xx_internal_irq_chip.irq_set_affinity =
 			bcm63xx_internal_set_affinity;
 
diff --git a/arch/mips/cobalt/irq.c b/arch/mips/cobalt/irq.c
index 965c777d3561..ead5ae41378d 100644
--- a/arch/mips/cobalt/irq.c
+++ b/arch/mips/cobalt/irq.c
@@ -45,18 +45,20 @@ asmlinkage void plat_irq_dispatch(void)
 		spurious_interrupt();
 }
 
-static struct irqaction cascade = {
-	.handler	= no_action,
-	.name		= "cascade",
-	.flags		= IRQF_NO_THREAD,
-};
-
 void __init arch_init_irq(void)
 {
 	mips_cpu_irq_init();
 	gt641xx_irq_init();
 	init_i8259_irqs();
 
-	setup_irq(GT641XX_CASCADE_IRQ, &cascade);
-	setup_irq(I8259_CASCADE_IRQ, &cascade);
+	if (request_irq(GT641XX_CASCADE_IRQ, no_action, IRQF_NO_THREAD,
+			"cascade", NULL)) {
+		pr_err("Failed to request irq %d (cascade)\n",
+		       GT641XX_CASCADE_IRQ);
+	}
+	if (request_irq(I8259_CASCADE_IRQ, no_action, IRQF_NO_THREAD,
+			"cascade", NULL)) {
+		pr_err("Failed to request irq %d (cascade)\n",
+		       I8259_CASCADE_IRQ);
+	}
 }
diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index 61a0bf13e308..c8bbac0c5051 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -103,28 +103,8 @@ int_ptr asic_mask_nr_tbl[DEC_MAX_ASIC_INTS][2] = {
 int cpu_fpu_mask = DEC_CPU_IRQ_MASK(DEC_CPU_INR_FPU);
 int *fpu_kstat_irq;
 
-static struct irqaction ioirq = {
-	.handler = no_action,
-	.name = "cascade",
-	.flags = IRQF_NO_THREAD,
-};
-static struct irqaction fpuirq = {
-	.handler = no_action,
-	.name = "fpu",
-	.flags = IRQF_NO_THREAD,
-};
-
-static struct irqaction busirq = {
-	.name = "bus error",
-	.flags = IRQF_NO_THREAD,
-};
-
-static struct irqaction haltirq = {
-	.handler = dec_intr_halt,
-	.name = "halt",
-	.flags = IRQF_NO_THREAD,
-};
-
+static irq_handler_t busirq_handler;
+static unsigned int busirq_flags = IRQF_NO_THREAD;
 
 /*
  * Bus error (DBE/IBE exceptions and bus interrupts) handling setup.
@@ -134,21 +114,21 @@ static void __init dec_be_init(void)
 	switch (mips_machtype) {
 	case MACH_DS23100:	/* DS2100/DS3100 Pmin/Pmax */
 		board_be_handler = dec_kn01_be_handler;
-		busirq.handler = dec_kn01_be_interrupt;
-		busirq.flags |= IRQF_SHARED;
+		busirq_handler = dec_kn01_be_interrupt;
+		busirq_flags |= IRQF_SHARED;
 		dec_kn01_be_init();
 		break;
 	case MACH_DS5000_1XX:	/* DS5000/1xx 3min */
 	case MACH_DS5000_XX:	/* DS5000/xx Maxine */
 		board_be_handler = dec_kn02xa_be_handler;
-		busirq.handler = dec_kn02xa_be_interrupt;
+		busirq_handler = dec_kn02xa_be_interrupt;
 		dec_kn02xa_be_init();
 		break;
 	case MACH_DS5000_200:	/* DS5000/200 3max */
 	case MACH_DS5000_2X0:	/* DS5000/240 3max+ */
 	case MACH_DS5900:	/* DS5900 bigmax */
 		board_be_handler = dec_ecc_be_handler;
-		busirq.handler = dec_ecc_be_interrupt;
+		busirq_handler = dec_ecc_be_interrupt;
 		dec_ecc_be_init();
 		break;
 	}
@@ -764,20 +744,29 @@ void __init arch_init_irq(void)
 		int irq_fpu;
 
 		irq_fpu = dec_interrupt[DEC_IRQ_FPU];
-		setup_irq(irq_fpu, &fpuirq);
+		if (request_irq(irq_fpu, no_action, IRQF_NO_THREAD, "fpu",
+				NULL))
+			pr_err("Failed to register fpu interrupt\n");
 		desc_fpu = irq_to_desc(irq_fpu);
 		fpu_kstat_irq = this_cpu_ptr(desc_fpu->kstat_irqs);
 	}
-	if (dec_interrupt[DEC_IRQ_CASCADE] >= 0)
-		setup_irq(dec_interrupt[DEC_IRQ_CASCADE], &ioirq);
-
+	if (dec_interrupt[DEC_IRQ_CASCADE] >= 0) {
+		if (request_irq(dec_interrupt[DEC_IRQ_CASCADE], no_action,
+				IRQF_NO_THREAD, "cascade", NULL))
+			pr_err("Failed to register cascade interrupt\n");
+	}
 	/* Register the bus error interrupt. */
-	if (dec_interrupt[DEC_IRQ_BUS] >= 0 && busirq.handler)
-		setup_irq(dec_interrupt[DEC_IRQ_BUS], &busirq);
-
+	if (dec_interrupt[DEC_IRQ_BUS] >= 0 && busirq_handler) {
+		if (request_irq(dec_interrupt[DEC_IRQ_BUS], busirq_handler,
+				busirq_flags, "bus error", NULL))
+			pr_err("Failed to register bus error interrupt\n");
+	}
 	/* Register the HALT interrupt. */
-	if (dec_interrupt[DEC_IRQ_HALT] >= 0)
-		setup_irq(dec_interrupt[DEC_IRQ_HALT], &haltirq);
+	if (dec_interrupt[DEC_IRQ_HALT] >= 0) {
+		if (request_irq(dec_interrupt[DEC_IRQ_HALT], dec_intr_halt,
+				IRQF_NO_THREAD, "halt", NULL))
+			pr_err("Failed to register halt interrupt\n");
+	}
 }
 
 asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
diff --git a/arch/mips/emma/markeins/irq.c b/arch/mips/emma/markeins/irq.c
index 09427a49e7ae..4aebf559be2e 100644
--- a/arch/mips/emma/markeins/irq.c
+++ b/arch/mips/emma/markeins/irq.c
@@ -153,14 +153,6 @@ void emma2rh_gpio_irq_init(void)
 					      handle_edge_irq, "edge");
 }
 
-static struct irqaction irq_cascade = {
-	   .handler = no_action,
-	   .flags = IRQF_NO_THREAD,
-	   .name = "cascade",
-	   .dev_id = NULL,
-	   .next = NULL,
-};
-
 /*
  * the first level int-handler will jump here if it is a emma2rh irq
  */
@@ -236,6 +228,7 @@ void emma2rh_irq_dispatch(void)
 void __init arch_init_irq(void)
 {
 	u32 reg;
+	int irq;
 
 	/* by default, interrupts are disabled. */
 	emma2rh_out32(EMMA2RH_BHIF_INT_EN_0, 0);
@@ -272,9 +265,15 @@ void __init arch_init_irq(void)
 	mips_cpu_irq_init();
 
 	/* setup cascade interrupts */
-	setup_irq(EMMA2RH_IRQ_BASE + EMMA2RH_SW_CASCADE, &irq_cascade);
-	setup_irq(EMMA2RH_IRQ_BASE + EMMA2RH_GPIO_CASCADE, &irq_cascade);
-	setup_irq(MIPS_CPU_IRQ_BASE + 2, &irq_cascade);
+	irq = EMMA2RH_IRQ_BASE + EMMA2RH_SW_CASCADE;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
+	irq = EMMA2RH_IRQ_BASE + EMMA2RH_GPIO_CASCADE;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
+	irq = MIPS_CPU_IRQ_BASE + 2;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
 }
 
 asmlinkage void plat_irq_dispatch(void)
diff --git a/arch/mips/include/asm/sni.h b/arch/mips/include/asm/sni.h
index a107201a2e1e..7dfa297ce597 100644
--- a/arch/mips/include/asm/sni.h
+++ b/arch/mips/include/asm/sni.h
@@ -11,6 +11,8 @@
 #ifndef __ASM_SNI_H
 #define __ASM_SNI_H
 
+#include <linux/irqreturn.h>
+
 extern unsigned int sni_brd_type;
 
 #define SNI_BRD_10		   2
@@ -239,6 +241,6 @@ static inline int sni_eisa_root_init(void)
 
 /* common irq stuff */
 extern void (*sni_hwint)(void);
-extern struct irqaction sni_isa_irq;
+extern irqreturn_t sni_isa_irq_handler(int dummy, void *p);
 
 #endif /* __ASM_SNI_H */
diff --git a/arch/mips/jazz/irq.c b/arch/mips/jazz/irq.c
index 5d6828b2a750..04b9c4068493 100644
--- a/arch/mips/jazz/irq.c
+++ b/arch/mips/jazz/irq.c
@@ -125,24 +125,18 @@ static irqreturn_t r4030_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction r4030_timer_irqaction = {
-	.handler	= r4030_timer_interrupt,
-	.flags		= IRQF_TIMER,
-	.name		= "R4030 timer",
-};
-
 void __init plat_time_init(void)
 {
 	struct clock_event_device *cd = &r4030_clockevent;
-	struct irqaction *action = &r4030_timer_irqaction;
 	unsigned int cpu = smp_processor_id();
 
 	BUG_ON(HZ != 100);
 
 	cd->cpumask		= cpumask_of(cpu);
 	clockevents_register_device(cd);
-	action->dev_id = cd;
-	setup_irq(JAZZ_TIMER_IRQ, action);
+	if (request_irq(JAZZ_TIMER_IRQ, r4030_timer_interrupt, IRQF_TIMER,
+			"R4030 timer", cd))
+		pr_err("Failed to register R4030 timer interrupt\n");
 
 	/*
 	 * Set clock to 100Hz.
diff --git a/arch/mips/kernel/cevt-bcm1480.c b/arch/mips/kernel/cevt-bcm1480.c
index b3e8c11a8fa5..d39a2963b451 100644
--- a/arch/mips/kernel/cevt-bcm1480.c
+++ b/arch/mips/kernel/cevt-bcm1480.c
@@ -91,16 +91,15 @@ static irqreturn_t sibyte_counter_handler(int irq, void *dev_id)
 }
 
 static DEFINE_PER_CPU(struct clock_event_device, sibyte_hpt_clockevent);
-static DEFINE_PER_CPU(struct irqaction, sibyte_hpt_irqaction);
 static DEFINE_PER_CPU(char [18], sibyte_hpt_name);
 
 void sb1480_clockevent_init(void)
 {
 	unsigned int cpu = smp_processor_id();
 	unsigned int irq = K_BCM1480_INT_TIMER_0 + cpu;
-	struct irqaction *action = &per_cpu(sibyte_hpt_irqaction, cpu);
 	struct clock_event_device *cd = &per_cpu(sibyte_hpt_clockevent, cpu);
 	unsigned char *name = per_cpu(sibyte_hpt_name, cpu);
+	unsigned long flags =  IRQF_PERCPU | IRQF_TIMER;
 
 	BUG_ON(cpu > 3);	/* Only have 4 general purpose timers */
 
@@ -133,11 +132,7 @@ void sb1480_clockevent_init(void)
 
 	bcm1480_unmask_irq(cpu, irq);
 
-	action->handler = sibyte_counter_handler;
-	action->flags	= IRQF_PERCPU | IRQF_TIMER;
-	action->name	= name;
-	action->dev_id	= cd;
-
 	irq_set_affinity(irq, cpumask_of(cpu));
-	setup_irq(irq, action);
+	if (request_irq(irq, sibyte_counter_handler, flags, name, cd))
+		pr_err("Failed to request irq %d (%s)\n", irq, name);
 }
diff --git a/arch/mips/kernel/cevt-ds1287.c b/arch/mips/kernel/cevt-ds1287.c
index 1e1edab4a63f..9a47fbcd4638 100644
--- a/arch/mips/kernel/cevt-ds1287.c
+++ b/arch/mips/kernel/cevt-ds1287.c
@@ -100,14 +100,9 @@ static irqreturn_t ds1287_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction ds1287_irqaction = {
-	.handler	= ds1287_interrupt,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "ds1287",
-};
-
 int __init ds1287_clockevent_init(int irq)
 {
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER;
 	struct clock_event_device *cd;
 
 	cd = &ds1287_clockevent;
@@ -122,5 +117,5 @@ int __init ds1287_clockevent_init(int irq)
 
 	clockevents_register_device(&ds1287_clockevent);
 
-	return setup_irq(irq, &ds1287_irqaction);
+	return request_irq(irq, ds1287_interrupt, flags, "ds1287", NULL);
 }
diff --git a/arch/mips/kernel/cevt-gt641xx.c b/arch/mips/kernel/cevt-gt641xx.c
index eb53548d2538..5b132e8c51da 100644
--- a/arch/mips/kernel/cevt-gt641xx.c
+++ b/arch/mips/kernel/cevt-gt641xx.c
@@ -120,12 +120,6 @@ static irqreturn_t gt641xx_timer0_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction gt641xx_timer0_irqaction = {
-	.handler	= gt641xx_timer0_interrupt,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "gt641xx_timer0",
-};
-
 static int __init gt641xx_timer0_clockevent_init(void)
 {
 	struct clock_event_device *cd;
@@ -146,6 +140,7 @@ static int __init gt641xx_timer0_clockevent_init(void)
 
 	clockevents_register_device(&gt641xx_timer0_clockevent);
 
-	return setup_irq(GT641XX_TIMER0_IRQ, &gt641xx_timer0_irqaction);
+	return request_irq(GT641XX_TIMER0_IRQ, gt641xx_timer0_interrupt,
+			   IRQF_PERCPU | IRQF_TIMER, "gt641xx_timer0", NULL);
 }
 arch_initcall(gt641xx_timer0_clockevent_init);
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index dd6a18bc10ab..64e917dfe6b2 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -252,6 +252,7 @@ unsigned int __weak get_c0_compare_int(void)
 
 int r4k_clockevent_init(void)
 {
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
 	unsigned int cpu = smp_processor_id();
 	struct clock_event_device *cd;
 	unsigned int irq, min_delta;
@@ -291,7 +292,8 @@ int r4k_clockevent_init(void)
 
 	cp0_timer_irq_installed = 1;
 
-	setup_irq(irq, &c0_compare_irqaction);
+	if (request_irq(irq, c0_compare_interrupt, flags, "timer", NULL))
+		pr_err("Failed to request irq %d (timer)\n", irq);
 
 	return 0;
 }
diff --git a/arch/mips/kernel/cevt-sb1250.c b/arch/mips/kernel/cevt-sb1250.c
index e1a08606c27e..0451273fab9f 100644
--- a/arch/mips/kernel/cevt-sb1250.c
+++ b/arch/mips/kernel/cevt-sb1250.c
@@ -90,16 +90,15 @@ static irqreturn_t sibyte_counter_handler(int irq, void *dev_id)
 }
 
 static DEFINE_PER_CPU(struct clock_event_device, sibyte_hpt_clockevent);
-static DEFINE_PER_CPU(struct irqaction, sibyte_hpt_irqaction);
 static DEFINE_PER_CPU(char [18], sibyte_hpt_name);
 
 void sb1250_clockevent_init(void)
 {
 	unsigned int cpu = smp_processor_id();
 	unsigned int irq = K_INT_TIMER_0 + cpu;
-	struct irqaction *action = &per_cpu(sibyte_hpt_irqaction, cpu);
 	struct clock_event_device *cd = &per_cpu(sibyte_hpt_clockevent, cpu);
 	unsigned char *name = per_cpu(sibyte_hpt_name, cpu);
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER;
 
 	/* Only have 4 general purpose timers, and we use last one as hpt */
 	BUG_ON(cpu > 2);
@@ -133,11 +132,7 @@ void sb1250_clockevent_init(void)
 
 	sb1250_unmask_irq(cpu, irq);
 
-	action->handler = sibyte_counter_handler;
-	action->flags	= IRQF_PERCPU | IRQF_TIMER;
-	action->name	= name;
-	action->dev_id	= cd;
-
 	irq_set_affinity(irq, cpumask_of(cpu));
-	setup_irq(irq, action);
+	if (request_irq(irq, sibyte_counter_handler, flags, name, cd))
+		pr_err("Failed to request irq %d (%s)\n", irq, name);
 }
diff --git a/arch/mips/kernel/cevt-txx9.c b/arch/mips/kernel/cevt-txx9.c
index 7b17c8f5009d..5709469c21ff 100644
--- a/arch/mips/kernel/cevt-txx9.c
+++ b/arch/mips/kernel/cevt-txx9.c
@@ -174,13 +174,6 @@ static irqreturn_t txx9tmr_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction txx9tmr_irq = {
-	.handler	= txx9tmr_interrupt,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "txx9tmr",
-	.dev_id		= &txx9_clock_event_device,
-};
-
 void __init txx9_clockevent_init(unsigned long baseaddr, int irq,
 				 unsigned int imbusclk)
 {
@@ -202,7 +195,9 @@ void __init txx9_clockevent_init(unsigned long baseaddr, int irq,
 	cd->irq = irq;
 	cd->cpumask = cpumask_of(0),
 	clockevents_register_device(cd);
-	setup_irq(irq, &txx9tmr_irq);
+	if (request_irq(irq, txx9tmr_interrupt, IRQF_PERCPU | IRQF_TIMER,
+			"txx9tmr", &txx9_clock_event_device))
+		pr_err("Failed to request irq %d (txx9tmr)\n", irq);
 	printk(KERN_INFO "TXx9: clockevent device at 0x%lx, irq %d\n",
 	       baseaddr, irq);
 }
diff --git a/arch/mips/kernel/i8253.c b/arch/mips/kernel/i8253.c
index df7ddd246eaa..ca21210e06b5 100644
--- a/arch/mips/kernel/i8253.c
+++ b/arch/mips/kernel/i8253.c
@@ -18,16 +18,13 @@ static irqreturn_t timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction irq0  = {
-	.handler = timer_interrupt,
-	.flags = IRQF_NOBALANCING | IRQF_TIMER,
-	.name = "timer"
-};
-
 void __init setup_pit_timer(void)
 {
+	unsigned long flags = IRQF_NOBALANCING | IRQF_TIMER;
+
 	clockevent_i8253_init(true);
-	setup_irq(0, &irq0);
+	if (request_irq(0, timer_interrupt, flags, "timer", NULL))
+		pr_err("Failed to request irq 0 (timer)\n");
 }
 
 static int __init init_pit_clocksource(void)
diff --git a/arch/mips/kernel/rtlx-mt.c b/arch/mips/kernel/rtlx-mt.c
index cb95470e2e69..38c6925a1bea 100644
--- a/arch/mips/kernel/rtlx-mt.c
+++ b/arch/mips/kernel/rtlx-mt.c
@@ -51,11 +51,6 @@ static irqreturn_t rtlx_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction rtlx_irq = {
-	.handler	= rtlx_interrupt,
-	.name		= "RTLX",
-};
-
 static int rtlx_irq_num = MIPS_CPU_IRQ_BASE + MIPS_CPU_RTLX_IRQ;
 
 void _interrupt_sp(void)
@@ -124,8 +119,7 @@ int __init rtlx_module_init(void)
 		goto out_class;
 	}
 
-	rtlx_irq.dev_id = rtlx;
-	err = setup_irq(rtlx_irq_num, &rtlx_irq);
+	err = request_irq(rtlx_irq_num, rtlx_interrupt, 0, "RTLX", rtlx);
 	if (err)
 		goto out_class;
 
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index f510c00bda88..d0e911f2421b 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -207,25 +207,13 @@ static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction irq_resched = {
-	.handler	= ipi_resched_interrupt,
-	.flags		= IRQF_PERCPU,
-	.name		= "IPI resched"
-};
-
-static struct irqaction irq_call = {
-	.handler	= ipi_call_interrupt,
-	.flags		= IRQF_PERCPU,
-	.name		= "IPI call"
-};
-
-static void smp_ipi_init_one(unsigned int virq,
-				    struct irqaction *action)
+static void smp_ipi_init_one(unsigned int virq, const char *name,
+			     irq_handler_t handler)
 {
 	int ret;
 
 	irq_set_handler(virq, handle_percpu_irq);
-	ret = setup_irq(virq, action);
+	ret = request_irq(virq, handler, IRQF_PERCPU, name, NULL);
 	BUG_ON(ret);
 }
 
@@ -278,12 +266,15 @@ int mips_smp_ipi_allocate(const struct cpumask *mask)
 		int cpu;
 
 		for_each_cpu(cpu, mask) {
-			smp_ipi_init_one(call_virq + cpu, &irq_call);
-			smp_ipi_init_one(sched_virq + cpu, &irq_resched);
+			smp_ipi_init_one(call_virq + cpu, "IPI call",
+					 ipi_call_interrupt);
+			smp_ipi_init_one(sched_virq + cpu, "IPI resched",
+					 ipi_resched_interrupt);
 		}
 	} else {
-		smp_ipi_init_one(call_virq, &irq_call);
-		smp_ipi_init_one(sched_virq, &irq_resched);
+		smp_ipi_init_one(call_virq, "IPI call", ipi_call_interrupt);
+		smp_ipi_init_one(sched_virq, "IPI resched",
+				 ipi_resched_interrupt);
 	}
 
 	return 0;
@@ -311,8 +302,8 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 		int cpu;
 
 		for_each_cpu(cpu, mask) {
-			remove_irq(call_virq + cpu, &irq_call);
-			remove_irq(sched_virq + cpu, &irq_resched);
+			free_irq(call_virq + cpu, NULL);
+			free_irq(sched_virq + cpu, NULL);
 		}
 	}
 	irq_destroy_ipi(call_virq, mask);
diff --git a/arch/mips/lasat/interrupt.c b/arch/mips/lasat/interrupt.c
index 0f3a8975081d..7965bbd0d319 100644
--- a/arch/mips/lasat/interrupt.c
+++ b/arch/mips/lasat/interrupt.c
@@ -90,14 +90,9 @@ asmlinkage void plat_irq_dispatch(void)
 	}
 }
 
-static struct irqaction cascade = {
-	.handler	= no_action,
-	.name		= "cascade",
-	.flags		= IRQF_NO_THREAD,
-};
-
 void __init arch_init_irq(void)
 {
+	int irq = LASAT_CASCADE_IRQ;
 	int i;
 
 	if (IS_LASAT_200()) {
@@ -119,5 +114,6 @@ void __init arch_init_irq(void)
 	for (i = LASAT_IRQ_BASE; i <= LASAT_IRQ_END; i++)
 		irq_set_chip_and_handler(i, &lasat_irq_type, handle_level_irq);
 
-	setup_irq(LASAT_CASCADE_IRQ, &cascade);
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
 }
diff --git a/arch/mips/loongson2ef/common/bonito-irq.c b/arch/mips/loongson2ef/common/bonito-irq.c
index 82352cc25e4c..c06ad412ee20 100644
--- a/arch/mips/loongson2ef/common/bonito-irq.c
+++ b/arch/mips/loongson2ef/common/bonito-irq.c
@@ -30,11 +30,6 @@ static struct irq_chip bonito_irq_type = {
 	.irq_unmask	= bonito_irq_enable,
 };
 
-static struct irqaction __maybe_unused dma_timeout_irqaction = {
-	.handler	= no_action,
-	.name		= "dma_timeout",
-};
-
 void bonito_irq_init(void)
 {
 	u32 i;
@@ -44,6 +39,8 @@ void bonito_irq_init(void)
 					 handle_level_irq);
 
 #ifdef CONFIG_CPU_LOONGSON2E
-	setup_irq(LOONGSON_IRQ_BASE + 10, &dma_timeout_irqaction);
+	i = LOONGSON_IRQ_BASE + 10;
+	if (request_irq(i, no_action, 0, "dma_timeout", NULL))
+		pr_err("Failed to request irq %d (dma_timeout)\n", i);
 #endif
 }
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
index 30af1b7c7529..f21a540a1dd2 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
@@ -100,12 +100,6 @@ static irqreturn_t timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction irq5 = {
-	.handler = timer_interrupt,
-	.flags = IRQF_NOBALANCING | IRQF_TIMER,
-	.name = "timer"
-};
-
 /*
  * Initialize the conversion factor and the min/max deltas of the clock event
  * structure and register the clock event source with the framework.
@@ -134,7 +128,9 @@ void __init setup_mfgpt0_timer(void)
 
 	clockevents_register_device(cd);
 
-	setup_irq(CS5536_MFGPT_INTR, &irq5);
+	if (request_irq(CS5536_MFGPT_INTR, timer_interrupt,
+			IRQF_NOBALANCING | IRQF_TIMER, "timer", NULL))
+		pr_err("Failed to register timer interrupt\n");
 }
 
 /*
diff --git a/arch/mips/loongson2ef/fuloong-2e/irq.c b/arch/mips/loongson2ef/fuloong-2e/irq.c
index 32278e7bf85c..305aa2eb74ad 100644
--- a/arch/mips/loongson2ef/fuloong-2e/irq.c
+++ b/arch/mips/loongson2ef/fuloong-2e/irq.c
@@ -35,14 +35,10 @@ asmlinkage void mach_irq_dispatch(unsigned int pending)
 		spurious_interrupt();
 }
 
-static struct irqaction cascade_irqaction = {
-	.handler = no_action,
-	.name = "cascade",
-	.flags = IRQF_NO_THREAD,
-};
-
 void __init mach_init_irq(void)
 {
+	int irq;
+
 	/* init all controller
 	 *   0-15	  ------> i8259 interrupt
 	 *   16-23	  ------> mips cpu interrupt
@@ -59,7 +55,11 @@ void __init mach_init_irq(void)
 	bonito_irq_init();
 
 	/* bonito irq at IP2 */
-	setup_irq(MIPS_CPU_IRQ_BASE + 2, &cascade_irqaction);
+	irq = MIPS_CPU_IRQ_BASE + 2;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
 	/* 8259 irq at IP5 */
-	setup_irq(MIPS_CPU_IRQ_BASE + 5, &cascade_irqaction);
+	irq = MIPS_CPU_IRQ_BASE + 5;
+	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", irq);
 }
diff --git a/arch/mips/loongson2ef/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
index c58a044c6c07..34e15e8b7a8f 100644
--- a/arch/mips/loongson2ef/lemote-2f/irq.c
+++ b/arch/mips/loongson2ef/lemote-2f/irq.c
@@ -90,18 +90,6 @@ static irqreturn_t ip6_action(int cpl, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction ip6_irqaction = {
-	.handler = ip6_action,
-	.name = "cascade",
-	.flags = IRQF_SHARED | IRQF_NO_THREAD,
-};
-
-static struct irqaction cascade_irqaction = {
-	.handler = no_action,
-	.name = "cascade",
-	.flags = IRQF_NO_THREAD | IRQF_NO_SUSPEND,
-};
-
 void __init mach_init_irq(void)
 {
 	/* init all controller
@@ -120,7 +108,11 @@ void __init mach_init_irq(void)
 	bonito_irq_init();
 
 	/* setup north bridge irq (bonito) */
-	setup_irq(LOONGSON_NORTH_BRIDGE_IRQ, &ip6_irqaction);
+	if (request_irq(LOONGSON_NORTH_BRIDGE_IRQ, ip6_action,
+			IRQF_SHARED | IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to register north bridge cascade interrupt\n");
 	/* setup source bridge irq (i8259) */
-	setup_irq(LOONGSON_SOUTH_BRIDGE_IRQ, &cascade_irqaction);
+	if (request_irq(LOONGSON_SOUTH_BRIDGE_IRQ, no_action,
+			IRQF_NO_THREAD | IRQF_NO_SUSPEND, "cascade", NULL))
+		pr_err("Failed to register south bridge cascade interrupt\n");
 }
diff --git a/arch/mips/loongson32/common/irq.c b/arch/mips/loongson32/common/irq.c
index 168d221d4178..9a50070f74f7 100644
--- a/arch/mips/loongson32/common/irq.c
+++ b/arch/mips/loongson32/common/irq.c
@@ -149,12 +149,6 @@ asmlinkage void plat_irq_dispatch(void)
 
 }
 
-static struct irqaction cascade_irqaction = {
-	.handler = no_action,
-	.name = "cascade",
-	.flags = IRQF_NO_THREAD,
-};
-
 static void __init ls1x_irq_init(int base)
 {
 	int n;
@@ -176,12 +170,17 @@ static void __init ls1x_irq_init(int base)
 					 handle_level_irq);
 	}
 
-	setup_irq(INT0_IRQ, &cascade_irqaction);
-	setup_irq(INT1_IRQ, &cascade_irqaction);
-	setup_irq(INT2_IRQ, &cascade_irqaction);
-	setup_irq(INT3_IRQ, &cascade_irqaction);
+	if (request_irq(INT0_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", INT0_IRQ);
+	if (request_irq(INT1_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", INT1_IRQ);
+	if (request_irq(INT2_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", INT2_IRQ);
+	if (request_irq(INT3_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", INT3_IRQ);
 #if defined(CONFIG_LOONGSON1_LS1C)
-	setup_irq(INT4_IRQ, &cascade_irqaction);
+	if (request_irq(INT4_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to request irq %d (cascade)\n", INT4_IRQ);
 #endif
 }
 
diff --git a/arch/mips/loongson32/common/time.c b/arch/mips/loongson32/common/time.c
index 4cc73f7ac0d4..459b15c96d3b 100644
--- a/arch/mips/loongson32/common/time.c
+++ b/arch/mips/loongson32/common/time.c
@@ -176,13 +176,6 @@ static struct clock_event_device ls1x_clockevent = {
 	.tick_resume		= ls1x_clockevent_tick_resume,
 };
 
-static struct irqaction ls1x_pwmtimer_irqaction = {
-	.name		= "ls1x-pwmtimer",
-	.handler	= ls1x_clockevent_isr,
-	.dev_id		= &ls1x_clockevent,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-};
-
 static void __init ls1x_time_init(void)
 {
 	struct clock_event_device *cd = &ls1x_clockevent;
@@ -206,7 +199,10 @@ static void __init ls1x_time_init(void)
 	if (ret)
 		panic(KERN_ERR "Failed to register clocksource: %d\n", ret);
 
-	setup_irq(LS1X_TIMER_IRQ, &ls1x_pwmtimer_irqaction);
+	if (request_irq(LS1X_TIMER_IRQ, ls1x_clockevent_isr,
+			IRQF_PERCPU | IRQF_TIMER, "ls1x-pwmtimer",
+			&ls1x_clockevent))
+		pr_err("Failed to register ls1x-pwmtimer interrupt\n");
 }
 #endif /* CONFIG_CEVT_CSRC_LS1X */
 
diff --git a/arch/mips/loongson64/hpet.c b/arch/mips/loongson64/hpet.c
index ed15430ad64f..e4282592575b 100644
--- a/arch/mips/loongson64/hpet.c
+++ b/arch/mips/loongson64/hpet.c
@@ -187,12 +187,6 @@ static irqreturn_t hpet_irq_handler(int irq, void *data)
 	return IRQ_NONE;
 }
 
-static struct irqaction hpet_irq = {
-	.handler = hpet_irq_handler,
-	.flags = IRQF_NOBALANCING | IRQF_TIMER,
-	.name = "hpet",
-};
-
 /*
  * hpet address assignation and irq setting should be done in bios.
  * but pmon don't do this, we just setup here directly.
@@ -224,6 +218,7 @@ static void hpet_setup(void)
 
 void __init setup_hpet_timer(void)
 {
+	unsigned long flags = IRQF_NOBALANCING | IRQF_TIMER;
 	unsigned int cpu = smp_processor_id();
 	struct clock_event_device *cd;
 
@@ -247,7 +242,8 @@ void __init setup_hpet_timer(void)
 	cd->min_delta_ticks = HPET_MIN_PROG_DELTA;
 
 	clockevents_register_device(cd);
-	setup_irq(HPET_T0_IRQ, &hpet_irq);
+	if (request_irq(HPET_T0_IRQ, hpet_irq_handler, flags, "hpet", NULL))
+		pr_err("Failed to request irq %d (hpet)\n", HPET_T0_IRQ);
 	pr_info("hpet clock event device register\n");
 }
 
diff --git a/arch/mips/mti-malta/malta-int.c b/arch/mips/mti-malta/malta-int.c
index a840e0c1642c..03d85b2b3eea 100644
--- a/arch/mips/mti-malta/malta-int.c
+++ b/arch/mips/mti-malta/malta-int.c
@@ -144,12 +144,6 @@ static irqreturn_t corehi_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction corehi_irqaction = {
-	.handler = corehi_handler,
-	.name = "CoreHi",
-	.flags = IRQF_NO_THREAD,
-};
-
 static msc_irqmap_t msc_irqmap[] __initdata = {
 	{MSC01C_INT_TMR,		MSC01_IRQ_EDGE, 0},
 	{MSC01C_INT_PCI,		MSC01_IRQ_LEVEL, 0},
@@ -223,5 +217,7 @@ void __init arch_init_irq(void)
 		corehi_irq = MIPS_CPU_IRQ_BASE + MIPSCPU_INT_COREHI;
 	}
 
-	setup_irq(corehi_irq, &corehi_irqaction);
+	if (request_irq(corehi_irq, corehi_handler, IRQF_NO_THREAD, "CoreHi",
+			NULL))
+		pr_err("Failed to request irq %d (CoreHi)\n", corehi_irq);
 }
diff --git a/arch/mips/netlogic/xlr/fmn.c b/arch/mips/netlogic/xlr/fmn.c
index d428e8471eec..d7db1533889a 100644
--- a/arch/mips/netlogic/xlr/fmn.c
+++ b/arch/mips/netlogic/xlr/fmn.c
@@ -110,12 +110,6 @@ static irqreturn_t fmn_message_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-struct irqaction fmn_irqaction = {
-	.handler = fmn_message_handler,
-	.flags = IRQF_PERCPU,
-	.name = "fmn",
-};
-
 void xlr_percpu_fmn_init(void)
 {
 	struct xlr_fmn_info *cpu_fmn_info;
@@ -195,8 +189,9 @@ void nlm_setup_fmn_irq(void)
 {
 	uint32_t flags;
 
-	/* setup irq only once */
-	setup_irq(IRQ_FMN, &fmn_irqaction);
+	/* request irq only once */
+	if (request_irq(IRQ_FMN, fmn_message_handler, IRQF_PERCPU, "fmn", NULL))
+		pr_err("Failed to request irq %d (fmn)\n", IRQ_FMN);
 
 	flags = nlm_cop2_enable_irqsave();
 	nlm_fmn_setup_intr(IRQ_FMN, (1 << nlm_threads_per_core) - 1);
diff --git a/arch/mips/pmcs-msp71xx/msp_irq.c b/arch/mips/pmcs-msp71xx/msp_irq.c
index 8d53d7a2ed45..d525cc931d89 100644
--- a/arch/mips/pmcs-msp71xx/msp_irq.c
+++ b/arch/mips/pmcs-msp71xx/msp_irq.c
@@ -107,18 +107,6 @@ asmlinkage void plat_irq_dispatch(void)
 		do_IRQ(MSP_INT_SW1);
 }
 
-static struct irqaction cic_cascade_msp = {
-	.handler = no_action,
-	.name	 = "MSP CIC cascade",
-	.flags	 = IRQF_NO_THREAD,
-};
-
-static struct irqaction per_cascade_msp = {
-	.handler = no_action,
-	.name	 = "MSP PER cascade",
-	.flags	 = IRQF_NO_THREAD,
-};
-
 void __init arch_init_irq(void)
 {
 	/* assume we'll be using vectored interrupt mode except in UP mode*/
@@ -142,8 +130,12 @@ void __init arch_init_irq(void)
 #endif	/* CONFIG_MIPS_MT_SMP */
 #endif	/* CONFIG_MIPS_MT */
 	/* setup the cascaded interrupts */
-	setup_irq(MSP_INT_CIC, &cic_cascade_msp);
-	setup_irq(MSP_INT_PER, &per_cascade_msp);
+	if (request_irq(MSP_INT_CIC, no_action, IRQF_NO_THREAD,
+			"MSP CIC cascade", NULL))
+		pr_err("Failed to register MSP CIC cascade interrupt\n");
+	if (request_irq(MSP_INT_PER, no_action, IRQF_NO_THREAD,
+			"MSP PER cascade", NULL))
+		pr_err("Failed to register MSP PER cascade interrupt\n");
 
 #else
 	/*
@@ -153,7 +145,11 @@ void __init arch_init_irq(void)
 	msp_slp_irq_init();
 
 	/* setup the cascaded SLP/PER interrupts */
-	setup_irq(MSP_INT_SLP, &cic_cascade_msp);
-	setup_irq(MSP_INT_PER, &per_cascade_msp);
+	if (request_irq(MSP_INT_SLP, no_action, IRQF_NO_THREAD,
+			"MSP CIC cascade", NULL))
+		pr_err("Failed to register MSP CIC cascade interrupt\n");
+	if (request_irq(MSP_INT_PER, no_action, IRQF_NO_THREAD,
+			"MSP PER cascade", NULL))
+		pr_err("Failed to register MSP PER cascade interrupt\n");
 #endif
 }
diff --git a/arch/mips/pmcs-msp71xx/msp_smp.c b/arch/mips/pmcs-msp71xx/msp_smp.c
index 8f00d26f2a53..00092e2924ec 100644
--- a/arch/mips/pmcs-msp71xx/msp_smp.c
+++ b/arch/mips/pmcs-msp71xx/msp_smp.c
@@ -38,21 +38,10 @@ static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction irq_resched = {
-	.handler	= ipi_resched_interrupt,
-	.flags		= IRQF_PERCPU,
-	.name		= "IPI_resched"
-};
-
-static struct irqaction irq_call = {
-	.handler	= ipi_call_interrupt,
-	.flags		= IRQF_PERCPU,
-	.name		= "IPI_call"
-};
-
-void __init arch_init_ipiirq(int irq, struct irqaction *action)
+void __init arch_init_ipiirq(int irq, const char *name, irq_handler_t handler)
 {
-	setup_irq(irq, action);
+	if (request_irq(irq, handler, IRQF_PERCPU, name, NULL))
+		pr_err("Failed to request irq %d (%s)\n", irq, name);
 	irq_set_handler(irq, handle_percpu_irq);
 }
 
@@ -60,7 +49,8 @@ void __init msp_vsmp_int_init(void)
 {
 	set_vi_handler(MIPS_CPU_IPI_RESCHED_IRQ, ipi_resched_dispatch);
 	set_vi_handler(MIPS_CPU_IPI_CALL_IRQ, ipi_call_dispatch);
-	arch_init_ipiirq(MIPS_CPU_IPI_RESCHED_IRQ, &irq_resched);
-	arch_init_ipiirq(MIPS_CPU_IPI_CALL_IRQ, &irq_call);
+	arch_init_ipiirq(MIPS_CPU_IPI_RESCHED_IRQ, "IPI_resched",
+			 ipi_resched_interrupt);
+	arch_init_ipiirq(MIPS_CPU_IPI_CALL_IRQ, "IPI_call", ipi_call_interrupt);
 }
 #endif /* CONFIG_MIPS_MT_SMP */
diff --git a/arch/mips/pmcs-msp71xx/msp_time.c b/arch/mips/pmcs-msp71xx/msp_time.c
index d83de01f00b8..baf0da8b4c98 100644
--- a/arch/mips/pmcs-msp71xx/msp_time.c
+++ b/arch/mips/pmcs-msp71xx/msp_time.c
@@ -27,7 +27,6 @@
 #define get_current_vpe()   \
 	((read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) & TCBIND_CURVPE)
 
-static struct irqaction timer_vpe1;
 static int tim_installed;
 
 void __init plat_time_init(void)
@@ -77,10 +76,13 @@ void __init plat_time_init(void)
 
 unsigned int get_c0_compare_int(void)
 {
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
+
 	/* MIPS_MT modes may want timer for second VPE */
 	if ((get_current_vpe()) && !tim_installed) {
-		memcpy(&timer_vpe1, &c0_compare_irqaction, sizeof(timer_vpe1));
-		setup_irq(MSP_INT_VPE1_TIMER, &timer_vpe1);
+		if (request_irq(MSP_INT_VPE1_TIMER, c0_compare_interrupt, flags,
+				"timer", NULL))
+			pr_err("Failed to register timer interrupt\n");
 		tim_installed++;
 	}
 
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
index 61a08943eb2f..269d4877d120 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/arch/mips/ralink/cevt-rt3352.c
@@ -82,12 +82,6 @@ static struct systick_device systick = {
 	},
 };
 
-static struct irqaction systick_irqaction = {
-	.handler = systick_interrupt,
-	.flags = IRQF_PERCPU | IRQF_TIMER,
-	.dev_id = &systick.dev,
-};
-
 static int systick_shutdown(struct clock_event_device *evt)
 {
 	struct systick_device *sdev;
@@ -95,7 +89,7 @@ static int systick_shutdown(struct clock_event_device *evt)
 	sdev = container_of(evt, struct systick_device, dev);
 
 	if (sdev->irq_requested)
-		free_irq(systick.dev.irq, &systick_irqaction);
+		free_irq(systick.dev.irq, &systick.dev);
 	sdev->irq_requested = 0;
 	iowrite32(0, systick.membase + SYSTICK_CONFIG);
 
@@ -104,12 +98,17 @@ static int systick_shutdown(struct clock_event_device *evt)
 
 static int systick_set_oneshot(struct clock_event_device *evt)
 {
+	const char *name = systick.dev.name;
 	struct systick_device *sdev;
+	int irq = systick.dev.irq;
 
 	sdev = container_of(evt, struct systick_device, dev);
 
-	if (!sdev->irq_requested)
-		setup_irq(systick.dev.irq, &systick_irqaction);
+	if (!sdev->irq_requested) {
+		if (request_irq(irq, systick_interrupt,
+				IRQF_PERCPU | IRQF_TIMER, name, &systick.dev))
+			pr_err("Failed to request irq %d (%s)\n", irq, name);
+	}
 	sdev->irq_requested = 1;
 	iowrite32(CFG_EXT_STK_EN | CFG_CNT_EN,
 		  systick.membase + SYSTICK_CONFIG);
@@ -125,7 +124,6 @@ static int __init ralink_systick_init(struct device_node *np)
 	if (!systick.membase)
 		return -ENXIO;
 
-	systick_irqaction.name = np->name;
 	systick.dev.name = np->name;
 	clockevents_calc_mult_shift(&systick.dev, SYSTICK_FREQ, 60);
 	systick.dev.max_delta_ns = clockevent_delta2ns(0x7fff, &systick.dev);
diff --git a/arch/mips/sgi-ip22/ip22-eisa.c b/arch/mips/sgi-ip22/ip22-eisa.c
index a0a79222ce0b..f3b0e90e0135 100644
--- a/arch/mips/sgi-ip22/ip22-eisa.c
+++ b/arch/mips/sgi-ip22/ip22-eisa.c
@@ -92,11 +92,6 @@ static irqreturn_t ip22_eisa_intr(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct irqaction eisa_action = {
-	.handler	= ip22_eisa_intr,
-	.name		= "EISA",
-};
-
 int __init ip22_eisa_init(void)
 {
 	int i, c;
@@ -136,9 +131,8 @@ int __init ip22_eisa_init(void)
 
 	init_i8259_irqs();
 
-	/* Cannot use request_irq because of kmalloc not being ready at such
-	 * an early stage. Yes, I've been bitten... */
-	setup_irq(SGI_EISA_IRQ, &eisa_action);
+	if (request_irq(SGI_EISA_IRQ, ip22_eisa_intr, 0, "EISA", NULL))
+		pr_err("Failed to request irq %d (EISA)\n", SGI_EISA_IRQ);
 
 	EISA_bus = 1;
 	return 0;
diff --git a/arch/mips/sgi-ip22/ip22-int.c b/arch/mips/sgi-ip22/ip22-int.c
index 3804895fa697..96798a4ab2de 100644
--- a/arch/mips/sgi-ip22/ip22-int.c
+++ b/arch/mips/sgi-ip22/ip22-int.c
@@ -159,36 +159,7 @@ static void __irq_entry indy_buserror_irq(void)
 	irq_exit();
 }
 
-static struct irqaction local0_cascade = {
-	.handler	= no_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "local0 cascade",
-};
-
-static struct irqaction local1_cascade = {
-	.handler	= no_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "local1 cascade",
-};
-
-static struct irqaction buserr = {
-	.handler	= no_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "Bus Error",
-};
-
-static struct irqaction map0_cascade = {
-	.handler	= no_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "mapable0 cascade",
-};
-
 #ifdef USE_LIO3_IRQ
-static struct irqaction map1_cascade = {
-	.handler	= no_action,
-	.flags		= IRQF_NO_THREAD,
-	.name		= "mapable1 cascade",
-};
 #define SGI_INTERRUPTS	SGINT_END
 #else
 #define SGI_INTERRUPTS	SGINT_LOCAL3
@@ -322,14 +293,24 @@ void __init arch_init_irq(void)
 	}
 
 	/* vector handler. this register the IRQ as non-sharable */
-	setup_irq(SGI_LOCAL_0_IRQ, &local0_cascade);
-	setup_irq(SGI_LOCAL_1_IRQ, &local1_cascade);
-	setup_irq(SGI_BUSERR_IRQ, &buserr);
+	if (request_irq(SGI_LOCAL_0_IRQ, no_action, IRQF_NO_THREAD,
+			"local0 cascade", NULL))
+		pr_err("Failed to register local0 cascade interrupt\n");
+	if (request_irq(SGI_LOCAL_1_IRQ, no_action, IRQF_NO_THREAD,
+			"local1 cascade", NULL))
+		pr_err("Failed to register local1 cascade interrupt\n");
+	if (request_irq(SGI_BUSERR_IRQ, no_action, IRQF_NO_THREAD,
+			"Bus Error", NULL))
+		pr_err("Failed to register Bus Error interrupt\n");
 
 	/* cascade in cascade. i love Indy ;-) */
-	setup_irq(SGI_MAP_0_IRQ, &map0_cascade);
+	if (request_irq(SGI_MAP_0_IRQ, no_action, IRQF_NO_THREAD,
+			"mapable0 cascade", NULL))
+		pr_err("Failed to register mapable0 cascade interrupt\n");
 #ifdef USE_LIO3_IRQ
-	setup_irq(SGI_MAP_1_IRQ, &map1_cascade);
+	if (request_irq(SGI_MAP_1_IRQ, no_action, IRQF_NO_THREAD,
+			"mapable1 cascade", NULL))
+		pr_err("Failed to register mapable1 cascade interrupt\n");
 #endif
 
 #ifdef CONFIG_EISA
diff --git a/arch/mips/sgi-ip32/ip32-irq.c b/arch/mips/sgi-ip32/ip32-irq.c
index a6a0ff7f5aed..1bbd5bfb5458 100644
--- a/arch/mips/sgi-ip32/ip32-irq.c
+++ b/arch/mips/sgi-ip32/ip32-irq.c
@@ -111,16 +111,6 @@ static inline void flush_mace_bus(void)
 extern irqreturn_t crime_memerr_intr(int irq, void *dev_id);
 extern irqreturn_t crime_cpuerr_intr(int irq, void *dev_id);
 
-static struct irqaction memerr_irq = {
-	.handler = crime_memerr_intr,
-	.name = "CRIME memory error",
-};
-
-static struct irqaction cpuerr_irq = {
-	.handler = crime_cpuerr_intr,
-	.name = "CRIME CPU error",
-};
-
 /*
  * This is for pure CRIME interrupts - ie not MACE.  The advantage?
  * We get to split the register in half and do faster lookups.
@@ -497,8 +487,12 @@ void __init arch_init_irq(void)
 			break;
 		}
 	}
-	setup_irq(CRIME_MEMERR_IRQ, &memerr_irq);
-	setup_irq(CRIME_CPUERR_IRQ, &cpuerr_irq);
+	if (request_irq(CRIME_MEMERR_IRQ, crime_memerr_intr, 0,
+			"CRIME memory error", NULL))
+		pr_err("Failed to register CRIME memory error interrupt\n");
+	if (request_irq(CRIME_CPUERR_IRQ, crime_cpuerr_intr, 0,
+			"CRIME CPU error", NULL))
+		pr_err("Failed to register CRIME CPU error interrupt\n");
 
 #define ALLINTS (IE_IRQ0 | IE_IRQ1 | IE_IRQ2 | IE_IRQ3 | IE_IRQ4 | IE_IRQ5)
 	change_c0_status(ST0_IM, ALLINTS);
diff --git a/arch/mips/sni/a20r.c b/arch/mips/sni/a20r.c
index f9407e170476..ba966d62fb4b 100644
--- a/arch/mips/sni/a20r.c
+++ b/arch/mips/sni/a20r.c
@@ -222,7 +222,9 @@ void __init sni_a20r_irq_init(void)
 		irq_set_chip_and_handler(i, &a20r_irq_type, handle_level_irq);
 	sni_hwint = a20r_hwint;
 	change_c0_status(ST0_IM, IE_IRQ0);
-	setup_irq(SNI_A20R_IRQ_BASE + 3, &sni_isa_irq);
+	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler,
+			IRQF_SHARED, "ISA", NULL))
+		pr_err("Failed to register ISA interrupt\n");
 }
 
 void sni_a20r_init(void)
diff --git a/arch/mips/sni/irq.c b/arch/mips/sni/irq.c
index ac61b90bcc66..dec89afc9886 100644
--- a/arch/mips/sni/irq.c
+++ b/arch/mips/sni/irq.c
@@ -27,7 +27,7 @@ asmlinkage void plat_irq_dispatch(void)
 }
 
 /* ISA irq handler */
-static irqreturn_t sni_isa_irq_handler(int dummy, void *p)
+irqreturn_t sni_isa_irq_handler(int dummy, void *p)
 {
 	int irq;
 
@@ -39,12 +39,6 @@ static irqreturn_t sni_isa_irq_handler(int dummy, void *p)
 	return IRQ_HANDLED;
 }
 
-struct irqaction sni_isa_irq = {
-	.handler = sni_isa_irq_handler,
-	.name = "ISA",
-	.flags = IRQF_SHARED
-};
-
 /*
  * On systems with i8259-style interrupt controllers we assume for
  * driver compatibility reasons interrupts 0 - 15 to be the i8295
diff --git a/arch/mips/sni/pcit.c b/arch/mips/sni/pcit.c
index 05bb51676e82..4a850ab03398 100644
--- a/arch/mips/sni/pcit.c
+++ b/arch/mips/sni/pcit.c
@@ -244,7 +244,9 @@ void __init sni_pcit_irq_init(void)
 	*(volatile u32 *)SNI_PCIT_INT_REG = 0;
 	sni_hwint = sni_pcit_hwint;
 	change_c0_status(ST0_IM, IE_IRQ1);
-	setup_irq(SNI_PCIT_INT_START + 6, &sni_isa_irq);
+	if (request_irq(SNI_PCIT_INT_START + 6, sni_isa_irq_handler,
+			IRQF_SHARED, "ISA", NULL))
+		pr_err("Failed to register ISA interrupt\n");
 }
 
 void __init sni_pcit_cplus_irq_init(void)
@@ -257,7 +259,9 @@ void __init sni_pcit_cplus_irq_init(void)
 	*(volatile u32 *)SNI_PCIT_INT_REG = 0x40000000;
 	sni_hwint = sni_pcit_hwint_cplus;
 	change_c0_status(ST0_IM, IE_IRQ0);
-	setup_irq(MIPS_CPU_IRQ_BASE + 3, &sni_isa_irq);
+	if (request_irq(MIPS_CPU_IRQ_BASE + 3, sni_isa_irq_handler,
+			IRQF_SHARED, "ISA", NULL))
+		pr_err("Failed to register ISA interrupt\n");
 }
 
 void __init sni_pcit_init(void)
diff --git a/arch/mips/sni/rm200.c b/arch/mips/sni/rm200.c
index f6fa9afcbfd3..ba1f2fc6a43e 100644
--- a/arch/mips/sni/rm200.c
+++ b/arch/mips/sni/rm200.c
@@ -356,11 +356,6 @@ void sni_rm200_init_8259A(void)
 /*
  * IRQ2 is cascade interrupt to second interrupt controller
  */
-static struct irqaction sni_rm200_irq2 = {
-	.handler = no_action,
-	.name = "cascade",
-	.flags = IRQF_NO_THREAD,
-};
 
 static struct resource sni_rm200_pic1_resource = {
 	.name = "onboard ISA pic1",
@@ -389,12 +384,6 @@ static irqreturn_t sni_rm200_i8259A_irq_handler(int dummy, void *p)
 	return IRQ_HANDLED;
 }
 
-struct irqaction sni_rm200_i8259A_irq = {
-	.handler = sni_rm200_i8259A_irq_handler,
-	.name = "onboard ISA",
-	.flags = IRQF_SHARED
-};
-
 void __init sni_rm200_i8259_irqs(void)
 {
 	int i;
@@ -417,7 +406,9 @@ void __init sni_rm200_i8259_irqs(void)
 		irq_set_chip_and_handler(i, &sni_rm200_i8259A_chip,
 					 handle_level_irq);
 
-	setup_irq(RM200_I8259A_IRQ_BASE + PIC_CASCADE_IR, &sni_rm200_irq2);
+	if (request_irq(RM200_I8259A_IRQ_BASE + PIC_CASCADE_IR, no_action,
+			IRQF_NO_THREAD, "cascade", NULL))
+		pr_err("Failed to register cascade interrupt\n");
 }
 
 
@@ -481,8 +472,12 @@ void __init sni_rm200_irq_init(void)
 		irq_set_chip_and_handler(i, &rm200_irq_type, handle_level_irq);
 	sni_hwint = sni_rm200_hwint;
 	change_c0_status(ST0_IM, IE_IRQ0);
-	setup_irq(SNI_RM200_INT_START + 0, &sni_rm200_i8259A_irq);
-	setup_irq(SNI_RM200_INT_START + 1, &sni_isa_irq);
+	if (request_irq(SNI_RM200_INT_START + 0, sni_rm200_i8259A_irq_handler,
+			IRQF_SHARED, "onboard ISA", NULL))
+		pr_err("Failed to register onboard ISA interrupt\n");
+	if (request_irq(SNI_RM200_INT_START + 1, sni_isa_irq_handler,
+			IRQF_SHARED, "ISA", NULL))
+		pr_err("Failed to register ISA interrupt\n");
 }
 
 void __init sni_rm200_init(void)
diff --git a/arch/mips/sni/time.c b/arch/mips/sni/time.c
index dbace1f3e1a9..240bb68ec247 100644
--- a/arch/mips/sni/time.c
+++ b/arch/mips/sni/time.c
@@ -55,12 +55,6 @@ static irqreturn_t a20r_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct irqaction a20r_irqaction = {
-	.handler	= a20r_interrupt,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "a20r-timer",
-};
-
 /*
  * a20r platform uses 2 counters to divide the input frequency.
  * Counter 2 output is connected to Counter 0 & 1 input.
@@ -68,13 +62,13 @@ static struct irqaction a20r_irqaction = {
 static void __init sni_a20r_timer_setup(void)
 {
 	struct clock_event_device *cd = &a20r_clockevent_device;
-	struct irqaction *action = &a20r_irqaction;
 	unsigned int cpu = smp_processor_id();
 
 	cd->cpumask		= cpumask_of(cpu);
 	clockevents_register_device(cd);
-	action->dev_id = cd;
-	setup_irq(SNI_A20R_IRQ_TIMER, &a20r_irqaction);
+	if (request_irq(SNI_A20R_IRQ_TIMER, a20r_interrupt,
+			IRQF_PERCPU | IRQF_TIMER, "a20r-timer", cd))
+		pr_err("Failed to register a20r-timer interrupt\n");
 }
 
 #define SNI_8254_TICK_RATE	  1193182UL
diff --git a/arch/mips/vr41xx/common/irq.c b/arch/mips/vr41xx/common/irq.c
index 7a826fbf9060..8f68446ff2d9 100644
--- a/arch/mips/vr41xx/common/irq.c
+++ b/arch/mips/vr41xx/common/irq.c
@@ -17,12 +17,6 @@ typedef struct irq_cascade {
 
 static irq_cascade_t irq_cascade[NR_IRQS] __cacheline_aligned;
 
-static struct irqaction cascade_irqaction = {
-	.handler	= no_action,
-	.name		= "cascade",
-	.flags		= IRQF_NO_THREAD,
-};
-
 int cascade_irq(unsigned int irq, int (*get_irq)(unsigned int))
 {
 	int retval = 0;
@@ -36,7 +30,8 @@ int cascade_irq(unsigned int irq, int (*get_irq)(unsigned int))
 	irq_cascade[irq].get_irq = get_irq;
 
 	if (get_irq != NULL) {
-		retval = setup_irq(irq, &cascade_irqaction);
+		retval = request_irq(irq, no_action, IRQF_NO_THREAD,
+				     "cascade", NULL);
 		if (retval < 0)
 			irq_cascade[irq].get_irq = NULL;
 	}
-- 
2.25.1

