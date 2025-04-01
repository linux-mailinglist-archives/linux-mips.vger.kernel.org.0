Return-Path: <linux-mips+bounces-8423-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B41A777C6
	for <lists+linux-mips@lfdr.de>; Tue,  1 Apr 2025 11:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1988A3A059C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Apr 2025 09:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE121E5B8B;
	Tue,  1 Apr 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lDte6dqE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V22fAY53"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6CC2AEFE;
	Tue,  1 Apr 2025 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499903; cv=none; b=I76yoFQpECqcqaev9ELla1x0IqHiCBpJERhmOPkaWhtlhKYXQomEXXkuLhKyaKXMS91e+uBDT5hpa1M9X6EFTv8Ez5N3+vkyul6qx2x9M0GROpRo1iaDqT3OgzH2AQbdn7LzNS9htGy0JHpjfWdtG1OWRY3Q1SKPRNLOD2HUb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499903; c=relaxed/simple;
	bh=jgYjzSXiFeavvI5uH2ljfh8Oel3js0wYnlAOFC3ySJo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ovo1Biv8LSFDT8ChWpxWZGQOkvEyZJSWI2FNnG2feyKf4nOCnzAU1xAfZ07ekL2sPldRj+7cXf/umSlG/hRlZfEB0iLvJV4EW0wOYRIC06OeC0xaL345o22q69xN0iCcVvlFPJ5x+rVlSvDS1Xg3qLpwLqQROyUezMHciZWdDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lDte6dqE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V22fAY53; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B21871140099;
	Tue,  1 Apr 2025 05:31:39 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-02.internal (MEProxy); Tue, 01 Apr 2025 05:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1743499899;
	 x=1743586299; bh=26kfGnH2Kam8l8xczFEl8FkUmZLoeycEawM0qxbDrrQ=; b=
	lDte6dqEaKhiXV0GQB4jdq388VWaTiXgYA+enf1NrgNXR/afXU3QPaok+s2QZq0E
	rByr8dpL3k0343fCVF1cLiYPgIILKmMe+GJisMlt6IbC5jks/dSbAF8EnBDmzkcD
	RsMjHFvWLIV/O2zs9CQqPPbQV1GUYRZdlzXbktefszZAXgBFvc7JdAtEK529Zf1y
	9ZjGiDJH/bdoZAhhxBJD81VAhzvySqwSzTA3iXK2SEaBFltuS7Bzhlk70A+ByY4v
	CgEPwJk+tjRh3YEKOvFwNUuoSfLhd7QtOEGBPNSwP01Y+XYe/7HtYj78j6i+uVQ3
	ESculMzgiyBB327DdsvtFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743499899; x=
	1743586299; bh=26kfGnH2Kam8l8xczFEl8FkUmZLoeycEawM0qxbDrrQ=; b=V
	22fAY53qAtNJ51n08velihowB8lDUYILoef72sobNhVMrg+K79zc58XCXOCbRMsi
	YeSX9EXQTBlwNluoG1FvWOSGzVyG97nuz35e5DAElYbt5UjA92ABNDvvn9Kf/pem
	hd1hJOgVYyuyYU0ZyBfUHXKNy/VKzwsfmSH0bSuNNiT4tydc0/FJEuYQw3NlAeIm
	K32BI7E9Zp588HJog1l8AJ4yzCTru5QNdx2hbV9p0luYTCstz46mzRDWQqqRMgbU
	AifO0H/yrEgng1o9vsu6e4KssIBobzOYGIRQJfIdZw2N4/AV6qaKXICPJfO702ZH
	zFsynNRzXEeOPM64v7iKQ==
X-ME-Sender: <xms:erLrZxJy_3ycICMYvWA0SbTJEMz-6Y34RrZR48rG8tthqpLQIZC6bA>
    <xme:erLrZ9LZzcVBUhsCnVEAPiESEadIWSrq3sELP2srRfcYRa3uEd8E-_q-DHD42rrW7
    WYxSMaYwXbDSxl_SXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghngh
    esfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdff
    keethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghhvg
    hnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhitges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhr
    tghpthhtohepmhgrtghrohesohhrtggrmhdrmhgvrdhukhdprhgtphhtthhopehmrghrtg
    hordgtrhhivhgvlhhlrghrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:erLrZ5vCUAu-I0p9qAgpi-PDmIwnocSr2raCFhwEW-_BjJB59r1nBQ>
    <xmx:erLrZyaKAXaSFOVUT_q1FXy8HLt2U-mrCVPleGZNDdwnHfyk27ph8g>
    <xmx:erLrZ4a6ESz0wt0LqlxlhHxDXBHQ7UPLBCbACSVb5ntI12oApAg3rA>
    <xmx:erLrZ2Brj1kav_pWJWU7zXHqup0VtbVYR85Z6QqHtFSkQm-yILDHyQ>
    <xmx:e7LrZ2mAxe_ZFIPCpFOF7w21Gp0nSGXjwzGhxfmpg70GCP7blgmnK-xk>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E34F1C20068; Tue,  1 Apr 2025 05:31:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf2d86106c131fe8c
Date: Tue, 01 Apr 2025 10:31:17 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Marco Crivellari" <marco.crivellari@suse.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Anna-Maria Behnsen" <anna-maria@linutronix.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Huacai Chen" <chenhuacai@kernel.org>
Message-Id: <3f7f6ced-98e8-4101-aa83-3692e14222ca@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk>
 <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk>
 <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
 <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B43=E6=9C=8831=E6=97=A5=E6=98=9F=E6=9C=9F=E5=91=A8=E4=
=B8=80 =E4=B8=8B=E5=8D=889:09=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=
=EF=BC=9A
[...]
>
>  FAOD I have one MIPS32r2 system wired for testing, but that might not=
 be=20
> the most interesting configuration to verify as it'll now just use EI/=
EHB=20
> to enable interrupts ahead of WAIT.  I could try an R1 kernel instead,=
 but=20
> I'm not sure if it can be made to work owing to the differences in the=
 FPU=20
> between R1 and R2 for the MIPS32 ISA.  I used to have a MIPS64 (R1) sy=
stem=20
> there, but the CPU daughtercard sadly stopped working 3 years ago and =
I=20
> wasn't able to repair it, owing to the lack of available spare parts (=
it's=20
> most likely a dead CPU).

I can test on legacy (R1 version) 4Kc RTL simulator if you wish. Is ther=
e any
thing specific you want to test? I think I can try interrupt flood and s=
ee if
there is any deadlock.

The simulation is painfully slow, so I'd wish to minimize test vector.

Thanks


--=20
- Jiaxun

