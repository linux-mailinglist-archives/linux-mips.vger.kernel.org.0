Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589EF41F188
	for <lists+linux-mips@lfdr.de>; Fri,  1 Oct 2021 17:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbhJAPxF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 1 Oct 2021 11:53:05 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:37815 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbhJAPxE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Oct 2021 11:53:04 -0400
Received: by mail-ua1-f51.google.com with SMTP id t36so7006468uad.4;
        Fri, 01 Oct 2021 08:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V6QG7RVsPgL4MT7taFNIN3h9Vdu7FgpTMDBW2+9dAy4=;
        b=7BnA7/BKelXoYxWK8iaAnS6yK1zR/K2UeEcIieD0HuVZDzmmHpNWuWD0+p/WMQn5zO
         0o3P2pYBxATEpAw0PsG/kcug113d8V8cvcpNKwh/tzcx/5wiRsSvZoiA9WziVNJxMDYk
         XoZ6gmV/i6ppNwnjN4y2cAgmPppHcSw6fsC/J2sEdfDQVL6nx69wEPjVU2CDsf/ID6f9
         5bWAC90hkywi3Wfi9q1Na9f6trFJ+PAenh6GgdsXn5W37kaDRKdbK0eb3653pvTvx0Em
         lFiFs8gz9jElGNwc36+qxh7cbBBYXFmnAWEmv0PiQpEwaWL3piF43XG3feD6s1aeN4dC
         8Ijg==
X-Gm-Message-State: AOAM531+5owAxqxQU0/RlnGdH32liuXwueZ5mM92fMX93t5+MQNb2UoN
        30t+y/RfS8CoXG7PKIHzhgTSmqNf2PpV4bF3+R0=
X-Google-Smtp-Source: ABdhPJxSLKh9AvpGnMkJMf+4rL5ey13Duasr9b9pl5UUVIbEI9s1F181091Vc8CdXHhLM8BddUTmHotIzJX01V/YUxw=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr10998662uaf.114.1633103479588;
 Fri, 01 Oct 2021 08:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210914143835.511051-1-geert@linux-m68k.org> <20210914143835.511051-20-geert@linux-m68k.org>
 <4602a8e681db4d0ebc43e4dafee8c28e@protonic.nl>
In-Reply-To: <4602a8e681db4d0ebc43e4dafee8c28e@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Oct 2021 17:51:08 +0200
Message-ID: <CAMuHMdVOa8DAGJQpJ8AotARxfh9PvpskJJa6k48jE92-P+GLRA@mail.gmail.com>
Subject: Re: [PATCH v6 19/19] auxdisplay: ht16k33: Add LED support
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hoi Robin,

On Thu, Sep 30, 2021 at 12:57 PM Robin van der Gracht <robin@protonic.nl> wrote:
> On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> > Instantiate a single LED based on the "led" subnode in DT.
> > This allows the user to control display brightness and blinking (backed
> > by hardware support) through the LED class API and triggers, and exposes
> > the display color.  The LED will be named
> > "auxdisplay:<color>:<function>".
> >
> > When running in dot-matrix mode and if no "led" subnode is found, the
> > driver falls back to the traditional backlight mode, to preserve
> > backwards compatibility.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Marek Behún <kabel@kernel.org>
> > ---
> > v6:
> >   - Add Reviewed-by,
> >   - Reorder operations in ht16k33_led_probe() to ease future conversion
> >     to device properties,

> > --- a/drivers/auxdisplay/ht16k33.c
> > +++ b/drivers/auxdisplay/ht16k33.c
> > @@ -425,6 +477,35 @@ static void ht16k33_seg14_update(struct work_struct
> > *work)
> >       i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
> >  }
> >
> > +static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
> > +                          unsigned int brightness)
> > +{
> > +     struct led_init_data init_data = {};
> > +     struct device_node *node;
> > +     int err;
> > +
> > +     /* The LED is optional */
> > +     node = of_get_child_by_name(dev->of_node, "led");
> > +     if (!node)
> > +             return 0;
> > +
> > +     init_data.fwnode = of_fwnode_handle(node);
> > +     init_data.devicename = "auxdisplay";
> > +     init_data.devname_mandatory = true;
> > +
> > +     led->brightness_set_blocking = ht16k33_brightness_set_blocking;
> > +     led->blink_set = ht16k33_blink_set;
> > +     led->flags = LED_CORE_SUSPENDRESUME;
> > +     led->brightness = brightness;
> > +     led->max_brightness = MAX_BRIGHTNESS;
>
> What do you think about adding a default trigger and making it 'backlight'?
>
> led->default_trigger = "blacklight";
>
> Or as an alternative, suggesting linux,default-trigger = "backlight" in the
> docs? Since the led class won't respond to blank events by just making it's
> function LED_FUNCTION_BACKLIGHT.
>
> led {
>         function = LED_FUNCTION_BACKLIGHT;
>         color = <LED_COLOR_ID_GREEN>;
>         linux,default-trigger = "backlight";
> };

The latter makes perfect sense to me.  Will do.

> I noticed blanking is broken. The backlight device (or LED device with
> backlight trigger) doens't get notified when the framebuffer is blanked since
> the driver doesn't implement fb_blank.
>
> Right now:
>
> echo 1 > /sys/class/graphics/fb0/blank
>                                                              |
> sh: write error: Invalid argument
>
> Due to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/video/fbdev/core/fbmem.c?h=v5.15-rc3#n1078

That's a pre-existing problem, righ? ;-)

> Something like this fixes it.
>
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 89ee5b4b3dfc..0883d5252c81 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -346,6 +346,15 @@ static int ht16k33_mmap(struct fb_info *info, struct
> vm_area_struct *vma)
>          return vm_map_pages_zero(vma, &pages, 1);
>   }
>
> +/*
> + * Blank events will be passed to the backlight device (or the LED device if
> + * it's trigger is 'backlight') when we return 0 here.
> + */
> +static int ht16k33_blank(int blank, struct fb_info *info)
> +{
> +       return 0;
> +}
> +
>   static const struct fb_ops ht16k33_fb_ops = {
>          .owner = THIS_MODULE,
>          .fb_read = fb_sys_read,
> @@ -354,6 +363,7 @@ static const struct fb_ops ht16k33_fb_ops = {
>          .fb_copyarea = sys_copyarea,
>          .fb_imageblit = sys_imageblit,
>          .fb_mmap = ht16k33_mmap,
> +       .fb_blank = ht16k33_blank,
>   };
>
>   /*
>
> Feel free to include (something like) this in the patch stack.

Thanks, will do.

> > +
> > +     err = devm_led_classdev_register_ext(dev, led, &init_data);
> > +     if (err)
> > +             dev_err(dev, "Failed to register LED\n");
>
> You might want to call ht16k33_brightness_set(priv, brightness) here to get a
> know value into the display setup register (0x80).
>
> Right now if I enable hardware blinking and (soft)reboot my board it keeps on
> blinking even after a re-probe.

I don't have that issue.
Aha, ht16k33_seg_probe() calls ht16k33_brightness_set(), but
ht16k33_fbdev_probe() doesn't.  The latter should do that, too,
when not using backwards compatibility mode.

> > @@ -575,7 +660,7 @@ static int ht16k33_seg_probe(struct device *dev, struct
> > ht16k33_priv *priv,
> >       struct ht16k33_seg *seg = &priv->seg;
> >       int err;
> >
> > -     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > +     err = ht16k33_brightness_set(priv, brightness);
>
> This looks like a bugfix for patch 17, maybe move this change there?

Indeed. Bad rebase. Will move.

Thanks a lot for your comments!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
