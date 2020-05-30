Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165F21E9087
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 12:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE3K02 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 06:26:28 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35266 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgE3K02 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 06:26:28 -0400
Received: by mail-il1-f194.google.com with SMTP id a14so4977665ilk.2
        for <linux-mips@vger.kernel.org>; Sat, 30 May 2020 03:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XEJhqV+U6Ph/ERFL3+POcmI8phKJfWhwvN6QE9I1QqU=;
        b=L868tALhXfIcuDYs2HQFiWLXOoQ0Hfe8dV/LDCaBENOJqYbkl8v0k2I7UZ3PuLZ+3Q
         3/6ZznOsIrGJI+U8OsccFQX2djP1NTtb8aEYukBOl+OlmKNaJ/VnvII5qycj9YjBpHie
         vrrCiDIcLH14yJ+mqONNUr88DKpkZ5zMUMD1RBp4maUb+7IuH4MIhgX5fr4bMz8KQclC
         kiLfkJuNgAluOHoggckQudV5dXkbpXB67MRPKDbB4+x37K4N2EjVCC8s/ZH/p2Xr9Arh
         cOoqsWdXQqDGP/KqawgakvVCh2zpQAexEbUdziESlcsG3aHALy6T65/OfqCNbX4nVsVA
         rI+w==
X-Gm-Message-State: AOAM531J5Dv3uBI+TiKP52GrzEx2dCzsi9WdY9K9Jbw1Xjavc6sIJkwR
        rdCE2u3wDPikvYmTnm3Goofe1RN+SYKipf7bqdOdWAgd5to=
X-Google-Smtp-Source: ABdhPJwoL9Z4XSvdCufmjXE6onFk6A/3sKSfaA6PUcuNXTvWLBszjLkkzzVVVcVhhNM50KTwlUgc7bcoV6tTeTNDgFo=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr11534430ilr.147.1590834387092;
 Sat, 30 May 2020 03:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
 <20200529111858.GA11955@alpha.franken.de> <CAAhV-H41SPVQzRmQAVYpgW_dChz+QXwTZHKGWJQv4B7JjQ5gjA@mail.gmail.com>
 <20200530090543.GA3202@alpha.franken.de>
In-Reply-To: <20200530090543.GA3202@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 18:26:15 +0800
Message-ID: <CAAhV-H67mefrZB91NiyNcvgJ0Nem40mK1LiSNdaUX67X5oDBUQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Sat, May 30, 2020 at 5:08 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, May 30, 2020 at 12:43:17PM +0800, Huacai Chen wrote:
> > Hi, Thomas,
> >
> > On Fri, May 29, 2020 at 7:19 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Fri, May 29, 2020 at 04:22:10PM +0800, Huacai Chen wrote:
> > > >  arch/mips/include/asm/inst.h      | 779 ------------------------------------
> > > >  arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
> > >
> > > please use a different filename for this to avoid another disaster
> > > because asm/unaligned.h is already used.
> > It seems like unaligned.h is the best place, because LoadXX/StoreXX is
> > nearly the same thing as get_unaligned/put_unaligned in the original
> > unaligned.h. For PTR_STR, the only confliction comes from
> > lib/test_printf.c, but lib/test_printf.c doesn't include unaligned.h.
> > And it seems there is no future problem, because unaligned.h has only
> > one new macro (i.e., PTR_STR, while LoadXX/StoreXX has no problems).
>
> this approach has two things I don't like. First it duplicates code
> from asm-generic/unaligned.h and second it again risks to leak PTR_STR
> since asm/unaligned.h is included by other kernel code.
>
> I took your patch renamed unaligned.h to unaligned-emul.h, included
> asm/asm.h and replaced PTR_STR by STR(PTR). I've pushed it to mips-next
> with a Co-developed by you.
>
> Thomas.
OK, thank you.

>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
