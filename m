Return-Path: <linux-mips+bounces-4199-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1092B2BB
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 10:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF1E280D35
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 08:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD7915382F;
	Tue,  9 Jul 2024 08:56:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E67515358F;
	Tue,  9 Jul 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515377; cv=none; b=s4CG3zOBZd4pJW0c1Cw+8bE7QqHnVVjMLNP2AC4usmpCPNM45tgfG+n0ukNeN9pY7HQVxBy67bVNw+kFfxxEwaX3onnjsBz3Ec8zklPYfoSkL8xCJ5QLHaeLiPjtbIYewCPIh3J+0Aiy1u6cnsGi+JJ783CzumPXLFbeZcBWRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515377; c=relaxed/simple;
	bh=EhHoDqThhwj4AxFUKCm1hcwewOoKwMRuBfF9IOu/3mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPbaC0MVVIL1uxrxjV4aWsDWXu+3154JCVimmv8yGLWueOfcamvwYoxfowukhlvuUmAqqg7sdAHXrVs97C8qaQXqPhuMO6Me7HtcY9y//kAwf9k63+ArRXQT9veCOwKn+P8QrVVw5pUb4VQnplPFJjCaWey4EzimycBC6OQcZf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sR6dK-0000Pk-00; Tue, 09 Jul 2024 10:55:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1A887C0120; Tue,  9 Jul 2024 10:50:32 +0200 (CEST)
Date: Tue, 9 Jul 2024 10:50:32 +0200
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
Subject: Re: [PATCH v4 01/14] MIPS: CPS: Add a couple of multi-cluster
 utility functions
Message-ID: <Zoz52M6+5Zw/9Uri@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-2-aleksandar.rikalo@syrmia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511104341.151550-2-aleksandar.rikalo@syrmia.com>

On Sat, May 11, 2024 at 12:43:28PM +0200, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> This patch introduces a couple of utility functions which help later
> patches with introducing support for multi-cluster systems.
> 
>  - mips_cps_multicluster_cpus() allows its caller to determine whether
>    the system includes CPUs spread across multiple clusters. This is
>    useful because in some cases behaviour can be more optimal taking
>    this knowledge into account. The means by which we check this is
>    dependent upon the way we probe CPUs & assign their numbers, so
>    keeping this knowledge confined here in arch/mips/ seems appropriate.
> 
>  - mips_cps_first_online_in_cluster() allows its caller to determine
>    whether it is running upon the first CPU online within its cluster.
>    This information is useful in cases where some cluster-wide
>    configuration may need to occur, but should not be repeated if
>    another CPU in the cluster is already online. Similarly to the above
>    this is determined based upon knowledge of CPU numbering so it makes
>    sense to keep that knowledge in arch/mips/. The function is defined
>    in mips-cm.c rather than in asm/mips-cps.h in order to allow us to
>    use asm/cpu-info.h & linux/smp.h without encountering an include
>    nightmare.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> ---
>  arch/mips/include/asm/mips-cps.h | 38 ++++++++++++++++++++++++++++++++
>  arch/mips/kernel/mips-cm.c       | 37 +++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)

applied to mips-next with a #include <linux/cpumask.h> added to
make it compile with my malta config.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

