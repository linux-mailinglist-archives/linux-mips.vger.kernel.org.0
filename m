Return-Path: <linux-mips+bounces-4108-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D303F926494
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AA151F23FC8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDEE181B8C;
	Wed,  3 Jul 2024 15:13:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D5F17FAD3;
	Wed,  3 Jul 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019588; cv=none; b=o8P8gl6sXRJI2WmV+V7GSUpccirm3/bws/W3QBbz1j2+oM3LhYx4zw46VlVU1r2o5rAUMzsuoDj+cAVm9fgKg6bx4rLHaGYA7PH33YMnxir7cDcYC7VG8pmFRC3CNvCKWFCtnNwN93OyPptRw91BaLgri4vXYvrVMzjGuRqIzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019588; c=relaxed/simple;
	bh=IgiR48qZckGes9RhJYBc+AaWGNnyeZUEyB3IhSIIVJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THDu8654+CkeXaxbafkf8VkRjzlhA5vRpXBbvCLLl085cDj2c9FodNIPdZ0j5KVO1ScHImnarhh2Gqt+FDAshz07vgqL+Xu+qk1zFst9t0UtWzDyZ5Jeza3Uarl1ZnmpNIVc6M06IVk/ML2ySyviLFIdWRHMjD7qsFYWl7VLgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1eq-0000BF-00; Wed, 03 Jul 2024 17:12:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0BB0CC0120; Wed,  3 Jul 2024 17:03:45 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:03:45 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid
 interrupts
Message-ID: <ZoVoUabfZiiAXWKR@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-2-e332687f1692@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-b4-mips-ipi-improvements-v1-2-e332687f1692@flygoat.com>

On Sun, Jun 16, 2024 at 10:03:06PM +0100, Jiaxun Yang wrote:
> IPI interrupts need to be enabled when a new CPU coming up.
> 
> Manage them as percpu_devid interrupts and invoke enable/disable
> functions at appropriate time to perform enabling as required,
> similar to what RISC-V and Arm doing.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/ipi.h | 11 +++++++++++
>  arch/mips/kernel/smp.c      | 26 ++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/ipi.h b/arch/mips/include/asm/ipi.h
> index df7a0ac4227a..88b507339f51 100644
> --- a/arch/mips/include/asm/ipi.h
> +++ b/arch/mips/include/asm/ipi.h
> @@ -29,6 +29,17 @@ int mips_smp_ipi_allocate(const struct cpumask *mask);
>   * Return 0 on success.
>   */
>  int mips_smp_ipi_free(const struct cpumask *mask);
> +
> +void mips_smp_ipi_enable(void);
> +void mips_smp_ipi_disable(void);
> +#else
> +static inline void mips_smp_ipi_enable(void)
> +{
> +}
> +
> +static inline void mips_smp_ipi_disable(void)
> +{
> +}
>  #endif /* CONFIG_GENERIC_IRQ_IPI */
>  #endif /* CONFIG_SMP */
>  #endif
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index a6cf6444533e..710644d47106 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -186,6 +186,7 @@ irq_handler_t ipi_handlers[IPI_MAX] __read_mostly = {
>  };
>  
>  #ifdef CONFIG_GENERIC_IRQ_IPI
> +static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
>  static int ipi_virqs[IPI_MAX] __ro_after_init;
>  static struct irq_desc *ipi_desc[IPI_MAX] __read_mostly;
>  
> @@ -225,13 +226,29 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask,
>  	local_irq_restore(flags);
>  }
>  
> +void mips_smp_ipi_enable(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < IPI_MAX; i++)
> +		enable_percpu_irq(ipi_virqs[i], IRQ_TYPE_NONE);
> +}
> +
> +void mips_smp_ipi_disable(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < IPI_MAX; i++)
> +		disable_percpu_irq(ipi_virqs[i]);
> +}
> +

there is no user of mips_smp_ipi_disable() (at least I didn't see one),
so do we need this patch at all ? Just looking like ARM or RiscV isn't
a justification for code churn.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

