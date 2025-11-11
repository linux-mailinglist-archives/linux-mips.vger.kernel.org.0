Return-Path: <linux-mips+bounces-12198-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C415C5005F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 23:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C3E3B11E9
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 22:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E12F2D130B;
	Tue, 11 Nov 2025 22:53:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A022BD5BB;
	Tue, 11 Nov 2025 22:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901610; cv=none; b=B2TAYMVMVSUuHG5RlhhH0idfMqZhE9nG04YkxUH7wnuVx1muV5KlfFb1f60Y+HJTouqcF3PNygP6/AWNYV7y8tspVs76BRodaqLyG5nRaiLRbTn+izwNYjt9aJATWLRRkYvSwUHYPjwc9ZeSnjYkbGwDexNEckB6cti4yR2ykFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901610; c=relaxed/simple;
	bh=XYuqOEfha+PxXmzn+clpAC7s3OffKnVuZbAqtfFdrU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXOs8ClCLCshkItnCuaJKbJDZm6WbxbqLiMh2bbfJlHMi6TOATcenRaMsOxTmcFP0GP5kqX3jPtUfezLbpnmkyfen9Yj2VXb8uwwIm5H/tgGFomDW3dHMmAvKCpoOw2IjKDftVt4E7JpZuHkXedlD9UCh3M2yt/Jexa5QqI0SCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vIxEi-0005rn-00; Tue, 11 Nov 2025 23:53:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7D739C0256; Tue, 11 Nov 2025 23:53:00 +0100 (CET)
Date: Tue, 11 Nov 2025 23:53:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <aRO-TDaljXzgZfps@alpha.franken.de>
References: <alpine.DEB.2.21.2511110547430.25436@angie.orcam.me.uk>
 <aRMrmjJcLJYR8QO-@alpha.franken.de>
 <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511111340330.25436@angie.orcam.me.uk>

On Tue, Nov 11, 2025 at 03:41:50PM +0000, Maciej W. Rozycki wrote:
> On Tue, 11 Nov 2025, Thomas Bogendoerfer wrote:
> 
> > >  Can you please give it a try with your systems?
> > 
> > it's booting on my R4400 SGI Indy, but I see a lot of segmentation
> > faults during system start. If I comment out r4k_tlb_uniquify() every-
> > thing boots fine, which is kind of strange as there is a local_flush_tlb_all(),
> > which should leave the TLB in the same stage.... No idea why, yet.
> 
>  Can you try the diagnostic patch below, which is what I used to verify 
> this change, and report the entries produced?  Otherwise I wonder whether 
> I haven't missed a barrier somewhere.

output below, I don't see anything obvious. I dumped the TLB after the
local_flush_tlb_all() and everything looks as before.

> 
> > > +
> > > +	for (i = start, cnt = 0; i < tlbsize; i++, cnt++) {
> > 
> > shouldn't we read all TLB entries here ? 
> 
>  Strictly speaking it won't change anything as we call `write_c0_wired(0)' 
> in `r4k_tlb_configure' before getting here and wired entries make no sense 
> for KSEG0, so whatever would otherwise be there should not clash with our 
> unique entries.

I see

>  NB I wonder how this is supposed to work with mapped kernels, I thought 
> the setup made with MAPPED_KERNEL_SETUP_TLB was meant to be permanent 
> through the life of the system, hmm...

I looked at it once some time ago and already forgot details :-(

Thomas.


[00/00]: 80000000/80000000
[01/01]: 80000000/80000000
[02/02]: 80000000/80000000
[03/03]: 80000000/80000000
[04/04]: 80000000/80000000
[05/05]: 80000000/80000000
[06/06]: 80000000/80000000
[07/07]: 80000000/80000000
[08/08]: 80000000/80000000
[09/09]: 80000000/80000000
[0a/0a]: 80000000/80000000
[0b/0b]: 80000000/80000000
[0c/0c]: 80000000/80000000
[0d/0d]: 80000000/80000000
[0e/0e]: 80000000/80000000
[0f/0f]: 80000000/80000000
[10/10]: 80000000/80000000
[11/11]: 80000000/80000000
[12/12]: 80000000/80000000
[13/13]: 80000000/80000000
[14/14]: 80000000/80000000
[15/15]: 80000000/80000000
[16/16]: 80000000/80000000
[17/17]: 80000000/80000000
[18/18]: 80000000/80000000
[19/19]: 80000000/80000000
[1a/1a]: 80000000/80000000
[1b/1b]: 80000000/80000000
[1c/1c]: 80000000/80000000
[1d/1d]: 80000000/80000000
[1e/1e]: 80000000/80000000
[1f/1f]: 80000000/80000000
[20/20]: 80000000/80000000
[21/21]: 80000000/80000000
[22/22]: 80000000/80000000
[23/23]: 80000000/80000000
[24/24]: 80000000/80000000
[25/25]: 80000000/80000000
[26/26]: 80000000/80000000
[27/27]: 80000000/80000000
[28/28]: 80000000/80000000
[29/29]: 80000000/80000000
[2a/2a]: 80000000/80000000
[2b/2b]: 80000000/80000000
[2c/2c]: 80000000/80000000
[2d/2d]: 80000000/80000000
[2e/2e]: 80000000/80000000
[2f/2f]: 80000000/80000000
[00]: 80000000
[01]: 80000000
[02]: 80000000
[03]: 80000000
[04]: 80000000
[05]: 80000000
[06]: 80000000
[07]: 80000000
[08]: 80000000
[09]: 80000000
[0a]: 80000000
[0b]: 80000000
[0c]: 80000000
[0d]: 80000000
[0e]: 80000000
[0f]: 80000000
[10]: 80000000
[11]: 80000000
[12]: 80000000
[13]: 80000000
[14]: 80000000
[15]: 80000000
[16]: 80000000
[17]: 80000000
[18]: 80000000
[19]: 80000000
[1a]: 80000000
[1b]: 80000000
[1c]: 80000000
[1d]: 80000000
[1e]: 80000000
[1f]: 80000000
[20]: 80000000
[21]: 80000000
[22]: 80000000
[23]: 80000000
[24]: 80000000
[25]: 80000000
[26]: 80000000
[27]: 80000000
[28]: 80000000
[29]: 80000000
[2a]: 80000000
[2b]: 80000000
[2c]: 80000000
[2d]: 80000000
[2e]: 80000000
[2f]: 80000000
[00/00/30]: 80060000/80000000
[00/01/30]: 80060000/80000000
[00/02/30]: 80060000/80000000
[00/03/30]: 80060000/80000000
[00/04/30]: 80060000/80000000
[00/05/30]: 80060000/80000000
[00/06/30]: 80060000/80000000
[00/07/30]: 80060000/80000000
[00/08/30]: 80060000/80000000
[00/09/30]: 80060000/80000000
[00/0a/30]: 80060000/80000000
[00/0b/30]: 80060000/80000000
[00/0c/30]: 80060000/80000000
[00/0d/30]: 80060000/80000000
[00/0e/30]: 80060000/80000000
[00/0f/30]: 80060000/80000000
[00/10/30]: 80060000/80000000
[00/11/30]: 80060000/80000000
[00/12/30]: 80060000/80000000
[00/13/30]: 80060000/80000000
[00/14/30]: 80060000/80000000
[00/15/30]: 80060000/80000000
[00/16/30]: 80060000/80000000
[00/17/30]: 80060000/80000000
[00/18/30]: 80060000/80000000
[00/19/30]: 80060000/80000000
[00/1a/30]: 80060000/80000000
[00/1b/30]: 80060000/80000000
[00/1c/30]: 80060000/80000000
[00/1d/30]: 80060000/80000000
[00/1e/30]: 80060000/80000000
[00/1f/30]: 80060000/80000000
[00/20/30]: 80060000/80000000
[00/21/30]: 80060000/80000000
[00/22/30]: 80060000/80000000
[00/23/30]: 80060000/80000000
[00/24/30]: 80060000/80000000
[00/25/30]: 80060000/80000000
[00/26/30]: 80060000/80000000
[00/27/30]: 80060000/80000000
[00/28/30]: 80060000/80000000
[00/29/30]: 80060000/80000000
[00/2a/30]: 80060000/80000000
[00/2b/30]: 80060000/80000000
[00/2c/30]: 80060000/80000000
[00/2d/30]: 80060000/80000000
[00/2e/30]: 80060000/80000000
[00/2f/30]: 80060000/80000000
[00/30/30]: 80060000/00010000
[01/30/31]: 80062000/00010000
[02/30/32]: 80064000/00010000
[03/30/33]: 80066000/00010000
[04/30/34]: 80068000/00010000
[05/30/35]: 8006a000/00010000
[06/30/36]: 8006c000/00010000
[07/30/37]: 8006e000/00010000
[08/30/38]: 80070000/00010000
[09/30/39]: 80072000/00010000
[0a/30/3a]: 80074000/00010000
[0b/30/3b]: 80076000/00010000
[0c/30/3c]: 80078000/00010000
[0d/30/3d]: 8007a000/00010000
[0e/30/3e]: 8007c000/00010000
[0f/30/3f]: 8007e000/00010000
[10/30/40]: 80080000/00010000
[11/30/41]: 80082000/00010000
[12/30/42]: 80084000/00010000
[13/30/43]: 80086000/00010000
[14/30/44]: 80088000/00010000
[15/30/45]: 8008a000/00010000
[16/30/46]: 8008c000/00010000
[17/30/47]: 8008e000/00010000
[18/30/48]: 80090000/00010000
[19/30/49]: 80092000/00010000
[1a/30/4a]: 80094000/00010000
[1b/30/4b]: 80096000/00010000
[1c/30/4c]: 80098000/00010000
[1d/30/4d]: 8009a000/00010000
[1e/30/4e]: 8009c000/00010000
[1f/30/4f]: 8009e000/00010000
[20/30/50]: 800a0000/00010000
[21/30/51]: 800a2000/00010000
[22/30/52]: 800a4000/00010000
[23/30/53]: 800a6000/00010000
[24/30/54]: 800a8000/00010000
[25/30/55]: 800aa000/00010000
[26/30/56]: 800ac000/00010000
[27/30/57]: 800ae000/00010000
[28/30/58]: 800b0000/00010000
[29/30/59]: 800b2000/00010000
[2a/30/5a]: 800b4000/00010000
[2b/30/5b]: 800b6000/00010000
[2c/30/5c]: 800b8000/00010000
[2d/30/5d]: 800ba000/00010000
[2e/30/5e]: 800bc000/00010000
[2f/30/5f]: 800be000/00010000

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

