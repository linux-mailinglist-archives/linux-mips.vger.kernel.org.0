Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FEA376E4B
	for <lists+linux-mips@lfdr.de>; Sat,  8 May 2021 04:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhEHCA7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 May 2021 22:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhEHCA7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 May 2021 22:00:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101A5C061574;
        Fri,  7 May 2021 18:59:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FcVr04Pwkz9sWl;
        Sat,  8 May 2021 11:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620439189;
        bh=J1/aeu6sDDZIxeY9gaohtta3/N8SRl0zHtNQvaH+PpQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I9gp/TJIY+lJ1c7LxCn+pN7YNs4Yv3uC16F4Pe5ltIpkFdTGHQuQlKUcpUbbS7MtM
         mWQL4ObXzJ3cYvSCfk9aT6E12hIV2fl3x1l3uEEowlTtWSwYBgi+QhoF0yaHEh4C8A
         9PsT2pKb2w3ruzjdWg7LFh+sLBwbtPzrM4su+XjtEDB5kG/m/PrAJeakOjzvKo8M2Y
         TKJdUh/BP4MlwMC518r2pDwi7q0GoseCEimfwsbkx5ySiCADfwBoOGgu7fOVDRm5n2
         H8IGmId3I4haetbYJxgY7jzck6aJagIAlh3wpYLQe93gsv3m+dPCqQwI0Qt2xB9xN9
         SVEUca8Hq1SDg==
Date:   Sat, 8 May 2021 11:59:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, chao <chao@eero.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF()
 in <linux/kernel.h>
Message-ID: <20210508115943.5dbf76f2@canb.auug.org.au>
In-Reply-To: <20210505174515.87565-1-masahiroy@kernel.org>
References: <20210505174515.87565-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pKT.L0/u5p+I2wWxtmkAky6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/pKT.L0/u5p+I2wWxtmkAky6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Thu,  6 May 2021 02:45:15 +0900 Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>
> <linux/kconfig.h> is included from all the kernel-space source files,
> including C, assembly, linker scripts. It is intended to contain a
> minimal set of macros to evaluate CONFIG options.
>=20
> IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
> should not be included from assembly files or linker scripts.

Except it doesn't matter unless IF_ENABLED() is used by one of those.

> Also, <linux/kconfig.h> is no longer self-contained because NULL is
> defined in <linux/stddef.h>.

Again, it doesn't matter unless IF_ENABLED() is used.

> Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF(). PTF_IF()
> takes the general boolean expression instead of a CONFIG option
> so that it fits better in <linux/kernel.h>.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
> Changes in v2:
>   - Keep PTF_IF macro in pinctrl-ingenic.c
>=20
>  drivers/pinctrl/pinctrl-ingenic.c | 2 ++
>  include/linux/kconfig.h           | 6 ------
>  include/linux/kernel.h            | 2 ++
>  3 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
> index 651a36b9dcc0..0ee69f8e20b2 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3854,6 +3854,8 @@ static int __init ingenic_pinctrl_probe(struct plat=
form_device *pdev)
>  	return 0;
>  }
> =20
> +#define IF_ENABLED(cfg, ptr)	PTR_IF(IS_ENABLED(cfg), (ptr))
> +
>  static const struct of_device_id ingenic_pinctrl_of_match[] =3D {
>  	{
>  		.compatible =3D "ingenic,jz4730-pinctrl",

You also need to include linux/kernel.h in
drivers/pinctrl/pinctrl-ingenic.c (for completeness).

Also, I don't understand why the use of IF_ENABLED doesn't produce
"defined but not used" warnings (if the function "ptr" is not marked as
__maybe_unused) ...

Also, if there is only one user of IF_ENABLED (and therefore PTR_IF),
why not just put it in that file and save me rebuilding the world again
every day because kernel.h is changed (again).  I guess that is going
to happen just because kconfig.h is being changed and that is also
included by everything :-(

Also, is anyone else ever going to use PTR_IF() without having to also
use IS_ENABLED()?

So, in case it is not obvious, I consider this patch unnecessary churn
(as was probably the patch that introduced IF_ENABLED in the first
place).

As an aside, this should not have been added to the kbuild tree in
linux-next until after -rc1 was released ...

--=20
Cheers,
Stephen Rothwell

--Sig_/pKT.L0/u5p+I2wWxtmkAky6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCV8I8ACgkQAVBC80lX
0GxIUAgAmYisSa9XcG17XA+g98W0dtVKy/JJn4n2mhLiY3zKt1d3bWR6LzvjTuCq
W/dQxkpBb/DmNI3to2qfoZR8SRDzu97O9TFxjwsLb9mtbI7OkUx3N5PBrJdF4Ci5
0EstJ/raOnEm0/wctC4Cf14Rqd77/k4FLM3alzsMGq62/ntSNr+ugRiLhs0RWSjp
e7U/tuffHWtBgqqZYW6u/7LJyEK3k9+IVqimPQb/pD6HS0fZMyaATM7nGc+6Nf/x
RB1YgKKxSQw2OevdbGFeEwvD6hILR4RwpjY5MV4aMMpsDHZtuqdUA6snElFw0Rt8
X/je7ntGKOoFhwJE/D5r8X9j28aJ3Q==
=E5Ka
-----END PGP SIGNATURE-----

--Sig_/pKT.L0/u5p+I2wWxtmkAky6--
