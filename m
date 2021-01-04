Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11AB2E985F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbhADPWX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:22:23 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43702 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADPWX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:22:23 -0500
Received: by mail-ot1-f41.google.com with SMTP id q25so26279568otn.10;
        Mon, 04 Jan 2021 07:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g71kf7yD8PJahnkXWCoxNGftOUP20SKdOj2+oVmJTIo=;
        b=G2YsDpt0ZLPmdFLjjSgULl/RDYsnDSynBYA2EF3a2X31E5IBufTB2LoVCPFbKX++a0
         uiUCgyCQK5x8xLADy36sw/IdsS/ioaBOgOcTvlbmJTs3Mj8/5xPmfeTCPmEipV6B53GK
         K/xoG6jvAj6Ow3TnEEWorvImb+kO6TNaoHZ9yYG845jw8NtYjZr5B9JUBiY7pfOx69vs
         iKx1BzuS6u1mIp/dLNmf+4i/blsoAanMK4234G2WYOtuMeGQIQnmqr5I7790LuG4mRFf
         KIqAtatAStuMoztuGl60dFfq/ClCm5y1holqAB/IQvOkyFOd5T24SMXaFGrWc7mTa5Cb
         mlaA==
X-Gm-Message-State: AOAM533JPVly/+HNW2NSgs5zVaCEUfim6h4dKh8Z3OfyVC7VPhiDEDfL
        hLn42iTrlijY5oMS+SrT16I0hmur0XcBOLN+Nicn0uDPJO4=
X-Google-Smtp-Source: ABdhPJzGrORLmJC2swKHaKs9mks9fB5/ewOYp63tukZ1EIQ6KkxpiSrebknvCn0uqVlazfyrFqmbt//ytxjIT6PKZ9E=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr37964112otr.107.1609773702385;
 Mon, 04 Jan 2021 07:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-2-jiaxun.yang@flygoat.com> <CAMuHMdXo9o9af-YBt5g53QHRhuLxdSy_C9n4wdEEh7yzDidr-w@mail.gmail.com>
 <20210104144841.GC3313@piout.net>
In-Reply-To: <20210104144841.GC3313@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 16:21:31 +0100
Message-ID: <CAMuHMdWGnBcYvXLnydSnkxcmG6GksZLfq1aWADuWg8ibZ3V8Lg@mail.gmail.com>
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

On Mon, Jan 4, 2021 at 3:48 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 04/01/2021 14:28:26+0100, Geert Uytterhoeven wrote:
> > On Sat, Nov 14, 2020 at 2:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > > Goldfish platform is covered with dust.
> > > However the goldfish-rtc had been used as virtualized RTC
> > > in QEMU for RISC-V virt hw and MIPS loongson3-virt hw, thus
> > > we can drop other parts of goldfish but leave goldfish-rtc here.
> > >
> > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -1935,7 +1935,6 @@ config RTC_DRV_HID_SENSOR_TIME
> > >  config RTC_DRV_GOLDFISH
> > >         tristate "Goldfish Real Time Clock"
> > >         depends on OF && HAS_IOMEM
> > > -       depends on GOLDFISH || COMPILE_TEST
> > >         help
> > >           Say yes to enable RTC driver for the Goldfish based virtual platform.
> >
> > I was just looking to see if someone had already sent a patch to add
> > "depends on GOLDFISH || COMPILE_TEST", before sending one myself, when I
> > noticed your patch had removed it...
> >
> > What about
> >
> >     depends on CPU_LOONGSON64 || GOLDFISH || RISCV || COMPILE_TEST
> >
> > instead?
> >
>
> But this driver also works on ARM, is it really important to restrict to
> a few architectures ?

Is it used on ARM platforms?
qemu:hw/riscv/Kconfig selects GOLDFISH_RTC, but that's it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
