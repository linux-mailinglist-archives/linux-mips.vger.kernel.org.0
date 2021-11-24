Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A720945C99E
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 17:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241888AbhKXQQ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 11:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhKXQQ0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 11:16:26 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FFCC061574;
        Wed, 24 Nov 2021 08:13:16 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id f20so3102393qtb.4;
        Wed, 24 Nov 2021 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EdnE85lbGOd7P/DF+DGys9IAToiAQL44gKSR64iso4Y=;
        b=eRVgasqq2qg2u8AT0Dc69pDAg8yAvBns950peG4dWQOy/gtFReDGPCzTgzr7afaAD1
         kT7GGFP/m/VPNZJO6zVbOi/SwlhySm4rvrbb1HHWKqaOHlpkQv2CdHA8RNYyt1I4piMD
         NOr9LCNlkvGc15GjDy5wvyrAKqVBLB5qX8ySAgaU9Xhex0+vIOlF9n6wJZUTTnm5HAsH
         lnch024tYhVLw0mCjqkP+2OaUEsFBucjKd/X1yNqCUcd5Fiq/03/t2CMTUS1lcp//V1L
         RFSepxsMu81xnGHPI4rT4FS2FYqongI2jVPVpxddzcYfe7JagYwFiMVH8suMDkrYnULx
         BIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EdnE85lbGOd7P/DF+DGys9IAToiAQL44gKSR64iso4Y=;
        b=mUeBcHIHQM1ICOGRgh3LrEWAGmeKizGVXq69oymMRQiRWJoA6s8R5fvuVWiZOPNXsU
         9FnNFNW7AsSFdt/B1fzorRoVBH/x9eA71hb465kaLCRyf8GuKgcbcirc5CCa5CG9BRmf
         GEGIE7Ay4eqahV8CgvnU29VyQuzyIIFoUt+7zYioQbq5hW5Za6UX/SigIFTENAs+F6BR
         o1Z47nw6pvMRDz8RlQzCcBGUO87F55IXBt4McuYVXznXPgkstiyvUpLtBZNYpQxSLbds
         wtGHmwuwC5vgKbU6Tp4jxhJimyGxRwAHXKpKHT5IS93lzNCk/WDvOM5fwlXSVHgg/xYA
         gQJA==
X-Gm-Message-State: AOAM532GUlRvRNmwhk2vEmZa4EkgZa50Kz/s0myNTWMy7iTqbJCJJOcY
        kW5nKwAEc/93Snh8BEURwWY=
X-Google-Smtp-Source: ABdhPJyGIueVv654Zex4VnED272Dkw9+w6IgVRNuB9h3je6d/KFCSmTilvBZT1+y0D5oqfGozC4TaQ==
X-Received: by 2002:ac8:20a:: with SMTP id k10mr8823562qtg.280.1637770395512;
        Wed, 24 Nov 2021 08:13:15 -0800 (PST)
Received: from [192.168.1.140] ([65.35.200.237])
        by smtp.gmail.com with ESMTPSA id v2sm79124qkp.72.2021.11.24.08.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:13:15 -0800 (PST)
Subject: Re: [PATCH 1/3] of/fdt: Rework early_init_dt_scan_chosen() to call
 directly
To:     Rob Herring <robh@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        John Crispin <john@phrozen.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20211118181213.1433346-1-robh@kernel.org>
 <20211118181213.1433346-2-robh@kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <8de94c58-ff4c-c896-13d1-016914042068@gmail.com>
Date:   Wed, 24 Nov 2021 11:13:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118181213.1433346-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/18/21 1:12 PM, Rob Herring wrote:
> Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> as libfdt provides a nicer set of APIs. Rework
> early_init_dt_scan_chosen() to be called directly and use libfdt.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/prom.c           |  2 +-
>  arch/powerpc/mm/nohash/kaslr_booke.c |  4 +--
>  drivers/of/fdt.c                     | 39 ++++++++++++++--------------
>  include/linux/of_fdt.h               |  3 +--
>  4 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 2e67588f6f6e..c6c398ccd98a 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -402,7 +402,7 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
>  	const unsigned long *lprop; /* All these set by kernel, so no need to convert endian */
>  
>  	/* Use common scan routine to determine if this is the chosen node */
> -	if (early_init_dt_scan_chosen(node, uname, depth, data) == 0)
> +	if (early_init_dt_scan_chosen(data) < 0)
>  		return 0;
>  
>  #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 8fc49b1b4a91..90debe19ab4c 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -44,9 +44,7 @@ struct regions __initdata regions;
>  
>  static __init void kaslr_get_cmdline(void *fdt)
>  {
> -	int node = fdt_path_offset(fdt, "/chosen");
> -
> -	early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
> +	early_init_dt_scan_chosen(boot_command_line);
>  }
>  
>  static unsigned long __init rotate_xor(unsigned long hash, const void *area,
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index bdca35284ceb..1f1705f76263 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1124,18 +1124,18 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>  	return 0;
>  }
>  
> -int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> -				     int depth, void *data)
> +int __init early_init_dt_scan_chosen(char *cmdline)
>  {
> -	int l;
> +	int l, node;
>  	const char *p;
>  	const void *rng_seed;
> +	const void *fdt = initial_boot_params;
>  
> -	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
> -
> -	if (depth != 1 || !data ||
> -	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
> -		return 0;
> +	node = fdt_path_offset(fdt, "/chosen");
> +	if (node < 0)
> +		node = fdt_path_offset(fdt, "/chosen@0");
> +	if (node < 0)
> +		return -ENOENT;
>  
>  	early_init_dt_check_for_initrd(node);
>  	early_init_dt_check_for_elfcorehdr(node);
> @@ -1144,7 +1144,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	/* Retrieve command line */
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0)
> -		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
> +		strlcpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
>  
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> @@ -1153,18 +1153,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	 */
>  #ifdef CONFIG_CMDLINE
>  #if defined(CONFIG_CMDLINE_EXTEND)
> -	strlcat(data, " ", COMMAND_LINE_SIZE);
> -	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	strlcat(cmdline, " ", COMMAND_LINE_SIZE);
> +	strlcat(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #elif defined(CONFIG_CMDLINE_FORCE)
> -	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #else
>  	/* No arguments from boot loader, use kernel's  cmdl*/
> -	if (!((char *)data)[0])
> -		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	if (!((char *)cmdline)[0])
> +		strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #endif
>  #endif /* CONFIG_CMDLINE */
>  
> -	pr_debug("Command line is: %s\n", (char *)data);
> +	pr_debug("Command line is: %s\n", (char *)cmdline);
>  
>  	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
>  	if (rng_seed && l > 0) {
> @@ -1178,8 +1178,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  				fdt_totalsize(initial_boot_params));
>  	}
>  
> -	/* break now */
> -	return 1;
> +	return 0;
>  }
>  
>  #ifndef MIN_MEMBLOCK_ADDR
> @@ -1261,14 +1260,14 @@ bool __init early_init_dt_verify(void *params)
>  
>  void __init early_init_dt_scan_nodes(void)
>  {
> -	int rc = 0;
> +	int rc;
>  
>  	/* Initialize {size,address}-cells info */
>  	of_scan_flat_dt(early_init_dt_scan_root, NULL);
>  
>  	/* Retrieve various information from the /chosen node */
> -	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> -	if (!rc)
> +	rc = early_init_dt_scan_chosen(boot_command_line);
> +	if (rc)
>  		pr_warn("No chosen node found, continuing without\n");
>  
>  	/* Setup memory, calling early_init_dt_add_memory_arch */
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index cf48983d3c86..654722235df6 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -58,8 +58,7 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
>  extern unsigned long of_get_flat_dt_root(void);
>  extern uint32_t of_get_flat_dt_phandle(unsigned long node);
>  
> -extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
> -				     int depth, void *data);
> +extern int early_init_dt_scan_chosen(char *cmdline);
>  extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
>  				     int depth, void *data);
>  extern int early_init_dt_scan_chosen_stdout(void);
> 

patch 1/3

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

