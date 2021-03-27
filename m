Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08E734B82A
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 17:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhC0QgR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 12:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhC0Qf4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 12:35:56 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FAFC0613B1;
        Sat, 27 Mar 2021 09:35:56 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id r193so8536819ior.9;
        Sat, 27 Mar 2021 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBpKHPTfLzeVC8Vlokz6RnjApS7jM+5JGdUbmQj/Yqs=;
        b=TBVwnQvO+sXGZss5Ndc4fHHY0yZbzLdYOXsyniyWXixCmJScopTZpT04x6TdixzVdy
         b37Gi288u4M/dn2PXi/bBBhab8tnDrfH6jt8Ign9qBdYZT00ZXIvwoivs8Fp2HAxcHSG
         cBdLgZeTAGFTrXBdrD0CCHOprl/z0551Bp69KTQ5JUFD/WxDGTsToAP13BDMf51/BgJf
         Fsfv4817sAYE9HsOiHr4+s517qGu8YNzx7OVp0PkFRU++LGgw+KmaPHDzGskgOBdYpWe
         gUT8ZRQyc/TvXywEYQDHX4GBiIU1Mph6j+QZmWmlUEypa6vgtezfrkNOkEp5yLBMsYzY
         bfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBpKHPTfLzeVC8Vlokz6RnjApS7jM+5JGdUbmQj/Yqs=;
        b=T2cNMhJEnSirxMvBupcEL8sovUnnrrXyDpSDByieSkuAHHxrODDVt+OG65ppyZ8oRM
         GitH/FoHnk2sBC7qqFwP/iGFwsUVgsIIDboeY35rF5yEsmb/kFvU1zkVfQlPu8LZQZEk
         Dt4HYeYqgzcA8UQnHg/a/DQW9wjxqX+inTslOJbU4HzqwFWNuRp8AGbwpuaUCYajDO3s
         ERqwXHl+yE1aRmUdMVUus7sUmjGB2vL93vd2Lc3A4daO0hKP96dX2zdWA8AxeGqk0p9d
         Bk6/lSVYGPOHDRYsycGen7TN7bDk2agN5AA4IOrbZO9Vc+R7HmXbYlPfldxFbV93W4J/
         w+6Q==
X-Gm-Message-State: AOAM532bjImXEhQ3O+dKwDOFnuP4kOGtCjwCmIsgjvviB7/mUSN0qzmW
        OGIjubNf6NX19HT9jEykkv9ERvZ1Sn+0eiWnzrU=
X-Google-Smtp-Source: ABdhPJywwV+4zcT3KxAEMj2QBhddeKToPnOV79azTvHsFa15QK7QbVIbGOh6EAEcSM1/EW0rO8RzSMvcCm166Hm+TnQ=
X-Received: by 2002:a05:6638:11c8:: with SMTP id g8mr17295564jas.38.1616862954754;
 Sat, 27 Mar 2021 09:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de> <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
 <20210327094620.GA4320@alpha.franken.de>
In-Reply-To: <20210327094620.GA4320@alpha.franken.de>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Sat, 27 Mar 2021 09:35:43 -0700
Message-ID: <CALCv0x23kmm5=PN_aS3L4fpEf8F9g7ay5ouX9AnCvf0uu6HM-g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 27, 2021 at 2:46 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> > On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > > From: Chuanhong Guo <gch981213@gmail.com>
> > > >
> > > > mt7621 has the following memory map:
> > > > 0x0-0x1c000000: lower 448m memory
> > > > 0x1c000000-0x2000000: peripheral registers
> > > > 0x20000000-0x2400000: higher 64m memory
> > > >
> > > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > > memory region and isn't suitable for 512m memory detection because
> > > > it may accidentally read the memory area for peripheral registers.
> > > >
> > > > This commit adds memory detection capability for mt7621:
> > > >   1. Add the highmem area when 512m is detected.
> > > >   2. Guard memcmp from accessing peripheral registers:
> > > >      This only happens when a user decided to change kernel load address
> > > >      to 256m or higher address. Since this is a quite unusual case, we
> > > >      just skip 512m testing and return 256m as memory size.
> > > >
> > > > [...]
> > >
> > > I get
> > >
> > > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > > The function prom_soc_init() references
> > > the function __init mt7621_memory_detect().
> > > This is often because prom_soc_init lacks a __init
> > > annotation or the annotation of mt7621_memory_detect is wrong.
> > >
> > > Can you please fix this ?
> > Thanks, I will fix it. Having trouble reproducing the error, but I
> > clearly see the issue. Are you building on a MIPS target or
> > cross-compiling (I'm cross-compiling and no errors).
>
> I'm cross compiling, I can provide you the .config, if you want.
Yeah, that would help. I spent quite a bit of time trying to reproduce
- tried different options with GCC 8 and GCC 10 to no avail. Maybe you
are using clang?

Ilya
