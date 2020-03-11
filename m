Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137A3181605
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 11:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgCKKnz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 06:43:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:34049 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgCKKnz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 06:43:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jByq3-0008R7-00; Wed, 11 Mar 2020 11:43:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9B343C0FE2; Wed, 11 Mar 2020 11:42:17 +0100 (CET)
Date:   Wed, 11 Mar 2020 11:42:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
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
Message-ID: <20200311104217.GA10615@alpha.franken.de>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311090308.GA5060@afzalpc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 11, 2020 at 02:33:08PM +0530, afzal mohammed wrote:
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 64e917dfe6b2..d24e4f2985c3 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -252,7 +252,7 @@ unsigned int __weak get_c0_compare_int(void)
>  
>  int r4k_clockevent_init(void)
>  {
> -	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
> +	unsigned long flags = IRQF_PERCPU | IRQF_TIMER;
>  	unsigned int cpu = smp_processor_id();
>  	struct clock_event_device *cd;
>  	unsigned int irq, min_delta;

I don't see why this should help. In my tree only sgi-ip30 removes
IRQF_SHARED from flags, but then it uses setup_percpu_irq().
What do I miss ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
