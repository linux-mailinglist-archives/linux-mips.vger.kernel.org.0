Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0902D7F40
	for <lists+linux-mips@lfdr.de>; Fri, 11 Dec 2020 20:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388081AbgLKTQ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Dec 2020 14:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389050AbgLKTQH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Dec 2020 14:16:07 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62643C0613CF
        for <linux-mips@vger.kernel.org>; Fri, 11 Dec 2020 11:15:27 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id p6so5066973plo.6
        for <linux-mips@vger.kernel.org>; Fri, 11 Dec 2020 11:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zZ6u/dgwrNzUyp4/iz48nhaBhU4okUzFL8r3cjiaumE=;
        b=XBAN1oa9ls86gvI7Rrnt5AyC5R+ixC3nwLXb55s22TP88HhK2MLDugo2jIX42wIqaj
         W58fWoEwyCmXY8A+s8wJH5GGrYkrba1Wmy2iLyw86qIkCYwxwgVDJgII9ekjxgyfb683
         EtZHogzterQzh21PmL5ZhdmvU3Wr3A6O9vlwL2EUSOLEm7qhJayiPqnIKX8yyUf6PKi8
         UPO+6ovJOsVfOah/BJF1bDoCkbKdOHvQM0aRi3a/Gt/T5X6HMg0N0yrO5C5b/mYA8eNY
         o5GCk/a4Vcz/VH3Lj6BC6//DmX4EiOizRtYHgvuPmyG4Z8zL9bQrBoNP9Kw6AHDKqdwB
         Qt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zZ6u/dgwrNzUyp4/iz48nhaBhU4okUzFL8r3cjiaumE=;
        b=iyCNlK/BYh506Gv7Lwt6up4NubeNK6B2Ett2s2Wp2Nof9SfgapHKfKb796SecIrjnu
         /04dAIEzyZBHqHCHCv9Nlyx/rym9rW6B6X11uXVCrE4k7vMyUunHcVEyr+N/91Hkpdo0
         H5EInaX7vw+hC6DX+tEmpNDNDiogSQhXL/7pkckOoNSGVf1LqYSsRpkL11MgWklHvEHZ
         aYe9BQX8AQNDPLhK/UNdY1qWj6rC2PR1+5djeF9jeUrXNSXhhRKhTfP7AB2j/ZXF0Qq2
         v/kW/y8PGyFB+nEeRrFMp+WEbDBf/ceIyhqDGI1LnxHUxxRAOjVjS/f62jZ0t7wiF48H
         shQw==
X-Gm-Message-State: AOAM5334JKxCr0Tq7EBXe7EWriZPFtz6GjcXp3vnzwVjUyOBsQipbGGg
        2zUx2mfVqbIBlt1vtrnYyg8Jl0SOcs7dsTZQhUn36jwjOcJ2OA==
X-Google-Smtp-Source: ABdhPJxfGbwUWvnNecik9NvVjAjwv6pq8F6vjTDTDjud31aSBqFrqzPOKMefvdnPzQRn01QbSIG6u82+0fz7gCjcAlY=
X-Received: by 2002:a17:902:26a:b029:da:af47:77c7 with SMTP id
 97-20020a170902026ab02900daaf4777c7mr12440421plc.10.1607714126633; Fri, 11
 Dec 2020 11:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20201211102437.3929348-1-anders.roxell@linaro.org>
In-Reply-To: <20201211102437.3929348-1-anders.roxell@linaro.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 11 Dec 2020 11:15:15 -0800
Message-ID: <CAKwvOdmD+n_aoVNZnKhkfsd+1p+9N6nnH76ngdkUO3Bo9n1T4A@mail.gmail.com>
Subject: Re: [PATCH v2] mips: lib: uncached: fix non-standard usage of
 variable 'sp'
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 11, 2020 at 2:24 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building mips tinyconfig with clang the following warning show up:
>
> arch/mips/lib/uncached.c:45:6: warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>             ^~
> arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
>         register long sp __asm__("$sp");
>                         ^
>                          = 0
> 1 warning generated.
>
> Rework to make an explicit inline move, instead of the non-standard use
> of specifying registers for local variables. This is what's written
> from the gcc-10 manual [1] about specifying registers for local
> variables:
>
> "6.47.5.2 Specifying Registers for Local Variables
> .................................................
> [...]
>
> "The only supported use for this feature is to specify registers for
> input and output operands when calling Extended 'asm' (*note Extended
> Asm::).  [...]".
>
> [1] https://docs.w3cub.com/gcc~10/local-register-variables
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Link: https://github.com/ClangBuiltLinux/linux/issues/606
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/lib/uncached.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
> index 09d5deea747f..f80a67c092b6 100644
> --- a/arch/mips/lib/uncached.c
> +++ b/arch/mips/lib/uncached.c
> @@ -37,10 +37,12 @@
>   */
>  unsigned long run_uncached(void *func)
>  {
> -       register long sp __asm__("$sp");
>         register long ret __asm__("$2");
>         long lfunc = (long)func, ufunc;
>         long usp;
> +       long sp;
> +
> +       __asm__("move %0, $sp" : "=r" (sp));
>
>         if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
>                 usp = CKSEG1ADDR(sp);
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
