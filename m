Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E126DB660
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjDGWUa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjDGWUZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:20:25 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D96D338
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:20:08 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id d22so25028843pgw.2
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906008; x=1683498008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FntRN8G19jvJTu5fz2RxEb6kJhcptjgOCe6eBDwugbk=;
        b=A2cL9i5rXkf5Y/PTBvOkxyINDIGkhrKoDUMpacKIHfsmTRm/dnlPXu0tfG/eBFu9UG
         oSSVpCf62blzBWpTUa670qzNFEZXzju2SrO0Wj/XMS59SbV0JSxbl4OihJ2jXj56oKUs
         9XPKuIzwhoU42faCGZn1QCuC/VyzsVLve5g1EXK7h3BJcZoxsa7Rg+mOmwcEurYMb3cX
         AEaqdB1P9R3PhgRcCx5gqODJGVEe9LgN6FoPkGzdKrE0//HoTlUtpeaJK3e+4vwu5q0e
         5X8ieNHQbv7u01QqXt/z65gjYT0kA+KzPkJANs7LL+/pJU1My/BMFz476R4093PjVotZ
         jP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906008; x=1683498008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FntRN8G19jvJTu5fz2RxEb6kJhcptjgOCe6eBDwugbk=;
        b=uGN3H1Ced5i2rmCYRFm4gStxI6hax9ucwf6kFXKF5Q91+rl4Z9qoSrsILc7e2I8ZkH
         M/yxd2Zg73W3ggQK+/aoRHxFo3v2rh8YKQln3Jck9YzsF/d6QdE1BkacNwjTXvYKyG5D
         fijaD74dPDEq3Xemx2FFULfN5+ikKNJTZklKSaDaNPRx5PGpBO/PxK7exavoPOKkArGs
         r6Yo9tCbE0pVCihYnrh2kGS5cGrFChLGNlTgw5kcuxITuraldXhl0/VYxnz+488WmmD/
         OefKS+6VTd/zmbixbAgXeRiWWg4mkskgQ++4GhX7FKFtaGBph8xaA6/3lFQURaic4VVs
         NY6w==
X-Gm-Message-State: AAQBX9cV1YlOFEirQywWQPqPNds6/g3Xhm69oGMRsIdfXFdeRtcbolPO
        ELlzw4UmzLohnVsVL0ByAn+EZIvIhr85RChnlh1jRA==
X-Google-Smtp-Source: AKy350aeaLQrDjCv+unzTBczDkn1iOS1TNPVAG61Ef5av3yVAjNCRq1On1xCeP8ZZ22XO4U7X6ocY7F22mLM3YTx3v8=
X-Received: by 2002:a63:1608:0:b0:513:a488:f05f with SMTP id
 w8-20020a631608000000b00513a488f05fmr76356pgl.1.1680906007885; Fri, 07 Apr
 2023 15:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com> <20230407102721.14814-5-jiaxun.yang@flygoat.com>
In-Reply-To: <20230407102721.14814-5-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 15:19:56 -0700
Message-ID: <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
Subject: Re: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
> kernel is unsupported.
>
> Detect this in Kconfig to prevent user select 32 bit kernel with
> unsupported toolchain.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I suspect this may fix:
Link: https://github.com/ClangBuiltLinux/linux/issues/884

> ---
>  arch/mips/Kconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d896af492da6..5e399a5ac3b3 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2016,6 +2016,7 @@ choice
>  config 32BIT
>         bool "32-bit kernel"
>         depends on CPU_SUPPORTS_32BIT_KERNEL && SYS_SUPPORTS_32BIT_KERNEL
> +       depends on CC_HAS_O32_ABI

Does this disable 32b mips builds with clang?

>         select TRAD_SIGNALS
>         help
>           Select this option if you want to build a 32-bit kernel.
> @@ -3136,7 +3137,7 @@ config COMPAT
>
>  config MIPS32_O32
>         bool "Kernel support for o32 binaries"
> -       depends on 64BIT
> +       depends on 64BIT && CC_HAS_O32_ABI
>         select ARCH_WANT_OLD_COMPAT_IPC
>         select COMPAT
>         select MIPS32_COMPAT
> @@ -3184,6 +3185,10 @@ config CC_HAS_DADDI_WORKAROUNDS
>  config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
>         def_bool y if CC_IS_CLANG
>
> +config CC_HAS_O32_ABI
> +       def_bool y
> +       depends on !CPU_SUPPORTS_64BIT_KERNEL || $(cc-option,-march=3Dmip=
s3 -mabi=3D32)

Should this be
def_bool $(cc-option,-march=3Dmips3 -mabi=3D32)
depends on !CPU_SUPPORTS_64BIT_KERNEL

?

> +
>  config AS_HAS_MSA
>         def_bool $(cc-option,-Wa$(comma)-mmsa)
>
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
