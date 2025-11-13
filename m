Return-Path: <linux-mips+bounces-12223-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80630C56A19
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 10:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3612A3B9C86
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 09:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BED630102A;
	Thu, 13 Nov 2025 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ygwUYp2F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+qRXOq4J"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE62320380;
	Thu, 13 Nov 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026276; cv=none; b=nBDQXOKXjcNt8V9F/SLl73YkjJ+g0XbTTye6QeUIi8x389HJWjmDAq/eE0+E9KJ2JaICxZp/lwKEnDFBqMAAkj/AC+o+oF7qQTMXiCb/eVImLPJFu7vn2Aa4wku5F0xoVtH3ILHGYbGstNGduE4LCz17eU8cIteqApWRCh01Mn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026276; c=relaxed/simple;
	bh=O2/vwPXeEDFD/mI8BsOKjIlkUNBH5z8ELoKjc7T8RfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7lrnf/2B6Zbm7BgsU3TABcMyWtnxC6PB6QyjNsXG6ci3NgBs+Vjq0wfA7uOWx1iJBMtb5y7XmS+gRSYP9AmiS2uDvPmOXF73MGkj24lqCH+AAxVuqToaK6RDzR/8eXG/1WNnjnS2h3dwBk0ok18SIb5UI2FTcqcEUP1V2tWjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ygwUYp2F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+qRXOq4J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 13 Nov 2025 10:31:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=ygwUYp2FepRzD3HjKdKbHo13iKPe5fGwe/j9Ys6zZiMvxAWN1OBuAhyCiELOtD2RGYJltU
	8VX7MMGJ5DjE9n6DrWYVAuNwfdZvsbH1aHRwEYX3teYkFw5AJBO35bW4WpF5Tk5kFHUWrL
	gLNEY+Wc1BUOIms3gsYJ/wOrqfpecWcaeu7T+cTr/m0bQLMtttloE8h10mHvi2/tYzORRN
	G/jTKrO/gkksvgHb4CvJQr0H0W8vsKeIQ0e8rgMNvSrLaU6xLfa0eBk4Zd3xD9o+7GQDNd
	mfHowgXQeM41cjXmGj3ubXSd3BExQ+zjAH7KBXzuEcjBpvptyc3CwuDZVPJ21A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=+qRXOq4Jk2slHhdA1iSs+PP5mTSlOHMcDybHXlytmmFNwk4bSfci9b5O8vXXVZ+OjYzTkf
	EiwvRX9YrR/EFeCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
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
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRToC77bNUy2sKAK@derry.ads.avm.de>

On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Weiﬂschuh wrote:
> > The current logic to inherit -m32/-m64 from the kernel build only works
> > for a few architectures. It does not handle byte order differences,
> > architectures using different compiler flags or different kinds of ABIs.
> > 
> > Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> > the flags used for userprogs.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Changes in v2:
> > - Rebase and drop already applied patch
> > - Disable CC_CAN_LINK if the test program generates warnings
> > - Move to architecture-specific logic
> > - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de
> > 
> > ---
> > Thomas Weiﬂschuh (10):
> >       kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
> >       init: deduplicate cc-can-link.sh invocations
> >       kbuild: allow architectures to override CC_CAN_LINK
> >       riscv: Implement custom CC_CAN_LINK
> >       s390: Implement custom CC_CAN_LINK
> >       powerpc: Implement custom CC_CAN_LINK
> >       MIPS: Implement custom CC_CAN_LINK
> >       x86/Kconfig: Implement custom CC_CAN_LINK
> >       sparc: Implement custom CC_CAN_LINK
> >       kbuild: simplify CC_CAN_LINK
> > 
> >  Makefile                |  8 ++++++--
> >  arch/mips/Kconfig       | 15 +++++++++++++++
> >  arch/powerpc/Kconfig    | 15 +++++++++++++++
> >  arch/riscv/Kconfig      | 11 +++++++++++
> >  arch/s390/Kconfig       | 11 +++++++++++
> >  arch/sparc/Kconfig      | 11 +++++++++++
> >  arch/x86/Kconfig        | 11 +++++++++++
> >  init/Kconfig            |  7 +++++--
> >  scripts/Kconfig.include |  3 +++
> >  scripts/cc-can-link.sh  |  2 +-
> >  10 files changed, 89 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> > change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> > 
> > Best regards,
> > -- 
> > Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> 
> Thanks for the patch set and all the work behind!  I found only one
> issue in patch 3, the rest looks good to me as they are.
> 
> I haven't reviewed the compiler flags for the archs, but from the formal
> point of view they look good to me, too.
> 
> How shall we proceed with here?  I think, easiest would be if we get
> appropriate acks from the architecture maintainers, so we could take
> this via kbuild.

That would surely be the best option. Unfortunately quite frequently it is hard
to get architecture maintainer's feedback on a cross-architecture series.

> Other opinions?

It would also work to only take the first three patches through the kbuild tree
and push the other ones through the architecture trees.

I don't really have a clear preference.


Thomas

