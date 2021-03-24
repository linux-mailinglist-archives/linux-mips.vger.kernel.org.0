Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B683473AE
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 09:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbhCXIbk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 04:31:40 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:42767 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhCXIbZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Mar 2021 04:31:25 -0400
Received: by mail-vs1-f43.google.com with SMTP id b5so10898357vsl.9;
        Wed, 24 Mar 2021 01:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D6+UqJbN8+LqvQ4QyNAcAhK8HpBDLyL/rYTxdWicRRY=;
        b=LChG2vJG9SFlZSFh7zKcFFEu+0Wqcj/GzrhnP5ZWT0rqCjIvX/j9MmQ8fS2vKodlsl
         EJA6fkWP4Uh9SWWNH8PA0s3o+LVcFpwLNcD+oOogmQHyUM7J3FTu5Zf33mtHgJe4szAQ
         HTayF2cPRvyzI7OZhREQg6ayP1t5r7Y9kYWHw4C/7OVjAXenKtdTxVcNYEVMBygXtjTW
         Q5BfyCWHmM1tXYyV4PPwRoDj7yh5sCtwffBmp0xBv0fLUBhgr8zT6Ybl7VYLSYP0fXE8
         ZiqAb6uTLmK35FDRpxcDq/6g53x1ojQdOoTF31dGAHLNYOW7Zwet4oBfIcVoW5v1RGtB
         Owlw==
X-Gm-Message-State: AOAM530O19kPdBN6oal3s8xTwEcmazGpd4takSpcys8jGVVNGpuAentw
        4NPISqbLF6jMsPhD4p7CvjSuWxoH/J069lBJqXo=
X-Google-Smtp-Source: ABdhPJwbekIE/NkYTqs57ft9fz24NP4MbEn/FYAk0zYkLZ5JO1kKFh4ZIi0k5/SqoNv+PwzG4b9HYrbxZZ4161kxOp4=
X-Received: by 2002:a67:8883:: with SMTP id k125mr964204vsd.18.1616574684415;
 Wed, 24 Mar 2021 01:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-18-geert@linux-m68k.org> <543ec200931af3192541fef51bc8e96a@protonic.nl>
 <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com> <20210323204038.GA10002@duo.ucw.cz>
In-Reply-To: <20210323204038.GA10002@duo.ucw.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 09:31:13 +0100
Message-ID: <CAMuHMdVF30BCA-7vCiwmKO6KVFhtNLbL+VEW59oxcAfwJ+jXyg@mail.gmail.com>
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
        linux-leds <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Pavel,

On Tue, Mar 23, 2021 at 9:40 PM Pavel Machek <pavel@ucw.cz> wrote:
> > CC linux-leds (which I intended, but forgot to add)
> >
> > cover letter at
> > https://lore.kernel.org/linux-devicetree/20210322144848.1065067-1-geert@linux-m68k.org/
>
> Still does not tell me... riscv on fpga with 4 character display. What
> is this? :-).

https://gregdavill.github.io/OrangeCrab/r0.2/
https://github.com/litex-hub/linux-on-litex-vexriscv
https://www.adafruit.com/product/3130

> > On Tue, Mar 23, 2021 at 11:08 AM Robin van der Gracht <robin@protonic.nl> wrote:
> > > On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > > > Instantiate a single LED for a segment display.  This allows the user
> > > > to
> > > > control display brightness and blinking through the LED class API and
> > > > triggers, and exposes the display color.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > ---
> > > > For setting display brightness, this could use the existing backlight
> > > > support for frame buffer devices instantiated for dot-matrix displays.
> > > > However, using the leds subsystem instead has the advantage that the
> > > > driver can make use of the HT16K33's hardware blinking support, and can
> > > > expose the display color.
>
> We have multicolor support now...

The color is fixed by the LED color, so there is no need for multicolor
(yet, one day someone might connect RGB 7-segment LED displays
(https://www.rgbdigit.com/rgbdigit/ ;-)

> > > > -     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > > > +     of_property_read_u32(node, "color", &color);
> > > > +     seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> > > > +                     DRIVER_NAME ":%s:" LED_FUNCTION_BACKLIGHT,
> > > > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : "");
>
> And would prefer not to see driver_name as part of LED name.

OK. So what should I use instead? Or just leave the part before the
first colon empty?

> > > > +     err = ht16k33_brightness_set(priv, seg->led.brightness);
> > > >       if (err)
> > > >               return err;
> > >
> > > The LED class can pretty much do what the backlight class can and more.
> > >
> > > Maybe we can stop registering a backlight device in the fbdev case and
> > > register a led device for both. This makes the code cleaner and drops
> > > a dependency but will break backwards compatibility.
> > >
> > > I'd prefer a single solution that covers both use cases, but I'm not
> > > sure about the 'breaking backwards compatibility' consequence...
>
> For new drivers, breaking compatibility should not be a problem.

The dot-matrix support is part of the existing driver, thus subject to
backwards compatibility.
Perhaps we can register the LED device for both, and build the backlight
device on top of the LED device, like "led-backlight" does.  Would that
work? Or can't the LED no longer be controlled from sysfs (e.g.
triggers) if it is in use by a backlight driver?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
