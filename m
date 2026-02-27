Return-Path: <linux-mips+bounces-13285-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ4qJWNvoWm6swQAu9opvQ
	(envelope-from <linux-mips+bounces-13285-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 11:18:11 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58D1B5EC9
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 11:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C6E53017241
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C80638F92C;
	Fri, 27 Feb 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uvUScOGe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zMotJU6z"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F639E192;
	Fri, 27 Feb 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187452; cv=none; b=U+W0RIMsk+UOfRketXwwnaeAnky2+90RR6htIv5A2J8m1KWARZurcUHDr7PgvoYYNLEhSQcZrCdC4KrXYFYU7JnrAeg4wmKLkyC/NKtViNRXtGO/COix0k59zFf43mi+yqM/OYbthSg5ISQkij6OJN+Xp21ftvvw4EKqXHMF3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187452; c=relaxed/simple;
	bh=q7mbuzHpTONYa7bxqY8LcBweO3Ty8EdeO3GmkI2GuWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG6qE6W72ptg6V66kV7StbHAKWkk/xVpcdOM4wxxCTNYTz+Yn0aa5ba/r1p7IINT3ONPD+AeBVAm7RnLtWrW+b0iKSZpFxzIVntw/kYJjvcczABMse83zYRBXVrU9uFskN0ikLHKtef9gsu+5/r3rC0a7f9xJ9Mb1eMEUdHRYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uvUScOGe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zMotJU6z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 27 Feb 2026 11:17:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=uvUScOGeEtjwcP5o+9FlkcoM/tsQ2p+iS4golr6rEQzvNnBmfRrB15eREn36vin9xWtk4R
	R+scJBIbCwcu8ejzzwna0XvtrSvCJU0S8aMZFE7pPGYvoRQA/K66wp+k9XyoG6GyRWbLsR
	m+LrU3AmcH990iPdr88i4WX/bALPzfMPTotlvi/ViucHGI3Fg2oOsAThppaAKPHfkJyGCd
	KRNj5KvHaT/t5HDzXtvuP7H/4Gjxk7RJ16thKkCrlhyt+V5Coe+QKQ4+XyfXfRJ+5CnPYx
	ANjXNees6mZDGAcgX4GITascJiWwlGJVtUzrfRYlIUwjLMYaRBdBHsN98ofYrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772187447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnNYf/NUprtOkvP6FQ7GazrZ/NHgbcfxwP/hg50mer4=;
	b=zMotJU6zK8AJTd+oBLmYBsNqn5Y7oSIh33pnZakNw1vXBlklgnk+o8FNEKHG956G47ENbM
	iokcOGZSBbhwZKDw==
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
Message-ID: <20260227110939-7ba009bc-3223-4d85-8ac8-e388568af399@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
 <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13285-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE58D1B5EC9
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:03:30AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 10:31, Thomas Weißschuh wrote:
> > On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
> >> On Fri, Feb 27, 2026, at 07:57, Thomas Weißschuh wrote:
> >> 
> >> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
> >> Fix gettimeofday() in the vdso library") as a bug fix. This may not
> >> have been the correct fix because I don't see how it addressed the
> >> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
> >> CPU without the timer registers, but I think we should try to make
> >> sure that there is no regression from reverting it now.
> >
> > I can't make sense out of this commit. The generic vDSO automatically falls
> > back to the syscall if it can not handle the current clocksource.
> > There is no explanation *why* this should be broken on MIPS.
> > It works correctly on my x86 machines.
> 
> Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
> more details as he did the original patch.

That would be great.

> Maybe the fallback logic didn't exist at the time of that fix?

It did, and as far as I can see it looks fine.

> > Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday()
> > and apparently that is not broken.
> 
> Not sure, maybe nobody noticed the bug yet, or maybe both 
> vdso_gettimeofday() and vdso_clock_gettime() now work correctly
> after another bugfix.

This is my suspicion.

If I mark the R4K and GIC clocksources as not vDSO compatible,
the automatic syscall fallback works correctly in my tests.

> The condition is fairly rare, as almost all MIPS systems have
> a working clocksource, the few exceptions I see in Kconfig are
> 
> - R3000 based DECstation
> - Sibyte
> - Ingenic Xburst
> - Octeon
> 
> There are not many users left on R3000 and Sibyte platforms, but
> Xburst and Octeon were reasonably common in the past, so it should
> have come up at some point.
> 
> >>  config MIPS_DISABLE_VDSO
> >> -	def_bool CPU_MICROMIPS
> >> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
> >
> > That is an an independent optimization IMO.
> 
> The idea here was that doing this would save you the trouble
> of figuring out exactly how it was broken in the past and
> whether the #ifdef is still needed.

We would still have the problem that on modern systems the clocksource
can get marked as unstable which will trigger a switchover to another
clocksource. If that one is not vDSO compatible the systemcall fallback
will also be used. So we want to fix this properly in any case. And then
the config change is only an optimization.


Thomas

