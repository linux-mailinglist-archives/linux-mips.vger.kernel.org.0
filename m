Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C316A5F8D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 20:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjB1TVe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 14:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB1TVd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 14:21:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE621A6
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 11:21:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54C50B80EAE
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 19:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A0CC433D2;
        Tue, 28 Feb 2023 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677612088;
        bh=AnyDWumO63p82Cz0HWt19Reja6C3cthiXrFT8hkr0po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WiSY5WGBOFRQ7KYFb1oyStbP47wEKgGJB2RUlyDzGHGYi88J9ISgDCyaKrKOGVfvG
         BncNWciA2CKQOXUE0tN8nvO4jw/NUfWFFGzaJ5tcVeEDCkyqFcAwQT+NKTPTUx9wbt
         gALsFhccpJcwP6dhEuir5R7ynK2rmZJBAsZMRaQDSlicCdf1eswEI+0zLXrKdSiQbk
         qm0k48kRFcTmHful7D9KVmRsIJT29yuQ5HRLNUW7XggLntF55ct9bwMNU+4hCDEwrv
         VeKbAxOI2B3+2FaGrDTJSML4L3BrWRqgMEu8M5hbYnx6je2WMWbmHMdhezzAB5CDE1
         jDvV2+7LYh1YQ==
Date:   Tue, 28 Feb 2023 12:21:25 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        llvm@lists.linux.dev, ndesaulniers@google.com
Subject: Re: [PATCH v2] MIPS: Workaround clang inline compat branch issue
Message-ID: <Y/5UNdcoOvJjG+fH@dev-arch.thelio-3990X>
References: <20230228111917.82910-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228111917.82910-1-jiaxun.yang@flygoat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 28, 2023 at 11:19:17AM +0000, Jiaxun Yang wrote:
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
> 
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
> 
> Fix boot on boston board.
> 
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for filing that bug and debugging this. I came across a post from
the (now former) MIPS code owner and I am not sure anyone else has
stepped up, the vast majority of commits to llvm/lib/Targets/Mips have
been either NFC commits or treewide refactorings, so it will be
interesting to see if we can get that fixed.

https://discourse.llvm.org/t/mips-backend-code-owner/60737
https://github.com/llvm/llvm-project/commit/7daed359111f6d151fef447f520f85ef1dabedf6

For now:

Acked-by: Nathan Chancellor <nathan@kernel.org>

If a v3 is necessary for some reason, a link to that issue in the source
itself would be useful, as we can easily grep for 'llvm/llvm-project' to
audit issues; I am not sure it is worth sending a v3 just for that alone
though.

> ---
> v2: Add Link tag to LLVM bug
> ---
>  arch/mips/Kconfig           | 3 +++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..adf2c5a0bdba 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3206,6 +3206,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
>  	def_bool y
>  	depends on $(cc-option,-mno-branch-likely)
>  
> +config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> +	def_bool y if CC_IS_CLANG
> +
>  menu "Power management options"
>  
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 336ac9b65235..2e99450f4228 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -336,7 +336,7 @@ symbol		=	value
>   */
>  #ifdef CONFIG_WAR_R10000_LLSC
>  # define SC_BEQZ	beqzl
> -#elif MIPS_ISA_REV >= 6
> +#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_REV >= 6
>  # define SC_BEQZ	beqzc
>  #else
>  # define SC_BEQZ	beqz
> -- 
> 2.37.1 (Apple Git-137.1)
> 
