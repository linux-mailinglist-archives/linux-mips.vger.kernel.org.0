Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB5F2AFCE4
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 02:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgKLBdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 20:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbgKLB03 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 20:26:29 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A430CC0613D1;
        Wed, 11 Nov 2020 17:26:27 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id u21so4303617iol.12;
        Wed, 11 Nov 2020 17:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B2V5fHWjJfDHC37py9TGraaIOkIixettJgS/vXtY+j0=;
        b=RGZU23sr+qdewHuId2wFMbvHWIo7Fy3Q3G2Yf3z57kMcmDjy0YYHeI+qlHGbwkzZWw
         KY3X0VPrclzrZ0Zhiu1eQcnFnEJxP5/r1z3FBQYHG7deQpqHo/sXB2LS+z+DZq4U23pg
         75eoyEC7bjvKVj51LOVloXwynreqp9WmtenMN3aMfprxkxzH0PoeXXsWU7wCNJpY4oHZ
         O0hKt63VAiAKqEP9lwBJxb4JyUkDFyjb+oe3R113UQqXW9/EPfCH7sfOhMBwl075fJY1
         b08jBtBUT/eicBNBu247UTKPMs1NKlmuFZo/6KwRi2GKbVM0WUjAXRp92CyC5UonuAB1
         s21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B2V5fHWjJfDHC37py9TGraaIOkIixettJgS/vXtY+j0=;
        b=fcBJYkgF+VHYCUU2bXRCB518YwOCWI0dOOcdcq4fgbKTj+de5WLyssw45dVar5G89b
         nJSm9q2c9qxmxte4aV107NY1bs6g+vZC9gne9YmyBd8QchwoqOP3klSmfiMGjOGgpuEO
         a3rXjfp2xZGBiiz0hn5ZFvE1xUAjOGo/JGdUlNqxm5Z2BNuO7fSeniCu4qjfAoYLcDnX
         ENUkDZHMuGpfhWSUnE9h/EBe3g9PBdWO4HvCjGeuuTJahwI80UveC5Wdhs7o0HeaVZVw
         hVuLTGOXYmrLG3NeMIPzA9nQwO0QxfE/jCMToS/PadmNbR1I0t2wcxSYc8YaegkiMbPp
         u3Tg==
X-Gm-Message-State: AOAM533sqsqgUaSCUpJgB1dNcvmEHFw/yoXHbcZkAsN41koBISknSF5b
        ZCcuW+HvPajEC4NptHX/XcXAzhPvhAoXtuRlw5w=
X-Google-Smtp-Source: ABdhPJz7OCFU0+VXE96aOUHbHUldtuiC7nVBYOu9ztRPUGxPd9I5Dw2Z/C7Hsz4+DI4dvkFqetu7HQmv4fK5XsDZLwU=
X-Received: by 2002:a02:c995:: with SMTP id b21mr22906607jap.65.1605144385662;
 Wed, 11 Nov 2020 17:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Thu, 12 Nov 2020 09:26:14 +0800
Message-ID: <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Thu, Nov 12, 2020 at 12:30 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> This patchset ports CPU clock detection for MT7621 from OpenWrt
> and adds a complete clock plan for the mt7621 SOC.
>
> The documentation for this SOC only talks about two registers
> regarding to the clocks:
> * SYSC_REG_CPLL_CLKCFG0 - provides some information about boostrapped
> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> * SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> all or some ip cores.
>
> No documentation about a probably existant set of dividers for each ip
> core is included in the datasheets. So we cannot make anything better,
> AFAICT.
>
> Looking into driver code, there is another frequency which is used in
> some drivers (uart, sd...) which for any reason is always hardcoded to
> 50 MHz. Taking this into account this patchset provides three main fixed
> clocks to the SOC in 'mt7621-pll' which are:
>   - "cpu": with detected frequency (900 MHz in my board).
>   - "ahb": cpu / 4 = 225 Mhz.
>   - "apb": 50 Mhz.
>
> PLL controller cannot be manipulatedbecause there is no info about
> how to do it. Because of this, there is nothing related with registers
> in the included binding.
>
> It also provides a clock gate driver 'mt7621-clk' as a platform driver
> to allow to enable and disable some clocks in the different ip cores.
> The parent clocks for this clock gates have also set taking into account
> existant device tree and driver code resulting in the followings:
>   - "hsdma": "ahb"
>   - "fe": "ahb"
>   - "sp_divtx": "ahb"
>   - "timer": "cpu"
>   - "int": "cpu"
>   - "mc": "ahb"
>   - "pcm": "ahb"
>   - "pio": "ahb"
>   - "gdma": "ahb"
>   - "nand": "ahb"
>   - "i2c": "ahb"
>   - "i2s": "ahb"
>   - "spi": "ahb"
>   - "uart1": "apb"
>   - "uart2": "apb"
>   - "uart3": "apb"
>   - "eth": "ahb"
>   - "pcie0": "ahb"
>   - "pcie1": "ahb"
>   - "pcie2": "ahb"
>   - "crypto": "ahb"
>   - "shxc": "ahb"
>
> There was a previous attempt of doing this here[0] but the author
> did not wanted to make assumptions of a clock plan for the platform.

I've already said in previous threads that clock assignment in
current linux kernel is not trustworthy.
I've got the clock plan for mt7621 now. (Can't share it, sorry.)
Most of your clock assumptions above are incorrect.
I've made a clock driver with gate support a few months ago.[0]
but I don't have much time to really finish it.
Maybe you could rework your clock gate driver based on it.

[0] https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133
-- 
Regards,
Chuanhong Guo
