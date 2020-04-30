Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602331BF1C0
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 09:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgD3HrP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 03:47:15 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34548 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgD3HrP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 03:47:15 -0400
Received: by mail-io1-f68.google.com with SMTP id f3so486729ioj.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 00:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0n5BuvPzBmCMIBQQQnGCPsazBBMVq0rDPE3TsQRqYg=;
        b=bueckDb3o+TXzHbKlq6ViQumKQM2+2NHMyziQeADt+xLIBokVrbZ0GPA8GAU8pfGWI
         vpbEEV6hPP6Jd84jL8JMSSKxcY7r9r8KEHgRi+mvwQ69YzmH9ma74qtyaQaUSH+WHZSo
         yTpBxvSHJ+54apNfJ9VnYDxuEM0wBjFEd5bxBNlX2YqH8X/qAGt/TOdmP//FXWtoGRAq
         ypF2yOPFszqt8AiaOGz82rhByVTaW03F8WZl5KBLDRperkPHRb4rcx6VeLJxJxUutZht
         zsIUCCBYYPlqSHr/8/luxgrp7OzKJIxT2+Iy+BeUrgldF1ImxO9TGuxOCjSU4Y9Y0pEF
         gQYg==
X-Gm-Message-State: AGi0PuZQX0J/JgmPCj4Zn0bEnHaNYE6MewRENLgbm5lzYXEsYwkRk6NL
        X7KDMPdnTvt+brnuG7zA+MsDOO1tae/9mvUiTIkEKK+RJl8=
X-Google-Smtp-Source: APiQypK7nXvh/tjLI/zqplfzbAzJQf3xuCNpzx5bR1jnDGMZ2peQgsQ+KRzAbHOW94TfWY2vGDv8vySU8FcAPydPm1E=
X-Received: by 2002:a02:966a:: with SMTP id c97mr623393jai.106.1588232832779;
 Thu, 30 Apr 2020 00:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <1588153121-28507-1-git-send-email-chenhc@lemote.com> <20200429183305.GB21234@alpha.franken.de>
In-Reply-To: <20200429183305.GB21234@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 30 Apr 2020 15:54:44 +0800
Message-ID: <CAAhV-H6KWnzwB-p6aOL+L_ZXiYsMyzN1MbXeeeTYpimg7jG73w@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,


On Thu, Apr 30, 2020 at 2:33 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 29, 2020 at 05:38:40PM +0800, Huacai Chen wrote:
> > From: chenj <chenj@lemote.com>
> >
> > Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
> > mode by default. However, gslq/gssq (16-bytes load/store instructions)
> > overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
> > gssq for optimization in kernel, we should enable COP2 usage in kernel.
>
> What aboout context switches ? Or is the copro only used by one kernel
> driver ?
This patch only enable Multi-Media coprocessor (COP2) in the kernel,
which means it will lose ST0_CU2 when a process go back to user space
(user space use COP2 will trigger an exception and then grab COP2,
which is similar to FPU). And as a result, we need to modify
r4k_switch.S because the new process doesn't contain CU2 in
THERAD_STATUS.
>
> > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > index ce40fbf..0f71540 100644
> > --- a/arch/mips/include/asm/mipsregs.h
> > +++ b/arch/mips/include/asm/mipsregs.h
> > @@ -386,6 +386,7 @@
> >  #define ST0_CU1                      0x20000000
> >  #define ST0_CU2                      0x40000000
> >  #define ST0_CU3                      0x80000000
> > +#define ST0_MM                       0x40000000      /* Loongson-3 naming */
>
> please use ST0_CU2, so everybody understands it's COO2
I see that there is already an alias  ST0_XX for ST0_CU3, and I think
use a ST0_MM for ST0_CU2 is more meaningful in some places (at least
in traps.c where ST0_XX is also used). If there are places only used
to describe the CU Mask (such as in stackframe.h), I will use ST0_CU2.

>
> > @@ -450,7 +450,11 @@
> >   */
> >               .macro  CLI
> >               mfc0    t0, CP0_STATUS
> > +#ifdef CONFIG_CPU_LOONGSON64
> > +             li      t1, ST0_CU0 | ST0_MM | STATMASK
> > +#else
> >               li      t1, ST0_CU0 | STATMASK
> > +#endif
>
> you are doing this three time in this file. How about doing
>
> #ifdef CONFIG_CPU_LOONGSON64
> #define ST0_MASK        ST0_CU0 | ST0_CU2
> #else
> #define ST0_MASK        ST0_CU0
> #endif
>
> and use ST0_MASK ?
OK, I will define and use ST0_CUMASK here.

>
> > diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> > index 3b02ffe..cdac82d 100644
> > --- a/arch/mips/kernel/head.S
> > +++ b/arch/mips/kernel/head.S
> > @@ -45,18 +45,34 @@
> >
> >       .macro  setup_c0_status_pri
> >  #ifdef CONFIG_64BIT
> > +#ifdef CONFIG_CPU_LOONGSON64
> > +     setup_c0_status ST0_KX|ST0_MM 0
> > +#else
> >       setup_c0_status ST0_KX 0
> > +#endif
>
> same thing here.
OK, I will define and use ST0_SET here.

>
> > --- a/arch/mips/kernel/r4k_switch.S
> > +++ b/arch/mips/kernel/r4k_switch.S
> > @@ -53,6 +53,9 @@
> >       nor     a3, $0, a3
> >       and     a2, a3
> >       or      a2, t1
> > +#ifdef CONFIG_CPU_LOONGSON64
> > +     or      a2, ST0_MM
> > +#endif
>
> this looks wrong. If THERAD_STATUS is setup correct, you don't need
> to mess with ST0_CU2 here.
See above please, THERAD_STATUS doesn't include ST0_CU2 because it
lose COP2 in user-space.

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
