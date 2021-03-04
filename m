Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9461F32D8B4
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 18:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbhCDRjB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 12:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239335AbhCDRic (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 12:38:32 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CF9C061756
        for <linux-mips@vger.kernel.org>; Thu,  4 Mar 2021 09:37:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id z11so44519057lfb.9
        for <linux-mips@vger.kernel.org>; Thu, 04 Mar 2021 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUm+wrU+zPffvuvuqzEDrb7B5867dCk2K+ib6TOEEgo=;
        b=Tqlqhenucz2QG4wNMNGaEQoVzwsa6uUxO3Tn3Pm+6mLEMjIivih5jOlMx7ShK8K+7m
         33Ytd+lIXipxsDGnCEE4YDXHzk38MnHRXL1GAy4IMxRta8sBCLdr1Ml6QgQuXrODDLtB
         PJszG5y5Ezwiv6P7nU+lrCT1xeHwAvmzrgZxLgLUmMzpj4CfSswO57NjBXPOLepT5PN0
         S8awmk6PptvzgKxpb3+ReItihc+6C0IJo7jQeEC/yeqP9qchkMkAybA9ZxB9fRHExTPe
         9IjKyLrWv9BsBIWsdXjCZ+N+YKmZhP5WFhIY6wyZPfyDBt9UDjft/OBM6ieQjau87I32
         pTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUm+wrU+zPffvuvuqzEDrb7B5867dCk2K+ib6TOEEgo=;
        b=iwU5NIb0P4uZ0OqX1JL3E0Wo+O6ym/WdBhW/r0WBp3dINkxamnIA/0Ca7JuzvqIhRt
         XMShIV2HWZe1W74twQxG6BpxPkJkPEdk4LtGhSrZg4N7jGLFpXIsFmAiqdl6JgSP3dsw
         KgC2krU13vQ1UG3KQLdx4zBJw9hSAfTosd5HdUk1aVmmqB6IOHwToiRp4le7x7xuXkrZ
         C2N5/I3rTMz9bRKKfxJZkMFrOmos0T8TbcDVpM2rPV2Kk2AwQeO06P9KhKtuADRoq3W8
         byuHMs2y6tdmYSts3cxq/ELYANEABGK45DStqRsfkYRfRkqn0hZs32m80RZLRaGsp6Vc
         iHEQ==
X-Gm-Message-State: AOAM530BXb5bGOGq1xPEiXFzAgVWttKgV5/FRdXdehNzDqsvWODwFuZY
        tkn4jtZ3aTcM2rxvP9dJZ4/h3u7500LWjv6jHvVSGA==
X-Google-Smtp-Source: ABdhPJxuTcNbs/XcwFkEzxoSAdn3uzst20zCqqf3nCkdUYwm3Qpq6+NCw0B3jFq9xaaCX3UOKfLFjvvOPWj+1+QaYoU=
X-Received: by 2002:a19:da19:: with SMTP id r25mr2737199lfg.368.1614879470392;
 Thu, 04 Mar 2021 09:37:50 -0800 (PST)
MIME-Version: 1.0
References: <1614845040-12995-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1614845040-12995-1-git-send-email-yangtiezhu@loongson.cn>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Mar 2021 09:37:39 -0800
Message-ID: <CAKwvOd=TXBzBb-nJsAMHO99P7y7eOZRJB=veDtesPFNDPuhy2w@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Make MIPS32_O32 depends on !CC_IS_CLANG
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 4, 2021 at 12:04 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> When building with Clang [1]:
>
> $ make CC=clang loongson3_defconfig
> $ make CC=clang
>
> there exists the following error:
>
>   Checking missing-syscalls for O32
>   CALL    scripts/checksyscalls.sh
> error: ABI 'o32' is not supported on CPU 'mips64r2'
> make[1]: *** [Kbuild:48: missing-syscalls] Error 1
> make: *** [arch/mips/Makefile:419: archprepare] Error 2
>
> This is a known bug [2] with Clang, as Simon Atanasyan said,
> "There is no plan on support O32 for MIPS64 due to lack of
> resources".

It's my hope we will fix the resourcing issue.  I'm working on that;
it's a non-technical challenge though.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> It is not a good idea to remove CONFIG_MIPS32_O32=y directly
> in defconfig because GCC works, as Nathan said, the config
> should not even be selectable when building with Clang, so
> just make MIPS32_O32 depends on !CC_IS_CLANG.
>
> [1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
> [2] https://bugs.llvm.org/show_bug.cgi?id=38063
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
>
> v3: Update the commit message suggested by Nathan, thank you!
>
>  arch/mips/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 3a38d27..f6ba59f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3318,6 +3318,8 @@ config SYSVIPC_COMPAT
>  config MIPS32_O32
>         bool "Kernel support for o32 binaries"
>         depends on 64BIT
> +       # https://bugs.llvm.org/show_bug.cgi?id=38063
> +       depends on !CC_IS_CLANG
>         select ARCH_WANT_OLD_COMPAT_IPC
>         select COMPAT
>         select MIPS32_COMPAT
> --
> 2.1.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/1614845040-12995-1-git-send-email-yangtiezhu%40loongson.cn.



-- 
Thanks,
~Nick Desaulniers
