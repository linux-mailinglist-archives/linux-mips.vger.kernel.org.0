Return-Path: <linux-mips+bounces-9844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7AB07CC3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C811A43BF3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAA729B204;
	Wed, 16 Jul 2025 18:22:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C206C2BDC11;
	Wed, 16 Jul 2025 18:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690121; cv=none; b=tMQfrfAsO31wyP2VIyo2XiVgpLJFgBGuOE25I1ZzTURdId5fvWrzXn389wK8ZmxrEyAu0EsupdbzN8ebDhrLKIkHLDvk7jnC1h1Mahd4ZqEgmfK719eylNAS8zAW2ypmuvPFzK00VKS3usKLdxerbO00unOr4dmyfbyoiJ5pkws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690121; c=relaxed/simple;
	bh=/oGziUdPCWQitkZENikuMrSMqJpwa23ft2a99VVyVYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzJY94sQFvaP0IkC8/UP/rkRnemloS6p0DU3HYGSHwWk3HCo8ZEI653j4l9JI2lTaCYyphIinq4mz0uHE2DxEOmC2PyUMRqL7ECkKgYvY2YJ0OoqkmdcLDJAVDR/Fak4XxWJi6VjZPjSzuTL0DPDzHcJCA3OWdIkJjnVEK93jVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZX-0006DR-00; Wed, 16 Jul 2025 20:09:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3D249C09E4; Wed, 16 Jul 2025 20:06:19 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:06:19 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: disable MMID when not supported by the hardware
Message-ID: <aHfqG2yhp3-rVUms@alpha.franken.de>
References: <20250710-mmid_disable_no_ginv_on_noc-v2-1-228aa2056dfa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-mmid_disable_no_ginv_on_noc-v2-1-228aa2056dfa@bootlin.com>

On Thu, Jul 10, 2025 at 04:54:42PM +0200, Gregory CLEMENT wrote:
> It is possible that MMID is supported at the CPU level, but its
> integration in a SoC prevents its usage. For instance, if the
> System-level Interconnect (also known as Network on Chip) does not
> support global invalidation, then the MMID feature is not usable. The
> current implementation of MMID relies on the GINV* instructions.
> 
> This patch allows the disabling of MMID based on a device tree
> property, as this issue cannot be detected at runtime.
> 
> MMID is set up very early during the boot process, even before device
> tree data can be accessed. Therefore, when we determine whether MMID
> needs to be disabled, some MMID setup has already been performed for
> the boot CPU. Consequently, we must revert the MMID setup on the first
> CPU before disabling the feature for the subsequent CPUs that will be
> initialized later.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Since the issue around MMID support cannot be detected at runtime,
> this patch now relies on a device tree property instead of a Kconfig
> option, as requested by Jiaxun and Thomas. However, as I pointed out
> in the commit log, MMID is enabled very early in the boot
> process. Therefore, I had to track all the parts of the kernel where
> MMID was set up before being able to access the device tree.
> 
> I found that MMID was only set up for the first CPU, and I also
> ensured that we can revert the MMID configuration. Indeed, the MMID
> feature is not actively used until paging is set up, which occurs
> later in the boot process.
> 
> Gregory
> ---
> Changes in v2:
> - Remove Kconfig dependencies
> - Rely on device tree property
> - Link to v1: https://lore.kernel.org/r/20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com
> ---
>  arch/mips/include/asm/cpu-info.h |  1 +
>  arch/mips/kernel/cpu-probe.c     | 42 ++++++++++++++++++++++++++++++++++++++--
>  arch/mips/kernel/mips-cm.c       |  5 +++++
>  3 files changed, 46 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

