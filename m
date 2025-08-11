Return-Path: <linux-mips+bounces-10053-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94DB20957
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 14:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2C0318A473B
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 12:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BCA25393B;
	Mon, 11 Aug 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P+SwpmTJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6OkO09b5"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5959217709;
	Mon, 11 Aug 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916772; cv=none; b=cVpMIw/lo3jxBVXbyPdq8QRF7iPMR1RQ47RmWvLUv9sJc7HHZCjgZsWiwXLIjT5jBkVXMAwbv7hNWqDUB0ezon9fCBVCno2FE45Pymaaohc7nK6AJOAs6pIbLHIIGFGral8Lkjfj7J3DeX1s/oK5KKbzpr+JCR2oUXFMg9E0Iok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916772; c=relaxed/simple;
	bh=789mkSTOHiZ7pRR4fC3eijxb1s0QPMpnLD0wjVRR360=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AJFLtHKE9QQYphavGWMyIt9m9Y5TXiVFbSmYvIjXqCezZbfiuoiuVpYEdp1OYCHUO3opcv97LZpgwJfgyqCLJwm2jurgHEMmsymktBDZ5yBz8sAysV9iZHWJYPBlv41LSLzCScZxJ4h/em54+Ibkqe9WUnfs24qW+nJP+dkhgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P+SwpmTJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6OkO09b5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754916768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z8wb/yQcraBD38A6ZGHYoXhCAbkH7/ii4JJPfnbEvOY=;
	b=P+SwpmTJB1x2jNcuFUAHaluKSlCKiJuebZIYRBo5LFBQ9lEXLBfIq7/iAPPylOYpfx54Jd
	wdmfSHUjTeri6geIuPz+/5zBEwMWHIBqwaYqAxJdD1dljQKnRY7wCjT+ZLQ88H8ZC+SK7o
	D9h2upzLrRk6wF+Zbj6pZepPdjDNFoaSqwkkz7P8mT4np5hbRRWwkIxatkjqllQKcf5o3f
	J0Rk17d5wH1xz3rrO//pKwVaBLEeoa/IX4AJZIbcksQ+DzGcvVNGQf6JcN0mDvxWFcFKXU
	0Z5ff0DEoHeEFCRluJLduKnPdEDkjVpzGI2QkHaK/9fDXEaHIdo/efSzGi5z0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754916768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z8wb/yQcraBD38A6ZGHYoXhCAbkH7/ii4JJPfnbEvOY=;
	b=6OkO09b5uefLLQygsaYrxy4/iIH6iDnvW2eOBtCYNvtDrER4xoq4YKH0PZuEFSXTXXMwMr
	pPGuAV5UXewH+pDg==
To: patchwork-bot+linux-riscv@kernel.org, Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, atenart@kernel.org,
 andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 chenhuacai@kernel.org, jiaxun.yang@flygoat.com, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent
 domain
In-Reply-To: <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
References: <cover.1750860131.git.namcao@linutronix.de>
 <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
Date: Mon, 11 Aug 2025 14:52:47 +0200
Message-ID: <87ecti81gg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 10 2025 at 21:12, patchwork-bot wrote:

> Hello:
>
> This series was applied to riscv/linux.git (fixes)
> by Thomas Gleixner <tglx@linutronix.de>:
...
> Here is the summary with links:
>   - [01/12] irqdomain: Add device pointer to irq_domain_info and msi_domain_info
>     https://git.kernel.org/riscv/c/858e65af9135
...
> You are awesome, thank you!

I know that I'm awesome, but this broken patchwork bot is _not_

Why the hell does it waste electrons and inbox space on stuff which is

    A) applied on a different tree

    B) already upstream


