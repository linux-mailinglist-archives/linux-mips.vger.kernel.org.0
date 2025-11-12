Return-Path: <linux-mips+bounces-12199-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F47C5192F
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 11:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34193A64D2
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E252777F9;
	Wed, 12 Nov 2025 09:56:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B499921C194;
	Wed, 12 Nov 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941382; cv=none; b=ket+Grzwz4TSZTnUAdcEie4HFZCevdrXXwzgdtkzfDEr077gXdNIUmCE2MAs5q8imBusNSZDONd+dEprXhHwRC5ZJRE4OIu6v1N16lADJya8pPJ28rIaVe6iPbo5HVx87n4ohljzSiN5egqj0dJrd/OtfXbXpiIlAfgsovsbOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941382; c=relaxed/simple;
	bh=8jt8rlBeGab/FL4KkfJu8liGWlNYNX8MU01la3kQr2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JA1Y9u+0cU1gLmTWiNN62FDvaJJNxE7byP5wCkhIKLSrRmO5RejFU5C0RrcRB1TuGP7/wn4DiO3thOy2xofl1he49IxNlVkRNimg4WcqHGs50K18bKRaRxsU74lVsr2uU64z5opSyI4CyddSMB6ivg7Qp3aM+Y4AX5J+5sOWKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vJ7aJ-0003qh-00; Wed, 12 Nov 2025 10:56:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C7825C0256; Wed, 12 Nov 2025 10:56:05 +0100 (CET)
Date: Wed, 12 Nov 2025 10:56:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nick Bowler <nbowler@draconx.ca>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <aRRZtbBdCfEEhad9@alpha.franken.de>
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

Update on the issue: Your patch is good and the segmentation faults,
I'm seeing, have IMHO a different reason. Instead of removing the call
to r4k_tlb_uniquify() I've replaced the jal in the binary with a nop.
And the issue is still there with this patched kernel. I've seen
something similair on a R12k Octanes, which comes and goes probably
depeding on code layout. So far I wasn't able to nail this down :-(

Do you want to send a v2 of the patch ? I'm fine with the current version
for applying...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

