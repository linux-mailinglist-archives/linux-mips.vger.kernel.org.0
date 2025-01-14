Return-Path: <linux-mips+bounces-7447-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6432DA11089
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1D81887206
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 18:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1C01FBC8A;
	Tue, 14 Jan 2025 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="YQxkEXKT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d7dMxaCe"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B881FA8DE;
	Tue, 14 Jan 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880976; cv=none; b=Wv4g0rpnMS5X9Yk42QRGB6exZ2+dYKIgx8ChZRmmBdWkCBRdEbp4azwP+ZgEbo7v+SOw6/w06UQN/ryVTAlFAK0ZyypyNlhwF98bJVZYefd428J/mpupcYLjsJ3BGCcwyfe3QHsxfaA7qyAasPs5A3DsCCF4k8mD1Fk/KzSTwfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880976; c=relaxed/simple;
	bh=sryMc1/odiijiFjmySjacbNnYwGd1t/SJgxvfx2Xmlo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=u4In/O1qlXpWWn/kVjgphTrPq5VXbIYlJ/w+WiVjqbSJxsy5Bb/EV7WEYKYW3fSMYiCvzwn1Y+B50itXPdcnFVze21I5NJ8/yaSvX+gsdh6SSMW+cSs9wL8tz5KqS6LHm8eaez9y+tYhKq/rr3w9k5NYbit4eZrdNi0XGr/5jm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=YQxkEXKT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d7dMxaCe; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2BE861140214;
	Tue, 14 Jan 2025 13:56:13 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 13:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736880973;
	 x=1736967373; bh=sfOwtkEr60lvj7i8fxk0VyRDF5MitfefAC4m/DiGyuc=; b=
	YQxkEXKTIPbD8b46EhZTI4NP6RNTJwbB0q0jQJRhCp4ZUqw1PTOVPTZs3MvjZxyX
	Fr4949VHpNgE353gWJALBszecJ6PeYtPBgcp3aU3GsBCDxfpJ6Anw9r0ZR3k5f+r
	CIxiwMJp+VhZI5R8RRmRserpfvSFOwX49FczBa3zSsg/wu0CuQM/D7IflBNqg9D0
	quil5J+vzMCgb16pc8+iOjiF35its7D5r4aifb2oufnTzuGE5t0FWXIpzOBodWtM
	A4uL0xrfwX1J9YSRv3JPT88NWyI/ozSzcBuNtExzgC5qERTUPZAA/7S9qxXh7WTw
	ii5Ft2aq6jdcaYx9Prl+fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736880973; x=
	1736967373; bh=sfOwtkEr60lvj7i8fxk0VyRDF5MitfefAC4m/DiGyuc=; b=d
	7dMxaCep49mDrsNFYZRq5OG8vSLxgstIo8s3fg92YMuU+2ql1quyzGmqZxc+X0dv
	chPdfz2+LWPEa0s114j9EMU4ZgfQjovIeL7bQKmYqqKRaCuHOMIh0U5xh6Pba+14
	pno9w5up10rfM/qUPGY2ybZMaUTc2mTYCHsNBwQ1CKO2XmBC03au37R7zp0ElCxx
	Y1xO7XmmjFbhDfVdEcoetxnp0wpnN14JZVoClF/M2qGuL+AZ7jCaUTAXXgq4dytA
	jU1CSG257AOaQoLUTi7p29lbqFKKXU1+NflXlvyFNH7BV9LLZLbAJCWAqvXBgae8
	f4dXnWPUQwT6gq9s7xjJQ==
X-ME-Sender: <xms:TbOGZ5MIMMcRsj10u2d9fbNOmK3LK-lQnMDdy7sFkl1gPj9a7OL0Hg>
    <xme:TbOGZ7_UoaD9DPAgm2xBMKj8hh97sqRoUTOE5ITJxP5XRcIYheJfDxIJtFF5TsJRs
    kv32RfyCcRsCjOJUPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeevtedtueevfefhkefh
    udfggeetjeffjeduueehueejgfeludevkedutdeuheenucffohhmrghinhepkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoh
    epkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhp
    hhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpd
    hrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhr
    tghpthhtohepmhgrthdrjhhonhgtiiihkhesohdvrdhplhdprhgtphhtthhopegshhgvse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:TbOGZ4SHf4Mn5J6Bflmy4CCGDCNNwJ0ihT7K5OSCQNQiFgyiku_L3A>
    <xmx:TbOGZ1u3oDuNfvdBq8zAV3hUGFog57IOI44_IwtabZKA7qJfBZsFsw>
    <xmx:TbOGZxeYUfaR7WRLkdQE9WueDUbKj7gqKRATEJrR99QsKSAyxPA3Rw>
    <xmx:TbOGZx0IfdcZ1nqltUHlaxh-gvY4trJ_y4PMDKXSGTjv1AnYN07zcg>
    <xmx:TbOGZ7sMtgVh2Wd5BBS7-iej3L4yBsjcpfRDjGI48z97djN-sScjuIi5>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E8E3E1C20066; Tue, 14 Jan 2025 13:56:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 18:55:53 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Arnd Bergmann" <arnd@arndb.de>, "Baoquan He" <bhe@redhat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Message-Id: <7fdfbadf-3ed9-4b95-84cc-418cbc9e1997@app.fastmail.com>
In-Reply-To: <2025011441-mountable-glitch-da1b@gregkh>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <2025011441-mountable-glitch-da1b@gregkh>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8814=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=886:46=EF=BC=8CGreg KH=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, Jan 14, 2025 at 06:11:58PM +0000, Jiaxun Yang wrote:
>> pci-legacy systems are not using logic_pio to managed PIO
>> allocations, thus the generic pci_address_to_pio won't work
>> when PCI_IOBASE is defined.
>>=20
>> Override the function to use architecture implementation to
>> fix the problem.
>>=20
>> Cc: stable@vger.kernel.org
>> Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
>> Reported-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>
>> Closes: https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c755=
1@app.fastmail.com/
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> This is a quick fix for fixes tree and stable backporting.
>> In long term, we should get logic_pio accept fixed mapping,
>> and make PCI core code aware of platforms not using vmap
>> for PCI_IOBASE.
>
> Why not do the real work now.  Don't worry about stable kernels, fix it
> properly.

:-( Sadly the long-term solution is going to be a huge effort across
architectures, and I'm not even sure if people will agree with my approa=
ch.
So I'd prefer get this fix applied first and kick up discussions on a
long-term solution.=20

Will post RFC shortly.=20

Thanks
>
> thanks,
>
> greg k-h

--=20
- Jiaxun

