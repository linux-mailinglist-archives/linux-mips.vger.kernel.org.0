Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A186DB64C
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjDGWIw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDGWIv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:08:51 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA3CA06
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 15:08:48 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 129so41065pgb.0
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680905328; x=1683497328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE4clA/zmV0PUkJY1uud0kW2EphNtzmleAM6SAJljW4=;
        b=qAUsNHCEu28j/dILzeewcnEV6PUDezqN0jUDJ5qV2DDBHEJUuGjM/3L8E/oT92ECWj
         3sxqxpdx/ZSEb+l/NeAlPIv96VGVl7j97AHbvTrCMm6rSCHySnZ/g2Xz22ufxYRAVkfC
         VB8el/5eBRtu6Vto5oTAowqbOsCFjehTMzB0fK26vwzXSL0yLUhawxA+FQR3pptF45G7
         m6bXM7VPpttk02tDfIXdeEuiQqpOyW5OskmFf82kK9+bTz1G/6uhlo9guPrTvUeXE3Os
         JrbkdZIxYPZICo8n0X8MNqZxTRP0DyPLwNC5ZsinKWNXC66pjWZHuH6LEDR1d8fsblfb
         QuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680905328; x=1683497328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE4clA/zmV0PUkJY1uud0kW2EphNtzmleAM6SAJljW4=;
        b=Fk12QEuPqJr2I1uduawa7r1syYuEVu5Q+3sGhYR92vSUeX5/FUkokzarWptyU4b7rQ
         KIzCFHhHnOA6Ek+VtdmaqJBLDcCVt+JqhpTl9FNEvf/MePWnyx7x+N8JstKE75UGil++
         1VJQOmS48uE5zytM2Ir80zDwPFF5fE8WSX4510yVBJg+hjbE5ecJsxFu9BXES3ZYf1yL
         HckF9vU1xDexT1qZudq5zcWFWhXeCdw0hjN1VOy6T8eiisIPebKHc+lcPKJU7F9kV5vX
         3/qAhDVseE4tm0YxSEaokt1wUtGUsM9VXX3d10VkOMifOXt1yMQ8PazihTtaUiA/WM4F
         kE/g==
X-Gm-Message-State: AAQBX9ebCO+k5OG4mo5T2TGzBujj5hVjEYT7J2jSoEG6Yve/fX0B8jTZ
        Bj/gfWl+3JQUVeXAilJz+XyUBDO/FFaKN+fEsYR8hWWuKNNtL6n0RGk=
X-Google-Smtp-Source: AKy350bUwV4nQde1SHpDwEawOdZshaDpbWH/FsosJiLS0PxYCG8vREbMha3/14KmCK92FrF2sFkoTRvK6aDXSxphbqs=
X-Received: by 2002:a65:5b43:0:b0:50f:5f89:2a9d with SMTP id
 y3-20020a655b43000000b0050f5f892a9dmr825531pgr.1.1680905327840; Fri, 07 Apr
 2023 15:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com> <20230407102721.14814-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20230407102721.14814-3-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 15:08:36 -0700
Message-ID: <CAKwvOdn3DC=6nCW2Fj9A2RcEa-AHTYNveBzvLTxp7yh7N=AxgQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] MIPS: Add toolchain feature dependency for microMIPS smartMIPS
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org
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
> microMIPS smartMIPS kernel can only be compiled if they are supported
> by toolchain.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c52401c155a4..9e9de2b62f28 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
>           Select this if you want neither microMIPS nor SmartMIPS support
>
>  config CPU_HAS_SMARTMIPS
> -       depends on SYS_SUPPORTS_SMARTMIPS
> +       depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
>         bool "SmartMIPS"
>         help
>           SmartMIPS is a extension of the MIPS32 architecture aimed at
> @@ -2372,7 +2372,7 @@ config CPU_HAS_SMARTMIPS
>           here.
>
>  config CPU_MICROMIPS
> -       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
> +       depends on 32BIT && SYS_SUPPORTS_MICROMIPS && CC_HAS_MICROMIPS &&=
 !CPU_MIPSR6

^ greater than 80 chars (85 in total). Consider creating two "depends on" l=
ines.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>         bool "microMIPS"
>         help
>           When this option is enabled the kernel will be built using the
> --
> 2.39.2 (Apple Git-143)
>


--=20
Thanks,
~Nick Desaulniers
