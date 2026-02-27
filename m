Return-Path: <linux-mips+bounces-13278-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ar5CBxaoWl2sQQAu9opvQ
	(envelope-from <linux-mips+bounces-13278-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:47:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E921B4A70
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E0E93075E92
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127C2311950;
	Fri, 27 Feb 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cGvNnKUw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vSr2hfZw"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C022823DD;
	Fri, 27 Feb 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182011; cv=none; b=OAbuXOmYXNxSBTMdRBNG15NSxuPwSlG9tOlsgnfCG7BpUShdFqyGluXvf7B6J9BlQwYDHvDB0Gt/qTfEnG3x+Mm1kBS0RIb8jz3yn+tqRl4Z6DSWumxn4SQGoVdDp6jVNm85rcbewR3j/hp0hK/osWR50L+vGUYRGmUL3elPKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182011; c=relaxed/simple;
	bh=MRDgMs4hHaQ4ihA8DAv86+UhB5Z5vBtI49syHm/gz4w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OxZ6JwMicMgahFBF3eeMT9Rg9CZTQmMO14vF8z0KFgr6rhoxHu0caonqFbM+dw5gRjY5eJYBZampBVFJJs2xWjhWeyKa4yXg4qhQag9h+wAnDEffEM3Ut7KeE62KS5A892/wcWtKo1YEm+wny0Z9tAbSbwFaxFGS5qYda/5G1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cGvNnKUw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vSr2hfZw; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 16B9E1D00147;
	Fri, 27 Feb 2026 03:46:47 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182006;
	 x=1772268406; bh=F+3BcJKrbmh5HDXIlppj+4J9SMA+tEFmqsXlBVhyu40=; b=
	cGvNnKUwExIKhugmG3txxHJKsmYF7sQOwK4ZFPWd3YWKyXSMYAvngw9Kh8yQdsV8
	AzyyVFf3ZJcdrfJii3QFpJn/2gJOVgaDRD3Vq73CDw9t2oQ3Ga/2zZjtv1gSd3HI
	ikm/fHOfDFZAOro++75wFTe4TXopEGt6Uzr40J9TaubVGUlWRILEYPwTQsarfFfs
	MWORvyQObYvojwJtpyjFEsmedVxXnd6i74sxVm7nAZm4zKFJlT9e74xKTWLiw7Xp
	OIqbMV+sQqtJJDXEVW8Fa4mS29pFJyOtM1dShfUT5S1f553juzm0b3MB16EDRJTl
	nDSSC0lC42tekS3HS1soCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182006; x=
	1772268406; bh=F+3BcJKrbmh5HDXIlppj+4J9SMA+tEFmqsXlBVhyu40=; b=v
	Sr2hfZw59Q8neZEcZ8v0I4dpVvdYjE/ofJV6gLELXY95W7UWgeb3aYrG2jUz3xpA
	wfpNl480fLte+YUDJ1QkekZGDlAUxwIqPKIetIbwpPD7HDTf7YGdbJEzLuFw5+e+
	UKJUmors6vDjbFQEve6ArLpuosycSVZl3HjGmuv0EQyCReWVsdV+YEl1n4KyTRSo
	eu5MRRfvy+K6g3sPPzjgqCtPPDiDg9YPmXbsekks8rWFjIrlcN+FS2Xb6YzFz7La
	ltqrX9F6WlzcP2WWoCSA/nf3C+GL3euJBrjiQZFzHqVv9rciY3gwrpt+2KpoAj6O
	OFVWk5sTPkhZ5X7+XnOXw==
X-ME-Sender: <xms:9FmhaQEMS6SVdcYdRZgW_kT1IO55F7UdfwskkFSJwNwPf3pQgqLR6g>
    <xme:9FmhaULWNyvqb-9if6HIEi9E8dBdfdgEeviL-8RAECb2NrSySW54U97ZesSYhui-x
    uBcI8h4j4xdxAtC9YJSYwM8ZL49_0HB9Z0aG4ob1JSwJbs9H2wE_PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:9FmhaTgeJf8JakorKAw7334pjkusPDME-O6xuYJGuiYYBToV_lIUMg>
    <xmx:9FmhabnUpS3zRA3x5jyvpdBF6zC2epEpxNq0b5cSVGVkIA5Dadq6kA>
    <xmx:9FmhaTFlQMPBza8GR8LZ5S1Fpbf-o-agGmzpPeS8JMDHtESMO1MRCg>
    <xmx:9FmhaVMP0saCF9AaIT-zzAYDh428TuJ-YSKQomKcDsIyI56PeTlk8g>
    <xmx:9lmhabF0NvNVXamTn40LHRKq3s_HXqsl0SmilA9rziUipV6RkGmWh2P5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C38D700065; Fri, 27 Feb 2026 03:46:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AC9z6Mxcl7jk
Date: Fri, 27 Feb 2026 09:46:23 +0100
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
Message-Id: <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
In-Reply-To: 
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13278-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 99E921B4A70
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> This configuration option exists so "that we don't provide the symbol
> when there's no possibility of there being a usable clocksource".
> However it only covers __vdso_gettimeofday() and none of the other vDSO
> functions which should be affected by the same circumstances.
> As these are more widely used than gettimeofday() and nobody seems to
> have had an issue with them so far, drop MIPS_CLOCK_VSYSCALL completel=
y.
>
> The removal of the ifdeffery will also make some upcomming changes
> easier to read.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
Fix gettimeofday() in the vdso library") as a bug fix. This may not
have been the correct fix because I don't see how it addressed the
case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
CPU without the timer registers, but I think we should try to make
sure that there is no regression from reverting it now.

> -config MIPS_CLOCK_VSYSCALL
> -	def_bool CSRC_R4K || CLKSRC_MIPS_GIC
> -

An easy alternative might be to drop the entire VDSO in
configurations that turn off the gettimeofday vsyscall today:

diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
index 70140248da72..4f6fba9e108f 100644
--- a/arch/mips/vdso/Kconfig
+++ b/arch/mips/vdso/Kconfig
@@ -3,4 +3,4 @@
 # the lack of relocations. As such, we disable the VDSO for microMIPS b=
uilds.
=20
 config MIPS_DISABLE_VDSO
-	def_bool CPU_MICROMIPS
+	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)


    Arnd

