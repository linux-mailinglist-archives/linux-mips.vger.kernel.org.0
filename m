Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCBB682D23
	for <lists+linux-mips@lfdr.de>; Tue, 31 Jan 2023 14:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjAaNAI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Jan 2023 08:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjAaNAH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Jan 2023 08:00:07 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8854C0D1;
        Tue, 31 Jan 2023 04:59:53 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p26so30123595ejx.13;
        Tue, 31 Jan 2023 04:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmFGl6w1T2X4Iy8+4eFf49j5NvCgFbPb0EL0ASIAaVI=;
        b=eWXVzLfbpi3n2E+VS5aBQxpuKaAQTApd9ALBvi4nr3xCIZcR2372Q+JwCNDnh8SJ3F
         FtiSeLIvLjfs55hR5TQ2QKb/lnp55d3hs73tb14pMvvWWJzgNZOIQfLJF8m0l+HQNglb
         OWamgw70Ge/2LtyVYYjNGUb5CbnBsPzyLAcNDX4WSKckRQ36F4NOCLRJUxs3KpXkZ88g
         QeVy1RS7kpdxNKzOcHZX00s//yteeMaKcSBXqQSveGB7mtqCEvxqd6Ai+CbvHFz4rRAj
         SlkrOVQpAf8kL8EV8676ZX+jWcFiQoa73DoCueWYXzTTKNGatxGvRfzCs89y+rkFtCnq
         9zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmFGl6w1T2X4Iy8+4eFf49j5NvCgFbPb0EL0ASIAaVI=;
        b=xHL/0p8PnH762Luc2NYQYLKqRG+Vj4UcmGvWTDr1xCBbVgieNAcni6+7j8sR/Mo+ey
         44sgkEjFdpSBhc57KFzmqL6TEIZhxvn70RDBiIW9bzRd5PpY27flBsFnMbpbNtfMLrpH
         N+EVvBkgf8HCbkF3hq6P5E8G9RQvEK3IhcNXL+ke/jNYUykFGexTgrmJkyGr4to+UfZO
         en3EUBVLM0d4FsLqJxnog5r9nK/EvS2DliWufHAm2FC1k2kdgKrOskg9UFGe/zRsD4sr
         gKT2fcFkMyV+FppOtbmUanXrKyIdv2v6xTMBuQ5EIP/Yc5heZQYSsaaS/IGCHdqT/6aE
         r4kA==
X-Gm-Message-State: AO0yUKXY82r0AD68cwOMfj3mZS8K4/+PVdB0oNKf0SXwYTzI/eqhxQPg
        HMHY11s26OMq71hUKleDVdV9Ugg6ok4AK5Ub77+1lcXXr027jAUm
X-Google-Smtp-Source: AK7set970BlocwV52n44djBoL/Js4qvYthDu+af0gSiKo5LxU6fJE+DM2hEBIFVxOCFGQjMs5MfdOHs1/I3SDYkdMcc=
X-Received: by 2002:a17:906:4950:b0:88a:b6ca:7d3a with SMTP id
 f16-20020a170906495000b0088ab6ca7d3amr1315292ejt.1.1675169991517; Tue, 31 Jan
 2023 04:59:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673227292.git.zhoubinbin@loongson.cn> <Y88VIXerF5Wk/9kj@mail.local>
In-Reply-To: <Y88VIXerF5Wk/9kj@mail.local>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Tue, 31 Jan 2023 20:59:37 +0800
Message-ID: <CAMpQs4+8m0r98eGMHO7ktS2_AuNCA_u3Yk1q06i99TdbVZJ_Cg@mail.gmail.com>
Subject: Re: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
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

Hi Kelvin:

Excuse me.
I am submitting the Loongson-2K/LS7A RTC driver and Alexandre would
like me to merge the ls1x rtc driver in parallel.
Unfortunately I found out that the loongson-1 does not yet support DT
and would like to ask if you have any plans to support DT?

I think this is the prerequisite for the merge.

Regards.


Binbin




On Tue, Jan 24, 2023 at 7:24 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> > Hi all:
> >
> > The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> > released five versions of patchset before, and all related mail records
> > are shown below if you are interested:
> >
> > https://lore.kernel.org/all/?q=ls2x-rtc
> >
> > In this series of patches, based on the code above, I have added the
> > following support:
> >
> > 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
> >    by default under LoongArch architecture;
> > 2. Add rtc alarm/walarm related functions.
> >
> > I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> > and Loongson-2K0500.
> >
> > BTW:
> > There have been discussions about merging the rtc drivers of ls1x and
> > ls2x, but the following reasons made the merger difficult to achieve:
> >
> > 1. ls1x does not support ACPI, for it is only on MIPS-based system;
>
> This is not a good justification, you have to support both in your
> driver anyway, as shown by your CONFIG_ACPI ifdefery.
>
> > 2. ls1x does not support alarm function.
>
> It is just a matter of clearing a single bit, this is not difficult at
> all.
>
> >
> > Thanks.
> >
> > -------
> > Changes since v1:
> > 1. Rebased on top of latest loongarch-next;
> > 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> > errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> > testing;
> > 3. Remove some inexact CONFIG_ACPI.
> >
> > Binbin Zhou (4):
> >   rtc: Add support for the Loongson-2K/LS7A RTC
> >   LoongArch: Enable LS2X RTC in loongson3_defconfig
> >   MIPS: Loongson64: DTS: Add RTC support to LS7A
> >   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> >
> > WANG Xuerui (3):
> >   dt-bindings: rtc: Add Loongson LS2X RTC support
> >   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
> >   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> >
> >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
> >  arch/loongarch/configs/loongson3_defconfig    |   1 +
> >  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
> >  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
> >  arch/mips/configs/loongson2k_defconfig        |   1 +
> >  arch/mips/configs/loongson3_defconfig         |   1 +
> >  drivers/rtc/Kconfig                           |  11 +
> >  drivers/rtc/Makefile                          |   1 +
> >  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
> >  9 files changed, 410 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-ls2x.c
> >
> > --
> > 2.31.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
