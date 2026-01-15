Return-Path: <linux-mips+bounces-12940-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E30D266DF
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 18:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B4613101602
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 17:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0182C324E;
	Thu, 15 Jan 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1yIGlI3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEA33993;
	Thu, 15 Jan 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496900; cv=none; b=cSMQDfoIlaolkWqEgFpn6ZZOdx0x40cPX8hw7mKoWNd25dEqMymfiUBA0RRqCglNczZA9RgPhZdfiDQou1nSAEejAqUwt2xcAkK5qtuS4RZEg5eNiQ9yWOO5cHDEKmer4ceFPrBbXk6YuWOr7iOq524bllbWjQtyXCixcZYJXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496900; c=relaxed/simple;
	bh=iOcpCIZ+a4vdsBx+sEdiZ2mYqK9JkOiq05tb+TdjeNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dL3dngSDaVq0Oxr1kxjm2PJLcMkuP31pGx2K+2IhTsU+ypPzc4wvbszvpUWLJuvsjTNttPRpwE/pI4ewWcOfzAr3+k7rq4hWfby9BhPxc+hXo5BGzcgkLPCJYT31/D61bwhU6Aybg42HyvOilpAY1AIg/5JMwwndlY6N2h7uPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1yIGlI3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB4EC16AAE;
	Thu, 15 Jan 2026 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496900;
	bh=iOcpCIZ+a4vdsBx+sEdiZ2mYqK9JkOiq05tb+TdjeNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1yIGlI3tuUg/NO2qx6O647UlNwXPcLKi71SUUFXNzkFVG+7072TXoWKG9KBeIv3X
	 k6zi/1c6SJu38yetGEtkdXcWBT6bv6b1Jid1keiPzIv9btU2FzYyxDOKvGLmhmdfJg
	 P63Fds8Oetnvb8+R1XOcc10yubbOZaDJILZsxSVwoAGfdLuc0WkwQO3qOhX4x0f9Bf
	 Weov/+lWZw0okq9OmyKnrZtDgfLrDK8xzet46Fxr5EZbgZZwELaE4gQhy5Zkz3XGuz
	 Kgn4u2sSdpcK6IUkeLQls3S64gvP/K86TAiLfTXTWop1m0U0HCCyehX1H3efyUmfrG
	 JhRc5L0SNDL0g==
Date: Thu, 15 Jan 2026 17:08:17 +0000
From: Simon Horman <horms@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-mips@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] pcnet32: remove VLB support
Message-ID: <aWkfAQNO8PQes7sV@horms.kernel.org>
References: <20260107071831.32895-1-enelsonmoore@gmail.com>
 <20260109180443.GO345651@kernel.org>
 <alpine.DEB.2.21.2601110027520.30566@angie.orcam.me.uk>
 <aWVxAVHWTOgEcwAD@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWVxAVHWTOgEcwAD@alpha.franken.de>

On Mon, Jan 12, 2026 at 11:09:05PM +0100, Thomas Bogendoerfer wrote:
> On Sun, Jan 11, 2026 at 12:40:56AM +0000, Maciej W. Rozycki wrote:
> > [+cc Thomas, linux-mips]
> > 
> > On Fri, 9 Jan 2026, Simon Horman wrote:
> > 
> > > > This allows the code managing device instances to be simplified
> > > > significantly. The VLB bus is very obsolete and last appeared on
> > > > P5 Pentium-era hardware. Support for it has been removed from
> > > > other drivers, and it is highly unlikely anyone is using it with
> > > > modern Linux kernels.
> > > > 
> > > > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> > > 
> > > Hi Ethan,
> > > 
> > > I don't think this driver has received much attention for some time.
> > > So, unless you have hardware to test changes on, I would suggest
> > > either leaving it alone or, if we suspect there are no users,
> > > removing it.
> > 
> >  You mean discarding the whole of drivers/net/ethernet/amd/pcnet32.c?  If 
> > so, then it's a hard NAK from me.  It's the onboard/netboot interface of 
> > the MIPS Malta platform and it continues being used regularly, primarily 
> > with QEMU setups, although I have actual Malta hardware in my lab too, 
> > usually running 24/7.  It's one of the primary MIPS plaforms, cf. 
> > arch/mips/configs/malta_defconfig.
> 
> I have a few more MIPS systems with PCnet32 chip on board. And this
> driver was the first network driver for VMware. I see no reason to
> remove it as it simply works.

Understood. Thanks for the valuable feedback.

