Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C116E8D2AE
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 14:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfHNMDq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 08:03:46 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42587 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHNMDq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Aug 2019 08:03:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so1873632ljj.9
        for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2019 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oz+o9QELBZmrA1M+/Z0GuSDd7a+JAUnoaJj39KbOPLU=;
        b=u45dD/bL/NhAEgEswKtC5NTD1BHLMnN6HCc0APyUCW5u7ZiUXGWsbbLbadwH05qCry
         QZa/GsXSU9EqfDMAIdh0VUn54N3uneb8rhWaIzvu0ZEKhGkdW+Swq5aD8q3SJVfzY0qc
         y0t+l4Fyze+giYSBzTlbJsF253XyQ/eaR0JgOWUmYYnqTMwjoCGQlNhCCe0TxTQUADFv
         R8Nv/QDsvQdsg/iCWcuV77Jcto5RQZLz0y5iwGUmaNRhpATsc0vb1+XQjqzdOsuWz+Cn
         i5yEVGBELHedjjnYFnuDeeYDmsLCEDMfSzybCXqcdH807w6f1/PUD6GfAearSB+aMkts
         Oeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oz+o9QELBZmrA1M+/Z0GuSDd7a+JAUnoaJj39KbOPLU=;
        b=N6SToKNxjGz0HnhTObRNYP5CJ4rsbsROqUYqeTfGSb6RBb8BTf4fQwP3ZUBiNdtJh7
         KDSuNjVYY/c1jH6CkndtPw2HX1MlzsXOgYaOV3xUtfYhrJC4IF7rOtNOTC7McjsFiJ4f
         OU8QP1JHWIw+p/bGETZfPIJnW1uPjGCdAT4iekCvZ5DN9mTuFRgVnC8LJqZTgwNG+HxS
         Z9g+wm6SoweENNJMsqSdNBtUFiAMHtnMn2RJlIzGio34T9Ohf3AkaRS1EM/CQE9cmds7
         iwhbBSMt/4+sC5pGrGat5CIwpju7lZ5i9Zl1djHWRsbdz67BbfdW83QyklVJrbl/fH85
         LtdA==
X-Gm-Message-State: APjAAAWpPny7Lnr+rF85jY6FovHgqEQ/zouNqDsQP4LjrGI4rcRaK5O4
        Qjdp/KSe+dHifO6hWUypsVka0HAR
X-Google-Smtp-Source: APXvYqxQ36wFt0wcYdbAwAz3XJLe4RoU6z9tc/FqWe+vFOxbcOQK4HfIYFt109mA+FWDDSBAlc1O6g==
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr24143037ljs.189.1565784224136;
        Wed, 14 Aug 2019 05:03:44 -0700 (PDT)
Received: from mobilestation ([95.79.14.48])
        by smtp.gmail.com with ESMTPSA id v7sm3233253ljc.46.2019.08.14.05.03.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 05:03:43 -0700 (PDT)
Date:   Wed, 14 Aug 2019 15:03:41 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        yasha.che3@gmail.com, aurelien@aurel32.net, sfr@canb.auug.org.au,
        matt.redfearn@mips.com, chenhc@lemote.com
Subject: Re: [PATCH 3/7] MIPS: fw: Record prom memory
Message-ID: <20190814120340.oz4kh7cbv653s5rd@mobilestation>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190808075013.4852-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808075013.4852-4-jiaxun.yang@flygoat.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 08, 2019 at 03:50:09PM +0800, Jiaxun Yang wrote:
> boot_mem_map is nolonger exist so we need to maintain a list
> of prom memory by ourselves.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/fw/arc/memory.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
> index 429b7f8d2aeb..02e954b3700e 100644
> --- a/arch/mips/fw/arc/memory.c
> +++ b/arch/mips/fw/arc/memory.c
> @@ -27,6 +27,11 @@
>  
>  #undef DEBUG
>  
> +#define MAX_PROM_MEM 5
> +static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
> +static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
> +static unsigned int nr_prom_mem __initdata;
> +
>  /*
>   * For ARC firmware memory functions the unit of meassuring memory is always
>   * a 4k page of memory
> @@ -129,6 +134,7 @@ void __init prom_meminit(void)
>  	}
>  #endif
>  
> +	nr_prom_mem = 0;
>  	p = PROM_NULL_MDESC;
>  	while ((p = ArcGetMemoryDescriptor(p))) {
>  		unsigned long base, size;
> @@ -139,6 +145,12 @@ void __init prom_meminit(void)
>  		type = prom_memtype_classify(p->type);
>  
>  		add_memory_region(base, size, type);
> +
> +		if (type == BOOT_MEM_ROM_DATA) {
> +			prom_mem_base[nr_prom_mem] = base;
> +			prom_mem_size[nr_prom_mem] = size;
> +			nr_prom_mem++;

Are you sure, that five prom-mem regions is enough? What about adding
a sanity check here so no to exceed the array size?

-Sergey

> +		}
>  	}
>  }
>  
> @@ -150,12 +162,8 @@ void __init prom_free_prom_memory(void)
>  	if (prom_flags & PROM_FLAG_DONT_FREE_TEMP)
>  		return;
>  
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
> -			continue;
> -
> -		addr = boot_mem_map.map[i].addr;
> +	for (i = 0; i < nr_prom_mem; i++) {
>  		free_init_pages("prom memory",
> -				addr, addr + boot_mem_map.map[i].size);
> +			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
>  	}
>  }
> -- 
> 2.22.0
> 
