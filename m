Return-Path: <linux-mips+bounces-12814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B2D0E034
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 01:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C34301E6E9
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 00:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77BC14B950;
	Sun, 11 Jan 2026 00:41:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBAB500950;
	Sun, 11 Jan 2026 00:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768092060; cv=none; b=dzogS+4Db041wqEGmvbTWgWXmTa6VsOLCXGZgp1Vci5PpfsQ10Lc0TECKWzb2bTjH6aTf0iIoZN3z8acvt7oqcexxizjCS+myc40ED7FrVs59XshjrPsmQC5UWL2HwHZBbXIVXLIonlEa4l8dbpmTCpL3YqRpV0FrAh2VWnVuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768092060; c=relaxed/simple;
	bh=FobUOpw6eEDHM222L8W/x6F7sc6XK7IaqDhgjZ/9HTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ISlL+0xc+6nJqrgWP5VFO+/2iyR01O9H7INm790dUHIZ/ijFcOhCUAD/pAENSGSR4mZHVVq4XVjU/3gWZp8qitu+R9yzfOmhbzmYclkAZH6Q6QVEyQT29tSkrpcIf3P22d+s5umDT7EetDNG1orqXDHTwBC5MWnmcRfDvqHQoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 253CB92009C; Sun, 11 Jan 2026 01:40:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 16C7492009B;
	Sun, 11 Jan 2026 00:40:56 +0000 (GMT)
Date: Sun, 11 Jan 2026 00:40:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Simon Horman <horms@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-mips@vger.kernel.org, 
    netdev@vger.kernel.org
Subject: Re: [PATCH net-next] pcnet32: remove VLB support
In-Reply-To: <20260109180443.GO345651@kernel.org>
Message-ID: <alpine.DEB.2.21.2601110027520.30566@angie.orcam.me.uk>
References: <20260107071831.32895-1-enelsonmoore@gmail.com> <20260109180443.GO345651@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

[+cc Thomas, linux-mips]

On Fri, 9 Jan 2026, Simon Horman wrote:

> > This allows the code managing device instances to be simplified
> > significantly. The VLB bus is very obsolete and last appeared on
> > P5 Pentium-era hardware. Support for it has been removed from
> > other drivers, and it is highly unlikely anyone is using it with
> > modern Linux kernels.
> > 
> > Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> 
> Hi Ethan,
> 
> I don't think this driver has received much attention for some time.
> So, unless you have hardware to test changes on, I would suggest
> either leaving it alone or, if we suspect there are no users,
> removing it.

 You mean discarding the whole of drivers/net/ethernet/amd/pcnet32.c?  If 
so, then it's a hard NAK from me.  It's the onboard/netboot interface of 
the MIPS Malta platform and it continues being used regularly, primarily 
with QEMU setups, although I have actual Malta hardware in my lab too, 
usually running 24/7.  It's one of the primary MIPS plaforms, cf. 
arch/mips/configs/malta_defconfig.

 No attention means the driver just works, why wouldn't it?  It's no 
rocket science.  FWIW I continue using several drivers that saw little to 
no change recently across various platforms.

 As to VLB support, I guess nobody cares nowadays.  I used to have such a 
system, but haven't seen one in some three decades now and never used this 
driver with one.

  Maciej

