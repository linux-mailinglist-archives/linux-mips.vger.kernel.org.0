Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4FC73F130
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jun 2023 05:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjF0DLq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jun 2023 23:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjF0DLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 23:11:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451C8BB;
        Mon, 26 Jun 2023 20:11:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C193E60FF1;
        Tue, 27 Jun 2023 03:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F01C433CB;
        Tue, 27 Jun 2023 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687835502;
        bh=cPKe4gR5GZ15zU0owAL6Rv1f7cS7p6fCijW2a2Zgv9M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C/oqH/3KL3QINOFhfC8XmnY6YiE3Z+sLPfoH14adE1PMOR4Tr4TxVZNDl3yKpxXJ/
         h6PFgk7c4R8gSRbAYeSorf1y/VOeiUPFkYVsL47o0SWI4JRWaGTjwXMTH4MKLn1lre
         1nizl3wPDgckGdEbKaStKfdZjgaUS0uZf1v+teSa/KMJeFjxPaM2o7F84Cmk66DxHx
         4PzYIDhx8Y/zFi8rlzl0/MzsAGLHtMRHINTMplCXJKCEP9aFI7A532lzGpncmF9iKZ
         GpMfoybgYI1nZaz1h6CIVISzQsYv5OtKoqh7s3vhRe4TYHKkUEGCTu3o8vxcEV130/
         zrq9JLUzs6wHQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so273871e87.1;
        Mon, 26 Jun 2023 20:11:42 -0700 (PDT)
X-Gm-Message-State: AC+VfDyjaXMkGxyqExrqV43pVKmY87tIqkG8dXoWDgVfTuWDDc+TzM81
        0UV+Yz+L+ymx4eUMYFnPYg/+HbIeZbpGauh/4/Y=
X-Google-Smtp-Source: ACHHUZ5QKGpKE3yZdgnEGxNBbL5IoNnUxc+PBXS2Iasnu3PqhRabZnPQC0iVhWBeHCev5AaDQbK946DWWvl5HypehJU=
X-Received: by 2002:a05:6512:74a:b0:4f9:b032:5361 with SMTP id
 c10-20020a056512074a00b004f9b0325361mr4087841lfs.10.1687835500049; Mon, 26
 Jun 2023 20:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230626075047.1872818-1-chenhuacai@loongson.cn> <20230626160720.GA2174263@dev-arch.thelio-3990X>
In-Reply-To: <20230626160720.GA2174263@dev-arch.thelio-3990X>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 27 Jun 2023 11:11:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6nyXa+wG-J50d=FrHX=4saVNAePW8HHQ2hm+EsGR9Umw@mail.gmail.com>
Message-ID: <CAAhV-H6nyXa+wG-J50d=FrHX=4saVNAePW8HHQ2hm+EsGR9Umw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix build error when make modules_install
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Nathan,

On Tue, Jun 27, 2023 at 12:07=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Jun 26, 2023 at 03:50:47PM +0800, Huacai Chen wrote:
> > After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> > cc-ifversion") we get a build error when make modules_install:
> >
> > cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> >
> > The reason is when make modules_install, 'call cc-option' doesn't work
> > in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> > applied and -march=3Dloongson3a enable MMI instructions.
>
> The first sentence does not make much sense to me, specifically "in
> $(KBUILD_CFLAGS) of 'CHECKFLAGS'". What configuration and build command
> reproduces this? I do not see how '-mno-loongson-mmi' would fail to get
> added to cflags-y after 0e96ea5c3eb5, which should have had no
> functional change... I don't want to hang this change up since there is
> real breakage but I want to make sure we fully understand why
> 0e96ea5c3eb5 broke things and why this patch resolves it.
Please use loongson3_defconfig to build a loongson kernel with
toolchains from here [1]:
'make' will succeed, but there is a build error when 'make
modules_install'. And you should be careful because 'make
modules_install' doesn't stop when the error occurs.

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/

Huacai
>
> > Fix this by partially reverting to the old logic, use 'call cc-option'
> > to conditionally apply -march=3Dloongson3a and -march=3Dmips64r2.
> >
> > Fixes: 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of cc-ifv=
ersion")
> > Cc: stable@vger.kernel.org
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/mips/Makefile | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> > index a7a4ee66a9d3..7fb76d12829e 100644
> > --- a/arch/mips/Makefile
> > +++ b/arch/mips/Makefile
> > @@ -186,11 +186,8 @@ cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloon=
gson2f -Wa,--trap
> >  # Some -march=3D flags enable MMI instructions, and GCC complains abou=
t that
> >  # support being enabled alongside -msoft-float. Thus explicitly disabl=
e MMI.
> >  cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call cc-option,-mno-loongson-m=
mi)
> > -ifdef CONFIG_CPU_LOONGSON64
> >  cflags-$(CONFIG_CPU_LOONGSON64)      +=3D -Wa,--trap
> > -cflags-$(CONFIG_CC_IS_GCC) +=3D -march=3Dloongson3a
> > -cflags-$(CONFIG_CC_IS_CLANG) +=3D -march=3Dmips64r2
> > -endif
> > +cflags-$(CONFIG_CPU_LOONGSON64) +=3D $(call cc-option,-march=3Dloongso=
n3a,-march=3Dmips64r2)
> >  cflags-$(CONFIG_CPU_LOONGSON64) +=3D $(call cc-option,-mno-loongson-mm=
i)
> >
> >  cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)       +=3D $(call cc-option,-mf=
ix-r4000,)
> > --
> > 2.39.3
> >
