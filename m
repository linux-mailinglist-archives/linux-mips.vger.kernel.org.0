Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48684389E6
	for <lists+linux-mips@lfdr.de>; Sun, 24 Oct 2021 17:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhJXPju (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Oct 2021 11:39:50 -0400
Received: from elvis.franken.de ([193.175.24.41]:37601 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231699AbhJXPjs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Oct 2021 11:39:48 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mefYp-0006bc-04; Sun, 24 Oct 2021 17:37:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 34278C265F; Sun, 24 Oct 2021 17:28:46 +0200 (CEST)
Date:   Sun, 24 Oct 2021 17:28:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/3] MIPS: loongson64: Drop call to irq_cpu_offline()
Message-ID: <20211024152846.GE4721@alpha.franken.de>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211021170414.3341522-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021170414.3341522-2-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 21, 2021 at 06:04:12PM +0100, Marc Zyngier wrote:
> Also loongson64 calls irq_cpu_offline(), none of its interrupt
> controllers implement the .irq_cpu_offline callback.
> 
> It is thus obvious that this call only serves the dubious purpose
> of wasting precious CPU cycles by iterating over all interrupts.
> 
> Get rid of the call altogether.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/mips/loongson64/smp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 09ebe84a17fe..660e1de4412a 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -550,7 +550,6 @@ static int loongson3_cpu_disable(void)
>  	set_cpu_online(cpu, false);
>  	calculate_cpu_foreign_map();
>  	local_irq_save(flags);
> -	irq_cpu_offline();
>  	clear_c0_status(ST0_IM);
>  	local_irq_restore(flags);
>  	local_flush_tlb_all();
> -- 
> 2.30.2

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
