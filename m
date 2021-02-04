Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7833230EAE8
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhBDD3d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhBDD3c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Feb 2021 22:29:32 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CF4C061573;
        Wed,  3 Feb 2021 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=2Z1L1lBHWn8RjrwH0fpbUA9WMSzabTqzCvsxNe9A4lg=; b=bSKAdF84yO4gtbkAixvOHa8YHc
        pyn9YXYDBoj4qJ89NVSW58oemcwutVVd+VnDPnAiWP9yVAXDaN6Bx9PPrvNqoYEKiFqVGUKPRjJ6P
        TXKlgeFQG23R+M/77n+IV3TbPejYulAMU7OOJNsQ9VAJlXTZ1fsyeR/HZi0lvyB2ul9EyM6hTmnzw
        nlAyesJEYwsB01HcCjXJB8KRbdwtoDnXaqS+LuqG0a60JFSo1ywAh9o9XEedlJzkf6rA21PV83VYp
        w569eyciHwoyQQHugsyTLaysuuWDMpMWqljyOg7RGHgo820usF+74gWL+r/xJR2XEI8dbkNJzSO+F
        lWg5Eh2w==;
Received: from [2601:1c0:6280:3f0::aec2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7VK1-0006jC-My; Thu, 04 Feb 2021 03:28:47 +0000
Subject: Re: [PATCH] MIPS: Use common way to parse elfcorehdr
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1612408033-5446-1-git-send-email-hejinyang@loongson.cn>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <57e74a56-abc1-dbc0-1277-5effb0e4e4c6@infradead.org>
Date:   Wed, 3 Feb 2021 19:28:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1612408033-5446-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/3/21 7:07 PM, Jinyang He wrote:
> "elfcorehdr" can be parsed at kernel/crash_dump.c
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>

Hm, looks like that would require CONFIG_CRASH_DUMP?


> ---
>  arch/mips/kernel/setup.c | 49 +++++++++++++++++++++---------------------------
>  1 file changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 7e1f8e2..4d2f915 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -29,6 +29,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/dmi.h>
> +#include <linux/crash_dump.h>
>  
>  #include <asm/addrspace.h>
>  #include <asm/bootinfo.h>
> @@ -404,34 +405,32 @@ static int __init early_parse_memmap(char *p)
>  }
>  early_param("memmap", early_parse_memmap);
>  
> -#ifdef CONFIG_PROC_VMCORE
> -static unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
> -static int __init early_parse_elfcorehdr(char *p)
> +static void __init mips_reserve_vmcore(void)
>  {
> +#ifdef CONFIG_PROC_VMCORE
>  	phys_addr_t start, end;
>  	u64 i;
>  
> -	setup_elfcorehdr = memparse(p, &p);
> -
> -	for_each_mem_range(i, &start, &end) {
> -		if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
> -			/*
> -			 * Reserve from the elf core header to the end of
> -			 * the memory segment, that should all be kdump
> -			 * reserved memory.
> -			 */
> -			setup_elfcorehdr_size = end - setup_elfcorehdr;
> -			break;
> +	if (!elfcorehdr_size) {
> +		for_each_mem_range(i, &start, &end) {
> +			if (elfcorehdr_addr >= start && elfcorehdr_addr < end) {
> +				/*
> +				 * Reserve from the elf core header to the end of
> +				 * the memory segment, that should all be kdump
> +				 * reserved memory.
> +				 */
> +				elfcorehdr_size = end - elfcorehdr_addr;
> +				break;
> +			}
>  		}
>  	}
> -	/*
> -	 * If we don't find it in the memory map, then we shouldn't
> -	 * have to worry about it, as the new kernel won't use it.
> -	 */
> -	return 0;
> -}
> -early_param("elfcorehdr", early_parse_elfcorehdr);
> +
> +	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
> +		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
> +
> +	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  #endif
> +}
>  
>  #ifdef CONFIG_KEXEC
>  
> @@ -653,13 +652,7 @@ static void __init arch_mem_init(char **cmdline_p)
>  	 */
>  	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>  
> -#ifdef CONFIG_PROC_VMCORE
> -	if (setup_elfcorehdr && setup_elfcorehdr_size) {
> -		printk(KERN_INFO "kdump reserved memory at %lx-%lx\n",
> -		       setup_elfcorehdr, setup_elfcorehdr_size);
> -		memblock_reserve(setup_elfcorehdr, setup_elfcorehdr_size);
> -	}
> -#endif
> +	mips_reserve_vmcore();
>  
>  	mips_parse_crashkernel();
>  #ifdef CONFIG_KEXEC
> 


-- 
~Randy

