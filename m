Return-Path: <linux-mips+bounces-12203-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCDC52AEC
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F16134280D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0035F339B28;
	Wed, 12 Nov 2025 14:21:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C6C28B4E2;
	Wed, 12 Nov 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957269; cv=none; b=ECOEMhKVsZomOyOMe+U64xGlRleWsMaaxyHgb/D/9yy+0k8uU6GzM02fRnSXX3Rb2DqjR3xMCuOmV2lb4VdbAIB2MnqEoAM+JtItwRd5DCScQ0XBMQy9aCfwnAGQpkickNq+OGZrcrZAsF9ICxRv6mD0jBN5/4AmC4s1sLdYmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957269; c=relaxed/simple;
	bh=SRYLvUDpCdqP6YtexjQVy4seZnryfA4m9OxdvHn18eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN+5A5NjsGJlmoEIp9X4LFlsrrXmZvxs7AJiS6CrgKaKlRvJO70VUkXPr5L3dl0UTJYFmV1CxnY3l6sETa1xWlE4vq9k8mCnvmmT2F1Z/YJu3zBW8170XsbcpoFK6SyUresvE9607pykPv7mYMdodPudFMj3J4goifkd7CtKl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vJBiY-0006j4-00; Wed, 12 Nov 2025 15:21:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5881BC0256; Wed, 12 Nov 2025 15:20:52 +0100 (CET)
Date: Wed, 12 Nov 2025 15:20:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <aRSXxKacvz4h9_Th@alpha.franken.de>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>
 <aRMrmjJcLJYR8QO-@alpha.franken.de>
 <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk>
 <aRRZtbBdCfEEhad9@alpha.franken.de>
 <alpine.DEB.2.21.2511121046350.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511121046350.25436@angie.orcam.me.uk>

On Wed, Nov 12, 2025 at 12:16:28PM +0000, Maciej W. Rozycki wrote:
> On Wed, 12 Nov 2025, Thomas Bogendoerfer wrote:
> 
> > >  Can you try the diagnostic patch below, which is what I used to verify 
> > > this change, and report the entries produced?  Otherwise I wonder whether 
> > > I haven't missed a barrier somewhere.
> > 
> > Update on the issue: Your patch is good and the segmentation faults,
> > I'm seeing, have IMHO a different reason. Instead of removing the call
> > to r4k_tlb_uniquify() I've replaced the jal in the binary with a nop.
> > And the issue is still there with this patched kernel. I've seen
> > something similair on a R12k Octanes, which comes and goes probably
> > depeding on code layout. So far I wasn't able to nail this down :-(
> 
>  Oh dear!  Something to do with the cache?  Or code alignment perhaps?

code alignment is probably the trigger. It's reproducible on an R4400SC
and R5000 Indy, but not on a R4000SC Indy. Main difference other than
clock speed is L1 cache size...

And I've missremembered the R12k Octane problem. It's not a segmentation
fault but a bus error, because of an illegal instruction. I tracked it
down to a incorrect data in I-Cache (all 0 cache line, iirc), but never
found the reason for that.

> > Do you want to send a v2 of the patch ? I'm fine with the current version
> > for applying...
> 
>  I'll send v2 with an update for the Wired register as we talked.  It may 
> take a day or two.

no problem, thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

