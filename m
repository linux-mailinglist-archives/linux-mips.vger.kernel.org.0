Return-Path: <linux-mips+bounces-3849-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD329912E74
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 22:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34B5CB213A7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 20:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335C816D311;
	Fri, 21 Jun 2024 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l8kwNScj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+ZOwR+e0"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B330B16849B;
	Fri, 21 Jun 2024 20:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001430; cv=none; b=ZVjURS9oaOkV2SLvAQoH8eMxzfRlZc5ImY0lvaIFFSxWsGtjDveBHYnwsnSWfy8pNsjD0aP9BbSDkSRi9pv9DIow2R4BWsqfUZxq87Q5/gkYlG/vPwG1rEjenu/cf1tU6FjFJhcHbcOsH4sgPwHO669nXaWzI9j7gHqICxO7bV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001430; c=relaxed/simple;
	bh=z6UOFK+BDqljEbR67bqI/yPZ0v4IfpX/OfeS1hAC6os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pIeSiDvLUTGmbrAds9gGKYWPo05MdjPP/7QmSoJwr2MbandIAjKANve88knFzIFuPjEi3rgYPixmWIC1uShM4nafdIXdJ4NqQJJ9aD5TJzMEmEn0M8iP+Nh9v7E5Ezjewm3+2VCCTzI4jvH+M34+42MACNYW5R/RqiFPaOmNmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l8kwNScj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+ZOwR+e0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719001426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iFtq1vul+FO0S9PKjZBCsPui0uV3aSvISSlH+jCcXMw=;
	b=l8kwNScjIjdPspMHZeUnRbXZK+REFU6ZzXHGES1I411o4PV+ye4NgChqKsH0gYnAfcZAfc
	py4wR+QAOg6NweMSRMbEJa3tgBNkNGlTHlIf//w6gwrlifpOyG04X8nN1i5EcOA0wkg244
	LcAAmux7yod9YBxbBDuBhlPD74eI0GoTkN5p3RYVulLpkpI1AGZ4vaU7XBJh4V4JjWXtmb
	URwZAbQtpk7LGanDmuq1A7PZUAU+uPRFCGf5m+7p/6WvvwC6PgEAqkXJl/bupyhVPxT93V
	iwr5V4sIBulpnfTWMVGfVazpwEIjCp3zAT8O7HQ3xa5XlO9mqPyHDdoClR0CDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719001426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iFtq1vul+FO0S9PKjZBCsPui0uV3aSvISSlH+jCcXMw=;
	b=+ZOwR+e0QZikwWqT1V4yMurl+eCh4+M3wQgGlMI8iIJBs64wY8bO+80oHMTgxEXN2+8F0M
	SzUEWok8qKTIRIBQ==
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
Subject: Re: [PATCH v4 05/14] irqchip: mips-gic: Setup defaults in each cluster
In-Reply-To: <20240511104341.151550-6-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-6-aleksandar.rikalo@syrmia.com>
Date: Fri, 21 Jun 2024 22:23:45 +0200
Message-ID: <87plsam4dq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 11 2024 at 12:43, Aleksandar Rikalo wrote:
> From: Chao-ying Fu <cfu@wavecomp.com>
>
> In multi-cluster MIPS I6500 systems we have a GIC per cluster. The
> default shared interrupt setup that we configure in gic_of_init() will
> only apply to the GIC in the cluster containing the boot CPU, leaving
> the GICs of other clusters unconfigured. Similarly configure other
> clusters here.

We ...

> +	nclusters = mips_cps_numclusters();
> +	for (cl = 0; cl < nclusters; cl++) {
> +		if (cl == cpu_cluster(&current_cpu_data)) {
> +			for (i = 0; i < gic_shared_intrs; i++) {
> +				change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
> +				change_gic_trig(i, GIC_TRIG_LEVEL);
> +				write_gic_rmask(i);
> +			}
> +		} else {
> +			mips_cm_lock_other(cl, 0, 0,
> +					   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);

Please get rid of these line breaks. You have 100 characters available.

