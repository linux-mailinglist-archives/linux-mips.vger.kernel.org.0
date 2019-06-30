Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71E05B112
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2019 19:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfF3R5I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jun 2019 13:57:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37449 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbfF3R5I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jun 2019 13:57:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id g15so2970233pgi.4
        for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2019 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gnuu4DiqCU91G6SZ+lCF3hdalsnxFMZ0yY9Dk7Kz1QA=;
        b=V18MuBosTg022k/LVYNkzC726h/ARIUohyhekRGZsu6x8knCqgFodcSGuo0RpEK0+q
         ZiYlgVi4U6iJWV1SuDG1JI9qrTx/Ct/YhrH0+kdLXL7XLOI4oChqw8f4/TRtT32faYeB
         Im9UDaDFtYv6eS/aLKeQjBzqYTUpJLAae5UmDHRZRUfFKJFPYpn6pcCLKpnoySLdl73B
         xChmUsxefocq+XY0NhqoBF//eHALjX95RZqNn9IJyR0BU4T2jwfrJM33px24no7NWthR
         qsyp+6RoBGdY5QcXFctRq0q9galGa+RTo24D9UFNI5VlRhD+hhJaTQwaTw/mRGJsVrpy
         kPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gnuu4DiqCU91G6SZ+lCF3hdalsnxFMZ0yY9Dk7Kz1QA=;
        b=eWUZ5dFqGt0l7Ah29Gp2x8zUvSEl2EdpdrtQJPo1GVhhWqlskcQNvbmmagVHZKXTaw
         TqOW8fewnrz3CR4Deo7eALsHnXr7oFWDs1flJ3du7v/vExixKiRBLpXJ0HcxtvdxukCn
         4amoqLqWm4OcnThEGlT/c4xsch9tGGqEK5LTrSYecP8uB+e1wvugzdIavGOwEcKkX49u
         oUTvjB5VEVD3h/jFNvBXmsJEzQLaPPUQCJVu3ERPpOGGgENlQrQNU+mlnkgRDFpRYrPd
         RVI6xHcT+Kwu49Ee1T1xddRsO8/J8Vbm1Ozaq5vKngWBAnyheWadQIcbWQoAy788v1e2
         QiDg==
X-Gm-Message-State: APjAAAX+g/4aShYcgD0GD9r7Lm2UgLKoSOi2XfJdNPQ25ECzc8Zy3mhG
        3HdB7SthJQFmCn0LyeYuJIwI/gQU
X-Google-Smtp-Source: APXvYqzj6+5iNSjYh0RzmaHJwkhvWgSEB7n6qVP8liVj7jGcYNf+WNHxi6y4sXhMbXcqAc8yWHsLNA==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr11653965pgp.72.1561917427786;
        Sun, 30 Jun 2019 10:57:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m5sm7841040pfa.116.2019.06.30.10.57.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 10:57:06 -0700 (PDT)
Subject: Re: [PATCH] MIPS: only select ARCH_HAS_UNCACHED_SEGMENT for
 non-coherent platforms
To:     Christoph Hellwig <hch@lst.de>, paul.burton@mips.com
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20190630164805.12229-1-hch@lst.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c1d2f389-c674-5c85-8c90-be66c20273e3@roeck-us.net>
Date:   Sun, 30 Jun 2019 10:57:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190630164805.12229-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/30/19 9:48 AM, Christoph Hellwig wrote:
> While mips might architecturally have the uncached segment all the time,
> the infrastructure to use it is only need on platforms where DMA is
> at least partially incoherent.  Only select it for those configuration
> to fix a build failure as the arch_dma_prep_coherent symbol is also only
> provided for non-coherent platforms.
> 
> Fixes: 2e96e04d25 ("MIPS: use the generic uncached segment support in dma-direct")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

This patch fixes

kernel/dma/direct.c:144: undefined reference to `arch_dma_prep_coherent'

Tested-by: Guenter Roeck <linux@roeck-us.net>

Mips images still don't boot in -next after this patch is applied, so
"Tested-by:" only means that affected configurations now build without
link error, not that they actually work.

Guenter

>   arch/mips/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 61a390c2f2c1..caf480275a31 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -8,7 +8,6 @@ config MIPS
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
> -	select ARCH_HAS_UNCACHED_SEGMENT
>   	select ARCH_SUPPORTS_UPROBES
>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> @@ -1120,6 +1119,7 @@ config DMA_NONCOHERENT
>   	bool
>   	select ARCH_HAS_DMA_MMAP_PGPROT
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_UNCACHED_SEGMENT
>   	select NEED_DMA_MAP_STATE
>   	select ARCH_HAS_DMA_COHERENT_TO_PFN
>   	select DMA_NONCOHERENT_CACHE_SYNC
> 

