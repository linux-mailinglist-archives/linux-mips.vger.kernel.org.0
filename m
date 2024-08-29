Return-Path: <linux-mips+bounces-5200-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A8963F1D
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074391C24494
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D6A18CC1E;
	Thu, 29 Aug 2024 08:52:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E73A18CC18
	for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921547; cv=none; b=fITdx4F5FlTE0tCByqMgpwHCawFLGtmEMdn45hUQOd9SeT7+G5NDXziMRTU1Hwm0B0ezZ1b7REUJij/EwsV9U1+4YlQqMaUO79KeCdAYdlcJw7e617liRM6mAr9RjtuF9aRQSM0l2wLmJpdaR1f15sG38pm6zf/iObN0El2SHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921547; c=relaxed/simple;
	bh=JGUyrPVNzvxgNd2+o2jnOFDezWV7B9xqPWoQ1dWUaJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIKGznubUuvtPBw/8VVPfTazzaPPd8JH02yKSbcsxRdcx51VPAN+ZCrO6sX6XgXB26U8lbPboj2FX+VxBURD63AgpXJvg2oKv0hkbthq6Syf2e06I7RvWBjxYMrflpXnXf7Yv+/cARXIHRkVJIDQhvjKvgt+79ngp3l111E5DWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sjat5-0005n5-00; Thu, 29 Aug 2024 10:52:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3803AC0B3B; Thu, 29 Aug 2024 10:47:50 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:47:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Remove unused declarations in asm/cmp.h
Message-ID: <ZtA1tl90wfGcoB7j@alpha.franken.de>
References: <20240814104052.2055777-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814104052.2055777-1-cuigaosheng1@huawei.com>

On Wed, Aug 14, 2024 at 06:40:52PM +0800, Gaosheng Cui wrote:
> These functions have been removed since
> commit 7fb6f7b0af67 ("MIPS: Remove deprecated CONFIG_MIPS_CMP"),
> so remove them.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  arch/mips/include/asm/cmp.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/mips/include/asm/cmp.h b/arch/mips/include/asm/cmp.h
> index e9e87504bb0c..71e20e6cd38d 100644
> --- a/arch/mips/include/asm/cmp.h
> +++ b/arch/mips/include/asm/cmp.h
> @@ -7,12 +7,4 @@
>   */
>  struct task_struct;
>  
> -extern void cmp_smp_setup(void);
> -extern void cmp_smp_finish(void);
> -extern void cmp_boot_secondary(int cpu, struct task_struct *t);
> -extern void cmp_init_secondary(void);
> -extern void cmp_prepare_cpus(unsigned int max_cpus);
> -
> -/* This is platform specific */
> -extern void cmp_send_ipi(int cpu, unsigned int action);
>  #endif /*  _ASM_CMP_H */
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

