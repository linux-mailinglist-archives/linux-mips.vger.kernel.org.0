Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB9C242036
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 21:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHKTZX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 11 Aug 2020 15:25:23 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:33107 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgHKTZX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 15:25:23 -0400
Received: by mail-ej1-f67.google.com with SMTP id jp10so14367333ejb.0;
        Tue, 11 Aug 2020 12:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4h6AuOs/iA7sh58u28Rd0+EiMqsVQwGAinznwNjR9f4=;
        b=E6RZTzW6xSxuJs6kkuk6v+KlbfmQsixUN2lDT17yNtUVnHgcDbNR6/i98H+dk5HBLv
         tsZcF9V7AVJT5CLiEtJj2zBFerA3ULHQYV5HYPBHAFlS1vnpMunYuxy+r191Cq4EE2ck
         IHxPrVAMlR+W1OSW+lqwarFP5phgLVS5tai0mj5OYmRLbdeIDLi5dkLpgo0pIB/yfJ4s
         EbuS/hACFEdwuoMHC9EICmUxXuToGo02PSMCXzDUvHHqhKAZChU8WGLWgrxbUHiNB5Eo
         2W2n/HJVQ319yVt+zCdTPQ/3ARTbXmOe0cCP31XrJMq0pKf/QmI/72VinEJxjMwf8wre
         mnVg==
X-Gm-Message-State: AOAM532fpLZvH0y0LCMN6c815JtDmdXbF2+22fAf3HYN/KDUV3LoRIbD
        u2K4IpgkdV16TfBbtihCn2NtXKSQVSJOOWc7S3A=
X-Google-Smtp-Source: ABdhPJzAsYOWT/mFFcOPm5JjqVcdIAy849EriB5FiS7uRt87pR754BpN/DI7s8QQ5qfYs1k8Y5upI/WNVcPcw4ImaOs=
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr27438218eja.510.1597173917924;
 Tue, 11 Aug 2020 12:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200811150117.254620-1-noltari@gmail.com> <20200811150117.254620-5-noltari@gmail.com>
 <CAAdtpL6VZExOBuJ1CiAgbstrGOudcwvhmafxrit0gZCsNvYRuA@mail.gmail.com>
In-Reply-To: <CAAdtpL6VZExOBuJ1CiAgbstrGOudcwvhmafxrit0gZCsNvYRuA@mail.gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 11 Aug 2020 21:25:06 +0200
Message-ID: <CAAdtpL4p+HeuDK5Q8KQ-yr6Wz9GwdC+1p1tFgXOjPb=QQ90DEQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MIPS: BCM63xx: refactor board declarations
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 11, 2020 at 6:48 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> On Tue, Aug 11, 2020 at 5:01 PM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
> >
> > Current board declarations are a mess. Let's put some order and make them
> > follow the same structure. Also board declarations tabs.
> > Switch to SPDX license identifier.
> >
> > Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > ---
> >  v3: no changes.
> >  v2: switch to SPDX license identifier.
> >
> >  arch/mips/bcm63xx/boards/board_bcm963xx.c | 620 +++++++++++-----------
> >  1 file changed, 306 insertions(+), 314 deletions(-)
> >
> > diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> > index ac9570b66f37..01aff80a5967 100644
> > --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> > +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> > @@ -1,8 +1,5 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * This file is subject to the terms and conditions of the GNU General Public
> > - * License.  See the file "COPYING" in the main directory of this archive
> > - * for more details.
> > - *
>
> Sorry for missing this earlier and being picky, but doing license
> change and code
> change in the same commit is not recommended.

Rationale for this is you might revert a code change, but you
certainly don't want to revert a license change.

> Adding a SPDX tag is easy to
> review, removing a license is another story. IANAL so up to the maintainer...
>
> >   * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
> >   * Copyright (C) 2008 Florian Fainelli <florian@openwrt.org>
> >   */
> > @@ -41,30 +38,28 @@ static struct board_info board;
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_3368
> >  static struct board_info __initdata board_cvg834g = {
> > -       .name                           = "CVG834G_E15R3921",
> > -       .expected_cpu_id                = 0x3368,
> > +       .name = "CVG834G_E15R3921",
> > +       .expected_cpu_id = 0x3368,
> >
> > -       .has_uart0                      = 1,
> > -       .has_uart1                      = 1,
> > -
> > -       .has_enet0                      = 1,
> > -       .has_pci                        = 1,
> > +       .ephy_reset_gpio = 36,
> > +       .ephy_reset_gpio_flags = GPIOF_INIT_HIGH,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> > +       .has_uart1 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> >         .leds = {
> >                 {
> > -                       .name           = "CVG834G:green:power",
> > -                       .gpio           = 37,
> > +                       .name = "CVG834G:green:power",
> > +                       .gpio = 37,
> >                         .default_trigger= "default-on",
> >                 },
> >         },
> > -
> > -       .ephy_reset_gpio                = 36,
> > -       .ephy_reset_gpio_flags          = GPIOF_INIT_HIGH,
> >  };
> >  #endif /* CONFIG_BCM63XX_CPU_3368 */
> >
> > @@ -73,44 +68,44 @@ static struct board_info __initdata board_cvg834g = {
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_6328
> >  static struct board_info __initdata board_96328avng = {
> > -       .name                           = "96328avng",
> > -       .expected_cpu_id                = 0x6328,
> > +       .name = "96328avng",
> > +       .expected_cpu_id = 0x6328,
> >
> > -       .has_uart0                      = 1,
> > -       .has_pci                        = 1,
> > -       .has_usbd                       = 0,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_usbd = 0,
> >         .usbd = {
> > -               .use_fullspeed          = 0,
> > -               .port_no                = 0,
> > +               .use_fullspeed = 0,
> > +               .port_no = 0,
> >         },
> >
> >         .leds = {
> >                 {
> > -                       .name           = "96328avng::ppp-fail",
> > -                       .gpio           = 2,
> > -                       .active_low     = 1,
> > +                       .name = "96328avng::ppp-fail",
> > +                       .gpio = 2,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "96328avng::power",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "96328avng::power",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "96328avng::power-fail",
> > -                       .gpio           = 8,
> > -                       .active_low     = 1,
> > +                       .name = "96328avng::power-fail",
> > +                       .gpio = 8,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "96328avng::wps",
> > -                       .gpio           = 9,
> > -                       .active_low     = 1,
> > +                       .name = "96328avng::wps",
> > +                       .gpio = 9,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "96328avng::ppp",
> > -                       .gpio           = 11,
> > -                       .active_low     = 1,
> > +                       .name = "96328avng::ppp",
> > +                       .gpio = 11,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> > @@ -121,85 +116,86 @@ static struct board_info __initdata board_96328avng = {
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_6338
> >  static struct board_info __initdata board_96338gw = {
> > -       .name                           = "96338GW",
> > -       .expected_cpu_id                = 0x6338,
> > +       .name = "96338GW",
> > +       .expected_cpu_id = 0x6338,
> > +
> > +       .has_ohci0 = 1,
> > +       .has_uart0 = 1,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0                      = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "adsl",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ses",
> > -                       .gpio           = 5,
> > -                       .active_low     = 1,
> > +                       .name = "ses",
> > +                       .gpio = 5,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 }
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96338w = {
> > -       .name                           = "96338W",
> > -       .expected_cpu_id                = 0x6338,
> > +       .name = "96338W",
> > +       .expected_cpu_id = 0x6338,
> > +
> > +       .has_uart0 = 1,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> >         .leds = {
> >                 {
> > -                       .name           = "adsl",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "adsl",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ses",
> > -                       .gpio           = 5,
> > -                       .active_low     = 1,
> > +                       .name = "ses",
> > +                       .gpio = 5,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> > @@ -210,10 +206,10 @@ static struct board_info __initdata board_96338w = {
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_6345
> >  static struct board_info __initdata board_96345gw2 = {
> > -       .name                           = "96345GW2",
> > -       .expected_cpu_id                = 0x6345,
> > +       .name = "96345GW2",
> > +       .expected_cpu_id = 0x6345,
> >
> > -       .has_uart0                      = 1,
> > +       .has_uart0 = 1,
> >  };
> >  #endif /* CONFIG_BCM63XX_CPU_6345 */
> >
> > @@ -222,282 +218,282 @@ static struct board_info __initdata board_96345gw2 = {
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_6348
> >  static struct board_info __initdata board_96348r = {
> > -       .name                           = "96348R",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "96348R",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> >         .leds = {
> >                 {
> > -                       .name           = "adsl-fail",
> > -                       .gpio           = 2,
> > -                       .active_low     = 1,
> > +                       .name = "adsl-fail",
> > +                       .gpio = 2,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "ppp",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96348gw_10 = {
> > -       .name                           = "96348GW-10",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "96348GW-10",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pccard = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> > +
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0                      = 1,
> > -       .has_pccard                     = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl-fail",
> > -                       .gpio           = 2,
> > -                       .active_low     = 1,
> > +                       .name = "adsl-fail",
> > +                       .gpio = 2,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "ppp",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96348gw_11 = {
> > -       .name                           = "96348GW-11",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "96348GW-11",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pccard = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0 = 1,
> > -       .has_pccard = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl-fail",
> > -                       .gpio           = 2,
> > -                       .active_low     = 1,
> > +                       .name = "adsl-fail",
> > +                       .gpio = 2,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "ppp",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96348gw = {
> > -       .name                           = "96348GW",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "96348GW",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> > +
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0 = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl-fail",
> > -                       .gpio           = 2,
> > -                       .active_low     = 1,
> > +                       .name = "adsl-fail",
> > +                       .gpio = 2,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp",
> > -                       .gpio           = 3,
> > -                       .active_low     = 1,
> > +                       .name = "ppp",
> > +                       .gpio = 3,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 0,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 0,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 1,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 1,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_FAST2404 = {
> > -       .name                           = "F@ST2404",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "F@ST2404",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pccard = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> > -
> > -       .has_ohci0                      = 1,
> > -       .has_pccard                     = 1,
> >  };
> >
> >  static struct board_info __initdata board_rta1025w_16 = {
> > -       .name                           = "RTA1025W_16",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "RTA1025W_16",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_pci = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> > +
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >  };
> >
> >  static struct board_info __initdata board_DV201AMR = {
> > -       .name                           = "DV201AMR",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "DV201AMR",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_pci                        = 1,
> > -       .has_ohci0                      = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> > +
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96348gw_a = {
> > -       .name                           = "96348GW-A",
> > -       .expected_cpu_id                = 0x6348,
> > +       .name = "96348GW-A",
> > +       .expected_cpu_id = 0x6348,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> > +
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> > -
> > -       .has_ohci0 = 1,
> >  };
> >  #endif /* CONFIG_BCM63XX_CPU_6348 */
> >
> > @@ -506,146 +502,142 @@ static struct board_info __initdata board_96348gw_a = {
> >   */
> >  #ifdef CONFIG_BCM63XX_CPU_6358
> >  static struct board_info __initdata board_96358vw = {
> > -       .name                           = "96358VW",
> > -       .expected_cpu_id                = 0x6358,
> > +       .name = "96358VW",
> > +       .expected_cpu_id = 0x6358,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ehci0 = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pccard = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0 = 1,
> > -       .has_pccard = 1,
> > -       .has_ehci0 = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl-fail",
> > -                       .gpio           = 15,
> > -                       .active_low     = 1,
> > +                       .name = "adsl-fail",
> > +                       .gpio = 15,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp",
> > -                       .gpio           = 22,
> > -                       .active_low     = 1,
> > +                       .name = "ppp",
> > +                       .gpio = 22,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 23,
> > -                       .active_low     = 1,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 23,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 4,
> > +                       .name = "power",
> > +                       .gpio = 4,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 5,
> > +                       .name = "stop",
> > +                       .gpio = 5,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_96358vw2 = {
> > -       .name                           = "96358VW2",
> > -       .expected_cpu_id                = 0x6358,
> > +       .name = "96358VW2",
> > +       .expected_cpu_id = 0x6358,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ehci0 = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pccard = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> >
> > -       .has_ohci0 = 1,
> > -       .has_pccard = 1,
> > -       .has_ehci0 = 1,
> > -
> >         .leds = {
> >                 {
> > -                       .name           = "adsl",
> > -                       .gpio           = 22,
> > -                       .active_low     = 1,
> > +                       .name = "adsl",
> > +                       .gpio = 22,
> > +                       .active_low = 1,
> >                 },
> >                 {
> > -                       .name           = "ppp-fail",
> > -                       .gpio           = 23,
> > +                       .name = "ppp-fail",
> > +                       .gpio = 23,
> >                 },
> >                 {
> > -                       .name           = "power",
> > -                       .gpio           = 5,
> > -                       .active_low     = 1,
> > +                       .name = "power",
> > +                       .gpio = 5,
> > +                       .active_low = 1,
> >                         .default_trigger = "default-on",
> >                 },
> >                 {
> > -                       .name           = "stop",
> > -                       .gpio           = 4,
> > -                       .active_low     = 1,
> > +                       .name = "stop",
> > +                       .gpio = 4,
> > +                       .active_low = 1,
> >                 },
> >         },
> >  };
> >
> >  static struct board_info __initdata board_AGPFS0 = {
> > -       .name                           = "AGPF-S0",
> > -       .expected_cpu_id                = 0x6358,
> > +       .name = "AGPF-S0",
> > +       .expected_cpu_id = 0x6358,
> >
> > -       .has_uart0                      = 1,
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ehci0 = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pci = 1,
> > +       .has_uart0 = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> > -
> > -       .has_ohci0 = 1,
> > -       .has_ehci0 = 1,
> >  };
> >
> >  static struct board_info __initdata board_DWVS0 = {
> > -       .name                           = "DWV-S0",
> > -       .expected_cpu_id                = 0x6358,
> > +       .name = "DWV-S0",
> > +       .expected_cpu_id = 0x6358,
> >
> > -       .has_enet0                      = 1,
> > -       .has_enet1                      = 1,
> > -       .has_pci                        = 1,
> > +       .has_ehci0 = 1,
> > +       .has_ohci0 = 1,
> > +       .has_pci = 1,
> >
> > +       .has_enet0 = 1,
> >         .enet0 = {
> > -               .has_phy                = 1,
> > -               .use_internal_phy       = 1,
> > +               .has_phy = 1,
> > +               .use_internal_phy = 1,
> >         },
> >
> > +       .has_enet1 = 1,
> >         .enet1 = {
> > -               .force_speed_100        = 1,
> > -               .force_duplex_full      = 1,
> > +               .force_speed_100 = 1,
> > +               .force_duplex_full = 1,
> >         },
> > -
> > -       .has_ohci0                      = 1,
> > -       .has_ehci0                      = 1,
> >  };
> >  #endif /* CONFIG_BCM63XX_CPU_6358 */
> >
> > --
> > 2.28.0
> >
