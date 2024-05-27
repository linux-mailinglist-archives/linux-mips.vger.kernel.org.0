Return-Path: <linux-mips+bounces-3333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3038D0695
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 17:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E5A1F22896
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 15:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6831717E90A;
	Mon, 27 May 2024 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I4v0fBz3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2OWIUhQr"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2FD17E8E2;
	Mon, 27 May 2024 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825088; cv=none; b=ZMapQBCGkFxJTnIge/3A0Wv6rOBJ3nN8nfsmq7OB/xkIgFkxKjKZvCWLiVHUhej9q+NZvfg5++MHypnqx1d8DZ+OvMkwQnsj2wrPf9HoWywIyXyH2A0u9tYPcQgqJjexr8JdxEiqNybB3qUC8l1UoYW95TI5fc5HChjXpSoKONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825088; c=relaxed/simple;
	bh=6i4gd8J4KRT2ZQgVgP185Z+O7p9xL8wu8xsohxPyeKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ItXQE/X3kprV177f6u5VmCps07gMNWS3VvGI3aneBGiAuJuS8VfbGxHjuPBYGvilcVEVR/PAVQSJQs3M8WEB2Nf9IlCYdqUt60TgOUU+0Zrh1kP5SuP6I/KgRDrUSS1XEqt3Nl2VS9Dudady42wAGYeS6usen4BOZTuodctRi6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I4v0fBz3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2OWIUhQr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716825085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iWrH8s0HgipnxikmiKvoWS+Y3TJn/3HsJ/qkGf8lcaY=;
	b=I4v0fBz3bJImtrw8YX/tQPY9d4C5qdDuLZprK7pfqNybqDRHzCnieIVcSjCMdqOIsNlddX
	WpOw2tBHYLf4PoiS4h1BZf84hHuTknyjIXU6XbaORSLV3ii0jA2KulQpeOWNynLGgr97qo
	/44IQ+8OakKxfiHvKJNcEfsZsLM11sKNu2O9TKSCAR8qWntmTAWlek3WVnP+hn9ifbmQvx
	mElh4VMht95N2BZV2zek9zR/XhZRzS1Hh46sP5Gv6D/3nUcmReEfwdYV1SICHnD0o63TqX
	ZRuIbjv8DskE9DvtSisIdFp9/u6rrrrVwDjvDQlBDs1BmHnQXMl6oU1M2jWTxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716825085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iWrH8s0HgipnxikmiKvoWS+Y3TJn/3HsJ/qkGf8lcaY=;
	b=2OWIUhQrmt1EzQTNsZ0eAKLiptoz2yrlLQPIZ/7qyCJA5MmeIct02qNJuqlW2weJszwd1j
	alAOtzRCAixG/oBg==
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2] clocksource: Add node counter timer driver for
 MIPS/Loongson64
In-Reply-To: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
Date: Mon, 27 May 2024 17:51:25 +0200
Message-ID: <87sey3b6de.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiaxun!

On Fri, May 17 2024 at 18:13, Jiaxun Yang wrote:

> +static void __iomem *nodecnt_reg;
> +static u64 (*nodecnt_read_fn)(void);
> +
> +static u64 notrace nodecnt_read_2x32(void)
> +{
> +	unsigned int hi, hi2, lo;
> +
> +	do {
> +		hi = readl_relaxed(nodecnt_reg + 4);
> +		lo = readl_relaxed(nodecnt_reg);
> +		hi2 = readl_relaxed(nodecnt_reg + 4);
> +	} while (hi2 != hi);
> +
> +	return (((u64) hi) << 32) + lo;
> +}
> +
> +static u64 notrace nodecnt_read_64(void)
> +{
> +	return readq_relaxed(nodecnt_reg);
> +}
> +
> +static u64 notrace nodecnt_read_csr(void)
> +{
> +	return csr_readq(LOONGSON_CSR_NODECNT);
> +}
> +
> +static u64 nodecnt_clocksource_read(struct clocksource *cs)
> +{
> +	return nodecnt_read_fn();

What's this indirection for? Why dont you update 

> +static struct clocksource nodecnt_clocksource = {
> +	.name	= "nodecnt",
> +	.read	= nodecnt_clocksource_read,

the read function pointer here and spare the indirection?

Thanks

        tglx

