Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB3FB1097A0
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 02:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfKZBtV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 25 Nov 2019 20:49:21 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:35378 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKZBtU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 20:49:20 -0500
Received: by mail-il1-f193.google.com with SMTP id g12so6656255ild.2
        for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2019 17:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wW9hyDxfop0QD+erGCI46mOvRwn4BFb4nYdhRAAPwT0=;
        b=ixJktLCziNIJ+u5Jk7KKJyAyFqIzqbEht7DA45aVDE6zAnOGIZ/dnN5DGqqe10h3K3
         LSwBZtQUQSjI/VXbe1v+qz+QDmpehqTEESwzg8Ag1jn987ejWFkRUV7MPQn9vL3sPwSn
         oG6GrbiVDAhr0Gy0fODyG6fg1oKjjiZJMvj7XKJefz4qcVJMuITjEMRjAK8sGTn0SYd3
         tDGPJ74j8FxomLjftr1is+MbF6Smt1FyU+jm475XNuENnSIUH/sVX6d7oDUQs81PiR3f
         eEi7Vi0RObdJyKnz7qca8VjTcjBCUE6yLPvd20D7dcJq6pH3xenkIO8gbs3TiqMtzD6K
         05+A==
X-Gm-Message-State: APjAAAXc9pp45tUwraxQgIdQoB9gAK/gRVrLICPdQ1zgMYbOIEWpGHGD
        xPJint6cgUWASnEqcY5DN3YWvyyYNUZcoXRlH68UZH/KI58=
X-Google-Smtp-Source: APXvYqxwx4cnmSLaqGR697WVk5iE2XcOZuardEGJhMwLPQZm00FX2y94V1kfp2TFS2BEGQ82tm5eoAppyYoeqYJL1vo=
X-Received: by 2002:a92:c887:: with SMTP id w7mr35824987ilo.143.1574732959823;
 Mon, 25 Nov 2019 17:49:19 -0800 (PST)
MIME-Version: 1.0
References: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
 <20191122184731.l7ttfg4evgi4tvcp@lantea.localdomain> <EAC4F77C-88BE-47FA-83A5-5855A869425A@flygoat.com>
 <3C1D695B-09AA-4C2D-A94F-84DFC05C6F0C@flygoat.com> <CAAhV-H4R1LqwLyehnTo89XPCeZo=ka=p29_rHVg=vJ_YiqqNCQ@mail.gmail.com>
 <20191125234234.bwoyuxbmwa4jpxwb@lantea.localdomain>
In-Reply-To: <20191125234234.bwoyuxbmwa4jpxwb@lantea.localdomain>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 26 Nov 2019 09:55:30 +0800
Message-ID: <CAAhV-H7kNQZ7Y77qmWusmvOmrySi9RU5JixcTuudR0MjUT9obw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Make sure ebase address is in KSEG0
To:     Paul Burton <paulburton@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

On Tue, Nov 26, 2019 at 7:44 AM Paul Burton <paulburton@kernel.org> wrote:
>
> Hi Huacai,
>
> On Sun, Nov 24, 2019 at 12:00:51PM +0800, Huacai Chen wrote:
> > On Sat, Nov 23, 2019 at 2:11 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > > 于 2019年11月23日 GMT+08:00 下午1:08:38, Jiaxun Yang <jiaxun.yang@flygoat.com> 写到:
> > > >于 2019年11月23日 GMT+08:00 上午2:47:31, Paul Burton <paulburton@kernel.org>
> > > >写到:
> > > >>On Thu, Nov 21, 2019 at 07:30:20PM +0800, Huacai Chen wrote:
> > > >>> Dynamically allocated ebase address above 0x20000000 can be
> > > >triggered
> > > >>> by some special physical memory layout, or just by a "big kernel +
> > > >>big
> > > >>> initrd + big swiotlb" configuration.
> > > >>>
> > > >>> For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64
> > > >it
> > > >>> is usable but this case is warned. However, this warning is useless
> > > >>> because it is unfixable in a specific system configuration. So we
> > > >>just
> > > >>> use CKSEG0 as a fallback.
> > > >>
> > > >>I'd prefer that we don't assume there's memory at physical address
> > > >zero
> > > >>- that property doesn't hold for all systems.
> > > >>
> > > >>How about the change I suggested previously over here:
> > > >>
> > > >>https://lore.kernel.org/linux-mips/20191108191149.bbq3h4xp4famsh2n@lantea.localdomain/
> > > >>
> > > >>Would that work for you?
> >
> > Now this patch has nothing to do with WG bit,
>
> Well, kind of. The 512MB limit is implicitly tied to the lack of a
> functional WG bit.
Yes, if CPU has no WG, we cannot use an ebase address above 512M, but
a CPU with WG also has problems, please see the comments:

            * It shouldn't generally be in XKPhys on MIPS64 to avoid
            * hitting a poorly defined exception base for Cache Errors.

So I think the warning is in order to tell us that we should avoid
ebase address above 512M. And if we don't think this is a problem then
let's simply remove the warning.

>
> > and also has nothing to do with Loongson, it just a problem with ebase
> > address -- on any MIPSr2 platforms where ebase is dynamically
> > allocated.
>
> Right, and the patch I proposed ensures that the allocation happens in
> the low 512MB for systems without the WG bit, ie. in memory we can
> access via kseg0. It just doesn't assume the memory is at physical
> address 0 - it might be, but on some systems there might not even be
> memory at 0.
>
> In practice we allocate memory bottom-up, so I'm not sure how you're
> managing to see problems here anyway - allocations this early should
> easily be within the low 512MB. If you could explain step by step what
> actually goes wrong on your system that would be helpful.
OK. Traditionally, Loongson-3's memory layout is like this:

0-240M: low memory
240-256M: reserved for firmware
256M-4G: holes, including PCI mem, MMIO registers, etc.
4G-...: high memory

In practise, the kernel can hold as large as 60M memory (because of
sparsemem), then initrd can be also as large as 60M (a full functional
rootfs), swiotlb can be as large as 128M. Initrd and swiotlb is
allocated before ebase, so in this extreme case, ebase address is
above 512M.

Huacai

>
> > In the comments it is said that ebase address above 0x20000000 (which
> > should be in XKphys) has problems to handle cache error. However, if
> > we really treat it as a problem, we should avoid it (not just a
> > warning); and if we don't think it is a problem, then we can remove
> > the warning (because the warning is unfixable in a specific system
> > configuration).
>
> The warning can probably go away if my patch is applied, since the
> allocation is constrained to the right memory region anyway.
>
> Thanks,
>     Paul
