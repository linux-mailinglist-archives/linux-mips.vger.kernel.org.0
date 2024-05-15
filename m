Return-Path: <linux-mips+bounces-3276-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F98C679C
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 15:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E5AC28102D
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BD513E8BC;
	Wed, 15 May 2024 13:43:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7559513E8B6;
	Wed, 15 May 2024 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780591; cv=none; b=Pg73FKyuAVJVIWpze3beJJIMVHSUYpzCD0jSQz2gwu67flI+yhe8X/VRM9lDKGZhoLlMoaAtYeOt4CTKp56GXLzaFBzcUiFmpcdQ1qR/I9GDH9aRPxoUzjBtq3W7+rg7xCZd8EvOjIHZwmw2GJ8uH2Sv/44/UBH8piFwno2ABKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780591; c=relaxed/simple;
	bh=qyG8CBA1LFfZoDjh2C5tAoYOWcPwQzqYhJHxMxFAF98=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RTF6RS/fDP6fnHLlD7dGQEu9OwskoIY9/8+hbVXRzRuysdpWcVnTn5a1aTGNwbUw9GQWNtxq0Ef8VkJzTdKB7FXwYtYWKwRLgkjaint4Htn3NJgNG56rKGjWmVelIYpg8S/WUZ0+oyZKwYdee3WYZKjyZhOJhlL7dUPhznm6wLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E81CB92009C; Wed, 15 May 2024 15:43:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E22E792009B;
	Wed, 15 May 2024 14:43:06 +0100 (BST)
Date: Wed, 15 May 2024 14:43:06 +0100 (BST)
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
In-Reply-To: <7fc82f8b-df9d-45f5-8e82-27eac7b4b0ab@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2405150850270.45291@angie.orcam.me.uk>
References: <20240202-llvm-msym32-v1-0-52f0631057d6@flygoat.com> <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com> <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk> <7fc82f8b-df9d-45f5-8e82-27eac7b4b0ab@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Jiaxun Yang wrote:

> >> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
> >
> >  R2+ only actually, as also evident from Kconfig...
> 
> Hi Maciej,
> 
> Long time no see :-)

 It's not so easy to get rid of me. ;)

> There is nothing stopping us to run R1 kernel on R2 hardware, given that
> those features are all detected at boot time. I understand MT was introduced
> at 34K which is R2.

 We can certainly choose to support R2 features at run time with R1 kernel 
configurations, but it's not what the change description says (left quoted 
above for reference).  And the MT ASE, indeed first implemented with the 
34K (for which I was a member of the product development team back at MIPS 
UK), is not a part of the R1 ISA specification set.

> >> --- a/arch/mips/Kconfig
> >> +++ b/arch/mips/Kconfig
> >> @@ -2171,7 +2171,8 @@ config CPU_R4K_CACHE_TLB
> >>  config MIPS_MT_SMP
> >>  	bool "MIPS MT SMP support (1 TC on each available VPE)"
> >>  	default y
> >> -	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
> >> +	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
> >> +	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
> >>  	select CPU_MIPSR2_IRQ_VI
> >>  	select CPU_MIPSR2_IRQ_EI
> >                    ^^^^^^
> >  ... here.  I wish people looked beyond the line they change, sigh...
> 
> Both features (VI and VEIC) are probed at boot time. Selecting
> them doesn't necessarily mean that CPU has those functions.

 Both are optional for R2+, so necessarily they need to be probed for, but 
they are not available in R1.  The reverse dependency set here is another 
indication that the MT ASE is an R2+ feature.

  Maciej

