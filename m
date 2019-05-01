Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFEF810925
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 16:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfEAOc5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 10:32:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46637 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfEAOc5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 May 2019 10:32:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id r7so5054729wrr.13
        for <linux-mips@vger.kernel.org>; Wed, 01 May 2019 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=exumjtlKep+GzaYhrdxluBYCF6Tjfx5bHbXLHEjxyCk=;
        b=tKI7EmXyczNKp0aOfmNEu8SgX2ZY/jXjF+gjOHXcpzQuJG5yKCtkKBbC+xh8YmfTSw
         bGeDfHPcaSQbHLe34SnmHyaQf81SdU85/9Yn81gTmcTZW4BJatV0nH26DZB6GMgKzXWI
         X5/+liDBPkEGDgJwkWAifIqCPCZssTxHhDoTNu18qVqRuE4FaLciJPAP4eqefFWM9Njx
         UzG7X/3LgSYcFXnxleD9yKIjY2NX8e7dkz1FGI/XUlN8PF+xCT/S0s1GhQ2cyna+DmTv
         tRu3ZCiq2aQx1Qc3AJYIRKsgTWHo9yrE203/7/PBdYkiGd4HQpfG4lJBhxwVZAvGp/AE
         B5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=exumjtlKep+GzaYhrdxluBYCF6Tjfx5bHbXLHEjxyCk=;
        b=WY/w7EmdE4ODQZHBDaGs3Lt5/fdv9ZYyW2LzSIOoR3UdQY5bX/690bnqxIVaZv/JWn
         l/H5+aVbiayXeHnfK6cq3fW53i/IagBg7ym8cBYGzCee178EQsvmov1avhCxTxebAavI
         k3Pt4QZfkFYWvcC9pitdD4hVFlNgSZpkh3HCAkSnE4p8tpoq3uCdA85WvmYWEMCd6idf
         cvz0P10vFvThPJIzK+w1cEH3np5bt4CK80UoS2jMiLSQ0IZGzoWgMKCEIMCK8x33wHfs
         peThhVh+Sol6T9/PrPUL9SdMFh3RSNi6WsAube3+qk9tAb0gRO9jy8fSK6ma71h2uGZZ
         TlrQ==
X-Gm-Message-State: APjAAAUTbYv67FzI+uOWdnvUGYJMKuHfBKeYwsQRpcCMONHEN3zD3IYN
        yu4tMGxjfeGgy1b/yoE1+Zk=
X-Google-Smtp-Source: APXvYqxYCE9jhAy/5+ItVZpocI9CCaSwt72HP5vHiM8X7brzBf06mSnHGPhdqE1Vc6rR/KJqrmRAdA==
X-Received: by 2002:adf:f74c:: with SMTP id z12mr7219504wrp.62.1556721175437;
        Wed, 01 May 2019 07:32:55 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id r2sm6370609wmh.31.2019.05.01.07.32.53
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:32:54 -0700 (PDT)
Subject: Re: [PATCH 1/4] MIPS: Use memblock_phys_alloc() for exception vector
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
References: <20190430225216.7164-1-paul.burton@mips.com>
 <20190430225216.7164-2-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c982e1f3-8145-9c73-ae20-0694a7bd5855@amsat.org>
Date:   Wed, 1 May 2019 16:32:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430225216.7164-2-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/1/19 12:53 AM, Paul Burton wrote:
> Allocate the exception vector using memblock_phys_alloc() which gives us
> a physical address, rather than the previous convoluted setup which
> obtained a virtual address using memblock_alloc(), converted it to a
> physical address & then back to a virtual address.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
>  arch/mips/kernel/traps.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 98ca55d62201..00f44b16385e 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2292,9 +2292,8 @@ void __init trap_init(void)
>  		unsigned long size = 0x200 + VECTORSPACING*64;
>  		phys_addr_t ebase_pa;
>  
> -		ebase = (unsigned long)
> -			memblock_alloc(size, 1 << fls(size));
> -		if (!ebase)
> +		ebase_pa = memblock_phys_alloc(size, 1 << fls(size));
> +		if (!ebase_pa)
>  			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
>  			      __func__, size, 1 << fls(size));
>  
> @@ -2309,9 +2308,10 @@ void __init trap_init(void)
>  		 * EVA is special though as it allows segments to be rearranged
>  		 * and to become uncached during cache error handling.
>  		 */
> -		ebase_pa = __pa(ebase);
>  		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
>  			ebase = CKSEG0ADDR(ebase_pa);
> +		else
> +			ebase = (unsigned long)phys_to_virt(ebase_pa);
>  	} else {
>  		ebase = CAC_BASE;
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
