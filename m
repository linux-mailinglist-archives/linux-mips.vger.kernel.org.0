Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BD922202D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgGPKCO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:38169 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbgGPKB5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-03; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 400FFC080E; Thu, 16 Jul 2020 12:00:30 +0200 (CEST)
Date:   Thu, 16 Jul 2020 12:00:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 4/4] MIPS: Loongson64: Reserve legacy MMIO space
 according to bridge type
Message-ID: <20200716100030.GG8455@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-4-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594294424-26218-4-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 09, 2020 at 07:33:44PM +0800, Huacai Chen wrote:
> Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
> PCHs (bridge types) have different legacy MMIO space size. According to
> the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
> of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
> according to the bridge type.
> 
> Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
> LS7A bridge, so increase it to 0xfffff for LOONGSON64.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/io.h                     |  4 ++++
>  arch/mips/include/asm/mach-loongson64/spaces.h |  3 ---
>  arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 346fffd..7358372 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -51,7 +51,11 @@
>  
>  /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
>  
> +#ifndef CONFIG_CPU_LOONGSON64
>  #define IO_SPACE_LIMIT 0xffff
> +#else
> +#define IO_SPACE_LIMIT 0xfffff
> +#endif

can you please move this #define to mach-generic/spaces.h and
override it in mach-loongson64/spaces.h ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
