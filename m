Return-Path: <linux-mips+bounces-9101-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A4AC34BA
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 15:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581DC3B2A9D
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9FC8494;
	Sun, 25 May 2025 13:03:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8EB33E1;
	Sun, 25 May 2025 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178189; cv=none; b=Y8ovKRxVfyogdYrWcojhcZHMYUPsgNBPwXtTVccoI1H1XqdFgt1UHFLpW5spYhuYgtY0l3Rp3hNKYhliIG/H1206pS1t6KDU4pX/IAyNe9ref0Mn1wwjiYJFSI7qomyJD7su4jLOYQdQ5XFyISkGGBmlLEnDlfCOhaYe3GC97tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178189; c=relaxed/simple;
	bh=/jxNFD1uxET6ASjHePOBoX8RxwFE2d0w0vqZQrlI8H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChqTsGlKEnNssSSF8Yar/IV6azwkhNxiihwOAqk5lrTQe7sNZf2WoysLok8N/c+QadFZsowL6vhNcYz2m+1B19IxzvqCLadYZdEIwvfkHQQyVwn+OZpLrSJTAeKVe3+dEDz097hYg068+/gIYC9msTlpNOUqPSN3ifSm5BW8vJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uJB0C-0006xa-00; Sun, 25 May 2025 15:02:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 606E4C00EF; Sun, 25 May 2025 15:02:18 +0200 (CEST)
Date: Sun, 25 May 2025 15:02:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Move the AP sync point before the calibration
 delay
Message-ID: <aDMU2rjaFCyrFALd@alpha.franken.de>
References: <20250523-hotplug-paralell-fix2-v1-1-45a9f84587fd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-hotplug-paralell-fix2-v1-1-45a9f84587fd@bootlin.com>

On Fri, May 23, 2025 at 09:58:15AM +0200, Gregory CLEMENT wrote:
> In the calibration delay process, some resources are shared, so it's
> better to move it after the parallel execution part. Thanks to the
> patch optimizing CPU delay calibration, this change has no impact on
> the boot time improvements gained from CPU parallel boot.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Hello,
> 
> After a thorough review, as reported in [1], the CPU delay calibration
> is the last potential issue area. However, I believe that with this
> patch [2] applied, the source of concurrency will disappear.
> 
> Gregory
> 
> [1]: https://lore.kernel.org/linux-mips/87frgvokga.fsf@BLaptop.bootlin.com/
> [2] :https://lore.kernel.org/linux-mips/20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com/
> ---
>  arch/mips/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 7901b59d8f60eddefc020cf2a137716af963f09e..4868e79f3b30e9d80fe6390785b297c35d8c02a3 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -371,12 +371,12 @@ asmlinkage void start_secondary(void)
>  	 * to an option instead of something based on .cputype
>  	 */
>  
> -	calibrate_delay();
> -	cpu_data[cpu].udelay_val = loops_per_jiffy;
> -
>  #ifdef CONFIG_HOTPLUG_PARALLEL
>  	cpuhp_ap_sync_alive();
>  #endif
> +	calibrate_delay();
> +	cpu_data[cpu].udelay_val = loops_per_jiffy;
> +
>  	set_cpu_sibling_map(cpu);
>  	set_cpu_core_map(cpu);
>  
> 
> ---
> base-commit: faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
> change-id: 20250522-hotplug-paralell-fix2-1bffa02a9529

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

