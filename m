Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9393EDD82
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 21:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhHPTDw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 15:03:52 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:54968 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhHPTDw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 15:03:52 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1629140599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jm4ceJ7krhdNsFupcSzjiekWEH7ry33gj4LVLuhuGNE=;
        b=FMWLa6LlSUng1zMVljEN3theJEDQVmbX/U5UmObZEXtbo5jZv0AlSC6/fbcpuNStquSEXf
        ykSqH0hBzPhfUrmEWKMfeCtnynP/5tGtAgc+MjhpqlESFp1I9LWd1O+zcZrGSCOfd6nJm6
        ta0VBF7di0n1lzXOnuUFlUCg5BNILWQq5VKc4/4WmJhcxru4ppNHZ6kDQks4quL+/P/DwK
        TogWCQJJ7ZTF53LWnQWSmvHBLOaTRLQdwCB2mYHlLQh5crqCcYjYonh91PGAhUCtO7dVk7
        g4cNcwM1pxhUAPUiprrja+3gf5/wfg1FC5rNppcQxBLHlvnzpHX8TvGZS065cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1629140599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jm4ceJ7krhdNsFupcSzjiekWEH7ry33gj4LVLuhuGNE=;
        b=1vHCDsnCOxd3k6zjwTwPbyzR74BAc3qYvTmPBGiZiH6F2hDN+HW8GKqyPGWxA8x7HwD1uS
        wTAD07ap94SvwfCQ==
To:     Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
In-Reply-To: <20210816182750.26i535ilc6nef5k6@offworld>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld>
Date:   Mon, 16 Aug 2021 21:03:18 +0200
Message-ID: <874kbpp5zd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 16 2021 at 11:27, Davidlohr Bueso wrote:
> On Mon, 16 Aug 2021, Huacai Chen wrote:
>
>>fault_in_user_writeable() should verify R/W access but only verify W. In
>>most archs W implies R, but not true in MIPS and LoongArch, so fix it.
>
> Yuck for a find_vma() in futex.c. If this is a problem in MIPS, shouldn't
> the fix be there? Furthermore it's stated that fault_in_user_writeable():
>
> "Fault in user address and verify RW access"

That seems to be wishful thinking given the fact that some architectures
do not imply R for FLAG_FAULT_WRITE.

> And you guys seem to have proposed it already:
>
> https://lore.kernel.org/linux-mips/20200630005845.1239974-1-liulichao@loongson.cn/

That's surely one way to fix that. If that does not work for whatever
reason, then we really don't want this find_vma() hack there, but rather
something like:

    if (IS_ENABLED(CONFIG_ARCH_USER_FAULT_VOODOO) && get_user(&tmp, uaddr))
	return -EFAULT;

Thanks,

        tglx
