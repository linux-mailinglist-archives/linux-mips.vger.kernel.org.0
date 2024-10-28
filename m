Return-Path: <linux-mips+bounces-6506-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE479B351E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 16:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF90A1C20840
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 15:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706781DE3AA;
	Mon, 28 Oct 2024 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+bslp5n"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82F12F585;
	Mon, 28 Oct 2024 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130063; cv=none; b=ljsHalExoS3ZoyL33m3WSkpNbww62ki3gJ49+O+hFM2F2smoFazctpA3pdUNbjKlZn87C45pJKzvvuWMQeDlS70126g5npN3kCLKr/GuPbyvFxY/xoQxM4ST6HfSjtpWUN5S2yHcVcGCNO0znFOeVaStxciMTziRX4bgTWGQBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130063; c=relaxed/simple;
	bh=1OnKnskO1uPXHT57ko80fWNSrAKlqsEB3xePdsqM5Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKcn13sfdS4+xNGnuEme45qOqXjiEKCMETHBc6rdXeHtcq8F4FMnc2oz1hsmFR5XSoj66q61nyIn0GxmJtRrI5EjE6ohaZAwqCv8+NPyJL5c5FcAggOIuRfijG7DNR+4lsbKpVHcgnhoY5ZAJwwKJUhIolJ8aTRuhbytefNUvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+bslp5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0E1C4CEC3;
	Mon, 28 Oct 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130062;
	bh=1OnKnskO1uPXHT57ko80fWNSrAKlqsEB3xePdsqM5Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+bslp5nYFB5IdzYlqcPXUe0Deg2tPLvvs4TWlciZJnyPqj4C7msUDWod/mZ74Wbi
	 V+npdeWkLAM2YaCU68ORi88AWKUdk+SexkhRmxohs3rLk/42hVRfWw3lmcgEXhKfmW
	 l+9bfe1QEI3TUsTCQUmiCfe1cOZzdBeIsDmI24fTFiyKZwDu9f4TeXEh9Tmi9Z7A4g
	 RQuSC3lG7y94YkqEIK4qkURF8Scn98uwTY1D6XvZn72zlsfH7cHelHDCN5wkvgpceU
	 yWqXIdxX1dAjLGXoC7cRczTCjM1LzpGhlbBh2ntrVJVtMMwopnozbfMsplC2SfLpCE
	 /bnM2cMZeJadg==
Date: Mon, 28 Oct 2024 15:40:55 +0000
From: Will Deacon <will@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: robh@kernel.org, mark.rutland@arm.com, leitao@debian.org,
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
	saravanak@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, loongarch@lists.linux.dev,
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
Message-ID: <20241028154054.GE2484@willie-the-truck>
References: <20241023171426.452688-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 23, 2024 at 06:14:26PM +0100, Usama Arif wrote:
>  __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
> 
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> ---
> v1 -> 2:
> - pass dt_phys in early_init_dt_scan instead of creating
>   anorther arch->dt function (Rob Herring)
> ---
>  arch/arc/kernel/devtree.c              |  2 +-
>  arch/arm/kernel/devtree.c              |  2 +-
>  arch/arm64/kernel/setup.c              |  6 +++++-
>  arch/csky/kernel/setup.c               |  4 ++--
>  arch/loongarch/kernel/setup.c          |  2 +-
>  arch/microblaze/kernel/prom.c          |  2 +-
>  arch/mips/kernel/prom.c                |  2 +-
>  arch/mips/kernel/relocate.c            |  2 +-
>  arch/nios2/kernel/prom.c               |  4 ++--
>  arch/openrisc/kernel/prom.c            |  2 +-
>  arch/powerpc/kernel/dt_cpu_ftrs.c      |  2 +-
>  arch/powerpc/kernel/prom.c             |  2 +-
>  arch/powerpc/platforms/pseries/plpks.c |  2 +-
>  arch/riscv/kernel/setup.c              |  2 +-
>  arch/sh/kernel/setup.c                 |  2 +-
>  arch/um/kernel/dtb.c                   |  2 +-
>  arch/x86/kernel/devicetree.c           |  2 +-
>  arch/xtensa/kernel/setup.c             |  2 +-
>  drivers/of/fdt.c                       | 14 ++++++++------
>  drivers/of/kexec.c                     |  2 +-
>  include/linux/of_fdt.h                 |  5 +++--
>  21 files changed, 36 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
> index 4c9e61457b2f..cc6ac7d128aa 100644
> --- a/arch/arc/kernel/devtree.c
> +++ b/arch/arc/kernel/devtree.c
> @@ -62,7 +62,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt)
>  	const struct machine_desc *mdesc;
>  	unsigned long dt_root;
>  
> -	if (!early_init_dt_scan(dt))
> +	if (!early_init_dt_scan(dt, __pa(dt)))
>  		return NULL;
>  
>  	mdesc = of_flat_dt_match_machine(NULL, arch_get_next_mach);
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index fdb74e64206a..3b78966e750a 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -200,7 +200,7 @@ const struct machine_desc * __init setup_machine_fdt(void *dt_virt)
>  
>  	mdesc_best = &__mach_desc_GENERIC_DT;
>  
> -	if (!dt_virt || !early_init_dt_verify(dt_virt))
> +	if (!dt_virt || !early_init_dt_verify(dt_virt, __pa(dt_virt)))
>  		return NULL;
>  
>  	mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index b22d28ec8028..177262739c49 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -175,7 +175,11 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>  	if (dt_virt)
>  		memblock_reserve(dt_phys, size);
>  
> -	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
> +	/*
> +	 * dt_virt is a fixmap address, hence __pa(dt_virt) can't be used.
> +	 * Pass dt_phys directly.
> +	 */
> +	if (!dt_virt || !early_init_dt_scan(dt_virt, dt_phys)) {

nit: It looks like early_init_dt_verify() will now return false if
!dt_virt, so we can drop the additional check here.

Will

