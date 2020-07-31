Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35A2233F74
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 08:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731435AbgGaGy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 02:54:26 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46330 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731224AbgGaGyZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 02:54:25 -0400
Received: by mail-il1-f194.google.com with SMTP id l17so14326265ilq.13;
        Thu, 30 Jul 2020 23:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddULUPmve2Ih4FDIGVaZL8hkWKq+zZCtd1KIQB4rlVc=;
        b=suKKRghKfTq6JZ9jPMggQB5fgmzLcCUZXN7OykBu0SFEz3om9ijn+A+1wWOA7SNyv+
         ApXb+wgEPJ4yT1LYyKm3n3WvZ5wfFS9bJZH+pXi5teWzEEmmhU7wGyJEPYv30jP3Hk01
         5jWeMtphz7366A8QfHclNVChsfOGL91Q6qS6X0Spem1HjuXs+eSpPpFAZ7RLI0n2nyic
         qR87ZA8vSnGToUAGXg2VO62YdwiB54xjX3xsFjoUsHO32CmEMTOTfvmqtEMbVCOw1Xd3
         3WKREVcYGUDQBzyKytUK4fqlxKRFDsoMwH57ZI0lcjORfoIRn3LdLCdZn5Yhsn4FGtzj
         EXMw==
X-Gm-Message-State: AOAM533U5toP8E1cmbvbsvzZ6LBB1owqfevBxqu8o0ohhmmAueIdoFKo
        RcyZFpb6AMnGiyHzTjypMVsM2wsqmXfpvDRKAKk=
X-Google-Smtp-Source: ABdhPJwrYeQlsEiUFPw0NHC1XzVesrxl6Uh3k+YaqEex2s/LgpjNgb+1s9FyFTbjLLVHl0WC4GsKyoBiqbFTrqNhxes=
X-Received: by 2002:a92:d64d:: with SMTP id x13mr2302391ilp.287.1596178464410;
 Thu, 30 Jul 2020 23:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com> <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
In-Reply-To: <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 31 Jul 2020 14:54:12 +0800
Message-ID: <CAAhV-H5PyXZDpysbjhF9EL0iNKeDM7WWPRgjJB2WW0kVdj+w-Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Fri, Jul 31, 2020 at 2:18 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Fri, Jul 31, 2020 at 12:10:16PM +0800, Jiaxun Yang wrote:
> > Requested by downstream distros, a Kconfig option for default
> > IEEE754 conformance mode allows them to set their mode to
> > relaxed by default.
>
> That's what should have been here in the first place. Thanks!
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
>
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  arch/mips/Kconfig            | 21 +++++++++++++++++++++
> >  arch/mips/kernel/cpu-probe.c | 12 +++++++++++-
> >  2 files changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index f6bb446d30f0..ef5b2a177b1b 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -2877,6 +2877,27 @@ config MIPS_NR_CPU_NR_MAP
> >       default 1024 if MIPS_NR_CPU_NR_MAP_1024
> >       default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
> >
> > +choice
> > +     prompt "Default IEEE Std 754 conformance mode"
> > +     default IEEE754_DEFAULT_STRICT
> > +     help
> > +       Default IEEE Std 754 conformance mode, see ieee754= kernel parameter
> > +       for detail.
> > +
> > +     config IEEE754_DEFAULT_STRICT
> > +             bool "Strict"
> > +
> > +     config IEEE754_DEFAULT_LEGACY
> > +             bool "Legacy"
> > +
> > +     config IEEE754_DEFAULT_STD2008
> > +             bool "2008"
> > +
> > +     config IEEE754_DEFAULT_RELAXED
> > +             bool "Relaxed"
> > +
> > +endchoice
> > +
> >  #
> >  # Timer Interrupt Frequency Configuration
> >  #
> > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> > index d9e8d39a7289..03adeed58efb 100644
> > --- a/arch/mips/kernel/cpu-probe.c
> > +++ b/arch/mips/kernel/cpu-probe.c
> > @@ -157,7 +157,17 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
> >   * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
> >   * ABS.fmt/NEG.fmt execution mode.
> >   */
> > -static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
> > +enum ieee754_mode { STRICT, LEGACY, STD2008, RELAXED };
> > +
> > +#if defined(CONFIG_IEEE754_DEFAULT_STRICT)
> > +static enum ieee754_mode ieee754 = STRICT;
> > +#elif defined(CONFIG_IEEE754_DEFAULT_LEGACY)
> > +static enum ieee754_mode ieee754 = LEGACY;
> > +#elif defined(CONFIG_IEEE754_DEFAULT_STD2008)
> > +static enum ieee754_mode ieee754 = STD2008;
> > +#elif defined(CONFIG_IEEE754_DEFAULT_RELAXED)
> > +static enum ieee754_mode ieee754 = RELAXED;
> > +#endif
> >
> >  /*
> >   * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
> > --
> > 2.28.0
> >
