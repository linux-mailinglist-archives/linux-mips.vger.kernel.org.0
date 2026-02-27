Return-Path: <linux-mips+bounces-13281-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNQFNwBdoWmDsQQAu9opvQ
	(envelope-from <linux-mips+bounces-13281-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:59:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EDE1B4D39
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B4273056B47
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F5E3A9DA3;
	Fri, 27 Feb 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B7eMZx4h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WJzCKqPG"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286C36CE03;
	Fri, 27 Feb 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182738; cv=none; b=BcfOtDV7bkwqSAWAG71WvWKa7SCzW0l2oz3fL4YtORyiaYJG0qeNtsO3Opq0DPUdEaTkjAckIS80y/deuARlfLebsEWOBNXYijJpuYWFGSjFpQ5aGKOXTlDpmQ3tSFtwI01WMiX5xx97lWyA46FtCMxP+rKIdb28DynwX9bJ6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182738; c=relaxed/simple;
	bh=Wc4JdZqzTPrSWBdKeH1Rt/v4PYqJ31SJ3lwRj447W+4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AW9TOEWKdgqTL4E6P9JuPukPZdiuJJ7NkgN0jl30lLgn0YPEcfP2kHh3ZP/RbZt5+eBSpderlPZ+177Iru5Mm58R404P7UG72Ob6fZRwXhocpFT4aPCJ64FijgTS1pIdj2QOjvNpXvG0FmPP2Fy+ZZcaGzCA/e+UbGL18TQZm74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B7eMZx4h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WJzCKqPG; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AAFD61D00127;
	Fri, 27 Feb 2026 03:58:56 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182736;
	 x=1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=
	B7eMZx4hKVMLP4/fUiBh5TwyL0/COXRDHA3c32Ydsu5eXpS7xYjIi80vE2HFdW3u
	dytOj2XUHXBdqdO7IwWHRAZmOzKKfdUqltsNHWshkKpVc5IhR0mXW7TXMuAz3CP3
	iz0rm/K+wZmyU3dNxo/SCg8l5pskcKRR2B58cinrX8AI6OE5KInXOancwZjGpjDW
	b5vxVDZs9Gv04y6d4/Dl7KYbPv1Q42h0OYKJqQxBlvc1syWIsd/fad3vyr2HNCob
	Sw63Ja2x4rfLahhkp8QVi7W6JaDgm2u8n2DJVn0zhjCOaiUjmD7PReXWSLUgS743
	Etjjz/VSUL8uTZ430bDGPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182736; x=
	1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=W
	JzCKqPGj+ok5fdimIrdSvoG0b2rhDbFbxg+Z4oV6TBEWwTbmv7GJpVuaJ10WAqhb
	a3orhxuqeIogyQbj+bR/3KK1iPsv0AlMfWsuo54nZnM8fNcXNLFAwa4b969gaqU+
	EI7GCT6TXi3Frms37bg7jozgJCHJOkDaajfuoUbLMW9+qJSybjnv+qlYXW3dAbgs
	SBLBMj9/QVwsTv0Xws/GSeZi0XB50dN8V67LhpCQ5bgSE7GnVKCzgJ1K8UUxOH/J
	23SCTtoUuKenXzJOTIjZ4ZCYrEhH+SRCWXn3BEfNecm2SSvMH9D95xKdd7Dm0rx0
	Sja6fef77et3Z2hHGr42Q==
X-ME-Sender: <xms:0FyhaQrK2tHArSP0tjf6QtNa4PmQw11xpvTel2O84eAuXPW41C7Tgw>
    <xme:0FyhaRfWc7T5yfllWxtssXaS-uATvEDw1YPopV76YXZBxmpw_oh0Pjg5cgfMppFGR
    jr--RmHJ-gCaZ_64RHyEukfkNFYJvYI1kfdQ86lzN--SxpWxLIULTAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0FyhaQr1uk4-oN-CjkdyXVpeCTOgFy2L34CbK9ea3nr5SOtFxcj3hA>
    <xmx:0FyhabhEShFKEkqU8z1w5P_Qk6OAfURF76oXBGYYX4nEu5yxa8I_YQ>
    <xmx:0FyhaSyjKFiFOn0MP6LM4SXCmeLmyfnKiew9Y5uoziXjb-xyU5UX8A>
    <xmx:0FyhaZ_RGa3TuNh5CDrfbBzUxxwVNHibdt9uXrhzeqhL9toSU289Pg>
    <xmx:0FyhaR098kJ6FLglrpM-x-UirrOo6DBbRUiUGfGAseQHx1zY4r1LSwgC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E039700065; Fri, 27 Feb 2026 03:58:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Fri, 27 Feb 2026 09:58:35 +0100
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
Message-Id: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
In-Reply-To: <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
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
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13281-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,app.fastmail.com:mid,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: 74EDE1B4D39
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
>> provide any 32-bit time related functionality. This is the intended
>> effect of the kconfig option and also the fallback system calls would
>> also not be implemented.
>>
>> Currently the kconfig option does not affect the gettimeofday() sysca=
ll,
>> so also keep that in the vDSO.
>>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Actually, I need to revise that. I think gettimeofday() should be
guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
vdso. Looking back at the history, I see that we added the #ifdef
for each syscall we modified to have both time32 and time64 version.

The thing about gettimeofday() and time() is that they don't have
a 64-bit version and libc implementations are expected to call
clock_gettime() instead. The result was that there was never a
patch to turn the off either.

     Arnd

