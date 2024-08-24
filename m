Return-Path: <linux-mips+bounces-5056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B495DD3F
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 11:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB69B28365D
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0333154C04;
	Sat, 24 Aug 2024 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="5CKi7v7e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DdO+oGL2"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85014EC59;
	Sat, 24 Aug 2024 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724493168; cv=none; b=mtNEl1ybVrpQ6G03MuoqBagDUlbts4fvu6rMO0TSba/74mVsPDlmJ9NuvizU76pNx8mK24Sc30sMOABeN78XRgmdVgIHWoQcTvBiIBPjyTxXjfP4xZt+qVzkiC9i85r9/7cmzGzlgf/bLS0PT0kHhpb6/ZgnnA2smVeWz8+N4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724493168; c=relaxed/simple;
	bh=lH+AZmFBMSxbaY7E/WSy35ajqxoT4915UmQQKp/g1ck=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S/fJLNPWSmCkHUaky/u4lllfp2w6A4pRiYF7ElwV1DGA4SnGfHWHfT9uIhggfjv/CDB6Lug9TW5HKnHGiQBTUsmnRnQDJC73+p+5C0MCbmLVE383rZFpApxftqNxA6Fo25z34iHcdg+Rv08Inp86+laxVXDIVmyvKMWNGHob9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=5CKi7v7e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DdO+oGL2; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C6237115208B;
	Sat, 24 Aug 2024 05:52:45 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sat, 24 Aug 2024 05:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1724493165;
	 x=1724579565; bh=lH+AZmFBMSxbaY7E/WSy35ajqxoT4915UmQQKp/g1ck=; b=
	5CKi7v7eybOhaomKbbzXugtBswr/MWv9csonYK9j9CI97FdRH9I6tfbHakPfknfn
	OooXSnooZmVIV/F/Zv8jLx8p0nLH+YDByp6AUnyJQCuQlwgxvvNtglV4jfrh5f/E
	1bAw1lafsKSj3kBc9a7Bt4nrYfYaK5yhBz1mSAasgN5DQ+snyVIURIEOaSLiOIUQ
	ACUi8iK1ErexgqkQjpGUDpU4uj1I365q57xW05UUgUfTSbglbw+9J3eXxCGD4dDA
	CHXOCm1FNJfyVAB734pJQLJqczqadlwP1LOHlw2HX4L9H/yqR6NazzzAzq4Vho8G
	Wx5H0on9j6N7ydqEe8m8rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724493165; x=
	1724579565; bh=lH+AZmFBMSxbaY7E/WSy35ajqxoT4915UmQQKp/g1ck=; b=D
	dO+oGL2yzQ4IDDSDo/nKrrjyI4jKN5QNvDqigHw9d3wJXZcItZ7+1TZelYrkG9WC
	8NEEevvI4myuZ8Anz44olgXMFG2xTPTLARFH0zB9vOON9Fw+1rJUubzxJg7oOjAG
	w5B7bKGs/oYs7bORe54ashjjWqIFQN6so9WhtIykOa8fwbNEbnhzlgbusuFMSllZ
	SQsEvCegqB9huQZnl24ej81Cu1V0YTODYRtE8/Faet1yi9abI/XkMcFUse7K0M5i
	0jlrQ2h0DlMt2nSBgu3SWkJbUzmaKQkTR87hP+07uItXOYZXLh/IZ93b6ij5kGjX
	PLrjdyPn/VfTiLNGKOBNw==
X-ME-Sender: <xms:ba3JZodPNb-622dhZaDSdWN8MQDcNCXzz-v8xU-Eq1EBOextHrF_SA>
    <xme:ba3JZqNCkPnTy3mgXwrNden2Xup__MI91A9VxFS28Q4hfbnGrpeOt8hSBE7c3gUxy
    viq_a_inIVbs8A2Ncs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvgedgvddvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ba3JZpgp750SS50fl8d2q_4a0P--Xv-O_0kL99DjanJXiqXKN_rQxA>
    <xmx:ba3JZt-xNou0N_wHS8nms-XjPjqkJnFBONgqQKHcYhs334SOYrk6Bw>
    <xmx:ba3JZkva7wF1zYnEi2Aso2kaQ-XhYkHNI3qXyuLmFOz6dJ7BZuTNuA>
    <xmx:ba3JZkHwSRlhWJPmhbB1uXii8yPK_BWNCITFk66uakEEV0-2sW8MzQ>
    <xmx:ba3JZiComwim-YrTzqYHD80nfdEYDjYaCGEgEIUCgqlNVLtt7ZXE0npt>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 300C51C20064; Sat, 24 Aug 2024 05:52:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Aug 2024 10:52:24 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Gleixner" <tglx@linutronix.de>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <802e542a-234e-456e-87e6-391375068fc7@app.fastmail.com>
In-Reply-To: <87y14nf2u2.ffs@tglx>
References: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
 <20240810-b4-mips-ipi-improvements-v3-9-1224fd7c4096@flygoat.com>
 <87y14nf2u2.ffs@tglx>
Subject: Re: [PATCH v3 09/10] irqchip: irq-mips-cpu: Rework software IRQ handling flow
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=8823=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=888:37=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
> On Sat, Aug 10 2024 at 13:39, Jiaxun Yang wrote:
>
> Please fix the subsystem prefix.
>

Sorry, what do you ment by subsystem prefix?

Thanks
- Jiaxun

--=20
- Jiaxun

