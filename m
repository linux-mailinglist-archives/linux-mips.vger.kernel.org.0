Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E48788D2C2
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 14:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfHNMND (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 08:13:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45340 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfHNMND (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Aug 2019 08:13:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id t3so16036268ljj.12
        for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2019 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s+KfYsGf96g5gS4HNDt7M71tHrryCz3ppYrd6TCaL2M=;
        b=q5Gdhjh6wNlDCZeZNiV+yDUyp6I8wmiDirZh6lXVXhckX/YFrvwgbZjaEcOBihB8Ao
         3CFATHGPHx6yvzQ5QsbjqsddjFwDIPHJ04VwlEDIcFTS0C3OOJrJCvaEaIkr+3VeHpRM
         W6JpX2DkkaKb74xtZ+6py30TLUNoWUba7WbDSDCyQe9bD22l7+ldbiSymLTyraS4poAi
         c3/6zdbjGAAw7VKnEo02u5COcilcY9lp74ufNg2Z9zpe6sM86SOUoLdwBLzJ04X947zp
         KUQ/bPyAisEYuPtSHA+1ztopcrA9QPaB/rTweUlLnF1qUXzl41SsIn5+bgsEhkemQUr4
         UxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s+KfYsGf96g5gS4HNDt7M71tHrryCz3ppYrd6TCaL2M=;
        b=lSfpASiVy+jFQ/w8nRjVFXT1IclN1ZiUa09DPy/W3yqkwqUuTHpXRbZtUrUpc0Y9lK
         xa5TquxAywMlA7c4/saOPvrZuSAyWPwSCTrTewUoCOgN39h4b2On4Ys84R20ofQv6RcL
         3l9fZ2fo4u5ZXUqpIrioQhbuyBvO6fqiW5KlK7AnHM05EGKRxw14t8l7CYsKlqcxfsNr
         6Ic1CmkUImjolPZUIc0Ojq6d08YhuKi+dTyf83CssCf8mdODi/Ngkb0JCpbAvH2/mp7y
         TP+icdyY1SYkA40ab13XAwe1TxX9XZRlMOtj+8E66IpPb3JHZOvgahlASiTaUK/rjFDR
         5TWw==
X-Gm-Message-State: APjAAAVmjbufmF+T6gQcr+EDegCZINn+kr7mNn2LDNMl7Hn9oj+jrqfM
        eeY9pJDGsEOM9JZQeu2eR6o=
X-Google-Smtp-Source: APXvYqwIz9wLyInEoiviq6GmUyRf/h/bW1whAizXSrsMZ86xb4Ev2mH0/w7+PMqgNz2raBCZLW8DQg==
X-Received: by 2002:a2e:a0c6:: with SMTP id f6mr1492481ljm.102.1565784781292;
        Wed, 14 Aug 2019 05:13:01 -0700 (PDT)
Received: from mobilestation ([95.79.14.48])
        by smtp.gmail.com with ESMTPSA id m25sm20120558lfc.83.2019.08.14.05.13.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 05:13:00 -0700 (PDT)
Date:   Wed, 14 Aug 2019 15:12:58 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        yasha.che3@gmail.com, aurelien@aurel32.net, sfr@canb.auug.org.au,
        matt.redfearn@mips.com, chenhc@lemote.com
Subject: Re: [PATCH 5/7] MIPS: msp: Record prom memory
Message-ID: <20190814121257.pnfkgk5hzdytn4oh@mobilestation>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190808075013.4852-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808075013.4852-6-jiaxun.yang@flygoat.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 08, 2019 at 03:50:11PM +0800, Jiaxun Yang wrote:
> boot_mem_map is nolonger exist so we need to maintain a list
> of prom memory by ourselves
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/pmcs-msp71xx/msp_prom.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp_prom.c
> index 6fdcb3d6fbb5..13a5eb47af94 100644
> --- a/arch/mips/pmcs-msp71xx/msp_prom.c
> +++ b/arch/mips/pmcs-msp71xx/msp_prom.c
> @@ -61,6 +61,10 @@ int init_debug = 1;
>  /* memory blocks */
>  struct prom_pmemblock mdesc[PROM_MAX_PMEMBLOCKS];
>  
> +static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
> +static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
> +static unsigned int nr_prom_mem __initdata;
> +
>  /* default feature sets */
>  static char msp_default_features[] =
>  #if defined(CONFIG_PMC_MSP4200_EVAL) \
> @@ -352,6 +356,12 @@ void __init prom_meminit(void)
>  
>  		add_memory_region(base, size, type);
>  		p++;
> +
> +		if (type == BOOT_MEM_ROM_DATA) {
> +			prom_mem_base[nr_prom_mem] = base;
> +			prom_mem_size[nr_prom_mem] = size;
> +			nr_prom_mem++;

The same as for FW_ARC. I suggest to add a sanity check here as well.

-Sergey

> +		}
>  	}
>  }
>  
> @@ -407,13 +417,9 @@ void __init prom_free_prom_memory(void)
>  	envp[i] = NULL;			/* end array with null pointer */
>  	prom_envp = envp;
>  
> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
> -		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
> -			continue;
> -
> -		addr = boot_mem_map.map[i].addr;
> +	for (i = 0; i < nr_prom_mem; i++) {
>  		free_init_pages("prom memory",
> -				addr, addr + boot_mem_map.map[i].size);
> +			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
>  	}
>  }
>  
> -- 
> 2.22.0
> 
