Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158D323D4FB
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 03:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHFBPO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 5 Aug 2020 21:15:14 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37244 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgHFBPM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Aug 2020 21:15:12 -0400
Received: by mail-io1-f65.google.com with SMTP id w12so34311106iom.4
        for <linux-mips@vger.kernel.org>; Wed, 05 Aug 2020 18:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7qLFgRtzX/dzlut0sVD+jjd/8NYIgwDgdIVR8V7X2CA=;
        b=ClVAbmY+Dnx7T0APvUDtOlSpEn+pBV7zfYvFi3RVDl++Sf7VwT3JDpz7g2U2kidrxO
         bBZJfNW94pfrjgJ1ixJsbUHH3p0xmy3nEb8YmdZxYTTq3O1rx9wY8vbE4QEdkKCmHCkj
         2psPMax8K1aSPW8tNzw9Zr3FOWhCDLFyQd8WtMFP47tMoY6c5cMcWVynHHm04kTxOpC3
         5QeAGqUGUniNEhKAvhFa48POZhl2OYL9QHS1HUyAlN9MsW9XZJY3x1ZvVBA2IkTJEQln
         p9FmDTbmGWqeGK6I0TnJEGlQcySXe4mN76t0e+ryXMuBiUDSQzo7kSpuZ0J+HU9n/T8J
         18tA==
X-Gm-Message-State: AOAM533RoTbJBbLKTQkpDgA72Wn0dr8mzYkA5exmAqXFzar4oem7F6jn
        xJg61gJXLkwv4GtvfGHcyqj+yKUSLwfdh4IeXkI=
X-Google-Smtp-Source: ABdhPJxpEGvROfve9cwf6XQmHjOeUMMuzz9cX80bprPy1FAhXQgF4EYjRyMjXS1M+0b1Al9wvV84dSNolYvLabTfJ+E=
X-Received: by 2002:a6b:b345:: with SMTP id c66mr6696201iof.42.1596676511795;
 Wed, 05 Aug 2020 18:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com> <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de> <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
In-Reply-To: <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 6 Aug 2020 09:15:00 +0800
Message-ID: <CAAhV-H7Yu_wdt0O0rBGi4EAnWqMG4n-6yiivB2mdJD92yvER0w@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun

On Thu, Aug 6, 2020 at 1:39 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 在 2020/8/5 20:10, Thomas Bogendoerfer 写道:
> > On Sat, Aug 01, 2020 at 03:59:41PM +0800, Huacai Chen wrote:
> >> On Wed, May 6, 2020 at 1:30 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >>>
> >>>
> >>> 于 2020年5月2日 GMT+08:00 下午12:55:43, Huacai Chen <chenhc@lemote.com> 写到:
> >>>> Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
> >>>> mode by default. However, gslq/gssq (16-bytes load/store instructions)
> >>>> overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
> >>>> gssq for optimization in kernel, we should enable COP2 usage in kernel.
> >>>>
> >>>> Please pay attention that in this patch we only enable COP2 in kernel,
> >>>> which means it will lose ST0_CU2 when a process go to user space (try
> >>>> to use COP2 in user space will trigger an exception and then grab COP2,
> >>>> which is similar to FPU). And as a result, we need to modify the context
> >>>> switching code because the new scheduled process doesn't contain ST0_CU2
> >>>> in its THERAD_STATUS probably.
> >>>>
> >>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>>
> >> Does this patch have some unresolved problems, or there is something unclear?
> > yes there is. Since this COP2 is a total black box to me, it would be
> > really helpfull to get some docs for it or at least some information what
> > it exactly does and how you want to use it in kernel code.
>
> FYI:
> Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 opcode
> to define some load & store instructions (e.g. 128bit load to two GPRs).
>
> I have a collection of these instructions here[1].
>
>  From GS464E (3A2000+), execuating these instruction won't produce COP2
> unusable
> exception. But older Loongson cores (GS464) will still produce COP2
> exception, thus
> we should have CU2 enabled in kernel. That would allow us use to these
> instructions
> to optimize kernel.
>
> >
> > Looking closer at the patch I realized, that there is already support
> > for usage of COP2 in user land, which I thought isn't the case (at least
> > I understood that from one of your mails). So is there enough state
> > saving to support this ?
>
> Actually there is no CU2 state for Loongson to save.
>
> >
> > And finally what I stil don't like is the splittering of more
> > #ifdef LOONGSON into common code. I'd prefer a more generic way
> > to enable COPx for in kernel usage. Maybe a more generic config option
> > or a dynamic solution like the one for user land.
> Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.
>
So make those codes depend on CONFIG_CPU_LOONGSON3_WORKAROUNDS instead
of CONFIG_CPU_LOONGSON64?

Huacai

> Thanks.
>
> - Jiaxun
>
> [1]: https://github.com/FlyGoat/loongson-insn/
> >
> > Thomas.
> >
