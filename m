Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9BB32AF7B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237562AbhCCAYc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:24:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236028AbhCBILu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 03:11:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 315116146D;
        Tue,  2 Mar 2021 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614672569;
        bh=b7MRmgm5OlBAwHlkF3g3dXoVjRXEXsxIMOfK1akZc6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LeOStWJeirYyUSKXEVj1C91TXQyyc75dmOuQ+MqpKvL9FsqFUdgTDwc1ZJrMr4j0X
         +mNjdNVL0vI0a4Kpl4Z5vmsdixvN2SUnzRRTlaU4Fh+4GUTFh7cb7gmeN2j9YCRC8m
         cWqV23ljMqm3tnYs+ZM3LzIPFWtNZxu4DfdOzLx1cYJ+WiCGCfJyWMGFtmp1SLo+zN
         MUmafnfGuOgldn/WPPRsGCJ13XvNHyQMEom0RCEvLJ9DpzUFVcXKM8vxFSoNhWVeL/
         yRHjzCBB82l9t1sQCEoOcU8PrKlYb1h60hS0/EBacHb+1k6iXi0HfbzwEh8NrPkfaC
         cfuhc/uaWAljA==
Date:   Tue, 2 Mar 2021 10:09:20 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, fancer.lancer@gmail.com, guro@fb.com,
        akpm@linux-foundation.org, paul@crapouillou.net,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Message-ID: <YD3ysGd86zRjOLQa@kernel.org>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
 <20210302041940.3663823-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302041940.3663823-1-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 08:19:38PM -0800, Florian Fainelli wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception that is going to be installed and this needs to happen at
> plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
> finds a space that is suitable, away from reserved memory.
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.
> 
> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> Thomas,
> 
> This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
> by the stable team for 5.11. We should find a safer way to avoid these
> problems for 5.13 maybe.
> 
>  arch/mips/bmips/setup.c       | 22 ++++++++++++++++++++++
>  arch/mips/include/asm/traps.h |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 31bcfa4e08b9..0088bd45b892 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -149,6 +149,26 @@ void __init plat_time_init(void)
>  	mips_hpt_frequency = freq;
>  }
>  
> +static void __init bmips_ebase_reserve(void)
> +{
> +	phys_addr_t base, size = VECTORSPACING * 64;
> +
> +	switch (current_cpu_type()) {
> +	default:
> +	case CPU_BMIPS4350:
> +		return;
> +	case CPU_BMIPS3300:
> +	case CPU_BMIPS4380:
> +		base = 0x0400;
> +		break;
> +	case CPU_BMIPS5000:
> +		base = 0x1000;
> +		break;
> +	}
> +
> +	memblock_reserve(base, size);
> +}
> +
>  void __init plat_mem_setup(void)
>  {
>  	void *dtb;
> @@ -169,6 +189,8 @@ void __init plat_mem_setup(void)
>  
>  	__dt_setup_arch(dtb);
>  
> +	bmips_ebase_reserve();
> +
>  	for (q = bmips_quirk_list; q->quirk_fn; q++) {
>  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
>  					     q->compatible)) {
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6aa8f126a43d..0ba6bb7f9618 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -14,6 +14,8 @@
>  #define MIPS_BE_FIXUP	1		/* return to the fixup code */
>  #define MIPS_BE_FATAL	2		/* treat as an unrecoverable error */
>  
> +#define VECTORSPACING 0x100	/* for EI/VI mode */
> +
>  extern void (*board_be_init)(void);
>  extern int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
>  
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
