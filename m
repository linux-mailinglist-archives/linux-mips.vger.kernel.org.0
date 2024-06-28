Return-Path: <linux-mips+bounces-4014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37691B410
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 02:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287F6281B29
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 00:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBE36FA8;
	Fri, 28 Jun 2024 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="MMrPYbV0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XUSCMxSE"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A49848788;
	Fri, 28 Jun 2024 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719534812; cv=none; b=LCJPICyLxyPmpEzBI4NHXRP212JbMvzth+Lc4Z4fMPuEwJZDswr6F5fYouvGyrTk+NR7ICc1udzp4E2nxgmOHDDREE/kAVbi483Cv4SDZyPEHoEWBqOvShgCr1V0KidlkI0tJ1+rsEKAsIJMHFY4mLotJfQHd8Xm7dkTh4lZL/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719534812; c=relaxed/simple;
	bh=N3zs7KG+ppIMlD7j1gpfkwNnZiVhwmrPJ0NnLjZNTJM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=hRBp5TUMFRjyIOLg1s3GlANWNt08tQAv6MZV9aQM6Q27pGC0V9HVpwpCqBV2oWaq8+9Si/WzEjVPp9pKY3bL2VyHbTV5jJIIK5Ys0odUqqkYZU474NZLh6iF2KTuJ9dwluTVaQHqkLUPMlZJAtQW8wy+FA+mZ1216wtZ1AA6anY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=MMrPYbV0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XUSCMxSE; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 6A013114022B;
	Thu, 27 Jun 2024 20:33:27 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 27 Jun 2024 20:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719534807;
	 x=1719621207; bh=e7xxaN0xFfmstMh8Xbm6ezSEMrFVe/mudf7wbp7Qmmc=; b=
	MMrPYbV0jMYq+bNeLl0hiZ/DvFuJaXspc1cS3bF9H9TaP5TyqIpIHJDnaswyotp3
	tcIhKwQGW55JxIkHoRI6byCqD2KtE1sBlZNagaXfLY5KVOF/2TLuSLPIxjFNIGuk
	Kokikzel31CMzJ8PzHjcU/YhQWFOxbiM/IJ7AYu37QiVGvzois98DO00h0cGABAO
	lYQWnRJw7pCr+Npd7K815xioO01yjVM3itcjlXncuMLPdLPQpgPAeBsGupWVYDl9
	dryYE83rpT6E3+f/pZTX2sSARKl65xOCh7ip5CcI9x0GVfa4wVb183qOwFmEoCre
	C8zKelrxb3ay1RUZ/xXpmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719534807; x=
	1719621207; bh=e7xxaN0xFfmstMh8Xbm6ezSEMrFVe/mudf7wbp7Qmmc=; b=X
	USCMxSEGpsnBtoTAd82/SDfnCuWC1kwtPqin5VFgURY3DPIprmh5jeoBk/8HBX/e
	/UG14ZfTeaJhpioivJRc8o5Om9YQTCXMdSzueh9vd5Fkc5ejVAKJY2HAjEPqWp3x
	9OXU1We8s1DOFem4u++UrcOlwKdFE4VeMMaWcyXnvf+vCI7Fe45zCIk/odAIUhxc
	MvIKu1Pt4kK2uujff7hrh7GGgZwuosdFKsPeOlJwYBcDt6lpsvjGGiKt2e5JMMEE
	70sG5UyspfB6SknwunszkWEAz9wvXMVzLvF1dtXGp40NBSdNMQk6gmA0YMwkxjS/
	k9JpCSuERPx2S7dMR8RDw==
X-ME-Sender: <xms:1gR-ZlXSVrPW5sY7pmoKxfGnvXznrg6YmUgtzq_-3d8y358h5vyESQ>
    <xme:1gR-ZlkIQkFKU4wfxsJL_065w9UnV8l-qjJ-VT7rLo9zKeeVnkglERFtYKp1bhbp8
    2vlaAxAkdcHzvA8Mbk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1gR-ZhbcCfSCtIJXa6km8gWSwNNDzLRUyGCOmQdqr0I_58Ofph1A8g>
    <xmx:1gR-ZoXlGQGisccOEW0FmQbB4DAVZtBCtTFt5oYNyucBEIl0xnOyag>
    <xmx:1gR-Zvn7G-V51PKF-Yy2rK231u6wdtQFaS28OA9EQD-CfWkR2nBPhg>
    <xmx:1gR-ZlebvmkxSjvx47hKwQurMUbSSUUDKN_xdumxiOxOJF6zc3uTYQ>
    <xmx:1wR-ZtZ2oRAe1tR3icWcM6Yvyt7WrKcVR5U6E4_PaEVqQN6B3bsrAN7W>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D3E3136A0074; Thu, 27 Jun 2024 20:33:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
Date: Fri, 28 Jun 2024 01:33:06 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=888:54=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 27 Jun 2024, Jiaxun Yang wrote:
>
>> >> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf=
_state *state)
>> >>  	t->thread.fpu.fcr31 =3D c->fpu_csr31;
>> >>  	switch (state->nan_2008) {
>> >>  	case 0:
>> >> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
>> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_NAN2008;
>> >> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
>> >> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_ABS2008;
>> >
>> > why is this needed?
>>=20
>> Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case we =
the default
>> value of c->fpu_csr31 is read from hardware and we don't know what wo=
uld that be.
>
>  But it has always been like this.  What has changed with your patch t=
hat=20
> you need to mask the bit out now?

After this patch kernel's copy of t->thread.fpu.fcr31 can disagree with =
hardware.
When disagree happens, we trigger emulation.

Before that patch for nan legacy binary running on nan2008 CPU t->thread=
.fpu.fcr31
will still be nan2008 (for ieee754=3Drelaxed) so that's not relevant.

Thanks
>
>   Maciej

--=20
- Jiaxun

