Return-Path: <linux-mips+bounces-3838-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A4912717
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 15:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3BB1C20AD5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C795664;
	Fri, 21 Jun 2024 13:57:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730194C90;
	Fri, 21 Jun 2024 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978275; cv=none; b=uMWRaCpuP/R7biYKJSBDvs9FPA7GcipGBXDzR6tIuhCT0f/9GaYOkVJB4ygN0KW2RIaZbOOW3imPN55F83MAianvj/G+uHoz1GFzEkAs6tk9yr5mtwfm5v1yJdyTp0nZJrCeZXqgKNN0KZnbcId3DcyySe7s6yGfrnUZsI/tuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978275; c=relaxed/simple;
	bh=/W9hKVOwOaTWtfg8Pb2Jm9lMM9GEm/nu0JlkK2xkykA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gIxQYCOBO+XXYnxzt+4Y+eW0T04wdREZiZHmcuIAcJRgTro8P8Or+MFwf2cwhODrVnNcTJ3897w9osEih0smZoJWyfnQD/g/iAMXFRqoOm1TaT/wN3sr+79Ogml4G+MuCU+doawbM/2Xo0GlcaAkG39qZGAE3ppd0g7NdlL5D78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8F74A92009C; Fri, 21 Jun 2024 15:57:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 887DB92009B;
	Fri, 21 Jun 2024 14:57:50 +0100 (BST)
Date: Fri, 21 Jun 2024 14:57:50 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonas Gorski <jonas.gorski@gmail.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
In-Reply-To: <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2406211446500.43454@angie.orcam.me.uk>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com> <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com> <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk> <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Jiaxun Yang wrote:

> >  I think this ought not to be done in two places independently and the 
> > pieces in <asm/mach-*/cpu-feature-overrides.h> need to be removed, likely 
> > in the same change even, *however* not without double-checking whether 
> > there is not a case among them where a platform actually has LL/SC support 
> > disabled despite the CPU used there having architectural support for the 
> > feature.  Otherwise we may end up with a case where a platform has LL/SC 
> > support disabled via its <asm/mach-*/cpu-feature-overrides.h> setting and 
> > yet we enable ARCH_SUPPORTS_ATOMIC_RMW or ARCH_HAVE_NMI_SAFE_CMPXCHG for 
> > it via Kconfig.
> 
> IMO it's necessary for platforms who know what are they doing such as ATH25,
> which we took care in this series.
> 
> I'll add a build time assertion to ensure when CONFIG_CPU_HAS_LLSC is selected
> kernel_uses_llsc is statically 1, so any incorrect overrides can be spotted
> at build time.

 That might do in the interim as a sanity check, however ultimately the 
sole reason these <asm/mach-*/cpu-feature-overrides.h> exist (and the 
`cpu_has_llsc' setting there) is so that a dynamic check at run time is 
avoided where the result is known from elsewhere beforehand anyway, and 
your change effectively supersedes the overrides, and therefore they need 
to be removed.

> It's better to clean up platform's overrides at some point, I'll leave
> it to a future patch.

 I think it will best be done now while we are at it and the change is in 
scope.

 It should be possible to automatically run over the available defconfigs 
and see if there is any change to `vmlinux' produced between the current 
state upstream and the state where this patch has been applied and the 
`cpu_has_llsc' setting removed from <asm/mach-*/cpu-feature-overrides.h> 
both at a time for each defconfig.  There should be none.

 It'll be tougher once your changes to add ARCH_SUPPORTS_ATOMIC_RMW or 
ARCH_HAVE_NMI_SAFE_CMPXCHG have been applied.

  Maciej

