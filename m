Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B201E44B06A
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbhKIPe1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:34:27 -0500
Received: from elvis.franken.de ([193.175.24.41]:39275 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239290AbhKIPeT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 10:34:19 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkT5p-00033f-03; Tue, 09 Nov 2021 16:31:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 64D34C2C38; Tue,  9 Nov 2021 16:30:40 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:30:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@linux-mips.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: Re: [PATCH] MIPS: VDSO: remove -nostdlib compiler flag
Message-ID: <20211109153040.GD12535@alpha.franken.de>
References: <20211107161938.323485-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107161938.323485-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 08, 2021 at 01:19:38AM +0900, Masahiro Yamada wrote:
> The -nostdlib option requests the compiler to not use the standard
> system startup files or libraries when linking. It is effective only
> when $(CC) is used as a linker driver.
> 
> Since commit 2ff906994b6c ("MIPS: VDSO: Use $(LD) instead of $(CC) to
> link VDSO"), $(LD) is directly used, hence -nostdlib is unneeded.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index 1b2ea34c3d3b..d65f55f67e19 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -57,7 +57,7 @@ endif
>  
>  # VDSO linker flags.
>  ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
> -	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
> +	$(filter -E%,$(KBUILD_CFLAGS)) -shared \
>  	-G 0 --eh-frame-hdr --hash-style=sysv --build-id=sha1 -T
>  
>  CFLAGS_REMOVE_vdso.o = $(CC_FLAGS_FTRACE)
> -- 
> 2.30.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
