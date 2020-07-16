Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C741D222125
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 13:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGPLKW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 07:10:22 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45395 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgGPLKV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jul 2020 07:10:21 -0400
Received: by mail-io1-f68.google.com with SMTP id e64so5530148iof.12
        for <linux-mips@vger.kernel.org>; Thu, 16 Jul 2020 04:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lm6MoKcvV1r1apWfRgucdj/gJkRPmSTLL3MgGe87wzo=;
        b=esmhdVSSzIJfFwcu8WGm669qbHK+EYIKLAhyj4Q0GUelEt3XYJtfm4FAp+FXmq3s70
         p/D7SKO1myh/2IzyTYnsDQSxtuwxbhbCRgkyl6jQBttvpGdtCYzxYDj+56e0Mdu8Rcwu
         LvcBT5k6wanBIlSvahYEvcwvo1GsHbYrv0pHFXDO6xGehI0q5QYLUGjqB736WOUdbVSU
         PtH50ESZk9YyNqGp+KdxjjRDKgvOiw2/pdPIi0ELRRhdzM8gKf+/DQZqWDoyek239dE9
         JjN30QguYN1BtJNgPSTt2vx3HIMLDcmzOGhSS+irxON9LiyaGCEl17DdsNReLxnZhEnO
         7HLA==
X-Gm-Message-State: AOAM533naoCjWq0Y61WvcOJNvudR6PFPSEigbpwLmSTCBrFAStp2Ce48
        SVvbxjPM17g6TEqQjhReZqwwb0gP09asJ7Tv1eE=
X-Google-Smtp-Source: ABdhPJx9MROl97S3VZHts/HDSKOK4wq6g1olCAuFLWtHDeDNCuJEBb/d1c8c5iJF6dzrjWX/4Sz4pkvRimI17KMyH0k=
X-Received: by 2002:a05:6602:1408:: with SMTP id t8mr3957395iov.125.1594897820671;
 Thu, 16 Jul 2020 04:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-4-git-send-email-chenhc@lemote.com> <20200716100030.GG8455@alpha.franken.de>
In-Reply-To: <20200716100030.GG8455@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 16 Jul 2020 19:10:09 +0800
Message-ID: <CAAhV-H6NE9EHxZOGxHqapK1Yj9hmVk0cXhcfG5__O5hNdVxR0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] MIPS: Loongson64: Reserve legacy MMIO space according
 to bridge type
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, Jul 16, 2020 at 6:01 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Jul 09, 2020 at 07:33:44PM +0800, Huacai Chen wrote:
> > Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
> > PCHs (bridge types) have different legacy MMIO space size. According to
> > the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
> > of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
> > according to the bridge type.
> >
> > Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
> > LS7A bridge, so increase it to 0xfffff for LOONGSON64.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/include/asm/io.h                     |  4 ++++
> >  arch/mips/include/asm/mach-loongson64/spaces.h |  3 ---
> >  arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
> >  3 files changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> > index 346fffd..7358372 100644
> > --- a/arch/mips/include/asm/io.h
> > +++ b/arch/mips/include/asm/io.h
> > @@ -51,7 +51,11 @@
> >
> >  /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
> >
> > +#ifndef CONFIG_CPU_LOONGSON64
> >  #define IO_SPACE_LIMIT 0xffff
> > +#else
> > +#define IO_SPACE_LIMIT 0xfffff
> > +#endif
>
> can you please move this #define to mach-generic/spaces.h and
> override it in mach-loongson64/spaces.h ?
Maybe that's not a good idea, because all other archs define
IO_SPACE_LIMIT in io.h, moving to another file may cause some build
errors.

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
