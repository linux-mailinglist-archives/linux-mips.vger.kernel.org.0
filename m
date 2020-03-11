Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA7C181951
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 14:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgCKNMP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 09:12:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38718 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbgCKNMP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 09:12:15 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so1091137plz.5;
        Wed, 11 Mar 2020 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zGx3tC+j4wwScyOOZEgYfobl7ESHitp0X2fW0ePwPeA=;
        b=RnoMVBSIDlCbR9SMQjRYqG7XLNB0/Ja6aGtP5iwcyoaJXRujmvvX+3jTocNm45e2v+
         4C1RdEWhPMyliJc5W+Uw56yhgkviMT75q9GVSXP4H+f+Kx9Jwn77SCMM8a+7TF6wIP28
         WWTs5P9rShs+72+0CyLIVOG2ircaFvOpHFJ4j1VdFqQw2CnbfLW9YjVc014yQD4PbcLh
         JZCuOKD4EgYpOtlMg+6cUb87ABjKRfZNDOarV1Q0yWwlphYktjzKTYDtfVbyKajul2o8
         DHJLq9ycFfmEIbQvmiFQR8IYVaqyvBJlmlIyGnwjU78oFyw7gYYFeF5hYscaFquv8Isq
         Hb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zGx3tC+j4wwScyOOZEgYfobl7ESHitp0X2fW0ePwPeA=;
        b=mg/xUUfQw7aNzQt6vCIyNrIHqnpgigWJU9K82uhHbpEeJqfo5XgovoCvbdpEKZgxSr
         VvPODDoa7IMYpKKoHaCl4l4k8x2JGTOpkw/PvailiaarC4xc1OQijacuj/gDHnTE7Cpv
         DbKDSCiv8Tn3l1B2vKhlNjpaU26Ue3xBdIeXkEFUiLa5Dx24xyJ242jQY75k5nofmvD9
         hsFZCQC93tzND4SFNCdxkQMk/Xn5c03dvbes/b0me8y13FZLrPYQ5vEOjlwiZ6pcyppD
         sZVlbPAeVM86TVOxIItHdIPHovKzjyGAqN/TqnwITMvpNO3KEX6JGK956XXX8RggO11m
         f8Lw==
X-Gm-Message-State: ANhLgQ0z4jKeGRgVUsSy2v7cxYEbiy17y7aeMOyZmc/68OZaY+U6ifme
        tHoLn1JUG2FEJ+bAbZNGQI+eZ3Gk
X-Google-Smtp-Source: ADFU+vvPbgKOfQqZTcP9HlWhJ6URPoi7WwdMADheIF4FdkOYjJwaFS/KlHZK8fAVlvDk5E9wKwbJQw==
X-Received: by 2002:a17:90a:8005:: with SMTP id b5mr3272477pjn.37.1583932333369;
        Wed, 11 Mar 2020 06:12:13 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id w24sm5497734pjh.26.2020.03.11.06.12.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 06:12:12 -0700 (PDT)
Date:   Wed, 11 Mar 2020 18:42:10 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200311131210.GA5115@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311104217.GA10615@alpha.franken.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Wed, Mar 11, 2020 at 11:42:17AM +0100, Thomas Bogendoerfer wrote:
> On Wed, Mar 11, 2020 at 02:33:08PM +0530, afzal mohammed wrote:

> > diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c

> >  int r4k_clockevent_init(void)
> >  {
> > -	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
> > +	unsigned long flags = IRQF_PERCPU | IRQF_TIMER;

> I don't see why this should help. In my tree only sgi-ip30 removes
> IRQF_SHARED from flags, but then it uses setup_percpu_irq().
> What do I miss ?

You did not miss anything. Though it works, i took a wrong route
following the tags & arrived at that solution in a hurry.
(struct irqaction used in sgi-ip30 was used here earlier w/ setup_irq).

The problem is sanity checks in request_irq() [ rather in
request_thread_iq() ]


	if (((irqflags & IRQF_SHARED) && !dev_id) ||
	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
		return -EINVAL;

If IRQF_SHARED is passed, it exepcts a non-NULL dev_id, here it is
NULL, setup_irq() doesn't have any check like that.

So i think proper solution is to add a non NULL dev_id, as removing
IRQF_SHARED might affect some platforms that might be using that
interrupt line shared.

Patch with non-NULL dev_id below, it works w/ Nathan's test case.

Would you prefer an incremental patch or a fixed up v5 patch ?

i will test build the other cases as well & sent the patch later today,
though it is trivial, just being paranoid, since bitten by build error
earlier.

Also there was no meaningful pointer to pass as dev_id except in one
case, so i have used name itself.

Regards
afzal

--->8---

diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index c8bbac0c5051..cbbb27fbab19 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -758,7 +758,7 @@ void __init arch_init_irq(void)
 	/* Register the bus error interrupt. */
 	if (dec_interrupt[DEC_IRQ_BUS] >= 0 && busirq_handler) {
 		if (request_irq(dec_interrupt[DEC_IRQ_BUS], busirq_handler,
-				busirq_flags, "bus error", NULL))
+				busirq_flags, "bus error", "bus error"))
 			pr_err("Failed to register bus error interrupt\n");
 	}
 	/* Register the HALT interrupt. */
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 64e917dfe6b2..4b19810c67d4 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -292,7 +292,7 @@ int r4k_clockevent_init(void)
 
 	cp0_timer_irq_installed = 1;
 
-	if (request_irq(irq, c0_compare_interrupt, flags, "timer", NULL))
+	if (request_irq(irq, c0_compare_interrupt, flags, "timer", cd))
 		pr_err("Failed to request irq %d (timer)\n", irq);
 
 	return 0;
diff --git a/arch/mips/loongson2ef/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
index 34e15e8b7a8f..1c99e83cabae 100644
--- a/arch/mips/loongson2ef/lemote-2f/irq.c
+++ b/arch/mips/loongson2ef/lemote-2f/irq.c
@@ -109,7 +109,7 @@ void __init mach_init_irq(void)
 
 	/* setup north bridge irq (bonito) */
 	if (request_irq(LOONGSON_NORTH_BRIDGE_IRQ, ip6_action,
-			IRQF_SHARED | IRQF_NO_THREAD, "cascade", NULL))
+			IRQF_SHARED | IRQF_NO_THREAD, "cascade", "cascade"))
 		pr_err("Failed to register north bridge cascade interrupt\n");
 	/* setup source bridge irq (i8259) */
 	if (request_irq(LOONGSON_SOUTH_BRIDGE_IRQ, no_action,
diff --git a/arch/mips/pmcs-msp71xx/msp_time.c b/arch/mips/pmcs-msp71xx/msp_time.c
index baf0da8b4c98..0601a3f7f8f6 100644
--- a/arch/mips/pmcs-msp71xx/msp_time.c
+++ b/arch/mips/pmcs-msp71xx/msp_time.c
@@ -81,7 +81,7 @@ unsigned int get_c0_compare_int(void)
 	/* MIPS_MT modes may want timer for second VPE */
 	if ((get_current_vpe()) && !tim_installed) {
 		if (request_irq(MSP_INT_VPE1_TIMER, c0_compare_interrupt, flags,
-				"timer", NULL))
+				"timer", "timer"))
 			pr_err("Failed to register timer interrupt\n");
 		tim_installed++;
 	}
diff --git a/arch/mips/sni/a20r.c b/arch/mips/sni/a20r.c
index ba966d62fb4b..1bfea4aae124 100644
--- a/arch/mips/sni/a20r.c
+++ b/arch/mips/sni/a20r.c
@@ -223,7 +223,7 @@ void __init sni_a20r_irq_init(void)
 	sni_hwint = a20r_hwint;
 	change_c0_status(ST0_IM, IE_IRQ0);
 	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler,
-			IRQF_SHARED, "ISA", NULL))
+			IRQF_SHARED, "ISA", "ISA"))
 		pr_err("Failed to register ISA interrupt\n");
 }
 
diff --git a/arch/mips/sni/pcit.c b/arch/mips/sni/pcit.c
index 4a850ab03398..15080155cc9a 100644
--- a/arch/mips/sni/pcit.c
+++ b/arch/mips/sni/pcit.c
@@ -245,7 +245,7 @@ void __init sni_pcit_irq_init(void)
 	sni_hwint = sni_pcit_hwint;
 	change_c0_status(ST0_IM, IE_IRQ1);
 	if (request_irq(SNI_PCIT_INT_START + 6, sni_isa_irq_handler,
-			IRQF_SHARED, "ISA", NULL))
+			IRQF_SHARED, "ISA", "ISA"))
 		pr_err("Failed to register ISA interrupt\n");
 }
 
@@ -260,7 +260,7 @@ void __init sni_pcit_cplus_irq_init(void)
 	sni_hwint = sni_pcit_hwint_cplus;
 	change_c0_status(ST0_IM, IE_IRQ0);
 	if (request_irq(MIPS_CPU_IRQ_BASE + 3, sni_isa_irq_handler,
-			IRQF_SHARED, "ISA", NULL))
+			IRQF_SHARED, "ISA", "ISA"))
 		pr_err("Failed to register ISA interrupt\n");
 }
 
diff --git a/arch/mips/sni/rm200.c b/arch/mips/sni/rm200.c
index ba1f2fc6a43e..2b4a6448b428 100644
--- a/arch/mips/sni/rm200.c
+++ b/arch/mips/sni/rm200.c
@@ -473,10 +473,10 @@ void __init sni_rm200_irq_init(void)
 	sni_hwint = sni_rm200_hwint;
 	change_c0_status(ST0_IM, IE_IRQ0);
 	if (request_irq(SNI_RM200_INT_START + 0, sni_rm200_i8259A_irq_handler,
-			IRQF_SHARED, "onboard ISA", NULL))
+			IRQF_SHARED, "onboard ISA", "onboard ISA"))
 		pr_err("Failed to register onboard ISA interrupt\n");
 	if (request_irq(SNI_RM200_INT_START + 1, sni_isa_irq_handler,
-			IRQF_SHARED, "ISA", NULL))
+			IRQF_SHARED, "ISA", "ISA"))
 		pr_err("Failed to register ISA interrupt\n");
 }
 
