Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1445B3EC204
	for <lists+linux-mips@lfdr.de>; Sat, 14 Aug 2021 12:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbhHNKar (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Aug 2021 06:30:47 -0400
Received: from elvis.franken.de ([193.175.24.41]:60421 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237454AbhHNKar (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 14 Aug 2021 06:30:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mEqvf-0000g0-00; Sat, 14 Aug 2021 12:30:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D6FA9C07E5; Sat, 14 Aug 2021 12:30:01 +0200 (CEST)
Date:   Sat, 14 Aug 2021 12:30:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, linux-rt-users@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH] MIPS: simplify copy_user_high_page for MIPS64 w/o cache
 alias
Message-ID: <20210814103001.GA5735@alpha.franken.de>
References: <20210807080429.3323711-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807080429.3323711-1-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 07, 2021 at 04:04:29PM +0800, Huang Pei wrote:
> Borrow from ARM64
> 
> MIPS64 CPU has enough direct mapped memory space to access all
> physical memory. In case of no cache alias, bypass both k*map_atomic
> and k*map_coherent for better real-time performance.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/mm/init.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 19347dc6bbf8..1f5bdd18ae7c 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -171,22 +171,35 @@ void copy_user_highpage(struct page *to, struct page *from,
>  {
>  	void *vfrom, *vto;
>  
> -	vto = kmap_atomic(to);
> -	if (cpu_has_dc_aliases &&
> -	    page_mapcount(from) && !Page_dcache_dirty(from)) {
> -		vfrom = kmap_coherent(from, vaddr);
> +	if (IS_ENABLED(CONFIG_64BIT) && !cpu_has_dc_aliases) {
> +		vfrom = page_address(from);
> +		vto   = page_address(to);
>  		copy_page(vto, vfrom);
> -		kunmap_coherent();
> +		/*
> +		 * even without cache alias, still need to maintain
> +		 * coherence between icache and dcache
> +		 */
> +		if (!cpu_has_ic_fills_f_dc)
> +			flush_data_cache_page((unsigned long)vto);
> +
>  	} else {
> -		vfrom = kmap_atomic(from);
> -		copy_page(vto, vfrom);
> -		kunmap_atomic(vfrom);
> +		vto = kmap_atomic(to);
> +		if (cpu_has_dc_aliases &&
> +				page_mapcount(from) && !Page_dcache_dirty(from)) {

please fix indentation and place page_mapping() to same column as
cpu_has_dc_aliases()

> +			vfrom = kmap_coherent(from, vaddr);
> +			copy_page(vto, vfrom);
> +			kunmap_coherent();
> +		} else {
> +			vfrom = kmap_atomic(from);
> +			copy_page(vto, vfrom);
> +			kunmap_atomic(vfrom);
> +		}
> +		if ((!cpu_has_ic_fills_f_dc) ||
> +				pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))

same here

> +			flush_data_cache_page((unsigned long)vto);
> +		kunmap_atomic(vto);
> +		/* Make sure this page is cleared on other CPU's too before using it */

this comment should stay in front of the smp_wmb()

>  	}
> -	if ((!cpu_has_ic_fills_f_dc) ||
> -	    pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))
> -		flush_data_cache_page((unsigned long)vto);
> -	kunmap_atomic(vto);
> -	/* Make sure this page is cleared on other CPU's too before using it */
>  	smp_wmb();

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
