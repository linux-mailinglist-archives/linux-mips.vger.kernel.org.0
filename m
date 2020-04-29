Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6961BE647
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 20:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgD2SdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 14:33:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:60637 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2SdU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 14:33:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTrWH-000430-03; Wed, 29 Apr 2020 20:33:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D3A39C034E; Wed, 29 Apr 2020 20:33:05 +0200 (CEST)
Date:   Wed, 29 Apr 2020 20:33:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, chenj <chenj@lemote.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200429183305.GB21234@alpha.franken.de>
References: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 05:38:40PM +0800, Huacai Chen wrote:
> From: chenj <chenj@lemote.com>
> 
> Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
> mode by default. However, gslq/gssq (16-bytes load/store instructions)
> overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
> gssq for optimization in kernel, we should enable COP2 usage in kernel.

What aboout context switches ? Or is the copro only used by one kernel
driver ?

> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index ce40fbf..0f71540 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -386,6 +386,7 @@
>  #define ST0_CU1			0x20000000
>  #define ST0_CU2			0x40000000
>  #define ST0_CU3			0x80000000
> +#define ST0_MM			0x40000000	/* Loongson-3 naming */

please use ST0_CU2, so everybody understands it's COO2

> @@ -450,7 +450,11 @@
>   */
>  		.macro	CLI
>  		mfc0	t0, CP0_STATUS
> +#ifdef CONFIG_CPU_LOONGSON64
> +		li	t1, ST0_CU0 | ST0_MM | STATMASK
> +#else
>  		li	t1, ST0_CU0 | STATMASK
> +#endif

you are doing this three time in this file. How about doing

#ifdef CONFIG_CPU_LOONGSON64
#define ST0_MASK	ST0_CU0 | ST0_CU2
#else
#define ST0_MASK	ST0_CU0
#endif

and use ST0_MASK ?

> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index 3b02ffe..cdac82d 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -45,18 +45,34 @@
>  
>  	.macro	setup_c0_status_pri
>  #ifdef CONFIG_64BIT
> +#ifdef CONFIG_CPU_LOONGSON64
> +	setup_c0_status ST0_KX|ST0_MM 0
> +#else
>  	setup_c0_status ST0_KX 0
> +#endif

same thing here.

> --- a/arch/mips/kernel/r4k_switch.S
> +++ b/arch/mips/kernel/r4k_switch.S
> @@ -53,6 +53,9 @@
>  	nor	a3, $0, a3
>  	and	a2, a3
>  	or	a2, t1
> +#ifdef CONFIG_CPU_LOONGSON64
> +	or	a2, ST0_MM
> +#endif

this looks wrong. If THERAD_STATUS is setup correct, you don't need
to mess with ST0_CU2 here.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
