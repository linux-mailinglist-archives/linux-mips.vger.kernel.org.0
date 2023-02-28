Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4716A5FDD
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 20:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjB1Tmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 14:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjB1Tm3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 14:42:29 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7F934C33
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 11:42:28 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id d6so6376769pgu.2
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677613348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1+1Obj0n84DVZopavvNSOG4SsRgdMGD6WVHa50zJHI=;
        b=TyCz/cmY+U/EUkQqnLksFu6c2Exip03sCm6cBbm6jE5hS77YAt+AsEHWR/XUSo0j6S
         6yt5aSjr2gt9gUuLMIx82ZWNHfd2WgRS8PQZvu/SbNybCcUJB4I/5R9QeOhZaz2JSK6f
         yBFhOiyyTXLaS6BZ/+ZelI1d722ZZjnUnNfo3o2E8L6ks4+xLaZQ8ARcW1xtoYUn2tX2
         UvDLlDRMvzSnLPH7oyL442XscNIGnCnsz48KYj/0ZsWIAGIKr3lnJ+WWw98SPBfpmhhR
         0l5/xlwDJuMo/cgTcX5QSijzkHuEyAx/ra+rCnPG5cc39PNNYCIsMCvvwMEZJv+1XvUp
         mptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1+1Obj0n84DVZopavvNSOG4SsRgdMGD6WVHa50zJHI=;
        b=NHJMNUMI7k3MregsHuVZIBSBJ2FF7mjvhpqB2lFmBefMa/aXhRKT0Z+oofyQEiR4cM
         Ka03AfgprkpGHK5CDzwrTVPgCF243nfkNJ1VMejKNzJmUqLhJHuVyog+CNFbSPaCROHJ
         FAyuHT+ak6SuuBfGCaBAFC6Uzsm1ImTaqNgKNEyKgmJvDDLosmQYtl3xkknTypL8AqIu
         /u6licJ3ucZIQI1QUWH0XSWihiRtdJjYbonVkutwKLufiMaPALhibvg7ULrzKxfofboq
         2o02DOtRqrDl63RbGOgjUhdZbOiHS/bYT3Mmzz477QK6fGs9KHCBC5HpgxFf0sfiCDB+
         sweQ==
X-Gm-Message-State: AO0yUKVWa/Vqj61nWQWoR5cF26SRp+oRJRhn+Kae/m5FhHbE8MM61wDt
        La9cndfB+aB4OKIlUyxAkUDnEzgdh/uz9bZVVVSCPQ==
X-Google-Smtp-Source: AK7set/VelgnWNTVSoSQ8B0CqE9bheG1PPFErdPpsNVtbPtXYLyL4kyCx5Ar7OZM++ldTyudw6+GINe9ZLR8bLbjc2c=
X-Received: by 2002:a05:6a00:3247:b0:593:dcf6:acc2 with SMTP id
 bn7-20020a056a00324700b00593dcf6acc2mr1496156pfb.1.1677613347408; Tue, 28 Feb
 2023 11:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 28 Feb 2023 11:42:15 -0800
Message-ID: <CAKwvOdkxA0kgH3rafvZtQCuKq88ee8ur=BfEPaQvK6GmwV77kg@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        nathan@kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 28, 2023 at 11:35=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
>
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
>
> Fix boot on boston board.
>
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>  arch/mips/Kconfig           | 4 ++++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..c8b878aa690f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3206,6 +3206,10 @@ config CC_HAS_MNO_BRANCH_LIKELY
>         def_bool y
>         depends on $(cc-option,-mno-branch-likely)
>
> +# https://github.com/llvm/llvm-project/issues/61045
> +config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> +       def_bool y if CC_IS_CLANG
> +
>  menu "Power management options"
>
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 336ac9b65235..2e99450f4228 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -336,7 +336,7 @@ symbol              =3D       value
>   */
>  #ifdef CONFIG_WAR_R10000_LLSC
>  # define SC_BEQZ       beqzl
> -#elif MIPS_ISA_REV >=3D 6
> +#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_RE=
V >=3D 6
>  # define SC_BEQZ       beqzc
>  #else
>  # define SC_BEQZ       beqz
> --
> 2.37.1 (Apple Git-137.1)
>
>


--=20
Thanks,
~Nick Desaulniers
