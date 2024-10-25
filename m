Return-Path: <linux-mips+bounces-6480-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B79D9B127A
	for <lists+linux-mips@lfdr.de>; Sat, 26 Oct 2024 00:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4162C1F22AE5
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 22:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9A321312F;
	Fri, 25 Oct 2024 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SHrIlhLb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F6IU0q1o"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DED217F55;
	Fri, 25 Oct 2024 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729894642; cv=none; b=Dpf3NzgFKO0j/DI0UoU1qGlnzLgTNJqgMcbLVd/hkNfKvbSzWQGqMuVLNAouLr/pke0AOmbm93+5nkG9Aa6dwHGj6gMBYTiLWOXhzhn7GAbQ48QyaTwDHiE+L0uPr35AwNyv4zF3As+xEXRITFLF1uUgymGPgVLiwYE9uPVAXTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729894642; c=relaxed/simple;
	bh=mtbGZpjil+28fARpzuopd5Fvy/s6VHgX8aNdBaj1pik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C9LBf2ps/cuxA4hi3+im1TpgL4w5qpwvINx5t7tVC9oJeiIlWzqMPqhGWz10eXtwNIQETjmv3xz6+cMEXyx21XJkV7LKR98y10uYc4TVkbBpKMExgjJtcpOoAbpREaoZxWW6GTtriAtyXdrHvdv2xcyW1IBhbtJtSO2lUjKPUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SHrIlhLb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F6IU0q1o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729894637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLOPz7LOjz5vyFmLQ0H3XN8GyXO5sZRsk6Wxh2jy4+w=;
	b=SHrIlhLbctf5vz3EFPKzMr5WmohIUTMXszgNAUqtnbQUCJiHHMCBARxIkIiYU4lchJ0rIM
	f8Vt7bZlp5xZEHsd+pLP4K8jCI33FNZLjYIPwfqir/XJJXmaMqw3XHsD/Z08pUgB+BaPRh
	bXi+S3wOOPUTjPOwA3nrfX90CZpHRJGRCfOG0zr4Sv8pSI5+FV46F6hg5/aMYhLuIRImhF
	HpakU3iOXvuO3v+9n30b8UWL9lR697K9OnC2XgWM+QD3vJe814CJPDHDFWqweR1zqV0PnE
	aIZjs/wJR4rIWuZVEq/ILCUU7Im4yaJATinAK/bfUhwy3pB+HkS3f3S0JH2mrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729894637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLOPz7LOjz5vyFmLQ0H3XN8GyXO5sZRsk6Wxh2jy4+w=;
	b=F6IU0q1oEXgwhfYqlwB/avDYk8IOK1BssWYvxADj1jTbhUVr5muLN5c2i9iQwZI0XQyPEg
	iLFNAwBkpFhuU4Dw==
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v7 02/12] irqchip/mips-gic: Support multi-cluster in
 for_each_online_cpu_gic()
In-Reply-To: <20241019071037.145314-3-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
 <20241019071037.145314-3-arikalo@gmail.com>
Date: Sat, 26 Oct 2024 00:17:17 +0200
Message-ID: <87plnn4yky.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Oct 19 2024 at 09:10, Aleksandar Rikalo wrote:

> From: Paul Burton <paulburton@kernel.org>
>
> Use CM's GCR_CL_REDIRECT register to access registers in remote clusters,
> so users of gic_with_each_online_cpu() gain support for multi-cluster with
> no further changes.
>
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

I told you before that you cannot put my Signed-off-by on this. See

  https://lore.kernel.org/all/8734oguovn.ffs@tglx

#1 Please consult your lawyer if you can't figure out what to do here after
   reading through Documentation/process/*

#2 Just for the record, I seriously doubt that the Signed-off-by chain
   above the bogus entry you added for me is valid at all. See #1

Thanks,

        tglx

