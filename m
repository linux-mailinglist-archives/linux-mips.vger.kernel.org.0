Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BBC35AAA1
	for <lists+linux-mips@lfdr.de>; Sat, 10 Apr 2021 05:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhDJDxi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 23:53:38 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60867 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhDJDxh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 23:53:37 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 13A3r9jS001599;
        Sat, 10 Apr 2021 12:53:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 13A3r9jS001599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618026789;
        bh=EtSDB0y/XnwBbN1kwTKUYAQTMsWSf9iv2ItFBGvpsfc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tyYPoya1RM58+3y9zYQL8gCoMvUg+2Np04CQ3OlwQk1EbUp3zns68o/X/FUuAlNbh
         8DgBA7RlftkBwC1uAI9zXURhjuXbE50lkttdHHpLXHJqnNImUOI0ktxdBhmvZBA91f
         LS5xRezwa28hxLQRSqQCwCG1hmnrA0Oa864D5dcbYFpUz5XqpiPT/p0/yKuBENu+R7
         DJqZ/2UgxIicFMsykMK9Yh47MUZr1AkkdYsNrb7G8E7/wkmEHJNA8yiDkx7LVAqWT5
         cvqnAF6zsIicf4yFgtWBNhfRMkHTe5YnkkHUhbVXsLKyJCHrY4XNUaXiBiXuqKW2kY
         wBwk46KWTJX6Q==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id cu16so1835030pjb.4;
        Fri, 09 Apr 2021 20:53:09 -0700 (PDT)
X-Gm-Message-State: AOAM532/fbllSARnNsHy3A+sm7dOlEbqJFzIppSHR5qLvI+tclEv5/dk
        RCUsrn5dQrxlYsVS73Qc/BbvcFSkmsqrLSIUWIE=
X-Google-Smtp-Source: ABdhPJy+iSbOs/ixV9GvgnZ0PfpOqbetO79thY7Xta3JdTXH/HExBrLMLyFFhPri7Ie5dhOgukVQD03Z7EGKJZ4aS+A=
X-Received: by 2002:a17:90a:28a1:: with SMTP id f30mr17297064pjd.198.1618026788821;
 Fri, 09 Apr 2021 20:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210408205858.51751-1-masahiroy@kernel.org> <20210408205858.51751-2-masahiroy@kernel.org>
 <CAHp75VdZ67Tab2jOU0NSys_P1rU_GicJw_ADd1w9JY4rEG5g1w@mail.gmail.com>
In-Reply-To: <CAHp75VdZ67Tab2jOU0NSys_P1rU_GicJw_ADd1w9JY4rEG5g1w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Apr 2021 12:52:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPWG883hydsfdJyULr9-ued3QR6M9q52XtVYQ81R5__Q@mail.gmail.com>
Message-ID: <CAK7LNATPWG883hydsfdJyULr9-ued3QR6M9q52XtVYQ81R5__Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Fri, Apr 9, 2021 at 6:24 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 12:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > <linux/kconfig.h> is included from all the kernel-space source files,
> > including C, assembly, linker scripts. It is intended to contain minimal
>
> a minimal
>
> > set of macros to evaluate CONFIG options.
> >
> > IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> > should not be included from assembly files or linker scripts.
> >
> > Also, <linux/kconfig.h> is no longer self-contained because NULL is
> > defined in <linux/stddef.h>.
> >
> > Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF().
> >
> > PTR_IF(IS_ENABLED(CONFIG_FOO), ...) is slightly longer than
> > IF_ENABLED(CONFIG_FOO, ...), but it is not a big deal because
> > sub-systems often define dedicated macros such as of_match_ptr(),
> > pm_ptr() etc. for common use-cases.
>
> >  include/linux/kernel.h            |  2 ++
>
> Why kernel.h? Shouldn't it belong to a particular domain with a
> respective header file?
>
> Really what we have in the kernel.h right now is a complete train
> wreck of something.
> We have to define what exactly is kernel.h for?


<linux/kernel.h> contains random utility macros.

I did not find a good header to put it in otherwise.


>
> Arnd? Others? Shall we start a wider discussion on the topic?
>
> --
> With Best Regards,
> Andy Shevchenko


--
Best Regards
Masahiro Yamada
