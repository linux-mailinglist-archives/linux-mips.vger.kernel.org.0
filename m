Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D0932CA54
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 03:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbhCDCDd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 21:03:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:59480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232327AbhCDCD3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 21:03:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE8FC65032;
        Thu,  4 Mar 2021 02:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614823369;
        bh=DrYX2qaJ9dvf1qQJvkrG1HtM2hWEUOPp/Y+12r4zZCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pTADc1lpgDGV9isZh76J0naVDGMaKZbfBfwku5J8vI0Q/p5S5tS1bqYoNoMyEyeVx
         tpdEctVmzjgP2Beg1meSAjAVdLVmSvf1Q4/o3soT5YTYCO8zbVfS+8vvLFNNH8/0H6
         3k/FQgKn1UDX3SIEvO03XcpCB1CTnOvjQxiBgGVd9aEjflZ7q6rK79xiYYQgDWHu+X
         E9xFpmaU2zKuIfIOmqoyBu7pOGy5oqGJYmKwTRee+HgsQs3TTP89/HYCXlZp2ya5WL
         PY9442mX4ijTepCwEOyNMmGRJ3awLhAVsXFkG76NgdVEjPmUOsRfT0DhuA4F3QxHX2
         E9SZXJr1Uye+Q==
Date:   Wed, 3 Mar 2021 19:02:44 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
Message-ID: <20210304020244.pza6xd4ixziysrom@archlinux-ax161>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 09:15:44AM +0800, Tiezhu Yang wrote:
> When build kernel with Clang [1]:
> 
> $ make CC=clang loongson3_defconfig
> $ make CC=clang
> 
> there exists the following error:
> 
>   Checking missing-syscalls for O32
>   CALL    scripts/checksyscalls.sh
> error: ABI 'o32' is not supported on CPU 'mips64r2'
> make[1]: *** [Kbuild:48: missing-syscalls] Error 1
> make: *** [arch/mips/Makefile:419: archprepare] Error 2
> 
> This is a known bug [2] with Clang, as Simon Atanasyan said,
> "There is no plan on support O32 for MIPS64 due to lack of
> resources".
> 
> It is not a good idea to remove this config due to GCC works
> well, so add comment to point out this bug and suggest the
> users to remove CONFIG_MIPS32_O32=y in defconfig when build
> kernel with Clang.
> 
> [1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
> [2] https://bugs.llvm.org/show_bug.cgi?id=38063
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index 0e79f81..cacf9dd 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -35,6 +35,9 @@ CONFIG_NUMA=y
>  CONFIG_SMP=y
>  CONFIG_HZ_256=y
>  CONFIG_KEXEC=y
> +# Please remove CONFIG_MIPS32_O32=y when build with Clang
> +# due to "ABI 'o32' is not supported on CPU 'mips64r2'",
> +# https://bugs.llvm.org/show_bug.cgi?id=38063
>  CONFIG_MIPS32_O32=y
>  CONFIG_MIPS32_N32=y
>  CONFIG_VIRTUALIZATION=y
> -- 
> 2.1.0
> 

I think this might be a better solution. I know that I personally never
read defconfig files if a build fails.

If CONFIG_MIPS32_O32 is broken with clang and the MIPS backend
maintainer has said that it will not be supported due to lack of
resources, then the config should not even be selectable in my opinion.

Cheers,
Nathan

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..ed35318a759d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3315,6 +3315,8 @@ config SYSVIPC_COMPAT
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
 	depends on 64BIT
+	# https://bugs.llvm.org/show_bug.cgi?id=38063
+	depends on $(success,$(CC) $(CLANG_FLAGS) -march=mips64 -o32 -c -x c /dev/null -o /dev/null)
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
