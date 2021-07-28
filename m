Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B503D88FC
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jul 2021 09:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbhG1Hj3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jul 2021 03:39:29 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:33674 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbhG1Hj3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Jul 2021 03:39:29 -0400
Received: by mail-vk1-f174.google.com with SMTP id x16so285157vkn.0;
        Wed, 28 Jul 2021 00:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IIoR0x4c4qkCDM5zeSgEYpx5IiIPuyajsBO/z2pOlTw=;
        b=IBlHOBu1zg/Dhv5/Cypb+OLy2iT2ldzdg8eSv2NGtP3IvElOwD7zm67f/HViHm93yY
         Hp/193A6PR6RoYNLqLPrNiUt5La5Y6Z2p8nsnN0ascK83N1+Sz6h0ZSCWuU/I6ZHerPi
         TN2tqKFKxS/6DVz8LjJUqFjMbf4+ruy7fkZzJFDCRen0j8V8S3LJ4ToQVkBTWZ/jGQ1P
         rSWbHBaqd0nmANMznDggtLlkPOMnG10IW3oGngAzLl3F+XHDFVGyo0AXnNRNw2/Z8Utt
         GiV2b50vUv1PpaW/84Y/8zlLT2FyNgZsvecZPAwGWsSvVR0RlNqEy7z5LA53yn3l0KKy
         H0rQ==
X-Gm-Message-State: AOAM532XU0cKtsk2gnQPR6TRbGBzjOvOG2ZZB9DKz7JAQS8OWFXWpMe8
        ktG6GPWbS9ERD3RuqtKjnBP9LUoh89gP+JYH3lPspJ+yzLmrRQ==
X-Google-Smtp-Source: ABdhPJz/5pLBCjc+p711ENZhvHSZU+IUCvQRJEKJrih5Ip3PM93F2NaMQ+bYAL2mWIvoL1pPMwxiVTl3BXQ67qFvv8U=
X-Received: by 2002:ac5:c956:: with SMTP id s22mr17827118vkm.2.1627457966456;
 Wed, 28 Jul 2021 00:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210727140459.3767788-1-geert@linux-m68k.org>
 <20210727140459.3767788-20-geert@linux-m68k.org> <5b70f272-eec9-0ff7-1bd2-bf1659b10e9c@infradead.org>
In-Reply-To: <5b70f272-eec9-0ff7-1bd2-bf1659b10e9c@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Jul 2021 09:39:15 +0200
Message-ID: <CAMuHMdVdB3spJxZ5QVdSV0j8ZxNSZDjcX5B_kGitxyLLdyCwLg@mail.gmail.com>
Subject: Re: [PATCH v4 19/19] auxdisplay: ht16k33: Add LED support
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Randy,

On Tue, Jul 27, 2021 at 11:05 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 7/27/21 7:04 AM, Geert Uytterhoeven wrote:
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
> > ---
> > v4:
> >   - Add missing select LEDS_CLASS,

> Since LEDS_CLASS depends on NEW_LEDS, does this also need to
> select NEW_LEDS?

Right, I missed that.  It needs to select both NEW_LEDS and LED_CLASS.
Do I need to resend the whole series, or can this be fixed while
applying?

> and similar for INPUT_MATRIXKMAP: it depends on INPUT.

HT16K33 already depends on INPUT.

> However, selecting (enabling) an entire subsystem is not a
> preferable thing to do.

Unfortunately we have no choice, unless we untangle the depends/select
web first:

HT16K33 depends on NEW_LEDS, select LEDS_CLASS:

    drivers/leds/Kconfig:9:error: recursive dependency detected!
    drivers/leds/Kconfig:9:     symbol NEW_LEDS is selected by SENSORS_APPLESMC
    drivers/hwmon/Kconfig:324:  symbol SENSORS_APPLESMC depends on HWMON
    drivers/hwmon/Kconfig:6:    symbol HWMON is selected by EEEPC_LAPTOP
    drivers/platform/x86/Kconfig:305:   symbol EEEPC_LAPTOP depends on
ACPI_VIDEO

HT16K33 depends on LEDS_CLASS:

    drivers/leds/Kconfig:17:error: recursive dependency detected!
    drivers/leds/Kconfig:17:    symbol LEDS_CLASS depends on NEW_LEDS
    drivers/leds/Kconfig:9:     symbol NEW_LEDS is selected by SENSORS_APPLESMC
    drivers/hwmon/Kconfig:324:  symbol SENSORS_APPLESMC depends on HWMON
    drivers/hwmon/Kconfig:6:    symbol HWMON is selected by EEEPC_LAPTOP
    drivers/platform/x86/Kconfig:305:   symbol EEEPC_LAPTOP depends on
ACPI_VIDEO

> > --- a/drivers/auxdisplay/Kconfig
> > +++ b/drivers/auxdisplay/Kconfig
> > @@ -176,6 +176,7 @@ config HT16K33
> >       select FB_SYS_IMAGEBLIT
> >       select INPUT_MATRIXKMAP
> >       select FB_BACKLIGHT
> > +     select LEDS_CLASS
> >       select LINEDISP
> >       help
> >         Say yes here to add support for Holtek HT16K33, RAM mapping 16*8

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
