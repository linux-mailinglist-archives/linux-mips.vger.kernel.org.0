Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 653D39159B
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 10:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfHRIot (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Aug 2019 04:44:49 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41878 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfHRIot (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Aug 2019 04:44:49 -0400
Received: by mail-oi1-f195.google.com with SMTP id g7so7706700oia.8;
        Sun, 18 Aug 2019 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9QdGesgMDK3FdcMMIoIwknk9WaLcRvYY+rvqXeny+bc=;
        b=je1I3UrgrBpvyds9g5EVI7f3FJ10MKi2rZwd8Do6X6jxhjI7mqI5lLZTeCvqr6fiw6
         V3fhjBfvBxIk+WcEBxGx10CRDtcLLRErXIgLGiLXOz+nLQ2XPjuM/Qac2wpHr8oKLoSX
         j7YA3V37mdv2b1ZpgWsKQY56EbNlIS4jBLEDPDf6pEkEUf6WPHcNEoWy+EP5v6sEzPTT
         AI12ixi5R7QLRn5mvqI4ogQtoZ5SkCGqu0F9pnRVwQhfFDf6uA3m0D959hdHd5K6InSm
         UBscr2ygkF+lO/scceIa+YXtsrwlrsxsoH0bgbumeSIcryw8QkGy0X/ktuTKTY55KuX+
         Vspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9QdGesgMDK3FdcMMIoIwknk9WaLcRvYY+rvqXeny+bc=;
        b=biroW21iYk+ra5VoDZYlHFEWoIrHv6tsripqFqdbhll/c1hzsooMkLqSZpMMxZj7cN
         aXtkaBQr8qNSzAeUdEyEhZXJ6oj6A6AUQrCss/GZF8F5xKDCqaZFDG+879m1QI1bO/i6
         CFvduXjins7EKSShGvqI7RZhptdjnEo/Ri1rX9DPs55SEoTIiqXRfrJvV3RyhqITu+hW
         RBTnc2yctlNwr2qGFLkTYqopV/NPn1FHwn/SvfHuvVMJdSbuV5Momuo642Zw5PUaRhg2
         W28Opk7+T+Mz8nGHEqfd82Ex9f2T97U00uX24HOBkS1l4PgrIExv8nrYcLS4pky836rK
         CKVA==
X-Gm-Message-State: APjAAAUslTBBSZSg2l7clC/eNoPKE8lQ9k67UsoStytgFOqc61dDaICX
        LBv+eog3vgZejctN5BiA0ETzVBjLodOOycG3cjk=
X-Google-Smtp-Source: APXvYqyRVxHma46j2OAvfKQwqyRWcRxz6zwKRky9d6l5ea1tExvRyR+/AN0aIHuOCKYnEzAKHNMfpmwmzkDrNvFF+RU=
X-Received: by 2002:aca:3fc2:: with SMTP id m185mr10466468oia.24.1566117887933;
 Sun, 18 Aug 2019 01:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de> <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de> <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de> <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
In-Reply-To: <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 16:44:32 +0800
Message-ID: <CAJsYDVJnQyOXHKWztoE72KKnMinJL+1AZGy_CvTT6oOs5m5U2w@mail.gmail.com>
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

On Sun, Aug 18, 2019 at 4:26 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi!
>
> On Sun, Aug 18, 2019 at 3:59 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
> >
> > Am 18.08.19 um 09:19 schrieb Chuanhong Guo:
> > > Hi!
> > >
> > > On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
> > >>
> > >>>> We have at least 2 know registers:
> > >>>> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> > >>>> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> > >>>> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> > >>>> all or some ip cores.
> > >>>> What is probably missing is a set of dividers for
> > >>>> each ip core. From your words it is not document.
> > >>>
> > >>> The specific missing part I was referring to, is parent clocks for
> > >>> every gates. I'm not going to assume this with current openwrt device
> > >>> tree because some peripherals doesn't have a clock binding at all or
> > >>> have a dummy one there.
> > >>
> > >> Ok, then I do not understand what is the motivation to upstream
> > >> something what is not nearly ready for use.
> > >
> > > Why isn't it "ready for use" then?
> > > A complete mt7621-pll driver will contain two parts:
> > > 1. A clock provider which outputs several clocks
> > > 2. A clock gate with parent clocks properly configured
> > >
> > > Two clocks provided here are just two clocks that can't be controlled
> > > in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
> > > Having a working CPU clock provider is better than defining a fixed
> > > clock in dts because CPU clock can be controlled by bootloader.
> > > (BTW description for CPU PLL register is also missing in datasheet.)
> > > Clock gate is an unrelated part and there is no information to
> > > properly implement it unless MTK decided to release a clock plan
> > > somehow.
> >
> > With other words, your complete system is running with unknown clock
> > rates.
>
> And without this patchset the complete system is running with unknown
> clock and, even worse, we make assumptions about what clock bootloader
> uses, hardcoded it in dts and hope it is the correct value.
>
> > The source clock in the clock three can be configured differently
> > by bootloader but you don't know how it is done how and it is not
> > documented.
>
> Actually, I don't know about this and I didn't wrote the original
> clock calculation code. I just ported it from downstream OpenWrt
> kernel. Here's a piece of code from Mediatek's SDK kernel:
>
> case 0:
>         reg = (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x44));
>         cpu_fdiv = ((reg >> 8) & 0x1F);
>         cpu_ffrac = (reg & 0x1F);
> mips_cpu_feq = (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
> break;
> case 1: //CPU PLL
>         reg = (*(volatile u32 *)(RALINK_MEMCTRL_BASE + 0x648));
>         fbdiv = ((reg >> 4) & 0x7F) + 1;
>         reg = (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x10));
>         reg = (reg >> 6) & 0x7;
>         if(reg >= 6) { //25Mhz Xtal
>             mips_cpu_feq = 25 * fbdiv * 1000 * 1000;
>         } else if(reg >=3) { //40Mhz Xtal
>             mips_cpu_feq = 20 * fbdiv * 1000 * 1000;
>         } else { // 20Mhz Xtal
>             /* TODO */
>         }
>         break;
>
>
>
> >
> > >> This code is currently on prototyping phase
> > >
> > > Code for clock calculation is done, not "prototyping".
> > >
> > >> It means, we cannot expect that this driver will be fixed any time soon.
> > >
> > > I think clock gating is a separated feature instead of a broken part
> > > that has to be fixed.
> >
> > Ok, i would agree with it. But from what you said, this feature will be
> > never implemented.
> >
> > So, I repeat my question. What is the point to upstream code for a
> > system, which has not enough information to get proper clock rate even
> > for uart? or is uart running with cpu or bus clock rate?
>
> uart runs of a fixed 50MHz clock according to another piece of code
> from MTK SDK:
> (a pastebin version here for better readability. This specific
> question has nothing to do with patch reviewing and doesn't need to be
> preserved in mail forever.)
> https://paste.ubuntu.com/p/fYmtDFW9nh/
>
> I could ask the same question:
> What is the point of upstreaming an incomplete MT7621 support in the
> first place? Current MT7621 support in upstream kernel works only for
> mt7621a not mt7621s and it runs of unknown clocks. These kind of code
> should stay in downstream projects like OpenWrt forever isn't it?

And in fact you've upstreamed a broken ag71xx driver anyway.

This debate goes nowhere. I've clarified the situation and made my
point. Of course I can't read through the ancient and heavily hacked
vendor kernel to figure out a clock plan myself.

Regards,
Chuanhong Guo
