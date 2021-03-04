Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3FE32CA1B
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhCDBlt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 20:41:49 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37380 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhCDBlg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 20:41:36 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 72ACF92009C; Thu,  4 Mar 2021 02:40:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6DCAD92009B;
        Thu,  4 Mar 2021 02:40:54 +0100 (CET)
Date:   Thu, 4 Mar 2021 02:40:54 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huang Pei <huangpei@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH] MIPS: clean up CONFIG_MIPS_PGD_C0_CONTEXT handling
In-Reply-To: <20210304010623.4tyzpzgllsdy3ssg@ambrosehua-HP-xw6600-Workstation>
Message-ID: <alpine.DEB.2.21.2103040227500.19637@angie.orcam.me.uk>
References: <20210227061944.266415-1-huangpei@loongson.cn> <20210227061944.266415-2-huangpei@loongson.cn> <alpine.DEB.2.21.2102282346400.44210@angie.orcam.me.uk> <20210304010623.4tyzpzgllsdy3ssg@ambrosehua-HP-xw6600-Workstation>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 4 Mar 2021, Huang Pei wrote:

> > > @@ -1164,8 +1165,8 @@ build_fast_tlb_refill_handler (u32 **p, struct uasm_label **l,
> > >  
> > >  	if (pgd_reg == -1) {
> > >  		vmalloc_branch_delay_filled = 1;
> > > -		/* 1 0	1 0 1  << 6  xkphys cached */
> > > -		uasm_i_ori(p, ptr, ptr, 0x540);
> > > +		/* insert bit[63:59] of CAC_BASE into bit[11:6] of ptr */
> > > +		uasm_i_ori(p, ptr, ptr, (CAC_BASE >> 53));
> > 
> >  Instead I'd paper the issue over by casting the constant to `s64'.
> > 
> >  Or better yet fixed it properly by defining CAC_BASE, etc. as `unsigned
> > long long' long rather than `unsigned long' to stop all this nonsense 
> > (e.g. PHYS_TO_XKPHYS already casts the result to `s64').  Thomas, WDYT?
> Sorry, I do not get it , on MIPS32, how can CAC_BASE be unsigned long
> long ?

 By using the `ULL' suffix with constants.  It won't change code produced, 
because they are unsigned anyway and the compiler will truncate them with 
no change to the actual value to fit in narrower data types as needed, but 
it will silence the warnings.

  Maciej
