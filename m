Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61A31DC97B
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 11:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgEUJKC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 05:10:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41068 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbgEUJKC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 05:10:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id 63so4957827oto.8;
        Thu, 21 May 2020 02:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zsv1Lh0K7M59VV4w388XD6WcsG+ryCs8PrcoBNRfD4M=;
        b=X7r2YGNSu7W81D5sXhBazL0VT8ZKFlbTBI5lYTFrUHKc4adJZt52e+hI8ctQE+4pvT
         dWsZl4gfDgcDFBbm5m6YzDrZEQa50dyzmPxJi2cQFG+61Aaw0hBGvuCejr2EYYSCAhct
         Fa9ZC/mDu21gz0w+C1KOI7PjAtG0ZeVh8TdJ+baD0yxUT2Nzcqo//qxCKcVzDTGYLqFl
         CSI/OfvaVweBgHmxg6n0iwwj/k/h+oFwVjHIX85Oucl8Ew5B5IyALgmOeKh9j4DmY4DN
         JAji6Cy8EPa6MJ0YPtO9J+YYmuk+2G5NkBMLa+DMG24gFUvk/AFGqJ2XTTWxm7/ubdUs
         4jbQ==
X-Gm-Message-State: AOAM5313VpUr7UzPdLeZeFzBexmmGL7Gusbj9yngE+omFoPRnyKnNkt9
        jeqi1wU/RYyHpOBC9WUZFErG+4h/0cUR1rGKWWQ=
X-Google-Smtp-Source: ABdhPJwm5hpnt7eWP1EGK7Mtgxjgzq8Xk87gNuPRLtNpSmjQNXuMv1lV/nvEbiXSLKYWEk/r7B5rKl5rIAchj2hnwqo=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr6210653otp.145.1590052201359;
 Thu, 21 May 2020 02:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru> <20200521005321.12129-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521005321.12129-8-Sergey.Semin@baikalelectronics.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 May 2020 11:09:50 +0200
Message-ID: <CAMuHMdW5TqfDTZZCscXCK-Fkd7Gq1Ciyu1_sDzzR0B+_W-2hfg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] clocksource: mips-gic-timer: Mark GIC timer as
 unstable if ref clock changes
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Randy Dunlap <rdunlap@infradead.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Maarten ter Huurne <maarten@treewalker.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Thu, May 21, 2020 at 2:54 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> Currently clocksource framework doesn't support the clocks with variable
> frequency. Since MIPS GIC timer ticks rate might be unstable on some
> platforms, we must make sure that it justifies the clocksource
> requirements. MIPS GIC timer is incremented with the CPU cluster reference
> clocks rate. So in case if CPU frequency changes, the MIPS GIC tick rate
> changes synchronously. Due to this the clocksource subsystem can't rely on
> the timer to measure system clocks anymore. This commit marks the MIPS GIC
> based clocksource as unstable if reference clock (normally it's a CPU
> reference clocks) rate changes. The clocksource will execute a watchdog
> thread, which lowers the MIPS GIC timer rating to zero and fallbacks to a
> new stable one.
>
> Note we don't need to set the CLOCK_SOURCE_MUST_VERIFY flag to the MIPS
> GIC clocksource since normally the timer is stable. The only reason why
> it gets unstable is due to the ref clock rate change, which event we
> detect here in the driver by means of the clocks event notifier.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Thanks for your patch!

> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -24,6 +24,9 @@
>  static DEFINE_PER_CPU(struct clock_event_device, gic_clockevent_device);
>  static int gic_timer_irq;
>  static unsigned int gic_frequency;
> +static bool __read_mostly gic_clock_unstable;
> +
> +static void git_clocksource_unstable(char *reason);

gic_clocksource_unstable? (everywhere)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
