Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7C73E8F77
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 13:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbhHKL3q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 11 Aug 2021 07:29:46 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:43569 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237210AbhHKL3m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 07:29:42 -0400
Received: by mail-vs1-f45.google.com with SMTP id s196so1240625vsc.10;
        Wed, 11 Aug 2021 04:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=40wisL4/SKjdMqbDzvwZrkyDfanri5aoKVnQRyWUuY0=;
        b=SyG6+XczyIGKkdTh4UR41xo5YbZc+ITtlXgZsw+I7R9zWx0YDIqWadUMBjDz1F9WBx
         6B++eWQDkkBRTwSNCRJUuVjSdXO6XOv1eixJFAiivX8K7gGA7Q8xzctv9xnHX9UvaiLD
         o1GNzDsw+mjumXC99nphkWAQpzPWgQZXfJEKlxuIuRpspJTWMfD4HzH+PvPvOv8SwmoD
         oXGfcXRAYQrdLtGsfUQhemsBfC3a8WAx49scXrEseDo5thDJiyClflda/zuUoqbGU1pL
         q9BAWKt1GZC3wVxVmwQPItLMCrBZkaMqscsuSaq+/NBOUV7dy2lKLYccCDKxGPr/Puv6
         Ge/Q==
X-Gm-Message-State: AOAM533G4k4AwlQALJnnZow/MxtR0erk3C6vPZrTVm8XDMdulay5fT05
        ZU1zppPlQ8mK5ettEk0Dgeohe88pVSzKTVJ5amg=
X-Google-Smtp-Source: ABdhPJy4XrbkHkqk1N7n531OJu2JQkcYcvarSrfV7a1TjAP6AU3ROsnF7Eatvrj+CJP4HBfqYOWJdNPELnM5eP6VJV4=
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr25004885vsm.3.1628681358404;
 Wed, 11 Aug 2021 04:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210811095759.1281480-1-geert@linux-m68k.org>
 <20210811095759.1281480-20-geert@linux-m68k.org> <20210811124755.37b0a0a9@thinkpad>
In-Reply-To: <20210811124755.37b0a0a9@thinkpad>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 13:29:07 +0200
Message-ID: <CAMuHMdUFPvJBuFByiN6pb539REYtcsNJMKML+M2NQw=GJxTYJg@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] auxdisplay: ht16k33: Add LED support
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marek,

On Wed, Aug 11, 2021 at 12:48 PM Marek Behún <kabel@kernel.org> wrote:
> On Wed, 11 Aug 2021 11:57:59 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
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
>
> Reviewed-by: Marek Behún <kabel@kernel.org>

Thanks!

> BTW, this driver does not need to depend on OF, methinks.
> The few instances of properties reading can be
> easily rewritten to device_* functions (from include/linux/property.h).
> The of_get_child_by_name() can become device_get_named_child_node().
>
> Geert, what do you think?

Sure, that can be done later, when an ACPI user appears?
The dependency on OF was pre-existing, and this series is already
at v5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
