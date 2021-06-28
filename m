Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5153B5B1F
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 11:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhF1JXn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 05:23:43 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:43673 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhF1JXl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 05:23:41 -0400
Received: by mail-ua1-f44.google.com with SMTP id f1so6698323uaj.10;
        Mon, 28 Jun 2021 02:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nz4gBHNnVTKqYWPORJVI9vqQQJHDi/JvYhL68Opd7n4=;
        b=IvFgFcalWBL7x6esMAIgxvDcOyn1d0HYuP8EfBdK6RZPIOq4ZtueVwcwyx8ir89Buw
         vH6VCkxDGeVUzpwsSNTumMx9gebCAPQWbrpRzUB5tXMh1vqT5zNRYMRb3U64GlkMPNm2
         JAGCpX1Yfri1xdRCIHb7BwZDW+5clm/AaQXGQC2fjHs0vnX43NUA6W4BeHY0C7vFQQAL
         Sx8eQGkTogPRK49aBX/b8ChiuS57AiVLM64iC351u7Gej0uEdJyfQ1Pk/bl0gGXHwbwg
         /l4RtMOTcsd3Ee8h42vyEaqvOplG/8haiWjCejltmMuPeu5lr3J/5IVoj9POZuQO2Lo/
         OofQ==
X-Gm-Message-State: AOAM530HFH6SR2VB4xGCyWNhcSTW47UhPWFBvfvAkws10WtsFML67DiO
        kRgTmVW82t9qVm2YjVHeF/Y+ThG2ULTzbFm8VklD3FUwjJvpVQ==
X-Google-Smtp-Source: ABdhPJxMSZ00u8nhN9dBzbg8ZSuzKnronkfo2nq+w8WeuwJk4V1l7/qdW7ZjN8RF8UMjOi8X44C61rRdzsx6XQG8kRo=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr19594260ual.2.1624872075339;
 Mon, 28 Jun 2021 02:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-19-geert@linux-m68k.org> <20210625223916.7e00e710@thinkpad>
In-Reply-To: <20210625223916.7e00e710@thinkpad>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 11:21:04 +0200
Message-ID: <CAMuHMdV5fywjF63MqE_SqfumwN3EY=jBTEiMfqbjFO12c_nj0Q@mail.gmail.com>
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

On Fri, Jun 25, 2021 at 10:39 PM Marek Behun <marek.behun@nic.cz> wrote:
> On Fri, 25 Jun 2021 14:59:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > Instantiate a single LED for a segment display.  This allows the user to
> > control display brightness and blinking through the LED class API and
> > triggers, and exposes the display color.
> > The LED will be named "auxdisplay:<color>:backlight".
>
> What if there are multiple "auxdisplay"s ?

I understand the LED core will just add a suffix on a name collision.

> Doesn't this subsystem have IDs? So that you can use auxdisplayN for
> device name, for example?

Auxdisplay does not have IDs, as there is no subsystem to register
with.  It's just a collection of drivers for auxiliary displays with
no common API.  Some drivers use fbdev, others use a chardev, or an
attribute file in sysfs.

BTW, I just followed Pavel's advice in naming.

> > +     of_property_read_u32(node, "color", &color);
> > +     seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
> > +                     "auxdisplay:%s:" LED_FUNCTION_BACKLIGHT,
> > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : "");
>
> If you use devm_led_classdev_register_ext and pass struct
> led_init_data, LED core will generate name of the LED itself.

Will that make any difference, except for adding more code?
Looking at the implementation, I still have to use devm_kasprintf()
to combine color and function for led_init_data.default_label?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
