Return-Path: <linux-mips+bounces-4269-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAE92DE21
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 03:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71DAD28283E
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 01:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA70C8801;
	Thu, 11 Jul 2024 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="BL6UYeyG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r8ZVAWoM"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1408E560;
	Thu, 11 Jul 2024 01:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662481; cv=none; b=peMb6tvIZl4q2mZtWhFjf5gsTV3r2z70xoWMjrJVi6jhOoE2eWwROkU8rQ+fUHw4LOPlzVvfOOyMRUuUVR8Qntbw63/Jf7TgquuKouU6k//NrTvzS2YajR1rkeRjQwzGsqwlRmHB1/I6ldUdcSv5NMmAMDRH0BvfFSWkqVbybWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662481; c=relaxed/simple;
	bh=k2y6a1jfT89sxheaZ7yuG8DpHpWUTCnfIdZigbjaDyM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=i0DY8HoSJJpBkETWxe2O8HgzZan7u0adb7iVLeD3lbPL39Lz7v+oel5x7YnZIYMq+dBcUBAVAQ4KkNbY6h9JvugCRPqTrjCMb17JLLCiIU4rktdrwyNGKMGn4J3YEiPmgqobwFK0rxEoAWUx4sHdxTy3D++zBjrTUYKm/xR2rnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=BL6UYeyG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r8ZVAWoM; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id B9188138170B;
	Wed, 10 Jul 2024 21:47:58 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 10 Jul 2024 21:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720662478;
	 x=1720748878; bh=Ln8TN6QJTge04q/QLyiTegVf1QNFB8C3NtlV+agY4Bc=; b=
	BL6UYeyGaVbjCVxGiQYxVACuuJ7a4+U2cz+dZX1nvi5bxeY50NtAPf3ZCT+K191q
	LgPCHo73qfvF3Dy7Cjom13bMjzOCQoeBrpI9RZQb92DkoIx3QSV52yTCAd7rcA0o
	eWonbrzommcUcHXn7OQP3B2U+u0zc2hO0OnOf5v4fwtKJG25CZuz2zpqdGxXrK+f
	S5eqsnb6HDMMXm9WtS5TTIzXqu4svgF7qW8ZTYkNJQuzAMD/Svzu26QeZcgSf1Yu
	9dJpmg2ZnSF59Msx+CVvGjJK0XDym31u5/yQtv0Sy4e4PT2OeLVOmghoHPPnjHlj
	MyLCVkE/hJX7GZNfWag3Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720662478; x=
	1720748878; bh=Ln8TN6QJTge04q/QLyiTegVf1QNFB8C3NtlV+agY4Bc=; b=r
	8ZVAWoMNb247Ph2A9fkbxuZoaZNZ7ESPHVA2jkNYRAj4iUnQ0q3Znsl7MaupVyaL
	ag1vOvdeZNNrhyij4qt8ibPWFwoV1Shr9bP+CrHKgpZTXf7vMYuQlIy2nhHnxcSS
	5LIF4ExjN2A8sX0pc9ZflUpmO5KFUtefOfjtnbgzE9t3I/J7XEW+YkNOVdO/QO03
	lR32Uf12pNkyZ7Qiz0rmSrRKTdbNvASFUl0FWbcfqu1HV/IOJnDAYtV79k5pNPw9
	gsGHjbe3e18xENWjtO+eIrT00jNvVcJDy7DXh286HrhFDUJlDc+K/1avAxSrs5OC
	XLglG8j3+A2N28xa/DekQ==
X-ME-Sender: <xms:zDmPZgeEr0VMNC0qnCFZ4Wp2TbfXO7ULow4ehyjM0n_OLhIROaT9OA>
    <xme:zDmPZiOdw2zZz1VJI-i9eFp-C4v6bSX49Q86414pvdTFfGJrsSk353DPxkUY6echT
    13Y4LMhdZcOMx1LzfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepgeeitddvvdffheegleekudfffffgkeeiteffiedtkeek
    keevgfefleeijeelkefhnecuffhomhgrihhnpegtihhpuhhnihhtvggurdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:zDmPZhiyGzzVAO-qBjHlrb0MKqD_2HXe1BUfD07zxa87sAfYjFJdEw>
    <xmx:zDmPZl_Qz7yZeJJHMaEjLEMuZ5qjlF3Z8LyG-A5EBllY4ZGR5Sl7Zw>
    <xmx:zDmPZsvWiM90Qio6oxPMLS_V-1sbT-cIrYxwfVshc1Y1vQmZsBhYVg>
    <xmx:zDmPZsFySNyiD3nfee9Orm509W5dK-4zZp789yUh9Z4GZL_ViExkFQ>
    <xmx:zjmPZgj5MS8Md6r8nnEudS1frJ4BvcNYey-vi2loNBJOX-_zgro39bdb>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CA98C36A0074; Wed, 10 Jul 2024 21:47:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4cb980c8-4b96-4ed0-85af-9baa1b7ef30c@app.fastmail.com>
In-Reply-To: <Zo457UgAkhbAgm2R@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
 <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
Date: Thu, 11 Jul 2024 09:47:36 +0800
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



=E5=9C=A82024=E5=B9=B47=E6=9C=8810=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=883:36=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jul 10, 2024 at 01:34:41PM +0800, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B47=E6=9C=889=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=884:55=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
>> > On Fri, Jun 28, 2024 at 01:33:06AM +0100, Jiaxun Yang wrote:
>> >>=20
>> >>=20
>> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=888:54=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
>> >> > On Thu, 27 Jun 2024, Jiaxun Yang wrote:
>> >> >
>> >> >> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct ar=
ch_elf_state *state)
>> >> >> >>  	t->thread.fpu.fcr31 =3D c->fpu_csr31;
>> >> >> >>  	switch (state->nan_2008) {
>> >> >> >>  	case 0:
>> >> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
>> >> >> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_NAN2008;
>> >> >> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
>> >> >> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_ABS2008;
>> >> >> >
>> >> >> > why is this needed?
>> >> >>=20
>> >> >> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this ca=
se we the default
>> >> >> value of c->fpu_csr31 is read from hardware and we don't know w=
hat would that be.
>> >> >
>> >> >  But it has always been like this.  What has changed with your p=
atch that=20
>> >> > you need to mask the bit out now?
>> >>=20
>> >> After this patch kernel's copy of t->thread.fpu.fcr31 can disagree=
 with hardware.
>> >> When disagree happens, we trigger emulation.
>> >>=20
>> >> Before that patch for nan legacy binary running on nan2008 CPU t->=
thread.fpu.fcr31
>> >> will still be nan2008 (for ieee754=3Drelaxed) so that's not releva=
nt.
>> >
>> > I'm considering to apply your patch, how much testing/verification =
did
>> > this patch see ? Do have some test binaries ?
>>=20
>> It has been tested against Debian rootfs. There is no need to test ag=
aint special binary,
>> but you need NaN2008 hardware such as Loongson 3A4000.
>
> that's just one case, what about NaN2008 binaries on a legacy MIPS CPU=
 ?

Boot tested CIP United's NaN2008 Debian port, works good so far [1].

[1]: http://repo.oss.cipunited.com/debian/README.nan2008.txt

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

