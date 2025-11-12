Return-Path: <linux-mips+bounces-12216-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BACC54D50
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 00:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3EC3346C92
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 23:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733ED25D208;
	Wed, 12 Nov 2025 23:47:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383A1C2BD;
	Wed, 12 Nov 2025 23:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991266; cv=none; b=aS/vuJ6H5C2ts4CVRrVRCjx8h4EBso/8BJ9XPzLTQOEq+HOY1qS5oZ3uJExm4ZE21zZJMgRIhiCArMjB8OwJw2cXOcbfnPjEVulI+OU4oCITdJZItkWLUO/B1tgwoLI82HJdEOg2G/wsOgK1HFACF4QSrfqAMwg+OdmmLkoxFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991266; c=relaxed/simple;
	bh=wj6zWnzx+RJYwATqI4vHF86YXU+OlrXFmsLHg7q0G+Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P1JYQZdDJFFQU4aEZgz55RnlO9vDfWkMPXi3fzPyi6yV3RJpfeMA1+9+YeKop7lii0nOf5MbDDz87QVOrEI3bEUDePAxB6QukGaQH4uM3AD2B3i3uuLVYrH8qTRWzu5ycFBo26A9PixdgEAZtiP9VM9wHb4pUlybSBaJFYB6ark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DC55392009C; Thu, 13 Nov 2025 00:47:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CEDD192009B;
	Wed, 12 Nov 2025 23:47:42 +0000 (GMT)
Date: Wed, 12 Nov 2025 23:47:42 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
In-Reply-To: <aRSXxKacvz4h9_Th@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511121802260.25436@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk> <aRMrmjJcLJYR8QO-@alpha.franken.de> <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk> <aRRZtbBdCfEEhad9@alpha.franken.de> <alpine.DEB.2.21.2511121046350.25436@angie.orcam.me.uk>
 <aRSXxKacvz4h9_Th@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Nov 2025, Thomas Bogendoerfer wrote:

> > > Update on the issue: Your patch is good and the segmentation faults,
> > > I'm seeing, have IMHO a different reason. Instead of removing the call
> > > to r4k_tlb_uniquify() I've replaced the jal in the binary with a nop.
> > > And the issue is still there with this patched kernel. I've seen
> > > something similair on a R12k Octanes, which comes and goes probably
> > > depeding on code layout. So far I wasn't able to nail this down :-(
> > 
> >  Oh dear!  Something to do with the cache?  Or code alignment perhaps?
> 
> code alignment is probably the trigger. It's reproducible on an R4400SC
> and R5000 Indy, but not on a R4000SC Indy. Main difference other than
> clock speed is L1 cache size...

 So both combined!  Trust my guts' feeling. ;)  At least you now have a 
reproducer you can fiddle with.  But good luck with debugging as this 
stuff can be tough!

> And I've missremembered the R12k Octane problem. It's not a segmentation
> fault but a bus error, because of an illegal instruction. I tracked it
> down to a incorrect data in I-Cache (all 0 cache line, iirc), but never
> found the reason for that.

 Bummer!

> > > Do you want to send a v2 of the patch ? I'm fine with the current version
> > > for applying...
> > 
> >  I'll send v2 with an update for the Wired register as we talked.  It may 
> > take a day or two.
> 
> no problem, thank you.

 Now posted.  It's often good to sleep on things (an afternoon nap in this 
case).  Thanks for taking the Malta fix BTW.

  Maciej

