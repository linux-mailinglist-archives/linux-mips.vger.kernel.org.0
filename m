Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC301910D9
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 16:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfHQOmY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 10:42:24 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33050 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQOmY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Aug 2019 10:42:24 -0400
Received: by mail-ot1-f66.google.com with SMTP id q20so11445941otl.0;
        Sat, 17 Aug 2019 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+ouuMQrNVti/jSM5pYCBsXYcjd9f+fOqg85jip3rp8=;
        b=UWWveDzaXrnRWzm77yDCOLyoGFGeMfwlcrcoDAlg+n2BRt2WEWB+dpBiXK97kiEVRW
         YLslFXHdVfC/GFkbxBh6Gdu+SWw8331QjQC4zEte152sB0ESTXRTCOUbwt/2NLDYtOKx
         8x4YttqP2cffWMMb59Y5HOAWsDO97/1519Du2PTbYAKeCg14TS/QiD6i9PDXlLQWNvXR
         6kslMkAzXMm9HtWfEnB4f0gVx6gPQn57wPLjuujlARLCoOugYV8BGr1cOT43lj9FNhae
         QlaM/ig6tXqy2Ch72M9GC//cNQXpQ6crg3hfg3Q0rHRMqQ/FIk0B3+y5YmIQCpkT+Wi1
         GWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+ouuMQrNVti/jSM5pYCBsXYcjd9f+fOqg85jip3rp8=;
        b=VkoUw6yaygih1gnIuD+w142Wc52KdPj/pYd/8kXL0vILO6afv1lyvmql/PiTjw2+Ux
         t1QVgqlghUUvc7Yvpuo4AYCChXA5eCKTXtewnkWAXg6/udfesnXlwqbQWjtIY6x75zq+
         PRBa9KNY9OJJPPWjeyMIMbpHnW8wB/wxuclDeZnioEOTMYRgqEaP2Ad0bUfLXPoSgy8S
         aKn0w+xDEPY7rB1qRFqDcuVLHvb7iHcXsjHdj5eErVHtTBMYZWKbSRpYjmg3XD94aVUz
         YJDUBOE4m5JLiNsdh50xyUXqIdQvaYzg2yeaILt2+OxamPSbWFp5+/T/5B10nVBOqA63
         S3GQ==
X-Gm-Message-State: APjAAAWzOO9QVJNl8CQ52xPKSENAPVDiXouy2xQxdo8Hu7FhzMyR3WQ9
        tmlXNksdDi8PjXrbwDjIM3JvTtZZFK1KKODJDRg=
X-Google-Smtp-Source: APXvYqz5ceM2JCDDDSIcgUhj8lMv5v0FOmMnXg2IeO6sSggcznPDuJampGWaCUwiZ5tB3C/ohH295tN+dd8XvA8ef8o=
X-Received: by 2002:a05:6830:1592:: with SMTP id i18mr5384197otr.86.1566052943046;
 Sat, 17 Aug 2019 07:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus>
In-Reply-To: <20190813155143.GA19830@bogus>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sat, 17 Aug 2019 22:42:12 +0800
Message-ID: <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Tue, Aug 13, 2019 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
> [...]
> > +Example:
> > +     pll {
> > +             compatible = "mediatek,mt7621-pll";
>
> You didn't answer Stephen's question on v1.

I thought he was asking why there's a syscon in compatible string. I
noticed that the syscon in my previous patch is a copy-paste error
from elsewhere and dropped it.

>
> Based on this binding, there is no way to control/program the PLL. Is
> this part of some IP block?

The entire section is called "system control" in datasheet and is
occupied in arch/mips/ralink/mt7621.c [0]
Two clocks provided here is determined by reading some read-only
registers in this part.
There's another register in this section providing clock gates for
every peripherals, but MTK doesn't provide a clock plan in their
datasheet. I can't determine corresponding clock frequencies for every
peripherals, thus unable to write a working clock driver.

>
> > +
> > +             #clock-cells = <1>;
> > +             clock-output-names = "cpu", "bus";
> > +     };
> > --
> > 2.21.0
> >

Regards,
Chuanhong Guo

[0] https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt7621.c#L156
