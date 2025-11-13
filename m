Return-Path: <linux-mips+bounces-12222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0ABC56991
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 10:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 165014E4F6E
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 09:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AB829E101;
	Thu, 13 Nov 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ju37J1p2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yj3MpOVf"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E26027B359;
	Thu, 13 Nov 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025784; cv=none; b=XScvQ8i9ykP8/qF/6iBYS3rnqL80UvhjNORsiP3ckqdJGafUIKJ96nbzDzZUAGmb99ae0CEYWCOdqeLq9FrI7bKCfS47Yo1SjLmwCoAdG+v5ZiZJfilQ+RR2W8uSY22V0SdRgAvKqo/MilOiYzKddtwlVYRRiz8e8Ioy6WjuUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025784; c=relaxed/simple;
	bh=FeFEmT4UEE52+Px5hP+njnjxgPrdJB1eVuJms7OuiB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au1xRE8vexIFCHQ2rAfnjljA0scyQ8A1xZPJFgrHwlSfPbl/J3zozVFF0p4AtaYHnHPLLpKvRuCP6Nb+WPYB1wAUdAzochm+/x3IZxcIHj4eiPHf4VZK783czxloxAXImHbq6it+df6MsRu1wl3LSRcdc+6p/A+MG7uJTi75DP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ju37J1p2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yj3MpOVf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 13 Nov 2025 10:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=ju37J1p2hCJon7Dq3EBdc85zXolYmJpQFCDTDD8FHlvRoEjSOjlt4Yp4KTbgB+KXM8NcYf
	x3XTLgFMg7s207AYx4nl33y1T7AsXPupY2fLhI04LI5i9mGt07hV5/LXgVSxjC9NWmgQAa
	KqW1OH6sg1WZuym+vr+IuqGfgMbqLdr1tI/aw1wSpW86G2aLwk2MCJCFBMALz4sjVRNETn
	KkDa1CbmU1hyAhZyUbsikCLXiGWtupPq5TLM5m+oNtPlFP+wYSHVn6OyRIyBbZiK4RDRII
	854zE6FXH9KIsYP0DkrSuQU61CL7NMT2DNoYB6l8S3LyjnomxgvlNoDIEVa5SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=yj3MpOVfBn1X0F5np7dHo4NQ2EaJr+XO2eqbf3c6nh3gZeHlyNtkeRsYccVi0YEIjMy8Pj
	TA7I+NuN5tR4vTBQ==
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
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251113102236-1954dc76-ad1b-423d-ad29-104c3e07db17@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
 <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>

On Wed, Nov 12, 2025 at 08:56:12PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Weiﬂschuh wrote:
> > The generic test for CC_CAN_LINK assumes that all architectures use -m32
> > and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> > simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> > also require byte order handling (-mlittle-endian, -EL). Expressing all
> > of the different possibilities will be very complicated and brittle.
> > Instead allow architectures to supply their own logic which will be
> > easy to understand and evolve.
> > 
> > Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> > to be implemented as kconfig does not allow the reuse of string options.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  Makefile     | 13 +++++++++++--
> >  init/Kconfig |  4 ++++
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> >  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> >  endif
> >  
> > -# Align the bit size of userspace programs with the kernel
> > -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> > +# Align the architecture of userspace programs with the kernel
> > +USERFLAGS_FROM_KERNEL := --target=%
> > +
> > +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> 
> Is this some left-over from a previous version?
> 
> s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Indeed. Thanks.

