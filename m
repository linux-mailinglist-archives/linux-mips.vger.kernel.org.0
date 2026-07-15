Return-Path: <linux-mips+bounces-15915-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /4ImKPdDV2pVIQEAu9opvQ
	(envelope-from <linux-mips+bounces-15915-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 10:25:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DCE75BD7D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 10:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M1Pb9WQu;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15915-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15915-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4C403008D7D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B25D3CBE7C;
	Wed, 15 Jul 2026 08:25:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C683C872C;
	Wed, 15 Jul 2026 08:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103925; cv=none; b=cj89LpiWU5W3gH4y5bV8J4EmZPQhUkarie03Bu6RENyGTWNDWhsWp2XYgYeDF50iLG95duAH73HGIgnzUvtqZDitwkV6G+DLpHIV18qoK60oxBVQVRxXSuDM9BbVdCg7ths0gBlfguOSP7wxCOwBIWRx65Img1jPLAxYqBv3eeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103925; c=relaxed/simple;
	bh=lVF9lbxS7tFgfFU9drM3n5HiYK58TwN29718xw7myew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EWHZkExlovxtVuSzNiwSGw/srA16352GAHtrO3fY9p/8sAayUk294YfLXwdKxLNI1FlkCS+8NZU3t2S+mZ9jzOljhv837VpZHqYcSWktrA6c7TpSHYFEfswI14ZHwc2Xe7Ch/adRlaoDrXFZtC3bwWDsajH8troTuOIUWTDlDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1Pb9WQu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4271F000E9;
	Wed, 15 Jul 2026 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103924;
	bh=0hWGr6yIYZ3hmyl+qH6n3K7Fm452o43E71VabCLMJ2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=M1Pb9WQu0IhR3P6JRYVgpOzljOTuLBL5n6r0R+i3T6Cj6Pfq/BbEAeyvAAd6q+GwU
	 yoh16hddpke8YRXj4bfC0BlqZXoh2oOxkxxfr/ZZ4LtH1IwctkRUOsAZ2DTsl5MwXL
	 OgwbU2Z0EXRTi2suwmOEdZwMcMw1UwD4qnCb2U0UIGMxWSKqmkI4rJV0fOaz7frsyp
	 2UgeFb3NExlZX58pouMZoZOq3U2RBWV9ghRcw3YrJThQyIqJBrSR5X77jMSfD+Yh9P
	 Vqa0sNn/IVBkbkj+87yT6Eh8x08MbkvvvCwenfxyZ52gn69bWZbYdUyMpeOjJGr8Vu
	 P097FVeUHn00g==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann
 <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 10:25:19 +0200
Message-ID: <87wluwoe1c.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:arnd@arndb.de,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:maz@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15915-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64DCE75BD7D

On Thu, Jul 09 2026 at 13:32, Thomas Wei=C3=9Fschuh wrote:
> Now that there is a dummy declaration of VDSO_CLOCKMODE_R4K, even if no
> vDSO is built, the ugly ifdeffery can be replaced with a cleaner
> IS_ENABLED() check.

Duh. This stuff is really obfuscated. I just realized that the previous
one actually expands the architecture defines to non-defined integer
variable declarations.

Smart, but seriously?

I just double checked and it turns out that none of this ifdeffery is
required. If CONFIG_GENERIC_GETTIMEOFDAY is disabled, then it does not
matter at all whether the actual ARCH_CLOCK_VDSO_MODE is set in
clocksource::vdso_mode or not.

Nothing uses the vdso mode field outside of update_vsyscall and that's
compiled out when CONFIG_GENERIC_GETTIMEOFDAY=3Dn.

So all what's required is:

--- a/include/vdso/clocksource.h
+++ b/include/vdso/clocksource.h
@@ -3,14 +3,11 @@
 #define __VDSO_CLOCKSOURCE_H
=20
 #include <vdso/limits.h>
-
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 #include <asm/vdso/clocksource.h>
-#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
=20
 enum vdso_clock_mode {
 	VDSO_CLOCKMODE_NONE,
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+#ifdef VDSO_ARCH_CLOCKMODES
 	VDSO_ARCH_CLOCKMODES,
 #endif
 	VDSO_CLOCKMODE_MAX,

and then you can just unconditionally set clocksource::vdso_clock_mode
in all drivers.

No?

Thanks,

        tglx

