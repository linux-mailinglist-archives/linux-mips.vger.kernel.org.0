Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654B82DADED
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 14:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgLONW5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 08:22:57 -0500
Received: from elvis.franken.de ([193.175.24.41]:42248 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgLONW5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 08:22:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kpAHO-0001tH-00; Tue, 15 Dec 2020 14:22:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DA36FC0386; Tue, 15 Dec 2020 14:21:23 +0100 (CET)
Date:   Tue, 15 Dec 2020 14:21:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson64: Give chance to build under
 !CONFIG_NUMA and !CONFIG_SMP
Message-ID: <20201215132123.GA9201@alpha.franken.de>
References: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 08:32:52PM +0800, Tiezhu Yang wrote:
> In the current code, we can not build under !CONFIG_NUMA and !CONFIG_SMP
> on the Loongson64 platform, it seems bad for the users who just want to
> use pure single core (not nosmp) to debug, so do the following things to
> give them a chance:
> 
> (1) Do not select NUMA and SMP for MACH_LOONGSON64 in Kconfig, make NUMA
> depends on SMP, and then just set them in the loongson3_defconfig.
> (2) Move szmem() from numa.c to init.c and add prom_init_memory() under
> !CONFIG_NUMA.
> (3) Clean up szmem() due to the statements of case SYSTEM_RAM_LOW and
> SYSTEM_RAM_HIGH are the same.
> (4) Remove the useless declaration of prom_init_memory() and add the
> declaration of szmem() in loongson.h to avoid build error.
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/Kconfig                                |  3 +-
>  arch/mips/configs/loongson3_defconfig            |  2 +
>  arch/mips/include/asm/mach-loongson64/loongson.h |  2 +-
>  arch/mips/loongson64/init.c                      | 49 ++++++++++++++++++++++
>  arch/mips/loongson64/numa.c                      | 52 +-----------------------
>  5 files changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 44a47ad..2034c66 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -490,8 +490,6 @@ config MACH_LOONGSON64
>  	select SYS_SUPPORTS_ZBOOT
>  	select SYS_SUPPORTS_RELOCATABLE
>  	select ZONE_DMA32
> -	select NUMA
> -	select SMP
>  	select COMMON_CLK
>  	select USE_OF
>  	select BUILTIN_DTB
> @@ -2755,6 +2753,7 @@ config ARCH_SPARSEMEM_ENABLE
>  config NUMA
>  	bool "NUMA Support"
>  	depends on SYS_SUPPORTS_NUMA
> +	depends on SMP

can you solve your problem without this hunk ? I don't want to make NUMA
depeding on SMP. NUMA just selects memory archtitecture.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
