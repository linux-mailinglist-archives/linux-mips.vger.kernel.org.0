Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FED3EEA31
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 11:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235932AbhHQJqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 05:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235191AbhHQJqH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 05:46:07 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6137AC061764;
        Tue, 17 Aug 2021 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5nTl35tFRQWWA7I+OxmsbaQejCye/PNpoTAyMYkz5oY=; b=JKenSHpXxKrNf6IylwpLZBo3sB
        sKTMs77t7ccwt34xGZ/MJQO7E5sGJyba+KAX4+wAlRvK9r/KX02wMczSXjszvrDCQh716zc73iLbv
        IhkFHhXRKQZG90MBMZxLdjVn0D9oU+ee8OoTulbCnGlSbXApVbtKTinRsiSFkA4PIAX6SZllS3kT9
        I8kMOjfzR7gqWqTCw3WWw+nXp1aFGJaKeSOqwbXqFYZFV0ADYeEngjqChntAisXECbpz2BhEANtR0
        0H/lV/7uM4AYyg8AXQsqDnPUN0DLdCkI0Kf9imiJ/7GDvCmAnSOWg+xCBcVChmdlVsjkZAWZNEhdZ
        reBnW7PA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mFves-00AQrh-VX; Tue, 17 Aug 2021 09:45:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 146883004B2;
        Tue, 17 Aug 2021 11:45:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id F21622BEFFA58; Tue, 17 Aug 2021 11:45:21 +0200 (CEST)
Date:   Tue, 17 Aug 2021 11:45:21 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
Message-ID: <YRuFMbUi7ZN315dY@hirez.programming.kicks-ass.net>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld>
 <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
 <871r6spn0r.ffs@tglx>
 <CAAhV-H6=MbBFwgxT75Bqr5SY0e5E6gtpCUCZhrVgFE_h1A0q2A@mail.gmail.com>
 <87y290o304.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y290o304.ffs@tglx>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 17, 2021 at 11:05:15AM +0200, Thomas Gleixner wrote:
> Huacai,
> 
> On Tue, Aug 17 2021 at 15:38, Huacai Chen wrote:
> > On Tue, Aug 17, 2021 at 3:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > On X86, it returns 0; on MIPS64 without patch, it hangs in kernel; on
> > MIPS64 with this patch, it returns -1.
> 
> As expected.
> 
> > Then, I want to know, on "W implies R" archs (such as X86), should it
> > return 0? Maybe return -1 is more reasonable? (because the VMA is
> > marked as write-only). If this program should return -1, then I don't
> > think this is a MIPS-specific problem.
> 
> No. mmap(.., PROT_WRITE...) is simply impossible on x86 and implies
> PROT_READ as documented in mmap(2).
> 
> So why should this fail and only fail in the fault case, but succeed
> when the PTE is already established?

I wouldn't actually mind if it failed on fault -- it's the 'best' we can
do on x86. Doing a RmW op on PROT_WRITE is silly and deserves all the
wreckage it can get.
