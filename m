Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E166E6D40
	for <lists+linux-mips@lfdr.de>; Tue, 18 Apr 2023 22:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjDRUHc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Apr 2023 16:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbjDRUHb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Apr 2023 16:07:31 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C545530C0
        for <linux-mips@vger.kernel.org>; Tue, 18 Apr 2023 13:07:29 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so1825452a12.0
        for <linux-mips@vger.kernel.org>; Tue, 18 Apr 2023 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681848449; x=1684440449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZ/IRUpLOAIM6V2tODhsfJJqsMJTTgStF5pqHar8MKk=;
        b=qDoqKiSzP+kcb3zCaGLigT58SG1uUOX9y389LdFirbR1Cy3dKUJDVEipxK9sjayJXP
         eEdYksvXnF7LcDdrcnD9WH3dHzdsLQOR8pCa7MM7MKTNsxyKvCV3APyuIPet4nPFdke8
         FuQa9Jeci89kxxDKknqieXZr0XN5lQw7BG6VXEr92DnYnyEpV/+/6OuPxzNLaWcfZqYB
         BaT3kvHVwQD+G7kxH+vGJHFrCMHQLeRxx33LbihODSObR/bDo36j+xt0Je4IL3Ct02bG
         sm6dHRpGHnM4U4JItxAgRmFoNJNdqmw8ANNtRuS9zpOvxwhrVpcr7JCZPtzvxd1+DSDz
         3xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681848449; x=1684440449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZ/IRUpLOAIM6V2tODhsfJJqsMJTTgStF5pqHar8MKk=;
        b=lkjnlubptAkh0Ki7NlSXVGrx6Ky2l55OcAovh+RNFbMnA/YvA6zGRWx2e1MD+WGs1U
         1r9YwR2WpNn25hFWUUMR5jiQ/OBv7U7l7gSX1DcdkLgm235p19eQiWu5IqlOVXsRFCr/
         sXjtf65ve9DaBoe1IwLoFseuolBpKXvkSyrnAXxmPVIvWVwYL+W/8lXO6/BxPe3OUdsO
         sycPhHXFHu6EgtnyZ8JvbT4KowU5Kq7f6m85eMKtt1BJG9+YKA1kPwqov6WvPFCZ11NT
         KV2QtwrHFYRTYqLjwaU2g7maQJPxuJNnrC9ruWjfBrbC3Yblnxkvi4Vr5UlBuDQlajny
         0iQA==
X-Gm-Message-State: AAQBX9eQgFFd91/HphUno7S7+XidsTVdy6pfbBboJCPdgx3NGCavVku9
        fCRdi+tduDrD/0QOVGK4XFwI680jNqCL+4ltw4NcEv4CoXqZzIGkOZI=
X-Google-Smtp-Source: AKy350YFAb846cS178gmTNqw1jdIjlgWsDPJqzYY80MqHw39FLd176eqMp2SLjh31L/+4oaMKjeOa65LdUb586pTFb4=
X-Received: by 2002:a17:90b:1e05:b0:246:b038:2f53 with SMTP id
 pg5-20020a17090b1e0500b00246b0382f53mr801508pjb.24.1681848449023; Tue, 18 Apr
 2023 13:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com> <20230414080701.15503-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20230414080701.15503-7-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Apr 2023 13:07:17 -0700
Message-ID: <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> LLVM does not implement some of -march options. However those options
> are not mandatory for kernel to build for those CPUs.
>
> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> we can get those kernel to build with LLVM.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for the patch! Maybe it's more obvious to folks who work on
mips, but how did you determine that say `p5600` is `mips32r5` or
`r10000` is `mips4`?

Is there a table somewhere you used as a reference? Including such
info in the commit message would help reviewers such as myself verify
the patch.

Also, in v1, you mentioned that -mtune is not a substitute. It would
be good to record that info in the commit message as well.

> ---
> v2: Reword commit message
> ---
>  arch/mips/Makefile | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index af3d17ec35d3..0fa84fc395c9 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -148,10 +148,10 @@ cflags-y +=3D $(call cc-option,-Wa$(comma)-mno-fix-=
loongson3-llsc,)
>  #
>  # CPU-dependent compiler/assembler options for optimization.
>  #
> -cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
> -cflags-$(CONFIG_CPU_R4300)     +=3D -march=3Dr4300 -Wa,--trap
> -cflags-$(CONFIG_CPU_R4X00)     +=3D -march=3Dr4600 -Wa,--trap
> -cflags-$(CONFIG_CPU_TX49XX)    +=3D -march=3Dr4600 -Wa,--trap
> +cflags-$(CONFIG_CPU_R3000)     +=3D $(call cc-option,-march=3Dr3000,-mar=
ch=3Dmips1)
> +cflags-$(CONFIG_CPU_R4300)     +=3D $(call cc-option,-march=3Dr4300,-mar=
ch=3Dmips3) -Wa,--trap
> +cflags-$(CONFIG_CPU_R4X00)     +=3D $(call cc-option,-march=3Dr4600,-mar=
ch=3Dmips3) -Wa,--trap
> +cflags-$(CONFIG_CPU_TX49XX)    +=3D $(call cc-option,-march=3Dr4600,-mar=
ch=3Dmips3) -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R1) +=3D -march=3Dmips32 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R2) +=3D -march=3Dmips32r2 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS32_R5) +=3D -march=3Dmips32r5 -Wa,--trap -modd-s=
preg
> @@ -160,26 +160,30 @@ cflags-$(CONFIG_CPU_MIPS64_R1)    +=3D -march=3Dmip=
s64 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R2) +=3D -march=3Dmips64r2 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R5) +=3D -march=3Dmips64r5 -Wa,--trap
>  cflags-$(CONFIG_CPU_MIPS64_R6) +=3D -march=3Dmips64r6 -Wa,--trap
> -cflags-$(CONFIG_CPU_P5600)     +=3D -march=3Dp5600 -Wa,--trap -modd-spre=
g
> -cflags-$(CONFIG_CPU_R5000)     +=3D -march=3Dr5000 -Wa,--trap
> -cflags-$(CONFIG_CPU_R5500)     +=3D $(call cc-option,-march=3Dr5500,-mar=
ch=3Dr5000) \
> +cflags-$(CONFIG_CPU_P5600)     +=3D $(call cc-option,-march=3Dp5600,-mar=
ch=3Dmips32r5) \
> +                       -Wa,--trap -modd-spreg
> +cflags-$(CONFIG_CPU_R5000)     +=3D $(call cc-option,-march=3Dr5000,-mar=
ch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_NEVADA)    +=3D $(call cc-option,-march=3Drm5200,-ma=
rch=3Dr5000) \
> +cflags-$(CONFIG_CPU_R5500)     +=3D $(call cc-option,-march=3Dr5500,-mar=
ch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_RM7000)    +=3D $(call cc-option,-march=3Drm7000,-ma=
rch=3Dr5000) \
> +cflags-$(CONFIG_CPU_NEVADA)    +=3D $(call cc-option,-march=3Drm5200,-ma=
rch=3Dmips4) \
>                         -Wa,--trap
> -cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-march=3Dsb1,-march=
=3Dr5000) \
> +cflags-$(CONFIG_CPU_RM7000)    +=3D $(call cc-option,-march=3Drm7000,-ma=
rch=3Dmips4) \
> +                       -Wa,--trap
> +cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-march=3Dsb1,-march=
=3Dmips4) \
>                         -Wa,--trap
>  cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-mno-mdmx)
>  cflags-$(CONFIG_CPU_SB1)       +=3D $(call cc-option,-mno-mips3d)
> -cflags-$(CONFIG_CPU_R10000)    +=3D $(call cc-option,-march=3Dr10000,-ma=
rch=3Dr8000) \
> +cflags-$(CONFIG_CPU_R10000)    +=3D $(call cc-option,-march=3Dr10000,-ma=
rch=3Dmips4) \
>                         -Wa,--trap
>  cflags-$(CONFIG_CPU_CAVIUM_OCTEON) +=3D -march=3Docteon -Wa,--trap
>  cflags-$(CONFIG_CAVIUM_CN63XXP1) +=3D -Wa,-mfix-cn63xxp1
>  cflags-$(CONFIG_CPU_BMIPS)     +=3D -march=3Dmips32 -Wa,-mips32 -Wa,--tr=
ap
>
> -cflags-$(CONFIG_CPU_LOONGSON2E) +=3D -march=3Dloongson2e -Wa,--trap
> -cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloongson2f -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2E) +=3D \
> +                       $(call cc-option,-march=3Dloongson2e,-march=3Dmip=
s3) -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2F) +=3D \
> +                       $(call cc-option,-march=3Dloongson2f,-march=3Dmip=
s3) -Wa,--trap
>  # Some -march=3D flags enable MMI instructions, and GCC complains about =
that
>  # support being enabled alongside -msoft-float. Thus explicitly disable =
MMI.
>  cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call cc-option,-mno-loongson-mmi=
)
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
