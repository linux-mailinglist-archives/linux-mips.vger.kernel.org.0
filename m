Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB73345E34
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 13:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCWMcd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 08:32:33 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:37486 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhCWMcR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 08:32:17 -0400
Received: by mail-vs1-f50.google.com with SMTP id e5so9282929vse.4;
        Tue, 23 Mar 2021 05:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/n92Wbn0qJjilMmaDstUQG+KETCJi+FSanE/27jeUcU=;
        b=FXRJblvz1LmaBNKoJW7X0R6pEnmCk/EI1xAmrislZySpUl02mkHjXmusMd36zD4KI3
         R9TS9GvYz5f9OcICVtLih6eh0u6g54TgcoGjwQmunlSdzpYN2dqi999Zq/Hcaw7ECBIL
         88G0qJn5H2bimOqXi1NOCi4RJuqd0z0pvQN0M8n9U9qz940Zpv82Q5HbWJpE4LlrscHc
         GDr+S5hG5A89l0IDGttcG5hw0rf41cP4F27DOIJkVnzZiw9QRgI1fN3LEJf7nydNKweB
         /OoaF5EJzRPczelckYGs6CJo6feWgfQRYBwcQtRrL6Ky56nHkmV/VQBVFOAQxbklQPmK
         sefQ==
X-Gm-Message-State: AOAM531a5BgEhgahag9NFiX3w5c/6ffk9s+JWHFuwii4QyAeMZyQeH4+
        GS2hp5mRS22IMcmBuS/GS5x4JUPCz04My4RIr8vTzsDnXO8=
X-Google-Smtp-Source: ABdhPJxa2mXmL5vZZaYz4OXxJkkIWWNKPbKe1q6dRGDfFeuouh63wzE38xwPBiJok5HvU7B98lLBwIWyKGn7KijUCB0=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr3249602vsr.40.1616502735157;
 Tue, 23 Mar 2021 05:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-18-geert@linux-m68k.org> <543ec200931af3192541fef51bc8e96a@protonic.nl>
In-Reply-To: <543ec200931af3192541fef51bc8e96a@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Mar 2021 13:32:03 +0100
Message-ID: <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com>
Subject: Re: [PATCH 17/17] auxdisplay: ht16k33: Add segment display LED support
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CC linux-leds (which I intended, but forgot to add)

cover letter at
https://lore.kernel.org/linux-devicetree/20210322144848.1065067-1-geert@linux-m68k.org/

On Tue, Mar 23, 2021 at 11:08 AM Robin van der Gracht <robin@protonic.nl> wrote:
>
> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > Instantiate a single LED for a segment display.  This allows the user
> > to
> > control display brightness and blinking through the LED class API and
> > triggers, and exposes the display color.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > For setting display brightness, this could use the existing backlight
> > support for frame buffer devices instantiated for dot-matrix displays.
> > However, using the leds subsystem instead has the advantage that the
> > driver can make use of the HT16K33's hardware blinking support, and can
> > expose the display color.
> > ---
> >  drivers/auxdisplay/ht16k33.c | 81 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 77 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/auxdisplay/ht16k33.c
> > b/drivers/auxdisplay/ht16k33.c
> > index 0b502a6039f89c6b..5821addd9aec5633 100644
> > --- a/drivers/auxdisplay/ht16k33.c
> > +++ b/drivers/auxdisplay/ht16k33.c
> > @@ -29,6 +29,7 @@
> >  #include <asm/unaligned.h>
> >
> >  #include "line-display.h"
> > +#include "../leds/leds.h"            /* for led_colors[] */
> >
> >  /* Registers */
> >  #define REG_SYSTEM_SETUP             0x20
> > @@ -36,6 +37,10 @@
> >
> >  #define REG_DISPLAY_SETUP            0x80
> >  #define REG_DISPLAY_SETUP_ON         BIT(0)
> > +#define REG_DISPLAY_SETUP_BLINK_OFF  (0 << 1)
> > +#define REG_DISPLAY_SETUP_BLINK_2HZ  (1 << 1)
> > +#define REG_DISPLAY_SETUP_BLINK_1HZ  (2 << 1)
> > +#define REG_DISPLAY_SETUP_BLINK_0HZ5 (3 << 1)
> >
> >  #define REG_ROWINT_SET                       0xA0
> >  #define REG_ROWINT_SET_INT_EN                BIT(0)
> > @@ -57,6 +62,8 @@
> >  #define BYTES_PER_ROW                (HT16K33_MATRIX_LED_MAX_ROWS / 8)
> >  #define HT16K33_FB_SIZE              (HT16K33_MATRIX_LED_MAX_COLS * BYTES_PER_ROW)
> >
> > +#define COLOR_DEFAULT                LED_COLOR_ID_RED
> > +
> >  enum display_type {
> >       DISP_MATRIX = 0,
> >       DISP_QUAD_7SEG,
> > @@ -85,6 +92,7 @@ struct ht16k33_fbdev {
> >
> >  struct ht16k33_seg {
> >       struct linedisp linedisp;
> > +     struct led_classdev led;
> >       union {
> >               struct seg7_conversion_map seg7;
> >               struct seg14_conversion_map seg14;
> > @@ -102,6 +110,7 @@ struct ht16k33_priv {
> >               struct ht16k33_seg seg;
> >       };
> >       enum display_type type;
> > +     uint8_t blink;
> >  };
> >
> >  static const struct fb_fix_screeninfo ht16k33_fb_fix = {
> > @@ -160,7 +169,7 @@ static DEVICE_ATTR(map_seg14, 0644, map_seg_show,
> > map_seg_store);
> >
> >  static int ht16k33_display_on(struct ht16k33_priv *priv)
> >  {
> > -     uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
> > +     uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
> > priv->blink;
> >
> >       return i2c_smbus_write_byte(priv->client, data);
> >  }
> > @@ -175,8 +184,11 @@ static int ht16k33_brightness_set(struct
> > ht16k33_priv *priv,
> >  {
> >       int error;
> >
> > -     if (brightness == 0)
> > +     if (brightness == 0) {
> > +             // Disable blink mode
> > +             priv->blink = REG_DISPLAY_SETUP_BLINK_OFF;
> >               return ht16k33_display_off(priv);
> > +     }
> >
> >       error = ht16k33_display_on(priv);
> >       if (error)
> > @@ -186,6 +198,49 @@ static int ht16k33_brightness_set(struct
> > ht16k33_priv *priv,
> >                                   REG_BRIGHTNESS | (brightness - 1));
> >  }
> >
> > +static int ht16k33_brightness_set_blocking(struct led_classdev
> > *led_cdev,
> > +                                        enum led_brightness brightness)
> > +{
> > +     struct ht16k33_priv *priv = container_of(led_cdev, struct
> > ht16k33_priv,
> > +                                              seg.led);
> > +
> > +     return ht16k33_brightness_set(priv, brightness);
> > +}
> > +
> > +static int ht16k33_blink_set(struct led_classdev *led_cdev,
> > +                          unsigned long *delay_on, unsigned long *delay_off)
> > +{
> > +     struct ht16k33_priv *priv = container_of(led_cdev, struct
> > ht16k33_priv,
> > +                                              seg.led);
> > +     unsigned int delay;
> > +     uint8_t blink;
> > +     int error;
> > +
> > +     if (!*delay_on && !*delay_off) {
> > +             blink = REG_DISPLAY_SETUP_BLINK_1HZ;
> > +             delay = 1000;
> > +     } else if (*delay_on <= 750) {
> > +             blink = REG_DISPLAY_SETUP_BLINK_2HZ;
> > +             delay = 500;
> > +     } else if (*delay_on <= 1500) {
> > +             blink = REG_DISPLAY_SETUP_BLINK_1HZ;
> > +             delay = 1000;
> > +     } else {
> > +             blink = REG_DISPLAY_SETUP_BLINK_0HZ5;
> > +             delay = 2000;
> > +     }
> > +
> > +     error = i2c_smbus_write_byte(priv->client,
> > +                                  REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
> > +                                  blink);
> > +     if (error)
> > +             return error;
> > +
> > +     priv->blink = blink;
> > +     *delay_on = *delay_off = delay;
> > +     return 0;
> > +}
> > +
> >  static void ht16k33_fb_queue(struct ht16k33_priv *priv)
> >  {
> >       struct ht16k33_fbdev *fbdev = &priv->fbdev;
> > @@ -578,11 +633,29 @@ static int ht16k33_fbdev_probe(struct i2c_client
> > *client,
> >  static int ht16k33_seg_probe(struct i2c_client *client,
> >                            struct ht16k33_priv *priv, uint32_t brightness)
> >  {
> > -     struct ht16k33_seg *seg = &priv->seg;
> >       struct device *dev = &client->dev;
> > +     struct device_node *node = dev->of_node;
> > +     struct ht16k33_seg *seg = &priv->seg;
> > +     u32 color = COLOR_DEFAULT;
> >       int err;
> >
> > -     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > +     of_property_read_u32(node, "color", &color);
> > +     seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> > +                     DRIVER_NAME ":%s:" LED_FUNCTION_BACKLIGHT,
> > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : "");
> > +     seg->led.brightness_set_blocking = ht16k33_brightness_set_blocking;
> > +     seg->led.blink_set = ht16k33_blink_set;
> > +     seg->led.flags = LED_CORE_SUSPENDRESUME;
> > +     seg->led.brightness = brightness;
> > +     seg->led.max_brightness = MAX_BRIGHTNESS;
> > +
> > +     err = devm_led_classdev_register(dev, &seg->led);
> > +     if (err) {
> > +             dev_err(dev, "Failed to register LED\n");
> > +             return err;
> > +     }
> > +
> > +     err = ht16k33_brightness_set(priv, seg->led.brightness);
> >       if (err)
> >               return err;
>
> The LED class can pretty much do what the backlight class can and more.
>
> Maybe we can stop registering a backlight device in the fbdev case and
> register a led device for both. This makes the code cleaner and drops
> a dependency but will break backwards compatibility.
>
> I'd prefer a single solution that covers both use cases, but I'm not
> sure about the 'breaking backwards compatibility' consequence...
>
> Groetjes / Kind regards,
> Robin van der Gracht
