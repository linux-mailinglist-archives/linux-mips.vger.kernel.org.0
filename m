Return-Path: <linux-mips+bounces-8792-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A465A9E0BB
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385691898E24
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C015C2472A5;
	Sun, 27 Apr 2025 08:19:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E583F1DE4DC;
	Sun, 27 Apr 2025 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741945; cv=none; b=ucLiwQ4u5c/WF9XhY+epb3X6NbO/qsroULZHjVTn/M6NKRgZzBMQ9QdUqCL+MhwFzbchvIbVctCAZ0CxxFohSR5fUZ/PAy12wogdL3jtBX/nyNbYfrCJcJQnTHYWb6ELWp+imN2PiuSSVlgM+dc+BM4MWc7n1rtSsiezUL0G7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741945; c=relaxed/simple;
	bh=3Sb1vLQTf/OWbWkKPCVxaLe+sn9DqAhiXbRhoC7vsD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkFi3xskdU/P0ASy37oBJTLTtxawp7cozYhdONEhfpLQpcQPtpkGwyDjNI/dv3O6JT6dkXK+/KuOx4eie63Yb6p8kO1xbqhZSd09/KpHtn55ggMmFy+d2vx/jdZfk7uxCHEVOev5XsCAyhPiEHS8ruS56/qP/xOC/Kt5/ydJgVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8xE4-0007QR-00; Sun, 27 Apr 2025 10:19:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 869BEC01A2; Sun, 27 Apr 2025 10:15:50 +0200 (CEST)
Date: Sun, 27 Apr 2025 10:15:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Chao-ying Fu <cfu@wavecomp.com>, stable@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPS: Fix potential NULL pointer dereferences in
 cps_prepare_cpus()
Message-ID: <aA3ntsiN6tNHFKD1@alpha.franken.de>
References: <20250407163224.794608-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407163224.794608-1-thorsten.blum@linux.dev>

On Mon, Apr 07, 2025 at 06:32:21PM +0200, Thorsten Blum wrote:
> Check the return values of kcalloc() and exit early to avoid potential
> NULL pointer dereferences.
> 
> Compile-tested only.
> 
> Cc: stable@vger.kernel.org
> Fixes: 75fa6a583882e ("MIPS: CPS: Introduce struct cluster_boot_config")
> Fixes: 0856c143e1cd3 ("MIPS: CPS: Boot CPUs in secondary clusters")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/mips/kernel/smp-cps.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index e85bd087467e..cc26d56f3ab6 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -332,6 +332,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
>  	mips_cps_cluster_bootcfg = kcalloc(nclusters,
>  					   sizeof(*mips_cps_cluster_bootcfg),
>  					   GFP_KERNEL);
> +	if (!mips_cps_cluster_bootcfg)
> +		goto err_out;
>  
>  	if (nclusters > 1)
>  		mips_cm_update_property();
> @@ -348,6 +350,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
>  		mips_cps_cluster_bootcfg[cl].core_power =
>  			kcalloc(BITS_TO_LONGS(ncores), sizeof(unsigned long),
>  				GFP_KERNEL);
> +		if (!mips_cps_cluster_bootcfg[cl].core_power)
> +			goto err_out;
>  
>  		/* Allocate VPE boot configuration structs */
>  		for (c = 0; c < ncores; c++) {
> -- 
> 2.49.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

