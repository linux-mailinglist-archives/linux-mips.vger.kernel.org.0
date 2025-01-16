Return-Path: <linux-mips+bounces-7491-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C942A13BEC
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 15:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9426E167ED8
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274F022ACDC;
	Thu, 16 Jan 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="XLUeEbyQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TeWg/8RK"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3D22A81E;
	Thu, 16 Jan 2025 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737036885; cv=none; b=m5+/IhfjsYFV3u6cLYUXq4HjyPUFqDDE7F8mln8m5S99YFDT9qSwxtbXANbX5zCOFsDVUzhlN1XePInRASCJMs4ta3BcZUIK+OAoMr01162+HQOMtEjgqnW/piFy0YIY3lQx1nXYPapE2oqMt99Akf6yq1t/AOGqjNC72JsJ5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737036885; c=relaxed/simple;
	bh=/ZjbOr8RBbG3QR2fjnDs/cwdNMX6HAOtDdvo7uTDEEE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rsL9mP5PBbpg1r/SVFEJFSrkEDadk7eiEs/t2T0ggQoG1MmFaLvCfgiJNlCKXov6UVLvLgCHwV1QHkK1lGdWF/5Wt2ic8NFW6qZjo9AUtkDz5ryybxF20MaTwldLfe3eJj3e6s8iG8F7vwySxtx0Bw8YZvt92Fp+CK25r6TtYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=XLUeEbyQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TeWg/8RK; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 295BD254007A;
	Thu, 16 Jan 2025 09:14:41 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Thu, 16 Jan 2025 09:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1737036881;
	 x=1737123281; bh=NghXyxTzYo63ySlr4pTea8y+LGWNBA7haWJ9dGjZUFQ=; b=
	XLUeEbyQeIsYpRdqaZ21iYZICEb4bOJL7KLQK/R0u2DyKXYm9RMU/PtuY4N4f7RV
	Y6QPjwHUXoQh2qxI7P1fOGx3qgpZqG7iEvBZAL1tJDDYo2X14GJkAnRjX7PaMoOm
	O6DrrGl6bEGGlJv9/VSAmR7nEsbb9TfYxkLuIytzqx5JBWhpoUE3kuZnXLTtJYXg
	JNkPMLE+7LSid3ldrSYTVka06LwayRhZuo3S/a1HS5Axnv+3iVzvPQUITRVOwg85
	h9xpnXBHwbyEV+4vVk+7dNHerC9i4hz9YFUbwkvwTFeQa2PT6IeB3CqqLnAUBo8K
	Rr8Z+mAMOOU588FglCw9pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737036881; x=
	1737123281; bh=NghXyxTzYo63ySlr4pTea8y+LGWNBA7haWJ9dGjZUFQ=; b=T
	eWg/8RK0xxA2Bzl2aka2Nhn6rTHo3lYvQN8EhxAHnreF1lfhs9qAme+pKJc6Td4g
	Hhd+qbPNt8YXJiCdLIECdtrFZ9NAlB9yQ3j8h1QTbgLKzBc2CoAFQUhdf8SW2EaC
	CV4xBX2vVFhfqf29umbhY5CDUxF8Z6FjHkynMYtPAvkRv1QzLYiMawr8qf4l5cLu
	VfDNb1wfYsp9pJqJCXuqu34tKZBL+wp5ey/oFf2nMyzZWkjftCjCjg6t+VePASAp
	RN14Gj+N/RgJ7noj9QRjcvSiq56V6qLIrITVgid2C+x1Zx3PGjOokinptV0W6BOO
	Fe5jZTxQIvGAu5UbuDl9A==
X-ME-Sender: <xms:UBSJZ0JDnbRBdbjByflyCMgY8Z7_yMtgPzEb2XMeXtDu3POoREcdLw>
    <xme:UBSJZ0ILMbbK5q3CPGWHMZiR8KOEkxIyhe23RtEk2JfIpF3jJQL-xQAwkt5KMKwDK
    0ujZZhRMm1Xa2kYM90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtth
    hopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhh
    ohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprg
    hrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrgiffhhi
    khdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-ME-Proxy: <xmx:UBSJZ0tvNzelwfdRdMJd5u_FoAJo8ZzijQm2_qvZtM4qpT0xRAML9g>
    <xmx:UBSJZxYxnzjWBkpmWoVpn2v5MdVEIrazZKnTNq7VsOpElG7zZu2pxg>
    <xmx:UBSJZ7ZubbKWj-1WUFjoG-I69Y8uJpk9lzq-pdiHbf4UhjTx6JGwlQ>
    <xmx:UBSJZ9BDvq4CYuoSR2oX-RNPgunPFIX1DtQF0MBJjAhBbxppN_8axg>
    <xmx:UBSJZ_TC54AJk7F9UqxbsOQgykADq2cukkuFmMDt60LkD0FidfJAJu3z>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2C2251C20066; Thu, 16 Jan 2025 09:14:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 14:14:19 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <464f2662-cc22-45ac-8f33-99265851c0e7@app.fastmail.com>
In-Reply-To: <87cygnvso9.fsf@BLaptop.bootlin.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-5-fc52cfb7a19e@bootlin.com>
 <8df8ffbe-fcee-4002-afdd-98307324b63a@app.fastmail.com>
 <87cygnvso9.fsf@BLaptop.bootlin.com>
Subject: Re: [PATCH v2 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8816=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=8812:39=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> Hello Jiaxun,
[...]
>>> +	coherency-manager {
>>> +		compatible =3D "mti,eyeq6-cm";
>>
>>                 ^=20
>>                 Maybe compatible =3D "mti,eyeq6-cm", "mti,mips-cm";
>
> I explicitly makes the compatible "mti,eyeq6-cm" and "mti,mips-cm"
> mutually exclusive. This allows us to require the reg property only for
> "mti,mips-cm" and not have to provide it for "mti,eyeq6-cm".

IMO reg should also be optional for "mti,mips-cm". There is nothing spec=
ial
for eyeq6 on address probing and so on.

Thanks
--=20
- Jiaxun

