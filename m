Return-Path: <linux-mips+bounces-3989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2991A503
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE79281110
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556C71487FF;
	Thu, 27 Jun 2024 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="n2w9j2d/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FUXtpSh2"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8593149C4A;
	Thu, 27 Jun 2024 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487324; cv=none; b=GXNjlJ/1/6BcH35HWq8L2TAnpooaE9B6fnMnq4Z5xZfy+NTswNgNlq6VFRx7nc2etbw5Ch7eWGyl89YGo2MHV5q4msZDCua9fcSlvfgRUH17jE/IUW0Ya7EDcC+WRervj/xPrsv/eaNcQVXK6s0FvUvY19POgB7pmz8AliP8ydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487324; c=relaxed/simple;
	bh=J0KQRojqvT+N2S6fp9y5e6jTw4zWaS7XV8xLBCBtCpk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=iVnQKpzuzXOcjkHo+icKZesRKx/4Qj536RpeJeWFCDOnz2XkHIWULofpHdzsQpeTPuT0feLtzIBtr1T93eYTaRmeV65TfREz3uRyaANr6pRY1vvtQFThruVjjSrF7exmPv+TBq/kE53cFoR78q/iZD7RVv+K6zG2lTP1RsN36bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=n2w9j2d/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FUXtpSh2; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 96A091C0008D;
	Thu, 27 Jun 2024 07:22:01 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 27 Jun 2024 07:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719487321;
	 x=1719573721; bh=dSWFI8rFdck/533DRW6R5iXonIhgXkC3vJ+as0OL0Vs=; b=
	n2w9j2d/kVdoGiaByR6pupk9shhh+D80Kw+v1D/KKQQULqbyg8ZMz3MOtoGXlhYY
	FFmGFY40rjdqggcwF4oT00v1dZlj7CjyQr4Yj21jKnF3/vl4z7s2fnYJT17BzeLO
	d2lpDn0m0hFkwD2jC7DmSSQOurc2vpOpIzgSYRw0eAK3/x5l/rAwT4ZInt14IvBG
	7UuLjFTEASRTWbExoM2kZNCr6gY/n+gy1ifs7DxM7ughnzr7hX9tXJfx7Dq5JT6S
	G43bZ48eSdR1+yiqp+kNLt8oKsLMu0yHi9Gagc2TLipmsyjaEz26a01+NOq/RbbF
	qrxc+h1T3+DoZ6W4dubOmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719487321; x=
	1719573721; bh=dSWFI8rFdck/533DRW6R5iXonIhgXkC3vJ+as0OL0Vs=; b=F
	UXtpSh2orV2o/v8Slj6KYXYbU9bPW99oBq9SJYep/aIrzxk9XTsm9zoCdJ62CAVW
	5qt9RDkxVqwUsaHly+PXg314D9eNLMwPpoCLmgvN1NmuvQ/xhCGWbF4MK1qfcPT+
	7b5fDyhFD1YQ0t0ds6eIalP2Bx7xEGXGKJYQWZIBHvQzkbQM+gUnIX7BNw+VdLyZ
	Y+xEgxTUCLb5VMe8QQAnH+7SiY9GcME3mVIf0VcTdMyxoaLijnju+TyMddYsPawV
	2F942v8B7H+FcfTTJn50xzfB73b1pMpB2xLLqfqH/opz4vQqBcxOCUbhrEpntgne
	XNnjwr8EemOacywNTobrw==
X-ME-Sender: <xms:WUt9ZnvHmKZqhZQuL5_N2OKrkcZjCSRvKuW6LZo4kYfHkj8ekTb0jg>
    <xme:WUt9ZoeNnwkDefZ_goqHzRSVr7NKYmmdl7z3sB10GZvCcklWKOcvLNJr_n8lhdl9c
    _ePbuFvve6P_MiVd8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeggdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:WUt9Zqzk6vP3jB6MWGqeMNBrFzQVtKDEgdGq02hJY9h2b9FH29RQmQ>
    <xmx:WUt9ZmNR6R_UtFIekFzwQsT-LBJTRjbR5l4Mf21Yv39C6kkEHZndqw>
    <xmx:WUt9Zn9d_lLuM-yr5mUvCfiVvPpM5QM0tIY0l7-i7Lhar2JneAtATQ>
    <xmx:WUt9ZmWFSLLulyVBh_Rxlmpwk09zxstUDbHwuwdtu5Nr_kMJrLIweg>
    <xmx:WUt9Zil1CB0WXFOBqMdGpIkUYJvGK61uRgiz37auleiSdd0bWSUw1Rdo>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F04FF36A0074; Thu, 27 Jun 2024 07:22:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
In-Reply-To: <Zn1FuxNw2CUttzdg@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
Date: Thu, 27 Jun 2024 12:21:40 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=8811:58=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jun 12, 2024 at 09:38:19AM +0100, Jiaxun Yang wrote:
>> +++ b/arch/mips/kernel/elf.c
>> @@ -318,6 +318,10 @@ void mips_set_personality_nan(struct arch_elf_st=
ate *state)
>>  	t->thread.fpu.fcr31 =3D c->fpu_csr31;
>>  	switch (state->nan_2008) {
>>  	case 0:
>> +		if (!(c->fpu_msk31 & FPU_CSR_NAN2008))
>> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_NAN2008;
>> +		if (!(c->fpu_msk31 & FPU_CSR_ABS2008))
>> +			t->thread.fpu.fcr31 &=3D ~FPU_CSR_ABS2008;
>
> why is this needed?

Because t->thread.fpu.fcr31 comes from c->fpu_csr31, in this case we the=
 default
value of c->fpu_csr31 is read from hardware and we don't know what would=
 that be.

Thanks
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

