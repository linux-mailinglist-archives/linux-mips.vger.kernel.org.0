Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83983FE73A
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 22:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKOVgp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 16:36:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43284 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKOVgp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 16:36:45 -0500
Received: by mail-pl1-f195.google.com with SMTP id a18so5530106plm.10;
        Fri, 15 Nov 2019 13:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HKB+jFOHyqunil9vKc+eJ+fGW7O6CCFe80yOgJOM6R0=;
        b=Yek8216+l3N9sznKB1W6Fco8bhNQfpnYdU5wWE0c/6K702QyuHifQJGCBHF9hFlIE8
         Nz3Jc6jk8/6PWLbQDLuivi0hCJKuXCHdLgFA97kmZ3Ed1UiTwhq1sUjxQYmOV09CWn4i
         1c3MyyLNJee/yd59hpP2bihkg+rofBGKb6wKGdN3GeFU/nbNK1IzoG9mEl2Mm/QHjKSw
         /esQnxmkfpJbS5w4bRAhoXNmRJ39atc7AkxBbfwePmNRoZeayrDxaBwxn+ruJma/g10Z
         Bt/cosLh0MfpxM6Ml/mphMI/xwYPs1EZspiNOxaF/2LHRmTW5ewA1aKvXuJz6ya1Z5xP
         7FKg==
X-Gm-Message-State: APjAAAWaUnJvs0UfrYQSU6H9FD0FkCMto5wTxYFEBPiWk9KlQZHnGAF1
        AxAoW9Nt2/B2aQ5EIuh9ynkenMd8svolHg==
X-Google-Smtp-Source: APXvYqz1E55aT4IEJUVM1IR5W+3NaNvT8YV1U2Il69k7jMPye3AS+BCw/RzvWHg95wp8lwBknrvoMg==
X-Received: by 2002:a17:902:5985:: with SMTP id p5mr17934348pli.259.1573853804377;
        Fri, 15 Nov 2019 13:36:44 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id p16sm11701614pfn.171.2019.11.15.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 13:36:43 -0800 (PST)
Date:   Fri, 15 Nov 2019 13:37:16 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, paul@crapouillou.net,
        tglx@linutronix.de, jiaxun.yang@flygoat.com
Subject: Re: [PATCH 2/2] MIPS: Ingenic: Disable abandoned HPTLB function.
Message-ID: <20191115213716.wt4wn2moj3fup4dc@lantea.localdomain>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

On Thu, Oct 24, 2019 at 05:29:01PM +0800, Zhou Yanjie wrote:
> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
> tlb, write 0xa9000000 to cp0 config5 sel4 to disable this
> function to prevent getting stuck.

Can you describe how we "get stuck"? What actually goes wrong on the
affected CPUs? Do they misinterpret EntryLo values? Which bits do they
misinterpret?

> Confirmed by Ingenic,
> this operation will not adversely affect processors
> without HPTLB function.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 16033a4..cfebf8c 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1966,11 +1966,23 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
>  	}
>  
>  	/*
> -	 * The config0 register in the Xburst CPUs with a processor ID of
> +	 * The config0 register in the XBurst CPUs with a processor ID of
> +	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
> +	 * 0xa9000000 to cp0 config5 sel4 to disable this function to

Saying "config5" suggests $16 sel 5 to me - Config5 is after all an
architecturally defined register & it's not this one. It'd be better to
say "cop0 register 5 sel 4".

> +	 * prevent getting stuck.
> +	 */
> +	if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D1) {
> +		__asm__ (
> +			"li    $2, 0xa9000000 \n\t"
> +			"mtc0  $2, $5, 4      \n\t"
> +			"nop                  \n\t"
> +			::"r"(2));

I'd prefer that you add #defines to asm/mipsregs.h to provide a
write_c0_X() function where X is replaced with whatever the name of this
register is, and preferably also #define macros describing the fields
present in the register. Writing a magic number isn't ideal.

> +	/*
> +	 * The config0 register in the XBurst CPUs with a processor ID of
>  	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
>  	 * but they don't actually support this ISA.
>  	 */
> -	if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D0)
> +	} else if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D0)

It might be cleaner to use a switch statement rather than writing out
the & PRID_COMP_MASK condition twice?

Thanks,
    Paul
