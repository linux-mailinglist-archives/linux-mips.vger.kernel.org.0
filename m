Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F75C516827
	for <lists+linux-mips@lfdr.de>; Sun,  1 May 2022 23:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355341AbiEAVop (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 May 2022 17:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355367AbiEAVoo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 May 2022 17:44:44 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2457A1AD
        for <linux-mips@vger.kernel.org>; Sun,  1 May 2022 14:41:16 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id e12so23257478ybc.11
        for <linux-mips@vger.kernel.org>; Sun, 01 May 2022 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W/jgoNHxZ0Bthjb3T+ueRSX0j4+9gCUm19tM0i8wHwg=;
        b=IhdUZeb/2gtz8F3Rms9jbaMLWrgk9MgQ3AsdLov4FK3Mlzh5dB5SkLKChzGtZ8IxYp
         G5ca/lqDXuEA1sPhEVPyIa/Q2PZiKGOf7YhqAw/IHqTaRS3tfuxe5vxPkiXcKnSSY+3S
         7ppRg4LQk2Uv9wR63si1SSy6XwiVLL7qFkHNlWqfSlqs0yLXj9GT9hsHOGdPMLeWa4Z5
         yi/NgdTd0E83Yl+jmXtf3Jut6MVJU1arAhV4mge1OLZtShQSG4PEDF87HlZJ7jAAsXMq
         NvpTbNSoJchK+6lkQfko/fVrXtHXd/BqfkBEUyV3r++82iVekijvFZHqUIOR58kizRlW
         mQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W/jgoNHxZ0Bthjb3T+ueRSX0j4+9gCUm19tM0i8wHwg=;
        b=gK7Aogn+OE+BXkXzhH2fu73Pi6BN58gF8MDWHU+xrYxhc9hei3lm8Pb9d6nJK3OC5p
         JEOLBDWynXqIJ81Rb6u32Wy90SKxcfCN1eUzGdg8XhWBBaMjlOhMvou+8P5cKernRV2/
         bsGeg2uV0c6gapVm8EjFEZMq9xBN4MkzI5uWUSBqcRQVT4JiRX093mxRHeNAAk4chr5n
         m2rnxKIeAmssScWwY0gjXiziAdVQ1xocEfYbgBLx8Ii/aB9dB7UvnsD2LTkNG0xLsu+E
         e5RhJkAYw4m5Rng/nG05g3jsSb8jeMJgLPFkTJ3wqjx8WIRA0wdLpKXjXaW+Y8+TsdZZ
         DBhw==
X-Gm-Message-State: AOAM530PVaQCQunbJ4TLsybnGFqt+Grbz3SFAQPv4/gAN3eTc+sDGsD0
        BkV11l6iAQdmXxdxBd6CsnLQVfo7ylmHvCNyKuAMxg==
X-Google-Smtp-Source: ABdhPJxQ+Z2MWNpw84rRmTsi9PlMVLP8E3NHAP2/94wScknuaOhbNIB27Lulcn5Bn4eH53rZYcEIPCq8gj4+tkqqRT4=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr2453918ybp.492.1651441275908; Sun, 01
 May 2022 14:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-19-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-19-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 May 2022 23:41:04 +0200
Message-ID: <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Cc: Paul Parsons <lost.distance@yahoo.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

(...)
> +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> +       .dev_id = "hx4700-audio",
> +       .table = {
> +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> +                           "earphone-ndet", GPIO_ACTIVE_HIGH),

This looks wrong. The n in nDET in the end of the name of the GPIO line
means active low does it not?

What I usually do when I see this is to properly set it to
GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
where it's getting used.

Also rename to earphone-det instead of -ndet

> +               GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
> +                           "hp-driver", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
> +                           "spk-nsd", GPIO_ACTIVE_HIGH),

Same here. Rename spk-sd

Yours,
Linus Walleij
