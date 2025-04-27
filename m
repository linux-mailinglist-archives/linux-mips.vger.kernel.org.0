Return-Path: <linux-mips+bounces-8797-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B620AA9E127
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236321A83023
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CC41F4736;
	Sun, 27 Apr 2025 08:48:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D5024A07B;
	Sun, 27 Apr 2025 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743709; cv=none; b=nrX0JJmGN55J7ecRSx7l29xJq9iF7bYFPJknMxNMz8Momrj/K8YQ0BI4dO+65W8XSAGxR75YyQsFDvxLsZf/6MyBriueM363e69XwRUTeouPo6EXC8ghFj6NotP3PVdAZwnDJo+L9vMHzjn7KnN5yVT2E4C+N+0xac56BQaqOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743709; c=relaxed/simple;
	bh=KOtw1zfz20C4ybr5N83Xcrfd/QWf25dIQb3+K8B/fGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1iF98r+J3kl3/VrJUM4C4pYe+3ElTi2HQ0vYtzcoPurpunvKBKntHhSP7OZzMUARKK1riwtpVuRMVepVSxIYdjmdEUz4SrwH4FKB3E9BCI0adJPObjBqBfiv7bGh8rgf46Jrwf3U20BBXQ6YxbBKvSCx/5ROv40bTp/5oc+mjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8wsd-0007Ki-00; Sun, 27 Apr 2025 09:56:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2D2D7C03C4; Sun, 27 Apr 2025 09:53:47 +0200 (CEST)
Date: Sun, 27 Apr 2025 09:53:47 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
Message-ID: <aA3ii5ilAEc-z-ID@alpha.franken.de>
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com>

On Sun, Apr 13, 2025 at 09:12:32PM +0200, Gregory CLEMENT wrote:
> Added support for starting CPUs in parallel on EyeQ to speed up boot time.
> 
> On EyeQ5, booting 8 CPUs is now ~90ms faster.
> On EyeQ6, booting 32 CPUs is now ~650ms faster.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Hello,
> 
> This patch allows CPUs to start in parallel. It has been tested on
> EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. These
> systems use CPS to support SMP.
> 
> As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
> faster.
> 
> Currently, this support is only for EyeQ SoC. However, it should also
> work for other CPUs using CPS. I am less sure about MT ASE support,
> but this patch can be a good starting point. If anyone wants to add
> support for other systems, I can share some ideas, especially for the
> MIPS_GENERIC setup that needs to handle both types of SMP setups.
> 
> Gregory
> ---
>  arch/mips/Kconfig                |  2 ++
>  arch/mips/include/asm/topology.h |  3 +++
>  arch/mips/kernel/smp-cps.c       |  2 ++
>  arch/mips/kernel/smp.c           | 18 ++++++++++++++++++
>  4 files changed, 25 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

