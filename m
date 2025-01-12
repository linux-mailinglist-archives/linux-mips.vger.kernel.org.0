Return-Path: <linux-mips+bounces-7404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D22A0AA24
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 15:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D11363A8102
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 14:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981CB1B87DF;
	Sun, 12 Jan 2025 14:40:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B381B87CF;
	Sun, 12 Jan 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692819; cv=none; b=oX4sAaMLh5ELmV02zS/rLEBVX5c9l/5sO9yCf8sTo5zL13Y09wseoKf+BU1Hg3tkrjNcBD6CzwL9NRhJ8/CQG1fhYrOTDrzb7M2CrcD3+R0ccMZdO5p0egJaUiTdz2QMuEWx+Zp97zEPK1fbwfOyqUJVMF0/EwGe1mCGfZuB5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692819; c=relaxed/simple;
	bh=uwqeeHVRripIltC2UXusORJityHud7kTUVG0qKStmIE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XOc76hahhS+/rdirJgbiFJ2i6S0c02IXI2JsDydJlfkAuT9dF6yToifbap4sALWZF+frkV5K4c0BuXvsJwyzvdCPRrAkCRjElRZ/Obp0zTPyz6G28PTWIxMwXs8arFLZPSRrCIERjlJC7hWKY3YpV8euWnof6Pop4iJXxHGNNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F012C92009C; Sun, 12 Jan 2025 15:40:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id ED45092009B;
	Sun, 12 Jan 2025 14:40:14 +0000 (GMT)
Date: Sun, 12 Jan 2025 14:40:14 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: "Eric W. Biederman" <ebiederm@xmission.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
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
In-Reply-To: <bff9bd35-4d47-45fc-90c5-28b79425fc8b@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2501120146160.18889@angie.orcam.me.uk>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de> <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com> <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com> <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com> <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de> <87ed1cufj1.fsf@email.froward.int.ebiederm.org> <alpine.DEB.2.21.2501091953050.18889@angie.orcam.me.uk>
 <bff9bd35-4d47-45fc-90c5-28b79425fc8b@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Arnd Bergmann wrote:

> >  This is similar to the MIPS n32 ABI, which also implies a 32-bit address 
> > space while still using 64-bit registers for everything, starting from 
> > stack slots (it's also ILP32 with the `long long' C data type only making 
> > proper use of the full width of the CPU registers, while Alpha's --taso 
> > ABI is I believe IP32 (?) with the plain `long' C data type still 64-bit, 
> > just as with the regular LP64 ABI).
> 
> I'm pretty sure it's still LP64 on Alpha Linux with gcc. There is an
> -mpointer-size=32 option in gcc for VMS, but I don't see anything like
> that in Linux. The only thing that is implemented here is the option
> for the linker that sets the EF_ALPHA_32BIT bit, but none of the
> code generation takes advantage of the upper bits being zero.

 Pretty useless then nowadays (I knew about the option back in 1990s, 
though since forgot, and then never bothered to get into its details and 
considered cleaning up code instead a better use of resources).  Thanks 
for the explanation, and good riddance!

  Maciej

