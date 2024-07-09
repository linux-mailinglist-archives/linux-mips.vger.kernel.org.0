Return-Path: <linux-mips+bounces-4213-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587B92BEB5
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 17:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDFF7B21E6F
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 15:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F8318EFD7;
	Tue,  9 Jul 2024 15:47:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10FE1DFCF;
	Tue,  9 Jul 2024 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540020; cv=none; b=p7WeIL/kw8p6HzwCEKcXKWFtXW0pW8bqsMAb4ivU8B9xCYfKgzs6NTVy6WWZFIbdiA8rMwba8n4zmaLZr/NjxhCTcAK5q3oU3lBfqHizBxmSDDYHT18XtxTEIUKAT8223WaI8Wk2ZAZZj+eDmpPevTJujV6yHHcVEjbWF9B1Q+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540020; c=relaxed/simple;
	bh=ioyj1azS+m2JjFteISlU9nXpPYH9cFxRj4zDAHSRCwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgyzvKohA6ApTMCGxiehjkVL4cBo1bhTmnm9XugoscMWDC3d533x9uUU3S/jFxPD+tNmZ35je+eB3HyvO9Xh/301dk/qqepAplZQb508eBo4IVTNZZo6SIauBhvbXh+1GGk+NEKDulvd2h39RD8VqUIV/k3kQqkiN5rHMiSwST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sRD2h-0004Dh-00; Tue, 09 Jul 2024 17:46:11 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 42C22C031A; Tue,  9 Jul 2024 16:56:50 +0200 (CEST)
Date: Tue, 9 Jul 2024 16:56:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 07/14] clocksource: mips-gic-timer: Always use cluster
 0 counter as clocksource
Message-ID: <Zo1Psqq9VUvW3D96@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-8-aleksandar.rikalo@syrmia.com>
 <bf4a45e9-4ed3-4d3b-bb96-add20a71b04c@linaro.org>
 <8b133053-247f-414b-9c01-e0e5291e347d@app.fastmail.com>
 <Zoz6kvcio/wl/015@alpha.franken.de>
 <4729a8ba-655d-4127-9f14-33b4521b4442@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4729a8ba-655d-4127-9f14-33b4521b4442@linaro.org>

On Tue, Jul 09, 2024 at 04:44:30PM +0200, Daniel Lezcano wrote:
> On 09/07/2024 10:53, Thomas Bogendoerfer wrote:
> > On Tue, Jul 09, 2024 at 09:47:52AM +0800, Jiaxun Yang wrote:
> > > 
> > > 
> > > 在2024年7月9日七月 上午12:36，Daniel Lezcano写道：
> > > > On 11/05/2024 12:43, Aleksandar Rikalo wrote:
> > > > > From: Paul Burton <paulburton@kernel.org>
> > > > > 
> > > > > In a multi-cluster MIPS system we have multiple GICs - one in each
> > > > > cluster - each of which has its own independent counter. The counters in
> > > > > each GIC are not synchronised in any way, so they can drift relative to
> > > > > one another through the lifetime of the system. This is problematic for
> > > > > a clocksource which ought to be global.
> > > > > 
> > > > > Avoid problems by always accessing cluster 0's counter, using
> > > > > cross-cluster register access. This adds overhead so we only do so on
> > > > > systems where we actually have CPUs present in multiple clusters.
> > > > > For now, be extra conservative and don't use gic counter for vdso or
> > > > > sched_clock in this case.
> > > > > 
> > > > > Signed-off-by: Paul Burton <paulburton@kernel.org>
> > > > > Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> > > > > Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> > > > > Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> > > > > ---
> > > > 
> > > > Applied patch 7 and 8
> > > 
> > > I think it won't compile without patch 1 being applid.
> > > 
> > > Thomas, do you mind to apply patch 1 for now? Given that it's just some extra
> > > function definitions.
> > 
> > no problem, I've applied patch 1 und 2 to mips-next.
> 
> Usually we create a shared immutable branch, but as we are close to the PR,
> I propose I ack these two patches and let them go through the mips tree this
> time

works for me, as well.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

