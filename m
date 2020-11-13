Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0396C2B133B
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 01:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgKMA1c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 19:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgKMA1b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 19:27:31 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB1DC0613D1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2020 16:27:31 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 34so2385841pgp.10
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2020 16:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LA/+0fbBO/0GzqNIGiTZzCAqdi9dXTWSkcEfRXpxO7U=;
        b=Lv57UCLs6PySz2NeNQRWPGJHaRj8BjuiAkBGczLj1K7ryRfS1D2eLqvrUGPozNDimR
         l2UZ72XWAlLniVd+Ik/P82NsoKZZiWgSNLPy6nkRhTec42D8/eEoAD6tZz9r6VXdsM32
         Cb3HvwQM6+u0d/U0QZf5ctAZJS/H/zAvVROTjaa+8Q7jaZHuAp9OkLXDswOc7wiliW08
         xuyqTY77dXzGxlFJi5ms8/wcdpuqrIYlo/JOQPU3fyAhcIoov2mgLmyNpmTOTjXUIRWA
         EW2RcJPfWJApq5J0h6CN+FcT23c2nsOAyjsLKF2X69of8qnPWmcizqFtUC5XT/pVo7yX
         xA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LA/+0fbBO/0GzqNIGiTZzCAqdi9dXTWSkcEfRXpxO7U=;
        b=XrYLQTOEqtGzuOErRFeEwg1YNOyhkx1QZhhTaBbpUK9hjWj+UBt5dO6nU7CW+XQHBS
         dIxJkQQ1j2bMN31o99jw4lhX6YOyembM4ewfq4u5vkO15lyv+O0M/pC6TeIOtuZaMYs9
         PPaKGxMMDfiMvjTwcRroWVV1xBDCYv4JzpWkTRaifh9QLn5EsVM6zABh1kDHiiugruZV
         jrQ1ADRv28/YQISgZPFXSOzi7AVaATRMZ3OX4vt33E9klKtknhR2+CHYx7nsS1KT7qJ1
         W/NMbtrcAKtZ9TohIe5f9Xs4iD0ZTvHxLMBkPk6mEcc9RiiPPRrh5ehjPyCWbViyieRj
         55NA==
X-Gm-Message-State: AOAM530TVrflX7UCteMV2IJVl56wrhntoxYg5F4N1nH0OYItjyEFhzCm
        PBYPiCOIdZBt48OHgVQZVCLLlkXIst+tmihguqK2cA==
X-Google-Smtp-Source: ABdhPJwVNrmKpB33qx/l8UTZImL9AK+gRfexLb9U4OJGIBPE+pLysupolwnRaRCauW2+IDGekGRCcGH+9RLYRygeJzQ=
X-Received: by 2002:a65:4b81:: with SMTP id t1mr1692517pgq.263.1605227251062;
 Thu, 12 Nov 2020 16:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20201111032105.2346303-1-ndesaulniers@google.com>
 <20201111230314.GB19275@alpha.franken.de> <alpine.LFD.2.21.2011130017330.4064799@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2011130017330.4064799@eddie.linux-mips.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 12 Nov 2020 16:27:19 -0800
Message-ID: <CAKwvOdnqcKGqSAS0BmTP70M-5e+gOvzRefuL9rBNGvm+jpR==Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: remove GCC < 4.9 support
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 12, 2020 at 4:19 PM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Thu, 12 Nov 2020, Thomas Bogendoerfer wrote:
>
> > > Remove a tautology; since
> > > commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
> > > which raised the minimally supported version of GCC to 4.9, this case is
> > > always true.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/427
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  arch/mips/include/asm/compiler.h | 9 +--------
> > >  1 file changed, 1 insertion(+), 8 deletions(-)
> >
> > applied to mips-next.
>
>  It probably makes sense to get rid of GCC_OFF_SMALL_ASM altogether, as
> this syntactical indirection brings us nothing at this point and only
> obfuscates sources.

Sure, that sounds good. Send a patch!
-- 
Thanks,
~Nick Desaulniers
