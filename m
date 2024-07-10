Return-Path: <linux-mips+bounces-4241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8492CA2A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 07:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160A71F23A22
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 05:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2BF23776;
	Wed, 10 Jul 2024 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="BOuR7eIt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LQ7vjsm4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000643C39;
	Wed, 10 Jul 2024 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720589708; cv=none; b=sepG/Jj9W4zBNklx36KtrOM00UlowfuhFiGwk2ncxfnjHkn/tul8EGPAS7b1dYneqLFOU96Byu2npb/BXS2S2YzJIFbQVslvyZ2h1RmkSqr0lsgRxrXldXyj/qcX/YlxlfkLPlaTRc8ehBt0AKYRrd+OxdZ7soTCEwBYxYhomHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720589708; c=relaxed/simple;
	bh=QXMPRFLJqx9eEPxxL/pvEzKwGFD/HcszEzESwh8ZfjQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=EoTtxLYass5OEVzMDOTc0bE+5BTTyTUkfVRYa/9pa0gX8nyNr/wiGXSrEmDoRB8eWsV0Lhy14UMlf9G9dcqm1BRbJPdS6Ird63mHMJ7Sf3qjisdC6lat3U5VEaPD6C+X1G1LQWVi4mc4o6m2NNGTTX3F9lP1ZJGO69CS8urKwkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=BOuR7eIt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LQ7vjsm4; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0AC9F1142294;
	Wed, 10 Jul 2024 01:35:05 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 10 Jul 2024 01:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720589705;
	 x=1720676105; bh=8YEThCembZnXJ9a0a7ch1VR3k4BKk0tw4+eg8GHnp2E=; b=
	BOuR7eItaatlyjnB53RLOrlZ9fGBrUqOUgpbQ9X9hu70wQdWps2Hs9UVDdGPs8X5
	1s1uBoULdR/ZnR155nLuzKP9vPrAGzUvmQbPSOaU1ZQGLv/gKKsrw7qIXqP4ibaI
	xU/p55w9qnPSKOVO7LcNCEwUnEZPr0QqfVQLKJVug7vniW7pQObvteq6VArMjsrW
	qHu/EJKrt+UHV/DtTXhutT3rwS09wKOXDpdq/54z1XhRTXwjfPdunKAnRiIzG2ts
	8FSLkhA+5ep04xalSlBcf6O259T+ON8j8laMcWuLkYqcYzBAsHl6MlGD6/A1A9he
	1BWalRviofagwMDuhz4Jxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720589705; x=
	1720676105; bh=8YEThCembZnXJ9a0a7ch1VR3k4BKk0tw4+eg8GHnp2E=; b=L
	Q7vjsm4y69ywf/hgOTIHWRMG/Qg4SqopC0tm9YkE22ZTWHt0jMsavBVAbuyxBmUk
	M+yRj3QcA8WWHnGHIs7Jkn7xeM3Yata4rUrRffJ2KjsgvcNsQzdP/YLppKfTeJ/l
	0OmqNcq5jr0y0WymdEW+zLdxwWOuwaZo/AYi4yGutRUfujxLVXwSJsdICPvc9WBD
	4S84VEUDPHiv2UAnwW/aAPbVg7k0ViIbTTQ3+1LjTjCbG/IzeM39HQUvkZcJgySr
	QIo3A6nDLPjoNHC++So/McSiu706iAFy8/oY/r4vJmBmH3vcIXdUhb9X3Q0EanHT
	qamVOVAbGC1lRqQ/amwSw==
X-ME-Sender: <xms:hx2OZlK2PBYiN8xMNCZNpHXHfzsMNjRfwuC59yCTkGMa1BUbE4GF0Q>
    <xme:hx2OZhJpNXv7uO3oeZfVuw0ymQ1nJqbwRMdo6Vphpr7X-SR_y9Pqn-K4JQ2FwnJr_
    M2DUt5JmwidC_bEqRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedtgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:hx2OZttAHOK7c9yzlyf5AcM5SMO7wCVteKuUSosc3VKw9CUlXne_og>
    <xmx:hx2OZmbLE6H1gP7FxgB94c3QZcqTnKoYXyVEW55ynUfQfbj4L1s7dA>
    <xmx:hx2OZsYCd5C4EPf4ahvKrKK5kRMlwLaX7ME6Rpdp9iIG9-gQiXGqfQ>
    <xmx:hx2OZqCumDJ_9xKyolwNH0PKJwF5ESz0hQZ8vQaC8GPl7tp1uUyNJg>
    <xmx:iR2OZhNUbCdXD_3OWJHdkOnBOzrm4tTqqbuxjhS1sOjj38fnvwvjOrMr>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 294F336A0075; Wed, 10 Jul 2024 01:35:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
In-Reply-To: <Zoz6+YmUk7CBsNFw@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
Date: Wed, 10 Jul 2024 13:34:41 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=889=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=884:55=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Jun 28, 2024 at 01:33:06AM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=888:54=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
>> > On Thu, 27 Jun 2024, Jiaxun Yang wrote:
>> >
>> >> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_=
elf_state *state)
>> >> >>  	t->thread.fpu.fcr31 =3D c->fpu_csr31;
>> >> >>  	switch (state->nan_2008) {
>> >> >>  	case 0:
>> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
>> >> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_NAN2008;
>> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
>> >> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_ABS2008;
>> >> >
>> >> > why is this needed?
>> >>=20
>> >> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case =
we the default
>> >> value of c->fpu_csr31 is read from hardware and we don't know what=
 would that be.
>> >
>> >  But it has always been like this.  What has changed with your patc=
h that=20
>> > you need to mask the bit out now?
>>=20
>> After this patch kernel's copy of t->thread.fpu.fcr31 can disagree wi=
th hardware.
>> When disagree happens, we trigger emulation.
>>=20
>> Before that patch for nan legacy binary running on nan2008 CPU t->thr=
ead.fpu.fcr31
>> will still be nan2008 (for ieee754=3Drelaxed) so that's not relevant.
>
> I'm considering to apply your patch, how much testing/verification did
> this patch see ? Do have some test binaries ?

It has been tested against Debian rootfs. There is no need to test again=
t special binary,
but you need NaN2008 hardware such as Loongson 3A4000.

Thanks
- Jiaxun
>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

