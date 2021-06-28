Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C153B65C9
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbhF1Phv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 11:37:51 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:37624 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235341AbhF1PgW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 11:36:22 -0400
Received: by mail-vs1-f43.google.com with SMTP id x12so10260325vsp.4;
        Mon, 28 Jun 2021 08:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UdLRXPs8N+vjyTcpdNWjfwTJ6bwSxsrt/ayJbQ8pWUQ=;
        b=hmshMF02JCyDAC78Vr/QcFdPi0+DkMfbBRqCJcqlqHUKOKTuPLeDusXj7GEVF8onoR
         zZvjgDRUwqm85hOidEuswLqiJr2kuMYFIOOlkI5JEA6JpBJPZSzaYwZLc84tBfMHSqi/
         bz492X9DUvrexbC71ZV7BbDRczhAX8QUNrUUUyewW74hbtMtpOeKlJBD7Owgdsy/8udk
         FrAKYrPUUa9LK8PRJCavekt8SCEVvTDb0JMlSUT+Bc1Y/sGjJIYUa0bI75a5OVurVg1e
         RocFs2yBhm1AEF6PUql5VdCLHFWNPxOA9jtFZV1idga00FGuKZhAcndGnNqiBmG0eC92
         ooSA==
X-Gm-Message-State: AOAM533S+ZgQUHHg7Qmdqt8vAUNfm+UFmd8gKrMDNGgwaF7Pi/D8dU24
        Vh06XeQJh4ueJjRk1Pj06p8LAs9K5xt607jZd/A=
X-Google-Smtp-Source: ABdhPJwFoBJoPgZAWGd3kME/vgUlz573ZrtzS/NZWRieObafdUkejFkjnVCSEJpGJ51iZzkPkitBYVmSeXEAIlbE2u8=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr19184092vsn.40.1624894434798;
 Mon, 28 Jun 2021 08:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-19-geert@linux-m68k.org> <20210625223916.7e00e710@thinkpad>
 <CAMuHMdV5fywjF63MqE_SqfumwN3EY=jBTEiMfqbjFO12c_nj0Q@mail.gmail.com> <20210628121551.185ce0f4@thinkpad>
In-Reply-To: <20210628121551.185ce0f4@thinkpad>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 17:33:43 +0200
Message-ID: <CAMuHMdW=cBxDSNW3DzN1HQyRC1DNtoWDhVA3M0fQhRq-txmb6A@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] auxdisplay: ht16k33: Add segment display LED support
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marek,

On Mon, Jun 28, 2021 at 12:15 PM Marek Behun <marek.behun@nic.cz> wrote:
> On Mon, 28 Jun 2021 11:21:04 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Jun 25, 2021 at 10:39 PM Marek Behun <marek.behun@nic.cz> wrote:
> > > On Fri, 25 Jun 2021 14:59:02 +0200
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > > Instantiate a single LED for a segment display.  This allows the user to
> > > > control display brightness and blinking through the LED class API and
> > > > triggers, and exposes the display color.
> > > > The LED will be named "auxdisplay:<color>:backlight".
> > >
> > > What if there are multiple "auxdisplay"s ?
> >
> > I understand the LED core will just add a suffix on a name collision.
> >
> > > Doesn't this subsystem have IDs? So that you can use auxdisplayN for
> > > device name, for example?
> >
> > Auxdisplay does not have IDs, as there is no subsystem to register
> > with.  It's just a collection of drivers for auxiliary displays with
> > no common API.  Some drivers use fbdev, others use a chardev, or an
> > attribute file in sysfs.
> >
> > BTW, I just followed Pavel's advice in naming.
>
> Very well.
>
> > > > +     of_property_read_u32(node, "color", &color);
> > > > +     seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> > > > +                     "auxdisplay:%s:" LED_FUNCTION_BACKLIGHT,
> > > > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : "");
> > >
> > > If you use devm_led_classdev_register_ext and pass struct
> > > led_init_data, LED core will generate name of the LED itself.
> >
> > Will that make any difference, except for adding more code?
>
> You are hardcoding the backlight function. Using the _ext() registering
> function will make it so that the function and color are parsed from
> fwnode by LED core. I understand that the function will always be
> "backlight" in this case, but this should be specified in the
> device-tree anyway, so why not use it?
>
> > Looking at the implementation, I still have to use devm_kasprintf()
> > to combine color and function for led_init_data.default_label?
>
> AFAIK you don't have to fill in default_label. (If the needed OF
> properties are not present so that default_label is tried, it means the
> device-tree does not correctly specify the device. In that case I don't
> think it is a problem if the default_label is not present and LED
> core will use the OF node name as the LED name.)
>
> The code could look like this
>
>   struct led_init_data init_data = {};
>
>   init_data.fwnode = of_fwnode_handle(node);
>   init_data.devicename = "auxdisplay";
>   init_data.devname_mandatory = true;
>
>   ...register_ext();
>
> But if you still don't want to do this then ignore me :)

No, thanks a lot!

Your comments made me realize I should put the LED properties in an
"led" subnode, and defer all parsing to the LED core.
This also allows the user to use the more powerful LED mode even in
dot-matrix mode, while falling back to the existing backlight mode if
no "led" subnode is found, and thus preserving backwards compatibility.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
