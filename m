Return-Path: <linux-mips+bounces-12942-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0318D28BAB
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 22:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B26423059A94
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 21:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7E432AACE;
	Thu, 15 Jan 2026 21:28:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2252C329E46;
	Thu, 15 Jan 2026 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512499; cv=none; b=RXIqSDhHV0APmoRpAP9nia2AB58NBG7R9rcyh8D+vHnFMGyIFKAADQ2S1yjJ9hHY3BeJAYTke2WtT4nJ3hDLhutV6H3KPiSl0nFg4bZZZfgpNW/P6BV3aqzpAXO9lzH6Se+Fvinl8TaIMlEoW7t0GyUoGjY0kBdqZCw7G+MZP9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512499; c=relaxed/simple;
	bh=jT25tlX1foiHffmz/R5z/n8dGKBNGRcy7InomGmw9z0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WbUXE9OE0x2ZKZJn/UZeJWJ7Tdv5jHCLq544Bu5vhm9NGqjN6t0EV0n9npBpa8TSaEPn8fRY5boGrST71cpj5R43qmcYFFBx6r+jcY+v8TQHgU/NLdlP+aXgQlpem8zrtNMMi5a3DLfGco1lfHwcDBCc6m//oI5ImQ+4hIv45sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 26C0092009C; Thu, 15 Jan 2026 22:28:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 20CD792009B;
	Thu, 15 Jan 2026 21:28:10 +0000 (GMT)
Date: Thu, 15 Jan 2026 21:28:10 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Simon Horman <horms@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-mips@vger.kernel.org, 
    netdev@vger.kernel.org
Subject: Re: [PATCH net-next] pcnet32: remove VLB support
In-Reply-To: <aWkevTP15h30IC6N@horms.kernel.org>
Message-ID: <alpine.DEB.2.21.2601152121230.6421@angie.orcam.me.uk>
References: <20260107071831.32895-1-enelsonmoore@gmail.com> <20260109180443.GO345651@kernel.org> <alpine.DEB.2.21.2601110027520.30566@angie.orcam.me.uk> <aWkevTP15h30IC6N@horms.kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, Simon Horman wrote:

> >  No attention means the driver just works, why wouldn't it?  It's no 
> > rocket science.  FWIW I continue using several drivers that saw little to 
> > no change recently across various platforms.
> 
> Interesting. Subjectively, I'd say that Networking drivers it can be a sign
> that the devices aren't being used in the wild. But clearly that signal was
> incorrect in this case.

 A stable driver usually doesn't require attention.  A potential issue is 
using dangerous C language features or ones that have been obsoleted in a 
newer version of the standard, which cause compilation warnings or errors 
in a new version of the compiler.  But that depends on how a given driver 
was written in the first place.

  Maciej

