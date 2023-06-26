Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33DE73E42E
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jun 2023 18:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjFZQHZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jun 2023 12:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFZQHY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 12:07:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5D71A8;
        Mon, 26 Jun 2023 09:07:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2D8760E17;
        Mon, 26 Jun 2023 16:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7BFC433C0;
        Mon, 26 Jun 2023 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687795642;
        bh=iCLEXlg6eshLQr9M4oiU0qzm0ye3ouVFYkpH9ZcyY6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WxETgfXvYiOjvaxRf4LB0iHtkidXkht4bCDgaDq250SKCRptNtozg32hn0prczhRP
         Nn8Aw3BM7gXMlx7y3Eyzu5VGEzL9VVZREvC0ORvhpqovtNJctscpAf+upHB5jmwoMR
         rfbpv9JaA6YexSybQ72gC2txS2cIJI5vGDayuXLzw4S28NH0l2gK9HDwhuh7KkdOs8
         RT0Izk1cEXjJRfqVEQB2nbTmv3BxubdOYBrnH4599+Su+obGhWxDW/OIhQJHeXy71s
         0PjGMLpPUzuSGQGNjm5AUuVSexQO5AiVa9ReI3NyV7jKkeMDfeQGokgWODnLohT3Js
         2ATVAGMcnVTVA==
Date:   Mon, 26 Jun 2023 09:07:20 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] MIPS: Loongson: Fix build error when make modules_install
Message-ID: <20230626160720.GA2174263@dev-arch.thelio-3990X>
References: <20230626075047.1872818-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626075047.1872818-1-chenhuacai@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 26, 2023 at 03:50:47PM +0800, Huacai Chen wrote:
> After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> cc-ifversion") we get a build error when make modules_install:
> 
> cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> 
> The reason is when make modules_install, 'call cc-option' doesn't work
> in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> applied and -march=loongson3a enable MMI instructions.

The first sentence does not make much sense to me, specifically "in
$(KBUILD_CFLAGS) of 'CHECKFLAGS'". What configuration and build command
reproduces this? I do not see how '-mno-loongson-mmi' would fail to get
added to cflags-y after 0e96ea5c3eb5, which should have had no
functional change... I don't want to hang this change up since there is
real breakage but I want to make sure we fully understand why
0e96ea5c3eb5 broke things and why this patch resolves it.

> Fix this by partially reverting to the old logic, use 'call cc-option'
> to conditionally apply -march=loongson3a and -march=mips64r2.
> 
> Fixes: 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of cc-ifversion")
> Cc: stable@vger.kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/mips/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index a7a4ee66a9d3..7fb76d12829e 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -186,11 +186,8 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
>  # Some -march= flags enable MMI instructions, and GCC complains about that
>  # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
>  cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
> -ifdef CONFIG_CPU_LOONGSON64
>  cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
> -cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
> -cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
> -endif
> +cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-march=loongson3a,-march=mips64r2)
>  cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
>  
>  cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
> -- 
> 2.39.3
> 
