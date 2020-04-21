Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA841B22E3
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 11:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDUJfh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 05:35:37 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59174 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgDUJfg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Apr 2020 05:35:36 -0400
Received: from flygoat-x1e (unknown [IPv6:240e:390:49b:be80::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 39CFA20CD4;
        Tue, 21 Apr 2020 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587461736; bh=SunN0yp4ZrEQa6v2RmilOpKDVg1C0zEfHQyzzIU14rk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pN+fuGxUC6T5VsMYLJDJBMXAE4pcc4TP0CjBJ2bn2Ki88GX52hnp/UJcNAS3wXiRo
         9jfN6v/y2ZuJHxiI3PZPsbQn8oULibbLyt6xVKOCszDOw+YAdW1QiR6iXuf+Xl7DPv
         zmdkafKG0vrf58lQHRl3XPJeAXiLZUDk8VO6xu1aPEzsQ/po2wpgje87bt3ET5HttT
         rBDtMVMjstGSXRoUzNvMy20py6vSu+HM3AvzO8rcGslbaLs7qigKYXrxF84NKch8Tz
         5mGTf5YYmLJuKfq7wQX4UCuxS5SR9KggwjK8x0suNC7U4hIYNrfDFphTydFfrM3syF
         /Im6eyY9Tq+Kg==
Date:   Tue, 21 Apr 2020 17:35:25 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH 3/3] MIPS: Reduce possibility of kernel panic under
 CONFIG_SWIOTLB
Message-ID: <20200421173525.460949b0@flygoat-x1e>
In-Reply-To: <1587459869-12183-4-git-send-email-yangtiezhu@loongson.cn>
References: <1587459869-12183-1-git-send-email-yangtiezhu@loongson.cn>
        <1587459869-12183-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 21 Apr 2020 17:04:29 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> In the current code, if CONFIG_SWIOTLB is set, when failed to get IO
> TLB memory from the low pages by plat_swiotlb_setup(), it may lead to
> the boot process failed with kernel panic.

Hi Tiezhu,

Thanks for you patch.

Firstly, your commit message should be more straight forward. Please
describe what you have changed (e.g. MIPS: Set memblock bottom up)
instead of what you solved.

> 
> (1) On the Loongson and SiByte platform
> arch/mips/loongson64/dma.c
> arch/mips/sibyte/common/dma.c
> void __init plat_swiotlb_setup(void)
> {
> 	swiotlb_init(1);
> }
> 

> kernel/dma/swiotlb.c
> void  __init
> swiotlb_init(int verbose)
> {
> ...
> 	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs,
> verbose)) return;
> ...
> 	pr_warn("Cannot allocate buffer");
> 	no_iotlb_memory = true;
> }
> 
> phys_addr_t swiotlb_tbl_map_single()
> {
> ...
> 	if (no_iotlb_memory)
> 		panic("Can not allocate SWIOTLB buffer earlier ...");
> ...
> }
> 
> (2) On the Cavium OCTEON platform
> arch/mips/cavium-octeon/dma-octeon.c
> void __init plat_swiotlb_setup(void)
> {
> ...
> 	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
> 	if (!octeon_swiotlb)
> 		panic("%s: Failed to allocate %zu bytes align=%lx\n",
> 		      __func__, swiotlbsize, PAGE_SIZE);
> ...
> }
> 
> Because IO_TLB_DEFAULT_SIZE is 64M, if the rest size of low memory is
> less than 64M when call plat_swiotlb_setup(), we can easily reproduce
> the panic case.
> 
> In order to reduce the possibility of kernel panic when failed to get
> IO TLB memory under CONFIG_SWIOTLB, it is better to allocate low
> memory as small as possible before plat_swiotlb_setup(), so make
> sparse_init() using top-down allocation.

AFAIK there are some reasons that we set it to bottom_up.
On some platforms, bootloader won't place cmdline & devicetree into
reserved memory but place them just after kernel in memory. That means
if you set it as bottom up, then early allocate memory might collide
with these boot arguments.

I'm not even sure if it works fine on Loongson with early PMON.

I had met that issue before, the solution for me is to reduce SWIOTLB
size.

> 
> Reported-by: Juxin Gao <gaojuxin@loongson.cn>
> Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/setup.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 5481a0c..8db533c 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -700,7 +700,17 @@ static void __init arch_mem_init(char
> **cmdline_p) memblock_reserve(crashk_res.start,
> resource_size(&crashk_res)); #endif
>  	device_tree_init();
> +
> +	/*
> +	 * In order to reduce the possibility of kernel panic when
> failed to
> +	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to
> allocate
> +	 * low memory as small as possible before
> plat_swiotlb_setup(), so
> +	 * make sparse_init() using top-down allocation.
> +	 */
> +	memblock_set_bottom_up(false);
>  	sparse_init();
> +	memblock_set_bottom_up(true);
> +
>  	plat_swiotlb_setup();
>  
>  	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));

--
Jiaxun Yang

