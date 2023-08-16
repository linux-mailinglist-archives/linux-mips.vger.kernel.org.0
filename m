Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B21477ED4E
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 00:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346914AbjHPWlk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Aug 2023 18:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346945AbjHPWlY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Aug 2023 18:41:24 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5151B2
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 15:41:23 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48a61ac2b26so577877e0c.2
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692225682; x=1692830482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmIqxa6frC+gPR1n1W6gSgs3JOKzmDAS0GTXjwaiYmA=;
        b=5Bs6sM4GRaoJLPQgY5xE+w4MsxnsgboK1Dh+YN60e0m/ucJzK4S8elgXG7atMdSjzx
         oOezkrK7ViKu51PnZH/Z3xLWwNhNcx1e5EDYw6y14A5B29UuZzphtgdpHJMYA53uFNWJ
         wwm/zz7P4OGidZfvmJ85fTEkb7klogJgqe0Sw85jgcD6/MxmUeY93gD2VDN2QtKEZzNQ
         53CvG28kl5EOZ6s7R/Sn/nIaFP1fuAY/dVuNby+9CaOyrXWT1XU8oVaaINkYd6XQLmZz
         FYC7dqMkHjzlfE3lmH/wJMGzPYM9HmKMjrlHWR096C+v32UrwmMH7+lVcGCCC3/9QwJt
         /6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225682; x=1692830482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmIqxa6frC+gPR1n1W6gSgs3JOKzmDAS0GTXjwaiYmA=;
        b=abm+dAfuVBYN9sBlERR0MTcTbBqBybv8LmtsJCiM9LqrRPljs6omaiU52Dt/KOC9sX
         Q/OXa/nhC15ZK8CAKlUA5BnCXy+i0By7VrH25ENTb3dWi966gApZJZ7xzT7oEDX4+yew
         QB0KF2G0BWG/DVL4o0q4skAVimRBl11wpV2HD2EBMe6Xz7TfxuZMvoLkYzYOAY3XoPn0
         bDn0L/jueJGzK+UauaDtim815+mAHKZAgfXthWkz5i1pKPgc4BJyh6VQOYMUoE5IDG1l
         Y31GSrw6bM5GXd3FonqU9u35Nv4uhMW5ge0oAgroi9mKBYkQ6BOp8oba7QHJYx43gugl
         Gh5A==
X-Gm-Message-State: AOJu0YzghsoQ2MiMm/2ILwWwLmddpUbm/tF0sZKk62VW43TwsU7GTuQ6
        c86HZ4dbzJzthQ7AU1aSRt4FIdX2Ryl0/BrKcWlSR1Zi5R6DReAoafo=
X-Google-Smtp-Source: AGHT+IG1+IPfo+RX82+EOF4EsXRn+LG2oKvxL3tLdVcgq7pTP/+tdR7tm3COfErbYJ2EsxeSvKy8qQ9gkLN6OhX6Xoo=
X-Received: by 2002:a1f:c189:0:b0:48a:68d0:28fc with SMTP id
 r131-20020a1fc189000000b0048a68d028fcmr3232564vkf.4.1692225682132; Wed, 16
 Aug 2023 15:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
In-Reply-To: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 16 Aug 2023 15:41:11 -0700
Message-ID: <CAKwvOdmq2Yvf3g83xQdV9_X2NEHVNORb7xBMn2ivZ0jriBPv6w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Conditionally export __vdso_gettimeofday()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 16, 2023 at 2:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> ld.lld 16.0.0 and newer defaults to '--no-undefined-version', which
> causes the following error when CONFIG_MIPS_CLOCK_VSYSCALL is not set:
>
>   ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vd=
so_gettimeofday' failed: symbol not defined
>
> Only export __vdso_gettimeofday() when it will be present in the final
> object file, which clears up the error.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308170532.zxFFv25c-lkp@i=
ntel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/vdso/vdso.lds.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index d90b65724d78..836465e3bcb8 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -94,7 +94,9 @@ VERSION
>  #ifndef CONFIG_MIPS_DISABLE_VDSO
>         global:
>                 __vdso_clock_gettime;
> +#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
>                 __vdso_gettimeofday;
> +#endif
>                 __vdso_clock_getres;
>  #if _MIPS_SIM !=3D _MIPS_SIM_ABI64
>                 __vdso_clock_gettime64;
>
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-mips-vdso-cond-export-__vdso_gettimeofday-30ab92c716d=
4
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
