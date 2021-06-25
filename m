Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3311F3B437A
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 14:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFYMmN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 08:42:13 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:44693 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhFYMmN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 08:42:13 -0400
Received: by mail-vk1-f181.google.com with SMTP id w1so2043076vkg.11;
        Fri, 25 Jun 2021 05:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdAFQrYjZ7tFOmYJ4XAsP96fFhUM3/tL0iMbvfXhUVA=;
        b=YH1Eak56KEbjaEIVcXd8xFwe5QAF6mFqvZ+iFSUcGNzoVIXHetbulVYs2cBTHbB/m5
         uhYpQNDyWUxXS5Qa0DSQSGmpCxEMS7lJcYfxvlwWLZ5h2zufLtK7T5msjXJCNBzmom8S
         Skjz/GD59OH5BI9PkoU1q3FStenYGbJh1SbGEeOfvH92y9Lstb2dOnxysMEAYRdoA5PE
         9Fz6MyEJakXq1jglEUNAccvm03NUUAERlV3aGzC80mRr+Ju3YjzIF9DByOl9X7T0VqRH
         YVoMUFrm39u6nR7X2veRiMdd+E7YHkhhrK+Oh7Fxhl0lNeIDpFJyPQ+9W7kehYp+ZFLm
         MtTA==
X-Gm-Message-State: AOAM532zfiZafocjEkZmnysF8lmK957vAgNXL0Ji0Na4cMkHhSmMgfeK
        Z3gAhBIBEQRhh6e2vVHjRGE47/k0ivDCCscr3BHTjPKR2sg=
X-Google-Smtp-Source: ABdhPJyaMqdhFPUsH/gm69FNnsiJ4N+ggk62xelaVga9bulLHdrSTNbV0aBsycWgJx4lWnTIwiUgTfw/VdhZO1fsgaE=
X-Received: by 2002:a1f:ac45:: with SMTP id v66mr7482776vke.1.1624624792112;
 Fri, 25 Jun 2021 05:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-18-geert@linux-m68k.org> <543ec200931af3192541fef51bc8e96a@protonic.nl>
 <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com>
 <20210323204038.GA10002@duo.ucw.cz> <CAMuHMdVF30BCA-7vCiwmKO6KVFhtNLbL+VEW59oxcAfwJ+jXyg@mail.gmail.com>
In-Reply-To: <CAMuHMdVF30BCA-7vCiwmKO6KVFhtNLbL+VEW59oxcAfwJ+jXyg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 14:39:40 +0200
Message-ID: <CAMuHMdWQOQmeoNP8po19m_Fo9d55ur68CqOORX-NGhkLbRAsGg@mail.gmail.com>
Subject: Re: [PATCH 17/17] auxdisplay: ht16k33: Add segment display LED support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 24, 2021 at 9:31 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Mar 23, 2021 at 9:40 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > CC linux-leds (which I intended, but forgot to add)
> > >
> > > cover letter at
> > > https://lore.kernel.org/linux-devicetree/20210322144848.1065067-1-geert@linux-m68k.org/

> > > > > +     err = ht16k33_brightness_set(priv, seg->led.brightness);
> > > > >       if (err)
> > > > >               return err;
> > > >
> > > > The LED class can pretty much do what the backlight class can and more.
> > > >
> > > > Maybe we can stop registering a backlight device in the fbdev case and
> > > > register a led device for both. This makes the code cleaner and drops
> > > > a dependency but will break backwards compatibility.
> > > >
> > > > I'd prefer a single solution that covers both use cases, but I'm not
> > > > sure about the 'breaking backwards compatibility' consequence...
> >
> > For new drivers, breaking compatibility should not be a problem.
>
> The dot-matrix support is part of the existing driver, thus subject to
> backwards compatibility.
> Perhaps we can register the LED device for both, and build the backlight
> device on top of the LED device, like "led-backlight" does.  Would that
> work? Or can't the LED no longer be controlled from sysfs (e.g.
> triggers) if it is in use by a backlight driver?

Using "led-backlight", the backlight can no longer be controlled from
sysfs, precluding the use of other triggers incl. hardware blinking.
But a normal LED can be used as a backlight, with ledtrig-backlight,
so that is the most flexible option, but only if no backwards
compatibility is to be considered.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
