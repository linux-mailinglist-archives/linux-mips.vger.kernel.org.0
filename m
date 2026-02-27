Return-Path: <linux-mips+bounces-13279-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CqBBMxboWmDsQQAu9opvQ
	(envelope-from <linux-mips+bounces-13279-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:54:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC941B4C1C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D208317C35F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97E93B95EC;
	Fri, 27 Feb 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CpQkqgYf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ya59htWC"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A53B8BC0;
	Fri, 27 Feb 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182224; cv=none; b=sSS3cd667J/Jsc/FkjmWWiBXt1PaZZeu4JzNfUGij+pMvAvTpXUBHfUF5NeBey6S3xYqcQwfhZtUy2QvTOJdQijYeOynQM4wnK4QbZ3qpRwCoVbzxLnwX54Fo7GDoC2WcZQB/MXG3SQJ4bnbuymc/zwSYfE6BxsHeOQIj62atlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182224; c=relaxed/simple;
	bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Jb1lvaIUDS/EMiIUoZoxMQWe8/J9tvRpv4zzBYJ2xDssiL/8ZNF0HLFhI7I1avt9pxhsCZ19TsaidWL72JyRWiMHqSzghFyJnzRWxreB3n2PfXTgw+PSlfjsLXDh3rFpXzJgegrtOWDIemGvNoGKy7RlZfImjsTDnW3lergFSxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CpQkqgYf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ya59htWC; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DDEA77A006C;
	Fri, 27 Feb 2026 03:50:09 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182209;
	 x=1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=
	CpQkqgYfKds40olKRxYLSKAiGe5Rmy/9BCh5Z7MPXPxZ5F9LkngTRdlArkVNRjl8
	7ZqGnCIKRmMyrZJeCBiLf4/HN2UwaqtGzYvz33ugvRadhG1Ukrmp9gQIHnpcxj2z
	4tWE0307vhEYdklvnh8Hp2KUVlCY1Kc6fUscg6oVc4PMeNbnjdT+Jw4IKQ5SIwGf
	A0XFJqGIxJV+b9Pw1NfRhTq32a56fOkq43bvOQgPrBhd+4BNZGnpTo63/4pVj+X3
	ziLnwuOGm/2TpCZHvvuD3JP8kb36KC7Oxq5r8aLFdoVFMaA29W4RRCcbbb9lHQNC
	z9UDShjAp+mcTUCLvFglqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182209; x=
	1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=Y
	a59htWC7mo5ur5Ru4AgAGJLqF9zIgIxnBpDFt5UgHdLUD8RPtbpyt3V3Nt80/SK1
	k1hirZHj7G2q9sY4pZHUbqslH90QY8FE6DUnSY2L43FKyo0yHdaX1R+i9qRbdueL
	oL5yGYKXrCmJmqN9TiNymHUKYlqr4aejj6YWngHGjFwY1NTAMsVN2i5jFim4J+HC
	jCNbCrQQqButTpG/aSIHiFGyg7L7CdSE0663rkLBd0WsuSZ5mk9mfHw6i39ZWAyk
	Il+1PcbDoIlUFKKriY3O+5tFM3Eh7mCjfOS6/3ejj2OtGerRvi9WC0OxavVSe0pz
	8M9CQwwTcyQnTocXUICqA==
X-ME-Sender: <xms:wVqhacI1rkOi6xw-07DwQDbocsXu_hDWjrP2hK5KGSJsQn4jHH6Gog>
    <xme:wVqhaW8D4Pu5jKC7Qcu7NwRD1ra8Pw5CMbd0Q6E6L46abVMVGzPr63Yj3dB8PfSR5
    QMVPd3tdG80nQ3287dbrTxU2-um9ej7tIYsHfo_fg3gtluKACfkysiP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:wVqhaaHGvD1Eiphu0UQvGUsq8vY3JJvW3HPTel60R0guHhN6xnR5Rw>
    <xmx:wVqhaW7fUmT6ZYnp_qtntaBRP9PPVqGSyZrlJMiGqJqhTltRN6xefA>
    <xmx:wVqhaUKSaFcKmvsheEHP93T2yCFnay2qeiSgMOXt0_B0uhzNXAAM5w>
    <xmx:wVqhaZCFFj7dMt-LHLYVuTBmp18q048sjfw7koAKvPBMhqTeSHu69A>
    <xmx:wVqhaVIB3264bON7NJGum-trK_DULEFvHVCsrGVbwK02X2Xrf1p4BHQc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6ED33700065; Fri, 27 Feb 2026 03:50:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AULtxbNmleaw
Date: Fri, 27 Feb 2026 09:49:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <0b12efc9-0c3f-4a4a-b6fc-0e5c9a6d2cde@app.fastmail.com>
In-Reply-To: 
 <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13279-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 6FC941B4C1C
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality.
>
> Add some build-time validations to make sure the architecture-specific
> glue satisfies this requirement.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Good idea

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

