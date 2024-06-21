Return-Path: <linux-mips+bounces-3844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A931F912C81
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 19:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63A052890CA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 17:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAC4161327;
	Fri, 21 Jun 2024 17:40:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554641C14;
	Fri, 21 Jun 2024 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718991624; cv=none; b=PSEYrejAUVbmCkffkdGP5ZsY2stHPFqkgn/7neU/LBgawUfYIT84k2rLIK4TJr2CZI7KpFy2+ST1VZZHZHL7K4ll4RBXb18CNO7Nb0akZRm4HR0WCBCrKE+IEw6nFFwrptsz4BiuBASNSXS0EJKGp7apqJXOn7s8tNghXTGzUO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718991624; c=relaxed/simple;
	bh=sYp9zVqfK6P/YFTVP1ANDcbGMHfXaXTyLhpF3yx8ffE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xr00vgxLteVqTphQIbPoPkLtJBSYEed7JMkrPll2znMaz9OSKbHGALhQiWUmn5S4YqeWTwbSOM5koC2i06mQvXX2KybCAe9W6gqHMaZGnmFEVZFsCLTjYhy3O68Zh4xexQWSKZkDoOBlVMCkcvOoLGPfAsC//p/rj4tRsa/qqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6A1C792009C; Fri, 21 Jun 2024 19:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 6056192009B;
	Fri, 21 Jun 2024 18:40:19 +0100 (BST)
Date: Fri, 21 Jun 2024 18:40:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonas Gorski <jonas.gorski@gmail.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
In-Reply-To: <83cf475c-86a3-4acb-bc82-d94c66c53779@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2406211827360.43454@angie.orcam.me.uk>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com> <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com> <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk> <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com> <alpine.DEB.2.21.2406211446500.43454@angie.orcam.me.uk>
 <83cf475c-86a3-4acb-bc82-d94c66c53779@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Jiaxun Yang wrote:

> >  That might do in the interim as a sanity check, however ultimately the 
> > sole reason these <asm/mach-*/cpu-feature-overrides.h> exist (and the 
> > `cpu_has_llsc' setting there) is so that a dynamic check at run time is 
> > avoided where the result is known from elsewhere beforehand anyway, and 
> > your change effectively supersedes the overrides, and therefore they need 
> > to be removed.
> >
> No, overrides are still valid if platform did CPU_MAY_HAVE_LLSC, this is at
> least valid for R10000 systems (IP28 decided to opt-out from llsc somehow),
> ATH25 (platform made assumption on IP version shipped with CPU), cavium
> octeon (platform decided to opt-out llsc for non-SMP build). I'm not confident
> with handling them all in Kconfig so I think the best approach so far is to do
> build time assertion.

 No, CPU_MAY_HAVE_LLSC is the dynamic case, in which case you need to run 
verification at run time and access the result via the CPU feature vector.  

 If you insist that you need a static override in this case, then you've 
got your CPU_MAY_HAVE_LLSC setting wrong, it should be either CPU_HAS_LLSC 
or nil, according to what <asm/mach-*/cpu-feature-overrides.h> currently 
sets for the platform in question.  Whatever is set statically there at 
build time can be reproduced in Kconfig.

 Going through platforms should be easy if not a bit tedious, but that's 
the cost you sometimes need to pay for progress.

  Maciej

