Return-Path: <linux-mips+bounces-15913-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GZQ/Hlg4V2pRHgEAu9opvQ
	(envelope-from <linux-mips+bounces-15913-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:35:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7175B7CC
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:35:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=x4KOqh2Y;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=foV92jg5;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15913-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15913-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72D74301A7E1
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 07:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189E63C2BA2;
	Wed, 15 Jul 2026 07:35:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA63C3C07;
	Wed, 15 Jul 2026 07:35:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100944; cv=none; b=tt2dkZPVkfgYLqPKimIZbs45Uwrfbz8yLshvEsxTdobyVOw2vFeRbjtAPMWnxpDp+mVt3G8l99Be+lY6S0yCp3sLUMYboxWQeosPS8mNVOLkQF/u7gyRC7UhiHW4fR1RXVWPe4W9a8FUBak8g7/3nfQPyWTnTEgLa1yw+3LcYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100944; c=relaxed/simple;
	bh=wAjcdf/Xg9/NvobBkPdFe2geQJA4qNqqdPIDU00XfLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBprSbI9KFcsGauPeJI4NwqYvRbeY48GxDlmFShIbVb6UFW4k/PVOrQVWEn1hvqjH8i6CM1bJT5fowwI4HbfZedCNlMjGHcumiqE8/wzwKJE2uDz4NkiSmM59TtTVtm8nLgnZbjjByq0hkql6l2Nh3LRZOVUARMp7uigv0o3e3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x4KOqh2Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=foV92jg5; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 15 Jul 2026 09:35:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784100938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siLOJ/PzH1Z/CI0gJ9d2mUYbY29fqJhH0h9UiXoFxCM=;
	b=x4KOqh2Yn2a1NNHe3H+t5FkH4lteZdt+ip8SlWkD8EjBUrZD803V/3J6n4/dUmX5IZRPza
	MVa49hWh7OVjcDixOk0pXPc44gZ0InNyfgZsy2LfOPwS7VxNnNHkf9MIWTEJttuSCiDWbk
	rNtbY9wvhvfIYjCUnoFhJgWQW5BVjjU9vAN9VX76I/L7wKa7iUvU12Xo4vU+K07o62R4Rf
	4JG7lDFulB37pBMviO7+Toy9JSX4bZ1lfVDw6/Szk9q/BiRYxLZx/QBkRWXBAjrtiOyGNT
	syMMHsSgyOUpUhRk8TYi4vwgT5pkJYb1lE76DkQBHHfJJESqV5QtoJP99CkjwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784100938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siLOJ/PzH1Z/CI0gJ9d2mUYbY29fqJhH0h9UiXoFxCM=;
	b=foV92jg5Rg8lolleRZiRokI1mtWDILP3qDC2YlA6beFcsirLHOOj9TJh4EevJ513dhEklR
	nEOXcJybVNFIsWBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
Message-ID: <20260715093143-bae66267-bbf6-4446-a6b5-2fd43999cca9@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
 <87zezsogmh.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zezsogmh.ffs@fw13>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:arnd@arndb.de,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:maz@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-15913-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0E7175B7CC

On Wed, Jul 15, 2026 at 09:29:26AM +0200, Thomas Gleixner wrote:
> On Thu, Jul 09 2026 at 13:32, Thomas Weißschuh wrote:
> > diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> > index 15df9dcb42a5..2bc00c67dc54 100644
> > --- a/include/asm-generic/Kbuild
> > +++ b/include/asm-generic/Kbuild
> > @@ -62,6 +62,7 @@ mandatory-y += topology.h
> >  mandatory-y += trace_clock.h
> >  mandatory-y += uaccess.h
> >  mandatory-y += unwind_user.h
> > +mandatory-y += vdso/clocksource.h
> >  mandatory-y += vermagic.h
> >  mandatory-y += vga.h
> >  mandatory-y += video.h
> > diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic/vdso/clocksource.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
> > index c682e7c60273..63ee8c4ea15c 100644
> > --- a/include/vdso/clocksource.h
> > +++ b/include/vdso/clocksource.h
> > @@ -4,9 +4,12 @@
> >  
> >  #include <vdso/limits.h>
> >  
> > -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> >  #include <asm/vdso/clocksource.h>
> > -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
> > +
> > +#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKMODES)
> > +/* Unlinkable dummy stubs */
> > +extern int VDSO_ARCH_CLOCKMODES;
> > +#endif
> 
> I'm utterly confused by this. What's this unlinkable stub for?
> The only usage of VDSO_ARCH_CLOCKMODES is in enum vdso_clock_modes where
> it is guarded with CONFIG_GENERIC_GETTIMEOFDAY.
> 
> And your change log says:
> 
> > Provide unlinkable dummy definitions. These can be used with
> > IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).
> 
> which is even more confusing because that's related to the actual
> architecture specific defines and not to VDSO_ARCH_CLOCKMODES.

This is not a single stub for VDSO_ARCH_CLOCKMODES, but stubs for *each* of the
architecture-provided VDSO_CLOCKMODE_* constants.

E.g. on x86 it expands to:

extern int VDSO_CLOCKMODE_TSC, VDSO_CLOCKMODE_PVCLOCK, VDSO_CLOCKMODE_HVCLOCK;

> None of this makes sense to me.

I'll try to find a better explanation.


Thomas

