Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF7F3B5B25
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 11:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhF1JXr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 05:23:47 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:45947 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhF1JXp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 05:23:45 -0400
Received: by mail-ua1-f43.google.com with SMTP id c20so6697964uar.12;
        Mon, 28 Jun 2021 02:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dXsC1+zSEMlM+supXspj2457/hPp3B45hOkYONeY4Is=;
        b=qrlxOug0ayMiXxP6fNYsRw65CzLYZE8opNHhx7tkFdA51EV6N6HyfE8IkQHSkEAZQL
         bITGs/iWMSMCHrBwO6Wwg5SVbCwWId5CzRNu/BJi4k3hvKwzREMRIv5jOl53cwk3OW5x
         O7UKkK4yjG7pgmXBoX5PrIiu075Mg26prnd8aCnJRzZMZxTT/yyq8IDztatQ8x390mf4
         EEZUiuX848HVIs8cyhIqfc4jQBtpJQdyYljyboDMee36LHbaY2WZnTh86VS9rXn0jMHT
         jHkurXLyOC8XexUSwohP71bQdpzjVHwlgZvyxD2FQQrNCCmIxckqtwwU9JvSEDJ2HmqP
         kUhg==
X-Gm-Message-State: AOAM53198+mg2uEDO/vr35w8jdkveYFyBSqslywTVN6p+XL9+DkDljNF
        ig7ZychkP9WC3VRNSSlsYQZqI+GzXGQTL+Fvt0M=
X-Google-Smtp-Source: ABdhPJyvpSl9Lwa3c1/yfWiKIw+V+kX10XFZlBG4/WXiv2OELPvofLcRPso0QjEiBSE6oMrTBkS+lP9yf990+QbGfeo=
X-Received: by 2002:ab0:647:: with SMTP id f65mr19373178uaf.4.1624872079635;
 Mon, 28 Jun 2021 02:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-19-geert@linux-m68k.org> <20210625223916.7e00e710@thinkpad>
 <20210625224001.115c938a@thinkpad>
In-Reply-To: <20210625224001.115c938a@thinkpad>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 11:21:08 +0200
Message-ID: <CAMuHMdXYLkoS7hTi1OZx7PMSCcfAR9YviJMN-x_dWpbz5KW+JA@mail.gmail.com>
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

On Fri, Jun 25, 2021 at 10:40 PM Marek Behun <marek.behun@nic.cz> wrote:
> On Fri, 25 Jun 2021 22:39:16 +0200
> Marek Behun <marek.behun@nic.cz> wrote:
> > On Fri, 25 Jun 2021 14:59:02 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > Instantiate a single LED for a segment display.  This allows the user to
> > > control display brightness and blinking through the LED class API and
> > > triggers, and exposes the display color.
> > > The LED will be named "auxdisplay:<color>:backlight".
> >
> > What if there are multiple "auxdisplay"s ?
> > Doesn't this subsystem have IDs? So that you can use auxdisplayN for
> > device name, for example?
>
> Or if this driver creates a fbdev, maybe "fb<N>" for devicename?

This LED device is only registered when using the HT16K33 to drive
segment displays.
When driving a dot matrix display, the driver still use fbdev and
devm_backlight_device_register(), for backwards compatibility.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
