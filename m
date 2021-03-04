Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678E832CBCC
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 06:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhCDFTv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 00:19:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:58560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234076AbhCDFTh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 00:19:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAA6964EE1;
        Thu,  4 Mar 2021 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614835137;
        bh=ks396mxGbJMDwWqDM77TaVb8yzjRnPxdJhthci3VPbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cfhmrj4+vqKGW5GDt2BkhI6povBO+2MCsBi0yGxi3sIo4iCIaBED9PpT9H+e9+Sjw
         18EDHsRpCWUxblIOEQBG3YoK0CwQ4S5yg3jGakpRXzobsW4DonxGRu+Fg4pS3c09py
         zUryEzu4Elq+LGHXUhTG0xi6Hgoof4c2aNSAZmIOvFDtR/pw7UGW0DfOPzMR1hPQFb
         7D2uIUwghEvyMB0rDlhRFTpSJWwjxTu8UKMSpUaSNbib0z1R3OfdaBhcoq3HZQu8Yq
         0I4A+N+lB8zh09X38nWyDSt8owVluIIDjhppRtQmUDKcolcSVE8s6csleQdSwLcOD7
         zEdFsLRSK2eAA==
Date:   Wed, 3 Mar 2021 22:18:52 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
Message-ID: <20210304051852.6gf7ry26n3fct3ud@archlinux-ax161>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
 <20210304020244.pza6xd4ixziysrom@archlinux-ax161>
 <958c5df5-76aa-9161-9519-07a03ee864a0@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <958c5df5-76aa-9161-9519-07a03ee864a0@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 11:48:09AM +0800, Tiezhu Yang wrote:
> On 03/04/2021 10:02 AM, Nathan Chancellor wrote:
> > On Thu, Mar 04, 2021 at 09:15:44AM +0800, Tiezhu Yang wrote:
> > > When build kernel with Clang [1]:
> > > 
> > > $ make CC=clang loongson3_defconfig
> > > $ make CC=clang
> 
> [snip]
> 
> > I think this might be a better solution. I know that I personally never
> > read defconfig files if a build fails.
> > 
> > If CONFIG_MIPS32_O32 is broken with clang and the MIPS backend
> > maintainer has said that it will not be supported due to lack of
> > resources, then the config should not even be selectable in my opinion.
> > 
> > Cheers,
> > Nathan
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index d89efba3d8a4..ed35318a759d 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -3315,6 +3315,8 @@ config SYSVIPC_COMPAT
> >   config MIPS32_O32
> >   	bool "Kernel support for o32 binaries"
> >   	depends on 64BIT
> > +	# https://bugs.llvm.org/show_bug.cgi?id=38063
> > +	depends on $(success,$(CC) $(CLANG_FLAGS) -march=mips64 -o32 -c -x c /dev/null -o /dev/null)
> >   	select ARCH_WANT_OLD_COMPAT_IPC
> >   	select COMPAT
> >   	select MIPS32_COMPAT
> 
> Hi Nathan,
> 
> Thank you very much for your reply and suggestion, maybe the following
> change is simple, clear and better? If yes, I will send v2 later.

Hi Tiezhu,

I think that the change is simpler but better is subjective. I tend to
prefer tests like mine so that it is not dependent on someone going "oh
hey, this LLVM bug has been fixed so we can turn this config on!".
Instead, the config will just turn on automatically as soon as that bug
is fixed.

However, in this particular case, it does not seem like that will happen
unless someone steps but there have been times where an independent
party will implement some change that benefits them and nobody notices
for a while. Plus, I periodically grep the tree for CC_IS_CLANG to see
if there are any configuration options that can be re-enabled..

Regardless, if Thomas is happy with the below change, so am I, as it
will allow us to test more 64-bit MIPS configurations. I can add an ack
or review at that point in time.

Cheers,
Nathan

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 3a38d27..f6ba59f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3318,6 +3318,8 @@ config SYSVIPC_COMPAT
>  config MIPS32_O32
>         bool "Kernel support for o32 binaries"
>         depends on 64BIT
> +       # https://bugs.llvm.org/show_bug.cgi?id=38063
> +       depends on !CC_IS_CLANG
>         select ARCH_WANT_OLD_COMPAT_IPC
>         select COMPAT
>         select MIPS32_COMPAT
> 
> Thanks,
> Tiezhu
> 
