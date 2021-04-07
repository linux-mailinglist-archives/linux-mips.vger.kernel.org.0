Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF85356DE4
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 15:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343504AbhDGNwt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 09:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238334AbhDGNwt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 09:52:49 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C38E1C061756;
        Wed,  7 Apr 2021 06:52:39 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B5A6F92009C; Wed,  7 Apr 2021 15:52:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id AEA7D92009B;
        Wed,  7 Apr 2021 15:52:38 +0200 (CEST)
Date:   Wed, 7 Apr 2021 15:52:38 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        liwei391@huawei.com, nbd@nbd.name,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        yangtiezhu@loongson.cn
Subject: Re: [PATCH v2] MIPS: add support for buggy MT7621S core detection
In-Reply-To: <20210406042334.1318117-1-ilya.lipnitskiy@gmail.com>
Message-ID: <alpine.DEB.2.21.2104071549560.65251@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk> <20210406042334.1318117-1-ilya.lipnitskiy@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 5 Apr 2021, Ilya Lipnitskiy wrote:

> diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
> index fd43d876892e..9f495ffef2b7 100644
> --- a/arch/mips/include/asm/mips-cps.h
> +++ b/arch/mips/include/asm/mips-cps.h
> @@ -165,11 +167,29 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
>   */
>  static inline unsigned int mips_cps_numcores(unsigned int cluster)
>  {
> +	struct cpulaunch *launch;
> +	unsigned int ncores;
> +
>  	if (!mips_cm_present())
>  		return 0;
>  
>  	/* Add one before masking to handle 0xff indicating no cores */
> -	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> +	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
> +
> +	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
> +		/*
> +		 * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
> +		 * always reports 2 cores. Check the second core's LAUNCH_FREADY
> +		 * flag to detect if the second core is missing. This method
> +		 * only works before the core has been started.
> +		 */
> +		launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
> +		launch += 2; /* MT7621 has 2 VPEs per core */
> +		if (!(launch->flags & LAUNCH_FREADY))
> +			ncores = 1;
> +	}
> +
> +	return ncores;
>  }
>  
>  /**

 Much better to me, but please move the declaration of `launch' into the 
conditional block, which is the only place that uses it.

  Maciej
