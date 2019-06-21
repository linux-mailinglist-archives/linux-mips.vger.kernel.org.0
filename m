Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179F94E37B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 11:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFUJ0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 05:26:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44234 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJ0H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 05:26:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id x47so6174747qtk.11;
        Fri, 21 Jun 2019 02:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxv8AIAF+vbWnNHQODpa0e08ZKpZME4xVDCVWGsgOhw=;
        b=OZ28ist+UGw9clfTiBYOtQoCwj9c4Iz5zgoDMKW/aubIwzEbuc1LWMfBNiHtmPkl37
         iZOphOl1GVk2IE4eizcsbSbFcJPVgaYJI9+qmfecb1PSKbHp6uhX/jpavZPp4rTem42V
         q2G/cmKfkrxZUTtkuiy9R7rt5+JZMtc4m4vfT4KwXSFrLoc7QGBCmSH4VNqmRNouptTV
         vlDicTaNxbHmtbKFjB6i2WBeT7bQhKOKXnCwrom9JGX687xxhlZ8QEMqaNWAdY+8+Xep
         7n7ksU5vItZnxzACmNq7hYLpvOqLVBtCj6GrTp1Sxmd6W1QJTFJD5MNjOyVqHEeq+ATv
         F+oA==
X-Gm-Message-State: APjAAAVHJn6ghLDwmUmZojYR+6erK3+9+fbPZ3K5D+hlCvDBtPvx0SBK
        SrmlUPD61VK11VupbueZcr2FKy7raMiedDeIZg4=
X-Google-Smtp-Source: APXvYqzDXDlgUhDVya1nIzv8V9AuOhrjhfu3JkZen+v8YNQ8eyMHK+jnLczU2c3DV20KVdDwtb2kF3rjc5UX+zfvprk=
X-Received: by 2002:a0c:87bd:: with SMTP id 58mr43431993qvj.62.1561109166469;
 Fri, 21 Jun 2019 02:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
 <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 21 Jun 2019 11:25:47 +0200
Message-ID: <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 20, 2019 at 8:19 PM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Thu, 20 Jun 2019, Paul Burton wrote:
>
> > So this seems pretty reasonable. Build testing all our defconfigs only
> > showed up one issue for decstation_defconfig & decstation_r4k_defconfig:
> >
> >   drivers/net/fddi/defza.c: In function 'fza_reads':
> >   drivers/net/fddi/defza.c:88:17: error: implicit declaration of
> >     function 'readq_relaxed'; did you mean 'readw_relaxed'?
> >     [-Werror=implicit-function-declaration]
> >    #define readq_u readq_relaxed
> >                    ^~~~~~~~~~~~~
> >   drivers/net/fddi/defza.c:126:13: note: in expansion of macro 'readq_u'
> >       *dst++ = readq_u(src++);
> >                ^~~~~~~
> >   drivers/net/fddi/defza.c: In function 'fza_writes':
> >   drivers/net/fddi/defza.c:92:18: error: implicit declaration of
> >     function 'writeq_relaxed'; did you mean 'writel_relaxed'?
> >     [-Werror=implicit-function-declaration]
> >    #define writeq_u writeq_relaxed
> >                     ^~~~~~~~~~~~~~
> >   drivers/net/fddi/defza.c:151:4: note: in expansion of macro 'writeq_u'
> >       writeq_u(*src++, dst++);
> >       ^~~~~~~~
> >     CC      net/core/scm.o
> >   cc1: some warnings being treated as errors
> >   make[4]: *** [scripts/Makefile.build:279: drivers/net/fddi/defza.o] Error 1
> >
> > These uses of readq_relaxed & writeq_relaxed are both conditional upon
> > sizeof(unsigned long) == 8, ie. upon CONFIG_64BIT=y so they're not going
> > to present a runtime issue but we need to provide some implementation of
> > the *q accessors to keep the compiler happy.
> >
> > I see a few options:
> >
> > 1) We could just have defza.c include <io-64-nonatomic-lo-hi.h> to get
> >    the appropriate declarations, which should then get optimized away by
> >    the compiler anyway & never actually be used.
>
>  This, definitely.

The compiler should generally not be allowed to combine two adjacent
readl_relaxed() back into a 64-bit load. Only __raw_readl() can be
combined or split up. If the mips version of the *_relaxed() accessors
allows the compiler to do this, I would consider that a bug.

> > 2) We could have defza.h #define its readq_u & writeq_u macros
> >    differently for CONFIG_32BIT=y kernels, perhaps using
> >    __compiletime_error to catch any bogus use of them.
> >
> > 3) We could do the same in a generic header, though if nobody else has
> >    needed it so far & this is the only place we need it then maybe it's
> >    not worth it.
> >
> > So I'm thinking option 2 might be best, as below. Having said that I
> > don't mind option 1 either - it's simple. Maciej do you have any
> > preference?
>
>  The use of 64-bit operations to access option's packet memory, which is
> true SRAM, i.e. no side effects, is to improve throughput only and there's
> no need for atomicity here nor also any kind of barriers, except at the
> conclusion.  Splitting 64-bit accesses into 32-bit halves in software
> would not be a functional error here.

The other property of packet memory and similar things is that you
basically want memcpy()-behavior with no byteswaps. This is one
of the few cases in which __raw_readq() is actually the right accessor
in (mostly) portable code.

       Arnd
