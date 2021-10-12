Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF4C42A7ED
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 17:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhJLPKh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 11:10:37 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34553 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJLPKh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 11:10:37 -0400
Received: by mail-ua1-f52.google.com with SMTP id h4so19148134uaw.1;
        Tue, 12 Oct 2021 08:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XLXN3xuVJOPHw5HRsxgIv5QkrLOCu749y9xpxhKV0I=;
        b=vhwsS8t3myfqtctpmEr/kYoGwR9fXtd4/EeW662Zm8QuRRx/KpifzFbmMPIU9Dqoga
         8GJ4W6uE+cx3EGruvWA3gT1pII1ZJOiOmtFpaqBtZR/nLpCU5VMVzrQQkt088m1fsCzA
         c2mNoPC6+vufjPZp1CkA6MFAPNKjDcPmCxVNYxg/E2/mqaYDysPI/d3BOXI/a6w4UFsp
         oA4YJGHmTqSWt5TAPZ/c7Qx7gmgG33J8UOEXBXfackVxyO13Ihg/dMCVYmNBeVLsOwop
         E8C0o1wXNYQC3QXNDDfXvOR/DEPpclMSgLICHzc2A/20BIt8I/HdmGwyjZ2Hxdr9ivKu
         lzrQ==
X-Gm-Message-State: AOAM5338ryK7zpD3fCwBT3pYf0o0Wi9V9z/2p2oksBFw1wON4ewCug/Q
        HW3xVZI5UCGgusLznFBX5eWeNaSIGhxJOG7h0yw=
X-Google-Smtp-Source: ABdhPJx2RXQoSzE3pVGjeyVKDiENolt+HF3oWRJaUKqTdpAr/yDbBfb7YrzLDlKtQtHEEvyxafjPhHIcAcktEVDfYpE=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr31833215vsl.9.1634051314899;
 Tue, 12 Oct 2021 08:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210914143835.511051-1-geert@linux-m68k.org> <20210914143835.511051-20-geert@linux-m68k.org>
 <4602a8e681db4d0ebc43e4dafee8c28e@protonic.nl> <CAMuHMdVOa8DAGJQpJ8AotARxfh9PvpskJJa6k48jE92-P+GLRA@mail.gmail.com>
 <bc1632943ecbb7e244b87c285501f706@protonic.nl>
In-Reply-To: <bc1632943ecbb7e244b87c285501f706@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Oct 2021 17:08:23 +0200
Message-ID: <CAMuHMdUrSpvVKPmi3EXvyKnDrq48Z5jvRY-a1kEoGSt2kS8J_Q@mail.gmail.com>
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
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hoi Robin,

On Mon, Oct 4, 2021 at 10:26 AM Robin van der Gracht <robin@protonic.nl> wrote:
> On 2021-10-01 17:51, Geert Uytterhoeven wrote:
> > On Thu, Sep 30, 2021 at 12:57 PM Robin van der Gracht <robin@protonic.nl>
> > wrote:
> >> On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> >> > Instantiate a single LED based on the "led" subnode in DT.
> >> > This allows the user to control display brightness and blinking (backed
> >> > by hardware support) through the LED class API and triggers, and exposes
> >> > the display color.  The LED will be named
> >> > "auxdisplay:<color>:<function>".
> >> >
> >> > When running in dot-matrix mode and if no "led" subnode is found, the
> >> > driver falls back to the traditional backlight mode, to preserve
> >> > backwards compatibility.
> >> >
> >> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> >> > +
> >> > +     err = devm_led_classdev_register_ext(dev, led, &init_data);
> >> > +     if (err)
> >> > +             dev_err(dev, "Failed to register LED\n");
> >>
> >> You might want to call ht16k33_brightness_set(priv, brightness) here to get
> >> a
> >> know value into the display setup register (0x80).
> >>
> >> Right now if I enable hardware blinking and (soft)reboot my board it keeps
> >> on
> >> blinking even after a re-probe.
> >
> > I don't have that issue.
> > Aha, ht16k33_seg_probe() calls ht16k33_brightness_set(), but
> > ht16k33_fbdev_probe() doesn't.  The latter should do that, too,
> > when not using backwards compatibility mode.
>
> Ack. I have hardware which uses the ht16k33 in dot matrix mode and I tested
> both the backlight and led setup. I ran into this with the fbdev + led setup.
>
> I noticed ht16k33_bl_update_status() is called in ht16k33_fbdev_probe()
> before the fbdev device is registered. Which is fine right now, but in theory
> the fbdev blank state can influence the backlight setting (nitpick since
> the fbdev device is unblanked by default).
>
> The point: Maybe ht16k33_brightness_set() (or ht16k33_bl_update_status() for
> backlight device) should be called in one central place (i.e at the end of
> the
> main probe function).

That would mean the main function need to know more about which mode
is being used, so I think it's better to leave it to the individual display
sub-drivers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
