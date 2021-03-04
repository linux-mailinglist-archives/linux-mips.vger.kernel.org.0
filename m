Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB2432CD26
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 07:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbhCDGq4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 01:46:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235720AbhCDGqh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 01:46:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14DB764F07;
        Thu,  4 Mar 2021 06:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614840357;
        bh=Xo7k97276NMtjJzpn3yMOv0/arfH5GEYmdV9H5zfdqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AZZ89bHkTUtKyxN55fkmVqdZWIMPR/teInYbk2epCyQoQ12eUNhFFBmBf/rarESi+
         svfsPVPBP2ek/KGNwpTsdmEMwyV40OKYOvA1o2H+kSkg244xN1RinB3CsOu28TWqGD
         6sfWoS7g58+M8CvYqiBUDHTkbVTxJsKRUQ7b+KBD6BGuoZb09I0ICiDous//gEVgEC
         kvPZkyB7qhj3Gy5PWVIEgG7i7syg6AH1tI9BU/ZM2wNEZDwgha5rHxyBJojdavrznG
         B1F2O2ocECXroMi/sC2OXYRMEN8h1oJz6SeSq3Djk8XolM8zEMbMqrhX45gbgf8n34
         ULu6EVmBsrLyA==
Date:   Wed, 3 Mar 2021 23:45:52 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Make MIPS32_O32 depends on !CC_IS_CLANG
Message-ID: <20210304064552.xzjqbhltghmd5vfa@archlinux-ax161>
References: <1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 02:19:38PM +0800, Tiezhu Yang wrote:
> When build kernel with Clang [1]:

Sorry I did not catch this in the first revision but I think this would
sound better as:

When building with Clang [1]:

I think the kernel part is obvious :) couple more comments about the
commit message inline.

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
> It is not a good idea to remove CONFIG_MIPS32_O32=y directly
> in defconfig due to GCC works well, as Nathan said, the config

in defconfig because GCC works, as...

> should not even be selectable when build kernel with Clang, so

                                     building with Clang

> just make MIPS32_O32 depends on !CC_IS_CLANG.
> 
> [1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
> [2] https://bugs.llvm.org/show_bug.cgi?id=38063
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

I don't know if Nick will have any comments but for me:

Acked-by: Nathan Chancellor <nathan@kernel.org>

I have added this patch and the LLVM bug to our issue tracker:

https://github.com/ClangBuiltLinux/linux/issues/884

> ---
>  arch/mips/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 3a38d27..f6ba59f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3318,6 +3318,8 @@ config SYSVIPC_COMPAT
>  config MIPS32_O32
>  	bool "Kernel support for o32 binaries"
>  	depends on 64BIT
> +	# https://bugs.llvm.org/show_bug.cgi?id=38063
> +	depends on !CC_IS_CLANG
>  	select ARCH_WANT_OLD_COMPAT_IPC
>  	select COMPAT
>  	select MIPS32_COMPAT
> -- 
> 2.1.0
> 
