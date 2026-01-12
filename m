Return-Path: <linux-mips+bounces-12885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEFD15E04
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 00:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15AC630019C4
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9FD2BE03D;
	Mon, 12 Jan 2026 23:50:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5181A284880;
	Mon, 12 Jan 2026 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261823; cv=none; b=LIeykvq4udoqtGXK+V/qCPUFTvj1OEKx3Q3VaH5ZBXiFNUBggeKo/qaaGtWSk+6Ki4NhKI/LFXnkm3Py6Xv4+o2bYO9txk0wjhRWgU+4DaNYjHSeqKcCxzTf4fODbkfWTFH+Q0TgTMJk3aEuMuT3fHN3S2HHEmYHctQy946ppEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261823; c=relaxed/simple;
	bh=CyjhGPbOwqxuAQzxV+Lja9SyFNFJ71LWX49/T8QSXq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOWWl3X9COJFt1vpqIpn/bBWy4m1f3BCVpBRGBZfNCckgkLQ9fS1kNZGc7IRt7azinPPaDWF61HTPt+fhFx7K2dI4ttFxIdXOKMnKx6hr7k8EaYo9iBqVQqM9wLnB5KSCq5saN/Hpuf92Ju8Z33hawmbmjceDYcBL+K3MvfdHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vfQmH-0006Lj-00; Mon, 12 Jan 2026 23:52:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6CD93C0113; Mon, 12 Jan 2026 23:09:05 +0100 (CET)
Date: Mon, 12 Jan 2026 23:09:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Simon Horman <horms@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-mips@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] pcnet32: remove VLB support
Message-ID: <aWVxAVHWTOgEcwAD@alpha.franken.de>
References: <20260107071831.32895-1-enelsonmoore@gmail.com>
 <20260109180443.GO345651@kernel.org>
 <alpine.DEB.2.21.2601110027520.30566@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2601110027520.30566@angie.orcam.me.uk>

On Sun, Jan 11, 2026 at 12:40:56AM +0000, Maciej W. Rozycki wrote:
> [+cc Thomas, linux-mips]
> 
> On Fri, 9 Jan 2026, Simon Horman wrote:
> 
> > > This allows the code managing device instances to be simplified
> > > significantly. The VLB bus is very obsolete and last appeared on
> > > P5 Pentium-era hardware. Support for it has been removed from
> > > other drivers, and it is highly unlikely anyone is using it with
> > > modern Linux kernels.
> > > 
> > > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> > 
> > Hi Ethan,
> > 
> > I don't think this driver has received much attention for some time.
> > So, unless you have hardware to test changes on, I would suggest
> > either leaving it alone or, if we suspect there are no users,
> > removing it.
> 
>  You mean discarding the whole of drivers/net/ethernet/amd/pcnet32.c?  If 
> so, then it's a hard NAK from me.  It's the onboard/netboot interface of 
> the MIPS Malta platform and it continues being used regularly, primarily 
> with QEMU setups, although I have actual Malta hardware in my lab too, 
> usually running 24/7.  It's one of the primary MIPS plaforms, cf. 
> arch/mips/configs/malta_defconfig.

I have a few more MIPS systems with PCnet32 chip on board. And this
driver was the first network driver for VMware. I see no reason to
remove it as it simply works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

