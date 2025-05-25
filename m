Return-Path: <linux-mips+bounces-9103-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF01AC3641
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 20:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7661891E25
	for <lists+linux-mips@lfdr.de>; Sun, 25 May 2025 18:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504881F8724;
	Sun, 25 May 2025 18:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DU3jpDVZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G0yWucKp"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D828DD0;
	Sun, 25 May 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748198410; cv=none; b=mptpVeW1X5A3LL921rY8uNmQIWmizvQXrmdrfGP5q3Ir/aKJtD11y7DzHI8E+Qkv7EXm7uo1LuRSOl0J4NkT29hAaFEUqEtmjzkdyFUTORmdmMV2U/yni43t6E3dMxEQdquWAsPpg31PGrGE0l8Qtutu4uuFtNgVqBV48rzacYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748198410; c=relaxed/simple;
	bh=kHSp76zFoxeSUgVBGIw/6WuJNJM5jnC/fA8Ys6gqaWA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mg0zgUfM5bMWtPkSiy18VgtsE1t691yFbB24pfGTTB4kOHXn0XRTifUWEIGyWS24nPpOB6oeSMOJVMFx11u4lltWq5mIwNY0oRBQeQpW/TEQwKksUsiyDSXJFgzIW+cEQqW278MFUbVYQs4BxFhnJZXXIWdZEEBTaq9SavYW/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DU3jpDVZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G0yWucKp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748198405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DL5eKWdLvzxwxUjFjhBRDJn82TzenWqENC7E1vpzwRY=;
	b=DU3jpDVZBQFB/cqh02tFCXi5WwhB0P/pvyb6KtI+xKvqvr40r5G6IRiUX5BzN2N8Jjnmwn
	JOGcyCsGRCEGNzuYBKJyRGBeM7frVVDW165+i38FG6gSgsPx4AMDeYLNAxSGrgs5HGG8r+
	GfwDXUOmT7pFV8c3+Zb7Kxf5oRR8R0d1LEIeIKXS9Kjh7LCWQYiOSgGmGXwgzbSRekwe2e
	TJ8y2VgP/A+e7rlYuLjXo4xZAK2VjrhA6XiS3YDzSr/kqb4J8XcJKuCVXAWo2uca8yU3YF
	j0S9J5532ESRd4+NKJpt8EjAYG6k+YAMfBoYIWIMuulRDOrrVe7jyXOXDruN1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748198405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DL5eKWdLvzxwxUjFjhBRDJn82TzenWqENC7E1vpzwRY=;
	b=G0yWucKpXuN2fNO1U0HdxGIAauj8takyJTVZ01biqkkjH3U7RqOxFqA4WmTLl1b28s6lPl
	pf4Px72G3N2CgKDg==
To: markus.stockhausen@gmx.de, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 s.gottschall@dd-wrt.com
Subject: Re: AW: [PATCH] irqchip/mips-gic: allow forced affinity for current
 cpu during hotplug
In-Reply-To: <043701dbcd59$73bcfb70$5b36f250$@gmx.de>
References: <20250523151542.3903598-1-markus.stockhausen@gmx.de>
 <87bjrhqcn8.ffs@tglx> <043701dbcd59$73bcfb70$5b36f250$@gmx.de>
Date: Sun, 25 May 2025 20:40:04 +0200
Message-ID: <878qmkr0u3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 25 2025 at 11:43, markus stockhausen wrote:
>> Von: Thomas Gleixner <tglx@linutronix.de> 
>>
>> On Fri, May 23 2025 at 11:15, Markus Stockhausen wrote:
>> > +
>> > +	if ((cpu >= NR_CPUS) && !force)
>> > +		/* In normal mode allow only online CPUs. */
>> >  		return -EINVAL;
>> >  
>> > +	if (cpu >= NR_CPUS) {
>> > +		/* In force mode allow current not yet online CPU for
> hotplug handlers. */
>> > +		cpu = cpumask_first(cpumask);
>> > +		if (cpu != get_cpu())
>> > +			return -EINVAL;
>> > +	}
>>
>> This logic really makes my brain hurt. Why not doing the obvious:
>>
>>	if (cpu >= NR_CPUS) {
>>         	/* Sensible comment */	
>>         	if (!force)
>>                 	return -EINVAL;
>>                 ...
>>         }
>
> Then what about an even more relaxed and cleaner version like in other
> drivers?
>
> If (force)
>   cpu = cpumask_first(cpumask);
> else
>   cpu = cpumask_first_and(cpumask, cpu_online_mask);

Fine with me.


