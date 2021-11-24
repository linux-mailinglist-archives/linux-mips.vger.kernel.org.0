Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC645C9C5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 17:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbhKXQXj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 11:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240415AbhKXQXi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 11:23:38 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DB4C061574;
        Wed, 24 Nov 2021 08:20:28 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id a2so3100028qtx.11;
        Wed, 24 Nov 2021 08:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dKSHcD2L7MEpKjgBx687tkeDg+zn24Hg4tSJQGNG32g=;
        b=fwKIDI2Kl+1QpA9/1afom/fGaUxF0aCa6ADGmjUT6fMJ4H+PC8WyVE/Bz3wEtNuzFC
         UpRMd/sQZ+EK7pOFDrXehxxQ/vZviU12FwQe+WxntBKGFZWse4Dc0kWM4xt+nkAfAYPV
         A/xoDLI7PGkxQuE2Vym4jzCw/lPWul4TkvOqXaFLbYvnvGS1aLyUokpqW35l2qt/yWIn
         0AOZRJxHJLVfAy2nY+n/TzBE9H2SMThMJkvXQ8x4jHZ4cWqQv+02LI8IOHXVQ4wIBwn5
         OQHC+CX7xgcB+zDdrAbNTMd/59M9EE3yTqwgz9NRVoS8jSHBdguTxZAl9JKhyDz6v11G
         QvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dKSHcD2L7MEpKjgBx687tkeDg+zn24Hg4tSJQGNG32g=;
        b=WGm9+6n4/zFiTDe7Uf9mfzPiupORvGK21jvTHOncVVCUtfCfnclRQe29zl0ejxW78f
         hV8f6U9bXi/DwVbbICDAr0iZjNUVvjKahNcoxO06zuTQ0Uf9vcfwgTQzmq4X6TbVPuqo
         S6n4depKms8JssqOnjW1xAPEg2OKpTanWccIi2E6XeEIkfdl5no8lM72wwxeENkBV2DR
         t6eXgCZeuSasj5vEZg9jBDkxz7Lzs4XkM6XjT/UXUW0PWd5WdrTKXXJ1NrXQcIAGYkZa
         3BK1fFXF6/PKf0conq2Hi2l1TBN665hGT/0n2hi/5UeVy3ZsPrnWkverRWrEjb+9la6M
         GLzg==
X-Gm-Message-State: AOAM5316+7NgwrfOEUDg8k0FxVuGhSFsXvPKUswhpN6wkgFQkhLjS+ZG
        DX4AXgLqptj4HQM6ioowoZk=
X-Google-Smtp-Source: ABdhPJxR53g3ek4r/8Dto6m4CgA9TyEXSP+yOeqxlgmWy3LvWS0UWGQJzLkxpaLPJixl3iWzsyygqQ==
X-Received: by 2002:ac8:5e12:: with SMTP id h18mr8718523qtx.143.1637770827734;
        Wed, 24 Nov 2021 08:20:27 -0800 (PST)
Received: from [192.168.1.140] ([65.35.200.237])
        by smtp.gmail.com with ESMTPSA id g123sm71088qkf.108.2021.11.24.08.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:20:27 -0800 (PST)
Subject: Re: [PATCH 2/3] of/fdt: Rework early_init_dt_scan_root() to call
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
 <20211118181213.1433346-3-robh@kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <13f402bb-933d-a5e0-4f45-24e5f5b3b1f1@gmail.com>
Date:   Wed, 24 Nov 2021 11:20:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118181213.1433346-3-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/18/21 1:12 PM, Rob Herring wrote:
> Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> as libfdt provides a nicer set of APIs. Rework early_init_dt_scan_root()
> to be called directly and use libfdt.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/prom.c |  4 ++--
>  drivers/of/fdt.c           | 14 +++++++-------
>  include/linux/of_fdt.h     |  3 +--
>  3 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index c6c398ccd98a..6e1a106f02eb 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -748,7 +748,7 @@ void __init early_init_devtree(void *params)
>  	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
>  
>  	/* Scan memory nodes and rebuild MEMBLOCKs */
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
>  
>  	parse_early_param();
> @@ -857,7 +857,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
>  	 * mess the memblock.
>  	 */
>  	add_mem_to_memblock = 0;
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
>  	add_mem_to_memblock = 1;
>  
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 1f1705f76263..5e216555fe4f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1042,13 +1042,14 @@ int __init early_init_dt_scan_chosen_stdout(void)
>  /*
>   * early_init_dt_scan_root - fetch the top level address and size cells
>   */
> -int __init early_init_dt_scan_root(unsigned long node, const char *uname,
> -				   int depth, void *data)
> +int __init early_init_dt_scan_root(void)
>  {
>  	const __be32 *prop;
> +	const void *fdt = initial_boot_params;
> +	int node = fdt_path_offset(fdt, "/");
>  
> -	if (depth != 0)
> -		return 0;
> +	if (node < 0)
> +		return -ENODEV;
>  
>  	dt_root_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
>  	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
> @@ -1063,8 +1064,7 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
>  		dt_root_addr_cells = be32_to_cpup(prop);
>  	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
>  
> -	/* break now */
> -	return 1;
> +	return 0;
>  }
>  
>  u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
> @@ -1263,7 +1263,7 @@ void __init early_init_dt_scan_nodes(void)
>  	int rc;
>  
>  	/* Initialize {size,address}-cells info */
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  
>  	/* Retrieve various information from the /chosen node */
>  	rc = early_init_dt_scan_chosen(boot_command_line);
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 654722235df6..df3d31926c3c 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -68,8 +68,7 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
>  
>  /* Early flat tree scan hooks */
> -extern int early_init_dt_scan_root(unsigned long node, const char *uname,
> -				   int depth, void *data);
> +extern int early_init_dt_scan_root(void);
>  
>  extern bool early_init_dt_scan(void *params);
>  extern bool early_init_dt_verify(void *params);
> 

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
