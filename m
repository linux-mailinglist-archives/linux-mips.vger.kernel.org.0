Return-Path: <linux-mips+bounces-5050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89595D621
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 21:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06A71C2185E
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 19:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4BB1925A2;
	Fri, 23 Aug 2024 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4sKgN5KW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+TpWoHjI"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F36194141;
	Fri, 23 Aug 2024 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724441833; cv=none; b=kW8IKGl07nY8uPkHc9i02UWSk1KiDhGNC8JNcq3Dij9zgzVS1UmC6soIXN/6LA9h0Fbx+qCnae2uVny/Ti6NovtrHo7h/181Z4Jvw7oNH0VZ8+J/DRy1Z80OkHJcf5Tr8fWAsjKMuZm0JJQq0ixX8qLwvovtCN0j+P70mYGagtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724441833; c=relaxed/simple;
	bh=tDGUKTFFDz+eQxsRkH4HW2hZZRnnBbdQ4HgH8QC1MN8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=erqGCjd1BP8o3PBOIG3M/Dln1lRGii3R7o3WQWKwdX+3u+M73YLnlsmrYkc6p3duCKkTzJWhy7QYlPsVrUciq0kyjE3QQDsNRmyydrYVCgYIbeO1/1Zts4BoSPLZRjMeSkzbWMh3ENgeRUDCs2lXgYQyZg0p+qNA5If1FDZP0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4sKgN5KW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+TpWoHjI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724441830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMNEXEy8LYfPeU3VbzTfPdg4TGW9cMVuwbChRPo7i7I=;
	b=4sKgN5KWiNBncsCtsH6uSpXyjbo6eqenis78E4xLBjhXODaAck6vSCWKpuTlq6Ho8Ggv1s
	pPaK221WKIj4MyIXZ8OR/sPGaoFZ5+/2tQOUxzNlI+SU5HBX0e1B68GJ9jkp+bHJxMwDLY
	K+8gv94qKrVAJdmFcg9wf40gKzjLCi2NSS8CXHXYIMRubcPMKaqgSfWVs3Hkf5WCRBNey/
	MlJAFZ67u+0u7t65sipXt5nqD/0bEWbBrRn/9Cw6NguaKId3J40kRVm4Dvc7XJGNieXPmP
	dd6O1pfM84ujh86SkfhWH2wiqIYZy5E12OrvTK2Q3SobR93bpNsWrOaOqHJ9hA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724441830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMNEXEy8LYfPeU3VbzTfPdg4TGW9cMVuwbChRPo7i7I=;
	b=+TpWoHjIka6H4IBx57soiRDpswa7rWr7Oi/TIDSP5GZyGTGP1vs27aOqGRkURYye7dFDp3
	QqB8CB/Y8wDq4bBw==
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Huacai Chen
 <chenhuacai@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Paul
 Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 09/10] irqchip: irq-mips-cpu: Rework software IRQ
 handling flow
In-Reply-To: <20240810-b4-mips-ipi-improvements-v3-9-1224fd7c4096@flygoat.com>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
 <20240810-b4-mips-ipi-improvements-v3-9-1224fd7c4096@flygoat.com>
Date: Fri, 23 Aug 2024 21:37:09 +0200
Message-ID: <87y14nf2u2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 10 2024 at 13:39, Jiaxun Yang wrote:

Please fix the subsystem prefix.

> Remove unnecessary irq_chip hooks for software interrupts,
> and don't mask them in ack hook to match kernel's expectation
> on handling flow.

What's that expectation? You fail to explain why the current code is not
matching them.

> Create a irq_chip for regular (non-MT) mode software interrupts
> so they will be acked as well.

I'm failing to understand what this is about due to the lack of
information above.

> -static struct irq_chip mips_cpu_irq_controller = {
> +static unsigned int mips_sw_irq_startup(struct irq_data *d)
> +{
> +	clear_c0_cause(C_SW0 << d->hwirq);
> +	back_to_back_c0_hazard();
> +	unmask_mips_irq(d);
> +	return 0;
> +}
> +
> +static void mips_sw_irq_ack(struct irq_data *d)
> +{
> +	clear_c0_cause(C_SW0 << d->hwirq);
> +	back_to_back_c0_hazard();
> +}

Please move these functions to the place which actually requires them,
i.e. after the cpu controller struct and before the new one.

> +
> +static const struct irq_chip mips_cpu_irq_controller = {
>  	.name		= "MIPS",
>  	.irq_ack	= mask_mips_irq,
>  	.irq_mask	= mask_mips_irq,
> @@ -60,11 +74,19 @@ static struct irq_chip mips_cpu_irq_controller = {
>  	.irq_enable	= unmask_mips_irq,
>  };
>  
> +static const struct irq_chip mips_cpu_sw_irq_controller = {
> +	.name		= "MIPS",
> +	.irq_startup	= mips_sw_irq_startup,
> +	.irq_ack	= mips_sw_irq_ack,
> +	.irq_mask	= mask_mips_irq,
> +	.irq_unmask	= unmask_mips_irq,
> +};

  
>  asmlinkage void __weak plat_irq_dispatch(void)
>  {
> @@ -152,11 +170,14 @@ asmlinkage void __weak plat_irq_dispatch(void)
>  static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
>  			     irq_hw_number_t hw)
>  {
> -	struct irq_chip *chip;
> +	const struct irq_chip *chip;
>  
> -	if (hw < 2 && cpu_has_mipsmt) {
> -		/* Software interrupts are used for MT/CMT IPI */
> -		chip = &mips_mt_cpu_irq_controller;
> +	if (hw < 2) {
> +		chip = &mips_cpu_sw_irq_controller;
> +#ifdef CONFIG_MIPS_MT
> +		if (cpu_has_mipsmt)
> +			chip = &mips_mt_cpu_irq_controller;
> +#endif

Please move this into a helper function:

#ifdef CONFIG_MIPS_MT
static inline const struct irq_chip *mips_get_cpu_irqchip(void)
{
        return cpu_has_mipsmt ? &mips_mt_cpu_sw_irq_controller : &mips_cpu_sw_irq_controller;
}
#else
#define 
static inline const struct irq_chip *mips_get_cpu_irqchip(void)
{
        return &mips_cpu_sw_irq_controller;
}
#endif

Hmm?

Thanks,

        tglx

