Return-Path: <linux-mips+bounces-7885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85609A3F061
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 10:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD271189BD7E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 09:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1ED2045AE;
	Fri, 21 Feb 2025 09:34:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057AF202C5C;
	Fri, 21 Feb 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130472; cv=none; b=dVmlYYlfe2fByfwUSqrNhHhe+VDuYvlq89x4nnh6yrdyTHz2qxK507lQvrhoDN2rBW+W1S86GQ6pknrZqMcJ4HY2ArdMoAmbIynTwvPzs0kKLnQEtae7kX9wlQeVqAPHAlpVHgSv4UUKblCD363EIhJBVS9W0oNjLRj6idcwZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130472; c=relaxed/simple;
	bh=t0vL2LedbIQ02mNqvNshm9rPPgqB8sr16vgLT3f1JY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mnmpu1t1K/rjvBjcriYouqfh3Uac56UJUq4Gbv/oLjN/T8nYRaXC2bT8msmmL1rF9w02J7DmNh4rLYoE2ccJVy7Rendcihua80CbHYVKZPEZujiY3/nsl08ND165vlepR93UqfmZqSV8LSJSb7YfN+BnJUG4mdNeajgJVtj6SsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlPQJ-0006BV-00; Fri, 21 Feb 2025 10:34:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 04C22C0135; Fri, 21 Feb 2025 10:31:25 +0100 (CET)
Date: Fri, 21 Feb 2025 10:31:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>, Chao-ying Fu <cfu@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v9 0/4] MIPS: Support I6500 multi-cluster configuration
Message-ID: <Z7hH7CYPXynbwAU1@alpha.franken.de>
References: <20250129123250.711910-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129123250.711910-1-arikalo@gmail.com>

On Wed, Jan 29, 2025 at 01:32:46PM +0100, Aleksandar Rikalo wrote:
> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.
> 
> v9:
>  - The changes related to the broken HCI have been removed as they are now part of a different series:
>    https://lore.kernel.org/linux-mips/20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com/
>  - Re-base onto the master branch, with no functionality impact.
> 
> v8:
>  - irqchip: mips-gic: Handle case with cluster without CPU cores.
>  - Add Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com> for the entire series.
>  - Re-base onto the master branch, with no functionality impact.
> 
> v7:
>  - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs,
>    suggested by Gregory Clement.
>  - Re-base onto the master branch, with no functionality impact.
> 
> v6:
>  - Re-base onto the master branch, with no functionality impact.
>  - Correct the issue reported by the kernel test robot.
> 
> v5:
>  - Drop FDC related changes (patches 12, 13, and 14).
>  - Apply changes suggested by Thomas Gleixner (patches 3 and 4).
>  - Add #include <linux/cpumask.h> to patch 1, suggested by Thomas Bogendoerfer.
>  - Add Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org> for the patch 08/11.
>  - Add Tested-by: Serge Semin <fancer.lancer@gmail.com> for the entire series.
>  - Correct some commit messages.
> 
> v4:
>  - Re-base onto the master branch, with no functionality impact.
>  - Refactor MIPS FDC driver in the context of multicluster support.
> 
> v3:
>  - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patch 02/12.
>  - Add the changes requested by Marc Zyngier for the 3/12 patch.
>  - Remove the patch 11/12 (a consequence of a discussion between Jiaxun Yang
>    and Marc Zyngier.
>  - Re-base onto the master branch, with no functionality impact.
> 
> v2:
>  - Apply correct Signed-off-by to avoid confusion.
> 
> Paul Burton (4):
>   clocksource: mips-gic-timer: Enable counter when CPUs start
>   MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
>   MIPS: CPS: Introduce struct cluster_boot_config
>   MIPS: CPS: Boot CPUs in secondary clusters
> 
>  arch/mips/include/asm/mips-cm.h      |  18 ++
>  arch/mips/include/asm/smp-cps.h      |   7 +-
>  arch/mips/kernel/asm-offsets.c       |   3 +
>  arch/mips/kernel/cps-vec.S           |  19 +-
>  arch/mips/kernel/mips-cm.c           |   4 +-
>  arch/mips/kernel/pm-cps.c            |  35 ++--
>  arch/mips/kernel/smp-cps.c           | 285 ++++++++++++++++++++++-----
>  drivers/clocksource/mips-gic-timer.c |   6 +-
>  8 files changed, 307 insertions(+), 70 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

