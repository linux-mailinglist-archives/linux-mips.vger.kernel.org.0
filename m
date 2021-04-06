Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE8C3549FF
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 03:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbhDFBXG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Apr 2021 21:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235662AbhDFBXG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Apr 2021 21:23:06 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE08AC06174A;
        Mon,  5 Apr 2021 18:22:51 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9A85B92009C; Tue,  6 Apr 2021 03:22:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 8CC6292009B;
        Tue,  6 Apr 2021 03:22:48 +0200 (CEST)
Date:   Tue, 6 Apr 2021 03:22:48 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] MIPS: add support for buggy MT7621S core detection
In-Reply-To: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com>
Message-ID: <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
References: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2 Apr 2021, Ilya Lipnitskiy wrote:

> diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
> index d72dc6e1cf3c..d32f0c4e61f7 100644
> --- a/arch/mips/include/asm/bugs.h
> +++ b/arch/mips/include/asm/bugs.h
> @@ -50,4 +51,21 @@ static inline int r4k_daddiu_bug(void)
>  	return daddiu_bug != 0;
>  }
>  
> +static inline void cm_gcr_pcores_bug(unsigned int *ncores)
> +{
> +	struct cpulaunch *launch;
> +
> +	if (!IS_ENABLED(CONFIG_SOC_MT7621) || !ncores)
> +		return;
> +
> +	/*
> +	 * Ralink MT7621S SoC is single core, but GCR_CONFIG always reports 2 cores.

 Overlong line.

> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index bcd6a944b839..e1e9c11e8a7c 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -60,6 +61,7 @@ static void __init cps_smp_setup(void)
>  		pr_cont("{");
>  
>  		ncores = mips_cps_numcores(cl);
> +		cm_gcr_pcores_bug(&ncores);
>  		for (c = 0; c < ncores; c++) {
>  			core_vpes = core_vpe_count(cl, c);
>  
> @@ -170,6 +172,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
>  
>  	/* Allocate core boot configuration structs */
>  	ncores = mips_cps_numcores(0);
> +	cm_gcr_pcores_bug(&ncores);

 Why called at each `mips_cps_numcores' call site rather than within the 
callee?  Also weird inefficient interface: why isn't `ncores' passed by 
value for a new value to be returned?

  Maciej
