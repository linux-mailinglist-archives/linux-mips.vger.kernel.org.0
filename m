Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4EC6DB657
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDGWPQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjDGWPP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:15:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED26993C8
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:15:13 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso44322802pjb.3
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680905713; x=1683497713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv2Pz74XSEaZmo+HM7I/FZ/llbQpw5ig+uNqMEj8KA8=;
        b=L9rynT2m2aMZ16QBjoQltZHr72q9DaBoPDiQwwkn1+ShP/cn6WgPlVgoHu9IwqykhI
         3Bwrpl1rvx7z76gR+qPyfNqvBa6cIvt9EykE4fcY6jkZxwzscg9jEZfZWvUEsmBEGwRB
         Pu981CViCffpfC+wFuSgw7GQdXEEdXrZ73TX5KEHMz3TLnYCbg+sRS8lsyzV2CBDq0TI
         LBj+dhs4I5jSLhnKnR6HLiKol6FZApN6Kh75BaJpL/Uom5PI9P5txWbx4tDSeHD04/mB
         C8stncijNqUQ0LqhMqAWIe4Tz+DC98AJeMSy7DoOTggqp8crtXcpEXkNVbhZGhnW2+Qn
         FCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680905713; x=1683497713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv2Pz74XSEaZmo+HM7I/FZ/llbQpw5ig+uNqMEj8KA8=;
        b=CKcAWVxCSrus2q7z9TAMMcndz4ss+w3i9XxDNKpUhH3Cv9b6fOMJvqTUX7QBF3sCjR
         rx1CpdITgdTKkLPPIwucA19koR9JkXibIhqdIsPFQiUc4POKbzjczYbs7sbA0hAXr3QC
         5R8GFDlhSdF5sTMoAKFN6t9IoOrol0Zb8Ys2VlnKSRHqWhTOdDYxJRSq271O1fqS+iHW
         WSPSikVkTPVPukEOc+tbSxhpfl5jpCTDARNRX/jWkLKBoS5ctDpRJGRjUS6PsHoLjcV7
         KbJ+QumQEyudJWn8RM/n81j/w0TC4hQ60EjSj/pv9I/id4FVtbJNOZu19Jy3dwfEi8bs
         U1ZA==
X-Gm-Message-State: AAQBX9f60NRDQAfD7+A/d2tAl3tvLNoAa3+qejgdsN9KQOBvSXX3qPBL
        7/mCA5X/uW9t7XHTLdNjb6DbkoqrqAM+MD0JAfRoZA==
X-Google-Smtp-Source: AKy350bArPPgC6FIazJw6Q78G2fwyHcVthBOGH+mVZ+BlyPTBwDwZPD9+dH7gsnFEvI/8KmfIFjBUevdwVitmOviJKI=
X-Received: by 2002:a17:90a:94c6:b0:244:9b8f:c3bf with SMTP id
 j6-20020a17090a94c600b002449b8fc3bfmr88074pjw.7.1680905713196; Fri, 07 Apr
 2023 15:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com> <20230407102721.14814-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20230407102721.14814-4-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 15:15:01 -0700
Message-ID: <CAKwvOdkSp4X-=7FdJQDpmB9tHDfvshbNc+aqvR1bLTgR7HUTuA@mail.gmail.com>
Subject: Re: [PATCH 3/5] MIPS: Detect toolchain support of workarounds in Kconfig
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
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
> LLVM toolchain does not support most of workarounds, detect
> those supports in Kconfig so we can hide unsupported workarounds
> to user.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

TIL about "imply" in Kconfig. + Masahiro to triple check that; the rest LGT=
M.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/Kconfig               | 28 +++++++++++++++++++++++++---
>  arch/mips/Makefile              |  6 +++---
>  arch/mips/cavium-octeon/Kconfig |  1 +
>  3 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 9e9de2b62f28..d896af492da6 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -371,9 +371,9 @@ config MACH_DECSTATION
>         select CEVT_R4K if CPU_R4X00
>         select CSRC_IOASIC
>         select CSRC_R4K if CPU_R4X00
> -       select CPU_DADDI_WORKAROUNDS if 64BIT
> -       select CPU_R4000_WORKAROUNDS if 64BIT
> -       select CPU_R4400_WORKAROUNDS if 64BIT
> +       imply CPU_DADDI_WORKAROUNDS
> +       imply CPU_R4000_WORKAROUNDS
> +       imply CPU_R4400_WORKAROUNDS
>         select DMA_NONCOHERENT
>         select NO_IOPORT_MAP
>         select IRQ_MIPS_CPU
> @@ -1723,6 +1723,7 @@ config CPU_JUMP_WORKAROUNDS
>  config CPU_LOONGSON2F_WORKAROUNDS
>         bool "Loongson 2F Workarounds"
>         default y
> +       depends on AS_HAS_NOP_WORKAROUNDS && AS_HAS_JUMP_WORKAROUNDS
>         select CPU_NOP_WORKAROUNDS
>         select CPU_JUMP_WORKAROUNDS
>         help
> @@ -2456,6 +2457,7 @@ config CPU_HAS_SYNC
>  #   "MIPS R4400MC Errata, Processor Revision 1.0", erratum #5
>  config CPU_DADDI_WORKAROUNDS
>         bool
> +       depends on CPU_R4X00_BUGS64 && CC_HAS_DADDI_WORKAROUNDS
>
>  # Work around certain R4000 CPU errata (as implemented by GCC):
>  #
> @@ -2477,6 +2479,7 @@ config CPU_DADDI_WORKAROUNDS
>  #   erratum #52
>  config CPU_R4000_WORKAROUNDS
>         bool
> +       depends on CPU_R4X00_BUGS64 && CC_HAS_R4000_WORKAROUNDS
>         select CPU_R4400_WORKAROUNDS
>
>  # Work around certain R4400 CPU errata (as implemented by GCC):
> @@ -2487,6 +2490,7 @@ config CPU_R4000_WORKAROUNDS
>  #   "MIPS R4400MC Errata, Processor Revision 2.0 & 3.0", erratum #4
>  config CPU_R4400_WORKAROUNDS
>         bool
> +       depends on CPU_R4X00_BUGS64 && CC_HAS_R4400_WORKAROUNDS
>
>  config CPU_R4X00_BUGS64
>         bool
> @@ -3167,6 +3171,15 @@ config CC_HAS_MNO_BRANCH_LIKELY
>         def_bool y
>         depends on $(cc-option,-mno-branch-likely)
>
> +config CC_HAS_R4000_WORKAROUNDS
> +       def_bool $(cc-option,-mfix-r4000)
> +
> +config CC_HAS_R4400_WORKAROUNDS
> +       def_bool $(cc-option,-mfix-r4400)
> +
> +config CC_HAS_DADDI_WORKAROUNDS
> +       def_bool $(cc-option,-mno-daddi)
> +
>  # https://github.com/llvm/llvm-project/issues/61045
>  config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
>         def_bool y if CC_IS_CLANG
> @@ -3192,6 +3205,15 @@ config AS_HAS_DSP
>  config AS_HAS_GINV
>         def_bool $(cc-option,-Wa$(comma)-mginv)
>
> +config AS_HAS_CN63XXP1_WORKAROUNDS
> +       def_bool $(cc-option,-Wa$(comma)-mfix-cn63xxp1)
> +
> +config AS_HAS_NOP_WORKAROUNDS
> +       def_bool $(cc-option,-Wa$(comma)-mfix-loongson2f-nop)
> +
> +config AS_HAS_JUMP_WORKAROUNDS
> +       def_bool $(cc-option,-Wa$(comma)-mfix-loongson2f-jump)
> +
>  menu "Power management options"
>
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 3aa0f9d4ceb6..344fe5f00f7b 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -193,9 +193,9 @@ cflags-$(CONFIG_CC_IS_CLANG) +=3D -march=3Dmips64r2
>  endif
>  cflags-$(CONFIG_CPU_LOONGSON64) +=3D $(call cc-option,-mno-loongson-mmi)
>
> -cflags-$(CONFIG_CPU_R4000_WORKAROUNDS) +=3D $(call cc-option,-mfix-r4000=
,)
> -cflags-$(CONFIG_CPU_R4400_WORKAROUNDS) +=3D $(call cc-option,-mfix-r4400=
,)
> -cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS) +=3D $(call cc-option,-mno-daddi,=
)
> +cflags-$(CONFIG_CPU_R4000_WORKAROUNDS) +=3D -mfix-r4000
> +cflags-$(CONFIG_CPU_R4400_WORKAROUNDS) +=3D -mfix-r4400
> +cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS) +=3D -mno-daddi
>  ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
>  cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) +=3D -Wa,-mfix-loongson2f-nop
>  cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) +=3D -Wa,-mfix-loongson2f-jump
> diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kc=
onfig
> index 450e979ef5d9..38c9dc89cd5f 100644
> --- a/arch/mips/cavium-octeon/Kconfig
> +++ b/arch/mips/cavium-octeon/Kconfig
> @@ -4,6 +4,7 @@ if CPU_CAVIUM_OCTEON
>  config CAVIUM_CN63XXP1
>         bool "Enable CN63XXP1 errata workarounds"
>         default "n"
> +       depends on AS_HAS_CN63XXP1_WORKAROUNDS
>         help
>           The CN63XXP1 chip requires build time workarounds to
>           function reliably, select this option to enable them.  These
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
