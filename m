Return-Path: <linux-mips+bounces-15922-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8UO0ImpdV2rLKQEAu9opvQ
	(envelope-from <linux-mips+bounces-15922-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 12:14:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEA75CD10
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 12:14:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=xV5+RR4p;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="b YEn7OO";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15922-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15922-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48297300D4DC
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037E343B6D0;
	Wed, 15 Jul 2026 10:14:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A583435539;
	Wed, 15 Jul 2026 10:13:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110439; cv=none; b=XtudxZRygXKwxsEY+iZnCfmJ58gucElmbe0XiJSBf4nQN7Js6yvFzgDWUILkK8EInqCp2wqfef4kv6XDfNP/d8rAKJWwbvJnUqUlpgV7JvUyZs92ZaCPHcrlKtZf+1+9F6ixitZPmRlmhMO85vzb7iu5mkEei8K4TxBW/GTBHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110439; c=relaxed/simple;
	bh=vjNiJbd68lTdO0MIGUyizblDsaMMG3ck38tplnYLBJI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HPUegFCVInWR2gVrqc1Eev25EkSQ8oEn0vUYKcomvTM0qVGdRbhQbYjOYoAhG/wTM8/p/mPYos//SoyhLODkZLo9T/BhARgG21gUvvhW/049kfJ/1+XErkukXwCac1mf5SCZVtQjFbpXT2RcW030HWOIvnj/tCIRxz5oB+yA05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=xV5+RR4p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bYEn7OOo; arc=none smtp.client-ip=103.168.172.146
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B34E3EC01F0;
	Wed, 15 Jul 2026 06:13:57 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 06:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784110437;
	 x=1784196837; bh=Gu9zw8RR2Cmhp5RnOK+0qu8XOtAv+L3E2BPrnjRUzAk=; b=
	xV5+RR4pDt0UViS7EXROvKgdzfemK4kJs/mc/M4kEeEhQn3yuUIbGHuZscTSw8l5
	zrQkJU+ngMoDVdLtq+qfR4qKI7dBrik/7fCMvc36+MRSPlVdfsncsjON9K9QmiTq
	e2dCk/vQoyZrBrqwUiqwAPKW7RjZUX7TG9eL6Z0Otvjuus0eez3LegPT/LO5HYIo
	4YgEyIj/SNBby5WXCPYxR+dx6dmJ68OTgCYXlzDXHwzHDcMomhuF1rvr6MD2RIpP
	hVb+VomZ/lKEE/T2nWb8nChL+qarxcjdD3aulkvwfRUZFJwaUWlVomHCPqX6oaSB
	SnhwXr23Ha7a27yVvejl6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784110437; x=
	1784196837; bh=Gu9zw8RR2Cmhp5RnOK+0qu8XOtAv+L3E2BPrnjRUzAk=; b=b
	YEn7OOof0QUF6qWo8cPh9eDHxrPJn/D33ZVC23wXoRhggqcEzF1kAfaotBQ1Nz5z
	kMMTrPf7A9GrDySSFlsRlgqs+YLznLmXb0wkoE7CpTKZhAqMftWTbazQ2n9KFnGE
	tCad1ono7TPVxiVBOztuvZnmsn6Mfi9KK1+x7RzoM0kLCUcMQUg8faMrnSECSwyL
	GHXh55WjUjd/VP+B1SLaXAAjC5wvwrPs+w1QWaN7cA5w3Od8ODqufaFq2kBuBXVs
	ulE6lpsIikZJCqdSNVcfOezBX+r0QsZZuTq1ovWqXdqesqJDIlN6LHBjdznTB3Ss
	lqNSI2SFiCD4Ut7fVRT1A==
X-ME-Sender: <xms:ZF1XakRqZTH7wv1ZcRAvW2VWX-BDNvbi4Xp9vkAFPyLV7tMveE0PPw>
    <xme:ZF1Xaskq5u_i-PGWhwDmmkuKCuhj7BDLGgqNtP71NuE7eZvA5vcbwk5vvOS1YDxZf
    -SMw5MdRzxwkKcOwnuimQcHdmaezYJEytVlAIWNy2duQdht1QqddAs>
X-ME-Proxy-Cause: dmFkZTFLhEwUOOUSeE15S3w19zjkdTnAsNUBdeZx7QjdH/i+PYps0l7WyNVeJwiurKDuvo
    NgJyy+q0Y56GLBdscP8qD05J4sLi8nYcemPbel6b0753Xdv4ChYVvZxsltLQ8RkWUpXshF
    OjUg23v7wa8tpWy8tfxP1nnWJ1fJmuoj0LDWtTUi0AHe5jnjrku6BTu6DJKQzUT9xg1KA+
    6IrTZymLwYB7kkRY6GbT3zaZOiKepFB9jHKAXzmQJFgu9r0m6xmCcCTG3TAyiMvOiIXc9z
    Ohxb0rTiqtaZ75qL1bxitFDtCJ/gQGz3/Kk7RTtsY6PsTVkSuXMKDd04xxwol5viKVoKXh
    5NKqNrWowQd2J+Htud9T5mig4KvREhwaTJ3n30FIat1siB44W8OcIz19Ge4gCrW7Oz8UBZ
    1C/YcqkSwbB/FPQcsE8mvto3ckIXwjmSzVSBh9CYRNSuaHZYLEfBTEH03HduFpFCDVO53A
    jagUk0oEXngNZB8CGr61JJHYxdWFECeXd9if5e3EbdG1eE0NH7960PqmKkKfu6sWO6fPt4
    YQ7dYkop3El95uNGDIVwb3zmtaGVQik5MEIUClDFCDsUux2S88w3uNwKrKEWhXRL+3vXEq
    LMt2VWNOmTG5FUNNA+SUhigUmkz3Ay1qdf8jGHr25FMqf3hZceUjqlGeygtQ
X-ME-Proxy: <xmx:ZF1Xamqvn0dSlc6OKp74fshXHrxVhXUYQZ3JVNFpL8VDOOpGgOLE6w>
    <xmx:ZF1Xagwb8fD0pDUjqYAaJ3-oRpY8fFKBvpxLgWcL80JJJpaWOcK2_g>
    <xmx:ZF1XanCYT7QkpsDd333iBz2crSePeHcEn-zcKAuFZEjohHLVUDt_xA>
    <xmx:ZF1XavMidYNHjdaV8L3n5tPqA4AcDSBzKSoMqjSeyLxNoL_HEaYFqw>
    <xmx:ZV1XatutlieSAZZxBaUy3rH_MgAXR1gL-pzhmiShjrI00JyMl41re_g2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72D39182007E; Wed, 15 Jul 2026 06:13:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjbDdkWFEQuV
Date: Wed, 15 Jul 2026 12:13:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Thomas Gleixner" <tglx@kernel.org>
Cc: "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
Message-Id: <ee62c755-a15a-41e8-b0bb-7595e9366977@app.fastmail.com>
In-Reply-To: 
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
 with IS_ENABLED()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:maz@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15922-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,vger.kernel.org:from_smtp,messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:from_mime,arndb.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0FEA75CD10

On Wed, Jul 15, 2026, at 10:43, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Jul 15, 2026 at 10:25:19AM +0200, Thomas Gleixner wrote:

>> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>>  #include <asm/vdso/clocksource.h>
>> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>>  enum vdso_clock_mode {
>>  	VDSO_CLOCKMODE_NONE,
>> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
>> +#ifdef VDSO_ARCH_CLOCKMODES
>>  	VDSO_ARCH_CLOCKMODES,
>>  #endif
>>  	VDSO_CLOCKMODE_MAX,
>>=20
>> and then you can just unconditionally set clocksource::vdso_clock_mode
>> in all drivers.
>>=20
>> No?
>
> It will weaken the sanity check in __clocksouce_register_scale() if
> CONFIG_GENERIC_GETTIMEOFDAY=3Dn. I am not sure what that sanity check
> is supposed to protect against, so I left it as is.

Is there still a reason to even allow CONFIG_GENERIC_GETTIMEOFDAY=3Dn
when  generic VDSO is enabled? I see that loongarch32 and
riscv32 are still missing the vdso time support, but that may
be more a sign that nobody cares enough about performance
on those targets.

In particular, riscv64 doesn't even build the vdso32 code for
compat tasks, which indicates that userspace doesn't actually
need vdso. On loongarch32, the commit adding the vdso said
GENERIC_GETTIMEOFDAY 'will be supported in future'.

On everything else, GENERIC_GETTIMEOFDAY and HAVE_GENERIC_VDSO
are already synonyms.

    Arnd

