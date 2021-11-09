Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EB144B0CC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbhKIQAl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 11:00:41 -0500
Received: from elvis.franken.de ([193.175.24.41]:39308 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236475AbhKIQAl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 11:00:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkTVS-0003EX-00; Tue, 09 Nov 2021 16:57:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 47D78C2C38; Tue,  9 Nov 2021 16:32:27 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:32:27 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jason Self <jason@bluehome.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: fix *-pkg builds for loongson2ef platform
Message-ID: <20211109153227.GA13509@alpha.franken.de>
References: <20211109150146.529428-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109150146.529428-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 10, 2021 at 12:01:45AM +0900, Masahiro Yamada wrote:
> Since commit 805b2e1d427a ("kbuild: include Makefile.compiler only when
> compiler is needed"), package builds for the loongson2f platform fail.
> 
>   $ make ARCH=mips CROSS_COMPILE=mips64-linux- lemote2f_defconfig bindeb-pkg
>     [ snip ]
>   sh ./scripts/package/builddeb
>   arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.
>   cp: cannot stat '': No such file or directory
>   make[5]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
>   make[4]: *** [Makefile:1558: intdeb-pkg] Error 2
>   make[3]: *** [debian/rules:13: binary-arch] Error 2
>   dpkg-buildpackage: error: debian/rules binary subprocess returned exit status 2
>   make[2]: *** [scripts/Makefile.package:83: bindeb-pkg] Error 2
>   make[1]: *** [Makefile:1558: bindeb-pkg] Error 2
>   make: *** [Makefile:350: __build_one_by_one] Error 2
> 
> The reason is because "make image_name" fails.
> 
>   $ make ARCH=mips CROSS_COMPILE=mips64-linux- image_name
>   arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.
> 
> In general, adding $(error ...) in the parse stage is troublesome,
> and it is pointless to check toolchains even if we are not building
> anything. Do not include Kbuild.platform in such cases.
> 
> Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
> Reported-by: Jason Self <jason@bluehome.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e036fc025ccc..ace7f033de07 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -253,7 +253,9 @@ endif
>  #
>  # Board-dependent options and extra files
>  #
> +ifdef need-compiler
>  include $(srctree)/arch/mips/Kbuild.platforms
> +endif
>  
>  ifdef CONFIG_PHYSICAL_START
>  load-y					= $(CONFIG_PHYSICAL_START)
> -- 
> 2.30.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
