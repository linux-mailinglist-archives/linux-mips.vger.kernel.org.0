Return-Path: <linux-mips+bounces-3284-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEC8C7E95
	for <lists+linux-mips@lfdr.de>; Fri, 17 May 2024 00:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744491F22804
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 22:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB623765;
	Thu, 16 May 2024 22:45:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672BA1EEE0;
	Thu, 16 May 2024 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715899505; cv=none; b=bxUBIL7Y653Kss1BCAg827kkrquY6PRiMUfnoefRT/kbRCnKd7kQPsG94C+N1MQG3mMpzXspAVDKUebKrMiD9SHOCU/LdXZeAx5L8/jFIuZZxerD3yZfajXzLXIfTdLQ9JQUO9NYNO2UC7HSkvi0C4VNU+WJxMFK/hS31Vd8VEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715899505; c=relaxed/simple;
	bh=cKglyS+9H62XEHeJRO+8UM6DLraq8qZuLx6o1DzNa7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lySDRmRADNnSoVePqw9RKT0R/RZOmrSKkJMWFqSXhoPIU3Q0HCE9DXp4gFV0id0uT7irQVlXf+KcOg34ZVG91FKBYsveByCDVHj0tJoe1WKFzff2RMJMfaT/Cc90GZQomGOZ3oRxZVfFC9F0p8bfL4Qx5QowtWBNdw5/8mxz5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D2C0A92009C; Fri, 17 May 2024 00:44:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C713392009B;
	Thu, 16 May 2024 23:44:55 +0100 (BST)
Date: Thu, 16 May 2024 23:44:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 6/8] MIPS: Limit MIPS_MT_SMP support by ISA reversion
In-Reply-To: <4b8d0a71-f4b3-4c6b-b1e2-f67bb2908508@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2405162315290.32322@angie.orcam.me.uk>
References: <20240202-llvm-msym32-v1-0-52f0631057d6@flygoat.com> <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com> <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk> <7fc82f8b-df9d-45f5-8e82-27eac7b4b0ab@app.fastmail.com>
 <alpine.DEB.2.21.2405150850270.45291@angie.orcam.me.uk> <4b8d0a71-f4b3-4c6b-b1e2-f67bb2908508@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Jiaxun Yang wrote:

> >> There is nothing stopping us to run R1 kernel on R2 hardware, given that
> >> those features are all detected at boot time. I understand MT was introduced
> >> at 34K which is R2.
> >
> >  We can certainly choose to support R2 features at run time with R1 kernel 
> > configurations, but it's not what the change description says (left quoted 
> > above for reference).  And the MT ASE, indeed first implemented with the 
> > 34K (for which I was a member of the product development team back at MIPS 
> > UK), is not a part of the R1 ISA specification set.
> >
> Good to know!
> 
> The motivation behind this patch is to workaround some randconfig failures
> that combines MT with early ISA release.

 I'd say it's an actual fix rather than just a workaround.

 Originally intention was with the MIPS port that eventually we would 
support a generic kernel configuration, such as original x86 Linux has 
always had or the Alpha port has at one point gained, where you can have 
respectively an i486 (or previously even i386) or EV4 CPU kernel binary 
that runs everywhere, even on the most recent hardware available.

 With the MIPS platform fragmentation it has proved too much of an effort
for the engineering resources we've had available and consequently never 
happened.  This is why we have retained numerous abstractions intended to 
switch between handlers at boot time (and had even more in the past).

 From R1 onwards the privileged architecture has become more uniform and
therefore easier to handle between ISA revisions and/or implementations 
and the choice of the CPU to build for has become more of a balance 
between backwards compatibility and optimisation stemming from a richer 
architecture and FWIW I fully support striving to make an R1 kernel binary 
run with any R1-R5 hardware.  It can be especially useful with platforms 
that have swappable CPU modules available at different ISA levels.

> They are not trivial to fix, so I just ban them in Kconfig. I was a little bit
> reluctant to admit that in commit message.

 Please always state your genuine motivation in change descriptions.  It 
lets reviewers understand what a change is about and if there is any 
concern about the description itself, then it can always be adjusted in 
the review if needed.

  Maciej

