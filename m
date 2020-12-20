Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8022DF381
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 05:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgLTEIF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Dec 2020 23:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgLTEIE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Dec 2020 23:08:04 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C9BC0617B0
        for <linux-mips@vger.kernel.org>; Sat, 19 Dec 2020 20:07:24 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y24so5733272edt.10
        for <linux-mips@vger.kernel.org>; Sat, 19 Dec 2020 20:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wOf8+A262GmOiEINk0rmRSARiAG9AAz8GlRftMSrMUg=;
        b=tVIzn00AiVt6Z+BacumkSdrwTo41xF8yNb7ZGnIZO3w9rJE83Qqz2LnkKGAa528x/Z
         dgszo95Fb6joP2TWI8VUxnWtJqJSv92TGc4vmg0ebzD2gs+OuxAjPCyp7drmqcNM7d1m
         ElfTE3vxYNDNeTWZDC3na+/iJHRLkP56afQ6SDZaoVXGDLUcok8pLZkhp7MP4ofmNyQH
         cp9jiILsSeuiDaFHIOiKNOVW8ut61NFRh7gLq+wqab88zn3ECbBM9zswKBzm1VVR+kQe
         9zGUn4b5wdLdsLOkpVgZNQ7T9mXSWdWoUKQsjZlxUQrZJ3p30ZcCv4Jk2pOSStzqGlyG
         cKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wOf8+A262GmOiEINk0rmRSARiAG9AAz8GlRftMSrMUg=;
        b=elgibuGoEZ04CpY2ra5/L0SjpKw8co3L6546Z3WAQwixqaT+xXG93S8x0p1ddXuysS
         sUK0i0hcCLWaLP7ydZn97eFhA7kFLs/VfFTcM3a8LTQMtkfkj6bljsyunfmtUdfcOMKW
         bjdokYS99YrQrMPuwbaa/JOQ3IY6bnUuuzkY+fwKgdd4wRqv1fdBAUfTfUd9mPhUziFh
         Qwfdup4R/T9RNVMdCEBIbpR2UWldRH1RKYs51FhjzviYSAj5EBpvgR/Nyl1F1WL5q6VY
         aduh7dzH3PM/6l9+1YL/apwxp0uWF9tPF8IWwRYdbOCjSbnN8XjjZ8513/CFGN4KQzK4
         SiVQ==
X-Gm-Message-State: AOAM531hlAGIgZjKCHwGyEdcGkpjeXbv43qAJWOwtTacVTJCj0h+L/Gj
        MB4AL20qtwWcgIqUtY+UBsTZxVCM1xl3Pf8fM3M0cQ==
X-Google-Smtp-Source: ABdhPJyFCkCTDMEKhRzBCZSvwPxUNNzCRb89KLm4awpKTLrq05HwzS1MDuXkyvhQB1RJW2ONi4lcVB3kzVan50pORdw=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr10998852edw.52.1608437242889;
 Sat, 19 Dec 2020 20:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20201211102437.3929348-1-anders.roxell@linaro.org> <20201214152447.GC9149@alpha.franken.de>
In-Reply-To: <20201214152447.GC9149@alpha.franken.de>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Sun, 20 Dec 2020 09:37:11 +0530
Message-ID: <CA+G9fYuyq8da6oF-6KaVHmA2TpT7fOG5F4ZDbK=MpzYMg_ufAw@mail.gmail.com>
Subject: Re: [PATCH v2] mips: lib: uncached: fix non-standard usage of
 variable 'sp'
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Anders Roxell <anders.roxell@linaro.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 14 Dec 2020 at 21:05, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Dec 11, 2020 at 11:24:37AM +0100, Anders Roxell wrote:
> > When building mips tinyconfig with clang the following warning show up:
> >
> > arch/mips/lib/uncached.c:45:6: warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
> >         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
> >             ^~
> > arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
> >         register long sp __asm__("$sp");
> >                         ^
> >                          = 0
> > 1 warning generated.

<trimp>

> > [1] https://docs.w3cub.com/gcc~10/local-register-variables
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  arch/mips/lib/uncached.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> applied to mips-next.

We have noticed these build failures on stable tree also.
May I request you to initiate the process to get into the stable tree
and for the following branches.
 - linux-5.10.y
 - linux-5.9.y
 - linux-5.4.y
 - linux-4.19.y

- Naresh
