Return-Path: <linux-mips+bounces-12939-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC6CD26398
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 18:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14CC730EF20B
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 17:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506B03BC4DB;
	Thu, 15 Jan 2026 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYom4D7c"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200E53195F9;
	Thu, 15 Jan 2026 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496833; cv=none; b=gNZaQ3SNxao8Cmm+sl2Ps1Y+G2x/0U8B9XoO86bmx+rH3IgXigDU2jikCHCk4xQj+Xtfwfn0Ld3GG8XZDgj7pTItY3kS5gcgolbtQE0lsQYZeET0wqqg9im6W41vtHUrhWvYOOygvuGGgR+AyGzhqQKITY8PIn6LPtVNmYAUcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496833; c=relaxed/simple;
	bh=/aw7GfMERdmsHUNFNCeK6HNG4sQzWmjkXp2ilRMVj+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al9n/o6EttVHRV+bZpYloif6Uhi7b33gm97Zlilq7//4uaVlskNioSSibMqUghyaMdkKVcW/8lf0tg70jkoAOXsiwoNblHKu8BMaqerdvncLnj+3rfXB4LrgDz4umiNOIcZeS/NbJEnI9h6tUodxl91sejSTEm4+DW3P5KJ5xtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYom4D7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6AFC16AAE;
	Thu, 15 Jan 2026 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496832;
	bh=/aw7GfMERdmsHUNFNCeK6HNG4sQzWmjkXp2ilRMVj+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYom4D7cU/fM8xqNhFAhtyv/PAUmyyd46rS9pk290NOnn0J8dPNEu8HJz/de7QrFh
	 Cv/uM6vD0XVyelut9eC6i6BrjleoREyp2158NcbSq9vtjtr4/FoGpZMux95PPDGw2m
	 CAlqDTupPhli4bAhqKaOrfwqI9As10GnrY8ZL50EvdGowcrkcLGmTAVEVcotVDLtCe
	 1HbAJIND4dn6mEG9zlfOAy3m133o0aZlsmSbPJqeXUuYOSI0jc4zG8DjxDAjgSOLHq
	 FCiK58G5Lg/qcwhZxOFv/Ce74W1EumV9HEyPuBpmzufxdQqEWdopy2sbaCfDzHqVHk
	 nBQisuQRoSeYA==
Date: Thu, 15 Jan 2026 17:07:09 +0000
From: Simon Horman <horms@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-mips@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] pcnet32: remove VLB support
Message-ID: <aWkevTP15h30IC6N@horms.kernel.org>
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

Thanks, that is valuable feedback.

I'm certainly not advocating removing drivers that have an active user-base.

> 
>  No attention means the driver just works, why wouldn't it?  It's no 
> rocket science.  FWIW I continue using several drivers that saw little to 
> no change recently across various platforms.

Interesting. Subjectively, I'd say that Networking drivers it can be a sign
that the devices aren't being used in the wild. But clearly that signal was
incorrect in this case.

>  As to VLB support, I guess nobody cares nowadays.  I used to have such a 
> system, but haven't seen one in some three decades now and never used this 
> driver with one.

That is also valuable feedback, thanks.


