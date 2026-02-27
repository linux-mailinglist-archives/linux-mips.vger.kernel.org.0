Return-Path: <linux-mips+bounces-13282-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE/BHfVkoWnIsQQAu9opvQ
	(envelope-from <linux-mips+bounces-13282-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:33:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884D1B5633
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73BA63055969
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCBA3DA7F6;
	Fri, 27 Feb 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="30xG3cOQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8swSz8Rs"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE86399018;
	Fri, 27 Feb 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184727; cv=none; b=h5F3MWpi3R6ur5E1csf1QofY+VnjVOwdcNzFAW0JzlY2BFW3ERVWU0KJIdyxfhnV9sPL/6ecMglmnlzWsLDFgwPWtTT5A5nvfST3GPno5bQtEdxEuB1VB/bmWiJWz1mg2/5Y9rzfhaxdaq8SbCw/s1Q7UGqi4YUvrKYIPBmLnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184727; c=relaxed/simple;
	bh=V2ffItQB9Q1VBviMsGZwc6VYYFmU9PpLl+g9jGKDOn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUkWFoUcttHh9sry7PhJ9JO8jJnHZ6mwT6UMKCELAQI+kkZAhTzxsVgM7C7YpfFeuZZhqX6m4bEh1zeO6WbPp4NwGCOnMsR5Z+6PrUJ1zq4/EACVvxUg18Dphzdw8UeCmD+gTJF1Up/jo3va+LxE7wkUXFG1FxCsnpSlHIDfTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=30xG3cOQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8swSz8Rs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 27 Feb 2026 10:31:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772184718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOdZaB3lOid4SOqrP5NMga5DLjNzennvRPzmBIDu08I=;
	b=30xG3cOQq3Co+onLqk07Fl1SRub/xIIrWg5BlfgkzAWZ0VeIKC54fH8uO8eZEd+hg1DEWm
	3lFzR/rzBx84ZT1ZKzZrWltXdpoXCZ0ibq9i/Dsptb/aoovS1STcf39oBFQSEeuj/xseGE
	6K9RLDzVR2T8QKb0M8tvGIhDcPj4s3MmKysFRs7YVGQwx3ek5/b+BoabeLlNjEv9oYIZMb
	YGETHpEAry3zfcuN5E2Npk67Vw6JW2IG2s1TzFPZSDONjRyV4lLzE+jXmUHCikBXLonAGz
	fd3ywzi5SA0cqDHTHwGAWijGynVhIumuIoXjFDntV7gAIwKpTXIs6V1kTXWbUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772184718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOdZaB3lOid4SOqrP5NMga5DLjNzennvRPzmBIDu08I=;
	b=8swSz8Rslvq4Ux1k+Q/Nlj4jfo/n+8Kwiv+xQ3xlP0PoCvw9xbWvPet52abVwHEuj2VTTA
	7tuFl+I2R98cffCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Message-ID: <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13282-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 9884D1B5633
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 07:57, Thomas Weiﬂschuh wrote:
> > This configuration option exists so "that we don't provide the symbol
> > when there's no possibility of there being a usable clocksource".
> > However it only covers __vdso_gettimeofday() and none of the other vDSO
> > functions which should be affected by the same circumstances.
> > As these are more widely used than gettimeofday() and nobody seems to
> > have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completely.
> >
> > The removal of the ifdeffery will also make some upcomming changes
> > easier to read.
> >
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
> Fix gettimeofday() in the vdso library") as a bug fix. This may not
> have been the correct fix because I don't see how it addressed the
> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
> CPU without the timer registers, but I think we should try to make
> sure that there is no regression from reverting it now.

I can't make sense out of this commit. The generic vDSO automatically falls
back to the syscall if it can not handle the current clocksource.
There is no explanation *why* this should be broken on MIPS.
It works correctly on my x86 machines.
I will try to reproduce this in QEMU by removing the vDSO capability from
the respective clocksources.

Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday()
and apparently that is not broken.

> > -config MIPS_CLOCK_VSYSCALL
> > -	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
> > -
> 
> An easy alternative might be to drop the entire VDSO in
> configurations that turn off the gettimeofday vsyscall today:
> 
> diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> index 70140248da72..4f6fba9e108f 100644
> --- a/arch/mips/vdso/Kconfig
> +++ b/arch/mips/vdso/Kconfig
> @@ -3,4 +3,4 @@
>  # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
>  
>  config MIPS_DISABLE_VDSO
> -	def_bool CPU_MICROMIPS
> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)

That is an an independent optimization IMO.


Thomas

