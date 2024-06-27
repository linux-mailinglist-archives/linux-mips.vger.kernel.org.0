Return-Path: <linux-mips+bounces-3987-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AA91A4DE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6934B21594
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75819147C8B;
	Thu, 27 Jun 2024 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/FT9R3k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCF79FD;
	Thu, 27 Jun 2024 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487035; cv=none; b=TxFZRr89XfB3wQPNTVj2NhM4IVB2iq9/veYvhttG2eN4x1eHBUQcqWgcSNXtECDQnWM1zObECPvnSoR7PwpA99BkhPMeYD/mMhDD/k5VqbAmmaLHyHjjJeMUvbH4hMHc+bDoNVzS+Tgcm5NsouaKUqWvDk25EZpfVyNpwzx1ibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487035; c=relaxed/simple;
	bh=YwOu/W4GzrmoTRHNUY+hAdb3vZbiH7HY9bUPgadHHms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yu3lyXE8LQq5dzFCv0b4MXytv9vGh21bnms80w1Xrwb1pYC8nqfejLadqrB3RnQ8BnkUt8UVf9yutWLpcQBzjxGvwnUuQQ86ycYQBWgr2ZVUOkwCd5d9a180z9Jvkn7rtP76jDQ0ITuzpB+MwrGGHHahURceocgXxPqr7TiWKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/FT9R3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E743BC2BBFC;
	Thu, 27 Jun 2024 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719487034;
	bh=YwOu/W4GzrmoTRHNUY+hAdb3vZbiH7HY9bUPgadHHms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q/FT9R3kPP4BJoxIm4dqhZprcVjgwO9PhLDgRW5O2oP4R3U9+5SfbAETOYJbA/4lx
	 oEoBTr8fjDMf1s9xiYR2J6NFpAXRRFrjIuhl24IVGLan7DxlpBJzparF2cIuvnS4m5
	 Guph6YKUtlkLRTvIa1G6LjK31lTIsGZn15Lw0SXEQaufksvJBLIuD7z9lclxjvR6yN
	 JFa076beXKMNrOto3yGdbcCQRewl2Z/jP0UKCm+vOU8bEyHQWy/P59jmldWkyWIXt0
	 PVjM+wPHmPUeZUX2/ssTj5+JGpS9IB9mCtPlP+jP4CjKvVHr8aDKskFu4ZyYK9cOyg
	 iRV8MDQqdcGCw==
Date: Thu, 27 Jun 2024 13:17:07 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org, sander@svanheule.net,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, ericwouds@gmail.com, Markus Stockhausen
 <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v3 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Message-ID: <20240627131707.3410b4d3@dellmb>
In-Reply-To: <20240627043317.3751996-8-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
	<20240627043317.3751996-8-chris.packham@alliedtelesis.co.nz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Jun 2024 16:33:15 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> +/* Simple internal register functions */
> +static inline void rttm_set_counter(void __iomem *base, unsigned int counter)
> +{
> +	iowrite32(counter, base + RTTM_CNT);

These require #include <asm/io.h>

> +/* Aggregated control functions for kernel clock framework */
> +#define RTTM_DEBUG(base)			\
> +	pr_debug("------------- %d %p\n",	\
> +		 smp_processor_id(), base)

#include <linux/printk.h>

> +static irqreturn_t rttm_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = dev_id;
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	rttm_ack_irq(to->of_base.base);
> +	RTTM_DEBUG(to->of_base.base);
> +	clkevt->event_handler(clkevt);

Although you include "timer-of.h", which includes clockchips.h, please
do also explicit #include <linux/clockchips.h>

> +	rttm_set_period(to->of_base.base, RTTM_TICKS_PER_SEC / HZ);

HZ -> linux/jiffies.h, or maybe asm/param.h

> +static u64 rttm_read_clocksource(struct clocksource *cs)
> +{
> +	struct rttm_cs *rcs = container_of(cs, struct rttm_cs, cs);
> +
> +	return (u64)rttm_get_counter(rcs->to.of_base.base);

Redundant cast to u64.

> +	rttm_enable_timer(rcs->to.of_base.base, RTTM_CTRL_TIMER,
> +			  rcs->to.of_clk.rate / RTTM_TICKS_PER_SEC);

Is this correct? Sometimes it makes sense to use DIV_ROUND_CLOSEST, but
maybe not here.

> +static u64 notrace rttm_read_clock(void)
> +{
> +	return (u64)rttm_get_counter(rttm_cs.to.of_base.base);

Redundant cast to u64.

> +static int __init rttm_probe(struct device_node *np)
> +{
> +	int cpu, cpu_rollback;

unsigned int?

> +	struct timer_of *to;
> +	int clkidx = num_possible_cpus();

linux/cpumask.h, unsigned int

Marek

