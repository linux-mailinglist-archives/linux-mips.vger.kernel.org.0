Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE0D73A62F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jun 2023 18:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjFVQh2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jun 2023 12:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbjFVQhG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Jun 2023 12:37:06 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AEFE7D
        for <linux-mips@vger.kernel.org>; Thu, 22 Jun 2023 09:37:04 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-63008f9293dso52625836d6.1
        for <linux-mips@vger.kernel.org>; Thu, 22 Jun 2023 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687451824; x=1690043824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvUMKgNdrJS2sbY7sSS1RUpj7aJp38og29y5H3nnvuw=;
        b=BejqlTuoaswUsjLQIWx7pwoY78zT+Psb8bvB5C4RCNlpHgQOX0ni4oVemxkxfu095u
         CPrwNWOw+1UTp+ITJABL462n/IivxzzOKuCc3g4XiGv5fnH9/a+6lJIZrGHm86qRsoXc
         MV6qtA2oq2ADsEfGGq8xgMc0c3bQ1WDXTHj8pCNc8Tus0E12r37h6zwfltLE61ZiX2Wf
         t1pklEGjIvE/hL9/1MvZnsrlo2ZRWQoYdSaJ9vpRo7/D6iwp9+Qcm7eyv7nbKq+fKaiK
         qeHqbj8WkDPLJqWcfrnp7DjwLv+THHapCoZtBGbYW76zm0NcEmBn/MWi6SNy7mHPn/k2
         1VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687451824; x=1690043824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvUMKgNdrJS2sbY7sSS1RUpj7aJp38og29y5H3nnvuw=;
        b=LRUpzNxiwQISJQxvdqS69HUGrZUg8jZFzbEh/m+6RmCg74CHDJNpDMJGECfhabKE8Y
         SghQcN0NHzfCGI5G0y2JjHtShBWVdiLWm1VjQ/IER3Mh8gmxM1b4++1v0mykc9Ht6l58
         N/wGXhm9tH2X55mYyOvlZey2uhMcZwPmXtIekWVK9vAlVE4f3oC6If5TRFeVWYJ9FQXY
         pvS1VAuda6dOizX15aY04LDTdRnJEwwZ1/t3PzgjokWyGCNsgfG7O9P3+qx/12/G6C5T
         qAGSrilQ/z4NAxXgkYeEryulrmaovBtqBeqYj4Rlxrk8ggidzPx/p1tpcFYVs3qAILEU
         A3LA==
X-Gm-Message-State: AC+VfDx2FNSj8sjKSX56QFPWFWC7mMiQgnaqUEWvQ4+NbojskCOUL3zr
        js+neuMzwi4fgzGR26zC7jpivkSqQ3Suuxc/2hnXJA==
X-Google-Smtp-Source: ACHHUZ6+1JFtER8yM/LAyX3RZKdD7EftR4Czuo9EeQsYDzK44Yd7Zbg4HTLwDKjOT8393cp5s102qSfzXpn//Dw32fs=
X-Received: by 2002:a05:6214:629:b0:631:f8d0:a5c3 with SMTP id
 a9-20020a056214062900b00631f8d0a5c3mr10279760qvx.62.1687451823790; Thu, 22
 Jun 2023 09:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
In-Reply-To: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Jun 2023 09:36:53 -0700
Message-ID: <CAKwvOd=jaaf7jpjFYe=J0uBiOkGbY3hQ1JsSThp+171cyOsP7Q@mail.gmail.com>
Subject: Re: [PATCH] clk: ralink: mtmips: Fix uninitialized use of ret in mtmips_register_{fixed,factor}_clocks()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     tsbogend@alpha.franken.de, sergio.paracuellos@gmail.com,
        sboyd@kernel.org, trix@redhat.com, linux-clk@vger.kernel.org,
        linux-mips@vger.kernel.org, patches@lists.linux.dev,
        llvm@lists.linux.dev
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

On Thu, Jun 22, 2023 at 8:56=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang warns:
>
>   drivers/clk/ralink/clk-mtmips.c:309:9: error: variable 'ret' is uniniti=
alized when used here [-Werror,-Wuninitialized]
>     309 |         return ret;
>         |                ^~~
>   drivers/clk/ralink/clk-mtmips.c:285:9: note: initialize the variable 'r=
et' to silence this warning
>     285 |         int ret, i;
>         |                ^
>         |                 =3D 0
>   drivers/clk/ralink/clk-mtmips.c:359:9: error: variable 'ret' is uniniti=
alized when used here [-Werror,-Wuninitialized]
>     359 |         return ret;
>         |                ^~~
>   drivers/clk/ralink/clk-mtmips.c:335:9: note: initialize the variable 'r=
et' to silence this warning
>     335 |         int ret, i;
>         |                ^
>         |                 =3D 0
>   2 errors generated.
>
> Set ret to the return value of clk_hw_register_fixed_rate() using the
> PTR_ERR() macro, which ensures ret is not used uninitialized, clearing
> up the warning.
>
> Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS =
SoCs")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1879
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
PTR_ERR returns a long; assigning to an int risks truncation of the
error.  The use of PTR_ERR on L1079 has a similar risk...]

Maybe Sergio wants to revisit that in more detail, but this at least
fixes the build for us.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/clk/ralink/clk-mtmips.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/ralink/clk-mtmips.c b/drivers/clk/ralink/clk-mtm=
ips.c
> index 9322c6210a33..1e7991439527 100644
> --- a/drivers/clk/ralink/clk-mtmips.c
> +++ b/drivers/clk/ralink/clk-mtmips.c
> @@ -292,6 +292,7 @@ static int mtmips_register_fixed_clocks(struct clk_hw=
_onecell_data *clk_data,
>                                                       sclk->parent, 0,
>                                                       sclk->rate);
>                 if (IS_ERR(sclk->hw)) {
> +                       ret =3D PTR_ERR(sclk->hw);
>                         pr_err("Couldn't register fixed clock %d\n", idx)=
;
>                         goto err_clk_unreg;
>                 }
> @@ -342,6 +343,7 @@ static int mtmips_register_factor_clocks(struct clk_h=
w_onecell_data *clk_data,
>                                                   sclk->parent, sclk->fla=
gs,
>                                                   sclk->mult, sclk->div);
>                 if (IS_ERR(sclk->hw)) {
> +                       ret =3D PTR_ERR(sclk->hw);
>                         pr_err("Couldn't register factor clock %d\n", idx=
);
>                         goto err_clk_unreg;
>                 }
>
> ---
> base-commit: fd99ac5055d4705e91c73d1adba18bc71c8511a8
> change-id: 20230622-mips-ralink-clk-wuninitialized-150bd0336187
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
