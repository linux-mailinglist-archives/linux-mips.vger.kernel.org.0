Return-Path: <linux-mips+bounces-4331-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E294931478
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 14:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3509E1F231F0
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4988A18C34A;
	Mon, 15 Jul 2024 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Xz9fG1bV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oKUh37pE"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510E18C338;
	Mon, 15 Jul 2024 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047024; cv=none; b=Hbmf6+z9waM2r5+OkvL3Po+6BLefhEsuRP9P3vQX7SAFoUP6N2U7Hp2cg3L08kYKJ6L9eO3OL0HKCvPYaM7ZFgdvx0U7V4tudVdyRNezmP1Iv+SiDi5aQriX590BWLFqIlPFwEgM7QpkT7bf0YRCUl60KPXtll2Jc9LVCPnyl60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047024; c=relaxed/simple;
	bh=N3PTOC6sWEpSEYoAWJezS70/M83GsLYtwX/g0boo1Rs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=uV0M02EuU1U/ZDbGeMkolyyD6IBJsO/L9A5S+OYqJF1t+ibtw0eYsKlMMuPD4Uk5ExiPiafi9O2M+m+w7WtjLCpEQD16gceA7+TsqRLEkhmL1YsUhWhnSSRA0oAi5TyToEzdTFEU+L8ogVBtj7Ggl/53P7v+SO2fGIqgcvs0ZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Xz9fG1bV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oKUh37pE; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 819B41388C65;
	Mon, 15 Jul 2024 08:37:01 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 15 Jul 2024 08:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1721047021;
	 x=1721133421; bh=HlZuP9r9uYA4qH3ebyoGUrlDKd8G/Hmiliqj2CCJC58=; b=
	Xz9fG1bVRVN43aT4AhxhFpEMazClSDNF7Eg2mqLdC5s6NT/xPx6KGSEuwf3yx7+O
	maQQ2LC/r5LbsE4GnQxb7r1yTwuOyvhVwxFAlR/z6phCR9QzLRbJIP0GQR79aLHc
	5Sf1xQ/WvCepSN7tabfAbODA0zP0Q2EKP0Azdo97Hk+/vUQiLCMZqzUt9mSLeIpk
	937HwPxwlISrhNgjl6xiA9LVySU+iTUosJMpjg+G7APhksyGciloIugDYppIwBLj
	U2VKdeY9gkskWCfYsBRohonzEkM0JfirAVMmqiOIdK68dgdRLzVaYfusOSd5rU/f
	AWvePFNQDrgT63GUyEeHWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721047021; x=
	1721133421; bh=HlZuP9r9uYA4qH3ebyoGUrlDKd8G/Hmiliqj2CCJC58=; b=o
	KUh37pEGj46IICxdEHFxb2Vi1hvn6iRj+NAwSnU7X9RO4x9xZ5C0UMp9ZYUGlw+0
	+noF80C9JagRVfcgEjZWZlgo+Qdv3gwFYFARFan/M4Gt+PWQorvmuPqkbFkFHMki
	9gpl+rwSG2UkStLoh118nIlLKio+AABh6/9T//xLV24wxALjAFn2zkonvMUFCB5C
	PO7xgmqexSZ35gDHNgYHiYatDzg+tJtBul4AxvKTFJeTBUrxmi7KKIF3HIblTqcD
	CofruPOOr/7UZTNAwvhOR0uvkP4GgyhhKfg4iLga0pcfOrLOiSKsh2GdqaljC13L
	hotDYNnaDy/oergy/KzPQ==
X-ME-Sender: <xms:6xeVZuoVzlmsmk3PgpB2ntcL77tFGXdSHwUAZxCagTionCIwhLvsSw>
    <xme:6xeVZsqsHcwRGF4y7zrwywCIlM5zZk3X_oyePYCoI3SznMdWf4jO3A1_taNg87int
    cQ1bzJS9KS96_4J9Jc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedvgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:6xeVZjNmeP-Qft_UbzQurJRx5PSp0FubXQM0vys6I45YN5UICEDG_g>
    <xmx:6xeVZt7B_KceenXlmU6Ykxjh7i2rhGH9wKg2Kkmv4o0nDiAf0yExjA>
    <xmx:6xeVZt7DtxX-0Mm4WXRKNZyeV197AoLACvoJ1NxX5-Kgt5Xef9ktnQ>
    <xmx:6xeVZth1xu4A2nWri4iB1zY3ScYH6rVge9Ohbn_vebUmGprLZmd2Qg>
    <xmx:7ReVZqvJ9MKpOEYA9FFwYA8bYTl9nArgoKWvU76gddVGYYFr_IwZTzKf>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C7DBC36A0074; Mon, 15 Jul 2024 08:36:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
 <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
 <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
 <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk>
 <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
 <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
 <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
 <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
Date: Mon, 15 Jul 2024 20:35:21 +0800
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



=E5=9C=A82024=E5=B9=B47=E6=9C=8815=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=888:15=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
[..]
>  I don't know what prctl(2) has to do with this.  If you don't impleme=
nt=20
> this part, then your change will cause Linux to behave inconsistently =
and=20
> therefore I'll have to NAK it.

I think your concern was regarding user space application needs to set N=
aN2008 bits
at runtime?

In this case, the best interface to inform kernel about NaN2008 changes =
is prctl.

I may misinterpret your comments.

>
>  It's not much to do anyway, as I have prepared `ptrace_setfcr31' alre=
ady=20
> to handle masking correctly, so all you have to do is to set the mask =
as=20
> required for the right thing to happen.  I shouldn't have needed to po=
int=20
> you at it though, as that code is easy to find.

I think I got your point, will try to implement it.

>
>> We are unable to prevent user applications write NAN2008 bits for the=
 "switchable
>> QEMU" as well. So I'd perfer leave it as is, and let this feature go =
into 6.11 so people
>> can start to use it.
>
>  This doesn't matter either, as your change only addresses the case wh=
ere=20
> FCSR.NAN2008 isn't writable anyway, which is the sole reason you want =
to=20
> switch between native hard float support and emulation, doesn't it?
>
>  In fact where FCSR.NAN2008 is writable your new mode has to be equiva=
lent
> to "ieee754=3Dstrict", because then there is no need to trigger emulat=
ion=20
> for either NaN mode.  Please do verify that this is the case.

This had been verified with perf math-emu counters to ensure no unnecess=
ary emulation
is triggered.

>
>> This is actually a request from Debian MIPS team so they can get glib=
c tests run on
>> mismatched NaN hardware.
>
>  That doesn't matter for us here (and I have a bad suspicion anyway), =
but=20
> the Debian team is of course free to do what they want here, the GNU G=
PL=20
> applies.

We care about our downstream users, don't we?

There are some lags on Debian buildd queue for mips64el due to lack of h=
igh performance
hardware with huge memory.
They were about to source some Loongson 3A4000, which is NaN2008 only. B=
ut many packages
test cases are failing on it due to NaN2008.
They asked me to help and that was my solution. I sincerely want to get =
this change upstreamed
to cover some downstream use cases.

I don't know what theory do you have here, but that's all stories behind.

>
>  And also they can always use the "nofpu" kernel parameter to run thei=
r=20
> verification.  I used it for mine back at ImgTec before 2008 NaN hardw=
are=20
> was available, also to verify emulation, which I wrote too.  Perhaps t=
hat=20
> is also the right solution for Debian actually?

I'll suggest to them, thanks.

>
>   Maciej

--=20
- Jiaxun

