Return-Path: <linux-mips+bounces-12930-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0DD1FF09
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 16:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 875003012A68
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ABD3043D2;
	Wed, 14 Jan 2026 15:50:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8421827EFE3;
	Wed, 14 Jan 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405813; cv=none; b=uBUHv2iCmVCTCiQj4x0ZOUtCs2x/TI09FuLaJUfpRZItsyLeuTp5vxNM0JmxLbY7YjRWp85I/TM1DdrFTbZQnNtgohmohgLyb0zPYCrWkUaL62xuBlEsl8RVjuTFnoat7HDVAspWgUIO7d1B7xwqDkYhab3psxIYj1udA/Vobgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405813; c=relaxed/simple;
	bh=b98o8QvyMyqsI+6z/xVkO7RazIkosqV7Vue/bqsARyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cxPu1njFiByR4mgf889m7JFm9nfFCDkhKfq+WD8CSThGeYA8/6kXk6egxtH4PI6DGwIRn2v+/9Ca6q0eNV8vBK2mkQY7ABQ8pA3Onz7UcAhzJ1G/9SoxgKjp0gYsaZlY9yHZ2TlXWVfioYb0GoscaObxM/ISXW+fZb6K122lxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0168592009C; Wed, 14 Jan 2026 16:50:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EE58392009B;
	Wed, 14 Jan 2026 15:50:09 +0000 (GMT)
Date: Wed, 14 Jan 2026 15:50:09 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Nicolas Pitre <npitre@baylibre.com>, linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
In-Reply-To: <20260114103103.216aa122@pumpkin>
Message-ID: <alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com> <20260113200455.3dffe121@pumpkin> <alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk> <20260114103103.216aa122@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, David Laight wrote:

> > > Looking at the git log for that file there is a comment that includes:
> > > 	"we wouldn't expect any calls to __multi3 to be generated from
> > > 	 kernel code".
> > > Not true....
> > > Not sure why the link didn't fail before though, something subtle must
> > > have changed.
> > > 
> > > I think the fix is just to remove the gcc version check.  
> > 
> >  Or rather fix the version check.  The GCC fix went in with GCC 10:
> 
> Does that mean the GCC 10 generates the multiply instructions and never calls
> __multi3?
> (Rather than just not using __multi3() for that specific example.)

 Of course it still does call `__multi3' for 128x128bit multiplication.  
It doesn't for widening 64x64bit one though, which was a missed case for 
MIPS64r6 only, having been supported by GCC ever since MIPS III ISA.  I 
think we do want to fail link in the 128x128bit case.

> In this case gcc knows the high bits are all zero - so just needs the two
> instructions to generate the high and low parts.

 Distinct RTL insns are produced, so all the usual RTL optimisations 
apply (in addition to any tree optimisations already made):

mul_u64_u64_add_u64:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	dmul	$2,$5,$6	 # 9	[c=20 l=4]  muldi3_mul3_nohilo
	dmuhu	$5,$5,$6	 # 10	[c=44 l=4]  umuldi3_highpart_r6
	daddu	$7,$2,$7	 # 14	[c=4 l=4]  *adddi3/1
	sltu	$2,$7,$2	 # 16	[c=4 l=4]  *sltu_didi
	sd	$7,0($4)	 # 21	[c=4 l=4]  *movdi_64bit/4
	jr	$31	 # 44	[c=0 l=4]  *simple_return
	daddu	$2,$2,$5	 # 29	[c=4 l=4]  *adddi3/1

(hmm, I wonder why the cost for the high-part RTX is over twice that for 
the low-part one; this seems outright wrong, also taking the possibility 
of fusing into account).

  Maciej

