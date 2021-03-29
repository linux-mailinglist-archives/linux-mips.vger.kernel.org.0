Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC0D34C4AE
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 09:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhC2HPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 03:15:46 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:38421 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhC2HPV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Mar 2021 03:15:21 -0400
Received: by mail-vs1-f44.google.com with SMTP id r12so2281518vsj.5;
        Mon, 29 Mar 2021 00:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+Y1qLkJ0VZf/i1XHHe8V+cBjsex9rRaMaM82dXviM4=;
        b=ti8jf8t71IdVMHBQSRgBrvsDMAnfS3OFfdQuUNP2/nLWeK0b68NWNR0kutyDsiL48X
         HiLGmlrJcI2OnrrpdI0YuGa+/yJUCB8c8f3FDJpPTbDo2pZz+Q0mOIyxNgljx9KDQtog
         P9L9D5gbVVqeHnhcimhmAaMhUt3AD74zcWog7O80B7AY3g92o7tS8WnH3YHQs0Wsq8f3
         WUBDxwFlaUMmEvrCYaZ4kR6zuWDtWr2m8tMIpOEpMnaTl2L+v8C89zVMrs0eOSmxl6CT
         REGG+GDfKdutuzqINPBye+JZHjj4YPV1EQzPcTX46Kse2jFJlYM58OxqiU7im3TuFYf9
         G9DA==
X-Gm-Message-State: AOAM532kBEvW5XMWhbZM2wEkxJRlH3hZpgzfhK+Q6I9M9IF/gizM29FV
        fW4tfuA62M/f8QyanrfQvMR84HICOwzuZZgA5xS/6ymM
X-Google-Smtp-Source: ABdhPJyGEYd+Q49zYMlQ9mf1eQCEc+DZYIpnEMkPvYFXBxBNcExj7l3rm+tPGvIUCTs8h3guIJh/RY+hb+rv38ipfV0=
X-Received: by 2002:a67:1ac7:: with SMTP id a190mr8074891vsa.18.1617002120644;
 Mon, 29 Mar 2021 00:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-17-geert@linux-m68k.org> <2868cd091dc6ff0cab14b5da07f89984@protonic.nl>
In-Reply-To: <2868cd091dc6ff0cab14b5da07f89984@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Mar 2021 09:15:09 +0200
Message-ID: <CAMuHMdXJV3duE=uhCD3XSVn35Y5=iafOOUu5_57-1TtW062ZJg@mail.gmail.com>
Subject: Re: [PATCH 16/17] auxdisplay: ht16k33: Add support for segment displays
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hoi Robin,

On Mon, Mar 29, 2021 at 9:09 AM Robin van der Gracht <robin@protonic.nl> wrote:
> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > The Holtek HT16K33 LED controller is not only used for driving
> > dot-matrix displays, but also for driving segment displays.
> >
> > Add support for 4-digit 7-segment and quad 14-segment alphanumeric
> > displays, like the Adafruit 7-segment and 14-segment display backpack
> > and FeatherWing expansion boards.  Use the character line display core
> > support to display a message, which will be scrolled if it doesn't fit.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > The 7-segment support is based on schematics, and untested on actual
> > hardware.
> > ---
> >  drivers/auxdisplay/ht16k33.c | 198 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 191 insertions(+), 7 deletions(-)
> >
> ...
> >
> > +static int ht16k33_seg_probe(struct i2c_client *client,
> > +                          struct ht16k33_priv *priv, uint32_t brightness)
> > +{
> > +     struct ht16k33_seg *seg = &priv->seg;
> > +     struct device *dev = &client->dev;
> > +     int err;
> > +
> > +     err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > +     if (err)
> > +             return err;
> > +
> > +     switch (priv->type) {
> > +     case DISP_MATRIX:
> > +             /* not handled here */
> > +             break;
>
> This 'case' shouldn't happen. Having said that, the break here will
> still
> cause the linedisp_register() function to be called for the DISP_MATRIX
> type.
> If you'd like to handle this case, a return (or setting 'err') should
> prevent this.

This function is never called if priv->type == DISP_MATRIX, so this
cannot happen.  However, gcc complains if not all enum values are
handled in a switch() statement, hence the dummy case.

Is there a better way to handle this?

> > +     case DISP_QUAD_7SEG:
> > +             INIT_DELAYED_WORK(&priv->work, ht16k33_seg7_update);
> > +             seg->map.seg7 = initial_map_seg7;
> > +             seg->map_size = sizeof(seg->map.seg7);
> > +             err = device_create_file(dev, &dev_attr_map_seg7);
> > +             break;
> > +
> > +     case DISP_QUAD_14SEG:
> > +             INIT_DELAYED_WORK(&priv->work, ht16k33_seg14_update);
> > +             seg->map.seg14 = initial_map_seg14;
> > +             seg->map_size = sizeof(seg->map.seg14);
> > +             err = device_create_file(dev, &dev_attr_map_seg14);
> > +             break;
> > +     }
> > +     if (err)
> > +             return err;
> > +
> > +     err = linedisp_register(&seg->linedisp, dev, 4, seg->curr,
> > +                             ht16k33_linedisp_update);
> > +     if (err)
> > +             goto err_remove_map_file;
> > +
> > +     return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
