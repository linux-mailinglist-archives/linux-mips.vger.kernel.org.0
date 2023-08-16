Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98C77ECF5
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 00:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346839AbjHPWQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Aug 2023 18:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346932AbjHPWQD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Aug 2023 18:16:03 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA19273B
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 15:15:28 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-40a47e8e38dso54571cf.1
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692224081; x=1692828881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEeQ0BrGSycrd2HYJ/F64FkxcfNt1wG/F0GbqsiDMHc=;
        b=70ju2hKyUmKrm92QJdAPekeP5swEqHhWV+pqo3RFs5MKieF7pQIRafojB9i/a/v4Nr
         32vxbvFyIAqIC4N+k9/Y5OJngJdWTdbN3JXV2zbvldBeSLjjm1v86NdJXNywh9FIGmM1
         gGKv7IGp1kpAebh03fNNSdRCXUePVG25m6zjS5N9gDlMN+ljp+ZGk1wbw5a73DxUMwSc
         xQvlXGOjBegGHoozG5sNO9ItpgNORYlG8c6khwpUFoE0ExkXNI3k8CNRRrmJUSTg1xOZ
         TEt0OtEcpA9RRnh5yPiBnp2h4fRcA0Q8rh4bfYwGz57T/IqEF2s2XAbm7PUkZXDXT5Ui
         /Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692224081; x=1692828881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEeQ0BrGSycrd2HYJ/F64FkxcfNt1wG/F0GbqsiDMHc=;
        b=X7QY6zmvedHmLHQM8vRkp80RsDm3tOs2b1fNbS+OSszTZPeBkW0r7CAxn2UroSPNBL
         QNr5Rgimhw48qcA4SXLFSaZWfz+UV0pEmzAr9vfujH4xsXmTiflHTwiIVrzxW/HA387d
         /yPh1M/Bu9AFuCHcyPxfw9ltrsRUuc0+lSxcm9Y7ZMzG2iUfrZ+8MNTXwtLh9YM+Xare
         1wztSJYyvKBjZ+jGBCvtuwBFDISnV3MZboAUwR48s2Sjim96ck93xvDRzLCfLsnEUnAL
         S+UTW0cXuxpcDm1ViOAUht6o4SqNc3HSx+uOJhHoObgRVfeL34L8gYRBI0mU+Aa5vohC
         mjlQ==
X-Gm-Message-State: AOJu0YxjgnVpFH8I9rwdLjER2mbEKCYu44Yyq1wHgClUzmKi9snY5zBG
        hX4z5ueu+rZ6UgdqbY9+cB5n7GLpG0hImbXyaE5z+A==
X-Google-Smtp-Source: AGHT+IEjhZ4cZOnjuNqtHWoNW/DytduS8DsjFgsLhaLs5ni7Dg5U6HX1s7FEfydYlPDtscBplZAGdPp0Bu0fCNlbDAg=
X-Received: by 2002:a05:622a:1a18:b0:3f9:56c:1129 with SMTP id
 f24-20020a05622a1a1800b003f9056c1129mr44310qtb.5.1692224081176; Wed, 16 Aug
 2023 15:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
In-Reply-To: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
From:   Fangrui Song <maskray@google.com>
Date:   Wed, 16 Aug 2023 15:14:30 -0700
Message-ID: <CAFP8O3LN9j-qHcEmHE0mM-8F9rpMDZMe2wE5ybABPVV_UXtx9Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Conditionally export __vdso_gettimeofday()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev,
        kernel test robot <lkp@intel.com>
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

LGTM as a maintainer of lld/ELF who has fixed some user-space packages
(https://github.com/gentoo/gentoo/pull/29097#issuecomment-1383304538).

Reviewed-by: Fangrui Song <maskray@google.com>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
