Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBE991585
	for <lists+linux-mips@lfdr.de>; Sun, 18 Aug 2019 10:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfHRI0r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Aug 2019 04:26:47 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41324 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfHRI0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Aug 2019 04:26:47 -0400
Received: by mail-oi1-f195.google.com with SMTP id g7so7694449oia.8;
        Sun, 18 Aug 2019 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7VUAwRcf68LXGJnzjTuiYx60n/flei+ysQqebimqn8=;
        b=TmgH4yNqGgpGkcoT8strWduC52vDGx/hIlxsGD0dDTG793KxgxYj1BkpJTxGVNosGA
         qvUkEsW+Gs+UgqSX6Yy6qa/DkF+aS4jRSQwstaCBfOfcM32IYhg3LNc7Zmo5WO6LDZ4b
         WFZBdYn9/aqvF/kZEJ9vjcoB4Wt6gkNJxSdvH22xTLptzmh7CtbF16JabiTqrxfjqrev
         qoQ2nO9zDMhmm9nreo+GmQ2Fmr5yhPBU8iJufAA6EOHGJ8MSFJV1taYjGZLPp2PeJD6j
         WqMR3P7S9d96LZWpf3kfqF3PdUWbsUBZ/J9AVfSYdCpoyTn+UsogWmoERooOWz19/hSE
         W0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7VUAwRcf68LXGJnzjTuiYx60n/flei+ysQqebimqn8=;
        b=YBVQTUQildDE8m30i6ATy0GkXCwnO8Cwgdrs9UXTQ6G+zrImPo5EmPpSbmaDZFZ6oI
         4gfxl/NMwBt5Z560Tg69L4ljZv4dWKa0lp1qaSGtpPwOjdm8ltGJcO7Wbo9BCPwgFHwZ
         ia3lJxG+jSY3slT8sJSL2ZkKXetEhHg0REe/rbrWTygEkZJGvRjK6RG2dqkzHkbbWYn4
         swquKsRipaD1oyZwZdHK8BD6CG95nt+xSgguOiu/vkDu3Ks8eAuZEbVjCckITsDIplGU
         JdmlBOfQzlsMjwoqtnGl4qrY5OqbErQBkhOMNzDOucK/MYCdmiHb92hDecglbDqIoNEY
         iCyg==
X-Gm-Message-State: APjAAAVIYRP610y+xc90L99j9hI/kppMNkZXr/EW3K1+3TpNSsm7swWW
        HCyIQN7M7ht0JvfUpuqNvObFmIAq+8j4SG0tgUY=
X-Google-Smtp-Source: APXvYqwGsP1gt4a6mxQDob92BtKMx9KxfNZOnQTGLZBm07hPOyC61DLGzrOLM49ukRPuyRmiDZJtmTTbWKd0PH7YmtA=
X-Received: by 2002:aca:720c:: with SMTP id p12mr10285633oic.128.1566116805844;
 Sun, 18 Aug 2019 01:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de> <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de> <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
 <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de>
In-Reply-To: <6426d4d2-9961-83f2-d3bc-5834ff36b40d@rempel-privat.de>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 16:26:34 +0800
Message-ID: <CAJsYDVKW9-7ityUn83NXcQYmqJi_t-VSV8F0c+BA14_w+poPkA@mail.gmail.com>
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

On Sun, Aug 18, 2019 at 3:59 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> Am 18.08.19 um 09:19 schrieb Chuanhong Guo:
> > Hi!
> >
> > On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
> >>
> >>>> We have at least 2 know registers:
> >>>> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> >>>> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> >>>> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> >>>> all or some ip cores.
> >>>> What is probably missing is a set of dividers for
> >>>> each ip core. From your words it is not document.
> >>>
> >>> The specific missing part I was referring to, is parent clocks for
> >>> every gates. I'm not going to assume this with current openwrt device
> >>> tree because some peripherals doesn't have a clock binding at all or
> >>> have a dummy one there.
> >>
> >> Ok, then I do not understand what is the motivation to upstream
> >> something what is not nearly ready for use.
> >
> > Why isn't it "ready for use" then?
> > A complete mt7621-pll driver will contain two parts:
> > 1. A clock provider which outputs several clocks
> > 2. A clock gate with parent clocks properly configured
> >
> > Two clocks provided here are just two clocks that can't be controlled
> > in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
> > Having a working CPU clock provider is better than defining a fixed
> > clock in dts because CPU clock can be controlled by bootloader.
> > (BTW description for CPU PLL register is also missing in datasheet.)
> > Clock gate is an unrelated part and there is no information to
> > properly implement it unless MTK decided to release a clock plan
> > somehow.
>
> With other words, your complete system is running with unknown clock
> rates.

And without this patchset the complete system is running with unknown
clock and, even worse, we make assumptions about what clock bootloader
uses, hardcoded it in dts and hope it is the correct value.

> The source clock in the clock three can be configured differently
> by bootloader but you don't know how it is done how and it is not
> documented.

Actually, I don't know about this and I didn't wrote the original
clock calculation code. I just ported it from downstream OpenWrt
kernel. Here's a piece of code from Mediatek's SDK kernel:

case 0:
        reg = (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x44));
        cpu_fdiv = ((reg >> 8) & 0x1F);
        cpu_ffrac = (reg & 0x1F);
mips_cpu_feq = (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
break;
case 1: //CPU PLL
        reg = (*(volatile u32 *)(RALINK_MEMCTRL_BASE + 0x648));
        fbdiv = ((reg >> 4) & 0x7F) + 1;
        reg = (*(volatile u32 *)(RALINK_SYSCTL_BASE + 0x10));
        reg = (reg >> 6) & 0x7;
        if(reg >= 6) { //25Mhz Xtal
            mips_cpu_feq = 25 * fbdiv * 1000 * 1000;
        } else if(reg >=3) { //40Mhz Xtal
            mips_cpu_feq = 20 * fbdiv * 1000 * 1000;
        } else { // 20Mhz Xtal
            /* TODO */
        }
        break;



>
> >> This code is currently on prototyping phase
> >
> > Code for clock calculation is done, not "prototyping".
> >
> >> It means, we cannot expect that this driver will be fixed any time soon.
> >
> > I think clock gating is a separated feature instead of a broken part
> > that has to be fixed.
>
> Ok, i would agree with it. But from what you said, this feature will be
> never implemented.
>
> So, I repeat my question. What is the point to upstream code for a
> system, which has not enough information to get proper clock rate even
> for uart? or is uart running with cpu or bus clock rate?

uart runs of a fixed 50MHz clock according to another piece of code
from MTK SDK:
(a pastebin version here for better readability. This specific
question has nothing to do with patch reviewing and doesn't need to be
preserved in mail forever.)
https://paste.ubuntu.com/p/fYmtDFW9nh/

I could ask the same question:
What is the point of upstreaming an incomplete MT7621 support in the
first place? Current MT7621 support in upstream kernel works only for
mt7621a not mt7621s and it runs of unknown clocks. These kind of code
should stay in downstream projects like OpenWrt forever isn't it?

Regards,
Chuanhong Guo
