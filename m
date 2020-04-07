Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A8A1A1295
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 19:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDGRWL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 13:22:11 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38831 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgDGRWK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 13:22:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id m17so2037966pgj.5
        for <linux-mips@vger.kernel.org>; Tue, 07 Apr 2020 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1WtbWNWaVQeVcZQhFvV6urZvQa34yJxf2HAD/pRyZ2g=;
        b=A//evzdq82feuNT1S0w8k6MnJEEgUVxfRf/ZPEKgZFogbwDEvZLLPyDFNw0npeOZE5
         aRr9ZB2Ag7cqmATU1j0bo3Wsr9iuVhfezrnQhiBXKR5Qn3cayuIJw4byB9yoMTOHeK9m
         xmG1Lm1Str+uHFCOq12fN/67aoXI6Zue8Qz8W4KcZUHv34DKYKYFue+/y+eFMX4/QnpY
         VH3napxV2cFMjS4+29S9lFxw3fYj3Mqn+9ZltSjfk93fVTAIPfDgl0YX3Ig0I0pfOUcj
         ge/euJffA/n7846Mso1XK6t30DA3z/YmMYCscvFdHLmRYcxL8lWrHs92/hQ1YPhyw1HC
         OCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1WtbWNWaVQeVcZQhFvV6urZvQa34yJxf2HAD/pRyZ2g=;
        b=IixPn5B+s7kipMEn2C8x0zGoqtBzMtwk4EdiPh0MUiNu+7qbgqWNwjuzFqcanQXXzB
         dU8Todl/nnSUwsalDw0848D3Z4nbGD3gEwJgl33PLyyqojEOSVUrcYenSNOURDJ9jnBK
         CEpN2s/FPI16/Tt9aWoQXNd18RBehywySeMgzxm/l2HdUd9olbAdR8pi2QwYffhpaJQ6
         wawBSonOHBd4eW1ncnNIxRq0MMMNfhrWCVhxB9Bz6nfCLXWOXrG+KvioHBifrotipItI
         vsPuNpzewXJOf7HZlxu4/jcG/6ZBFNRJIAKGF7CNgDL92jUPGKZ92NOK4ySYvz9Tx/tV
         YMTg==
X-Gm-Message-State: AGi0Pua83KJVgso12IOkUyI6BvzYRwufDFCbUo53ama7y6FK5Jj3wcUY
        BuMNZ2rpZrIzr6s6Tm/M4fAtWJn47P/xJOd3zbWthQ==
X-Google-Smtp-Source: APiQypLXNlv4R/y81mJvIDWONLy09l47bJvWAJxTsJ2LurRhrn59gKhDUZpgjh+oTtE6x5UfRKdwrsuFsD2nb78XCSQ=
X-Received: by 2002:a63:6604:: with SMTP id a4mr1741195pgc.381.1586280128643;
 Tue, 07 Apr 2020 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com> <20200407080611.859256-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200407080611.859256-1-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Apr 2020 10:21:56 -0700
Message-ID: <CAKwvOd=Upj_OcrhBnqf1=woCRm-g2wqjv882R0HQeMJu12Uq9w@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Truncate load-y into 32bit for 32bit kernel
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 7, 2020 at 1:07 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
> --
> V2: Take MaskRay's shell magic.

V2 is way too clever, V1 was much more readable.

Can this tag be added to the commit to help us track when and where it lands?
Link: https://github.com/ClangBuiltLinux/linux/issues/786

> ---
>  arch/mips/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e1c44aed8156..f8fd3c39fb55 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -286,6 +286,9 @@ ifdef CONFIG_64BIT
>        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
>      endif
>    endif
> +else
> +       # Truncate address into 32-bit
> +       load-y := 0x$(shell echo "$(load-y)" | rev | head -c 8 | rev)
>  endif
>
>  KBUILD_AFLAGS  += $(cflags-y)
> --

-- 
Thanks,
~Nick Desaulniers
