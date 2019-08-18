Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC009160C
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 12:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfHRKHw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Aug 2019 06:07:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37145 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfHRKHw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Aug 2019 06:07:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id b25so3760779oib.4;
        Sun, 18 Aug 2019 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YkFe2JIc6EMQJGj0WxQHcOjVaDMAzwpdLs7Yu/jMyQ4=;
        b=OYvpihow/Ad8ErBbX5xM7GFmbI1PBEhFyR9ckeqsdjgwOWUCdKPxiP1InEXvdJxfOW
         wM+iVlSY9a/YSXNQkHRcp7g1bKYjxBhY5q8A3bGd0X+VHNMCcYOgIBLj/9ohNm3hJ04H
         d9puj1Piwh9JU7iVR0K6UGuMVO6TV704KS4eWVQS6s+p99Lz9TsrTQPN5v/+AyUPqx2f
         GqIbc9XI8qoDCJjl47zf57v99Le72HyTFBzMZ4+Fz6pQwIFihSd9tW1/XdGaYNKjANsQ
         /5mbkH2+4kHDf8ynqI6xBzwgzG5X2t3XoZZH7CBuGO7WE9lL6/io/BNx+Ja5bTBdFFHz
         eTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkFe2JIc6EMQJGj0WxQHcOjVaDMAzwpdLs7Yu/jMyQ4=;
        b=IZM4AuCaQeuDvdsnzX/vIDIgk38nA5M0GkKfEO40y0Pj8u4rxotMjT6CukgyIWJvlB
         0KAHS6AaUA0Ue6gQmsvkBnghf9ki4sUmyQXIzvOxyIjWBhjnpBQtRYG4jJQbUSbE63Mj
         LC4NkgTb1SEX7E+gv5vbAD58Uvb3ZBJ1Z+SKGW7wzrDMX/p2F1EHejfWkB353037tQAB
         9n6TEO8KAJDzYQVWA9ghE/fC3Mpfi8pHygbvpSfydISrrnLmrT3PNRXgncTLr4CAp/tS
         nKWK8y9+z9m3MOOIpAcJQo3PUUXU+Y3PwEZ1DmCPVkqCI/VzCwfHqmovmpZGzNcnUnuC
         Pnxg==
X-Gm-Message-State: APjAAAUmiRTAmsvx1lt6NGlXPNEEL0zwm4I3S0S/M/CpbFRW+BTKzQ21
        z4JibY1c357DL4NkoMfgZljIYB2jH1TUWglQeWY=
X-Google-Smtp-Source: APXvYqx1cV1LZucNSuD1rjVkQjwmnmOzXLH6FwY4elEknL8u+swKFt3FU5g/8IaQXuJ5ScC9n8zad53G2tQY99Gq+Gg=
X-Received: by 2002:aca:3fc2:: with SMTP id m185mr10605077oia.24.1566122871334;
 Sun, 18 Aug 2019 03:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de> <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de> <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de> <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
 <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com> <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
In-Reply-To: <c8551d99-7296-c621-1b56-017910f28400@rempel-privat.de>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 18:07:40 +0800
Message-ID: <CAJsYDVJ4uo-Ke159C2Xmed6A5vCjB7J6JuD+woPF+gY9cLct+w@mail.gmail.com>
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
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Paul Fertser <fercerpav@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Sun, Aug 18, 2019 at 5:51 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> lets see more code:
> drivers/staging/mt7621-mmc/sd.c
> /* clock source for host: global */
> #if defined(CONFIG_SOC_MT7620)
> static u32 hclks[] = {48000000}; /* +/- by chhung */
> #elif defined(CONFIG_SOC_MT7621)
> static u32 hclks[] = {50000000}; /* +/- by chhung */
> #endif
>
> hm.. 50Mhz again. Feels like APB clock.
>
> ./drivers/staging/mt7621-dts/mt7621.dtsi
>         cpuclock: cpuclock@0 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>
>                 /* FIXME: there should be way to detect this */
>                 clock-frequency = <880000000>;
>         };
>
> Your driver is trying to cover cpuclock
>
>         sysclock: sysclock@0 {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
>
>                 /* This is normally 1/4 of cpuclock */
>                 clock-frequency = <220000000>;
>         };
>
> and most probably system clock alias "bus clock", most probably AHB.

This sysclock was the 50MHz clock in OpenWrt. It's set as "bus clock"
upstream by an incorrect commit.
As already stated in previous reply: I'm not going to make assumption
about clock plan using OpenWrt's device tree because it already
contains several mistakes on clocks. Since the upstream device tree
comes from there, I don't trust it either. You might want to check out
patch 6/6 in this series where the original author of this commit in
openwrt fixed some clocks and I ported it here.

> [...]
> > This debate goes nowhere. I've clarified the situation and made my
> > point. Of course I can't read through the ancient and heavily hacked
> > vendor kernel to figure out a clock plan myself.
>
> Ok, I provided you some productive technical hints how it should be
> done. I don't think mt7620 has better documentation then mt7621 and even
> in this case it was possible to make more or less good driver.

It does. A clock plan for mt7620 is available in MT7620 Programming
Guide, Page 14.

Regards,
Chuanhong Guo
