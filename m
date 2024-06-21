Return-Path: <linux-mips+bounces-3846-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F7912D9E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 20:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECCF3B20B38
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 18:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDD21607A4;
	Fri, 21 Jun 2024 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="slinFZ98";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BiHfac0w"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B418C1E;
	Fri, 21 Jun 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718996325; cv=none; b=icjdCKtTq3VY3lyHJawXmxnUtwLW+ZXPHist+kn7BMxagop2xDlU6jp7DaKYyx+a6MXBvewpQSsbpOhlXmd09U1uiyPbuGIUoaL6yKNxCDi/R6tF+nA1BGvbJ7x83x4ywb4Sm+xE3s6+fiLG5ScvEo3VHPfepjJ7diZqPsrSl10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718996325; c=relaxed/simple;
	bh=tD4A5u5SyoJbQgNnsvaGNzG93wLhXbZFVCJj7C7M5HE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mVFgOIgj2WTr6+szLjLYg0wrEJ53Uvcof2ZcN7JohreFB5aOpdt14XMMDMOCvnw3byXOvMZrWyLUy/czoKleF64Jh1BW06lIl678fPs9ZDkL9Ro1Hda9zEHZxJryBX2xZdWjQzFjerrrL++kWgTAJOqkG96UfXtrXtBeSvhU0Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=slinFZ98; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BiHfac0w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1718996322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RuHWaccsnLhLsqLc1hPkl9TCQWq8GB4+VriT060vGyc=;
	b=slinFZ98Z6ZF2GztYjC6mVmsMkljQFL73yfe1cnfhNK8M97IHdcXK24IInySQJ+4mzjBEA
	5ZKbPMVkVpat3c8MvZ1ur3SsXZo1N1P8HZIb0FSXWZ42dhSA6w/UxRYx8rs2Gt5Ij8FLbv
	4axi7urfyU5DqNXe9JOTQJZos8mvd9uNX1iZfcJFxRaRGvXRxl1kPXG/UPpMDQwElFJUsR
	t9PA3unZHet4tTLU3mIzrtdZ7hXlt1zW9EZU1j2yuYcAmaTT1ouJ5bVbCr+UHhg0p6LObA
	O49II61zmyDEcmtemYNRcA+a6FQnkfZrDwrXqWl5ngCh4sVwRcD2mlrS/5lL3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1718996322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RuHWaccsnLhLsqLc1hPkl9TCQWq8GB4+VriT060vGyc=;
	b=BiHfac0wVxkJd6J5gFWNtuYegX88Wx5TVnrxIewrqVgNGyfIAfT3wHnE2MOy8enOL7dEYy
	bahmH+pcet0E2fBA==
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 03/14] irqchip: mips-gic: Introduce
 for_each_online_cpu_gic()
In-Reply-To: <20240511104341.151550-4-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-4-aleksandar.rikalo@syrmia.com>
Date: Fri, 21 Jun 2024 20:58:41 +0200
Message-ID: <87v822m8bi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 11 2024 at 12:43, Aleksandar Rikalo wrote:
> A few pieces of code in the MIPS GIC driver operate on the GIC local
> register block for each online CPU, accessing each via the GIC's
> other/redirect register block. This patch abstracts the process of
> iterating over online CPUs & configuring the other/redirect region to
> access their registers through a new for_each_online_cpu_gic() macro.
>
> This simplifies users of the new macro slightly, and more importantly
> prepares us for handling multi-cluster systems where the register
> configuration will be done via the CM's GCR_CL_REDIRECT register. By
> abstracting all other/redirect block configuration through this macro,
> and the __gic_with_next_online_cpu() function which backs it, users will
> trivially gain support for multi-cluster when it is implemented in
> __gic_with_next_online_cpu().

Can you please rework the change log according to

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> ---
>  drivers/irqchip/irq-mips-gic.c | 61 +++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index 76253e864f23..9e7182150b5c 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -66,6 +66,52 @@ static struct gic_all_vpes_chip_data {
>  	bool	mask;
>  } gic_all_vpes_chip_data[GIC_NUM_LOCAL_INTRS];
>  
> +static int __gic_with_next_online_cpu(int prev)
> +{
> +	unsigned int cpu;
> +
> +	/* Discover the next online CPU */
> +	cpu = cpumask_next(prev, cpu_online_mask);
> +
> +	/* If there isn't one, we're done */
> +	if (cpu >= nr_cpu_ids)
> +		return cpu;
> +
> +	/*
> +	 * Lock access to the next CPU's GIC local register block.
> +	 *
> +	 * In the single cluster case we simply set GIC_VL_OTHER. The caller
> +	 * holds gic_lock so nothing can clobber the value we write.
> +	 */
> +	write_gic_vl_other(mips_cm_vp_id(cpu));

What unlocks the access? I assume it's magic, but then magic wants to be
documented.

> +
> +	return cpu;
> +}
> +
> +static inline void __lockdep_assert_held(raw_spinlock_t *gic_lock)
> +{
> +	lockdep_assert_held(gic_lock);
> +}

What is exactly the point of this indirection?

> +/**
> + * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
> + * @cpu: An integer variable to hold the current CPU number
> + * @gic_lock: A pointer to raw spin lock used as a guard
> + *
> + * Iterate over online CPUs & configure the other/redirect register region to
> + * access each CPUs GIC local register block, which can be accessed from the
> + * loop body using read_gic_vo_*() or write_gic_vo_*() accessor functions or
> + * their derivatives.
> + *
> + * The caller must hold gic_lock throughout the loop, such that GIC_VL_OTHER
> + * cannot be clobbered.
> + */
> +#define for_each_online_cpu_gic(cpu, gic_lock)		\
> +	for (__lockdep_assert_held(gic_lock),		\
> +	     (cpu) = __gic_with_next_online_cpu(-1);	\
> +	     (cpu) = __gic_with_next_online_cpu(cpu),	\
> +	     (cpu) < nr_cpu_ids;)

That's broken. It resolves to:

     for (cpu = foo(-1); cpu = foo(cpu), cpu < nr_cpu_ids; )

So on entering the loop:

      cpu = foo(-1);    -> cpu == 0

Now it has to evaluate the loop condition which does:

      cpu = foo(cpu)    -> cpu == 1
      ...

So CPU 0 is skipped unconditionally. No?

Aside of that. Instead of this __lockdep_assert_held() obfuscation you
can simply do:

#define for_each_online_cpu_gic(cpu, gic_lock)		\
	guard(raw_spinlock_irqsave)(gic_lock);		\
	for ((cpu) = __gic_with_next_online_cpu(-1);	\
	     (cpu) < nr_cpu_ids;			\
	     (cpu) = __gic_with_next_online_cpu(cpu);)

which simplifies the callsites even further.

Thanks,

        tglx

