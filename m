Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642B891429
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 04:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHRC3l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 22:29:41 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41690 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfHRC3l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Aug 2019 22:29:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id g7so7459366oia.8;
        Sat, 17 Aug 2019 19:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Epy/wiFdMahX+RcrO6BylN4SVEqUlDpp4VHq8uy62L8=;
        b=CW3drVPLLqonFPNLRtQRlHJk3CvJCBF10ngKwEO2lvD/+AgY+xETP3TTv1BsSYpBju
         CRRKhcHLUli8oBCxhgvkmuQcOFJ9+NJNf/jR9MNiDHQ3840tjdPrHnS3FNloeYUcY0JH
         hrc1JE3FUgGtJ6+ueIh3Z0L6LhVcNWuxdC5LxtJyr9aXWdk84OG4K4BVYh2I9gN3Wz6L
         yCBsMpPtDI/AXny+iBCytakPEYy52T2htxPCp5qkEDS8qLPzHYGrAte/BMgubreVpWj/
         28kkXb1DDSzQPj3omc8QcuLk+Cg/4Wppibg6od+YcNmUSepCmnLAqUZbweCEFNo6dHzv
         duQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Epy/wiFdMahX+RcrO6BylN4SVEqUlDpp4VHq8uy62L8=;
        b=XXyMuAheCNeSseVbGLbSwmYu/Ih2fnQuo7hJlYg6oPjYmaDb90fZnxK7GxvaGBFMIh
         sTCVxCUYXkNYOWwOUdENW1foOEqO1gO4aCdkT++NeLxTGAftlt6Mcj4meGY38NTaOxcb
         jSU8FnOVIpqgJ2yc900hQ6rO4/oiNGYvSrRehi53PLhtljdPkJ6fE6jwga72/nKjsacs
         U4PPH4EHAtB/LDGzQJF0J1p89OxOF/vT4h/PWBACC4lwc0EOexcxvkeTiux2SXbEOKIW
         8rFgx3TiML4OSrGfHpmMGDqQa4+ITUfkGwyWlJjcEJSiLeKWE8jc4Lf01rxGnNS7jjjZ
         2uSQ==
X-Gm-Message-State: APjAAAWHvGepWnMXWhTxL9jG4FMcPG7VlTEdVuTHBE7Y3TlHQoO2gF5g
        Sf06ujjFxlY2nyrbIay0MYjPewb7LBY3HMkHOME=
X-Google-Smtp-Source: APXvYqwDnwZvJO1bQNNX2gziXRdvteTMHyC0n9PY9/2wekwt4q2j5TdudTm3N25tr8wrimRZr0WLEJ2JaTa6g8Kzbyg=
X-Received: by 2002:aca:df08:: with SMTP id w8mr9038674oig.84.1566095380102;
 Sat, 17 Aug 2019 19:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
In-Reply-To: <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 10:29:29 +0800
Message-ID: <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
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

On Sun, Aug 18, 2019 at 2:06 AM Oleksij Rempel <linux@rempel-privat.de> wrote:
> >> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to enable or disable clocks.
> >> Jist wild assumption. All peripheral devices are suing bus clock.
> >
> > This assumption is incorrect. When this patchset is applied in
> > OpenWrt, I asked the author why there's still a fixed clock in
> > mt7621.dtsi, He told me that there's another clock for those unchanged
> > peripherals and he doesn't have time to write a clock provider for it.
>
> Can you please provide a link to this patch or email.

This discussion is in Chinese and using an IM software so there's no
link available.

> We have at least 2 know registers:
> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> all or some ip cores.
> What is probably missing is a set of dividers for
> each ip core. From your words it is not document.

The specific missing part I was referring to, is parent clocks for
every gates. I'm not going to assume this with current openwrt device
tree because some peripherals doesn't have a clock binding at all or
have a dummy one there.

>
> With this information the clk driver will provide gate functionality and
> a set of hardcoded clocks. With this driver will work part of power
> management and nice devicetree without fixed clocks.

Regards,
Chuanhong Guo
