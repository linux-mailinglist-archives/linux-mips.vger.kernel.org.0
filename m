Return-Path: <linux-mips+bounces-12320-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C6C79096
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 13:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60E954E85FA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 12:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56F3314D2F;
	Fri, 21 Nov 2025 12:40:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C463F9D2;
	Fri, 21 Nov 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763728857; cv=none; b=rDa3peJtNe2DS25ZPA9rfanj1fvZADADnEmDDqcO3SnLHflTUANmDgvVJk9Oq/Rwdm0nRCNS9+LNcmf6KjLjCfSwnAAQCU3DBEPQgke6w+7hBhgllwtyfb9ehY2ON13pGMJHN4XXmzIhKnAwTJQoTvx/clePjE3Pk3ereOAS1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763728857; c=relaxed/simple;
	bh=Irk4BhrrIH79QspeneUzYjiXLSyf7WdKzZSwCfjvALk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LojouKcFev6d/9zy4XLKFt9q31ur7tSU46oxQeM8KmBetQI1pa1d/XbKifxoEB9SmM/Guzy85MOF5yxpcRFZQf/f0pcO5C5fleMRDr0ggMgcAI1vtGVQW8p72/Wrhz0AAsKjmp46S714cggWR4+hxQNAgX8da/4zdQuaili2tL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vMQRQ-0005wA-00; Fri, 21 Nov 2025 13:40:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 75D48C06A7; Fri, 21 Nov 2025 13:26:02 +0100 (CET)
Date: Fri, 21 Nov 2025 13:26:02 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <aSBaWtlPi99lTlPA@alpha.franken.de>
References: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>

On Thu, Nov 13, 2025 at 05:21:10AM +0000, Maciej W. Rozycki wrote:
> Depending on the particular CPU implementation a TLB shutdown may occur 
> if multiple matching entries are detected upon the execution of a TLBP 
> or the TLBWI/TLBWR instructions.  Given that we don't know what entries 
> we have been handed we need to be very careful with the initial TLB 
> setup and avoid all these instructions.
> 
> Therefore read all the TLB entries one by one with the TLBR instruction, 
> bypassing the content addressing logic, and truncate any large pages in 
> place so as to avoid a case in the second step where an incoming entry 
> for a large page at a lower address overlaps with a replacement entry 
> chosen at another index.  Then preinitialize the TLB using addresses 
> outside our usual unique range and avoiding clashes with any entries 
> received, before making the usual call to local_flush_tlb_all().
> 
> This fixes (at least) R4x00 cores if TLBP hits multiple matching TLB 
> entries (SGI IP22 PROM for examples sets up all TLBs to the same virtual 
> address).
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Cc: stable@vger.kernel.org # v6.17+
> ---
> Hi,
> 
>  On second thoughts I decided against including wired entries in our VPN 
> matching discovery for clash avoidance.  The reason is as I wrote before 
> it makes no sense to have wired entries for KSEG0 addresses, so it should 
> be safe to assume we won't ever make one, and then if a wired entry maps a 
> large page, which is quite likely, then our clash avoidance logic won't 
> handle an overlap where the two VPN values of a clashing pair don't match, 
> so it makes no sense to pretend we can handle wired entries with the code 
> as proposed.
> 
>  Pasting v2 discussion below verbatim as it still applies.
> 
>  Verified the same way as before, also with some diagnostics added so as 
> to make sure things get set up correctly, with my Malta/74Kf system for a 
> 32-bit configuration and with my SWARM/BCM1250 system for a 64-bit one.
> 
>  In addition to the Wired register setup discussed with v1 I have realised 
> the incoming entries may include large pages, possibly exceeding the size 
> of KSEG0 even.  Such entries may overlap with our temporary entries added 
> in the second step, so truncate any large pages in place as this ensures 
> no clash happens with the received contents of the TLB.
> 
>  NB this doesn't handle incoming PageGrain.ESP having been set, but it's 
> an unrelated preexisting issue that would have to be handled elsewhere.  
> Possibly it doesn't matter in reality.
> 
>  Additionally PageMask is left set at what has been retrieved from the 
> last incoming TLB entry in the first step and has to be reset to our page 
> size before proceeding with the second step.
> 
>  And last but not least the comparator function returned 0 incorrectly 
> when the difference between 64-bit elements was positive but with none of 
> the high-order 32 bits set.  Fixed with a branchless sequence of 3 machine 
> instructions, which I think is the minimum here (only the sign and zero 
> matter here, but this sequence actually produces -1/0/1, because why not).
> No change for the 32-bit case, the difference is returned as is.
> 
>   Maciej
> 
> Changes from v2 (at 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk/>):
> 
> - Revert the v2 update to include wired entries while reading original 
>   contents of TLB.
> 
> Changes from v1 (at 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk/>):
> 
> - Also include wired entries while reading original contents of TLB.
> 
> - Truncate any large pages in place while reading original TLB entries.
> 
> - Reset PageMask to PM_DEFAULT_MASK after reading in TLB entries.
> 
> - Fix the 64-bit case for the sort comparator.
> ---
>  arch/mips/mm/tlb-r4k.c |  100 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 63 insertions(+), 37 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

