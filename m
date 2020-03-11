Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3B918238E
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 21:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgCKUyb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 16:54:31 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40935 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgCKUya (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 16:54:30 -0400
Received: by mail-ed1-f67.google.com with SMTP id a24so4620148edy.7;
        Wed, 11 Mar 2020 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HbdjWuoiokVFJb/R37FmH/KxomkDrV4rWjVeO+JjVlc=;
        b=nn//fcFBPZwlqvin4jOk+1owLO+b0MhivgrL6uMFamrDesgH54O8T2itQYY3II//2S
         b+j0o4JvpHs9m+CAKP5qMcRuASBBhXLyWfzUR5v0wd/RbYEZD6GOAsskzJdslfFBmeBU
         kcNUaeOVhle7OPPrBNGj0fMWPr34sxRQ7a8Rk7vxR4Qybw5ASKOfby8/BApMHQnHxHT8
         AFwmdZomhGw3SYWnzpP4uReubLphCfF0H5800hnPTTstpRE3kmLsWIgrzSRdiy3e0d75
         SB0GZllCZN1BFu7PQJxsCBvjd4G6r8AlfIfqmfV/UX0vHhfQBJcpeLU3nvhIwKEp7cfi
         5Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HbdjWuoiokVFJb/R37FmH/KxomkDrV4rWjVeO+JjVlc=;
        b=qi87TUSN614E33wmmgBlJyBW3UKIbVuVypqU9OUTmWsKm8u/Dt4oxJSLTcDsYirqEq
         fJrnOhd4tMgdJifpT9Vno/mzd1VtpC+89GH3TqkScjTSMSGZ/s1cKKBSh0RzfJHyqPzO
         KC8T3ooaNqZTJy4eSfNaVX1k4k6CewdnvzbO33etLfoQoPRriv+QlN5dtXy+FVXPdMhT
         RitL/+ATuARA1BLZULCcmqNpCbjOUSbStQsLjvGIEhI0kOz5SXwbTQLLqjSwnToKAZgd
         eXYOLWNCenmx4e3ssLrMNHJDUf0IYYBdh25uKekMXmyiLk/atpoRhtgQ7Es8TbAJQHyY
         Vtrg==
X-Gm-Message-State: ANhLgQ3yc0wuaB/LOG8/lloKysDCyyDrMk5/3eHpFe6H1Yliw0ZSExjl
        XQrG+g/VfvEGJHUjkU4xTudDA6Ut
X-Google-Smtp-Source: ADFU+vvZi3LTBMFCkMcvTFHAyOSJvowT4af8qJA5S5S7RC8ICvJKKiJ5Z0zVRvdLyky2rXkg/1/Cbg==
X-Received: by 2002:a05:6402:8c6:: with SMTP id d6mr4170282edz.76.1583960068361;
        Wed, 11 Mar 2020 13:54:28 -0700 (PDT)
Received: from [10.67.48.239] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id r23sm4648413edx.24.2020.03.11.13.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 13:54:27 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
To:     Kamal Dasu <kdasu.kdev@gmail.com>, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org
References: <20200207223324.46011-1-kdasu.kdev@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <53c0ca2d-84a5-7556-c1f4-a75e99f0a743@gmail.com>
Date:   Wed, 11 Mar 2020 13:54:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207223324.46011-1-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/7/20 2:33 PM, Kamal Dasu wrote:
> Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
> line can contain two instruction cache lines (64B), or four data cache
> lines (32B). Hardware prefetch Cache detects stream access, and prefetches
> ahead of processor access. Add support to invalidate BMIPS5000 cpu zephyr
> secondary cache module (ZSCM) on DMA from device so that data returned is
> coherent during DMA read operations.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Thomas can review and apply this patch? Thank you!

> ---
>  arch/mips/mm/c-r4k.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 5f3d0103b95d..acd9ef383e97 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -901,6 +901,31 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
>  	__sync();
>  }
>  
> +static void prefetch_cache_inv(unsigned long addr, unsigned long size)
> +{
> +	unsigned int linesz = cpu_scache_line_size();
> +	unsigned long addr0 = addr, addr1;
> +
> +	addr0 &= ~(linesz - 1);
> +	addr1 = (addr0 + size - 1) & ~(linesz - 1);
> +
> +	protected_writeback_scache_line(addr0);
> +	if (likely(addr1 != addr0))
> +		protected_writeback_scache_line(addr1);
> +	else
> +		return;
> +
> +	addr0 += linesz;
> +	if (likely(addr1 != addr0))
> +		protected_writeback_scache_line(addr0);
> +	else
> +		return;
> +
> +	addr1 -= linesz;
> +	if (likely(addr1 > addr0))
> +		protected_writeback_scache_line(addr0);
> +}
> +
>  static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
>  {
>  	/* Catch bad driver code */
> @@ -908,6 +933,10 @@ static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
>  		return;
>  
>  	preempt_disable();
> +
> +	if (current_cpu_type() == CPU_BMIPS5000)
> +		prefetch_cache_inv(addr, size);
> +
>  	if (cpu_has_inclusive_pcaches) {
>  		if (size >= scache_size) {
>  			if (current_cpu_type() != CPU_LOONGSON64)
> 


-- 
Florian
