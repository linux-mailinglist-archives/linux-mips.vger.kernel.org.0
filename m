Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BB373A69C
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jun 2023 18:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjFVQyg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jun 2023 12:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbjFVQyB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Jun 2023 12:54:01 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C24213B;
        Thu, 22 Jun 2023 09:53:51 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b6da72d5e2so596128a34.1;
        Thu, 22 Jun 2023 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687452831; x=1690044831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8yYMEX/t8Klnote5y9PwMV4v/R5Zq9BMnCmr1KijqA=;
        b=Pt1nXkO/26/fQa155yjH3pyzn/SzDu3Ys72LfiAAiA8CfR5SeaxYWJASav/l6pUjtS
         ZUXeytL3yArUtBMuoMxRoCIx+/FL1NrxI2W3mFvKZm2J4MyDyRxqPNZ5CuZcPcc/HEaC
         ywe/1ATR5kfk9gUWiazxzFWlf6qDUU6T2z+AY/eK0KhEg40G3Ac79NRNwvmbhgKXwxjv
         vkgCkhwSKVNxTFyd8enD+DvHPdCiIEaFtq1ZyTLZ7sMfN1jruh4TMaq0tSWEqhBKMI/K
         55objcP8XfnkQJB0xnc+yNYP/bFVnGQUG31lNeHvoB8H8wXdlGfWWnvQ+1P2vV73cHLm
         N8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687452831; x=1690044831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8yYMEX/t8Klnote5y9PwMV4v/R5Zq9BMnCmr1KijqA=;
        b=A7i7jwARrA+VutdSSQ8jN6ii8/TcVM8SEAx51W6QFN13TCvE5E2lQi7I+k+8HLo5I9
         JfbvhAppJ4+jX0i1herJIEBELFckG00vduoOKWDqMS4idglhV2PBNj+jVSudWPOaYoWI
         2aV9s9xPImDAPXdouQAXTWddSl9C95zhsNE2WLAD6W/KSH26Fyr6WETc3rO9MC/7ez0I
         4r6gGFfPmvHx+mGv3rUdHgpU5qk/MssdbE0eK4KQMEy8p57A3LxDwb1Fe6rPfCZA8jl2
         TJXBtyZGZDojxdON85AS4DdvsPkKnXoSppQwKRZjFjjalPRqfQ5z6uVmCrsR+VAHUVgR
         aEkA==
X-Gm-Message-State: AC+VfDwK94tnpWIJS973khaiVCvRecqvV4R2ZtP1VOq9ZnZIZ4jDyN7Z
        LJymyl8AaDvG4rWwXSTt+4pBzYJ4Vtnm9agY/DA=
X-Google-Smtp-Source: ACHHUZ5wJu27nrivTok6qs1B5hPokhBnncL+1s3kNTj874MuSDplDrZIaOADSQJQsgir26+dJQ0jdGdQR5JUGcopGA4=
X-Received: by 2002:a05:6871:4f18:b0:1a9:8484:40d with SMTP id
 zu24-20020a0568714f1800b001a98484040dmr15092643oab.23.1687452830873; Thu, 22
 Jun 2023 09:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
In-Reply-To: <20230622-mips-ralink-clk-wuninitialized-v1-1-ea9041240d10@kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 22 Jun 2023 18:53:39 +0200
Message-ID: <CAMhs-H_aKYGrCYemyOoNk+nHzDfmAU+BoV2pA7eauZ+k5PhGEQ@mail.gmail.com>
Subject: Re: [PATCH] clk: ralink: mtmips: Fix uninitialized use of ret in mtmips_register_{fixed,factor}_clocks()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     tsbogend@alpha.franken.de, sboyd@kernel.org,
        ndesaulniers@google.com, trix@redhat.com,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        patches@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 22, 2023 at 5:56=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
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
> ---
>  drivers/clk/ralink/clk-mtmips.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks for the patch, Nathan!!

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos
