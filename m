Return-Path: <linux-mips+bounces-12202-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADEC523B3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 13:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 694A6188E068
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 12:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6B327787;
	Wed, 12 Nov 2025 12:16:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFCC327217;
	Wed, 12 Nov 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949799; cv=none; b=JoNIUKvjo5gmxsvPHkpcy7Bc9UqCeEg1pL7RCOIiyLeb8RHJ5ZWNalxVKCGE9YF1rKDodRMW5gvhlZZfRTy95FcM9L36PWuei1R3asZc43GLAjFafIQqIf8ixX/FvpYCyQB+KqJJGnvv1xZimr2jSCzuneHMbVDcnrLPo8LTI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949799; c=relaxed/simple;
	bh=vU1wr0tRxqgLdrwPfflTOnIKU6LiQ8IF96XCZSZkYq4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jb3uDJWWwN6pQvTse5gPGeuQQJaUrtss+aylWjkd2sTTpEf0I+2GFSuGNfvAZxT+2nhqUEtuukQP+xRdMmmntJSnXQiCijivUkbf5Rd/UEjN5vznFE5oGAFjTGRpKIgT+lt5+LaV7eSdLJOGWFv4Ef6+cuYl1M8sHvmMYx0u7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C45D292009C; Wed, 12 Nov 2025 13:16:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BD36392009B;
	Wed, 12 Nov 2025 12:16:28 +0000 (GMT)
Date: Wed, 12 Nov 2025 12:16:28 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
In-Reply-To: <aRRZtbBdCfEEhad9@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2511121046350.25436@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk> <aRMrmjJcLJYR8QO-@alpha.franken.de> <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk> <aRRZtbBdCfEEhad9@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Nov 2025, Thomas Bogendoerfer wrote:

> >  Can you try the diagnostic patch below, which is what I used to verify 
> > this change, and report the entries produced?  Otherwise I wonder whether 
> > I haven't missed a barrier somewhere.
> 
> Update on the issue: Your patch is good and the segmentation faults,
> I'm seeing, have IMHO a different reason. Instead of removing the call
> to r4k_tlb_uniquify() I've replaced the jal in the binary with a nop.
> And the issue is still there with this patched kernel. I've seen
> something similair on a R12k Octanes, which comes and goes probably
> depeding on code layout. So far I wasn't able to nail this down :-(

 Oh dear!  Something to do with the cache?  Or code alignment perhaps?

 It reminds me of this stuff: 
<https://lore.kernel.org/r/Pine.GSO.3.96.1010625125007.20469D-100000@delta.ds2.pg.gda.pl/>.  

 Building a particular version of binutils freezed the machine solid ~11h 
into the build -- a power cycle was required (there's no hardware reset 
button).  At least it was fully reproducible and always at the same place 
in a `configure' script and changing the shell script in a trivial way, 
such as adding a new-line character, ahead of the place of the lock-up 
made the freeze go away.

 I used the machine's 8-position diagnostic LED display to debug this, by
making it show the syscall and hardware interrupt numbers as the exception 
handlers were entered, so as to narrow the origin down (only to realise 
later on I could have used a 1MiB NVRAM module the system has to store 
more data across a power cycle and retrieve it afterwards, a persistent 
kernel log of sorts).  IIRC it triggered in the exit(2) path.

 The most painful was the need to wait said ~11h for the next piece of 
data in debugging this.

 NB the machine in question is still alive in my lab.  Throwing memory SBE 
ECC errors again recently, but coping regardless, so more memory connector 
cleaning required upon next visit.

> Do you want to send a v2 of the patch ? I'm fine with the current version
> for applying...

 I'll send v2 with an update for the Wired register as we talked.  It may 
take a day or two.

  Maciej

