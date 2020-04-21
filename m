Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB741B2425
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 12:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUKp3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 06:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgDUKp3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Apr 2020 06:45:29 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3545C061A0F;
        Tue, 21 Apr 2020 03:45:14 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:390:49b:be80::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id AC459204A5;
        Tue, 21 Apr 2020 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587465913; bh=DnSjaOgoALX2m+iSeVkiSgAR/vBfkUhTJ1AIukm8RPU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P/FBQyCSpMosEP2ImcpLDQ+rg7+sVgJoUZq86JSCUbnsGa/GfcRcXknXKfr1nD+/U
         cADK2Led8HtfksaLuX07yKUj/byaAuV7MR8LgX0hInLB9vPJbaR5Lox/o1mX55LHLM
         E+FoI9zWIcYAn2nCu5ffwlPPcvf17sl3o8UXe7JcMBEG1x0mjMRsjwdgwK+mchXVKW
         2oeGsJd6xtlHsH1fJhGoAS32EAzmOBGMXi6uvcM1cuTFjFFrRTl8VcAxz6nd7grIyz
         gVVo63K3XD6bJm0xzzn3Xhih1H/3B41JKdN4hXPPmMEwbD4B1Gs0cloD2lbsep/Uiu
         536IuqO8Fay1Q==
Date:   Tue, 21 Apr 2020 18:45:00 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH 3/3] MIPS: Reduce possibility of kernel panic under
 CONFIG_SWIOTLB
Message-ID: <20200421184500.368b7e2a@flygoat-x1e>
In-Reply-To: <20200421173525.460949b0@flygoat-x1e>
References: <1587459869-12183-1-git-send-email-yangtiezhu@loongson.cn>
        <1587459869-12183-4-git-send-email-yangtiezhu@loongson.cn>
        <20200421173525.460949b0@flygoat-x1e>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 21 Apr 2020 17:35:25 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> On Tue, 21 Apr 2020 17:04:29 +0800
> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> 
[...]
> 
> AFAIK there are some reasons that we set it to bottom_up.
> On some platforms, bootloader won't place cmdline & devicetree into
> reserved memory but place them just after kernel in memory. That means
> if you set it as bottom up, then early allocate memory might collide
> with these boot arguments.

Sorry please ignore it.

I had a wrong impression on memory layout.

It should be fine.

Thanks.

> 
> I'm not even sure if it works fine on Loongson with early PMON.
> 
> I had met that issue before, the solution for me is to reduce SWIOTLB
> size.
> 
> > 
> > Reported-by: Juxin Gao <gaojuxin@loongson.cn>
> > Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
> > Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/mips/kernel/setup.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > index 5481a0c..8db533c 100644
> > --- a/arch/mips/kernel/setup.c
> > +++ b/arch/mips/kernel/setup.c
> > @@ -700,7 +700,17 @@ static void __init arch_mem_init(char
> > **cmdline_p) memblock_reserve(crashk_res.start,
> > resource_size(&crashk_res)); #endif
> >  	device_tree_init();
> > +
> > +	/*
> > +	 * In order to reduce the possibility of kernel panic when
> > failed to
> > +	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to
> > allocate
> > +	 * low memory as small as possible before
> > plat_swiotlb_setup(), so
> > +	 * make sparse_init() using top-down allocation.
> > +	 */
> > +	memblock_set_bottom_up(false);
> >  	sparse_init();
> > +	memblock_set_bottom_up(true);
> > +
> >  	plat_swiotlb_setup();
> >  
> >  	dma_contiguous_reserve(PFN_PHYS(max_low_pfn));  
> 
> --
> Jiaxun Yang
> 

