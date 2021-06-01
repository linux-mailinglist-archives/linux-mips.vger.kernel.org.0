Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6030C397323
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 14:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbhFAMZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 08:25:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231576AbhFAMZy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 08:25:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 785FC613C8;
        Tue,  1 Jun 2021 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622550253;
        bh=bMXNb2VeXTyBACL+G8RPqemlbBxur/SzGG+9RTrBBF4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XXNkH8IlozxNq2M1GVbe5Cd+MnrJTDIr7AyRlvVZPSF72S/I5TjGRI9mzJ3ivr2Aj
         jlpI9FDV0m3bC9wYkjm2WryGVRetEVhprzAf3wLY9bNZjCX64ft3t+fX03S6nKyOHX
         gz6kMq46bZNPIZwnOKAbTDKOFMWeYW+aN2XlQ9rghFlHLEy66mwxS38CU+D3aSR1B0
         WwWTL9Bfz2RZ2ZIRElm3D+Ibpp3ot/y8Z+UTt6wNikWBUPx1q7W61VfGlXy5pPC2hK
         kMNY0U8HIom1T8L0eBjDvo9Alm+qII3u2UqzlKTenuz/aZj8jIUnBg3fPbjCX2o+5j
         ypkBMtyYVVvyw==
Received: by mail-wm1-f49.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so1452110wmk.1;
        Tue, 01 Jun 2021 05:24:13 -0700 (PDT)
X-Gm-Message-State: AOAM531jV46k4bPpOHxqgq6fA+FCQE76hp4MmEEmXtAZ1Q6b+jXvGbVn
        ffE3e2ArWoHMhMVKOW/XoIUILhD1sQTfndFvyj4=
X-Google-Smtp-Source: ABdhPJyhHHSl+I4YpRKwza8oTnPhTY74ijC0oOtSz1ZDonS0qI7ZVbzx/z3orF63Mz18g3NL36ak2jlZebPYlo7I8Tk=
X-Received: by 2002:a1c:8016:: with SMTP id b22mr25916283wmd.43.1622550252070;
 Tue, 01 Jun 2021 05:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210531184749.2475868-5-arnd@kernel.org>
 <CAMuHMdXFcohr2y8oR3VaddmDXjZx97o8jRJvfoppuHMrL=4xEg@mail.gmail.com>
In-Reply-To: <CAMuHMdXFcohr2y8oR3VaddmDXjZx97o8jRJvfoppuHMrL=4xEg@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 1 Jun 2021 14:22:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1YThJRiWtP-v1U87YGWK-MeCRq1wOCroHWPbf8YDYCvg@mail.gmail.com>
Message-ID: <CAK8P3a1YThJRiWtP-v1U87YGWK-MeCRq1wOCroHWPbf8YDYCvg@mail.gmail.com>
Subject: Re: [PATCH 4/7] m68k: coldfire: use clkdev_lookup on most coldfire
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 1, 2021 at 11:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, May 31, 2021 at 8:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Coldfire is now the only target that implements the clk_get()/clk_put()
> > helpers itself rather than using the common implementation.
> >
> > Most coldfire variants only have two distinct clocks and use the clk
> > code purely for lookup. Change those over to use clkdev_lookup instead
> > but leave the custom clk interface for those two clocks.
> >
> > Also leave the four SoCs that have gated clocks.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/coldfire/m527x.c
> > +++ b/arch/m68k/coldfire/m527x.c
>
> > @@ -97,7 +86,7 @@ static void __init m527x_i2c_init(void)
> >         /*  set PAR_SCL to SCL and PAR_SDA to SDA */
> >         par = readw(MCFGPIO_PAR_FECI2C);
> >         par |= 0x0f;
> > -       writew(par, MCFGPIO_PAR_FECI2C);
> > +       wm527x_clk_lookupritew(par, MCFGPIO_PAR_FECI2C);
>
> As reported by the kernel test robot, this fails to compile.
> Should probably just stay "write".

Yes, I already fixed that up yesterday. It appears I had accidentally inserted
a string with the middle mouse button, and building all defconfigs did
not catch this.

The fixed branch is at

  https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/log/?h=clkdev

and so far has not triggered any other warnings from the kernel built bot.

        Arnd
