Return-Path: <linux-mips+bounces-4287-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136092E7A8
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 13:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 936D61C20EC5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 11:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE8D15B153;
	Thu, 11 Jul 2024 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hOjIV7kF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NhMTLxVk"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6035515B14F;
	Thu, 11 Jul 2024 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698768; cv=none; b=QJG+lKbqEkrQ9j1GOe4mGz2ITRDktC8jJzxVn5iFPgyPryd2lT+rEzrb+tMmGlQPO+oeyi1JYFtjC71RwUbNokjvU3ecMnZyk9/wkyn7J2LrEdOyWhYpRze+03+5ARHtVX66e4yEy7uTv+V3YrPUmk1J7rSm39tBXeu7YNZxLEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698768; c=relaxed/simple;
	bh=p8ScQkWIyu9ab0yXaUSPdA+/sWxuFRxGfY6Eo670r/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DvAiNKri35eaECw8Xcd8bH5M8DUwnE+OrQLO3jLtvWt8t2I1Jnui4pBFDvdlTUIddyaeBFm/C3eGh3hPnUfyCDM5mEIy1yerGlijZgrt3jawJIcsEs7Qzr4nAl8aRXaJxvEUrEkWDjB5FY0Ya7bW5m5dqspacPVF63MjXOjfjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hOjIV7kF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NhMTLxVk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720698764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ScQkWIyu9ab0yXaUSPdA+/sWxuFRxGfY6Eo670r/8=;
	b=hOjIV7kFZFbohDbVe7Q9bCjws0IQXMScAb/HVQHW+C7RALr9ypLJRFzU63BhaZEls+1B4p
	nvI2yiFG2QxkJDOJXBV8CIrEHMRm5uOT43QhXoTvQQ/tJxqMyZRbXW22bpC4mrSyi4AdZr
	cO2lv1Wg7aBVCnJxGYz+RXodCLjs5/Cav33BNWfqnbOU75Rl49nTBwzzNNUY2A1EBh8goc
	zzqoKap/KxdN2KC24/C09zszJ1tvO7cfnLU8dR4Kn/efLwrcMGC53o6wdvqwfs0GcNvSvf
	bJwj4lXsQ5h9fjKUNdmbnJaX0SYTcTdH9iW55Zm3A8BC0770dresbDCDmvhrcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720698764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8ScQkWIyu9ab0yXaUSPdA+/sWxuFRxGfY6Eo670r/8=;
	b=NhMTLxVkF/SftyM5dusPKl/dL0bOyt4x5X741aGr/Cumq5//dg+2xIXqqQ0Mx4BMfOwYBa
	YhasC4IfWxt2OnCA==
To: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v5 03/11] irqchip/mips-gic: Introduce
 for_each_online_cpu_gic()
In-Reply-To: <20240711082656.1889440-4-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
 <20240711082656.1889440-4-arikalo@gmail.com>
Date: Thu, 11 Jul 2024 13:52:44 +0200
Message-ID: <8734oguovn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 11 2024 at 10:26, Aleksandar Rikalo wrote:

> From: Paul Burton <paulburton@kernel.org>
>
> Parts of code in the MIPS GIC driver operate on the GIC local register
> block for each online CPU, accessing each via the GIC's other/redirect
> register block.
>
> Abstract the process of iterating over online CPUs & configuring the
> other/redirect region to access their registers through a new
> for_each_online_cpu_gic() macro.
>
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

I have nothing to do with this patch. I merely suggested you changes in
the review.

