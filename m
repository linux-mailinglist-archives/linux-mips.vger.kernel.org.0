Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6462B51EF
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 21:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgKPUF6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 15:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgKPUF6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 15:05:58 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289A8C0613CF;
        Mon, 16 Nov 2020 12:05:58 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v20so21543781ljk.8;
        Mon, 16 Nov 2020 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m3nMIhNRXgO5bwwxeyEN4IqkhzHBnCRYw/9WNSQD2fw=;
        b=jaE158xOsF7jG0Jv2IGQU4EGzdWSlYXHYmazY+tiT1TewsEqN+AoWKT7d7hAVhEjlB
         y6EXT45KmFIDGN+9WZS6/WmajziAMUCRrir/jOjFrhIEvlZeenREZWMxOi2gBRzZAAL5
         GsLIl+tA/LrT0hQupKF+cEz3l07fn2ifzgK7PccsG7wXFSf/d8Y39BgUebWKt+I0NgA9
         HeEwJBiJK8DFPv16T1t1I3nP7pOCxORYJy52zs2k4QWjpbIxALQlXVY+a8xlXFyaA8jJ
         DyF+ADf0FNhuaJTgZwlefzmgGmbMtCsJkZG2N0jpmz8DtFJTQ/JZtq8hDMrxFrhzvBFK
         I55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m3nMIhNRXgO5bwwxeyEN4IqkhzHBnCRYw/9WNSQD2fw=;
        b=rNnaaMv4g9EHJnfRZhECcfHWLryMLko2Ws+/kHX14X4zeN473B4PgR++Si6hUTOJ2V
         KNaoht2JjlmHhdSg8c2+8dGp5g2W+TlOfAK0XRjU4FhL3UqgLVyUH1nYSy7uWQbcTy2f
         MLhiTlR5MfsWgBYu7924rIsyQ38QvvbumQdSdvjblm771xEuDKJfNRnC97PwNxt9qDvs
         P77mntQRj3tHjB1gBcZ99BuSpybCqEMBBMSee5knXyevj/wl5u4acbKjNXgfo6MmTjkS
         U9T1tdAK1u1trkSgQ6o5OsV/aPqhXE5lxP3gFYPbcnGRasmNgiGIbuhl5zaOPC+aXVMB
         guhA==
X-Gm-Message-State: AOAM531QMFKyeSOhem7n4dveWLwwcQAr2NC8v6BizjRvqH8ojaw0A6kZ
        JAxT9etNFoamuwfi30dKtCkpK2XbvJ9Sng==
X-Google-Smtp-Source: ABdhPJzrzJ4D3pAb2xt7KRXuoMWpnZ7HqCEFjaG6o0Gqq+2WrabhfwVtQ/XEnukKUgUc88g4wuid/Q==
X-Received: by 2002:a2e:854a:: with SMTP id u10mr410733ljj.443.1605557156697;
        Mon, 16 Nov 2020 12:05:56 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id d18sm2834560ljo.115.2020.11.16.12.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:05:56 -0800 (PST)
Date:   Mon, 16 Nov 2020 23:05:54 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201116200554.rhbyvfmdzmchwwbs@mobilestation>
References: <20201116174516.144243-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116174516.144243-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 16, 2020 at 06:45:15PM +0100, Thomas Bogendoerfer wrote:
> The loop over all memblocks works with PFN numbers and not physical
> addresses, so we need for_each_mem_pfn_range().

Great catch! Don't know how that has been working so far. Anyway
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/setup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 0d4253208bde..ca579deef939 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -262,8 +262,8 @@ static void __init bootmem_init(void)
>  static void __init bootmem_init(void)
>  {
>  	phys_addr_t ramstart, ramend;
> -	phys_addr_t start, end;
> -	u64 i;
> +	unsigned long start, end;
> +	int i;
>  
>  	ramstart = memblock_start_of_DRAM();
>  	ramend = memblock_end_of_DRAM();
> @@ -300,7 +300,7 @@ static void __init bootmem_init(void)
>  
>  	min_low_pfn = ARCH_PFN_OFFSET;
>  	max_pfn = PFN_DOWN(ramend);
> -	for_each_mem_range(i, &start, &end) {
> +	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, NULL) {
>  		/*
>  		 * Skip highmem here so we get an accurate max_low_pfn if low
>  		 * memory stops short of high memory.
> -- 
> 2.16.4
> 
