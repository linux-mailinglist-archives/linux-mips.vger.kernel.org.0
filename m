Return-Path: <linux-mips+bounces-12737-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B882CCF059D
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 21:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91E34300FA08
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 20:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929F721CC5A;
	Sat,  3 Jan 2026 20:36:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F820C00C;
	Sat,  3 Jan 2026 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767472611; cv=none; b=G9r3oVI74QV0QI3nuLc5AuA30/5zUb/ErbF6xi3VCiJm4jjx1vTg5CKxQyQgHXSfEqIXwkQLRHceTJ0yPED8DrdqlWbDrE8e8AFIh7N1go98bL2eNd9thOwzCphi/rAjiJlbYg9uaT7Um5GvktgWKUwo6UrLinbajHj7u7j0TBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767472611; c=relaxed/simple;
	bh=CbUMDJZxLYbtTFzauOfJFZNdStb48qfjnXI2aSlsR+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mKA1B9Kc9RaT8l2IVlcy6vwwBpWfa+SArfqf8/d0nDo2l3iX5jgUhfldVHNZK9D5fuFmbs5f5NVNStKZkixFuRatlqXW6cRIq+vQhVZvKUq18SC0tqoeEl22YspoA3yirVy5WXKS2ynokjA5Z/fUNX6EwCsfssnejWbJd08m36k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8D48D92009C; Sat,  3 Jan 2026 21:36:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7FEC192009B;
	Sat,  3 Jan 2026 20:36:46 +0000 (GMT)
Date: Sat, 3 Jan 2026 20:36:46 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Implement ARCH_HAS_CC_CAN_LINK
In-Reply-To: <20260102083410-1d87a83f-875a-444f-8b43-4abbce317b5a@linutronix.de>
Message-ID: <alpine.DEB.2.21.2601031930080.14570@angie.orcam.me.uk>
References: <20251222-cc-can-link-mips-v1-1-6d87a8afe442@linutronix.de> <alpine.DEB.2.21.2512310212490.14570@angie.orcam.me.uk> <20260102083410-1d87a83f-875a-444f-8b43-4abbce317b5a@linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 2 Jan 2026, Thomas Weißschuh wrote:

> >  There are no `-m32'/`-m64' options with MIPS GCC; where did you get them 
> > from and how did you verify your change?  Did you mean `-mabi=...' by any 
> > chance?
> 
> Yes indeed. Not sure how that happened, I do have a correct version in
> another branch...  Thanks for spotting this.

 Great!

> > Also does the n32 ABI have to be factored in, since IIUC this 
> > stuff is about user programs?
> 
> It can be added, but I don't think it makes much sense.
> It would only be used if CONFIG_MIPS32_N32=y (which is non-default) and if
> the toolchain which has no n64 libc, but does have a n32 libc.
> This seems unlikely to me, but let me know if I am mistaken.

 My observation over the years has been that n32 has become the industry 
standard for 64-bit MIPS configurations; it's the default arrangement too 
for the GNU compiler for `mips64*-*-linux-gnu' targets in the absence of 
explicit `--with-abi=64' `configure' option, and no multilib support may 
have been enabled in the compiler (which is not required to build Linux, 
as 64-bit MIPS GCC and binutils are always able to produce code for all 
the ABIs regardless).

 I've always been an n64 ABI advocate and I used to build pure-n64 64-bit 
environments, but I appreciate that it makes sense for an embedded target 
to use n32 instead, as a lot of code and data space is wasted for the 
handling of 64-bit pointers the upper 33 bits of which may never hold 
anything but zero in many deployments.  Which is also why `-msym32' is 
used to build Linux where the upper 33 bits of immediate kernel addresses 
are known to always hold all-ones.

 It's not clear to me offhand how the infrastructure concerned here is 
used, but it may make sense to default to either NewABI and resort to the 
other if the default turns out unsupported in a given environment.  This 
for a change I cannot decide on based on information I've gathered so far.

  Maciej

