Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27897107792
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 19:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfKVSqw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 13:46:52 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:42377 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfKVSqw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 13:46:52 -0500
Received: by mail-pj1-f65.google.com with SMTP id y21so3385431pjn.9
        for <linux-mips@vger.kernel.org>; Fri, 22 Nov 2019 10:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OSvkJJrieSPyO1l9Da3lpyvS0sudtQaaBJET8G2rHto=;
        b=T3Z/3BidYGtoXUgbx6MU3gyuy1fZxpfK0XGb1ynW1yDUzv+McHTVS8U16cov1BlCkA
         pvzafSzzXVT1dFDcmVtAXUdLj2/LhDLfLeWkUc7cIV4r4j32w4DZJI9FgDyG4PFNWRGH
         td9UyjZFlYeYQkA0jZ1b/l0tts7XYmsAmQZz22ETfdQwPSecYsL3VzrdeTEFAEvQ8A2U
         DPWoMVn2xgyoYfKkUct4XxukDwQu1nuDvkwWpshwNn4VZoCKyCY3fCHop8gE60rficww
         cqUg+8kGrG3VS/k36PkHu/JLG18tc3EcoZRBjFf58rlZ0pkBRBIFL1Od49fxa4RPkMHY
         teig==
X-Gm-Message-State: APjAAAWCoP0f1sOuSyJ12szxBZbuqQ9gIGoYUBr9QfBdhT4pTCNNvb+/
        XrWkbI9YkULN4mkXpwhyLKg=
X-Google-Smtp-Source: APXvYqwI2E8fFeDAcoVOWg83NhB1doej2OPm0i1CuKONZ2M2VvTETnvR5p8NQ5Prx/PJh4EycNaYtA==
X-Received: by 2002:a17:90a:ec02:: with SMTP id l2mr20491068pjy.31.1574448411606;
        Fri, 22 Nov 2019 10:46:51 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id r5sm8182539pfh.179.2019.11.22.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:46:50 -0800 (PST)
Date:   Fri, 22 Nov 2019 10:47:31 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH] MIPS: Make sure ebase address is in KSEG0
Message-ID: <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain>
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
> Dynamically allocated ebase address above 0x20000000 can be triggered
> by some special physical memory layout, or just by a "big kernel + big
> initrd + big swiotlb" configuration.
> 
> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64 it
> is usable but this case is warned. However, this warning is useless
> because it is unfixable in a specific system configuration. So we just
> use CKSEG0 as a fallback.

I'd prefer that we don't assume there's memory at physical address zero
- that property doesn't hold for all systems.

How about the change I suggested previously over here:

  https://lore.kernel.org/linux-mips/20191108191149.bbq3h4xp4famsh2n@lantea.localdomain/

Would that work for you?

Thanks,
    Paul

> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kernel/traps.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 9d9b2a4..7393f33 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2306,10 +2306,15 @@ void __init trap_init(void)
>  		 * EVA is special though as it allows segments to be rearranged
>  		 * and to become uncached during cache error handling.
>  		 */
> -		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
> +		if (ebase_pa < 0x20000000)
>  			ebase = CKSEG0ADDR(ebase_pa);
> -		else
> +		else if (IS_ENABLED(CONFIG_EVA))
>  			ebase = (unsigned long)phys_to_virt(ebase_pa);
> +		else {
> +			memblock_free(ebase_pa, vec_size);
> +			ebase = CKSEG0;
> +			memblock_reserve(virt_to_phys((void *)ebase), vec_size);
> +		}
>  	}
>  
>  	if (cpu_has_mmips) {
> -- 
> 2.7.0
> 
