Return-Path: <linux-mips+bounces-13340-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOMMOfLgp2lnkgAAu9opvQ
	(envelope-from <linux-mips+bounces-13340-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:36:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C81FBAB3
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F9433023465
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D7C36D9E8;
	Wed,  4 Mar 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KgHt8zIL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FeUnLDHc"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADA36C598;
	Wed,  4 Mar 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609762; cv=none; b=keZLrurYIZWIgasmxbBe0QBqfeEwH9IUpOtTrEK442WwdNNTEywAotvu8ZFyMh5MYe33Vpra6TlZuafTo74Tc92D4oceTlbR1mk5UvOUZ7QJu67LXNam4iUUMEaS5rwBqGwm9vF5Cbi7IMoOewmbxFShpi4FQ79N9QVGS+zWbHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609762; c=relaxed/simple;
	bh=n4QO+J4Rts5nCDWp6sHD9UtZfl0I6fWovScaTEUYpz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPNFhvzcQlS30ZCA+U9wiSuKKe9LTnCQO5BY/K7KH/loDO5gVn8mNN6gPC7nBsFA1i4HQ4hx1Oj/A0COttODvEIvy2MVaby1Zo7bEiLfxGAu5PG2SboxK7xbmq99AD0BcqDQLpyCWQ/fKvg7Uu2cjapzkO6WLOBgDHCD8kOGE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KgHt8zIL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FeUnLDHc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 4 Mar 2026 08:35:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772609753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nS0P0VdyIdVGVKOpPjEYkaSE/WndtzqXP/uXSM1srU=;
	b=KgHt8zILvTsVGSQwSsns57pHb2TloH3vD3uJPBjZl2obifyWkKUMup+CbS9Un0sr5Js9cn
	loqMUEKO3VL7C5ZoAaV8p9F/s5rmENwDQMVMMJZ1e/xbJU9lb6NBOgib9IOkHN04LBeCYK
	1btTqKkyq2KlPA6NLmuP25Gtx9M091s4DpATEeJd9Z6tZyZzFVQmvP4CYEx063m5Pe3DnJ
	SCNABHQOqRKWwnQnn2LPqTZbhyjRMbg0HCABUFv/8PdA3Bc8BQBz2jTv/scLxIXHgmwCw8
	Av89DsQgAibY7sITO5jpPlm/fukn3h3EnTBNkTaDvPbcGzrTyAjs6viGrE2/CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772609753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nS0P0VdyIdVGVKOpPjEYkaSE/WndtzqXP/uXSM1srU=;
	b=FeUnLDHcbU/dyPEQom2WG/MpgJXSq3BKlAV0VeTApGMVedxpYe1ZsGp9BuW+Xo+X9+23M5
	4zr2HrH69nZzcHCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
X-Rspamd-Queue-Id: F32C81FBAB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13340-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:11:52AM -0800, H. Peter Anvin wrote:
> On 2026-02-27 01:34, Thomas Weißschuh wrote:
> >>>
> >> The thing about gettimeofday() and time() is that they don't have
> >> a 64-bit version and libc implementations are expected to call
> >> clock_gettime() instead. The result was that there was never a
> >> patch to turn the off either.
> > 
> > gettimeofday() is currently the only way to get the timezone of the kernel.
> > But I guess this is a legacy thing anyways. If you say we should drop it,
> > let's drop it.
> > 
> 
> The time zone in the kernel has never worked anyway, as it would require the
> kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> order to actually work correctly. The only plausible use of it would be for
> local time-based filesystems like FAT, but I don't think we bother.

sys_tz is currently used by a bunch of drivers and filesystems (including FAT).
It is also used when writing to the RTC.

> A bigger question is whether or not we should omit these from the vDSO
> completely (potentially causing link failures) or replace them with stubs
> returning -ENOSYS.

I am a bit confused here. You mention 'link failures' and in another mail
'weak references as fallback'. Both are things that happen during linking
('link failures' could also be interpreted as failures during loading).
Somewhere else someone also mentioned the vDSO to be 'linkable'.
But as far as I understand, only libc interprets the vDSO, it completely
bypasses both the linker and the loader. And libc already does graceful
fallbacks to the regular systemcalls if the vDSO is missing completely or
lacks one of the functions, as both cases may happen on normal systems.

What am I missing?


Thomas

