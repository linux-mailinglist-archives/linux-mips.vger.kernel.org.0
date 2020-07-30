Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4545D2331D1
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 14:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgG3MPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 08:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgG3MPX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 08:15:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54853C061794;
        Thu, 30 Jul 2020 05:15:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHTrL6Fgfz9sRN;
        Thu, 30 Jul 2020 22:15:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1596111321;
        bh=YNSVJAmG6iTLprr4AXeykiRRbuPWau8/ePuc4CoRMGM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dDG2HeGveH8jvsO0a3nV+Tp8BcGIZDu65BOPDvIIBo9wVTyiHzeoVy9VEea0rigvp
         Y31hCYMQ/HUQJyt9f4Ns+ZWd4J0yauoOrKc1q24QkaP65G5RtKXvj8BnxizCtGPCIs
         4Qc5Gy9BbRkYcfHS9FaL2IesmCw9kHwdS0i+jJ5INj6RLnsR8z4hMy+N03Q+rveLd0
         2v5hfX/mFHnRdxjBR0pUmOS4LXqz54J4KK7TRfoGZVmsUzhhMnBhUvMn3FR8lvfRl/
         Ax9t5/4az9jOznaLXvwqANu/Zl8pK6CgRrdLYmMHTgYkBan25IQFsKLy25EXJBUiYn
         TCPH/khAUMFFQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org,
        Hari Bathini <hbathini@in.ibm.com>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify fadump_reserve_crash_area()
In-Reply-To: <20200728051153.1590-7-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org> <20200728051153.1590-7-rppt@kernel.org>
Date:   Thu, 30 Jul 2020 22:15:13 +1000
Message-ID: <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mike Rapoport <rppt@kernel.org> writes:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> fadump_reserve_crash_area() reserves memory from a specified base address
> till the end of the RAM.
>
> Replace iteration through the memblock.memory with a single call to
> memblock_reserve() with appropriate  that will take care of proper memory
                                     ^
                                     parameters?
> reservation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

I think this looks OK to me, but I don't have a setup to test it easily.
I've added Hari to Cc who might be able to.

But I'll give you an ack in the hope that it works :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 78ab9a6ee6ac..2446a61e3c25 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
>  /* Preserve everything above the base address */
>  static void __init fadump_reserve_crash_area(u64 base)
>  {
> -	struct memblock_region *reg;
> -	u64 mstart, msize;
> -
> -	for_each_memblock(memory, reg) {
> -		mstart = reg->base;
> -		msize  = reg->size;
> -
> -		if ((mstart + msize) < base)
> -			continue;
> -
> -		if (mstart < base) {
> -			msize -= (base - mstart);
> -			mstart = base;
> -		}
> -
> -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
> -			(msize >> 20), mstart);
> -		memblock_reserve(mstart, msize);
> -	}
> +	memblock_reserve(base, memblock_end_of_DRAM() - base);
>  }
>  
>  unsigned long __init arch_reserved_kernel_pages(void)
> -- 
> 2.26.2
