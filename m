Return-Path: <linux-mips+bounces-4200-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A937792B2BE
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 10:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B27B280FB6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 08:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7D115442A;
	Tue,  9 Jul 2024 08:56:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D321534E7;
	Tue,  9 Jul 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515377; cv=none; b=qZjxkuodmdQdACJwSG72cadk2StAFlAsDqXEePiiN9PK705iPMjUgvPCPSI5ouIw3huY8b5PFJN7y65AOfgeh/xXnJ4ZMovh4gbpBLo23wPVqStUTifcAorwtV1q8Qem9xLrbPwRUutnAFMQp/+Tcmx55GxY1VP3X5p9TssjWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515377; c=relaxed/simple;
	bh=TVOcFiZ/p6XhrgSQqeZVM6/c0+Hq+nZsNbFJFRnoRRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laXBUZlkjVZEw0wB6QY6QWRj/KXCJdyHzKky9QmCQFZAHV11goOuSDM1Cd0TjPCHFq2aNWPuYoiNjwXIE1TWFN/YQz6COuPXwPsJrJ9E+5/u1E2j+/UMENwSpzQb2dEImNk+jvFIeOybT4S8848HrdSJ/FwuMF/mj+URc3sHxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sR6dK-0000Pi-00; Tue, 09 Jul 2024 10:55:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9C779C0411; Tue,  9 Jul 2024 10:51:00 +0200 (CEST)
Date: Tue, 9 Jul 2024 10:51:00 +0200
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
Subject: Re: [PATCH v4 02/14] MIPS: GIC: Generate redirect block accessors
Message-ID: <Zoz59EqgUZ+1GiHd@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-3-aleksandar.rikalo@syrmia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511104341.151550-3-aleksandar.rikalo@syrmia.com>

On Sat, May 11, 2024 at 12:43:29PM +0200, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> With CM 3.5 the "core-other" register block evolves into the "redirect"
> register block, which is capable of accessing not only the core local
> registers of other cores but also the shared/global registers of other
> clusters.
> 
> This patch generates accessor functions for shared/global registers
> accessed via the redirect block, with "redir_" inserted after "gic_" in
> their names. For example the accessor function:
> 
>   read_gic_config()
> 
> ...accesses the GIC_CONFIG register of the GIC in the local cluster.
> With this patch a new function:
> 
>   read_gic_redir_config()
> 
> ...is added which accesses the GIC_CONFIG register of the GIC in
> whichever cluster the GCR_CL_REDIRECT register is configured to access.
> 
> This mirrors the similar redirect block accessors already provided for
> the CM & CPC.
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> ---
>  arch/mips/include/asm/mips-gic.h | 50 ++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 16 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

