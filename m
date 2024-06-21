Return-Path: <linux-mips+bounces-3811-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C6911714
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 02:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF178281F00
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 00:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5609A15FA77;
	Fri, 21 Jun 2024 00:00:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C46715EFDA;
	Fri, 21 Jun 2024 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718928016; cv=none; b=WRDpnzh8ULq7AudYgcvE2elgFYOzpemM7jlDVt8+UdnNrzfiE6q62JU7YUuGN9ipqBRU1QjF9Ymwy/3Zm69mfkryRIXzh4PQ5VtNYNlKeIth2SlQpISjSIu5Eh6n1ttcTiLZK/RWBTh3eAUbkmhqvNXbtSOcqwTzUrITPRUQCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718928016; c=relaxed/simple;
	bh=cLIe4zxxt7eDpaPerSWkS0kgxNdOiT72HIp+sn+C6XM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RgbKXllcxwZIUJdnO6Dc5FDYoDHw406qCgmCCaEDPSxomTMaA8P9jWwO3nsCjgYIyPgraYKSoeaJyAtkhTM+K+WN5/oxyGciH6xZBUyEf3cc7V5KTNlruC19lqlzCwcCc2Fzfl9M9aJMw7dI73ZyPQivk/JHnZbm8sRaDp88IYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EBC7692009C; Fri, 21 Jun 2024 02:00:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E7CF792009B;
	Fri, 21 Jun 2024 01:00:04 +0100 (BST)
Date: Fri, 21 Jun 2024 01:00:04 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jonas Gorski <jonas.gorski@gmail.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC
 availability
In-Reply-To: <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
Message-ID: <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com> <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jun 2024, Jiaxun Yang wrote:

> Introduce CPU_HAS_LLSC and CPU_MAY_HAVE_LLSC to determine availability
> of LLSC and Kconfig level.

 Taking the subsequent patches in this series into account this seems to 
create a parallel universe in which the availability of LL/SC for certain 
features is handled at the Kconfig level while in the other universe it's 
handled via <asm/mach-*/cpu-feature-overrides.h>.

 I think this ought not to be done in two places independently and the 
pieces in <asm/mach-*/cpu-feature-overrides.h> need to be removed, likely 
in the same change even, *however* not without double-checking whether 
there is not a case among them where a platform actually has LL/SC support 
disabled despite the CPU used there having architectural support for the 
feature.  Otherwise we may end up with a case where a platform has LL/SC 
support disabled via its <asm/mach-*/cpu-feature-overrides.h> setting and 
yet we enable ARCH_SUPPORTS_ATOMIC_RMW or ARCH_HAVE_NMI_SAFE_CMPXCHG for 
it via Kconfig.

 The note from <asm/mach-ip32/cpu-feature-overrides.h> seems a candidate 
to move to arch/mips/Kconfig at the relevant place on this occasion too.
There may be more such notes and they ought not to be lost.

  Maciej

