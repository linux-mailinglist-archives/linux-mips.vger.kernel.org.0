Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A281858C6
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 03:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgCOCXR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Mar 2020 22:23:17 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44894 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgCOCXQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Mar 2020 22:23:16 -0400
Received: by mail-oi1-f194.google.com with SMTP id d62so13914514oia.11;
        Sat, 14 Mar 2020 19:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cVd0T/lkJIQMcnf47wqj1DGNWmGfXLMr7G4/TmjDEbI=;
        b=NezFK0PkdNYgc/HhvvGKFE4kqmDhvdIdrnNyBDcImMARCEYwJsvNU2ExxHTiY4/yM+
         aq2yhTsT2d16GSuDZM2I0UhlbUy7trGQwagdhL3qfoWXZS8jA6fzbE2URXgusuceft+C
         uzUksQwsywG/tpG7lSQj9q+ZYfiymHQov/pzTmZjyXiuV3P3WKJR+RCRI85CLRSAbwTM
         m+wf+rUXjg5vJw/dEZB/MX72NDQefmhN3LXzB42GmHsywkiWTto7VJkmnqiHHZWoeRs+
         KSCH5/5v0R20OMJwr7gJoCfXL/1w1ET+RN3U7LAG32sJz6r/WSMZcg7vZGvf+ysfD7iy
         H+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cVd0T/lkJIQMcnf47wqj1DGNWmGfXLMr7G4/TmjDEbI=;
        b=fi4iNNLGlwJTenuKbAVA5TH7aGjP3DsuHuSrIo0zzrCiMafRkVQQUKFVeBovUwDmIB
         EtGAdjd+fO48Kxc0F816YXaVbTlsc2Xwh1yBaZALxMuV27KKlKPwqo1vrWOLS4lJ3iev
         VqZCsgB0xdmL+gNAY7nJA7UiCTrUNj5p4rrmZLTxJIeyE9FY27tR8TqrY12p0iv5dZwf
         1r/OtxHAkMSavqqegI7G+bhvVdVlYZySlxtArW959YoDzrJm3NiWIA3hkhT4/fjzHVcG
         Z+tqpuMf1Ov+a5Alr6Mbmr+HP3KPz79sWh+OBMS7obPHKYIX/qtXzQIr7Kcqxg1je1Q0
         lnwQ==
X-Gm-Message-State: ANhLgQ3Km4Iapa1WXiVVpmOtwzu2Liq1uxsTmje3C+IlplKsgcNPKjx6
        X7vQ6IKrIV7W9s6JNWEiByGuZyji
X-Google-Smtp-Source: ADFU+vv490wYE3mVbotqwz88Dy7Kl7JWhJErp73WcHrtcIUHVEtNpz2EmmUE2GoZpTojSdnuQWdliw==
X-Received: by 2002:a17:90a:a511:: with SMTP id a17mr16097664pjq.178.1584206355021;
        Sat, 14 Mar 2020 10:19:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e24sm6485606pfi.200.2020.03.14.10.19.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Mar 2020 10:19:14 -0700 (PDT)
Date:   Sat, 14 Mar 2020 10:19:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        John Crispin <john@phrozen.org>,
        Huacai Chen <chenhc@lemote.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: pass non-NULL dev_id on shared request_irq()
Message-ID: <20200314171912.GA24092@roeck-us.net>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
 <20200311131210.GA5115@afzalpc>
 <20200311160307.GA15464@alpha.franken.de>
 <20200311163249.GA4984@afzalpc>
 <20200313121138.GA5985@afzalpc>
 <20200314081312.GA4948@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314081312.GA4948@afzalpc>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 14, 2020 at 01:43:12PM +0530, afzal mohammed wrote:
> Recently all usages of setup_irq() was replaced by request_irq().
> request_irq() does a few sanity checks that were not done in
> setup_irq(), if they fail irq registration will fail. One of the check
> is to ensure that non-NULL dev_id is passed in the case of shared irq.
> This caused malta on qemu to hang.
> 
> Fix it by passing handler as dev_id to all request_irq()'s that are
> shared. For sni, instead of passing non-NULL dev_id, remove shared irq
> flags.
> 
> Fixes: ac8fd122e070 ("MIPS: Replace setup_irq() by request_irq()")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v2:
>  * use handler for dev_id
>  * remove shared irq flags for sni
> 
>  arch/mips/dec/setup.c                 | 2 +-
>  arch/mips/kernel/cevt-r4k.c           | 3 ++-
>  arch/mips/loongson2ef/lemote-2f/irq.c | 2 +-
>  arch/mips/pmcs-msp71xx/msp_time.c     | 2 +-
>  arch/mips/sni/a20r.c                  | 4 ++--
>  arch/mips/sni/pcit.c                  | 8 ++++----
>  arch/mips/sni/rm200.c                 | 6 +++---
>  7 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
> index c8bbac0c5051..d4e868b828e5 100644
> --- a/arch/mips/dec/setup.c
> +++ b/arch/mips/dec/setup.c
> @@ -758,7 +758,7 @@ void __init arch_init_irq(void)
>  	/* Register the bus error interrupt. */
>  	if (dec_interrupt[DEC_IRQ_BUS] >= 0 && busirq_handler) {
>  		if (request_irq(dec_interrupt[DEC_IRQ_BUS], busirq_handler,
> -				busirq_flags, "bus error", NULL))
> +				busirq_flags, "bus error", busirq_handler))
>  			pr_err("Failed to register bus error interrupt\n");
>  	}
>  	/* Register the HALT interrupt. */
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 64e917dfe6b2..17a9cbb8b3df 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -292,7 +292,8 @@ int r4k_clockevent_init(void)
>  
>  	cp0_timer_irq_installed = 1;
>  
> -	if (request_irq(irq, c0_compare_interrupt, flags, "timer", NULL))
> +	if (request_irq(irq, c0_compare_interrupt, flags, "timer",
> +			c0_compare_interrupt))
>  		pr_err("Failed to request irq %d (timer)\n", irq);
>  
>  	return 0;
> diff --git a/arch/mips/loongson2ef/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
> index 34e15e8b7a8f..6f00579971a3 100644
> --- a/arch/mips/loongson2ef/lemote-2f/irq.c
> +++ b/arch/mips/loongson2ef/lemote-2f/irq.c
> @@ -109,7 +109,7 @@ void __init mach_init_irq(void)
>  
>  	/* setup north bridge irq (bonito) */
>  	if (request_irq(LOONGSON_NORTH_BRIDGE_IRQ, ip6_action,
> -			IRQF_SHARED | IRQF_NO_THREAD, "cascade", NULL))
> +			IRQF_SHARED | IRQF_NO_THREAD, "cascade", ip6_action))
>  		pr_err("Failed to register north bridge cascade interrupt\n");
>  	/* setup source bridge irq (i8259) */
>  	if (request_irq(LOONGSON_SOUTH_BRIDGE_IRQ, no_action,
> diff --git a/arch/mips/pmcs-msp71xx/msp_time.c b/arch/mips/pmcs-msp71xx/msp_time.c
> index baf0da8b4c98..9c629829f447 100644
> --- a/arch/mips/pmcs-msp71xx/msp_time.c
> +++ b/arch/mips/pmcs-msp71xx/msp_time.c
> @@ -81,7 +81,7 @@ unsigned int get_c0_compare_int(void)
>  	/* MIPS_MT modes may want timer for second VPE */
>  	if ((get_current_vpe()) && !tim_installed) {
>  		if (request_irq(MSP_INT_VPE1_TIMER, c0_compare_interrupt, flags,
> -				"timer", NULL))
> +				"timer", c0_compare_interrupt))
>  			pr_err("Failed to register timer interrupt\n");
>  		tim_installed++;
>  	}
> diff --git a/arch/mips/sni/a20r.c b/arch/mips/sni/a20r.c
> index ba966d62fb4b..0ecffb65fd6d 100644
> --- a/arch/mips/sni/a20r.c
> +++ b/arch/mips/sni/a20r.c
> @@ -222,8 +222,8 @@ void __init sni_a20r_irq_init(void)
>  		irq_set_chip_and_handler(i, &a20r_irq_type, handle_level_irq);
>  	sni_hwint = a20r_hwint;
>  	change_c0_status(ST0_IM, IE_IRQ0);
> -	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler,
> -			IRQF_SHARED, "ISA", NULL))
> +	if (request_irq(SNI_A20R_IRQ_BASE + 3, sni_isa_irq_handler, 0, "ISA",
> +			NULL))
>  		pr_err("Failed to register ISA interrupt\n");
>  }
>  
> diff --git a/arch/mips/sni/pcit.c b/arch/mips/sni/pcit.c
> index 4a850ab03398..b331fe22c529 100644
> --- a/arch/mips/sni/pcit.c
> +++ b/arch/mips/sni/pcit.c
> @@ -244,8 +244,8 @@ void __init sni_pcit_irq_init(void)
>  	*(volatile u32 *)SNI_PCIT_INT_REG = 0;
>  	sni_hwint = sni_pcit_hwint;
>  	change_c0_status(ST0_IM, IE_IRQ1);
> -	if (request_irq(SNI_PCIT_INT_START + 6, sni_isa_irq_handler,
> -			IRQF_SHARED, "ISA", NULL))
> +	if (request_irq(SNI_PCIT_INT_START + 6, sni_isa_irq_handler, 0, "ISA",
> +			NULL))
>  		pr_err("Failed to register ISA interrupt\n");
>  }
>  
> @@ -259,8 +259,8 @@ void __init sni_pcit_cplus_irq_init(void)
>  	*(volatile u32 *)SNI_PCIT_INT_REG = 0x40000000;
>  	sni_hwint = sni_pcit_hwint_cplus;
>  	change_c0_status(ST0_IM, IE_IRQ0);
> -	if (request_irq(MIPS_CPU_IRQ_BASE + 3, sni_isa_irq_handler,
> -			IRQF_SHARED, "ISA", NULL))
> +	if (request_irq(MIPS_CPU_IRQ_BASE + 3, sni_isa_irq_handler, 0, "ISA",
> +			NULL))
>  		pr_err("Failed to register ISA interrupt\n");
>  }
>  
> diff --git a/arch/mips/sni/rm200.c b/arch/mips/sni/rm200.c
> index ba1f2fc6a43e..d84744ca871d 100644
> --- a/arch/mips/sni/rm200.c
> +++ b/arch/mips/sni/rm200.c
> @@ -473,10 +473,10 @@ void __init sni_rm200_irq_init(void)
>  	sni_hwint = sni_rm200_hwint;
>  	change_c0_status(ST0_IM, IE_IRQ0);
>  	if (request_irq(SNI_RM200_INT_START + 0, sni_rm200_i8259A_irq_handler,
> -			IRQF_SHARED, "onboard ISA", NULL))
> +			0, "onboard ISA", NULL))
>  		pr_err("Failed to register onboard ISA interrupt\n");
> -	if (request_irq(SNI_RM200_INT_START + 1, sni_isa_irq_handler,
> -			IRQF_SHARED, "ISA", NULL))
> +	if (request_irq(SNI_RM200_INT_START + 1, sni_isa_irq_handler, 0, "ISA",
> +			NULL))
>  		pr_err("Failed to register ISA interrupt\n");
>  }
>  
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
