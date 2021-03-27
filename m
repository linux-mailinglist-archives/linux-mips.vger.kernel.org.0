Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D506834B98C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 22:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhC0VjP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 17:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhC0Vio (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 17:38:44 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE666C0613B1;
        Sat, 27 Mar 2021 14:38:43 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id t14so8068164ilu.3;
        Sat, 27 Mar 2021 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c34PErvHXBZ/P1Sz73dY60YNM8fNQhXxU1cb8SCkbWI=;
        b=k6Z06YF7tNgieDwC8SXV99UC/KxmRaREKzzE14qdyKHLmU9ue51YlIDwnah1kDjX3H
         tv9S1nlw/Dr8HbYxngIJndXotVBunOXtposLMSy6x7wa4XnHVbtYKWLPKc/R8F4ZQ5ON
         0eSpJCiquweN57tb+pTrqkFVu+dzk5K9HlEIcSzYrPk5LJAWtsI2V6KtzWh+OBogSCMQ
         /fwUXRsEWk8DHzmocuF08GhfUJIqrk0/9o+wm3tPrAk01MoaNTKnAT7ORIg2jHKZlO8z
         ifP91PVTaiv40rihNuCD2K40uhUkJEo6kK0lwgH9mQE8LJ/+PEFFcrmCo4NmtN/iLGks
         R0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c34PErvHXBZ/P1Sz73dY60YNM8fNQhXxU1cb8SCkbWI=;
        b=HeySasg1+5f3B0auN8ZRY3tBnL6nHjQOYm92+7JUnnh2TAg6M+oQ9hLU8aepv8BaSu
         s8Uq25P4hFhkVIyA02A598iiZbg2mLxNax0YIuqA/P4NkJSuo4MGYNGG7LCkwqFYzoKJ
         B/NrL923+HiEgDEk8sld9z5LQ2jCV2qqSTvHVc88elSPym5ETpcUQDVx1ukrBM/sS03g
         i6zEQXiFIEjkqd6YrCdQyxApEHDd7t6OwBrHnmPd6y5KzgTsdlYpB2Sk4+cvd4kSZiu9
         5G8ipPxkZ45dMiS3A5GLYrOvxRhe2a6+o7OT5RnYyKrVmFBFQDjrcw88SFTvC5wcF3it
         2STg==
X-Gm-Message-State: AOAM533v4Bcwvi9w/d7sg+qQ3apdd2ktUDdJlLyiaEXaPyxhSgfDgZQi
        OBOkV6fkY8jKf5SiN3kHZun+l1qHOw5fWaMYEw51h0c8D3MCJQ==
X-Google-Smtp-Source: ABdhPJwicv5S65GU+vk8rY9d7TBJ3P4OlK7ZXR7G/c/ojq+8Qg1k/aKCSFxiZ66Nm9Ap47Z3hIUF25E8A9J/UOsqhX8=
X-Received: by 2002:a92:d68e:: with SMTP id p14mr12779150iln.0.1616881123265;
 Sat, 27 Mar 2021 14:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de> <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
 <20210327094620.GA4320@alpha.franken.de> <CALCv0x23kmm5=PN_aS3L4fpEf8F9g7ay5ouX9AnCvf0uu6HM-g@mail.gmail.com>
 <20210327203916.GA4991@alpha.franken.de>
In-Reply-To: <20210327203916.GA4991@alpha.franken.de>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Sat, 27 Mar 2021 14:38:32 -0700
Message-ID: <CALCv0x0xPw_s3vWtoSUQFfWjC=HxGBhA-5=MV0NtPUUxR9B5Xw@mail.gmail.com>
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

On Sat, Mar 27, 2021 at 2:06 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, Mar 27, 2021 at 09:35:43AM -0700, Ilya Lipnitskiy wrote:
> > On Sat, Mar 27, 2021 at 2:46 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> > > > On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> > > > <tsbogend@alpha.franken.de> wrote:
> > > > >
> > > > > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > > > > From: Chuanhong Guo <gch981213@gmail.com>
> > > > > >
> > > > > > mt7621 has the following memory map:
> > > > > > 0x0-0x1c000000: lower 448m memory
> > > > > > 0x1c000000-0x2000000: peripheral registers
> > > > > > 0x20000000-0x2400000: higher 64m memory
> > > > > >
> > > > > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > > > > memory region and isn't suitable for 512m memory detection because
> > > > > > it may accidentally read the memory area for peripheral registers.
> > > > > >
> > > > > > This commit adds memory detection capability for mt7621:
> > > > > >   1. Add the highmem area when 512m is detected.
> > > > > >   2. Guard memcmp from accessing peripheral registers:
> > > > > >      This only happens when a user decided to change kernel load address
> > > > > >      to 256m or higher address. Since this is a quite unusual case, we
> > > > > >      just skip 512m testing and return 256m as memory size.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > I get
> > > > >
> > > > > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > > > > The function prom_soc_init() references
> > > > > the function __init mt7621_memory_detect().
> > > > > This is often because prom_soc_init lacks a __init
> > > > > annotation or the annotation of mt7621_memory_detect is wrong.
> > > > >
> > > > > Can you please fix this ?
> > > > Thanks, I will fix it. Having trouble reproducing the error, but I
> > > > clearly see the issue. Are you building on a MIPS target or
> > > > cross-compiling (I'm cross-compiling and no errors).
> > >
> > > I'm cross compiling, I can provide you the .config, if you want.
> > Yeah, that would help. I spent quite a bit of time trying to reproduce
> > - tried different options with GCC 8 and GCC 10 to no avail. Maybe you
> > are using clang?
>
> no, but an older gcc (gcc version 6.1.1 20160621 (Red Hat Cross 6.1.1-2) (GCC)).
> config is attached.
Thanks, disabling CONFIG_LD_DEAD_CODE_DATA_ELIMINATION reproduced it
even with GCC 10. Fixed in
https://lore.kernel.org/linux-arm-kernel/20210327053840.471155-1-ilya.lipnitskiy@gmail.com/

- Ilya
