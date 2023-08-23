Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2D0785165
	for <lists+linux-mips@lfdr.de>; Wed, 23 Aug 2023 09:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjHWHWp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Aug 2023 03:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjHWHWp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Aug 2023 03:22:45 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89F53DB
        for <linux-mips@vger.kernel.org>; Wed, 23 Aug 2023 00:22:42 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qYiCO-00071Z-00; Wed, 23 Aug 2023 09:22:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 84B26C01A3; Wed, 23 Aug 2023 09:22:02 +0200 (CEST)
Date:   Wed, 23 Aug 2023 09:22:02 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: VDSO: Conditionally export __vdso_gettimeofday()
Message-ID: <ZOWzmgYvb/PCUXxJ@alpha.franken.de>
References: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816-mips-vdso-cond-export-__vdso_gettimeofday-v1-1-fe725254c782@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 16, 2023 at 02:59:23PM -0700, Nathan Chancellor wrote:
> ld.lld 16.0.0 and newer defaults to '--no-undefined-version', which
> causes the following error when CONFIG_MIPS_CLOCK_VSYSCALL is not set:
> 
>   ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_gettimeofday' failed: symbol not defined
> 
> Only export __vdso_gettimeofday() when it will be present in the final
> object file, which clears up the error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308170532.zxFFv25c-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/mips/vdso/vdso.lds.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index d90b65724d78..836465e3bcb8 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -94,7 +94,9 @@ VERSION
>  #ifndef CONFIG_MIPS_DISABLE_VDSO
>  	global:
>  		__vdso_clock_gettime;
> +#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
>  		__vdso_gettimeofday;
> +#endif
>  		__vdso_clock_getres;
>  #if _MIPS_SIM != _MIPS_SIM_ABI64
>  		__vdso_clock_gettime64;
> 
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-mips-vdso-cond-export-__vdso_gettimeofday-30ab92c716d4
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
