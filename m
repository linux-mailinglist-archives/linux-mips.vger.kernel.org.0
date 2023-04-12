Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D846DF74A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Apr 2023 15:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjDLNeX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Apr 2023 09:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjDLNeR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Apr 2023 09:34:17 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B25993F4
        for <linux-mips@vger.kernel.org>; Wed, 12 Apr 2023 06:33:38 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pmabN-0000FF-01; Wed, 12 Apr 2023 15:33:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4D641C2458; Wed, 12 Apr 2023 15:31:13 +0200 (CEST)
Date:   Wed, 12 Apr 2023 15:31:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: Set better default CPU model and kernel code model
Message-ID: <20230412133113.GB11717@alpha.franken.de>
References: <20230408115936.6631-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408115936.6631-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 08, 2023 at 12:59:36PM +0100, Jiaxun Yang wrote:
> Set default CPU model to Release 2 CPUs (MIPS64R2 if 64 bit CPU
> is present, otherwise MIPS32R2) to get better feature coverage
> on various default configs.
> 
> Also set default kernel code model to 64 bit since nowadays it
> doesn't make much sense to run 32 bit kernel on a 64 bit system.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ecc7a755fae6..1d681dd87bb0 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1260,6 +1260,8 @@ menu "CPU selection"
>  
>  choice
>  	prompt "CPU type"
> +	default CPU_MIPS64_R2 if SYS_HAS_CPU_MIPS64_R2
> +	default CPU_MIPS32_R2 if SYS_HAS_CPU_MIPS32_R2
>  	default CPU_R4X00

I don't think this makes things better. For systems with multiple
possible CPU choices it's quite easy to get a kernel compiled for
the wrong ISA.

>  
>  config CPU_LOONGSON64
> @@ -2007,6 +2009,7 @@ menu "Kernel type"
>  
>  choice
>  	prompt "Kernel code model"
> +	default 64BIT

I don't buy your "nowadays" argument. My SGI Indy still has 64Bit CPUs
and has not much reason to run a 64bit kernel.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
