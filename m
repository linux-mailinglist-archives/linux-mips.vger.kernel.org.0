Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DA0181C49
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 16:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgCKP14 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 11:27:56 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35398 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgCKP14 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 11:27:56 -0400
Received: by mail-pj1-f66.google.com with SMTP id mq3so1215580pjb.0;
        Wed, 11 Mar 2020 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BBmDoHFVj+Gc+1PrvILGXE/BCI3WgpsNmxZix3RaPvA=;
        b=lgYkHSPma4nxmW5rORwqs5N9D2c79MUAz/kx4CbPSpHAGhuWbTw3f3YyfLHNP+28oe
         DRui6tcOzwllTO+BmxT82lNMWvJmP+ScJ9sLLf3z9knKbFFza4ES/UsD+vBpctl64XKW
         Z6wOg6QjzUzLiDBhCIL8/QQRDm5XIfWujqLZhTwbKtRDakaZxCQwJfAQT4DUcKCf0G5D
         5EAzjyHFEGAifik6nzSSA8/cz7DGFPgH6yiVnty+/owxR31ZVdBC+MYXfFLK+7kVuFpR
         ISbswIzgTa9zEC99E4aUDFoF3AfaNFC+v0eFWbpzHskwqrH43ANpwoj49vEQaxtlPcjb
         QfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BBmDoHFVj+Gc+1PrvILGXE/BCI3WgpsNmxZix3RaPvA=;
        b=NdthrNcPA2QfeHrEksqXA/f9UOsb7VcLaDRlJPcpW84UY4NpqvJP47Q0ViyUSYPX66
         XOoMG0dR1nyQlhKQOOqbe3v1vIyY9pbyw4zNGjD7i25ACY3wfRF+U9Gtn/SING8ANU+N
         C40u6dW+hfSNam+WDWzkps8fEhkYCthIfFyijuUn4PgwUobJvBaQmbARrvzv4dYpSLlW
         u58GKfoCMvZVHuoMfCAV02ZQKi3WO5NPRKTj8RS+OSRtswNKWlhYNUqKMOicIOAqqOp6
         y5nEyawmbW7/CjkdQ0DKr55et64TYsyumzoJlOxfUiVJhi4gX+3yxFsVfdiXaxKJD1Zp
         E2jQ==
X-Gm-Message-State: ANhLgQ1DDqAfxWCPRezR793lvLUtYnu95u8X7gx2yjCveZcVAwyIDYge
        bOvLAzf4/U8Ve2ikIzfOfC0=
X-Google-Smtp-Source: ADFU+vseRa4e3hlV42VFz+pm4X7xdcCuMAmw8/kO2/4oz8roq7JOz4b5R9sSwF4PI2iw6dJzjhKLYA==
X-Received: by 2002:a17:90a:1a51:: with SMTP id 17mr3919053pjl.118.1583940473556;
        Wed, 11 Mar 2020 08:27:53 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id z2sm31512215pfq.50.2020.03.11.08.27.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 08:27:53 -0700 (PDT)
Date:   Wed, 11 Mar 2020 20:57:51 +0530
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
Subject: [PATCH] MIPS: pass non-NULL dev_id on shared request_irq()
Message-ID: <20200311152751.GA5044@afzalpc>
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

Recently all usages of setup_irq() was replaced by request_irq().
request_irq() does a few sanity checks that were not done in
setup_irq(), if they fail irq registration will fail. One of the check is
to ensure that non-NULL dev_id is passed in the case of shared irq. This
caused malta on qemu to hang.

Fix it by passing a dev_id to all request_irq()'s that are shared.

Fixes: ac8fd122e070 ("MIPS: Replace setup_irq() by request_irq()")
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---

Hi Thomas,

i am assuming your next tree is immutable, hence referring to the SHA-ID
of the original commit in your tree. Else if you prefer a fixup'ed
patch, let me know, i will send v5 with this fixup over v4.

REgards
afzal

 arch/mips/dec/setup.c                 | 2 +-
 arch/mips/kernel/cevt-r4k.c           | 2 +-
 arch/mips/loongson2ef/lemote-2f/irq.c | 2 +-
 arch/mips/pmcs-msp71xx/msp_time.c     | 2 +-
 arch/mips/sni/a20r.c                  | 2 +-
 arch/mips/sni/pcit.c                  | 4 ++--
 arch/mips/sni/rm200.c                 | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

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
 
-- 
2.18.0

