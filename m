Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD096ED30E
	for <lists+linux-mips@lfdr.de>; Mon, 24 Apr 2023 19:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjDXRDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Apr 2023 13:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbjDXRDI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Apr 2023 13:03:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0233C4C1E;
        Mon, 24 Apr 2023 10:03:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3FAF561F22;
        Mon, 24 Apr 2023 17:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297D2C433D2;
        Mon, 24 Apr 2023 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682355785;
        bh=VEVvVZ8+SlsEh9PFAshPWT7wBg1WEd2nNfTgDFp1BYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eXuxW1vKbdgSWII8dvlWMbJ9Ck/G2tsLsG+xxW1eDaz1FFdVRlBlyNDIybSzYtp+J
         8kJaCk1Sa2vMRA5I26+0u1q1q5cWgf7n8b3R09muHCWMvmZOjCDK9lXp3WP02n4zGi
         ymWWXUKwSVcPAZj3UXF5ngbq9+YqenmUKkhjDkETrh8sMqKQjVVsYAFK5HMLVJ2Fkr
         acMi4r1vqfmbdXEdwluFi9S4O7rCE6Ji9b4MeqazSmmEx1zKCZj+9KJb+UlZytVvKe
         Ah8ldBTPY5bRvP9si+4b7HHAlqgsCwnuD/8V6WAPBDu4wt9b4/iSmqcqNPFut9VTJp
         oaiCLdGkGU9iw==
Date:   Mon, 24 Apr 2023 10:03:03 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Borislav Petkov <bp@alien8.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for
 microMIPS smartMIPS
Message-ID: <20230424170303.GA1255815@dev-arch.thelio-3990X>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-3-jiaxun.yang@flygoat.com>
 <20230418130823.GA12456@alpha.franken.de>
 <CAKwvOd=ye9jA0-3QRpD76waZCSX=ayFeE2ZNAPPM-fLdyCq1FQ@mail.gmail.com>
 <77F56166-265A-4653-ADF4-B0057604A539@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77F56166-265A-4653-ADF4-B0057604A539@flygoat.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 20, 2023 at 08:41:07PM +0100, Jiaxun Yang wrote:
> 
> 
> > 2023年4月20日 00:01，Nick Desaulniers <ndesaulniers@google.com> 写道：
> > 
> > On Tue, Apr 18, 2023 at 6:13 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> >> 
> >> On Fri, Apr 14, 2023 at 09:06:56AM +0100, Jiaxun Yang wrote:
> >>> microMIPS smartMIPS kernel can only be compiled if they are supported
> >>> by toolchain.
> >>> 
> >>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > 
> > Question: won't the lack of this (patch and rest of the series) hurt
> > our ability to test randconfig builds of ARCH=mips with clang? See
> > also the 0day report from Boris:
> > https://lore.kernel.org/llvm/202304170748.Fg9VIgGd-lkp@intel.com/
> 
> Kconfig experts, Is there any way to generate warning based on Kconfig options?
> So we can let users know there are something went wrong but still allow build to happen.

I do not think there is a way that this can be done within Kconfig
itself but you could do something like arch/x86/Makefile does for
RETPOLINE during archprepare and warn when an option is selected without
a dependency. I envision something like the following but it has not
even been compile tested:

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 04e46ec24319..2c3be65ce3cc 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -399,6 +399,11 @@ ifdef CONFIG_MIPS32_O32
 	@$(kecho) '  Checking missing-syscalls for O32'
 	$(Q)$(MAKE) $(build)=. missing-syscalls missing_syscalls_flags="-mabi=32"
 endif
+ifdef CONFIG_CPU_HAS_SMARTMIPS
+ifndef CC_HAS_SMARTMIPS
+	$(warning CONFIG_CPU_HAS_SMARTMIPS selected without supported compiler, build may not work)
+endif
+endif
 
 install:
 	$(Q)install -D -m 755 vmlinux $(INSTALL_PATH)/vmlinux-$(KERNELRELEASE)

You could also make that depend on !CONFIG_COMPILE_TEST, as that is a
signal that the user does not intend to run this kernel.

Masahiro might have other comments.

Cheers,
Nathan
