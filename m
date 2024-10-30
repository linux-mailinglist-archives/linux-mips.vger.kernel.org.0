Return-Path: <linux-mips+bounces-6557-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA59B6149
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA4F2832B4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612021E572B;
	Wed, 30 Oct 2024 11:19:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722C71E1C1C;
	Wed, 30 Oct 2024 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287195; cv=none; b=cfe7L1E2vuxE/0cBgFuh/o6Ehyde5ltdx48KVwe9bJTgy8KUFiMg0EpRKO/j/mAEoO7g1iUEZ6YK8xfkPZRkwoTYgPCbpoRUS5379SMeJyx10MxAMC0a24i++16BWKVH7EgX1ftjvDaFinVlZr35aKP9xcx6JxbW7v9YAYwo0bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287195; c=relaxed/simple;
	bh=2LeRGLpOM4mO/tTEoXGWL1stdFet/fgOwC3vANeEbi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/o2de+wrP1usm+J2rYM1gA648wWgcmctMLrew2KiOjzrO+JUEB9/MS1Yy+It7AuhvFOlqQF1VNHeE+0KYN/8URUhpWuf2P+p7CBW3iSsmTdWDUD2fi8SGsuEStPsAvhRAcS9e96KAp3Zrnit52ZxeceNVSpNAFPfgNlRidf/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t66jk-00061Z-00; Wed, 30 Oct 2024 12:19:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 26234C0660; Wed, 30 Oct 2024 12:16:50 +0100 (CET)
Date: Wed, 30 Oct 2024 12:16:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] MIPS: Allow using more than 32-bit addresses for
 reset vectors when possible
Message-ID: <ZyIVom8HlxdKwDQx@alpha.franken.de>
References: <20241011-eyeq6h-smp-v2-1-8381edf8a5c6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-eyeq6h-smp-v2-1-8381edf8a5c6@bootlin.com>

On Fri, Oct 11, 2024 at 03:34:08PM +0200, Gregory CLEMENT wrote:
> While most MIPS64 CPUs use 32-bit values for their VP Local Reset
> Exception Base registers, some I6500 CPUs can utilize a 64-bit value,
> allowing addressing up to 47 bits of physical memory.
> 
> For the EyeQ6H CPU, where physical memory addresses exceed the 4GB
> limit, utilizing this feature is mandatory to enable SMP support.
> 
> Unfortunately, there is no way to detect this capability based solely
> on the ID of the CPU. According to Imagination, which designed the
> CPU, the only reliable method is to fill the reset base field with
> 0xFF and then read back its value. If the upper part of the read-back
> value is zero, it indicates that the address space is limited to 32
> bits.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Hello,
> 
> The following patch enables SMP on EyeQ6H SoCs.
> 
> It was successfully tested on EyeQ5 and EyeQ6H, as well as on MIPS32
> CPUs such as ocelot on board PCB123 and JZ4780 on CI20. However, I
> must admit that none of these platforms ran SMP. The ocelot has only
> one core, and while the JZ4780 does have SMP capabilities, its support
> is not yet available in the mainline kernel.
> 
> In the first version, I forgot to remove a line from
> check_64bit_reset() that was originally used to print debug
> information, but is no longer required. Sorry for the inconvenience.
> 
> Gregory
> ---
> Changes in v2:
> - Removed a leftover line of code that was used during development
> - Link to v1: https://lore.kernel.org/r/20241011-eyeq6h-smp-v1-1-866417772cd7@bootlin.com
> ---
>  arch/mips/include/asm/mips-cm.h |  2 ++
>  arch/mips/kernel/smp-cps.c      | 46 ++++++++++++++++++++++++++++++++++-------
>  2 files changed, 41 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

