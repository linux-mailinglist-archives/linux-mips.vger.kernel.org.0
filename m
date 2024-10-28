Return-Path: <linux-mips+bounces-6492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9799B319E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 14:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAA701F22534
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 13:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EB71DACB4;
	Mon, 28 Oct 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xd0uaURh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KBHtBEgY"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423642AE8C;
	Mon, 28 Oct 2024 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121852; cv=none; b=is6qlV8Oe3T17JZGdO6azZxMHMVBNGd4FdgjpBUVJSoNdBslpkDpteHvY0IyQMmCNrqaaJcFwjrzCFmaZa1sPlqp04mGcQmHnhajkmFat/l5xHz/Mg5QV1C/jHTXpiNQlauGKPs5E1w4F/FDhVw2vga00OI9FVXBBQVFPzQpSSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121852; c=relaxed/simple;
	bh=OdvquLJql4T6/abFdDOsCg7zFxus9oufaJ6qBWWrzFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G94nfqDPXl5nzoPf0YCHb/4E9n5ES6+pYkBMHeE5XeDH+aXOb+lcc4h6w4RSqOz+4meiUtvxZ79sLLnm21QncvLPmmpTA3hb5JGV/XOuIW5sw/o3V1+YhnoYqxFJYuhNfd+aeirspOtHSKMTk7pEXnZ/ZFZs4FT5pP70cwfFblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xd0uaURh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KBHtBEgY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730121848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhsVqV5jYEkIynG0zz0Qr/t2rcHeHGuuP0ghYC3amZQ=;
	b=xd0uaURhRcPWFXPlgN9+F5xTfkzRZgP2wP566k5nLlON0FZAjNFbTMAwLGoZAJDsbNiABz
	t8kxR+SLIrCA9Zx2506smBI9pfdGCq/EFP92DedCS61HH8/1lWkUvbl5uKczAFCG7+5Mq8
	Jgb4cLvH39qg/58or4RH2sGkaTAtZoUI9MBhndtz85t7/ob47mYLq2kkjmO+pYcdP6sVxd
	AJiwnrTqN9aPhmaPC7sXCwGl2D8gni4LVhSJZIUsJ3y5yU9impvvyKcAuV7D3hyx+71VZF
	pcD42I2Aj8tyYAR38CTJO9XeXjdj8T9eyUU2F2lpvbvNcEMi2rIXfquzJynsZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730121848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhsVqV5jYEkIynG0zz0Qr/t2rcHeHGuuP0ghYC3amZQ=;
	b=KBHtBEgYX/1XuKxlCZzlyr16vfIGMxwA0EbzmS0YlxwlIV5maH8f1PlsXAeBBgddpZ2p2+
	p2moWFIRWK7ytICA==
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>
Subject: Re: [PATCH] irqchip: mips-gic: Handle case with cluster without CPU
 cores
In-Reply-To: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
References: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
Date: Mon, 28 Oct 2024 14:24:08 +0100
Message-ID: <87iktc2wef.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 25 2024 at 17:46, Gregory CLEMENT wrote:
> It is possible to have no CPU cores in a cluster; in such cases, it is
> not possible to access the GIC, and any indirect access leads to an
> exception. This patch dynamically skips the indirect access in such
> situations.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> This patch is a follow-up of the series "MIPS: Support I6500
> multi-cluster configuration"
> https://lore.kernel.org/lkml/20241019071037.145314-1-arikalo@gmail.com/#t

And should be integrated into the next iteration of that series.

Thanks,

        tglx

