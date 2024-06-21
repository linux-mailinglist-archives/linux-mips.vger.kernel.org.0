Return-Path: <linux-mips+bounces-3848-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC5912E70
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 22:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78C51F27193
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 20:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC82116B732;
	Fri, 21 Jun 2024 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DnNfLW/b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0rXQJ7U3"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A11416849B;
	Fri, 21 Jun 2024 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001314; cv=none; b=ESvjFaebymtTWWIFwtb2IA1Mb5sNLRUmz/FeBNjhijuc8GPifjPNXvxAwMUljE2ru6kCAbUdwCoxCieYHzVTc2avTlbN2OpaA3QOdvcqwm+4nZKm/mipztAqnxJZcvCOAusGMVwMrIewcJ6yU/l3IjoNdfUc6+mY3WBvs7ZBDPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001314; c=relaxed/simple;
	bh=Boj2Z+grM+gfZ64rTto8rPtLcCuX8GZ23pfF+5fgq0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UQWbbe+h9evWftHE4RPHu2KA/haq0Jk/20Nx17HMmxH+DCo9yDAlQuHFVkU9gILx5LPMgy7m0oP1Y+KCn51xMHn6tQVt/dVBbDS4maujR1VkkyCWlPzaW8hw6ncHz+xS5rVJL6Ptp+jji4BKaqtnOx3aQm30/Bab0kjlVypOxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DnNfLW/b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0rXQJ7U3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719001311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4lsx8f9TYNOd8SucPBY9EWfWUAhnz2U9CTVv/68dhJY=;
	b=DnNfLW/bh9wkezsEyVeCrUu1VXQUPZhopnBm+UIZqVOoHFjaiu8Gc1trBGUQ+m0lvLRyvU
	vRd7yvU/yzX475PT+Ap+QRhrkIYkJDPf+MKQVPmks7zaBp0ucQiaeq2/ah3OUrV4QH3vOy
	+BKDCojBUrdhaXwIOUqiCAlsSHG7IqurPUxlMi/onZ3DlHuWGNCu1ovQTGEn/Y9cVTRpw/
	/xFLSxTO1ouD31vMensYp+tQbW1C4PG67O1K/efgfT9jDh6OsaeYURmHTt3KZWdOm8SOui
	n4B0qeuR8R9/ktOLrsGOGlq3p7BNRVb46bsuLB+zhTjFbsZ6o9GV9jw7MudJHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719001311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4lsx8f9TYNOd8SucPBY9EWfWUAhnz2U9CTVv/68dhJY=;
	b=0rXQJ7U32eVikTpLGALaf5cl3MmXZ2BDG+AHIliAxje6KTvVgRD7Q2P7N3oT/TqjA3WZZw
	aCx0an2n8uzxRuAg==
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
Subject: Re: [PATCH v4 04/14] irqchip: mips-gic: Support multi-cluster in
 for_each_online_cpu_gic()
In-Reply-To: <20240511104341.151550-5-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-5-aleksandar.rikalo@syrmia.com>
Date: Fri, 21 Jun 2024 22:21:50 +0200
Message-ID: <87sex6m4gx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 11 2024 at 12:43, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
>
> Introduce support for multi-cluster GIC register access in
> __gic_with_next_online_cpu(), and therefore in its user
> for_each_online_cpu_gic(). We access registers in remote clusters
> using the CM's GCR_CL_REDIRECT register, and so here we delegate
> to mips_cm_lock_other() in order to configure this access.

Again: We do nothing. See docs.

> @@ -70,6 +70,20 @@ static int __gic_with_next_online_cpu(int prev)
>  {
>  	unsigned int cpu;
>  
> +	/*
> +	 * Unlock access to the previous CPU's GIC local register block.
> +	 *
> +	 * Delegate to the CM locking code in the multi-cluster case, since
> +	 * other clusters can only be accessed using GCR_CL_REDIRECT.
> +	 *
> +	 * In the single cluster case we don't need to do anything; the caller
> +	 * is responsible for maintaining gic_lock & nothing should be
> +	 * expecting any particular value of GIC_VL_OTHER so we can leave it
> +	 * as-is.
> +	 */
> +	if ((prev != -1) && mips_cps_multicluster_cpus())
> +		mips_cm_unlock_other();

Eew.

static inline void gic_unlock_cluster(void)
{
	if (mips_cps_multicluster_cpus())
		mips_cm_unlock_other();
}

#define for_each_online_cpu_gic(cpu, gic_lock)		\
	guard(raw_spinlock_irqsave)(gic_lock);		\
	for ((cpu) = __gic_with_next_online_cpu(-1);	\
	     (cpu) < nr_cpu_ids;			\
             gic_unlock_cluster(),			\
	     (cpu) = __gic_with_next_online_cpu(cpu);)

No?

Thanks,

        tglx

