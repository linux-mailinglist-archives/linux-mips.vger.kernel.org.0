Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1BA44B063
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhKIPeN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:34:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:39251 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239098AbhKIPeN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 10:34:13 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkT5p-00033f-02; Tue, 09 Nov 2021 16:31:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 251A8C2C38; Tue,  9 Nov 2021 16:29:54 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:29:54 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH v2] mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL
 is set
Message-ID: <20211109152954.GC12535@alpha.franken.de>
References: <20211106154911.26222-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211106154911.26222-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Nov 06, 2021 at 08:49:11AM -0700, Randy Dunlap wrote:
> Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
> but kconfig symbol BCM63XX does not provide that info. This leads
> to many build errors, e.g.:
> 
>    arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
>            return x - PAGE_OFFSET + PHYS_OFFSET;
>    arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>    #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>    arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
>            return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
>    arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>    #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
> 
> arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
>            return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
> 
> 
> Selecting the SYS_HAS_CPU_BMIPS* symbols causes SYS_HAS_CPU_BMIPS to be
> set, which then selects CPU_SUPPORT_32BIT_KERNEL, which causes
> CONFIG_32BIT to be set. (a bit more indirect than v1 [RFC].)
> 
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-mips@vger.kernel.org
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Maxime Bizon <mbizon@freebox.fr>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> v2: select 3 SYS_HAS_CPU_BMIPS* symbols that will cause
>     CPU_SUPPORTS_32BIT_KERNEL to be set (Florian)
> 
>  arch/mips/Kconfig |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- linux-next-20211105.orig/arch/mips/Kconfig
> +++ linux-next-20211105/arch/mips/Kconfig
> @@ -332,6 +332,9 @@ config BCM63XX
>  	select SYS_SUPPORTS_32BIT_KERNEL
>  	select SYS_SUPPORTS_BIG_ENDIAN
>  	select SYS_HAS_EARLY_PRINTK
> +	select SYS_HAS_CPU_BMIPS32_3300
> +	select SYS_HAS_CPU_BMIPS4350
> +	select SYS_HAS_CPU_BMIPS4380
>  	select SWAP_IO_SPACE
>  	select GPIOLIB
>  	select MIPS_L1_CACHE_SHIFT_4

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
