Return-Path: <linux-mips+bounces-7327-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00737A0812D
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 21:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA419188C0F3
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 20:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7AA1FCCF3;
	Thu,  9 Jan 2025 20:10:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8966A1F9428;
	Thu,  9 Jan 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736453449; cv=none; b=qXfX37AelnGE72ASpqiM6xpCbiyIeOOfuQQOyrbKV474M4CFE1XNUNPlTbx0ii9OmlE7RYruZa1+9+KZVfjNtVzMUTQO1vMQ5JXovHVLDcJhWGefrvAA6j5eXbSO7Bu19wMUVUEH8j8OW4tSPg3scyeklyXGMfJXQTVVigC1Rak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736453449; c=relaxed/simple;
	bh=VclW05EJZR4//jLyhzl8TppV3uaV262jvEjPzwv3XD4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rJGZF3Haie4GMBZg5B3ebc0WMr9PAjZT9XvWW+OAE2xmCxNs4wkhxwGQ/5EWEqHgRgqFWDzVK3oLjrIoHNgDMmyhbClC6sSyMXdFQHiJmjfTgMmiz2SfMIPg21l6E6WIKHMbCyZT13apl4Hlda9xQBf1hWU+u2RYY0/gYx0hdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 834E392009D; Thu,  9 Jan 2025 21:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7D11292009C;
	Thu,  9 Jan 2025 20:10:39 +0000 (GMT)
Date: Thu, 9 Jan 2025 20:10:39 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Eric W. Biederman" <ebiederm@xmission.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Arnd Bergmann <arnd@arndb.de>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>, 
    "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    Michael Cree <mcree@orcon.net.nz>, Sam James <sam@gentoo.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
    Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org, 
    linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
In-Reply-To: <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
Message-ID: <alpine.DEB.2.21.2501091953050.18889@angie.orcam.me.uk>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de> <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com> <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com> <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com> <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de> <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Eric W. Biederman wrote:

> > So, this would be the 100% correct for alpha then which would not loose
> > any functionality even for 32-bit binaries?
> 
> I don't think it is correct to think about 32-bit binaries on alpha.
> 
> Alpha never had a 32bit instruction set.  But at some point it looks
> like binaries that could not handle more than 31 bits of address
> space got ported and someone implemented a work-around.  I guess this
> is the --taso option that Arnd mentioned.

 This also saves some code space in non-PIE and plain static executables 
as it takes fewer machine instructions to load a 64-bit address that is 
known beforehand to be a sign-extended 32-bit value.

 This is similar to the MIPS n32 ABI, which also implies a 32-bit address 
space while still using 64-bit registers for everything, starting from 
stack slots (it's also ILP32 with the `long long' C data type only making 
proper use of the full width of the CPU registers, while Alpha's --taso 
ABI is I believe IP32 (?) with the plain `long' C data type still 64-bit, 
just as with the regular LP64 ABI).

 This saving turned out quite important for some MIPS applications; less 
so for the Alpha, where indeed it was mainly a portability matter at the 
time when going beyond 32 bits (and writing clean code in the first place) 
was a big thing for some people.

  Maciej

