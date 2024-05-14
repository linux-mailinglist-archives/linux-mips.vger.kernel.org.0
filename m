Return-Path: <linux-mips+bounces-3271-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B45598C5E20
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 01:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E57551C20D4D
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2024 23:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A66182C9F;
	Tue, 14 May 2024 23:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aNVhnzhr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HIlYpX3L"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF8182C98;
	Tue, 14 May 2024 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715729991; cv=none; b=Pf24vn3Nc14qEZx5ojhu1iGKBuGbS8un3SrsWtYUocIB/BLWyHKIc2vO1H2TKbOYhvRBaGnx/VCE393MnjQciEHiwwnGHyjge//KXwWfXfnkffD9QPeqvxzaBMtYlKtBOZOWMCUuEn9UH3sCuh0UgOCOfSG9QLuVXr8eTPEmcE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715729991; c=relaxed/simple;
	bh=60Ox0a+JCmbAi56j55Bt0YnLVDI15o/pVVrYJoU0WGU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ZgvuUbBVO26SDNK3rekOgtGkuE2eapSiZIAbMFLNBjdjVjVKYZ9L7bKbA3HVIj1sYZ2nJlp40jOAKmVrSo8pHS3Fhbf4fJbq4BItV4jVH/iIk6x222Mbivkn4C1EBpVDOwb2YZCgBZ0z6W3mOhR0HRUhgE5vPXPvnevYgzp5rOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aNVhnzhr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HIlYpX3L; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 06D991381145;
	Tue, 14 May 2024 19:39:48 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 14 May 2024 19:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715729988;
	 x=1715816388; bh=1obXvCkxuWYmqdH7enpj67eu56K1q3VrLcxWZTYvNIw=; b=
	aNVhnzhrTLEBK1+8J0vnth3FvXxjrCIuk4kby9nRkw9DRG+7hU2S4AGKh6jWWsCe
	UQXTkQJ6hK0WpD2zg4XwPC+0JNjQcE/gXCxvy3cwS1L+m9EMs6EkBVknmGgX84wx
	0OYXJ0wC4/3bENyfbmD+JDFy0+XbeG2r9zR1yV9GodGJSmTV6ZPZz+8TyJ/fc5LO
	26m9OTcOdBgsBsOpQtWBfcafcW0m4F8dhyGXItXUKlON2N9h5yCaOKtH1XOPTI8m
	Mpd5wjixuAhwBJMLBd7JSPmNZ/nnmc84uJ8EpNpEY1tTiZT1JfZUoJ9m12LGXwPd
	8RiOkb3L/UQtV2Iq5NvkOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715729988; x=
	1715816388; bh=1obXvCkxuWYmqdH7enpj67eu56K1q3VrLcxWZTYvNIw=; b=H
	IlYpX3LGV3wzZQIW7ZtEAb8RYLjgPML+auk99lQiUhy7QJP94uw+5NUHccqO/Hf1
	ULUsx16rtB9Okw80vS2BOSQW+AQ9ZoEeaqIDQT7/emdP0uTHugPPIfJJC93kwgLD
	EMYT3K8GDbxHj4wEj9x/qFW/X8RuSNQGMUSCkOZ01Cc0xMR9sYT51AwCA+DL6jGG
	i77rIK+Qro7PPuuDu5a+tMe3Bf7fl6RxJOQglks8g9z2JLQkogRXCK3Lw7+na9SU
	Ym75vLt+6S9XQ2f4Qu8dbv572HakzvMMcoacqpbX7INYT1ssLhPk4tM0AvgsxC4d
	eUSSq70btxHYcq3JCKqcg==
X-ME-Sender: <xms:Q_ZDZqm58F7b6YP1Flchbu_Q-MK6XF9mrr1tO0dpLa3bS6DQ7aQBAg>
    <xme:Q_ZDZh3_DrE8to6UYGBoWbqIK521JNlpVLPacJltpLECG7gsqXu8XvZjc7EQF35eg
    A1fs2acUSsygdD1P-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegjedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Q_ZDZooFsygNgsQNRGa6bmOkg6j-rZxLw0QSSYxKSZiZderTTKJ0Nw>
    <xmx:Q_ZDZunDTjdrJUdabGampDyrbXfh82CYOjv48JgndBocI0WyPFrAdg>
    <xmx:Q_ZDZo2EnDVJ1QhsJ5ShnNDeLT7MYWNQxGLArV_4FZ5mGwMgOVXirA>
    <xmx:Q_ZDZlu6nWt1-OIUXA9J_ORFy9dBeujO2W3GOdd94lHr1KY5VtqseQ>
    <xmx:Q_ZDZuywMOvK23ct40AD0B0usuDmwk7TIGrZ7E5LkHhqHcOIt2uuiUDE>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EDEEB36A0074; Tue, 14 May 2024 19:39:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-455-g0aad06e44-fm-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7fc82f8b-df9d-45f5-8e82-27eac7b4b0ab@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk>
References: <20240202-llvm-msym32-v1-0-52f0631057d6@flygoat.com>
 <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com>
 <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk>
Date: Wed, 15 May 2024 00:39:21 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "Guenter Roeck" <linux@roeck-us.net>
Subject: Re: [PATCH 6/8] MIPS: Limit MIPS_MT_SMP support by ISA reversion
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8814=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=8810:38=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 2 Feb 2024, Jiaxun Yang wrote:
>
>> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
>
>  R2+ only actually, as also evident from Kconfig...

Hi Maciej,

Long time no see :-)

There is nothing stopping us to run R1 kernel on R2 hardware, given that
those features are all detected at boot time. I understand MT was introd=
uced
at 34K which is R2.

I tested booting R1 kernel with MT on 1004Kc.

I believe we should give users flexibility on enjoying optional features
on kernel targeting lower ISA Rev.

>
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2171,7 +2171,8 @@ config CPU_R4K_CACHE_TLB
>>  config MIPS_MT_SMP
>>  	bool "MIPS MT SMP support (1 TC on each available VPE)"
>>  	default y
>> -	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICRO=
MIPS
>> +	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
>> +	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
>>  	select CPU_MIPSR2_IRQ_VI
>>  	select CPU_MIPSR2_IRQ_EI
>                    ^^^^^^
>  ... here.  I wish people looked beyond the line they change, sigh...

Both features (VI and VEIC) are probed at boot time. Selecting
them doesn't necessarily mean that CPU has those functions.

Thanks
- Jiaxun
>
>   Maciej

--=20
- Jiaxun

