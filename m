Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E292DA3F0
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 00:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441295AbgLNXGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 18:06:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:45844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441285AbgLNXGJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 18:06:09 -0500
Date:   Mon, 14 Dec 2020 23:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607987128;
        bh=5TsguwUz8VJK8ed5bDwSWwfzf/cJOL0KfWWRDjoJhzQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=UAk4LB1gakF+U6GGpj55Ykx0xhrgf1wtLYgo9r9mFeGtMMIUlQosvriFGgdFwiXeC
         IMuICyeGuCBx+14A+DqLiEZQP22TONAInVWdM5n49DxlVWfXAhICFXY58y6wpVsqU9
         +/x+SeHiERi8NqQ18agSEF4pSFmSFlQy5i2Cz8iQpiYgJLYkvasjxZ+mgFNNEpahMT
         UGmUFefAp3QT9mdbW9QFW/LuG3NPWfVA0lyiu0fI/XKpBCjF35lh0ax0CdwhdD03kG
         djx8wy94NUek0W0az2sJTnimVI7JdePAliR5FelHiMnIvT+Qyj+PDJcZZDKH9ttMKk
         rirQyugEJC3JQ==
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] kbuild: LD_VERSION redenomination
Message-ID: <20201214230521.GA14124@willie-the-truck>
References: <20201212165431.150750-1-masahiroy@kernel.org>
 <20201212165431.150750-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212165431.150750-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 13, 2020 at 01:54:30AM +0900, Masahiro Yamada wrote:
> Commit ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion
> macros") introduced scripts/ld-version.sh for GCC LTO.
> 
> At that time, this script handled 5 version fields because GCC LTO
> needed the downstream binutils. (https://lkml.org/lkml/2014/4/8/272)
> 
> The code snippet from the submitted patch was as follows:
> 
>     # We need HJ Lu's Linux binutils because mainline binutils does not
>     # support mixing assembler and LTO code in the same ld -r object.
>     # XXX check if the gcc plugin ld is the expected one too
>     # XXX some Fedora binutils should also support it. How to check for that?
>     ifeq ($(call ld-ifversion,-ge,22710001,y),y)
>         ...
> 
> However, GCC LTO was not merged into the mainline after all.
> (https://lkml.org/lkml/2014/4/8/272)
> 
> So, the 4th and 5th fields were never used, and finally removed by
> commit 0d61ed17dd30 ("ld-version: Drop the 4th and 5th version
> components").
> 
> Since then, the last 4-digits returned by this script is always zeros.
> 
> Remove the meaningless last 4-digits. This makes the version format
> consistent with GCC_VERSION, CLANG_VERSION, LLD_VERSION.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm64/Kconfig            | 2 +-
>  arch/mips/loongson64/Platform | 2 +-
>  arch/mips/vdso/Kconfig        | 2 +-
>  arch/powerpc/Makefile         | 2 +-
>  arch/powerpc/lib/Makefile     | 2 +-
>  scripts/ld-version.sh         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a6b5b7ef40ae..69d56b21a6ec 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1499,7 +1499,7 @@ config ARM64_PTR_AUTH
>  	depends on (CC_HAS_SIGN_RETURN_ADDRESS || CC_HAS_BRANCH_PROT_PAC_RET) && AS_HAS_PAC
>  	# Modern compilers insert a .note.gnu.property section note for PAC
>  	# which is only understood by binutils starting with version 2.33.1.
> -	depends on LD_IS_LLD || LD_VERSION >= 233010000 || (CC_IS_GCC && GCC_VERSION < 90100)
> +	depends on LD_IS_LLD || LD_VERSION >= 23301 || (CC_IS_GCC && GCC_VERSION < 90100)
>  	depends on !CC_IS_CLANG || AS_HAS_CFI_NEGATE_RA_STATE
>  	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_REGS)
>  	help

Acked-by: Will Deacon <will@kernel.org>

Will
