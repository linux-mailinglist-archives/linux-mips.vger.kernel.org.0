Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CDD1C88F0
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 13:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgEGLwP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 07:52:15 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34775 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgEGLwO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 07:52:14 -0400
Received: by mail-oi1-f195.google.com with SMTP id c12so3899910oic.1;
        Thu, 07 May 2020 04:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQbFp2gBid+eKyD3s71l/5k/82IO/a/Y0dwLdZMmZPE=;
        b=GSt9lwFGSGIa7Jb0z9PrS5rE5APPI0btFm4Gnzbk9Cq/gOcmHCxc4ixvF1RpHGpQZh
         DZPB6ZZDGYsXGkdMctAETeTa8pUZKKUmPgVXDqEwa5Whef5SGrmTgD3wj8FYGH4HUp1a
         vcamLNSDccHx5IvXPnrHclgkEyBO+8aFCsErkVzaowfdT0uduRYkQJkX38elKp2wf67D
         ql7aAHn4ELnibNMf0sox52rlUT6NWRZ4p8AoMiv4OSeXmcmAP5MFLmUnrzCk8jifoyUR
         UEZUKvLOlkAgw0HnA4PWgcQly6dYBsGH/o37PCfhy5XCN0BUbeRMR/xm33/yaf4OBp78
         HqdA==
X-Gm-Message-State: AGi0PuYNCNeU7SBt2mVCJQ6o9hpb3bhAamaWrfBaT7BbUpHHwjcardWi
        gR89ZCC2KnfVNTfNAqhTwZ1fs8AJahU8OL6OV5w=
X-Google-Smtp-Source: APiQypIpAkCkwyTgyToV5jfmYh+rREuZ+4o2KOduOSCJvCc+n4Un65LRM2Scg0gVuyIChmsxh53+rIuI04JpBPxKBWg=
X-Received: by 2002:aca:f541:: with SMTP id t62mr5974782oih.148.1588852333871;
 Thu, 07 May 2020 04:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200507114015.24461-1-geert+renesas@glider.be> <20200507114525.GE34497@piout.net>
In-Reply-To: <20200507114525.GE34497@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 May 2020 13:52:02 +0200
Message-ID: <CAMuHMdUYr8Prjv6m0mpE1k6qjzwF+KhTD2QbCpbMVxKJu0-oFA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,

On Thu, May 7, 2020 at 1:46 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 07/05/2020 13:40:15+0200, Geert Uytterhoeven wrote:
> > The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
> > and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
> > config symbol, to avoid asking the user about it when configuring a
> > kernel without Ocelot or Jaguar2 support.
>
> I have to NAK here because there are upcoming (hopefully this cycle)
> SoCs using this driver.

So which symbol do I have to extend the dependency with? ;-)

> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -394,8 +394,8 @@ config PINCTRL_RK805
> >
> >  config PINCTRL_OCELOT
> >       bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
> > -     depends on OF
> > -     depends on HAS_IOMEM
> > +     depends on OF && HAS_IOMEM
> > +     depends on MSCC_OCELOT || COMPILE_TEST
> >       select GPIOLIB
> >       select GPIOLIB_IRQCHIP
> >       select GENERIC_PINCONF

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
