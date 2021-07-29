Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778FC3DA1B0
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 13:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhG2LBD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 07:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236297AbhG2LBD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 07:01:03 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BFBC061765
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 04:00:59 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o5so10021025ejy.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Jul 2021 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CPl72CTRKTyBPOkyHMrKfvLxTsV28S+LW8UAm6G6RA=;
        b=YqupzJc1n8+9T1c9St1JpnYa3HjOaBkFSrrk1FFQAhIQoRYTdyIoZ5Ym4vwDfqZR7k
         iQ4ZH7vlYe2LzU3WjnP0VVloLerC2HwDBZ2TUuJPNv7AckJn9RO/O5ZGTe1T4pDD04FL
         MrnYdNuX9ms2QWjocJOISakKIbvbl1l2FkKONcEGCsvQcjXvNT+pYLrCl7oXSPqE4wr9
         RG5M/wiepphR5OI4zsvFoiaipGWrwi3TYOiOaCwooDfCDFT1CBozJZG0XC44FJ8wb/Dd
         2cLkzCiTiq3gC22plVM2qk9AL2Oqv1fls1QEfLaUbq/uHjTWvrsWyzIijQVLaDFmNu4w
         X++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CPl72CTRKTyBPOkyHMrKfvLxTsV28S+LW8UAm6G6RA=;
        b=UVgXYSx8BE93WpmLgAbcOxUkLhkNZhiDxUF+BRvO/8nsTkLHOd8rsbPL6g+9/tz/8l
         +XJzjD/bK4WX8Yy4WpJgqHT9EFWCOa1MNT9KeLgGvwxrKZxV3M+2BMkNQdGs2J1WwYRj
         CMajqYhtyP34Ct+VWRxaN1iL+7izKZGrD6d0w/t/q5iMWgPcHo5m8I+mfOJohFO8Ye/g
         XivuYHKdycqboiZ6w7lkqLmqFuRnqN8i4vP+sgL40cIM6zIbmg4IcUeJEA0+dVesmuYM
         b/lVVH+P/Y97tvncM/03Ib7ySQlsJuaGxErmijmdwk4Q7I+2NljxhdGmOnngfllbbBVj
         lOow==
X-Gm-Message-State: AOAM533eHI7FgJzDFe6dpbkD/+2LHMMlB8xXTBfIYV4XO5m3NTbZpLBq
        b+HTT4m6gHsid66pHDvT2OXAQzwAPEW85gc6/DkZEw==
X-Google-Smtp-Source: ABdhPJz56fC1z8jL8bdJNiAmNzJYja6e+C+De0BNVFzK6jey9PAOqdKuXpVQTgJqnho0tiKj4Uia/9XRIdova0N+kNQ=
X-Received: by 2002:a17:906:f20a:: with SMTP id gt10mr4080189ejb.267.1627556457991;
 Thu, 29 Jul 2021 04:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210729082549.144559-1-wangrui@loongson.cn> <20210729095342.GB8286@alpha.franken.de>
In-Reply-To: <20210729095342.GB8286@alpha.franken.de>
From:   hev <r@hev.cc>
Date:   Thu, 29 Jul 2021 19:00:47 +0800
Message-ID: <CAHirt9htUrD5WCCSWwkD50WMTHC4nMXxr44YNMEfznUWSv_EJw@mail.gmail.com>
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
Okay.

Regards,
Rui

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
