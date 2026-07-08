Return-Path: <linux-mips+bounces-15624-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2kjWICKJTmqHOwIAu9opvQ
	(envelope-from <linux-mips+bounces-15624-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 19:30:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B972938E
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 19:30:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rendec.net header.s=default header.b=MwinUj84;
	dmarc=pass (policy=reject) header.from=rendec.net;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15624-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15624-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C3F3072048
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 17:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4346B42DA56;
	Wed,  8 Jul 2026 17:23:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA7423142;
	Wed,  8 Jul 2026 17:23:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531427; cv=none; b=fxH8cldDHZ2J+6U6UuC12FwBl/8w5AZNzm/ewymhoUSjZtyb/S9uqmpTaDcOO5Hf11YX9fSmPJsxaaFmVw+NKpHb/op9BTzhuAHfPegkjN2xokvOtmtqEuFPcouIyyw923ntWuDKfcJioH1KgvulexJQhZTG3qtjNqVICObLNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531427; c=relaxed/simple;
	bh=2FwtfvgYnqfApEQzRk2DFogg7eg5G8hQUvc99OfH2ig=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b84SP7LnmZcj0+jcfb0cw9vrmMWRLuZLnB0EYoTvn7/D96LnTgNWcHIAdHnoCn34FVCLV/L0Ta6yE4VIHBuRq2KRS3HMFdZ6jSDVv2faCNhMYA++jS8aUxw7Dv2DygkLMHlA1Z5Nw3Y7NPTXkXHa8OB08DRg+LH8S0kidtg8Qas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=MwinUj84; arc=none smtp.client-ip=80.86.107.70
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C6722C2A01;
	Wed,  8 Jul 2026 20:23:07 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C6722C2A01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783531415;
	bh=Z81AqF8sZ0HbKd4OyTLskHjABuyT0Tc0putXPru6w9M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MwinUj84iH00nexlmnhmDgR8X+WQik+DrvADedzcPZ9CeQY6xX1Fx3GoyEAx9wrw+
	 Qdscs2HlxOLAQsUWmM9C8f5DrkHkoVgKYwJs+XQ2tFPd5t4en+6vUqgSLYxSBdIwBj
	 555LvdKRH7m1aCTa5jMD6siDGQdvrKp961ZSe90G1chGvdgdtY0LoAvKa+i9v8wU5c
	 bWRF7OLablSVqprq4HLnjHYPD0Doh6wC1fnDaN+ZveYxw8RUEs8Ut6dFJfZDIKl5We
	 w78c65fWXzE8Q1+/ZRaJSLn4ncOl+TKAdXUve5QtEGG7DQ85WMF0AHi0oAnduE4Xgt
	 l68qBKty9jNkA==
Message-ID: <4614d1281cace737e3e117bd7242253475a30f58.camel@rendec.net>
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>,  Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,  Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Helge Deller	 <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, 	linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, 	linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta	 <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>,  Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>,  Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?ISO-8859-1?Q?Such=E1nek?=	
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 13:22:58 -0400
In-Reply-To: <20260707190253.718191130@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.718191130@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rendec.net,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rendec.net:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15624-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rendec.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radu@rendec.net,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ellerman.id.au:email,rendec.net:from_mime,rendec.net:email,rendec.net:mid,rendec.net:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E99B972938E

On Tue, 2026-07-07 at 21:05 +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode=
()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
>=20
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
>=20
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> =C2=A0arch/powerpc/kernel/syscall.c |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -19,8 +19,8 @@ notrace long system_call_exception(struc
> =C2=A0	long ret;
> =C2=A0	syscall_fn f;
> =C2=A0
> -	add_random_kstack_offset();
> =C2=A0	r0 =3D syscall_enter_from_user_mode(regs, r0);
> +	add_random_kstack_offset();
> =C2=A0
> =C2=A0	if (unlikely(r0 >=3D NR_syscalls)) {
> =C2=A0		if (unlikely(trap_is_unsupported_scv(regs))) {

Reviewed-by: Radu Rendec <radu@rendec.net>

