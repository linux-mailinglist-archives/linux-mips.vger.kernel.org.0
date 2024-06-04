Return-Path: <linux-mips+bounces-3478-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08E8FB63B
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 16:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD641C246C9
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 14:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8D1474C9;
	Tue,  4 Jun 2024 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="fIYiekmS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dEh4fzyA"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245C1448CB;
	Tue,  4 Jun 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512714; cv=none; b=KDxZbLuYavEJQBhGR4/2yfKE6zMsI7nkIVL7n2M4h/sJlr7IgdAEPOnkB22z+awsPB9tnpWdq3LYBzXMz9TLl1BsyMHuB6t41kB/wnNhmn1/kuA1XW5sBd3Pm9HA5Acdc5I38NNIb7QvLpwfuBIJGbuyRNgj2VbEHZ3J9LQNV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512714; c=relaxed/simple;
	bh=oxH7A7jHOC00jl2KczggEgfZrVmHaHme+p6JqJSfp/U=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=cogcDdrHpnM1aKVFO1rcjJ1J1qXCsz/7AgoTa8MYWlvI8fqWlXMxNZ///XzL8fUeDH+R5bCQPKDFwEdVmp8DfcZmlLY98Xd8cq7WoIoUedoY3JXHPH+d0XTd8Q5oXUJRqsMK+/vB+f7iWzWsfyWvpPa8pllFwmbQiwTskXgT+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=fIYiekmS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dEh4fzyA; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 20CA81800083;
	Tue,  4 Jun 2024 10:51:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 04 Jun 2024 10:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1717512710;
	 x=1717599110; bh=WZ21gytJ86etwseUsdEa3ZebPAHaM4+/yWQPikdVbjQ=; b=
	fIYiekmS2yy1am1YbbUACG1vyY8jhxdVShJdiFZzlzT6vyMIQf2JWg+bQjeeSqLM
	jTz9lRvEjHJvQiD2Pc97v6D6dCwNZsVs+j/U5lXphm8yL6c/ueJlrgE/M27vzPmC
	en/ZPeXCXxBXYP3Ld8zsnRbtb+fRz5bZE9xPTgDazAbhRchv/Gpg0/qlIu8/J1XC
	LYTihkSxGbNWNe3I3w8AHZFNReg27wAOZCuRcqgJTdx+lPDlfiAheAVfsnq9+iL2
	3tzDbbIbtpSrPiM+YFUWeuMYkFyUDNwk7dgoh3tsVkV9OauaTBkhXz9fHJyRzLkL
	47H1mPlLpz/6UTx0eWXF9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717512710; x=
	1717599110; bh=WZ21gytJ86etwseUsdEa3ZebPAHaM4+/yWQPikdVbjQ=; b=d
	Eh4fzyA433/zoO8obDFqiz42lJglV7GfZQVPh3xJ9ku22TaJsUF3RgptnDAewAwF
	JqCnwKUv9VAzKGifCJ/m5LaBWFd+s5lz6vvxdRURoJRXvcJR3ycpTmM3U4hAYF6V
	xxaUhX0/fq6+64zaSNo7xyoNjAKP2mgQdnX5fi1azFwCE/40SDN2M8Le46PdB6ap
	8Cupmh9qJRb9aCPToSM3VFHPMNtA3l1n68MgdoJsqFBqB0pJyxim16D3kVG43wR6
	vrPV7QB6+OOBfBlH2Jd9CMi6m9R4c+Vib1ikMiJ6H3gYm4X7xsOEpBS0p12zfiOr
	ahZQh2aFdu1A3nfpXHt7w==
X-ME-Sender: <xms:BipfZpwWozKfBNUYf0XHMF1Ldk4aoIvNw5isc00Wgh1Rne784kbKwg>
    <xme:BipfZpTkhn0BdXJaZ_ZzQLXyNqnmYKSCL0ihLrOuaM3c2PmQZtyinEZ1WkfBElVXM
    Ag_W-RBJskclyitZ_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelgedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:BipfZjWjnKtDZipeOVXUORa00ySyrkjGwzzgjmADZZFQrZFmNubPkg>
    <xmx:BipfZriHEnxBC3QOQEF6tQWt9eNcwwmLQDD15PpLdyw0LErPGTMjlw>
    <xmx:BipfZrDdtmO7y5aKABUgCwwOAYO98BwXVictq6elfqzN85fr6lnPlA>
    <xmx:BipfZkIgLz_Yu0RB6iZ8r4dFF6kqFetibyjtFeTqPyTcoOjwGninuw>
    <xmx:BipfZt1as4uDHZ4PRN80bp445gkN0o_vElkShctpFjjHAqhLOQ5Oc15N>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1EA7036A0074; Tue,  4 Jun 2024 10:51:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7f0681ea-cd4c-441c-9ac5-0259d0965734@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2406012326580.23854@angie.orcam.me.uk>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
 <20240511-mips-clks-v1-3-ddb4a10ee9f9@flygoat.com>
 <alpine.DEB.2.21.2406012326580.23854@angie.orcam.me.uk>
Date: Tue, 04 Jun 2024 15:51:31 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=881=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=8811:30=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Sat, 11 May 2024, Jiaxun Yang wrote:
>
>> csrc-r4k suffers from SMP synchronization overhead.
> [...]
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index f1aa1bf11166..fa8ca0287568 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -1083,6 +1083,7 @@ config CSRC_IOASIC
>> =20
>>  config CSRC_R4K
>>  	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
>> +	select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT
>
>  Shouldn't it be:
>
> 	select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT && SMP

This option is not depending on SMP on x86 and PARISC, so I followed
the same approach.

But yes, it makes sense to depend on SMP.

Thanks
>
> then?
>
>   Maciej

--=20
- Jiaxun

