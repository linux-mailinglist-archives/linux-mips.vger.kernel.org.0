Return-Path: <linux-mips+bounces-15916-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wnO1M2FIV2pUIgEAu9opvQ
	(envelope-from <linux-mips+bounces-15916-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 10:44:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D475C012
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 10:44:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=QKxHOIoH;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=hmDYfd6U;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15916-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15916-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4973301A142
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459363D0932;
	Wed, 15 Jul 2026 08:44:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD863CF661;
	Wed, 15 Jul 2026 08:44:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105049; cv=none; b=UjiUojhY1XKEmvGzLIuyJhMWldfnqCw3kmt2q0ktdTznjOBNEk3XtfF/sTugDGjLssnlAyh1G9KOBTudQc1UnxIZeVz2mQ4BVNaAS8ldIQ/BWbHRKfgebEjqIqzsvZx/aqoYo/h9WMQeP5HHU1bNmVy1C34qbzfplKC+d4lCqUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105049; c=relaxed/simple;
	bh=A/Gd5wtPTUPk20N1JhxxqNhKurh1P9FmvSetjSO1sp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niYSQUxBh8S7L+9NDUBQ6Orm1kv5QjUYBnUao+mwnEWBkuJpepvLu7WmzHgwRhT+d9sJxA9XavkxgoHpDy4wZ7/Lx9CkNdWFUE0ZcpfKs8Cc+dkC6Iw3KjO2WNpl/2YXG7RYVrVnyZ30xRDqFX43E7yMc0YEs+3aOE6hFouaTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QKxHOIoH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hmDYfd6U; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 15 Jul 2026 10:43:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784105042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8pixiHE+4PXxCGaQx5Hl8gBRS82rPyfLLhsedDMY+s=;
	b=QKxHOIoHlp9u8M8n7Bkrh/HzI/ySdA78pU1ti/pDCkw/MSn0MWNaQRHJOk/MmAqJZPGA/U
	755oRYJ6WL4SPpfkD+hMgpByfPye6Iqf07ZTiJZRrtUauZO46auwLjWX4DLPSD2PxfxpgT
	v2cQg1lgK+iT5uxdzTKiEfzLtT2TblweDfuxLjQzAXlTplMVhTNqLdpVBqJGMBvYshMFRC
	509eIK1zzpfwv92fNZWDETfzk+qTbknHABmd53JaVHVBM2pd2VgQgBtJGuRmhmfbFF44zY
	ODM7urNC9FO+TS82heAptFv+XiDhksIGAOOcbPd2WHcxqkgWP/5MVs5Hi4ZbFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784105042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8pixiHE+4PXxCGaQx5Hl8gBRS82rPyfLLhsedDMY+s=;
	b=hmDYfd6U6mGyUoOlO2p4RjVL+21CJL8XTw+s2nT0Ecrrq23qvMl/Btmh/e257h781FfwnR
	H8elA9RqAIp+yrDA==
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
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
Message-ID: <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wluwoe1c.ffs@fw13>
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
	TAGGED_FROM(0.00)[bounces-15916-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C8D475C012

On Wed, Jul 15, 2026 at 10:25:19AM +0200, Thomas Gleixner wrote:
> On Thu, Jul 09 2026 at 13:32, Thomas Weißschuh wrote:
> > Now that there is a dummy declaration of VDSO_CLOCKMODE_R4K, even if no
> > vDSO is built, the ugly ifdeffery can be replaced with a cleaner
> > IS_ENABLED() check.
> 
> Duh. This stuff is really obfuscated. I just realized that the previous
> one actually expands the architecture defines to non-defined integer
> variable declarations.
> 
> Smart, but seriously?
> 
> I just double checked and it turns out that none of this ifdeffery is
> required. If CONFIG_GENERIC_GETTIMEOFDAY is disabled, then it does not
> matter at all whether the actual ARCH_CLOCK_VDSO_MODE is set in
> clocksource::vdso_mode or not.
> 
> Nothing uses the vdso mode field outside of update_vsyscall and that's
> compiled out when CONFIG_GENERIC_GETTIMEOFDAY=n.

__clocksource_register_scale() does.

> So all what's required is:
> 
> --- a/include/vdso/clocksource.h
> +++ b/include/vdso/clocksource.h
> @@ -3,14 +3,11 @@
>  #define __VDSO_CLOCKSOURCE_H
>  
>  #include <vdso/limits.h>
> -
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>  #include <asm/vdso/clocksource.h>
> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>  enum vdso_clock_mode {
>  	VDSO_CLOCKMODE_NONE,
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> +#ifdef VDSO_ARCH_CLOCKMODES
>  	VDSO_ARCH_CLOCKMODES,
>  #endif
>  	VDSO_CLOCKMODE_MAX,
> 
> and then you can just unconditionally set clocksource::vdso_clock_mode
> in all drivers.
> 
> No?

It will weaken the sanity check in __clocksouce_register_scale() if
CONFIG_GENERIC_GETTIMEOFDAY=n. I am not sure what that sanity check
is supposed to protect against, so I left it as is.
If we can weaken the check, or maybe even remove it,
I'm all for your simpler aproach.


Thomas

