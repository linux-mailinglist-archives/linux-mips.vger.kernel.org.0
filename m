Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B49F24166F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 08:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgHKGpS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 11 Aug 2020 02:45:18 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44288 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgHKGpS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 02:45:18 -0400
Received: by mail-io1-f67.google.com with SMTP id v6so11525440iow.11
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2020 23:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sFa+cVPDgSsK7ULy2QfzfpHWsd43vvyv2bHj5XtrWvU=;
        b=cTiTsWYVn0Esz1iZl7RY4EVf4TmkpH/0qKgi+0w7YOLxlZ4/ZbOeXPTKDSdm7tBlWo
         hgMmhMFuuLpzKpkNsAf+UgrQ6p+n2qm5KGwlbj1LYhyP6AYKv0S3XY4uDAiT/ibxynFF
         I3tS20QhrtceoFwsxZ08M3cZaXl+pS3jco8mQiw/dgzri/3w0v1QO041NQzOzB84Bw8P
         jmwOzWFs1B6RpL6RFa/kvoh5OLdaisp0NKD7s/LoYMurJsqRC4DBtIXyucLhzP8OfhwJ
         ds/nIaQvN+RR5EYUxd8kTmd3wTXCUnvISb4J6LaIUxy9QKGnQBAdsva38Egno/o1l+p1
         UdGA==
X-Gm-Message-State: AOAM532vuAS7DV1p+MWNmBtMS3eUIQ4a2xGft9qtjUfD/yvZoADFAz7l
        u4Rm14GZbscTzp3gzEoNeHtJwzDkcF3YQ+dmjALT1mWYpEOYSA==
X-Google-Smtp-Source: ABdhPJxajOA5ELn+wS6tzwiObWdhEoeS8eFqQ+nAXJURz63HHKZdQ1spyiCLpw2/ehaNn0PDy1+fPb+1YwEhzO2pd4A=
X-Received: by 2002:a02:730b:: with SMTP id y11mr24839961jab.126.1597128316797;
 Mon, 10 Aug 2020 23:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com> <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de> <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de> <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
 <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com> <20200810141219.GA2844@alpha.franken.de>
 <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
In-Reply-To: <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 11 Aug 2020 14:45:05 +0800
Message-ID: <CAAhV-H7xJXX7V18ZUKw6RdEOtKUF49itrXY0PBNFAcSBbr4idQ@mail.gmail.com>
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

Hi, Thomas and Jiaxun,

On Tue, Aug 11, 2020 at 10:18 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 在 2020/8/10 22:12, Thomas Bogendoerfer 写道:
> > On Sun, Aug 09, 2020 at 10:53:13PM +0800, Jiaxun Yang wrote:
> >> Thus we still need to enable CU2 with exception for user space, and we can
> >> always enable CU2 in
> >> kernel since kernel won't be compiled with hard-float. :-)
> > I see, how about the patch below
> That looks fine for me.
> Is it good with you, Huacai?

There are two problems:
1, zboot (arch/mips/boot/compressed/head.S) should be considered,
because the initial value of Status may or may not contain CU2.
2, r4k_switch.S should set CU2 for the new process, otherwise it
cannot use gslq/gssq while it in kernel (Because the new process
doesn't contain CU2 in
THERAD_STATUS. Though a process sets CU2 when it enters kernel, but it
only sets CU2 in hardware, not in THREAD_STATUS).

Huacai

>
> Thanks.
>
> - Jiaxun
>
> >
> > Thomas.
> >
> >
> > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > index 4ddc12e4444a..f7144116b43b 100644
> > --- a/arch/mips/include/asm/mipsregs.h
> > +++ b/arch/mips/include/asm/mipsregs.h
> > @@ -389,6 +389,13 @@
> >   #define ST0_CU3                     0x80000000
> >   #define ST0_XX                      0x80000000      /* MIPS IV naming */
> >
> > +/* in-kernel enabled CUs */
> > +#ifdef CONFIG_CPU_LOONGSOON64
> > +#define ST0_KERNEL_CUMASK    (ST0_CU0 | ST_CU2)
> > +#else
> > +#define ST0_KERNEL_CUMASK    ST0_CU0
> > +#endif
> > +
> >   /*
> >    * Bitfields and bit numbers in the coprocessor 0 IntCtl register. (MIPSR2)
> >    */
> > diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
> > index 3e8d2aaf96af..aa430a6c68b2 100644
> > --- a/arch/mips/include/asm/stackframe.h
> > +++ b/arch/mips/include/asm/stackframe.h
> > @@ -450,7 +450,7 @@
> >    */
> >               .macro  CLI
> >               mfc0    t0, CP0_STATUS
> > -             li      t1, ST0_CU0 | STATMASK
> > +             li      t1, ST0_KERNEL_CUMASK | STATMASK
> >               or      t0, t1
> >               xori    t0, STATMASK
> >               mtc0    t0, CP0_STATUS
> > @@ -463,7 +463,7 @@
> >    */
> >               .macro  STI
> >               mfc0    t0, CP0_STATUS
> > -             li      t1, ST0_CU0 | STATMASK
> > +             li      t1, ST0_KERNEL_CUMASK | STATMASK
> >               or      t0, t1
> >               xori    t0, STATMASK & ~1
> >               mtc0    t0, CP0_STATUS
> > @@ -477,7 +477,7 @@
> >    */
> >               .macro  KMODE
> >               mfc0    t0, CP0_STATUS
> > -             li      t1, ST0_CU0 | (STATMASK & ~1)
> > +             li      t1, ST0_KERNEL_CUMASK | (STATMASK & ~1)
> >   #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> >               andi    t2, t0, ST0_IEP
> >               srl     t2, 2
> > diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> > index 7dd234e788e6..61b73580b877 100644
> > --- a/arch/mips/kernel/head.S
> > +++ b/arch/mips/kernel/head.S
> > @@ -35,7 +35,7 @@
> >       .macro  setup_c0_status set clr
> >       .set    push
> >       mfc0    t0, CP0_STATUS
> > -     or      t0, ST0_CU0|\set|0x1f|\clr
> > +     or      t0, ST0_KERNEL_CUMASK|\set|0x1f|\clr
> >       xor     t0, 0x1f|\clr
> >       mtc0    t0, CP0_STATUS
> >       .set    noreorder
> > diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> > index ff5320b79100..90b869297893 100644
> > --- a/arch/mips/kernel/process.c
> > +++ b/arch/mips/kernel/process.c
> > @@ -68,7 +68,7 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp)
> >       unsigned long status;
> >
> >       /* New thread loses kernel privileges. */
> > -     status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_FR|KU_MASK);
> > +     status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_CU2|ST0_FR|KU_MASK);
> >       status |= KU_USER;
> >       regs->cp0_status = status;
> >       lose_fpu(0);
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index b95ef98fc847..f4362ac172c6 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -2190,7 +2190,7 @@ static void configure_status(void)
> >        * flag that some firmware may have left set and the TS bit (for
> >        * IP27).  Set XX for ISA IV code to work.
> >        */
> > -     unsigned int status_set = ST0_CU0;
> > +     unsigned int status_set = ST0_KERNEL_CUMASK;
> >   #ifdef CONFIG_64BIT
> >       status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
> >   #endif
> >
