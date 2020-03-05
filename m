Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B741A17A542
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 13:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgCEM34 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 07:29:56 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34995 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgCEM3z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 07:29:55 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so2590821plt.2;
        Thu, 05 Mar 2020 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsRFIJGbLn09Yax3ALyppTmkBEnV+CVKPbERHBMJArw=;
        b=sfLY1PVAAba9flVNioMeI/lpgOvKqnCrbN/jvx2s7G2M/KM8LF5qFZI3vYwUVYwH8A
         wu0rLrgHHp9lcLeR0qxEqY3tDGe4V0VjSvfEBl+n/To44sG45BiJMCge+7gy6VdmBJMy
         z7wRevZFUrlGABpABDREyaCzhrONhlYC9LKSDpo0AvxgtthFEZgx5WAntPfSpWv8cHFE
         0j+YqesLJSRZJA+47k+8KUAmBejbHzzxrCmlHiq2Fge2T0JcfXPF5/4hPecEmPt2w0Pq
         MzQegrZy43EqqYn7u4bar67QlT5y/0NQLkMIkqG+CMa5fiuxtARUVY0mjL8FvpuihnUW
         i6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsRFIJGbLn09Yax3ALyppTmkBEnV+CVKPbERHBMJArw=;
        b=gBHN0I2kZy8H7ukueB2mpe6IkQmaYVNwj8pLdLDl7nzTUON0KRTMrc4Gt+L2XONy16
         9mgAZVV3RFcWbgJSHmEIZIounZHyUrrtOQbMJPeE1Eo17A0KHn/3mxZq3qzq5l1AnI2E
         eNXScWFLaC0N4NLkrvQ1Fpw09Mcng7eome+VASG/a9f9rwcNPOkcXaLyG4CT0YHnNag7
         01mzNPKjqiiRc0/5u3I2Q/sYdPTllBHcGJFKl16p0zaWDOQRcJHcPjfhVHdMyONnLPQk
         K98XVz+GkmN1R/GhbmOuFlhWk7tel6JD8S487r/AyDPdwMCTjr64q9+na0gBUrsoDHXb
         4YhQ==
X-Gm-Message-State: ANhLgQ0kd3i7AZFRP82v8e8W8B23XqhGY5qM3QvaGSP4oUa0WyXbYNex
        0vIYcCQ632DvtRJi3T0N9jIBq9h4
X-Google-Smtp-Source: ADFU+vvJHPjqW9pEsQ+KnwdNio1Po/d3nZ0nPLW6PPI8aKwONgI+eNX/DpuFxwpDPdA/m1IlT2WoMg==
X-Received: by 2002:a17:90b:3542:: with SMTP id lt2mr7959300pjb.96.1583411393413;
        Thu, 05 Mar 2020 04:29:53 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id h29sm29221565pfk.57.2020.03.05.04.29.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 04:29:52 -0800 (PST)
Date:   Thu, 5 Mar 2020 17:59:50 +0530
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
Message-ID: <20200305122950.GA4981@afzalpc>
References: <20200304005549.5832-1-afzal.mohd.ma@gmail.com>
 <20200304203144.GA4323@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304203144.GA4323@alpha.franken.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Wed, Mar 04, 2020 at 09:31:44PM +0100, Thomas Bogendoerfer wrote:
> On Wed, Mar 04, 2020 at 06:25:43AM +0530, afzal mohammed wrote:

> > Hi mips maintainers,
> > 
> > if okay w/ this change, please consider taking it thr' your tree, else please
> > let me know.
> 
> sorry this doesn't even compile for the first platform I've tested:

i apologize for the mistake.

Of the 15 architectures that were subjected to setup_irq() cleanup,
i had done build & boot test only on ARM & x86_64, at the minimum i
should have informed you upfront in the previous mail (in v2 & v1 it was
mentioned in cover letter). i was trying to rely on kbuild test robot
for help in building other arch's. Seems it is randomly selecting
patches, since some of the issues were present in v2 & v1 as well and
no error report were recieved on v1 & v2 MIPS patch.

kbuild test robot had provided the way to create mips cross compiler
as well as the config. The build error has been fixed that were
spotted by you as well kbuild test robot, also there were a few more
issues including other build error. v4 that resolves all these
has been sent.

All the files that has been modified has been verifed to generate
object files w/o error or warnings. w/ the test robot provided config,
not all changes in my patch were being compiled, so i had to manually
select each machines one at a time to verify every change. Also i
couldn't build 3 machines (msp71xx, loongson64 & bcm63xx) even w/o my
changes. Those i had to find out defconfig's that can make those
changes build, then they also could be verified.

Sorry for the trouble, please let me know if further issues.

For your reference, diff between v4 & v3 below,

Regards
afzal


diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index d4f136c7fb11..d17e44c99df9 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -214,7 +214,7 @@ process_mcheck_info(unsigned long vector, unsigned long la_ptr,
  * processed by PALcode, and comes in via entInt vector 1.
  */
 void __init
-init_rtc_irq(irqreturn_t handler)
+init_rtc_irq(irq_handler_t handler)
 {
 	irq_set_chip_and_handler_name(RTC_IRQ, &dummy_irq_chip,
 				      handle_percpu_irq, "RTC");
diff --git a/arch/alpha/kernel/irq_impl.h b/arch/alpha/kernel/irq_impl.h
index 7ac58be4ccf4..fbf21892e66d 100644
--- a/arch/alpha/kernel/irq_impl.h
+++ b/arch/alpha/kernel/irq_impl.h
@@ -23,7 +23,7 @@ extern void pyxis_device_interrupt(unsigned long);
 
 extern void init_srm_irqs(long, unsigned long);
 extern void init_pyxis_irqs(unsigned long);
-extern void init_rtc_irq(irqreturn_t handler);
+extern void init_rtc_irq(irq_handler_t  handler);
 
 extern void common_init_isa_dma(void);
 
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
 

