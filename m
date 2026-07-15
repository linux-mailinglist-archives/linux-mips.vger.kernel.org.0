Return-Path: <linux-mips+bounces-15912-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KyfNFeY2V2rUHQEAu9opvQ
	(envelope-from <linux-mips+bounces-15912-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:29:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAEF75B6E4
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:29:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RJ0obCk2;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15912-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15912-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BC423012C9B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 07:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340E42BC3E;
	Wed, 15 Jul 2026 07:29:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711238423D;
	Wed, 15 Jul 2026 07:29:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100574; cv=none; b=SqUMsxgRt5HJo4EWepF7qx+TtwSLiDzj7LKx5ewtjSvZYc9M8oBdTgbTQ3eFI7/fNRtoFPeH3Gjcau3ZlkR/822n+Z5pA50WByVe0NTPfmBao7g5xAMGN5rMtOu37ZWzBncvIvM7Ja/OqkpYaYoPIP+1etiodWD8DqwKfb6yJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100574; c=relaxed/simple;
	bh=tiqPd9mBkUzeSfUEuQX09eSn+SMM0nvXgq6NfrOX4W8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rka1QKCF+UIcmsKv++YZE3rWF4e8ZqP6SOqont3d+s7aCU0Nb5islNHba2D3G0UfjyEo7Q6xXKvvrh0rt+TWYyt+FUeXJr9y1M46DmHNNnWJdDmDM4gtrK91jSqUa3DLFBuL74uO0EHAKwbD9s4N7FE7a5thkkJcwZJG9Q0v9WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ0obCk2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC081F000E9;
	Wed, 15 Jul 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100571;
	bh=oxqnySUc8Q87H9Bf1NcMH+aFYiamz3WK9FMyyvPdOHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RJ0obCk28CVa5NZXZuu1pUdenmJYIQlEs6MMF67avt9Mea6LpcXDIVL7emcqswy6r
	 UgkNH7iltfdTsoSvDqFc79LhJfEhvqLhukc8Y/Q7laC5Z3yORMErsR1kYSgdpXfpDv
	 H294L8Bf0ZCUGCplE4gq8sNMKQkSdNub3bGtTv3li48WsKckEvHNQXqbU3oeh1YSIp
	 LcPVP513nmLfDBhvxLMKjr6P7w/49KZEyBsdIErNONwnpRw9kAf9IjWCSHp51bmaed
	 mJ2iLNKEjZ3M2DA8TSMw2ugIPQced7dtn11Lt7Kygqdu+qA7a2QO/oKJt7ahGJJVzL
	 mLJU3KRFXEyxA==
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
Subject: Re: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 09:29:26 +0200
Message-ID: <87zezsogmh.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-15912-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EAEF75B6E4

On Thu, Jul 09 2026 at 13:32, Thomas Wei=C3=9Fschuh wrote:
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index 15df9dcb42a5..2bc00c67dc54 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -62,6 +62,7 @@ mandatory-y +=3D topology.h
>  mandatory-y +=3D trace_clock.h
>  mandatory-y +=3D uaccess.h
>  mandatory-y +=3D unwind_user.h
> +mandatory-y +=3D vdso/clocksource.h
>  mandatory-y +=3D vermagic.h
>  mandatory-y +=3D vga.h
>  mandatory-y +=3D video.h
> diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic=
/vdso/clocksource.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
> index c682e7c60273..63ee8c4ea15c 100644
> --- a/include/vdso/clocksource.h
> +++ b/include/vdso/clocksource.h
> @@ -4,9 +4,12 @@
>=20=20
>  #include <vdso/limits.h>
>=20=20
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>  #include <asm/vdso/clocksource.h>
> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
> +
> +#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKM=
ODES)
> +/* Unlinkable dummy stubs */
> +extern int VDSO_ARCH_CLOCKMODES;
> +#endif

I'm utterly confused by this. What's this unlinkable stub for?

The only usage of VDSO_ARCH_CLOCKMODES is in enum vdso_clock_modes where
it is guarded with CONFIG_GENERIC_GETTIMEOFDAY.

And your change log says:

> Provide unlinkable dummy definitions. These can be used with
> IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).

which is even more confusing because that's related to the actual
architecture specific defines and not to VDSO_ARCH_CLOCKMODES.

None of this makes sense to me.

Thanks,

        tglx

