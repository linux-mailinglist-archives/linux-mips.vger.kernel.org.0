Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED232E9932
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbhADPwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:52:34 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:37768 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbhADPwc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:52:32 -0500
Received: by mail-oi1-f175.google.com with SMTP id l207so32575682oib.4;
        Mon, 04 Jan 2021 07:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVjwPJDCUg81BDqonylcIszMaRPhAj/6H6ziGF+Xa0Y=;
        b=EhsAVnLS0wKopYiNuEvHdpF7ZR35QkFhm8N8shu/q+c60yjOYzYFJTIRdVXOpTF8EP
         6NnA02xE9EJiHOmJJqo56Ar8qW5YHIvSHzp5ndm14skQMuU1Ov5PT5ANG79OpMaJesuJ
         +STgYzIdJ3PSzkKc+IZ3JKhWG55vLtGXBn4dvQtgj6gK7KoG+4OtlV6oVLkXkGJ4jIAl
         mlxpDRP/BQ9GH8K+CCzmhLInXQkAEcCOsZYc7T6jM6fyW1TrQvk00P0BeGU5ZWJm5zD6
         6cNv+cKGrKY5tSSjwWp1tLtrDzL10eWdSr3m9RigIbOKxv1hjNUf9obgEGPzeCcf4ezg
         5Mfg==
X-Gm-Message-State: AOAM531E+2veAPY3V0zpXx94edQ+OeMjjS7Wr6Y1QyIJRTxTGS7prhpl
        9aQVXrvWOoAT3rMwVK7YBUtowTWludAc4tKdTa8=
X-Google-Smtp-Source: ABdhPJwZhjCivP9QtPb8qVxwEO2Cy4PiA7OI6PKKTpj/tJrpz3Ecy8AxCyYebbUUdxYpGqm99Li9eCELpolcR2xa35c=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr18408130oia.54.1609775511464;
 Mon, 04 Jan 2021 07:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-2-jiaxun.yang@flygoat.com> <CAMuHMdXo9o9af-YBt5g53QHRhuLxdSy_C9n4wdEEh7yzDidr-w@mail.gmail.com>
 <20210104144841.GC3313@piout.net> <CAMuHMdWGnBcYvXLnydSnkxcmG6GksZLfq1aWADuWg8ibZ3V8Lg@mail.gmail.com>
 <20210104154303.GD3313@piout.net>
In-Reply-To: <20210104154303.GD3313@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 16:51:40 +0100
Message-ID: <CAMuHMdW2nDwJGmOtoDgOEMgEDaD9nMMCv=Y4nZaDqCM1UNadvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: goldfish: Remove GOLDFISH dependency
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,

On Mon, Jan 4, 2021 at 4:43 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 04/01/2021 16:21:31+0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 4, 2021 at 3:48 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 04/01/2021 14:28:26+0100, Geert Uytterhoeven wrote:
> > > > On Sat, Nov 14, 2020 at 2:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > > > > Goldfish platform is covered with dust.
> > > > > However the goldfish-rtc had been used as virtualized RTC
> > > > > in QEMU for RISC-V virt hw and MIPS loongson3-virt hw, thus
> > > > > we can drop other parts of goldfish but leave goldfish-rtc here.
> > > > >
> > > > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/rtc/Kconfig
> > > > > +++ b/drivers/rtc/Kconfig
> > > > > @@ -1935,7 +1935,6 @@ config RTC_DRV_HID_SENSOR_TIME
> > > > >  config RTC_DRV_GOLDFISH
> > > > >         tristate "Goldfish Real Time Clock"
> > > > >         depends on OF && HAS_IOMEM
> > > > > -       depends on GOLDFISH || COMPILE_TEST
> > > > >         help
> > > > >           Say yes to enable RTC driver for the Goldfish based virtual platform.
> > > >
> > > > I was just looking to see if someone had already sent a patch to add
> > > > "depends on GOLDFISH || COMPILE_TEST", before sending one myself, when I
> > > > noticed your patch had removed it...
> > > >
> > > > What about
> > > >
> > > >     depends on CPU_LOONGSON64 || GOLDFISH || RISCV || COMPILE_TEST
> > > >
> > > > instead?
> > > >
> > >
> > > But this driver also works on ARM, is it really important to restrict to
> > > a few architectures ?
> >
> > Is it used on ARM platforms?
> > qemu:hw/riscv/Kconfig selects GOLDFISH_RTC, but that's it?
>
> My understanding is that this was used on the original ARM based goldfish
> android emulator but I don't think this was ever upstreamed.

Upstream indeed only has GOLDFISH support in arch/x86/Kconfig.
Still, that would be handled by the dependency on GOLDFISH.

Or do you mean upstream QEMU Goldfish support?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
