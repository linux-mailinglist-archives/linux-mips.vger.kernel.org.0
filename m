Return-Path: <linux-mips+bounces-9839-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE33B07CB3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F893B9F61
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164EF293C60;
	Wed, 16 Jul 2025 18:21:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EE6293454;
	Wed, 16 Jul 2025 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690105; cv=none; b=MqNFQFvgDwksdRjvNsNeiqWcXV+XrYt83k18UVP+rGwEo7sGz9Hic4N5zINWYoRbZxAeD64mbA0FLpr0Saw7Ysr4e9CwSJyPT2X2tEV73GVB8RULQMklQG8ZfqJSm6LHVBFcsIGb5LtqK2yS5iGjgx78AlVx2Ox8wN4NKfHztbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690105; c=relaxed/simple;
	bh=EFMoox8yHjk0Xql4TGbVjS/QwkVvUS+xPPnSLQfWEcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lq4TqPOT6OFpR36Sltr/AXV4P/cTAUr/25zD6j+HH0E3XMYxU56Rl2TGGKFDBDXJltuVvFv/OxZz0eZScSoWpoSCVw9BbvYd3DZ0yJ48hI+sqAxa7qC3/LEgITau+gUrIKF0WHaIFi+L2VmGn8g3tryiZH08evMadkt3lfBKbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZX-0006DT-00; Wed, 16 Jul 2025 20:09:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 037D6C0B23; Wed, 16 Jul 2025 20:06:39 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:06:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] MIPS: CPS: Optimise delay CPU calibration and
 cluster helper function
Message-ID: <aHfqLjX_Ml3AnjEH@alpha.franken.de>
References: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-smp_calib-v4-0-1e743b225bcc@bootlin.com>

On Fri, Jul 11, 2025 at 11:54:19AM +0200, Gregory CLEMENT wrote:
> This series allow booting faster by reusing the delay calibration
> across the CPU belonging of the same cluster. While doing it we now
> reuse the mips_cps_first_online_in_cluster() that we improve also.
> 
> This series enables faster booting by reusing delay calibration across
> CPUs within the same cluster. During this process, we reuse the
> improved mips_cps_first_online_in_cluster function.
> 
> With the introduction of this series, a configuration running 32 cores
> spread across two clusters sees a significant reduction in boot time
> by approximately 600 milliseconds.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Changes in v4:
> - Fix build issue reported by kernel test robot <lkp@intel.com>
>   at https://lore.kernel.org/all/aG3AJ2XnH2JKOjzY@rli9-mobl/#t
> - Add reviewed-by tags from Jiaxun
> - Link to v3: https://lore.kernel.org/r/20250708-smp_calib-v3-0-6dabf01a7d9f@bootlin.com
> 
> Changes in v3:
> - Do not depend anymore of a Kconfig entry (suggested by Jiaxun).
> - cpumask for cluster filled now later in cps_prepare_cpus().
> - Patch 2 of the v2 has been removed.
> - Link to v2: https://lore.kernel.org/r/20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com
> 
> Changes in v2:
> - Add a patch improving mips_cps_first_online_in_cluster()
> - Use mips_cps_first_online_in_cluster() in calibrate_delay_is_known()
>   as suggested by Jiaxun
> - Link to v1: https://lore.kernel.org/r/20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com
> 
> ---
> Gregory CLEMENT (2):
>       MIPS: CPS: Improve mips_cps_first_online_in_cluster()
>       MIPS: CPS: Optimise delay CPU calibration for SMP
> 
>  arch/mips/include/asm/mips-cps.h |  4 +++-
>  arch/mips/include/asm/smp-cps.h  |  1 +
>  arch/mips/kernel/mips-cm.c       | 47 ++++++++++++++--------------------------
>  arch/mips/kernel/smp-cps.c       | 16 +++++++++++++-
>  4 files changed, 35 insertions(+), 33 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

