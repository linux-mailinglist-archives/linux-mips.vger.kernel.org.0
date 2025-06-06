Return-Path: <linux-mips+bounces-9161-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6EAD0333
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 15:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CF177A16F5
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 13:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F242286D4C;
	Fri,  6 Jun 2025 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="y89NGOqs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="omhTFxJB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C72F2E;
	Fri,  6 Jun 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216671; cv=none; b=dc2osxqkNmAIbaMSxDSys1oxXfSTLyTvCkr3QKRDIWRFmUPZPNAYS0TFykO70SIEHHIrwVhsg9gAti71wjDIYhEhg6wqZEvN8Cm6Ey5r+0eo9zDKDpZIDkL+Js5KV0f6pJX2SpyvDTc1McdpWa7gMnK8H9xcJE9+w+oY1D/1384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216671; c=relaxed/simple;
	bh=N9Wy1DLXhhISqceJ4s1aGdwZLuvYZPRCEL0gR1l+Rv4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bktsA1Fx/BMpcuynE41kkJY17RJfNWQe8HRp+46CpBZIC1Me3Ss+7I4OPTy1hNnFXwUBXC6QquimB9nF3K268/sLPtKADSJHTsi9yQXxhHV+gP2ERkVWstW+I+jFDqhSxcRx8zz2J5nF+aLjMPnKp4gwDcbq3Pi2ouAgmTomyuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=y89NGOqs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=omhTFxJB; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5C6B2114017E;
	Fri,  6 Jun 2025 09:31:05 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Fri, 06 Jun 2025 09:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749216665;
	 x=1749303065; bh=N9Wy1DLXhhISqceJ4s1aGdwZLuvYZPRCEL0gR1l+Rv4=; b=
	y89NGOqs+DarZJgbfqAm+EDavPOclNYRXH8bvhG3eul3FsnnSePAXHG81xplfpSs
	U9AAB69kZwQDf77ItFKMVd2XYVEgogZ2zh87Fkah9hzgPdMzm7SZssZVgN6e/vGL
	THBVMDrIAPS0C6lPucTk4F6emLIKL1sVgdkyfwVYVj9qR2DqSkB1Gf/BB75ab36c
	KuTt/ieEn76riHaOlFCNh4JZLZbmV05x6cJN10MRy4KK7E8OWEymrjC0ZExPZhUX
	FICtFKeJonwLAFJhAIe/n7N9NmSrgQNnfh55wLRrHoP97q/dvt8fzeWGYr8Meoyd
	hb4I4iJ+aX+oWlxBlFB1yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749216665; x=
	1749303065; bh=N9Wy1DLXhhISqceJ4s1aGdwZLuvYZPRCEL0gR1l+Rv4=; b=o
	mhTFxJBV2G4IaP30Kawj8S7hVwmCO9bc9XxOlsbAYfNSqJuy/nVyXBzxzz0wq2g9
	uDVQ6cRPUkwMrMO18E8ezlE7lVG/8lJMi9hkLfbYll2HFJrDdgjrkTovHxHCh9MC
	uHt46xiqrZgtJFfiANqnqshWq1lGeMSnfFISy6WZbwwpyizAIM1gbdZF3fjSV5PB
	npPk2lTyyHmqo6iXV6G7fyRpQsIutgCmXhPK5W40qkvs1tD/iBsm3Eh/EDV8OXlt
	x+izrM+0o46+G9hYFUcC15TrNzhdsGYN/ad/4leWJNLlhf9iNzexxJc6/VwaBBYJ
	pfSOiR9OFlNTSBR74sOpg==
X-ME-Sender: <xms:mO1CaF3y-PoQRmBUsux-o_My9SDfmboERuV5KrkgNAQ9XsBHmpQALQ>
    <xme:mO1CaMHbcOH2LMejk0ZdOW1Rj2_3FeitSGcR4CN8_1mRaa5fVO1jjmKNKxpqs2VOU
    hpHUf9uhWah5CJgDHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehsthgrsghlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhi
    phhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mO1CaF5PyU2ISWJI6C87-K0tOmypjUbpRv-kD5vcTLhqBWJ-ib3x0w>
    <xmx:mO1CaC2rkO9iKjqDn4T9CbJRmnIJ8TuNhMAXg9hjDP-UdyNRkPyp_A>
    <xmx:mO1CaIEUIwrhbZYsnyxsRK3jqxE0AT89HPVWLdQkge2NQDUxz6lexA>
    <xmx:mO1CaD89LhunXFsKt-IPdD9Xz71LVYRdcWziAd4IqnvQDe7TIfxr3A>
    <xmx:me1CaOfWZhG6k0IdECmyaog9GBQ2ro84lnkJK8oetKefBmkpdkK3J9yv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AE41E2CE0065; Fri,  6 Jun 2025 09:31:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfa3886415041e94f
Date: Fri, 06 Jun 2025 14:30:43 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Message-Id: <a70690be-64ba-4337-bca2-23f93b645b62@app.fastmail.com>
In-Reply-To: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
References: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
Subject: Re: [PATCH] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B46=E6=9C=885=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=
=8D=8811:02=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hardware or bootloader will initialize TLB entries to any value, which
> may collide with kernel's UNIQUE_ENTRYHI value. On MIPS microAptiv/M51=
50
> family of cores this will trigger machine check exception and cause bo=
ot
> failure. On M5150 simulation this could happen 7 times out of 1000 boo=
ts.
>
> Replace local_flush_tlb_all() with r4k_tlb_uniquify() which probes each
> TLB ENTRIHI unique value for collisions before it's written and overwr=
ites
> any conflicting entries with safe values before initializing the kerne=
l's
> UNIQUE_ENTRYHI pattern.

I just realised it might be easier to cycling ASID instead of address in
Entry Hi.

Will come try a v2.

Thanks
Jiaxun

[...]

--=20
- Jiaxun

