Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E74FA4CAD
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbfIAXTe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:19:34 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35759 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfIAXTe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:19:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id n10so2040610wmj.0
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=csEwD3jzSLPPqVPJKGlvXJjWPttCQXRqDa8mtl9P60s=;
        b=NvNjIbrCoi49PEQTF471KUjXAqNwQYt25D7s3nwukVpAsJ28wJ7rZLwmX5s1ahBhNx
         409gZVdi3dE41rGWI5+X+iNGHFRYe4R4M9qSjIfesLur+JXvBlxvKMJS+HTut7FmH7HS
         P6kDJq4mAluW5SISzP5ZcsKF0vc8V8Obdmp9bcekUHsp7SisiONYqwpNq8pkGDvK96qx
         K5ormXUgwPnO+xxdlXerDBmAnxn0x5mbptMO/y9K/dtsNZWN+CVMI+uPIZQJNuD08tFQ
         9vmj35jxQf0ENBAqFx1zbZrCa0KlwBZE8N2hf+jOcVrz/WCf/VflGab4ssB6qVPz4ceq
         ccAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=csEwD3jzSLPPqVPJKGlvXJjWPttCQXRqDa8mtl9P60s=;
        b=SSm56DQbI4QLHd+ED5RJwY6X7pvwyITGRdFn0H0tPs7tbR+I1+JciAPUWILGdrvlsV
         10msVwPibrtBbnlytq7R7OUAjMMRUtY7Bnlv2m/o8mWnZw0UGcM/dKXord3A+AU4iGlf
         6EhNbB4VTUHZK6czuB3oJNf/NU4RGvpjIMhKUJ6CBMbx5jlPwo6YErde1itxgTHjKHEV
         N3MVoREgjkImxqsTMWQPUIRx5dkSRqOPYZ3Of15t5TlgLfTh4NVLiplkTk8iPVXrIcoh
         XYdfQMYZZSnYXJNgDhFy41G0qgUGwaL97Xxa9m6RaFrz5ChEOpgQor6qMo162S5Ln469
         GYiA==
X-Gm-Message-State: APjAAAWpWBYZfjHA5NaDvVY0dJhs9FjgpNnaeXehPZQdUsEhz5zAcDfJ
        iIM7i4NGZD2SFQyYgDvPW7mpEt7T
X-Google-Smtp-Source: APXvYqz1SNHvs0Dui7arxPPSmLGxNhTzSjHyyXyPSzwzNaMQR00BH5UTX26dR0jenIlNHsxD6EhDBg==
X-Received: by 2002:a1c:9d87:: with SMTP id g129mr16363459wme.160.1567379971210;
        Sun, 01 Sep 2019 16:19:31 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id u186sm34066860wmu.26.2019.09.01.16.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:19:30 -0700 (PDT)
Subject: Re: [PATCH 3/3] MIPS: tlbex: Remove cpu_has_local_ebase
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20190831154027.6943-1-paul.burton@mips.com>
 <20190831154027.6943-3-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9a58e8d4-73cf-9d18-8f67-04df5ad9ae91@amsat.org>
Date:   Mon, 2 Sep 2019 01:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190831154027.6943-3-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/31/19 5:40 PM, Paul Burton wrote:
> The cpu_has_local_ebase macro is, confusingly, not used to indicate
> whether the EBase register is local to a CPU or not. Instead it
> indicates whether we want to generate the TLB refill exception vector
> each time a CPU is brought online. Doing this makes little sense on any
> system, since we always use the same value for EBase & thus we cannot
> have different TLB refill exception handlers per CPU.
> 
> Regenerating the code is not only pointless but also can be actively
> harmful, as commit 8759934e2b6b ("MIPS: Build uasm-generated code only
> once to avoid CPU Hotplug problem") described. That commit introduced
> cpu_has_local_ebase to disable the handler regeneration for Loongson
> machines, but this is by no means a Loongson-specific problem.
> 
> Remove cpu_has_local_ebase & simply generate the TLB refill handler once
> during boot, just like the rest of the TLB exception handlers.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
> 
>  arch/mips/include/asm/cpu-features.h                     | 3 ---
>  arch/mips/include/asm/mach-dec/cpu-feature-overrides.h   | 1 -
>  .../include/asm/mach-loongson64/cpu-feature-overrides.h  | 1 -
>  arch/mips/mm/tlbex.c                                     | 9 ++-------
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 4e2bea8875f5..983a6a7f43a1 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -243,9 +243,6 @@
>  #ifndef cpu_has_pindexed_dcache
>  #define cpu_has_pindexed_dcache	(cpu_data[0].dcache.flags & MIPS_CACHE_PINDEX)
>  #endif
> -#ifndef cpu_has_local_ebase
> -#define cpu_has_local_ebase	1
> -#endif
>  
>  /*
>   * I-Cache snoops remote store.	 This only matters on SMP.  Some multiprocessors
> diff --git a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h b/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
> index 1c11310bc8ad..00beb69bfab9 100644
> --- a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
> +++ b/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
> @@ -32,7 +32,6 @@
>  #define cpu_has_vtag_icache		0
>  #define cpu_has_ic_fills_f_dc		0
>  #define cpu_has_pindexed_dcache		0
> -#define cpu_has_local_ebase		0
>  #define cpu_icache_snoops_remote_store	1
>  #define cpu_has_mips_4			0
>  #define cpu_has_mips_5			0
> diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> index 581915ce231c..4aca25f2ff06 100644
> --- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> +++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
> @@ -43,7 +43,6 @@
>  #define cpu_has_vint		0
>  #define cpu_has_vtag_icache	0
>  #define cpu_has_watch		1
> -#define cpu_has_local_ebase	0
>  
>  #ifdef CONFIG_CPU_LOONGSON3
>  #define cpu_has_wsbh		1
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 6e3ca9cc5249..e01cb33bfa1a 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -2609,12 +2609,9 @@ void build_tlb_refill_handler(void)
>  
>  	if (cpu_has_3kex) {
>  #ifndef CONFIG_MIPS_PGD_C0_CONTEXT
> -		if (cpu_has_local_ebase)
> -			build_r3000_tlb_refill_handler();
>  		if (!run_once) {
> -			if (!cpu_has_local_ebase)
> -				build_r3000_tlb_refill_handler();
>  			build_setup_pgd();
> +			build_r3000_tlb_refill_handler();
>  			build_r3000_tlb_load_handler();
>  			build_r3000_tlb_store_handler();
>  			build_r3000_tlb_modify_handler();
> @@ -2638,13 +2635,11 @@ void build_tlb_refill_handler(void)
>  		build_r4000_tlb_modify_handler();
>  		if (cpu_has_ldpte)
>  			build_loongson3_tlb_refill_handler();
> -		else if (!cpu_has_local_ebase)
> +		else
>  			build_r4000_tlb_refill_handler();
>  		flush_tlb_handlers();
>  		run_once++;
>  	}
> -	if (cpu_has_local_ebase)
> -		build_r4000_tlb_refill_handler();
>  	if (cpu_has_xpa)
>  		config_xpa_params();
>  	if (cpu_has_htw)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
