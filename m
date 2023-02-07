Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD46668E1CD
	for <lists+linux-mips@lfdr.de>; Tue,  7 Feb 2023 21:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjBGUXM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Feb 2023 15:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBGUXL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Feb 2023 15:23:11 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6952510277
        for <linux-mips@vger.kernel.org>; Tue,  7 Feb 2023 12:23:10 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id A6F9192009C; Tue,  7 Feb 2023 21:23:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 9FCF892009B;
        Tue,  7 Feb 2023 20:23:06 +0000 (GMT)
Date:   Tue, 7 Feb 2023 20:23:06 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Nick Desaulniers <ndesaulniers@google.com>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors,
 22 warnings (v6.2-rc7-273-gd67c17ddc899)
In-Reply-To: <85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com>
Message-ID: <alpine.DEB.2.21.2302071942200.11790@angie.orcam.me.uk>
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com> <Y+IRiiRtXvUzXOGp@gmail.com> <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com> <Y+JU07y+lvYAtZQT@sirena.org.uk> <85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 7 Feb 2023, Guillaume Tucker wrote:

> After some investigation, it turns out the error happens when
> doing "make modules_install".  Here's the issue:
> 
> * modules_install is listed in "no-compiler-targets" in the
> top-level Makefile
> 
> * as a result, scripts/Makefile.compiler is not included
> 
> * arch/mips/loongson64/Platform requires the "cc-option" function
>   to add -mnon-loongson-mmi
> 
> * since "cc-option" is not defined when just doing "make
>   modules_install", the flag is not added and the error mentioned
>   above occurs
> 
> GitHub issue: https://github.com/kernelci/kernelci-project/issues/176
> 
> Here's a hack to prove this point, need-compiler is defined in
> the top-level Makefile so it shouldn't be used here but
> this "fixes" the problem:
> 
> 
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 490dea07d4e0..024f62dbef76 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -317,10 +317,12 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  KBUILD_LDFLAGS         += -m $(ld-emul)
>  
>  ifdef CONFIG_MIPS
> +ifdef need-compiler
>  CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
>         grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
>         sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
>  endif
> +endif

 I think it is actually the proper way, and if this gets a go-ahead, then 
all you need is to replace `CONFIG_MIPS' with `need-compiler' in the 
existing conditional, as the very purpose of this conditional is to guard 
the assignment against being invoked, except for `no-dot-config-targets' 
only (as discussed here: 
<https://lore.kernel.org/all/1675328702-8328-1-git-send-email-yangtiezhu@loongson.cn/> 
as recently as last week) rather than all of `no-compiler-targets'.  
Evidently that is not enough, but please mind that with embedded targets 
people often do not use modules and therefore do not trip over issues with 
`make modules_install'.

 This should probably be marked with:

Fixes: 13ceb48bc19c ("MIPS: Loongson2ef: Remove unnecessary 
{as,cc}-option calls")

as it's when `-march=loongson2f' (which implies `-mloongson-mmi') started 
being added unconditionally (and then `-march=loongson3a' followed with 
commit 0e96ea5c3eb5 ("MIPS: Loongson64: Clean up use of cc-ifversion")).
Nick, I'm afraid these were both your stuff.

 Also Loongson targets have their dedicated platform maintainers (cc-ed) 
and general MIPS maintainers may pay less attention to such issues.

 FWIW and HTH,

  Maciej
