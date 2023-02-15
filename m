Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BC7697446
	for <lists+linux-mips@lfdr.de>; Wed, 15 Feb 2023 03:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbjBOCRH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 21:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjBOCRG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 21:17:06 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CF025941;
        Tue, 14 Feb 2023 18:17:04 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id lf10so12839604ejc.5;
        Tue, 14 Feb 2023 18:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6LxxlzPg4mizXqJNDigPYQlPuo1iqpw5WjKtKqM6DiE=;
        b=mdtXMHguzvpQUS5lrmb4Pf8yWnMPy5O161mHqUuRD4pHl7RTCZeGex5H/ndl31zNNY
         PS/JLb/hknFAl07aGpTgHTffCShUXFfsoR83lCCdp6qPLn+XUaNaAuRpRx2i0ZMdl5yu
         vUqNqN0aQsm+cIXEE6YdIeJNwJON5NAvKLyN93ICk5Mf3Kfg46o6Qoy9twk5KthbGvTQ
         ufMkFNE4fOy3I2lS3W6V2sIiJ8k2Fxy9zu11Yv8ucnvQD5EQ8jjV4l7aR4g61xEXQJwt
         0BIYHSA1BtjqoBOQ7w01yVI2/zpT3paAa2Qm5OP7iLl2lhL3Nkc0VZrAVf8PGEiaHBrQ
         NUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LxxlzPg4mizXqJNDigPYQlPuo1iqpw5WjKtKqM6DiE=;
        b=RsMxikBrgweD5weN1KyuH1pXEO8hJ51mJ3bniOiuikHcKdpXYJpjXI+CxmPyoQkqVJ
         UrMUU6EpoQnIVhokPzU92HiXDcz6EpJ4QTwv8ZptZUVO99mNGLMi+7SIswhr93ZztKdc
         29xujbYWK+xyIDt5NWshhcWt57KZfIIBiQfAJsTnv+CfPc5mr1SBfaW/AwE78oy2+USn
         OCxNMvrq/bqksQRJ13juPmBco9BNqkp8acXU1ohLVJ02ZKrC4lYS+CMyG4h9dJJrz93j
         /5n6YwiHwcRvFnOU+cSJdq0BvshmChFvDSMX1Wn8P/d4ZCbqS314J6u0iY/MCPGwp6L/
         Lrjw==
X-Gm-Message-State: AO0yUKUK9k0kGovI7onUsCUDidYSFW9V8iAiPahX/ti6ePPVT+JwPeck
        SDt+fGO5HNNlvLynuMljzuZEBTboK9rAfLZM1uw=
X-Google-Smtp-Source: AK7set/fzpOM02wfNk52NdqUIG77iAJxisnDk9pzjjI5GCx7b+6LlJ3SFgk59YpfC9G6AH0tDasj2Vs3AbAXQYTg2Sw=
X-Received: by 2002:a17:906:5ad4:b0:877:747e:f076 with SMTP id
 x20-20020a1709065ad400b00877747ef076mr300787ejs.0.1676427422995; Tue, 14 Feb
 2023 18:17:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673227292.git.zhoubinbin@loongson.cn> <Y88VIXerF5Wk/9kj@mail.local>
 <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
 <CAMpQs4+uW75TdkMicdfU+5LYQxA_7kfbdabwO=iDiKwW-PzO9Q@mail.gmail.com> <Y+wWp61zxZ3V316d@mail.local>
In-Reply-To: <Y+wWp61zxZ3V316d@mail.local>
From:   Kelvin Cheung <keguang.zhang@gmail.com>
Date:   Wed, 15 Feb 2023 10:16:46 +0800
Message-ID: <CAJhJPsX2qLYMaVOR1bwS75sju4EPf3PcVX4L6Tyuz7NMv4Z2eQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
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
        zhaoxiao <zhaoxiao@uniontech.com>, zhzhl555@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,
I will maintain rtc-ls1x continuously.
And I'm adding DT support for it.

On Wed, Feb 15, 2023 at 7:18 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 10/02/2023 18:03:07+0800, Binbin Zhou wrote:
> > On Tue, Jan 31, 2023 at 8:59 PM Binbin Zhou <zhoubb.aaron@gmail.com> wrote:
> > >
> > > Hi Kelvin:
> > >
> > > Excuse me.
> > > I am submitting the Loongson-2K/LS7A RTC driver and Alexandre would
> > > like me to merge the ls1x rtc driver in parallel.
> > > Unfortunately I found out that the loongson-1 does not yet support DT
> > > and would like to ask if you have any plans to support DT?
> > >
> > > I think this is the prerequisite for the merge.
> > >
> > > Regards.
> > > Binbin
> > >
> > >
> >
> > Hi Alexandre:
> >
> > Unfortunately there has been no reply from Keguang for the past week
> > or so. Can we try rtc-ls2x and rtc-ls1x to coexist until Loongson-1
> > supports DT?
> > Later on, if Keguang or someone else familiar with Loongson-1 adds DT
> > support, I would be happy to continue trying to merge the two drivers.
> >
>
> My point is exactly that if nobody in Loongson wants to maintain
> rtc-ls1x, we may just drop it. This also probably tells a lot about how
> rtc-ls2x is going to be maintained once upstreamed...
>
> > Regards.
> > Binbin
> >
> > >
> > >
> > > On Tue, Jan 24, 2023 at 7:24 AM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> > > > > Hi all:
> > > > >
> > > > > The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> > > > > released five versions of patchset before, and all related mail records
> > > > > are shown below if you are interested:
> > > > >
> > > > > https://lore.kernel.org/all/?q=ls2x-rtc
> > > > >
> > > > > In this series of patches, based on the code above, I have added the
> > > > > following support:
> > > > >
> > > > > 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
> > > > >    by default under LoongArch architecture;
> > > > > 2. Add rtc alarm/walarm related functions.
> > > > >
> > > > > I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> > > > > and Loongson-2K0500.
> > > > >
> > > > > BTW:
> > > > > There have been discussions about merging the rtc drivers of ls1x and
> > > > > ls2x, but the following reasons made the merger difficult to achieve:
> > > > >
> > > > > 1. ls1x does not support ACPI, for it is only on MIPS-based system;
> > > >
> > > > This is not a good justification, you have to support both in your
> > > > driver anyway, as shown by your CONFIG_ACPI ifdefery.
> > > >
> > > > > 2. ls1x does not support alarm function.
> > > >
> > > > It is just a matter of clearing a single bit, this is not difficult at
> > > > all.
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > > -------
> > > > > Changes since v1:
> > > > > 1. Rebased on top of latest loongarch-next;
> > > > > 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> > > > > errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> > > > > testing;
> > > > > 3. Remove some inexact CONFIG_ACPI.
> > > > >
> > > > > Binbin Zhou (4):
> > > > >   rtc: Add support for the Loongson-2K/LS7A RTC
> > > > >   LoongArch: Enable LS2X RTC in loongson3_defconfig
> > > > >   MIPS: Loongson64: DTS: Add RTC support to LS7A
> > > > >   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> > > > >
> > > > > WANG Xuerui (3):
> > > > >   dt-bindings: rtc: Add Loongson LS2X RTC support
> > > > >   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
> > > > >   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> > > > >
> > > > >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
> > > > >  arch/loongarch/configs/loongson3_defconfig    |   1 +
> > > > >  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
> > > > >  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
> > > > >  arch/mips/configs/loongson2k_defconfig        |   1 +
> > > > >  arch/mips/configs/loongson3_defconfig         |   1 +
> > > > >  drivers/rtc/Kconfig                           |  11 +
> > > > >  drivers/rtc/Makefile                          |   1 +
> > > > >  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
> > > > >  9 files changed, 410 insertions(+)
> > > > >  create mode 100644 drivers/rtc/rtc-ls2x.c
> > > > >
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Best regards,

Kelvin Cheung
