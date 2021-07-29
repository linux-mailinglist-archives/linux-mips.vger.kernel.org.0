Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19C63DA32F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236641AbhG2Mb0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 08:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235199AbhG2Mb0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 08:31:26 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB682C061765
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 05:31:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gn26so10447795ejc.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 05:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pAlRh+wkGLyuqbFE3mr2cV+7ToRtmCbSYmRIkhraGpE=;
        b=UI0iLaZSvS2VBycjWJ/oRfi0kO5sohzTVNh1WgPnrZKPdTOryFS+e7uxhmd6Z1uBIC
         CU2dSKnfGAlPK9OM4zTEvLDAJcBSw1df9hlTEZhB9amzZSekW26AIelZyLezbD0c4elT
         9q8iMeE6novwkdTrpFFKvOFebBVLr7RRVfmYc8zgcuWYilzNNp9nIZOL6MEKOeRgDaCi
         y1tRwo2yHwlU08DPzyNbU19XpiGdfHKFa54a9hUJ+9M7a9nvNacGZ7VkF6nSQbN4PUNg
         qu6ciUNGDV/epCrMmYb5lvjd8MtuCgY2rWyVCYjCbDfx4la1A7LB3DJZadO6pb1xLgHX
         99gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pAlRh+wkGLyuqbFE3mr2cV+7ToRtmCbSYmRIkhraGpE=;
        b=UNQBHoDOfe8lAxweuumI5qN9RewZcadV50PAxhEI6bUQJIVXvfPZ/HsxAY52I7Ju6Y
         TYyic/oFE3CbEbTt9wqI6JAljJ8/OGXKGseu83Q5jxw5Cp15R0npbci83CbDQnjL3ulm
         gM/hNnWr0WTVEeUOY3V5ahkO30lCYHlJ7rZntezcJ3cISZYqz3teReGEzWuN/uNtTMb5
         BvTVb8gNj8zakzpb7dvyQFDLKe9+gUAH8v80juru/Aj+auIomnoqPpf09Ii9owgcS+dY
         4sQZR/MEjErq6SgJLoCwVVK09Cam8l+4W9mCnU9WWF7snsqFZqFghxuOoE4Hw9Guya5M
         o/7Q==
X-Gm-Message-State: AOAM533RbKC5q+kQBm84ftZzgo7GB3ZA/EkzxgsCc5dDR8uUPqDTJLX6
        gQ01m3FCSbe+byPaTP0C2e/TnJeGTaALbHSk5IIwQA==
X-Google-Smtp-Source: ABdhPJzGMBIS1kNQcPwfN3izh/E+lCtFwROA5mgT/2cDCtPpqNGrCMPpEJvcQ2dN7IOXHRivD1NKqk+/sc0PwqQIX+k=
X-Received: by 2002:a17:906:ce4c:: with SMTP id se12mr4515044ejb.292.1627561881596;
 Thu, 29 Jul 2021 05:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210729082549.144559-1-wangrui@loongson.cn> <20210729095342.GB8286@alpha.franken.de>
In-Reply-To: <20210729095342.GB8286@alpha.franken.de>
From:   hev <r@hev.cc>
Date:   Thu, 29 Jul 2021 20:31:11 +0800
Message-ID: <CAHirt9hLATcnSw9HXSo-TZ+buNHJXJvFtJEy56_Bi+mOfckNjw@mail.gmail.com>
Subject: Re: [RFC PATCH] locking/atomic: arch/mips: Fix atomic{_64,}_sub_if_positive
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rui Wang <wangrui@loongson.cn>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, Jul 29, 2021 at 5:53 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Jul 29, 2021 at 04:25:49PM +0800, Rui Wang wrote:
> > This looks like a typo and that caused atomic64 test failed.
> >
> > Signed-off-by: Rui Wang <wangrui@loongson.cn>
> > Signed-off-by: hev <r@hev.cc>
> > ---
> >  arch/mips/include/asm/atomic.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> > index 95e1f7f3597f..a0b9e7c1e4fc 100644
> > --- a/arch/mips/include/asm/atomic.h
> > +++ b/arch/mips/include/asm/atomic.h
> > @@ -206,7 +206,7 @@ ATOMIC_OPS(atomic64, xor, s64, ^=, xor, lld, scd)
> >   * The function returns the old value of @v minus @i.
> >   */
> >  #define ATOMIC_SIP_OP(pfx, type, op, ll, sc)                         \
> > -static __inline__ int arch_##pfx##_sub_if_positive(type i, pfx##_t * v)      \
> > +static __inline__ type arch_##pfx##_sub_if_positive(type i, pfx##_t * v)     \
> >  {                                                                    \
> >       type temp, result;                                              \
> >                                                                       \
>
> sub_if_postive looks unused to me. Could you send a patch removing it
> instead ? riscv also has a sub_if_positive implementation, which looks
> unused.
I found atomic{_64,}_dec_if_postive is based on sub_if_postive, and
used in many places:

kernel/kmod.c:    if (atomic_dec_if_positive(&kmod_concurrent_max) < 0) {
kernel/kmod.c:
atomic_dec_if_positive(&kmod_concurrent_max) >= 0,
kernel/module.c:        ret = atomic_dec_if_positive(&module->refcnt);
...
drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:
atomic64_dec_if_positive(&esw->user_count);
drivers/net/netdevsim/fib.c:        atomic64_dec_if_positive(&entry->num);
drivers/net/netdevsim/fib.c:        atomic64_dec_if_positive(&entry->num);

Are you sure to remove it?

Regards,
Rui

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
