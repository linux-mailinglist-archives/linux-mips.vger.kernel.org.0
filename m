Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA71A359912
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDIJY6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 05:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhDIJYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 05:24:54 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA48C061760;
        Fri,  9 Apr 2021 02:24:40 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w8so369770pfn.9;
        Fri, 09 Apr 2021 02:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eqDORfVYih3KdHWf8wh+CjrsEDSV3l8FMtBY017n5ac=;
        b=FPkpy4xo3U7lSI+b72CXor5mLB4WB7xRgrIC0e0/E9Ur2Gf3DvbtTf+SqoeONPSEA5
         bKXSuA0P7DABvV2z3CroS6el/a5QRlj0uMVckp+iIWTh6YigSod5lK5iSoUrJQvJpo3/
         5ATuYBxcuoT1fE1ofiz7cc/IJFZ6QvovLQDLqvshPFFHUeyhbGUMfI0UoidpQ8oBXe9i
         l+g4cYbzzH9Lvon0cSTFS6JsTf4jrnJ4LtPlfZwjkXB35EQK1/q9Em9WgELFFLbYoR8u
         zcXJ/3ItrKMmHTar3w0mMyLRJI3vX+x1Ntm1lkfeRt2LQGGAXfoiVOM3xwptzAR+xZ8z
         VwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eqDORfVYih3KdHWf8wh+CjrsEDSV3l8FMtBY017n5ac=;
        b=UrdnLmC4wseX6/7y0Dc46G61bPUWdyapWcKX7BPdhEAyjbMMLL3KNfWTSvp1INlJZi
         DgKa9jXKqe9+FfbaajNKboiFsQ8kjZx5hu7O7FT4qFdPM0zI/VS7NMg8BnLUVhiVTbOU
         9leGPf2zcgp9funrZDzDkO38xteLR0gvMDCtYyflUMJ+nooDGPL5oUKtq4VvyEkaCpKO
         Dt6wjALK0llEEWzytEaGZFWr9cUebEWMypENZ+Mrya7RZOALVAcbosigmEP0PvfrexSB
         UPv1IR3z9iu1f/NVMsi8ctS7p4jOx9Gd4wGi47DNpOH4ofDyUwsdSQbz2luqM7TO80Ib
         avkw==
X-Gm-Message-State: AOAM532ZCwfUUO4zITA7/cQbgEDxbGaNaNz/UsEOiglkGNweZiKZVTCT
        duI68V2IHJlyxM/4S4wcHE8Lmg8+NvF3n/4Ivq4=
X-Google-Smtp-Source: ABdhPJyyVY6OveNJsRaLQ77/g3WxhETPEL2Tr0wIxsYjLWDeGaWxTKJuY8IwV2ZN2+DTEION8vYAHDLN6Gye3w+Yp9M=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr12053286pga.203.1617960279766;
 Fri, 09 Apr 2021 02:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210408205858.51751-1-masahiroy@kernel.org> <20210408205858.51751-2-masahiroy@kernel.org>
In-Reply-To: <20210408205858.51751-2-masahiroy@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Apr 2021 12:24:23 +0300
Message-ID: <CAHp75VdZ67Tab2jOU0NSys_P1rU_GicJw_ADd1w9JY4rEG5g1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 9, 2021 at 12:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> <linux/kconfig.h> is included from all the kernel-space source files,
> including C, assembly, linker scripts. It is intended to contain minimal

a minimal

> set of macros to evaluate CONFIG options.
>
> IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> should not be included from assembly files or linker scripts.
>
> Also, <linux/kconfig.h> is no longer self-contained because NULL is
> defined in <linux/stddef.h>.
>
> Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF().
>
> PTR_IF(IS_ENABLED(CONFIG_FOO), ...) is slightly longer than
> IF_ENABLED(CONFIG_FOO, ...), but it is not a big deal because
> sub-systems often define dedicated macros such as of_match_ptr(),
> pm_ptr() etc. for common use-cases.

>  include/linux/kernel.h            |  2 ++

Why kernel.h? Shouldn't it belong to a particular domain with a
respective header file?

Really what we have in the kernel.h right now is a complete train
wreck of something.
We have to define what exactly is kernel.h for?

Arnd? Others? Shall we start a wider discussion on the topic?

-- 
With Best Regards,
Andy Shevchenko
