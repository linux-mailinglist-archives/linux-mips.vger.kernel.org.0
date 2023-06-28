Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD98D740B61
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jun 2023 10:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbjF1I1O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jun 2023 04:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234241AbjF1IZJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Jun 2023 04:25:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804574201;
        Wed, 28 Jun 2023 01:14:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 354656132F;
        Wed, 28 Jun 2023 07:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CD1C43395;
        Wed, 28 Jun 2023 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687937821;
        bh=FHd2lTbvsIIzHQmCcMNd3oy0ZJaK0w1A6wsgplCYx0Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=epi3Q9iu50HKC/yrjUTLCNGFjXwatUn07RqG5KEcnk5iICVsWh8vTqMgNZFsP/vug
         3+HkNGr33pAMFS4gWSgIIVxRk/UVvtFWZClfqQ5WWNayoynyyZ6nv4dzQviGv3v0qE
         iu3OH6yE5fKUwX0UF1CJDnamufoAdAEQEzNWGalNT6OI31Jcphms3/Iz0TT7hjpwMd
         Al6Dvy7YMKls0dz3YCgR1HXVfprvtqcpIl99CQxGQQFfX6NC2Bd2IiXN+woaWIB/8a
         OOyF2K3QGEOMe/lNwv+nM/DBIOM1TaW8cgwCVAwmpsFy17bqBKFgczugdKl6PmpPaH
         b7DbX9rmZVU6A==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d884a22e7so5306688a12.3;
        Wed, 28 Jun 2023 00:37:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDwwYnwOaDz0P3eyqjbiY1z9F72YdEmNo7NhwUR2iFymOU4plO+U
        pLFMhbAHqcoHZSdYwej+6Laos88Q6fbe1sy8u0U=
X-Google-Smtp-Source: ACHHUZ6NB5UruUH/V0e7QCYg9qAl4dtFgcinn2A4NlMDpQnIZXsZ+O8yFsnpArkDKOcNDewJivafbdv7a7wjyVxNDSA=
X-Received: by 2002:a50:ef01:0:b0:51d:adc5:22c1 with SMTP id
 m1-20020a50ef01000000b0051dadc522c1mr2565093eds.36.1687937819590; Wed, 28 Jun
 2023 00:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230626075047.1872818-1-chenhuacai@loongson.cn>
 <20230626160720.GA2174263@dev-arch.thelio-3990X> <CAAhV-H6nyXa+wG-J50d=FrHX=4saVNAePW8HHQ2hm+EsGR9Umw@mail.gmail.com>
 <20230627212839.GA1806408@dev-arch.thelio-3990X>
In-Reply-To: <20230627212839.GA1806408@dev-arch.thelio-3990X>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 28 Jun 2023 15:36:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5VDvNnBixrm9nhKeSQ1pj9N-fkW-cRY99OpduVd=5+Mw@mail.gmail.com>
Message-ID: <CAAhV-H5VDvNnBixrm9nhKeSQ1pj9N-fkW-cRY99OpduVd=5+Mw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix build error when make modules_install
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Nathan,

On Wed, Jun 28, 2023 at 5:28=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Huacai,
>
> + Masahiro
>
> On Tue, Jun 27, 2023 at 11:11:27AM +0800, Huacai Chen wrote:
> > Hi, Nathan,
> >
> > On Tue, Jun 27, 2023 at 12:07=E2=80=AFAM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > >
> > > On Mon, Jun 26, 2023 at 03:50:47PM +0800, Huacai Chen wrote:
> > > > After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use=
 of
> > > > cc-ifversion") we get a build error when make modules_install:
> > > >
> > > > cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> > > >
> > > > The reason is when make modules_install, 'call cc-option' doesn't w=
ork
> > > > in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson=
-mmi
> > > > applied and -march=3Dloongson3a enable MMI instructions.
> > >
> > > The first sentence does not make much sense to me, specifically "in
> > > $(KBUILD_CFLAGS) of 'CHECKFLAGS'". What configuration and build comma=
nd
> > > reproduces this? I do not see how '-mno-loongson-mmi' would fail to g=
et
> > > added to cflags-y after 0e96ea5c3eb5, which should have had no
> > > functional change... I don't want to hang this change up since there =
is
> > > real breakage but I want to make sure we fully understand why
> > > 0e96ea5c3eb5 broke things and why this patch resolves it.
> > Please use loongson3_defconfig to build a loongson kernel with
> > toolchains from here [1]:
> > 'make' will succeed, but there is a build error when 'make
> > modules_install'. And you should be careful because 'make
> > modules_install' doesn't stop when the error occurs.
>
> Excellent, thank you! I understand what is going on here and your patch
> should work to resolve it (although I think the commit message should be
> flushed out a little more with the following details) but I am curious
> if Masahiro has any thoughts around this.
>
> As you note, the error message comes from the CHECKFLAGS invocation of
> $(CC) but it has no impact on the final result of modules_install, it is
> purely a cosmetic issue from what I can tell. The error occurs because
> cc-option is defined in scripts/Makefile.compiler, which is not included
> in Makefile when running modules_install, as install targets are not
> supposed to require the compiler; see commit 805b2e1d427a ("kbuild:
> include Makefile.compiler only when compiler is needed"). As a result,
> the call to check for '-mno-loongson-mmi' just never happens.
>
> It would nice if '-mno-loongson-mmi' could be added unconditionally when
> using GCC but I can see that the flag has only existed since 9.x, so we
> do need to keep the cc-option call.
>
> I am fine with your change as long as it includes some of the above
> information (basically noting that while the original change should have
> been equivalent, the requirement of '-mno-loongson-mmi' when using
> certain Loongson '-march=3D' values with '-msoft-float' means that those
> Loongson '-march=3D' values need to be called with cc-option as well),
> even if clang will incur two more cc-option calls as a result (not the
> end of the world).
>
> Additionally, it seems like the same issue will occur when running
> modules_install when CONFIG_CPU_LOONGSON2E or CONFIG_CPU_LOONGSON2F are
> enabled, which I guess I also broke in commit 13ceb48bc19c ("MIPS:
> Loongson2ef: Remove unnecessary {as,cc}-option calls") :/
>
> Sorry again for the breakage and thanks for the fix!
OK, I will update the commit message and fix for LOONGSON2EF together.

Huacai
>
> Cheers,
> Nathan
>
> > > > Fix this by partially reverting to the old logic, use 'call cc-opti=
on'
> > > > to conditionally apply -march=3Dloongson3a and -march=3Dmips64r2.
> > > >
> > > > Fixes: 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of cc=
-ifversion")
> > > > Cc: stable@vger.kernel.org
> > > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  arch/mips/Makefile | 5 +----
> > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> > > > index a7a4ee66a9d3..7fb76d12829e 100644
> > > > --- a/arch/mips/Makefile
> > > > +++ b/arch/mips/Makefile
> > > > @@ -186,11 +186,8 @@ cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3D=
loongson2f -Wa,--trap
> > > >  # Some -march=3D flags enable MMI instructions, and GCC complains =
about that
> > > >  # support being enabled alongside -msoft-float. Thus explicitly di=
sable MMI.
> > > >  cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call cc-option,-mno-loongs=
on-mmi)
> > > > -ifdef CONFIG_CPU_LOONGSON64
> > > >  cflags-$(CONFIG_CPU_LOONGSON64)      +=3D -Wa,--trap
> > > > -cflags-$(CONFIG_CC_IS_GCC) +=3D -march=3Dloongson3a
> > > > -cflags-$(CONFIG_CC_IS_CLANG) +=3D -march=3Dmips64r2
> > > > -endif
> > > > +cflags-$(CONFIG_CPU_LOONGSON64) +=3D $(call cc-option,-march=3Dloo=
ngson3a,-march=3Dmips64r2)
> > > >  cflags-$(CONFIG_CPU_LOONGSON64) +=3D $(call cc-option,-mno-loongso=
n-mmi)
> > > >
> > > >  cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)       +=3D $(call cc-option=
,-mfix-r4000,)
> > > > --
> > > > 2.39.3
> > > >
