Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380227414CC
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jun 2023 17:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjF1PWO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jun 2023 11:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjF1PWN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Jun 2023 11:22:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C940A1;
        Wed, 28 Jun 2023 08:22:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93B966124B;
        Wed, 28 Jun 2023 15:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEAFC433C8;
        Wed, 28 Jun 2023 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687965731;
        bh=DIfgwnSvq5Mxxls/Etv1JS9SwA20ZNhaVjbRUbdW3vU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WkMgkDRZzxHIlfocJxGPSMnwGdh2t0tHJw0stYAC0jiV9ydQgkXfcIh1iGiTHExsS
         bZFHPFXt6XjyOWwjwhhgtsDy/VmN2mP1xTUChODc0dJwz0VMP7BdY5tPki0S+h5y7D
         2eDLH5Vt9tRv0932vipOZ2h/sgFUay1NdXhy/Tc3M+8AyYwbPgetRg+frCu2sJAJwU
         5wjgXUSPa/vfa+zHIhTPpceFAwJpBN/7Fz+McyPiJGiqMDc5874c8Q7Paao86F5kAO
         ALAjROf+4T40/0BdxmEoTcavMKQbS6RrslmIvLNyGJuxHhC6FMGsHJb0i9vd9b2bqm
         AbgjiQ0k2bzkw==
Date:   Wed, 28 Jun 2023 08:22:08 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@gmail.com>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        Feiyang Chen <chenfeiyang@loongson.cn>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Fix build error when make
 modules_install
Message-ID: <20230628152208.GA250029@dev-arch.thelio-3990X>
References: <20230628110847.3168269-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628110847.3168269-1-chenhuacai@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 28, 2023 at 07:08:47PM +0800, Huacai Chen wrote:
> After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> cc-ifversion") we get a build error when make modules_install:
> 
> cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> 
> The reason is when make modules_install, 'call cc-option' doesn't work
> in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> applied and -march=loongson3a enable MMI instructions.
> 
> To be detail, the error message comes from the CHECKFLAGS invocation of
> $(CC) but it has no impact on the final result of make modules_install,
> it is purely a cosmetic issue. The error occurs because cc-option is
> defined in scripts/Makefile.compiler, which is not included in Makefile
> when running 'make modules_install', as install targets are not supposed
> to require the compiler; see commit 805b2e1d427aab4b ("kbuild: include
> Makefile.compiler only when compiler is needed"). As a result, the call
> to check for '-mno-loongson-mmi' just never happens.
> 
> Fix this by partially reverting to the old logic, use 'call cc-option'
> to conditionally apply -march=loongson3a and -march=mips64r2.
> 
> By the way, Loongson-2E/2F is also broken in commit 13ceb48bc19c563e05f4
> ("MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls") so fix it
> together.
> 
> Fixes: 13ceb48bc19c563e05f4 ("MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls")
> Fixes: 0e96ea5c3eb5904e5dc2 ("MIPS: Loongson64: Clean up use of cc-ifversion")
> Cc: stable@vger.kernel.org
> Cc: Feiyang Chen <chenfeiyang@loongson.cn>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> V2: Update commit message and fix for LOONGSON2EF together.
> 
>  arch/mips/Makefile | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index a7a4ee66a9d3..35a1b9b34734 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -181,16 +181,12 @@ endif
>  cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
>  cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
>  
> -cflags-$(CONFIG_CPU_LOONGSON2E) += -march=loongson2e -Wa,--trap
> -cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2E) += $(call cc-option,-march=loongson2e) -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON2F) += $(call cc-option,-march=loongson2f) -Wa,--trap
> +cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-march=loongson3a,-march=mips64r2) -Wa,--trap
>  # Some -march= flags enable MMI instructions, and GCC complains about that
>  # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
>  cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
> -ifdef CONFIG_CPU_LOONGSON64
> -cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
> -cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
> -cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
> -endif
>  cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
>  
>  cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
> -- 
> 2.39.3
> 
