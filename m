Return-Path: <linux-mips+bounces-15861-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id foBXOyYEVWrGiwAAu9opvQ
	(envelope-from <linux-mips+bounces-15861-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 17:28:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FB74D0AA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 17:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F09cTBs5;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15861-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15861-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39D1F3018A96
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA413769FB;
	Mon, 13 Jul 2026 15:21:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F2372696;
	Mon, 13 Jul 2026 15:21:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956104; cv=none; b=tQqg92Ugadu5wabn/YsgtYdV644nppylPJoJaPc5ZqJ8jvY+ijWOdV504tXcIhoHLv2RDN30uMT0O2jq+zj+REflAIuHea6S6vefnf8mPrxieVpnEs0g15FlcVfFqbVJXhr1XIg4fFIrUMRIT7dJyF7cr6GLMDZfRMMS2d/IeeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956104; c=relaxed/simple;
	bh=82l3kG1WU5K3ivnt7I+4oV1hlwF64tnO1OsOsr+MYVY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9p3kx65nNTvteWbqNrVCJG15VCyDL/ags1XqSVdLkq3rYkHpNNhrZwvy57f3JnzngtvtHHQJZXrUVTHqJUFjzsyMOms/uBfU1uqakU4ZXwX5YO+JeZcpHw3GFdUPrkqXnwU3YIywLWIKvMvbYn+o1P+nSH8ilsmhIHTpPZX88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F09cTBs5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7313C1F000E9;
	Mon, 13 Jul 2026 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783956103;
	bh=XhkW4DyzeNy/HzsLnNu7ueSjq2mmL5alfmtKXq4g/2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F09cTBs5YkUJ1IxJqJsu8OhY3BdouXGZWrVpFybeLQ7wei/4yxAF4u/CXq/rN7AsD
	 xLcA5TAjAmjI8DNQ0NsyF5Q5B81/mxzvuC3eMPhMyZx+IpFfEkS8sbSMq+JPRFTKyo
	 bWPPEcCAftQRCJ8nlvBVSPeMZhpff/500B+q9uzi1TK4EnN4WApQISqhhFjW4TkE/h
	 dv4nLojuqYwouXEkdytzZWmcaitHOqGxSaqEWFx3OxPX8GaXzDpX8PsrLiSKjGlCh3
	 XFDvyZudWBBSUq6jAz7lpu6yHVEM1BJc6t59pIZJUopcQPYFIxydrJjDghGilWnyqf
	 cSgUuRmSkocSw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjITV-00000004Xt7-1U63;
	Mon, 13 Jul 2026 15:21:41 +0000
Date: Mon, 13 Jul 2026 16:23:30 +0100
Message-ID: <87cxwq6hhp.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 5/7] clocksource/drivers/arm_arch_timer: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-5-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
	<20260709-vdso-arch-clockmodes-v1-5-3fd780bbf851@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: thomas.weissschuh@linutronix.de, arnd@arndb.de, luto@kernel.org, tglx@kernel.org, vincenzo.frascino@arm.com, nathan@kernel.org, nsc@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, chenhuacai@kernel.org, kernel@xen0n.name, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15861-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16FB74D0AA

On Thu, 09 Jul 2026 12:32:41 +0100,
Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> wrote:
>=20
> Now that there is a dummy declaration of VDSO_CLOCKMODE_ARCHTIMER,
> even if no vDSO is built, the ugly ifdeffery can be replaced with
> a cleaner IS_ENABLED() check.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

--=20
Jazz isn't dead. It just smells funny.

