Return-Path: <linux-mips+bounces-5410-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8077970215
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44726281FDA
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE84015AAC8;
	Sat,  7 Sep 2024 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="sOXmX+H6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VwEJTJgR"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14938F83;
	Sat,  7 Sep 2024 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710059; cv=none; b=pbAaoakIOWYxrXBzFTBDsfNNlZuPj2OMvg6OhxRScgN5r/Enl9mRLuhdKZWCMo0AcVaQM9CBzYIUFt0VlIHcBGzD66nXSqAC9Mz7Vseek9K1iw/IfgxQ2C66e7p0p+JNdsXcxvXwpUxXHgzOPYzocTnSLLIlnrzYXB7OlrIqmwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710059; c=relaxed/simple;
	bh=74HYkxaTDCmYoIeFVfJvddkrcPJVvqrYYwPCdQE+Ev8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eabH1LfigII9oZlzZcbnezy33VAbdc0OEvcg7Pt+oumyIbHyLH54K6DoYC2siSjnGnThAVSphK9BeiZ2Jq6JEo/TPzJKQI2wCBLl6/5ZbRejfFYGQdk0InTJwTIUeW4aSJyRF6koqxZEwZGPnsa4myWotNItZ5uHFEIwYok2XoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=sOXmX+H6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VwEJTJgR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 534F611403A7;
	Sat,  7 Sep 2024 07:54:17 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sat, 07 Sep 2024 07:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725710057;
	 x=1725796457; bh=74HYkxaTDCmYoIeFVfJvddkrcPJVvqrYYwPCdQE+Ev8=; b=
	sOXmX+H68LzyF2CMEDjTefmA6T8c0cb0NlHZeg80X/Iz+05Buxs8lm6559zsacCr
	o8iT7ETuwODLsXj6YSGh5adFuMJNg/+k7b/r+S8/F1EmTcn2DumKk/CEk13eWRIF
	yNpYfOPLtKIfzoIwHEZEQk6NpkMd9VS1FpT247Eew02JdY+gEZTg+MJoTIJ/VWOg
	Af3gh1IRlV8l64UXp9vG19cya12zYpjThTk+wxnE4kcYT/18MGqtVy1IPGi5MZ2/
	krKC7evTkcJQPpikyFkkxgG5UhDd09Nq/cfFTKmud4Dcb/iFMwBRZWrWHI+aa8IM
	cy2FiU5ECS6W3Up4MjZeNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725710057; x=
	1725796457; bh=74HYkxaTDCmYoIeFVfJvddkrcPJVvqrYYwPCdQE+Ev8=; b=V
	wEJTJgRTRU7M8CpmJp/d3sMc+P9+8u7LuWoRcSUdHqwjIjF4URm5LJBuo+6JwHGy
	eYfAXIwaKyRY+4GpBZYH+g5AOjRi+z8ilUA2PVGax/OafX2V5aK0kkQ9IP8S7MCo
	mZfDkiZTNjoF8ohx8e2j1JvjrkmBG/oIoZe6ade94AkhdyfzN8CFZHaB1fGOvi3P
	x/L3TA647LQkysur2cWAvybFpowKjIf64I91dBo7ZJnV3YgTLpX+xJycJDbigEnD
	3vTwyqYSTMqH4c5zotMiCd5mDTV1oqKtriMyjM+vD1kgFj48OhO098bx8bLE3ScC
	weMfg6IcVgzT3T3WhOBdg==
X-ME-Sender: <xms:6T7cZr8KBMreCVQty_PF0kraOZ9E19anT2KmZMB6OU98mmSpipwEUA>
    <xme:6T7cZntJancvy46NDh2g7r5wON_b7EQ387S6p1P4PkMv86B4q_MXoh5fG3WCRmZ5k
    cn9R4nZQZEoLJGBk_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrd
    gtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutgho
    mhdrtghomhdprhgtphhtthhopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehprghulhgsuhhrthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6T7cZpAjCrVpvHmduN844ws4Nd4vooy_p_SON2F0vsm7D8VW95-Rtw>
    <xmx:6T7cZnfw5x6KPfCE91r94RYkJp3tnIO6r375d5pKtR7-PY_7UO7l-A>
    <xmx:6T7cZgMRxKY8ic5pGtX4SYDxfsvOOovvMXMbrYe4LvRIZRbexgzF5A>
    <xmx:6T7cZpmMbvIxDylkq0QVojsG5kZA5e1t803o1xc0IBnCADsM90vinA>
    <xmx:6T7cZhgQyWD8ggtduc3SZXZ7wr4WEAPXcAOJ9Ljq2o-d7npQI5-vMYPe>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 234711C20066; Sat,  7 Sep 2024 07:54:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Sep 2024 12:53:55 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <a787d1dd-a99b-4fd0-9e9c-7e00f3a5e69b@app.fastmail.com>
In-Reply-To: 
 <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
References: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
Subject: Re: [PATCH v4 00/10] MIPS: IPI Improvements
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=887=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=8812:48=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This series improved general handling to MIPS IPI interrupts, made
> IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
> users on mux.
>
> It is a prerequisite for enabling IRQ_WORK for MIPS.
>
> It has been tested on MIPS Boston I6500, malta CoreFPGA3 47K MT/
> interAPtiv MPF, Loongson-2K, Cavium CN7130 (EdgeRouter 4), and an
> unannounced interaptiv UP MT platform with EIC.
>
> I don't really know broadcom platforms and SGI platforms well so
> changes to those platforms are kept minimal (no functional change).

Oops please ignore this reversion, I made a mistake on local version man=
agement.

Will resend, sorry for the noise.

Thanks
--=20
- Jiaxun

