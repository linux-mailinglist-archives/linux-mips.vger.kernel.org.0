Return-Path: <linux-mips+bounces-5049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17A95D60F
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 21:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0391C21F90
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 19:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077C4192B80;
	Fri, 23 Aug 2024 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gzujiRRv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z2gKkeTy"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EEB1925B2;
	Fri, 23 Aug 2024 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724441266; cv=none; b=nhM/tp/sHolVH4gpHkYAx61+tDmE/TduLaLBNHYlJp9s0OO9BOYFl4fzEMe9en1DJDQ3MmNEDVBAkmNaXTJxig97NEUBWZsl/kUkX8BiMdAug8nt/1zLKQwn1+L0p+wqFeb4Ho53GTfszOF96neilaQ3yPQnpRV6VavvpU9nUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724441266; c=relaxed/simple;
	bh=FNeJZYLGwT2A7uyk5Z2+0SQp6gyz7tpSCoQ/Sk2SzyM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i+vnvrgiYu/c7helMEHxGvtGtSkQWb0zkboODv/tsOFxNcl8GkFJbPMKTnejS3bUgYKUikJPnIxUX01196j6G99apLcJGq0zw0I4s9bQF1ybPJRumvUmZEjcuU8baQ4X/caDnrTqgFbNiSy/LodjNXQOzUKJx8vijS6BbXH4W/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gzujiRRv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z2gKkeTy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724441263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVwQ8yy+ZNQu400/0UssKLrhuRYQVJBlCPFsI9UuKdA=;
	b=gzujiRRv6tlmJEjOMPMU8RUPrOwJtMsaHlBhQZQb//LyIUXStgnpDTc+po7XLuIMK3G/ek
	cP7jL8foKNym0jloGZSxzZRwMUHzqJzY16T0iEo1/OD/+H/zG38fOE9Cl70WKahr0hRF5/
	QiOK4KhoukEeT3MH76b7LtlhOJYUYTSFGWUvdIVcUPL7HImsaKjW35D8atEZBDdsRqzdOw
	E6hgk/XCllRKdhBhrn37khzHqEJlH8/CIxjFtJ/1mHt/4u3Wm6Ye6RglPeRvSZj5nWKIUU
	yDhydgD2E6Z5QvMUHQQ7BPJj/r5unqEKmJCCzVAiVRYLH4CoRAxH9zA5PkAYRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724441263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVwQ8yy+ZNQu400/0UssKLrhuRYQVJBlCPFsI9UuKdA=;
	b=Z2gKkeTyAdo5ie5jBQuEr2KXlEQwDmc4NjNXULEYOjNO9GEumKPPcEm7w+GCsT+9P5AJyV
	Ww1o0sN8i1kMJjBg==
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Huacai Chen
 <chenhuacai@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Paul
 Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 06/10] irqchip: irq-mips-gic: Switch to ipi_mux
In-Reply-To: <20240810-b4-mips-ipi-improvements-v3-6-1224fd7c4096@flygoat.com>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
 <20240810-b4-mips-ipi-improvements-v3-6-1224fd7c4096@flygoat.com>
Date: Fri, 23 Aug 2024 21:27:43 +0200
Message-ID: <871q2fghu8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 10 2024 at 13:39, Jiaxun Yang wrote:

The interrupt subsystem uses irqchip/irq....: as prefix.

> Use ipi_mux to implement IPI interrupts instead of
> allocating vector for each individual IPI messages.

  allocating separate vectors for ... IPI message.

> This can reduce number of reserved GIC shared vectors,

Can? Does it or does it not?

Also: the number

> which is a huge problem on MSI enabled GIC systems.
>
> It also allowed us to easily expand number of IPIs.

s/allowed us/allows/           the number

>  int gic_get_c0_compare_int(void)
>  {
>  	if (!gic_local_irq_is_routable(GIC_LOCAL_INT_TIMER))
> @@ -181,6 +176,11 @@ static void gic_mask_irq(struct irq_data *d)
>  	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
>  
>  	write_gic_rmask(intr);
> +
> +#ifdef CONFIG_GENERIC_IRQ_IPI
> +	if (test_bit(intr, ipi_resrv))
> +		return;
> +#endif

Can you please wrap this into a inline function so that you don't have
to sprinkle all these #ifdefs into the code?

#ifdef CONFIG_GENERIC_IRQ_IPI
static inline bool gic_is_reserved(unsigned int intr)
{
        return test_bit(intr, ipi_resrv);
}
#else
static inline bool gic_is_reserved(unsigned int intr) { return false; }
#endif

Hmm?

> +static int gic_ipi_mux_init(struct device_node *node, struct irq_domain *d)
>  {
> -	struct irq_domain *gic_ipi_domain;
> -	unsigned int v[2], num_ipis;
> -
> -	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
> -						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
> -						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
> -						  node, &gic_ipi_domain_ops, NULL);
> -	if (!gic_ipi_domain) {
> -		pr_err("Failed to add IPI domain");
> -		return -ENXIO;
> -	}
> -
> -	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
> +	unsigned int i, v[2], num_ipis;
> +	int ipi_virq, cpu = 0;
>  
>  	if (node &&
>  	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {

Please use the full 100 characters width here and get rid of the line break.

>  		bitmap_set(ipi_resrv, v[0], v[1]);
>  	} else {
>  		/*
> -		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
> -		 * meeting the requirements of arch/mips SMP.
> +		 * Reserve 1 interrupts per possible CPU/VP for use as IPIs
>  		 */
> -		num_ipis = 2 * num_possible_cpus();
> +		num_ipis = num_possible_cpus();
>  		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
>  	}

Thanks,

        tglx


