Return-Path: <linux-mips+bounces-12935-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DAD21405
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 22:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 307EF3006A4A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 20:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CED357A47;
	Wed, 14 Jan 2026 20:59:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F398357A3B;
	Wed, 14 Jan 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424396; cv=none; b=nwWsSI9H4iuH5HZT45wBH2bx9KzizcvalkKrGS5ym2jMT8P5h7yAfQfAiS32SKtjPutjrjNqJnRjRJmkXSXjzRUIrqdxi9Hv2sw5CUCOq7QVDa4lv6i9lIa+1am/YylqPgaVHK8F9W3tGG7ohsjafMp17yBvpXgrtn1aoVZwn0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424396; c=relaxed/simple;
	bh=OEWyzuN0H71u69bE0P6wp/K6sas77uBgNdwrxzMb3Bw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dY4zdvhRamuMjsgBobDRwRhdARlcs38v6oxphj5uuEzyDkzHova0JMG9LK4bKG4NhYtKZ3bh4BeRguk57HPAnl/iyiDucAxVqz32PsDxYVyEeUNvExD7FzVxLV9HdW4jyIRF3fRO9r3Xitm1QRz2y4NhlQTAt+nDk0uvadfSB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CBABC92009C; Wed, 14 Jan 2026 21:59:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C90FC92009B;
	Wed, 14 Jan 2026 20:59:52 +0000 (GMT)
Date: Wed, 14 Jan 2026 20:59:52 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Nicolas Pitre <npitre@baylibre.com>, linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
In-Reply-To: <20260114173435.51cf556d@pumpkin>
Message-ID: <alpine.DEB.2.21.2601141950110.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com> <20260113200455.3dffe121@pumpkin> <alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk> <20260114103103.216aa122@pumpkin> <alpine.DEB.2.21.2601141530510.6421@angie.orcam.me.uk>
 <20260114173435.51cf556d@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, David Laight wrote:

> > 	dmul	$2,$5,$6	 # 9	[c=20 l=4]  muldi3_mul3_nohilo
> > 	dmuhu	$5,$5,$6	 # 10	[c=44 l=4]  umuldi3_highpart_r6
> > 	daddu	$7,$2,$7	 # 14	[c=4 l=4]  *adddi3/1
> > 	sltu	$2,$7,$2	 # 16	[c=4 l=4]  *sltu_didi
> > 	sd	$7,0($4)	 # 21	[c=4 l=4]  *movdi_64bit/4
> > 	jr	$31	 # 44	[c=0 l=4]  *simple_return
> > 	daddu	$2,$2,$5	 # 29	[c=4 l=4]  *adddi3/1
> > 
> > (hmm, I wonder why the cost for the high-part RTX is over twice that for 
> > the low-part one; this seems outright wrong, also taking the possibility 
> > of fusing into account).
> 
> They might be different, if the wide multiply is implemented with multiple
> narrow ones then the high result bits don't need to be generated if only
> the low result bits are needed.

 Well, it's GCC that has DImode multiplication in `muldi3_mul3_nohilo' RTX 
but then TImode one combined with a shift and a truncation operation in 
`umuldi3_highpart_r6' RTX, and then applies some generic cost figures to 
the respective complete expression.  Instead the MIPS backend ought to 
provide the correct cost in both cases.

 Given the technology involved with MIPS MDUs I'd expect the same latency 
for both operations (DMULT/U used to produce both parts in one operation, 
but required a dedicated MDU accumulator register, which complicated both 
the pipeline and instruction scheduling in the compiler), and indeed e.g. 
the figures for the MIPS I6500 CPU give the latency of 4 for both DMUL/U 
and DMUH/U each.  That would be 16 in terms of GCC insn costs, as that's 
cycles multplied by 4 so as to allow "fractional" costs in special cases, 
and while using 20 instead is not too bad, the value of 44 is way off as 
it's almost triple the actual cost.

 Incidentally, the repeat rate is 1 for all these instructions, so the 
multiplier is fully pipelined in the I6500 implementation.  No fusion is 
mentioned though.

> If those are gcc's costs I suspect they may not match reality, after all they
> usually only have to be 'good enough' or 'reasonable'.

 Well, they need to be good enough for the compiler not to come up with a 
worse alternative, such as e.g. with repeated addition when one of the 
operands is immediate.

  Maciej

