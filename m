Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C080B3ECE27
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 07:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbhHPFwy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 01:52:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231680AbhHPFwx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Aug 2021 01:52:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A884A600CC;
        Mon, 16 Aug 2021 05:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629093142;
        bh=A6XKGIIAGrCO5lr+EGtJFLRD0uO5DuHaL25253B/0cs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i0ZWxkzqk1lluWmumf696hHuneR81LxxFZwzuz6zcNGNz2uWu8eVpQgTKcpPmZqj5
         /AtGznPbKq0lL/ikkV7hit2eI87siYUwoTWUXOXgzNC3OF/WrX1BumfBDpGDVn6T1g
         xWoPeQNXsSH781LLNcBIR5zGByncT4MSL2m4vtR1Jztv2bFt1sqcGe7ddekuvryAMK
         fKTXmr7VAVwKt15KAiMkWixahE8wF4NRQrMqP4RZSclYSPUt6WzqU3jwjnnUXwMjlJ
         pUT7vbAI/rpzvVTmYGoaf4IvoxZtrMDqZNrmwda+Qn1L7e/cy6bmDqiTIfwRmIJ06i
         3XiqiOoVCj5Ng==
Date:   Mon, 16 Aug 2021 08:52:12 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header
 reservation
Message-ID: <YRn9DHlB/pdNPJyP@kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> occupied by an elf core header described in the device tree.
> As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> mips_reserve_vmcore(), the latter needs to check if the memory has
> already been reserved before.

Doing memblock_reserve() for the same region is usually fine, did you
encounter any issues without this patch?
 
> Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> systems use DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  arch/mips/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 23a140327a0bac1b..4693add05743d78b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
>  	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
>  		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
>  
> -	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> +	if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)
> +		memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  #endif
>  }
>  
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
