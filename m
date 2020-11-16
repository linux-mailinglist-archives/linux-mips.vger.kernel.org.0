Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDA32B5024
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 19:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgKPStO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 13:49:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:47664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbgKPStO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 13:49:14 -0500
Received: from kernel.org (unknown [77.125.7.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE6DA22240;
        Mon, 16 Nov 2020 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605552553;
        bh=iNJNHE5ukcjcWsuO4wvyGow2ixW26b+vBGI+KIy1EN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gnvEw5bbAStO3Mm7CUrh983t0TiGoRArX2B7fNYRkVt/67vGt0tkPEQ0KcD+csnMY
         1hhhjhJu4RiY1EU5JMYlremgdHV1J2JEf9NHOvf3l1xWjOOCfyy2XGqyw5Glp5pm89
         YSbi4Eip1VKgacQDcXTUjxzmL1IWqot4z2XFwdxs=
Date:   Mon, 16 Nov 2020 20:49:05 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix for_each_memblock conversion
Message-ID: <20201116184905.GA370813@kernel.org>
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
> 
> Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks, Thomas!

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

-- 
Sincerely yours,
Mike.
