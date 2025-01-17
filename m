Return-Path: <linux-mips+bounces-7497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E549A14DE3
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 11:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA1F3A7151
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 10:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E774B1FCF47;
	Fri, 17 Jan 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="geru5Syq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B2oF5WkX"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7340197A92;
	Fri, 17 Jan 2025 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110630; cv=none; b=riAP2fKZYesDqmx670wb4ZRU2Y5oQ4jv0xmgdZBvVL5poUDM7mNy9h4iqTGzW6dvrLepnx83LJVKeVtBns94S/vbC1/v8sQXEPbdugDQqh07xpjXK/WHrKtImxP7msSdJWjTycOeRhTPZXyMzxTD1Js8BtOX/FBufSDlcSdZv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110630; c=relaxed/simple;
	bh=5NewX8NHGPfNkZZxy7sp53SgRS6M8CFgWnW7r958JTY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oEjF+csaAwK44W4RJxaQs9LRLUwiVWvj9xRg3fOcsQiiLbqJJ+uXzI7aY/GCL2ssgKh/rHpO1ZVkPAiLhUXoRZYWq54CP9V6STjnztCZh2/yRlr9Pe4JtBJe8TsZYbVs2CYgsF1o83JwxxWGr3XIK7V2r//GGY2GwxAKHejTUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=geru5Syq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B2oF5WkX; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B08B91140120;
	Fri, 17 Jan 2025 05:43:47 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 17 Jan 2025 05:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1737110627;
	 x=1737197027; bh=5NewX8NHGPfNkZZxy7sp53SgRS6M8CFgWnW7r958JTY=; b=
	geru5Syqw7GW+AyBxO89327iRiLtoxevD9vie8au27kSQO9xKX3jAaVU+70FbV3L
	sQqbOGSWn20R6nKGqhh16CcOArulIFXmV2fXpN6WfCTVRbBjwPoKndIBt3+McS21
	Co8sfhmgrTm2hZnRphF7xPLaK1XEz1nXpzdUAebpNqVRdDUd6eq6sT4erj1tPgEJ
	TaxTbv5UFDFlsFpo10CaMm8bZGEWcxRJGezsQRLFugJ6trJI2TyYkhHuXPpLI7t7
	pNecpbHoYc43jYIIhxi2AHkC96KvcpXj4d/n6wDJqQFBVIv8aeDFU22PWoi8FZee
	SAOHYKqTzz5s9hOVOfURzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737110627; x=
	1737197027; bh=5NewX8NHGPfNkZZxy7sp53SgRS6M8CFgWnW7r958JTY=; b=B
	2oF5WkXsmKDnChg6TVrQW5YJ6sBVSkm6ek5DY6TTNzEsQUNAC61abGXlpQeZ94xr
	Qy45woYVPMOUQFhn2Wu+R4sS5NwUBBlAl0cr7dMyqtkwMvmYvQNwFZ65lZ/Qs4Y9
	jjG8s6PoFJuLwDORPBAnBtWfcdU+SwJ4kZy2rC56yF0pNLHP2X/nQVtMWN/nVXVV
	ccnKo+K0Tva7Tcjp4Dbk4e+oUce75sf9eQ7GvtzGCcxNXfcCdnTLopgh/tehN94V
	fPOfXROKZkAfFg1FV5eUetEu0BvHC0uLzCx2Ff0UQvia04qKRSJyNcxKL7A8Y0d9
	VjWwqaMdapvIWDdit/ONw==
X-ME-Sender: <xms:YzSKZxfgojj1VPkaYEcn4XQBtMALhZb2dCWWO2LmGVasx1a0d3_e_Q>
    <xme:YzSKZ_Mv2EEPxCrSHmCbLgw0rKw0g4DkLemALZOJHC7VcGp70s8FOWGliVcSSYpXY
    gd5jgEhHPzK-Zs_WcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnheptdehveetudfguedvgeevgfef
    vedthfffiedtgeeklefhuedugeevuefghfdvudehnecuffhomhgrihhnpegsohhothhlih
    hnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoh
    epudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvg
    hnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegs
    ohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhise
    gsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrihhkrghlohesghhmrghilhdrtgho
    mhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvg
    ihvgdrtghomh
X-ME-Proxy: <xmx:YzSKZ6gUhSnfSf-hBYKll4y7vbJcwRlnBitq-qW4GIW50Q9RmJ1KaA>
    <xmx:YzSKZ68n_D2zRfbEeIG4YUW2EFQp0W9geb-LmE4aAgq6cIOhVzqvoQ>
    <xmx:YzSKZ9vjm4Mh-vcQ4e-ZEo5DCQTpERaCtt0nTlGUbEy8LxINKCxmRQ>
    <xmx:YzSKZ5Fi4ZBpE6OTsXgcXOysArA5kLUbvGbGVflErpzy7D0GwphpDA>
    <xmx:YzSKZ2EmKb8b1aixDd10gEeM5dMbliZoRnvGvUvf6x0SkvYHua-EaKA2>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 228511C20066; Fri, 17 Jan 2025 05:43:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 10:43:28 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Rob Herring" <robh@kernel.org>
Cc: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <f9f11958-7c9a-47cb-b9b4-d921a8215ba6@app.fastmail.com>
In-Reply-To: <87a5bpwz6v.fsf@BLaptop.bootlin.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>
 <20250116153637.GA2567996-robh@kernel.org>
 <87a5bpwz6v.fsf@BLaptop.bootlin.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mips: mips-cm: Add a new compatible string for
 EyeQ6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8817=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=889:46=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
[...]

Hi all,

>>
>> These 2 blocks don't look related and the only property shared is=20
>> 'compatible'. This should be a separate doc.
>
> As mentioned in the cover letter, I reused the work from Jiaxun, who
> needed to deal with bogus CM but in a different way. In his use case,
> the issue with the CM was that the address in CP0 was wrong. In my cas=
e,
> this address is correct; it is only one piece of information reported =
by
> the CM that is wrong. I don't mind creating a separate doc if you
> still think it is the right thing to do.

Precisely I'm dealing with two kind of systems, the first is systems doe=
sn't
come with CP0.CMCGRBase, and thus rely on DeviceTree for probing the CM.=
 The
second is systems mapping CMGCR at inappropriate locations and we want k=
ernel
to remap it.

We don't want reg property to be mandatory as we are dealing with a huge=
 amount
of legacy systems which mapping CM registers at different locations, whi=
le we
have to use a uniformed built-in DT and probe mapping at runtime.

Thanks
- Jiaxun
>
> Gregory
>
>>
>> Rob
>
> --=20
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--=20
- Jiaxun

