Return-Path: <linux-mips+bounces-12249-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A059C5D6FB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 14:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9FF436101E
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E552459E1;
	Fri, 14 Nov 2025 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gIRir/4L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PJp/vBSm"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B11DE4DC;
	Fri, 14 Nov 2025 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127810; cv=none; b=kV8WuLPZdmhv3DUdXcS4t/Rt5EEI8HHuMw0UBdrzROSAjv29Ikija+X3x8Q6fefcT1S5qZUYsIHtp5fcYkWFvVHURu4LCyA+liAr69wlF9AKKYhah4RiKjFtFkT3v0OLMoVeeoibVaCFCftJQaXv+4Jq7FeJ2X+JsDXxIoMUoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127810; c=relaxed/simple;
	bh=ISg/AK+QzVsVcyIt5OGx/BlA/TtkDDhIO1Pr2OUhGnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSeJf3zP+4+tR3lfKLeTsqLspN3l9sQOMt4x05tmD2uWo4VLvELbSX/XYsSYqTGBrW0N7LpX0KWckU20kjZQ4wrFbNSiMtgEoGDYw6WLXgHEk3OFAQeaICSq6F+JUHx35wKXuMEvbO2BEZzacGx37WrfRe5SMJhqCnXYbVXDwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gIRir/4L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PJp/vBSm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 14:43:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=gIRir/4Lzgj/mHOd7JZaVUa1E9UZ0Kp6SBQjTGTYc3zBB9Uccw1PDQZgKCugDD7SNkLJc4
	rWTA1bZOYnnxFBU1c3I5+6pxafi3efAKVcvOfQxa8mYLHkao6U1a+WgjquQRNJGq7KMi70
	KU9KOzGVJgkI8JKU94Xqv5bvdlgDzk5qNnnCwypNirbyc7n9xcDwwQTJr5+ysJL63QDwuN
	v4Zoxyc9j/Niyifj12WxqFysmUyas8fb1CvF8xpXQm6Uqhxo+L+tYv/l1uziRIrJw4fWPL
	jpQKVyMnpupxpF8qCOOc7QA9LHCLSTU3hyevSChE6sWIUtC5QvXQSjxHIH2nHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=PJp/vBSmzIi+3+3HURui2pgktdSqU9eraGxE64lkXGPNdO6ZlBzcYl1MFyPqJRIG+bG6hX
	hK2GxotHfbZs93BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114143845-ff0d3849-4495-469c-b9c1-bebf2e8808db@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
 <20251114042741.GA3582402@ax162>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114042741.GA3582402@ax162>

On Thu, Nov 13, 2025 at 09:27:41PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> > It is possible that the kernel toolchain generates warnings when used
> > together with the system toolchain. This happens for example when the
> > older kernel toolchain does not handle new versions of sframe debug
> > information. While these warnings where ignored during the evaluation
> > of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> > will later fail.
> > 
> > Example warning:
> > 
> > .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> > error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> > collect2: error: ld returned 1 exit status
> > 
> > Make sure that the very simple example program does not generate
> > warnings already to avoid breaking the userprog compilations.
> > 
> > Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> > Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> While this makes sense as a way to immediately fix the problem and align
> cc-can-link.sh with the other test functions like cc-option and like, it
> is rather unfortunate that this particular warning causes an error since
> the rest of the userprogs infrastructure does not care about SFrame...
> I wonder if there is a way to avoid it since I think this warning does
> not point to a fundamental problem.

I did not find any way to avoid this specific warning, unfortunately.
This patch should make sense in any case. If we find a way to avoid the
sframe warning then that should go on top.

(...)


Thomas

