Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D873EEC68
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 14:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237214AbhHQM1s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 08:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbhHQM1r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 08:27:47 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67035C061764;
        Tue, 17 Aug 2021 05:27:14 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id z1so3252085ioh.7;
        Tue, 17 Aug 2021 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5GEOxhJC+X6hk3uJOQSth+y052VdXubyLMOywle/R4=;
        b=BMtr3fTuMzn8aLeOLWhz49DE/VSAu8ytkw8qR4lp3JTE7VnxSL5X/LNrmZGcOX5IHl
         CPS+/VRUhJIoFSPMEmL1c5JZB+xn7oaEFIqbYqy5811SXYSCQggqhTahO4LuB5Sf86um
         rmXIWB1Q2F++tkBsNHEoYTnCR/3AE81rXwBGFFCw9uyr3a3wwGPxvRT4lMCcRa0HwIcl
         7DFoLo7siaF9rV34bLfM+IJqv4sC+jmcIOmP1YESnxtbxxTZ3/7azdYCfhtvPEdkFFHO
         +kuz28zTb95oQKZL7DVx60Wsqt5ht8dQyr0sneXVw1tz3tEuj6HqI5dTYL3Zn5oFd0cu
         PDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5GEOxhJC+X6hk3uJOQSth+y052VdXubyLMOywle/R4=;
        b=SmUXbSApqLFw/T3ebKpd91z0he+0nzdBop2w+NZUU2XznA/0FEVcHeA/mQxHKIlE6E
         61evZkMllz6cwOZaTLU4FP9FEv40hHQ4uVGauIwI+aReWuSw5iuEipmHkUGCg6Xa73td
         SAaTUyRWboean/FEvAG8O8I/RD/sTaDZPwFOzM6pYW3r5/1L5a9QIAwgsvgOyI8ufKfC
         54Wxjbomy16XDN1vx5vS1oUpQwPtXVjChWQbaM7bw/ZLeS6iGEqkMSncBsqxa6CjOypa
         Iy4SBn6d6T9HdXenvLKtMzrBRUJPA/w6sBLYNQ8WWhA9ST6KFh74HAoqI93UN5KJglgF
         CeRw==
X-Gm-Message-State: AOAM53006+GDl30KnahEqlQk0T81a7JdoNUbSOMyVbDLQBlBBg9eBnWY
        FM9hPpCYnoOXHlAOfCzICy8QdFbteK408gOxon14Bl3129Uk2A==
X-Google-Smtp-Source: ABdhPJw52mErSSl8TCt+pFsR8tz7Fd74wx0m939I8a2YkDqPMvQJxAAGpnD2aRRcI25P11fwbtaAuiWdrdmveHm/Pxs=
X-Received: by 2002:a05:6602:48c:: with SMTP id y12mr2723179iov.14.1629203233860;
 Tue, 17 Aug 2021 05:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld> <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com>
 <871r6spn0r.ffs@tglx> <CAAhV-H6=MbBFwgxT75Bqr5SY0e5E6gtpCUCZhrVgFE_h1A0q2A@mail.gmail.com>
 <87y290o304.ffs@tglx> <YRuFMbUi7ZN315dY@hirez.programming.kicks-ass.net>
In-Reply-To: <YRuFMbUi7ZN315dY@hirez.programming.kicks-ass.net>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 17 Aug 2021 20:27:03 +0800
Message-ID: <CAAhV-H4GVWw0eNYRWmGY66A6FVKcexAGr-Wh_=9VgxxEkpiKJA@mail.gmail.com>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, all,

On Tue, Aug 17, 2021 at 5:45 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Aug 17, 2021 at 11:05:15AM +0200, Thomas Gleixner wrote:
> > Huacai,
> >
> > On Tue, Aug 17 2021 at 15:38, Huacai Chen wrote:
> > > On Tue, Aug 17, 2021 at 3:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > > On X86, it returns 0; on MIPS64 without patch, it hangs in kernel; on
> > > MIPS64 with this patch, it returns -1.
> >
> > As expected.
> >
> > > Then, I want to know, on "W implies R" archs (such as X86), should it
> > > return 0? Maybe return -1 is more reasonable? (because the VMA is
> > > marked as write-only). If this program should return -1, then I don't
> > > think this is a MIPS-specific problem.
> >
> > No. mmap(.., PROT_WRITE...) is simply impossible on x86 and implies
> > PROT_READ as documented in mmap(2).
> >
> > So why should this fail and only fail in the fault case, but succeed
> > when the PTE is already established?
>
> I wouldn't actually mind if it failed on fault -- it's the 'best' we can
> do on x86. Doing a RmW op on PROT_WRITE is silly and deserves all the
> wreckage it can get.
If we must fix it in arch code, there are two methods: 1, don't use
write-only map (modify protection_map as Liu Lichao did); 2, override
arch_vma_access_permitted() to do extra checks. Thomas, which is
better?

Huacai
