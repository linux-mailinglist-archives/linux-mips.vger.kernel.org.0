Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58896971AE
	for <lists+linux-mips@lfdr.de>; Wed, 15 Feb 2023 00:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjBNXSG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 18:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBNXSF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 18:18:05 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513E121280;
        Tue, 14 Feb 2023 15:18:02 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5C8D41BF204;
        Tue, 14 Feb 2023 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1676416681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3at2MWdjTCX7ZN92lAfIOjdulOQQDveQtYLL8HbwUzA=;
        b=hZ3aFygFHNrOPkX3Ly34LFp5hyFIEi1+ObKAHGj9QDwEdZ0ynAbmGu0pnQHs9+oVMl9wnT
        klLfZrI/maIecCXTyDJB9XHkwU5cy5wGEsyGap+AImTPOUpHEAv1clwPu+248bAKF/CAP1
        cypj6FkLDLduJOSqC2lqVN3+ooOkuxUANntNph4U+6Dl6Sd9fyA09pUdd/aeByHTiZBVzW
        LDi72bsMLxFrXatQ2VuZKO9ghKH6yQ6j3vtdBt7e8G+4434EIQ0MVg54PpJ2VfBCaCD3Ms
        1U/GalCTKXzApIOQ7NheH74w3CkS6TdT+hxicNv5lctE8oIZBHcgHRttI7ylRg==
Date:   Wed, 15 Feb 2023 00:17:59 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, zhzhl555@gmail.com,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: Re: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A
 RTC
Message-ID: <Y+wWp61zxZ3V316d@mail.local>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
 <Y88VIXerF5Wk/9kj@mail.local>
 <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
 <CAMpQs4+uW75TdkMicdfU+5LYQxA_7kfbdabwO=iDiKwW-PzO9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpQs4+uW75TdkMicdfU+5LYQxA_7kfbdabwO=iDiKwW-PzO9Q@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/2023 18:03:07+0800, Binbin Zhou wrote:
> On Tue, Jan 31, 2023 at 8:59 PM Binbin Zhou <zhoubb.aaron@gmail.com> wrote:
> >
> > Hi Kelvin:
> >
> > Excuse me.
> > I am submitting the Loongson-2K/LS7A RTC driver and Alexandre would
> > like me to merge the ls1x rtc driver in parallel.
> > Unfortunately I found out that the loongson-1 does not yet support DT
> > and would like to ask if you have any plans to support DT?
> >
> > I think this is the prerequisite for the merge.
> >
> > Regards.
> > Binbin
> >
> >
> 
> Hi Alexandre:
> 
> Unfortunately there has been no reply from Keguang for the past week
> or so. Can we try rtc-ls2x and rtc-ls1x to coexist until Loongson-1
> supports DT?
> Later on, if Keguang or someone else familiar with Loongson-1 adds DT
> support, I would be happy to continue trying to merge the two drivers.
> 

My point is exactly that if nobody in Loongson wants to maintain
rtc-ls1x, we may just drop it. This also probably tells a lot about how
rtc-ls2x is going to be maintained once upstreamed...

> Regards.
> Binbin
> 
> >
> >
> > On Tue, Jan 24, 2023 at 7:24 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> > > > Hi all:
> > > >
> > > > The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> > > > released five versions of patchset before, and all related mail records
> > > > are shown below if you are interested:
> > > >
> > > > https://lore.kernel.org/all/?q=ls2x-rtc
> > > >
> > > > In this series of patches, based on the code above, I have added the
> > > > following support:
> > > >
> > > > 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
> > > >    by default under LoongArch architecture;
> > > > 2. Add rtc alarm/walarm related functions.
> > > >
> > > > I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> > > > and Loongson-2K0500.
> > > >
> > > > BTW:
> > > > There have been discussions about merging the rtc drivers of ls1x and
> > > > ls2x, but the following reasons made the merger difficult to achieve:
> > > >
> > > > 1. ls1x does not support ACPI, for it is only on MIPS-based system;
> > >
> > > This is not a good justification, you have to support both in your
> > > driver anyway, as shown by your CONFIG_ACPI ifdefery.
> > >
> > > > 2. ls1x does not support alarm function.
> > >
> > > It is just a matter of clearing a single bit, this is not difficult at
> > > all.
> > >
> > > >
> > > > Thanks.
> > > >
> > > > -------
> > > > Changes since v1:
> > > > 1. Rebased on top of latest loongarch-next;
> > > > 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> > > > errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> > > > testing;
> > > > 3. Remove some inexact CONFIG_ACPI.
> > > >
> > > > Binbin Zhou (4):
> > > >   rtc: Add support for the Loongson-2K/LS7A RTC
> > > >   LoongArch: Enable LS2X RTC in loongson3_defconfig
> > > >   MIPS: Loongson64: DTS: Add RTC support to LS7A
> > > >   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> > > >
> > > > WANG Xuerui (3):
> > > >   dt-bindings: rtc: Add Loongson LS2X RTC support
> > > >   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
> > > >   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> > > >
> > > >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
> > > >  arch/loongarch/configs/loongson3_defconfig    |   1 +
> > > >  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
> > > >  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
> > > >  arch/mips/configs/loongson2k_defconfig        |   1 +
> > > >  arch/mips/configs/loongson3_defconfig         |   1 +
> > > >  drivers/rtc/Kconfig                           |  11 +
> > > >  drivers/rtc/Makefile                          |   1 +
> > > >  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
> > > >  9 files changed, 410 insertions(+)
> > > >  create mode 100644 drivers/rtc/rtc-ls2x.c
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
