Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280F36DA4CE
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 23:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbjDFVjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 17:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjDFVjq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 17:39:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AF183DC
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 14:39:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7AB863641
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 21:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE88C433D2;
        Thu,  6 Apr 2023 21:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680817184;
        bh=8FDSxGfrph8KEufTAslJ2MKROTVA9k9BtUDmy+SFL2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A5DJ7lVekGuTeCwUyeUUqz+vlbNFAAv9w9Q0iTNtM/vx06ODk1ywvEyfQ95bnzcDu
         9/cLOPZwTeRNfBV6v6jaRhu8cmI7O2ar4zktXwjrIpgbX4X5ZAjqFd5NPZ2OIlF//x
         naS1o1TQ8a6U7f+D1lKwnxxQMYD8bw4xDrFfhgs5beO54g08KRdqleaj9wss5jBEO0
         7iKNeOEO77oMhFz8A+XMtzNFUyTuC7bXlEELsm3H9R9TNKR8BgWWszf72jfZe3Y1SN
         ABABzTuMm5TuzZ0YNAsjIKt3apfHhi4P4H9g7ldnKuHmaPhMkY8IPCj+DfFUIt4sJu
         khqT9KWHv5cHg==
Date:   Thu, 6 Apr 2023 14:39:42 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] MIPS: generic: Do not select CPUs that are unsupported
 in clang
Message-ID: <20230406213942.GA2148894@dev-arch.thelio-3990X>
References: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
 <AAAAB6A1-81EE-42A8-84F7-CF8D0DA16456@flygoat.com>
 <20230406210953.GA53516@dev-arch.thelio-3990X>
 <EBE3E940-B8EE-4682-A1F6-1CCF98EAC2E6@flygoat.com>
 <6B77736C-1015-45A7-A48A-92E4CBE95ACA@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6B77736C-1015-45A7-A48A-92E4CBE95ACA@flygoat.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 06, 2023 at 10:30:22PM +0100, Jiaxun Yang wrote:
> 
> 
> > 2023年4月6日 22:19，Jiaxun Yang <jiaxun.yang@flygoat.com> 写道：
> > 
> > 
> > 
> >> 2023年4月6日 22:09，Nathan Chancellor <nathan@kernel.org> 写道：
> >> 
> >> On Thu, Apr 06, 2023 at 09:59:45PM +0100, Jiaxun Yang wrote:
> >>> 
> >>> 
> >>>> 2023年4月6日 21:09，Nathan Chancellor <nathan@kernel.org> 写道：
> >>>> 
> >>>> When building allnoconfig with clang after commit de34007751aa ("MIPS:
> >>>> generic: Enable all CPUs supported by virt board in Kconfig"), the
> >>>> following error occurs:
> >>>> 
> >>>> error: unknown target CPU 'r4600'
> >>>> note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
> >>>> 
> >>>> Working around that, there are similar errors for 'loongson2e' and
> >>>> 'loongson2f'.
> >>>> 
> >>>> These CPUs are not supported in clang/LLVM, so do not select support for
> >>>> them in MIPS_GENERIC_KERNEL when building with clang.
> >>>> 
> >>>> Fixes: de34007751aa ("MIPS: generic: Enable all CPUs supported by virt board in Kconfig")
> >>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >>> 
> >>> Thanks for the patch.
> >>> 
> >>> Actually there is no need for any special support for those CPUs.
> >>> We should be able to build those kernels with -march=mips3.
> >>> 
> >>> I think something like:
> >>> 
> >>> --- a/arch/mips/Makefile
> >>> +++ b/arch/mips/Makefile
> >>> @@ -150,7 +150,7 @@ cflags-y += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
> >>> #
> >>> cflags-$(CONFIG_CPU_R3000)     += -march=r3000
> >>> cflags-$(CONFIG_CPU_R4300)     += -march=r4300 -Wa,--trap
> >>> -cflags-$(CONFIG_CPU_R4X00)     += -march=r4600 -Wa,--trap
> >>> +cflags-$(CONFIG_CPU_R4X00)     += $(call cc-option,-march=r4600,-march=mips3) -Wa,--trap
> >>> cflags-$(CONFIG_CPU_TX49XX)    += -march=r4600 -Wa,--trap
> >>> cflags-$(CONFIG_CPU_MIPS32_R1) += -march=mips32 -Wa,--trap
> >>> cflags-$(CONFIG_CPU_MIPS32_R2) += -march=mips32r2 -Wa,--trap
> >>> @@ -181,8 +181,8 @@ endif
> >>> cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
> >>> cflags-$(CONFIG_CPU_BMIPS)     += -march=mips32 -Wa,-mips32 -Wa,--trap
> >>> 
> >>> -cflags-$(CONFIG_CPU_LOONGSON2E) += -march=loongson2e -Wa,--trap
> >>> -cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
> >>> +cflags-$(CONFIG_CPU_LOONGSON2E) += $(call cc-option,-march=loongson2e,-march=mips3) -Wa,--trap
> >>> +cflags-$(CONFIG_CPU_LOONGSON2F) += $(call cc-option,-march=loongson2f,-march=mips3) -Wa,--trap
> >>> # Some -march= flags enable MMI instructions, and GCC complains about that
> >>> # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
> >>> cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
> >>> 
> >>> Will make them build.
> >> 
> >> Thank you for taking a look and the suggestion! I applied it and tried
> >> to build allnoconfig but I get
> >> 
> >> error: ABI 'o32' is not supported on CPU 'mips3'
> >> 
> >> immediately, which could certainly be a bug in clang...
> > 
> > There is a clang patch:
> > https://reviews.llvm.org/D146269

Aha, good to know that issue is finally getting resolved :)

> > I’ve seen this warning with CONFIG_MIPS32_O32 enabled, but I think that’s not the case for allnoconfig...
> 
> 
> Oh I see, it’s trying to build a o32 kernel.

I can test this diff tomorrow. Sounds like you have a better grasp on
this problem than I do though so it would probably be better if you sent
the patch but I do not mind doing it if you are unable to.

For the record, with allnoconfig I end up with:

$ rg 64BIT .config
292:CONFIG_SYS_SUPPORTS_64BIT_KERNEL=y
294:CONFIG_CPU_SUPPORTS_64BIT_KERNEL=y
302:# CONFIG_64BIT is not set

$ rg O32 .config
345:# CONFIG_MIPS_O32_FP64_SUPPORT is not set

> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1579,7 +1579,7 @@ config CPU_R4300
> config CPU_R4X00
> bool "R4x00"
> depends on SYS_HAS_CPU_R4X00
> - select CPU_SUPPORTS_32BIT_KERNEL
> + select CPU_SUPPORTS_32BIT_KERNEL if CC_SUPPORTS_O32_WITH_64BIT_ARCH
> select CPU_SUPPORTS_64BIT_KERNEL
> select CPU_SUPPORTS_HUGEPAGES
> help
> @@ -1743,9 +1743,11 @@ config CPU_MIPS32_R5_XPA
> if CPU_LOONGSON2F
> config CPU_NOP_WORKAROUNDS
> bool
> + depends on $(cc-option,-Wa,-mfix-loongson2f-nop)
> config CPU_JUMP_WORKAROUNDS
> bool
> + depends on $(cc-option,-Wa,-mfix-loongson2f-jump)
> config CPU_LOONGSON2F_WORKAROUNDS
> bool "Loongson 2F Workarounds"
> @@ -2497,6 +2499,7 @@ config CPU_HAS_SYNC
> # "MIPS R4400MC Errata, Processor Revision 1.0", erratum #5
> config CPU_DADDI_WORKAROUNDS
> bool
> + depends on $(cc-option,-mno-daddi)
> # Work around certain R4000 CPU errata (as implemented by GCC):
> #
> @@ -2518,6 +2521,7 @@ config CPU_DADDI_WORKAROUNDS
> # erratum #52
> config CPU_R4000_WORKAROUNDS
> bool
> + depends on $(cc-option,-mfix-r4000)
> select CPU_R4400_WORKAROUNDS
> # Work around certain R4400 CPU errata (as implemented by GCC):
> @@ -2528,6 +2532,7 @@ config CPU_R4000_WORKAROUNDS
> # "MIPS R4400MC Errata, Processor Revision 2.0 & 3.0", erratum #4
> config CPU_R4400_WORKAROUNDS
> bool
> + depends on $(cc-option,-mfix-r4400)
> config CPU_R4X00_BUGS64
> bool
> @@ -3174,6 +3179,7 @@ config COMPAT
> config MIPS32_O32
> bool "Kernel support for o32 binaries"
> depends on 64BIT
> + depends on CC_SUPPORTS_O32_WITH_64BIT_ARCH
> select ARCH_WANT_OLD_COMPAT_IPC
> select COMPAT
> select MIPS32_COMPAT
> @@ -3206,6 +3212,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
> config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> def_bool y if CC_IS_CLANG
> +config CC_SUPPORTS_O32_WITH_64BIT_ARCH
> + def_bool y if $(cc-option,-march=mips3 -mabi=o32)
> +
> menu "Power management options"
> config ARCH_HIBERNATION_POSSIBLE
> 
> This will prevent clang build 32bit kernel in case it doesn’t support o32 ABI with 64bit CPU.

Cheers,
Nathan
