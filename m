Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A671A387D1E
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 18:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350514AbhERQNq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 May 2021 12:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350239AbhERQNn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 May 2021 12:13:43 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EED5C061756
        for <linux-mips@vger.kernel.org>; Tue, 18 May 2021 09:12:24 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e11so12229629ljn.13
        for <linux-mips@vger.kernel.org>; Tue, 18 May 2021 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ryNGn3iPnypPYn2b5vg9zKKQ/b9xvDeiGVvzaVD/bEs=;
        b=EaWVhjNrNBWn6f1mh1OvKUeDE/tFuKqvgMLfofpYgBGgWg79RhbWTVMtICXNGGKhjS
         3Mq5M+u41o3/M+25Q2/C6ZfA8MHWu/DrQxEX0WIpCg+HH9Ws5sQuJVmPUoK2wkGm2nzc
         sbk5hpok8r5v8UCa0qR/IAKlL2f1Ed+l4beT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ryNGn3iPnypPYn2b5vg9zKKQ/b9xvDeiGVvzaVD/bEs=;
        b=eS8/QmHmbs3vJxu2Dag0Vi17/s13nWwGYMGFNasfkdyqSvDeygSMpug23ip9yyk1Cd
         MVBQHQDCZKfHj3YYVluAn9c6RqsNoOa7QqLF3uN/efq4qIOpLUTpVf4qBmcpIZx6XCix
         DmDeR4/wcONK5z+kWT8gsyngoMijmLONfBAIpdp6yJYHI0hvTpdatw7XMsS0IhvHXQeh
         V5VabcUm1WlgPM/KFV49pRySYb8U4fT3WikpWnuJw+FVs/2CrfRK8V/zE1LPJHhPb3Yn
         5CSRPmrZHFBXGOWcVMQffuTpmVknj9Z2HhMREzS/feEMq4N462US5/BqBAwpsmw5QiT1
         y4NQ==
X-Gm-Message-State: AOAM531DaDBA0CJ00PUNI6FGOFgmu3m+hIODA+Nx6s2M+7xneml6vhq6
        lMlXy7m6dsLcMuTEF/tDVJ9UpY4SRZD0SeAk
X-Google-Smtp-Source: ABdhPJz+3CoXsMIuoUuAcFQ2SlA56CTrQNbsrlgLuuHaes7eH99br8IWmcXfrYQmGHAVTigESj9y1w==
X-Received: by 2002:a05:651c:230:: with SMTP id z16mr4517466ljn.439.1621354342320;
        Tue, 18 May 2021 09:12:22 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id z20sm2188412ljk.123.2021.05.18.09.12.20
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 09:12:20 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id v8so10001618lft.8
        for <linux-mips@vger.kernel.org>; Tue, 18 May 2021 09:12:20 -0700 (PDT)
X-Received: by 2002:a19:ca15:: with SMTP id a21mr4619384lfg.487.1621354340156;
 Tue, 18 May 2021 09:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org> <20210514100106.3404011-8-arnd@kernel.org>
 <YKLlyQnR+3uW4ETD@gmail.com> <CAK8P3a0iqe5V6uvaW+Eo0qiwzvyUVavVEfZGwXh4s8ad+0RdCg@mail.gmail.com>
 <CAHk-=wjjo+F8HVkq3eLg+=7hjZPF5mkA4JbgAU8FGE_oAw2MEg@mail.gmail.com> <CAK8P3a3hbts4k+rrfnE8Z78ezCaME0UVgwqkdLW5NOps2YHUQQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3hbts4k+rrfnE8Z78ezCaME0UVgwqkdLW5NOps2YHUQQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 18 May 2021 06:12:03 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjuoGyxDhAF8SsrTkN0-YfCx7E6jUN3ikC_tn2AKWTTsA@mail.gmail.com>
Message-ID: <CAHk-=wjuoGyxDhAF8SsrTkN0-YfCx7E6jUN3ikC_tn2AKWTTsA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] asm-generic: unaligned always use struct helpers
To:     Arnd Bergmann <arnd@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Eric Biggers <ebiggers@kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 18, 2021 at 5:42 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> To be on the safe side, we could pass -fno-tree-loop-vectorize along
> with -O3 on the affected gcc versions, or use a bigger hammer
> (not use -O3 at all, always set -fno-tree-loop-vectorize, ...).

I personally think -O3 in general is unsafe.

It has historically been horribly buggy. It's gotten better, but this
case clearly shows that "gotten better" really isn't that high of a
bar.

Very few projects use -O3, which is obviously part of why it's buggy.
But the other part of why it's buggy is that vectorization is simply
very complicated, and honestly, judging by the last report the gcc
people don't care about being careful. They literally are ok with
knowingly generating an off-by-one range check, because "it's
undefined behavior".

With that kind of mentality, I'm not personally all that inclined to
say "sure, use -O3". We know it has bugs even for the well-defined
cases.

> -O3 is set for the lz4 and zstd compression helpers and for wireguard.

I'm actually surprised wireguard would use -O3. Yes, performance is
important. But for wireguard, correctness is certainly important too.
Maybe Jason isn't aware of just how bad gcc -O3 has historically been?

And -O3 has often generated _slower_ code, in addition to the bugs.
It's not like it's a situation where "-O3 is obviously better than
-O2". There's a reason -O2 is the default.

And that tends to be even more true in the kernel than in many user
space programs (ie smaller loops, generally much higher I$ miss rates
etc).

Jason? How big of a deal is that -O3 for wireguard wrt the normal -O2?
There are known buggy gcc versions that aren't ancient.

Of the other cases, that xor-neon.c case actually makes sense. For
that file, it literally exists _only_ to get a vectorized version of
the trivial xor_8regs loop. It's one of the (very very few) cases of
vectorization we actually want. And in that case, we might even want
to make things easier - and more explicit - for the compiler by making
the xor_8regs loops use "restrict" pointers.

That neon case actually wants and needs that tree-vectorization to
DTRT. But maybe it doesn't need the actual _loop_ vectorization? The
xor_8regs code is literally using hand-unrolled loops already, exactly
to make it as simple as possible for the compiler (but the lack of
"restrict" pointers means that it's not all that simple after all, and
I assume the compiler generates conditionals for the NEON case?

lz4 is questionable - yes, upstream lh4 seems to use -O3 (good), but
it also very much uses unaligned accesses, which is where the gcc bug
hits. I doubt that it really needs or wants the loop vectorization.

zstd looks very similar to lz4.

End result: at a minimum, I'd suggest using
"-fno-tree-loop-vectorize", although somebody should check that NEON
case.

And I still think that using O3 for anything halfway complicated
should be considered odd and need some strong numbers to enable.

               Linus
