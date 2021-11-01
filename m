Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05151441F4C
	for <lists+linux-mips@lfdr.de>; Mon,  1 Nov 2021 18:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhKARbl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Nov 2021 13:31:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230246AbhKARbd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Nov 2021 13:31:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2AA6108F;
        Mon,  1 Nov 2021 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635787739;
        bh=2cJQ0z+eLg6oK6BPQeDhyJnQMwy8kofAHvVb19izHF4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KmjWI6zQF6+Xx/MxkR5vHWVocTw2Xf4m1SqOOf8wv/J8BkEwEONNA+OVpiSXE03oW
         4exKX9Wcaf/eK6gr8QsQ0hY0e/X92veHhmwxSciBq0avm7V65GyPUI+ZQw46pVKOpw
         fHiyKSWBdt65MEO4p+3KicsKMUmMdfJn2hSi7teyJWvUUOuLpzXSkcXYMmfcTaqj4t
         MspcEyj4V16VbIxnP7KfACunaD3g6Xr3yo8LPM+KvdamDbCFE3mhM0EPE2CAo90w9F
         hYPGvp7+rUnslDzuYLgpVVMBdz27eQsrwDqmUrlA4ihhAB5aBT7jlSSvjWZFeDnReQ
         +lEmBuaxC8A4Q==
Received: by mail-ed1-f41.google.com with SMTP id g10so66497865edj.1;
        Mon, 01 Nov 2021 10:28:59 -0700 (PDT)
X-Gm-Message-State: AOAM5320GakIFIbl63nYct8clDRR+cOPL0rW5O4NVaNfj/E4w6YSKX55
        O9mgDk5Zz5Z0LECEqMCZjSuHnyUqawa65dU6fQ==
X-Google-Smtp-Source: ABdhPJzkwoHospvWPt75rQ9pj3Q9ByRQ+4JTXMeqeD/nsnG4kv3oJZ2NTVWtriGCZu4WdnuCkBVl/I7sTIJhXcJO/UY=
X-Received: by 2002:a05:6402:84d:: with SMTP id b13mr43627187edz.6.1635787737776;
 Mon, 01 Nov 2021 10:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211028093059.32535-1-zajec5@gmail.com> <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com> <9d57d026-19f3-e92d-4c02-d7e8e2c2bc25@gmail.com>
 <YXvxMHmx2i56sXdI@robh.at.kernel.org> <1df7e7cd-aa4c-c692-ff7f-8ee27780a6a9@gmail.com>
In-Reply-To: <1df7e7cd-aa4c-c692-ff7f-8ee27780a6a9@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 1 Nov 2021 12:28:45 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+sXqhxriDCrpWXrWTFoTi6zqQATyPfqZ2d9-H-smC-Qg@mail.gmail.com>
Message-ID: <CAL_Jsq+sXqhxriDCrpWXrWTFoTi6zqQATyPfqZ2d9-H-smC-Qg@mail.gmail.com>
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 29, 2021 at 11:45 AM Florian Fainelli <f.fainelli@gmail.com> wr=
ote:
>
> On 10/29/21 6:03 AM, Rob Herring wrote:
> > On Fri, Oct 29, 2021 at 01:39:02PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> >> [Rob: please kindly comment on this]
> >>
> >> On 28.10.2021 18:29, Florian Fainelli wrote:
> >>> On 10/28/21 2:30 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>>
> >>>> Hardware supported by this driver goes back to the old bcm63xx days.=
 It
> >>>> was then reused in BCM7038 and later also in BCM4908.
> >>>>
> >>>> Depending on SoC model registers layout differs a bit. This commit
> >>>> introduces support for per-chipset registers offsets & adds BCM4908
> >>>> layout.
> >>>>
> >>>> Later on BCM63xx SoCs support should be added too (probably as platf=
orm
> >>>> devices due to missing DT). Eventually this driver should replace
> >>>> bcm63xx_wdt.c.
> >>>>
> >>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>> ---
> >>>
> >>> [snip]
> >>>
> >>>> +
> >>>> +static const u16 bcm7038_wdt_regs_bcm4908[] =3D {
> >>>> +  [BCM63XX_WDT_REG_DEFVAL]        =3D 0x28,
> >>>> +  [BCM63XX_WDT_REG_CTL]           =3D 0x2c,
> >>>> +  [BCM63XX_WDT_REG_SOFTRESET]     =3D 0x34,
> >>>
> >>> I don't understand what you are doing here and why you are not
> >>> offsetting the "reg" property appropriately when you create your
> >>> bcm4908-wdt Device Tree node such that the base starts at 0, and the
> >>> existing driver becomes usable as-is. This does not make any sense to=
 me
> >>> when it is obviously the simplest way to make the driver "accept" the
> >>> resource being passed.
> >>
> >> I believe that DT binding should cover the whole hardware block and
> >> describe it (here: use proper compatible to allow recognizing block
> >> variant).
> >>
> >> That's because (as far as I understand) DT should be used to describe
> >> hardware as closely as possible. I think it shouldn't be adjusted to
> >> make mapping match Linux's driver implementation.
> >>
> >>
> >> So if:
> >> 1. Hardware block is mapped at 0xff800400
> >> 2. It has interesting registers at 0xff800428 and 0xff80042c
> >>
> >> I think mapping should use:
> >> reg =3D <0xff800400 0x3c>;
> >> even if we don't use the first N registers.
> >>
> >> That way, at some point, you can extend Linux (or whatever) driver to
> >> use extra registers without reworking the whole binding. That's why I
> >> think we need to map whole hardware block & handle different registers
> >> layouts in a driver.
> >
> > Yes, that's the correct thing to do.
>
> So in the future if we happen to want to manage the hardware timers in
> that block, they would be part of the watchdog driver? I am fairly sure
> they won't be, so you will be creating a composite driver/MFD to
> separate out the functions, more likely. So you might as well create
> sub-nodes.

There is no requirement that an MFD have child nodes. They are done
both ways. If you need some internal kernel restructuring, then I
don't care (as DT maintainer).

We very commonly have a single node that's both clock and reset
provider for example. It's primarily when the sub blocks consume
different DT resources that you need sub-nodes.

> > The question is whether you'd need sub nodes for the other functions.
> > Folks tend to want to have sub nodes for convenience which isn't really
> > needed and then requires a DT update ('cause they add nodes as adding
> > drivers).
>
> Sorry but not, this is getting completely ridiculous, the

Huh?

>
> >
> > Based on the registers, you really don't need sub nodes here.
>
> I sort of disagree here, the watchdog is a part of a sundry timer block
> here, but it is logically broken up into different parts and if if I
> were to imagine how this would map into different drivers, I can easily
> see that we would have:
>
> - a driver to manage the timer interrupt controller
> - a driver to manage each of the 3 hardware timers, be they clockevent
> or else
> - a driver to manage the watchdog

You know the h/w better than me. I was giving my opinion based only on
the limited information presented.

> The simplest way to get there, and also because these same timer blocks
> are actually spread in other parts of STB chips just like the watchdog
> is, but in a different layout where they stand on their own was the main
> drive for defining the bcm7038_wdt binding the way it was.

A sub-block reused in different blocks is a decent reason for sub-nodes.

Most important for me is that the binding be complete and not have to
change in an incompatible way in the future. The more detailed you
make the binding, the harder it will be to get right. It's the same
reason we moved away from doing a clock per node for clock trees. So,
if you want child nodes, then you need to define all of them.

Rob
