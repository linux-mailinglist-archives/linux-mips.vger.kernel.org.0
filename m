Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFFC2E95FE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 14:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbhADN3S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 08:29:18 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:36877 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbhADN3S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 08:29:18 -0500
Received: by mail-oi1-f178.google.com with SMTP id l207so32092168oib.4;
        Mon, 04 Jan 2021 05:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6T4y+ecTYYYZDM41o/baqi/IkEVhIrJtoe7kFNSajtM=;
        b=d3OGSDBlUP+1Sam+7Ckl/TZT0pxQessM5UYQUViK865476rnSsL8VurbISEPWHI7/W
         0VUkpaYPHekOxwJblhnII79QH6Xhcs2/6T8+Z6w66Q0nCzqKGsPa6ip/2IIQVLbZEykK
         GVGzd1BWFFVExTDjil38HZqyrvkcxpxk2Y6eXXXpIcgsUcSY0NqrpiZORSisTdodRf2x
         cQwB8UVx6ihQ3OCmNeW2albV5HcFieI+QtrgIV8HWNIyHDYr2TMG2DRvL0lT2f9ge0XB
         a8/r1i3RzLf+dEMSBFtCX/8i8CTFG43Vh56Nu7J5N1aWGe4jEzikvMNgNIJGXKWZ+9uh
         i9aw==
X-Gm-Message-State: AOAM530Hsefis+SNcCAl2C7LWQWLdCVbQP7tkZpL5sg/76NZvGnm45uu
        5JLTsb9Fl65fHFng0a+Mj0qNEnxAWQ9L1P40S9gyL9gzjv0=
X-Google-Smtp-Source: ABdhPJzWxDoDdBzpXC3HBt74lcMfT4hgBAR6jPj17GX1lTVdRegfSw2xQy1X8CwJYbTueBtkN9J6R9g7hLcyiq5h49g=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr17758048oia.148.1609766917308;
 Mon, 04 Jan 2021 05:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com> <20201114130921.651882-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20201114130921.651882-2-jiaxun.yang@flygoat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 14:28:26 +0100
Message-ID: <CAMuHMdXo9o9af-YBt5g53QHRhuLxdSy_C9n4wdEEh7yzDidr-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: goldfish: Remove GOLDFISH dependency
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Sat, Nov 14, 2020 at 2:20 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> Goldfish platform is covered with dust.
> However the goldfish-rtc had been used as virtualized RTC
> in QEMU for RISC-V virt hw and MIPS loongson3-virt hw, thus
> we can drop other parts of goldfish but leave goldfish-rtc here.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for your patch!

> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1935,7 +1935,6 @@ config RTC_DRV_HID_SENSOR_TIME
>  config RTC_DRV_GOLDFISH
>         tristate "Goldfish Real Time Clock"
>         depends on OF && HAS_IOMEM
> -       depends on GOLDFISH || COMPILE_TEST
>         help
>           Say yes to enable RTC driver for the Goldfish based virtual platform.

I was just looking to see if someone had already sent a patch to add
"depends on GOLDFISH || COMPILE_TEST", before sending one myself, when I
noticed your patch had removed it...

What about

    depends on CPU_LOONGSON64 || GOLDFISH || RISCV || COMPILE_TEST

instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
