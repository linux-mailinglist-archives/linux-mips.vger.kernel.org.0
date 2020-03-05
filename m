Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA36517A575
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 13:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCEMmo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 07:42:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36452 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgCEMmn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 07:42:43 -0500
Received: by mail-pg1-f196.google.com with SMTP id d9so2725322pgu.3;
        Thu, 05 Mar 2020 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Iv+8lkf0g9FKK4aGWH4FIny5NJBBPfHf9mcxAx6Usno=;
        b=vU/DIA2JriGM1rc8p00USJ6gdHsZ5BR6i8mFgZBslRFCcZJf3lWyuL/hEcjDcjWXsQ
         M2mM+hEBtRdN3ib2OsUf706OptuaUPu2sBlX1JBGSSMA1wJeWy34m23puTA8Tn5yND80
         1V97QccuIFkkgVj55WkNTYelL6uVYDOHPV/qZUn553vCcU/XeBL+skLsNo/9xeucBLnF
         mrEzTDnqMXzyKdeCKYZsEg03k+cwbZMbh77lG0OaOdRCzW6jK6FEjIdj4aSNEDdiqpDk
         T6K79tf1w6PoN6Dh2FuW/7i0CZG+n0RGlaqO5mmlJpevaT6qcdesvhnp+ElkHKBKs1nd
         qy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iv+8lkf0g9FKK4aGWH4FIny5NJBBPfHf9mcxAx6Usno=;
        b=SQtXe60DpvefBlqUXV/ryMch3FJWacrL8qw5vogcEpvVDRJQ8LrgJRCOezMZoyBa58
         YrfN8HpqApeHiWJn+AHS3sYojQnVPJ+DLvyHxNiPYxFZbjpOGXkEHSfJboBwdJa6gJZh
         fzdi33SZtOdriMMTQFV5vFQNMvYvTXn081BA4+bqk131r1T4AvTdGlln8y2GMrSdO5ck
         6WeG0/IDdmxA4jFTVLolVLE6bhq+yG3OoZTSTqBSfYogzNVvkZ6JBVAy+ft7qtFbc4k4
         usE4Uovx/ExDcTjVJfWSp6ZzXGNnvYUMhczrvhqIbWSF538Qq8Y7a3X68e5yhSNgRXSa
         DC5w==
X-Gm-Message-State: ANhLgQ3sazcup6UliCixXGhwNEUAZ8Iyk8O1sh2QpY3hk0iQtfIAGzwG
        mcMqO4980GLqwmmrN8kEck4=
X-Google-Smtp-Source: ADFU+vtYWl43QzYXnKwbkZvQID3ixOcFBQpoNs4i8/pbVTarGyppbev2Io0/PMNQniAOpJVFs5jfRg==
X-Received: by 2002:a63:d244:: with SMTP id t4mr7428763pgi.241.1583412162761;
        Thu, 05 Mar 2020 04:42:42 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id z6sm7412661pfq.39.2020.03.05.04.42.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 04:42:42 -0800 (PST)
Date:   Thu, 5 Mar 2020 18:12:40 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v3] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200305124240.GA4940@afzalpc>
References: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
 <20200304203144.GA4323@alpha.franken.de>
 <20200305122950.GA4981@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305122950.GA4981@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Mar 05, 2020 at 05:59:50PM +0530, afzal mohammed wrote:

> For your reference, diff between v4 & v3 below,

i messed up with the diff b/n v4 & v3, correct one as follows, v4 is a
proper one, only diff generation got messed up.

Regards
afzal

diff --git a/arch/mips/include/asm/sni.h b/arch/mips/include/asm/sni.h
index b8653de25ca1..7dfa297ce597 100644
--- a/arch/mips/include/asm/sni.h
+++ b/arch/mips/include/asm/sni.h
@@ -11,6 +11,8 @@
 #ifndef __ASM_SNI_H
 #define __ASM_SNI_H
 
+#include <linux/irqreturn.h>
+
 extern unsigned int sni_brd_type;
 
 #define SNI_BRD_10		   2
diff --git a/arch/mips/pmcs-msp71xx/msp_time.c b/arch/mips/pmcs-msp71xx/msp_time.c
index 5f211d2d14ff..baf0da8b4c98 100644
--- a/arch/mips/pmcs-msp71xx/msp_time.c
+++ b/arch/mips/pmcs-msp71xx/msp_time.c
@@ -76,7 +76,7 @@ void __init plat_time_init(void)
 
 unsigned int get_c0_compare_int(void)
 {
-	unsigned log flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
 
 	/* MIPS_MT modes may want timer for second VPE */
 	if ((get_current_vpe()) && !tim_installed) {
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
index 84013214434a..269d4877d120 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/arch/mips/ralink/cevt-rt3352.c
@@ -89,7 +89,7 @@ static int systick_shutdown(struct clock_event_device *evt)
 	sdev = container_of(evt, struct systick_device, dev);
 
 	if (sdev->irq_requested)
-		free_irq(systick.dev.irq, &systick_irqaction);
+		free_irq(systick.dev.irq, &systick.dev);
 	sdev->irq_requested = 0;
 	iowrite32(0, systick.membase + SYSTICK_CONFIG);
 
diff --git a/arch/mips/sni/time.c b/arch/mips/sni/time.c
index 5254a3a1f37c..240bb68ec247 100644
--- a/arch/mips/sni/time.c
+++ b/arch/mips/sni/time.c
@@ -62,14 +62,12 @@ static irqreturn_t a20r_interrupt(int irq, void *dev_id)
 static void __init sni_a20r_timer_setup(void)
 {
 	struct clock_event_device *cd = &a20r_clockevent_device;
-	struct irqaction *action = &a20r_irqaction;
 	unsigned int cpu = smp_processor_id();
 
 	cd->cpumask		= cpumask_of(cpu);
 	clockevents_register_device(cd);
-	action->dev_id = cd;
 	if (request_irq(SNI_A20R_IRQ_TIMER, a20r_interrupt,
-			IRQF_PERCPU | IRQF_TIMER, "a20r-timer", NULL))
+			IRQF_PERCPU | IRQF_TIMER, "a20r-timer", cd))
 		pr_err("Failed to register a20r-timer interrupt\n");
 }
 
