Return-Path: <linux-mips+bounces-6532-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC899B3AA2
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 20:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62BA282762
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B977718E77D;
	Mon, 28 Oct 2024 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OREgAOIl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZoO2GHdk"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A1524C;
	Mon, 28 Oct 2024 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144746; cv=none; b=NjU4RzT3CyTtt85C6vdrbw4to7loqQmO+iKUMvCvOinNRBBrgnRTi+cUZesjs3OtNj0uEnFWTRevHkr8VYutow8cb4DiacNbt/Fdnca2bizmNn4uBgiNeMCCrRpNPgC78enWWQ0KXNYONDZlMapP6NY+rLg2NNjO9mc1kCz/I0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144746; c=relaxed/simple;
	bh=dWXzW9OdAxNBOpcuUtYAZ0dy5OTXyQn4DEo0G3cfyQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jiq1jyR2bwUhWTLuKD+cx08mWlZ/g7nRxNV3j/CWmh7wSjL10p6p7aalhJ/FYpVXTAuvqf0Tqlml7kfvsiVD0nY41UeZ6mwct74Jp0muhtaWO/Lcs8FUXXuVQXl5PEgDN4NFjafs3g8St6aovB2fzDwdoVw6SrPRGE1iHEAA8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OREgAOIl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZoO2GHdk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730144740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LV/cJW54bEOUypztN5jc6/PScSgJuPuoFS6xeGBV3qs=;
	b=OREgAOIl9y6wwE9tgf7xAw4Geho4bcPa2u4Omhe/BTnyy38qwRKdJVvCPfeHLhJfxU7glS
	0amdyRwyckY88mn/DXFw0l4dWt7ZqG8vRxgYcO/4YMfZLvk1TZEdEZniTPXnS7gQziLiYy
	oOrQ7HqKmdlyAj4iHzQ3a3iAAHG+GuFVj61LNeAdbbnG/EHpAlflwye8H9K6j6c8uAih9F
	6I4cHzc+MAcKWhKwd6tIMa0DzqG+F980B5IDe/PIEzxI0hCuwJQXHYSG/uee9Lcypj6NFC
	gVqBSSVgMYMcm16tVd68/925DVSpkA4e/0IiRBvv/46durTOyEBl0C1RJKWonQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730144740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LV/cJW54bEOUypztN5jc6/PScSgJuPuoFS6xeGBV3qs=;
	b=ZoO2GHdkjqw95wk537vluVEpeKIP9VcwkuaQHRo1hUQCCxUYap7pU4+Svf920Fl3fzhefV
	oZOHYtzsiySBemDg==
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Theo Lebrun <theo.lebrun@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Djordje Todorovic
 <djordje.todorovic@htecgroup.com>, Chao-ying Fu <cfu@wavecomp.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH v8 04/13] irqchip/mips-gic: Multi-cluster support
In-Reply-To: <20241028175935.51250-5-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-5-arikalo@gmail.com>
Date: Mon, 28 Oct 2024 20:45:40 +0100
Message-ID: <87wmhs1063.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 28 2024 at 18:59, Aleksandar Rikalo wrote:
> + * In summary, if this function returns true then the caller should access GIC
> + * registers using redirect register block accessors & then call
> + * mips_cm_unlock_other() when done. If this function returns false then the
> + * caller should trivially access GIC registers in the local cluster.
> + *
> + * Returns true if locking performed, else false.
> + */
> +static bool gic_irq_lock_cluster(struct irq_data *d)
> +{
> +	unsigned int cpu, cl;
> +
> +	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
> +	BUG_ON(cpu >= NR_CPUS);
> +
> +	cl = cpu_cluster(&cpu_data[cpu]);
> +	if (cl == cpu_cluster(&current_cpu_data))
> +		return false;

Not that I personally care much about the performance of this. But why
aren't you caching the cluster or at least the target CPU in irq_data
somewhere? cpumask_first() is not cheap on a large system when the cpu
is at the very end of the bitmask. AFAICT nothing here uses chip_data,
so you can do:

       unsigned long cl = (unsigned long)irq_data_get_irq_chip_data(d);

which is a single load operation and you can update it in the
set_affinity() callback and during setup. No?

I'll take the irqchip bits as is if nobody complains within the next
days and you can optimize on top if you care.

Thanks,

        tglx

