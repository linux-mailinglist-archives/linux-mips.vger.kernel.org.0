Return-Path: <linux-mips+bounces-13284-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOziORFsoWmyswQAu9opvQ
	(envelope-from <linux-mips+bounces-13284-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 11:04:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89C1B5B87
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 11:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB70303CEFC
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F5C3921F8;
	Fri, 27 Feb 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lrmG/SqQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bMYZLxBp"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04336EAAA;
	Fri, 27 Feb 2026 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186637; cv=none; b=oGM/k5Eu/dK26ZfsU7GESK9fSFGRgAIf+s+MmNxdbbtKRVeX5Kcf/tuFS6CTlJe/SU6fi/0GnkZgfNvWAeZXP+HIj/XXoDXJW6VBxELwiUv1FpdEzZzPik4Vg2rQxYI50KeEpPJtLVlkCNycXdVM3YapC2QNamvW77RtFHpNDOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186637; c=relaxed/simple;
	bh=gHUGK1M5UKp0I0teIxUvCSNFeK+xdSMwGr3RbwOneOw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uEZebR4skMC2dLMuNldvzHMxTHz+4oeVMntubJAtfU4duYj4Pw/7SsBNxQcz4vnYMzqLH2J07+IVO27GyGXIJUvOQ5pZE1a1shwi98bnPxnr9RgBdPzJ3CVCn/Pqf+gAJUT7WmyzpRn6TCjSSpoKHdbyoq5NJHU5XuhXvKAr75k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lrmG/SqQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bMYZLxBp; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8617C1D00147;
	Fri, 27 Feb 2026 05:03:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 05:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772186633;
	 x=1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=
	lrmG/SqQnIpRcITU3E0XLKe+Y7T8Fgs99aJSdN94YJY2XfdV9Ymr2Lpp2Fd9A1h1
	93QEoC6K4RhOUU/0CXS8Q3y0jyFpfsgPJidPVp83NV4wvxaaU6ov9GD/HIoAeH58
	R36PuaW/OYXMBSU7gLzkRKjb6Y909d2WWWRce5us9F4DJdQLItv/yC+SQbZ8lx5T
	OcE4BQVUdiB39F4rs9bvLWeGU+2fJDdamENFL1vlG3oHgHF1qIg8qU5lO3lkRWDT
	sPgr1PAZpDU32yF4BxgcFDHOOeW5YhICl5cymsd7NmvQB+nrnONNrIHLIP7JYjrV
	tyLTTigwbetFiaaJW8MpGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772186633; x=
	1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=b
	MYZLxBpXhZv/mJ8+g59OMglmBI+6sDOkz3q7qSimffuFO990wOlZdH6PE4h7qltJ
	vh2rUBHLfFMP78Tv1hQq8Ht0f/fuzhlIvkAeYzNrf5JGdiRfzFU9iwDjHP1Sej1/
	msktaoVxQWZpiTre12+rZouOQ5QG5ccFJav5JRP+Id72/EMrYjRph9EYpJZkEZ7/
	ObmY2NPFFXPQcZmdaJIMXo/1GstLyM+mhCG5MsZpQAZF9lFaeBZ5Hb1zgLeJu6LF
	VdUDHQ9gOZ5sOhlgqCRvsNVL9HsN/+KW7COOT/NKP8D8yqE5qn00RxBGPxDXysBP
	QKwWyHrOg+XCDuteEf9ZA==
X-ME-Sender: <xms:B2yhaT5qOXD_21o2B_pfBMxe2xbsAZauhwJEgUFGmoKSTKyH8jRXGA>
    <xme:B2yhaTvEnO5qed2AJCMka9Koh9uWNJeDy2su-OqclA5-NSGJR-0ZjRWptBWiY6vog
    htKhgw4vdL4ESZbk6_dxc3dQHhhKX7xARjRDEvnbj3qTsHpLuNBTg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekjeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:B2yhaX0MMhK2hJ8xKYmKGjEeUCgFwabdV8J3J-4bQCQ7W_KL3E17DA>
    <xmx:B2yhaRpG1WW1_Y1W3dyhN1BiKGzxBLlmlIQe873sQvra-br8Y9qaug>
    <xmx:B2yhaX7RvPLc-eiFM8dDqfJc91ZhnTYp74OuIq3CHOn6f9Ki4qaI7w>
    <xmx:B2yhaRxaFWUSMm8gLpWuJeIN_bWR_6nGSVh1CEfd8Tag38ai0Sjs_w>
    <xmx:CWyhaU663-xqNWC5VjCK0RwTSsUG_79PFncgIvGG1hfcm2Zdv24MqNHX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC08A700065; Fri, 27 Feb 2026 05:03:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AC9z6Mxcl7jk
Date: Fri, 27 Feb 2026 11:03:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
In-Reply-To: 
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13284-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 3C89C1B5B87
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 10:31, Thomas Wei=C3=9Fschuh wrote:
> On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
>> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>>=20
>> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
>> Fix gettimeofday() in the vdso library") as a bug fix. This may not
>> have been the correct fix because I don't see how it addressed the
>> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
>> CPU without the timer registers, but I think we should try to make
>> sure that there is no regression from reverting it now.
>
> I can't make sense out of this commit. The generic vDSO automatically =
falls
> back to the syscall if it can not handle the current clocksource.
> There is no explanation *why* this should be broken on MIPS.
> It works correctly on my x86 machines.

Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
more details as he did the original patch.

Maybe the fallback logic didn't exist at the time of that fix?

> Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday=
()
> and apparently that is not broken.

Not sure, maybe nobody noticed the bug yet, or maybe both=20
vdso_gettimeofday() and vdso_clock_gettime() now work correctly
after another bugfix.

The condition is fairly rare, as almost all MIPS systems have
a working clocksource, the few exceptions I see in Kconfig are

- R3000 based DECstation
- Sibyte
- Ingenic Xburst
- Octeon

There are not many users left on R3000 and Sibyte platforms, but
Xburst and Octeon were reasonably common in the past, so it should
have come up at some point.

>>  config MIPS_DISABLE_VDSO
>> -	def_bool CPU_MICROMIPS
>> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
>
> That is an an independent optimization IMO.

The idea here was that doing this would save you the trouble
of figuring out exactly how it was broken in the past and
whether the #ifdef is still needed.

     Arnd

