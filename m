Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B4F2F8599
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 20:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbhAOTge (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 14:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388324AbhAOTfd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Jan 2021 14:35:33 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01DEC0613C1
        for <linux-mips@vger.kernel.org>; Fri, 15 Jan 2021 11:34:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u25so14828166lfc.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Jan 2021 11:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3WpvQp1xd2M6YCL4iuaoOe6KYDa0I+oc+7FC+fbqdyI=;
        b=gqTf7Ku8aLQUSJiDrPxX5/iHQNuytLM5wvVuMsQAW/nAzH4a3NUy687vWrJsakVdRQ
         OMEX2qCtBWQ+k301uwhPqsAXygBVBuE+dRcUv3OdKnyAq17wrHgJONo1UzhaTG8f7+2R
         moEU17kWGYeIAZzp9DsJmMT3EQa2+JqxsiWKp3BDXHXTGFCUSdDiMc9jasKeZu4zYnSc
         UZfjzK3CdXwbcI3p7dVXa3/UuKIMxx6ImIshXw03wY+pqed+jceb/EGb68t1sTvlN/yU
         9HkGWCvs+8hrM+7RSZ/fCp5Y03+1iumWDlDzNDevIh2Sve/o+EdNneiqB7PusdNDaF9M
         ZBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WpvQp1xd2M6YCL4iuaoOe6KYDa0I+oc+7FC+fbqdyI=;
        b=nNdQoopUu2HjupNPmffx3rPjdVzf7d8OUMZqa8MIeNGmiv3rw7CxPnyiLPMCogobYm
         fOo2BtRco2AcK1Hbp/O2AkZdBgsj82Nxi7SReW0In9drHc273XOblG34df8dyW9ORxVw
         7RrlEk07qgQ57O18+31taOccwUAOjnbKMtNNwk3IbXlR3pP9QBF5ypnRnvK4SLb3u6xs
         Prp3xLUTq/v7CC1L1llGK75ea1ERIhNhp1/SCXykk/IA7FKPV38ytuhkYcxYqNFXW27r
         UzqJySLBKfugtq9RxnEia3aw+GpbYqiR0McRFzU2S5kJkc0sv6T7lNElJMKqch3kaTqC
         ccKw==
X-Gm-Message-State: AOAM531jkHCxNUkgcJf608+m78DB6TTnnN+324iOcfk640TrFypJKQSw
        +VgupPWlfGHwMybZ8xWYa+Vro+bPrL1eC3lhu8lF7w==
X-Google-Smtp-Source: ABdhPJz5DjIaS9smEJp/FMHglO1ge2Ca26lgz5a4mVSWP+v3EtgGQLA4HkKlzA3N+OcTZbU/EZe5MG4dQg2VuYCrtfA=
X-Received: by 2002:a19:495b:: with SMTP id l27mr5717193lfj.451.1610739290762;
 Fri, 15 Jan 2021 11:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20210115192622.3828545-1-natechancellor@gmail.com>
In-Reply-To: <20210115192622.3828545-1-natechancellor@gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 15 Jan 2021 20:34:39 +0100
Message-ID: <CADYN=9+vAN+jiieKxpTYa=E6zdJfrcbQPCt3tokopMMs+Mnd8Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Use CLANG_FLAGS instead of filtering out '--target='
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Jan 2021 at 20:26, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Commit ee67855ecd9d ("MIPS: vdso: Allow clang's --target flag in VDSO
> cflags") allowed the '--target=' flag from the main Makefile to filter
> through to the vDSO. However, it did not bring any of the other clang
> specific flags for controlling the integrated assembler and the GNU
> tools locations (--prefix=, --gcc-toolchain=, and -no-integrated-as).
> Without these, we will get a warning (visible with tinyconfig):
>
> arch/mips/vdso/elf.S:14:1: warning: DWARF2 only supports one section per
> compilation unit
> .pushsection .note.Linux, "a",@note ; .balign 4 ; .long 2f - 1f ; .long
> 4484f - 3f ; .long 0 ; 1:.asciz "Linux" ; 2:.balign 4 ; 3:
> ^
> arch/mips/vdso/elf.S:34:2: warning: DWARF2 only supports one section per
> compilation unit
>  .section .mips_abiflags, "a"
>  ^
>
> All of these flags are bundled up under CLANG_FLAGS in the main Makefile
> and exported so that they can be added to Makefiles that set their own
> CFLAGS. Use this value instead of filtering out '--target=' so there is
> no warning and all of the tools are properly used.
>
> Cc: stable@vger.kernel.org
> Fixes: ee67855ecd9d ("MIPS: vdso: Allow clang's --target flag in VDSO cflags")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1256
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

> ---
>  arch/mips/vdso/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index 5810cc12bc1d..2131d3fd7333 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -16,16 +16,13 @@ ccflags-vdso := \
>         $(filter -march=%,$(KBUILD_CFLAGS)) \
>         $(filter -m%-float,$(KBUILD_CFLAGS)) \
>         $(filter -mno-loongson-%,$(KBUILD_CFLAGS)) \
> +       $(CLANG_FLAGS) \
>         -D__VDSO__
>
>  ifndef CONFIG_64BIT
>  ccflags-vdso += -DBUILD_VDSO32
>  endif
>
> -ifdef CONFIG_CC_IS_CLANG
> -ccflags-vdso += $(filter --target=%,$(KBUILD_CFLAGS))
> -endif
> -
>  #
>  # The -fno-jump-tables flag only prevents the compiler from generating
>  # jump tables but does not prevent the compiler from emitting absolute
>
> base-commit: 7b490a8ab0f2d3ab8d838a4ff22ae86edafd34a1
> --
> 2.30.0
>
