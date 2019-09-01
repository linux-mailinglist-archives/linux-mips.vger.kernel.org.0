Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C924A4C81
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 00:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfIAWy5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 18:54:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33534 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbfIAWy5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 18:54:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so10606329wme.0
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 15:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J05UgdY0cLCSp9wziJH/Zahbm8UJeNta6NJvmN4O+q8=;
        b=QY7kDMza2LbKbAk8V1xt/1EU+ov7hnzgEen8DuPZNoQlItrmQaL9xsoUepl//vZh6q
         Yb7U0qpEtk9nCnP7Eyfvh94PPDvMoMGENQKQTdwDzp97BUCg4WAVMN3i7Tb5HoDPa8zG
         XXh50AbJJ5ZBWZQ6B/oFRX7jGjLj+IBk15eG0Jkrp8TGxjx1Cio+ZP40VEOUNj1SbIi4
         BG7xbR967flzAR1KgimrCnynWekUbQayWNO31YaQ03Q/6w/1U0j2ua8RMCtfg67Chomz
         6uZr51WxCDqB8a7hoOO3lEf/C1d+46gKwT2AgxbzMOKdnPRGkdr3bcIYMdr6p2WzYoZu
         fSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=J05UgdY0cLCSp9wziJH/Zahbm8UJeNta6NJvmN4O+q8=;
        b=EPujnyx+oGUJFYeu25lcmw7Tg2ZpoX61Mta/Pns9PnJP38iIJaXpPtUWsiKeo9EPnh
         TrD/h9B9+xdayVAXnwSPWzOsRsgFtAzdlGJLed+LaiYzdUVEvxP2SlBtA2heIDf8qfH6
         ojTg77E0ytVQGD0/FRpxV+7onvRVVlcZ10mLH697WcfrS3uMBPxycC9bDeK3BJ2+zPEn
         jAOl8WWTAvMdUViR1T3NsxkkGuQDAsSz2Fht717qUJH3EmZQeQ5oZdsNg9S2BTJDeOj4
         QNm498Iis5iNGSjIqAjADXMsOUj93NUygaS7gUrfdV4MD6lCBiqGUrvwq/y9wr5e4EAM
         ndRg==
X-Gm-Message-State: APjAAAX6SIHBudOOuTapjxLKHz8xAg3KeGisgW/BgxjGsre0XvpIFBC+
        n3IuEI5fVbGIGmRJ0TmkW99Yhd64
X-Google-Smtp-Source: APXvYqyUC650TRsYSov3OyvV3hjttG7kkDKctcIV7E8VI0UPLRQ4xefl72/h/b8Wed+JwvDpQXBWsw==
X-Received: by 2002:a1c:cf8c:: with SMTP id f134mr26301613wmg.174.1567378494817;
        Sun, 01 Sep 2019 15:54:54 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id a16sm4024554wmg.5.2019.09.01.15.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 15:54:53 -0700 (PDT)
Subject: Re: [PATCH 1/3] MIPS: Select R3k-style TLB in Kconfig
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20190831154027.6943-1-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0848cbcc-3a41-df54-db0c-25768f32420f@amsat.org>
Date:   Mon, 2 Sep 2019 00:54:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190831154027.6943-1-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/31/19 5:40 PM, Paul Burton wrote:
> Currently areas where we need to determine whether the TLB is R3k-style
> need to check for either of CONFIG_CPU_R3000 || CONFIG_CPU_TX39XX.
> 
> Introduce a new CONFIG_CPU_R3K_TLB & select it from both of the above,
> allowing us to simplify checks for R3k-style TLBs by only checking for
> this new Kconfig option.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
> 
>  arch/mips/Kconfig                    | 7 ++++++-
>  arch/mips/include/asm/pgtable-32.h   | 4 ++--
>  arch/mips/include/asm/pgtable-bits.h | 6 +++---
>  arch/mips/include/asm/pgtable.h      | 4 ++--
>  arch/mips/mm/Makefile                | 5 +++--
>  5 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 31c7044e34e6..3f18aa018a0c 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1575,6 +1575,7 @@ config CPU_R3000
>  	depends on SYS_HAS_CPU_R3000
>  	select CPU_HAS_WB
>  	select CPU_HAS_LOAD_STORE_LR
> +	select CPU_R3K_TLB
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_HIGHMEM
>  	help
> @@ -1590,6 +1591,7 @@ config CPU_TX39XX
>  	depends on SYS_HAS_CPU_TX39XX
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_HAS_LOAD_STORE_LR
> +	select CPU_R3K_TLB
>  
>  config CPU_VR41XX
>  	bool "R41xx"
> @@ -2280,6 +2282,9 @@ config CPU_R2300_FPU
>  	depends on MIPS_FP_SUPPORT
>  	default y if CPU_R3000 || CPU_TX39XX
>  
> +config CPU_R3K_TLB
> +	bool
> +
>  config CPU_R4K_FPU
>  	bool
>  	depends on MIPS_FP_SUPPORT
> @@ -2287,7 +2292,7 @@ config CPU_R4K_FPU
>  
>  config CPU_R4K_CACHE_TLB
>  	bool
> -	default y if !(CPU_R3000 || CPU_SB1 || CPU_TX39XX || CPU_CAVIUM_OCTEON)
> +	default y if !(CPU_R3K_TLB || CPU_SB1 || CPU_CAVIUM_OCTEON)
>  
>  config MIPS_MT_SMP
>  	bool "MIPS MT SMP support (1 TC on each available VPE)"
> diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
> index e600570789f4..ba967148b016 100644
> --- a/arch/mips/include/asm/pgtable-32.h
> +++ b/arch/mips/include/asm/pgtable-32.h
> @@ -221,7 +221,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
>  	((pte_t *)page_address(pmd_page(*(dir))) + __pte_offset(address))
>  #define pte_unmap(pte) ((void)(pte))
>  
> -#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> +#if defined(CONFIG_CPU_R3K_TLB)
>  
>  /* Swap entries must have VALID bit cleared. */
>  #define __swp_type(x)			(((x).val >> 10) & 0x1f)
> @@ -266,6 +266,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
>  
>  #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32) */
>  
> -#endif /* defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX) */
> +#endif /* defined(CONFIG_CPU_R3K_TLB) */
>  
>  #endif /* _ASM_PGTABLE_32_H */
> diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
> index c2c1060b43ef..5f1ced8cba07 100644
> --- a/arch/mips/include/asm/pgtable-bits.h
> +++ b/arch/mips/include/asm/pgtable-bits.h
> @@ -82,7 +82,7 @@ enum pgtable_bits {
>  	_PAGE_SPECIAL_SHIFT,
>  };
>  
> -#elif defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> +#elif defined(CONFIG_CPU_R3K_TLB)
>  
>  /* Page table bits used for r3k systems */
>  enum pgtable_bits {
> @@ -151,7 +151,7 @@ enum pgtable_bits {
>  #define _PAGE_GLOBAL		(1 << _PAGE_GLOBAL_SHIFT)
>  #define _PAGE_VALID		(1 << _PAGE_VALID_SHIFT)
>  #define _PAGE_DIRTY		(1 << _PAGE_DIRTY_SHIFT)
> -#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> +#if defined(CONFIG_CPU_R3K_TLB)
>  # define _CACHE_UNCACHED	(1 << _CACHE_UNCACHED_SHIFT)
>  # define _CACHE_MASK		_CACHE_UNCACHED
>  # define _PFN_SHIFT		PAGE_SHIFT
> @@ -209,7 +209,7 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
>  /*
>   * Cache attributes
>   */
> -#if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
> +#if defined(CONFIG_CPU_R3K_TLB)
>  
>  #define _CACHE_CACHABLE_NONCOHERENT 0
>  #define _CACHE_UNCACHED_ACCELERATED _CACHE_UNCACHED
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index d60f47a9088c..4dca733d5076 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -199,7 +199,7 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
>  static inline void set_pte(pte_t *ptep, pte_t pteval)
>  {
>  	*ptep = pteval;
> -#if !defined(CONFIG_CPU_R3000) && !defined(CONFIG_CPU_TX39XX)
> +#if !defined(CONFIG_CPU_R3K_TLB)
>  	if (pte_val(pteval) & _PAGE_GLOBAL) {
>  		pte_t *buddy = ptep_buddy(ptep);
>  		/*
> @@ -218,7 +218,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
>  static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>  {
>  	htw_stop();
> -#if !defined(CONFIG_CPU_R3000) && !defined(CONFIG_CPU_TX39XX)
> +#if !defined(CONFIG_CPU_R3K_TLB)
>  	/* Preserve global status for the pair */
>  	if (pte_val(*ptep_buddy(ptep)) & _PAGE_GLOBAL)
>  		set_pte_at(mm, addr, ptep, __pte(_PAGE_GLOBAL));
> diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
> index 949d43eefda1..46f483e952c8 100644
> --- a/arch/mips/mm/Makefile
> +++ b/arch/mips/mm/Makefile
> @@ -28,10 +28,11 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
>  obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
>  obj-$(CONFIG_DMA_NONCOHERENT)	+= dma-noncoherent.o
>  
> +obj-$(CONFIG_CPU_R3K_TLB)	+= tlb-r3k.o
>  obj-$(CONFIG_CPU_R4K_CACHE_TLB) += c-r4k.o cex-gen.o tlb-r4k.o
> -obj-$(CONFIG_CPU_R3000)		+= c-r3k.o tlb-r3k.o
> +obj-$(CONFIG_CPU_R3000)		+= c-r3k.o
>  obj-$(CONFIG_CPU_SB1)		+= c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
> -obj-$(CONFIG_CPU_TX39XX)	+= c-tx39.o tlb-r3k.o
> +obj-$(CONFIG_CPU_TX39XX)	+= c-tx39.o
>  obj-$(CONFIG_CPU_CAVIUM_OCTEON) += c-octeon.o cex-oct.o tlb-r4k.o
>  
>  obj-$(CONFIG_IP22_CPU_SCACHE)	+= sc-ip22.o
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
