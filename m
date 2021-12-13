Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E74473061
	for <lists+linux-mips@lfdr.de>; Mon, 13 Dec 2021 16:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhLMP0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Dec 2021 10:26:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:44960 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234672AbhLMP0H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Dec 2021 10:26:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mwnDJ-0007NN-00; Mon, 13 Dec 2021 16:26:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E0C1FC0581; Mon, 13 Dec 2021 16:21:50 +0100 (CET)
Date:   Mon, 13 Dec 2021 16:21:50 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: tx39: adjust tx39_flush_cache_page
Message-ID: <20211213152150.GA16371@alpha.franken.de>
References: <20211206061944.21323-1-huangpei@loongson.cn>
 <20211206061944.21323-3-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206061944.21323-3-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 06, 2021 at 02:19:44PM +0800, Huang Pei wrote:
> Indexed cache operation actually use KSEG0/CKSEG0 (AKA physical
> address) to index cache line, so it CAN NOT handle cache alias.
> 
> Remove checking for cpu_has_dc_aliases.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/mm/c-tx39.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
> index 03dfbb40ec73..c2ecdde0371d 100644
> --- a/arch/mips/mm/c-tx39.c
> +++ b/arch/mips/mm/c-tx39.c
> @@ -207,11 +207,12 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
>  	/*
>  	 * Do indexed flush, too much work to get the (possible) TLB refills
>  	 * to work correctly.
> +	 *
>  	 */
> -	if (cpu_has_dc_aliases || exec)
> +	if (exec) {
>  		tx39_blast_dcache_page_indexed(page);
> -	if (exec)
>  		tx39_blast_icache_page_indexed(page);
> +	}
>  }
>  
>  static void local_tx39_flush_data_cache_page(void * addr)

do you have the hardware to test your patch or do you have at least
the manual for the CPU core used ? If both answers are no, please
drop this patch from you patch queue.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
