Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFEE365322
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 09:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhDTHWE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 03:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhDTHV5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 03:21:57 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0CEC06138B
        for <linux-mips@vger.kernel.org>; Tue, 20 Apr 2021 00:21:25 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id w23so40907219ejb.9
        for <linux-mips@vger.kernel.org>; Tue, 20 Apr 2021 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
        b=JDcuGmSnwgEFOWi0Hol09StsvZpHTO8W+O/Gz5MCGTk1hrnPT23hDPfAyBVwJSNZpt
         czBoQS5EsqxfrGVAbix+Te7AGsP7UXhIx8YFBmygfQto+b48SP2efSg7JWmJOpyukexr
         FTsu8EMSbjXVSgncFtnRCeoktgRoY0XVLaFrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
        b=mMZC1CT9xGYb0a0nIhYfcV71JtUSrsWtHhW4LY/Axko+NTqAWUk+pj+VpcftUn+Fiu
         6AjK+6XrtEiivAXkNGPHXFgLQ5qvBTrL7OLS1J3Xn5iamdAdDdo1flc7YqAj0i3bBniH
         Jh4ZfH/3b7klBZaImpZN7gaH+hk8jOVOW1kt9o1tVwOrhFqqBFNNB2O8HHh2wuWImb35
         76Aim7Nc8Q3O9ZCyoz6vjH3h3BHfe3CAykdI7YR/VUi9qjHo6xKT781EixvAENe2Ffmt
         IWIOoHaBtJlaHbHeNFNIJ2vwPe5BHbLyihaQ78RMB7dx8ztfMI25l0uKdaPwqXTUd1/d
         Aujw==
X-Gm-Message-State: AOAM531SS3cH3eVZZnoEmAJGjTMXIevSvF4ccMYWRPetdikJk3CbGIuD
        g9tKdcT9AEkqNgndg6OtCgmKUg==
X-Google-Smtp-Source: ABdhPJwk6gzZ2A5irFuyneT8BrQdebb3nmjVkes+GHHyVGt7Uear5nG59XVGsiWotx3n47m/ELrbzA==
X-Received: by 2002:a17:906:4d10:: with SMTP id r16mr25604487eju.169.1618903284093;
        Tue, 20 Apr 2021 00:21:24 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id p3sm11836507ejd.65.2021.04.20.00.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 00:21:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>, brouer@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        ilias.apalodimas@linaro.org, mcroce@linux.microsoft.com,
        grygorii.strashko@ti.com, arnd@kernel.org, hch@lst.de,
        linux-snps-arc@lists.infradead.org, mhocko@kernel.org,
        mgorman@suse.de
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d0c32751-0a12-1f7f-4f6a-b1f6535a6b6e@rasmusvillemoes.dk>
Date:   Tue, 20 Apr 2021 09:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416230724.2519198-2-willy@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/04/2021 01.07, Matthew Wilcox (Oracle) wrote:
> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.  When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
> 
> Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> This restores the alignment to that of an unsigned long, and also fixes a
> potential problem where (on a big endian platform), the bit used to denote
> PageTail could inadvertently get set, and a racing get_user_pages_fast()
> could dereference a bogus compound_head().
> 
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/mm_types.h |  4 ++--
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..5aacc1c10a45 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>  		};
>  		struct {	/* page_pool used by netstack */
>  			/**
> -			 * @dma_addr: might require a 64-bit value even on
> +			 * @dma_addr: might require a 64-bit value on
>  			 * 32-bit architectures.
>  			 */
> -			dma_addr_t dma_addr;
> +			unsigned long dma_addr[2];

Shouldn't that member get another name (_dma_addr?) to be sure the
buildbots catch every possible (ab)user and get them turned into the new
accessors? Sure, page->dma_addr is now "pointer to unsigned long"
instead of "dma_addr_t", but who knows if there's a
"(long)page->dma_addr" somewhere?

Rasmus
