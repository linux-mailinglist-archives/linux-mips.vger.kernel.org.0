Return-Path: <linux-mips+bounces-3809-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C389115DF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 00:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB3328547C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 22:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04F913E8AE;
	Thu, 20 Jun 2024 22:50:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9429713D278;
	Thu, 20 Jun 2024 22:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718923835; cv=none; b=GHoPH7GCa6SKStVW9KWdNo/Z/5TgKe6ybDdsfQavNk14GcnWj5x1PfZXaYdza5ExjsSubNGXmR7s3WulOhSc2KCuSILFhXzKbObBDdDWIA2jbap9dz48Koozzrgf9cZVcHzgY4OhKbAnL4Tz77CTAsxD2H/bGLMYpqsG4DFDk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718923835; c=relaxed/simple;
	bh=oSKSOYFT9/nCHPQC1B2PtLLsa8reG7yPhsLXdoMpHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnSfsY977Q3mquYcthZPAly0rtm9ac2srwn5ftdG8T2fJwBQO4qoFczl8Kz/PHz8Ldu03hgUObe9RTdef76nxNGS6wlIPL3hMxN2tuxVu7QDNTrahZQS4qOqNO0Dun8Kp43Xovswrh0fdQ3ObWyBz3ndc3usoEReHuHm92LVDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sKQbF-0005AE-00; Fri, 21 Jun 2024 00:49:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AFC3CC0120; Thu, 20 Jun 2024 19:56:48 +0200 (CEST)
Date: Thu, 20 Jun 2024 19:56:48 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Message-ID: <ZnRtYFr5HFffyK7E@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>

On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.

which existing CPUs can use this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

