Return-Path: <linux-mips+bounces-12376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29964C93D98
	for <lists+linux-mips@lfdr.de>; Sat, 29 Nov 2025 13:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8ED13A6FE5
	for <lists+linux-mips@lfdr.de>; Sat, 29 Nov 2025 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFDF1DE8AD;
	Sat, 29 Nov 2025 12:42:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEFE78F3A;
	Sat, 29 Nov 2025 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420174; cv=none; b=OlGDgA4n8uGU3fWdl7wM+hjjiYRsOPHBJB7vBpqcSYKx8cEuiRdbRRBIoa1ArgF5up5rUj37ppYTb8Lxt30iTRIuZvEmtfjuzzaEeAEIG5VBTfBEixZxL8tkW2VRCR0qEgTjOBZS0dWDLcGfcD6tCygV5kx7A5PqcvTK4DlGUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420174; c=relaxed/simple;
	bh=MKxH2Oe7j2aGE34YrTg6BoJqrkLq0/blJuER2M3Txus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btrzVycfNlx3Ym2LB9xsgE3k39p9dQd8e2iRbwSpgesFZhxAOh9kjKADgRQp/tH/YjhUKemyoyOJ2UKhT3R29mTRdwuCFB3VsIRqZj4wv90N3se360xII7T1hayLF7dO/M9Na9KUfeNMS9r4FlAnwhJ+KF6AOXbuz7MAb1Lyca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vPKHf-0000ic-00; Sat, 29 Nov 2025 13:42:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6F8C4C0256; Sat, 29 Nov 2025 13:42:30 +0100 (CET)
Date: Sat, 29 Nov 2025 13:42:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: mm: kmalloc tlb_vpn array to avoid stack
 overflow
Message-ID: <aSrqNv5xupUXLo6d@alpha.franken.de>
References: <alpine.DEB.2.21.2511281647170.36486@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511281647170.36486@angie.orcam.me.uk>

On Fri, Nov 28, 2025 at 04:53:46PM +0000, Maciej W. Rozycki wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+ 
> cores can have more than 64 TLB entries.  Therefore allocate an array 
> for uniquification instead of placing too small an array on the stack.
> 
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TLB shutdown on initial uniquification
> Cc: stable@vger.kernel.org # v6.17+
> ---
>  Verified with Malta/74Kf and Malta/interAptiv for initial and secondary 
> CPU bootstrap.  The PM path hasn't been covered, but is expected to be 
> the same as secondary CPU bootstrap.
> 
>  NB Malta/interAptiv has issues later on in SMP boot (boots fine UP) and 
> hangs with repeated:
> 
> irq 23: nobody cared (try booting with the "irqpoll" option)
> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.18.0-rc1-dirty #2 NONE
> 
> messages (for the CP0 timer interrupt AFAICT; GIC timer is supposed to 
> be used instead).  This will have to be bisected.
> 
> Changes from v4:
> 
> - Mark `r4k_tlb_uniquify' `__ref' so as to silence `modpost'.
> 
> Changes from v3:
> 
> - Rearrange tags including stable backport ones so as to pick the original 
>   change together with this fix only.
> 
> Changes from v2:
> 
> - Use the bootmem allocator for early calls (CPU #0 bootstrap).
> 
> - Update the change description; mark for stable backporting.
> ---
>  arch/mips/mm/tlb-r4k.c |   18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

