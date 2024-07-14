Return-Path: <linux-mips+bounces-4320-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5ED930862
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 05:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558041C20A6B
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 03:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDD0AD22;
	Sun, 14 Jul 2024 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ji30Ivo4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VIQpOrsM"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B479CE;
	Sun, 14 Jul 2024 03:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720926689; cv=none; b=A8FtRUQQflvYvB+WBqOdHBWhcDu+CbADiv/UUiX6PCH6qf//zMvEkw7EvsiEsZU51cDYcnrEKyH933AZ3uFGDJTnchyohiI8hraQCvtBDKbgTmKax5UUCo4I7nRp2kzcnlYqxZzcjlLWxI4Xg7sSy0D2UddFF8hNj2HvfhOpat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720926689; c=relaxed/simple;
	bh=Jyjq6nFRwsJdx48+ghcEPTzJSgOHAotmQjFAMAumrco=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=qr/X8qaSQt6qocNNbFgTCWcbZqg/68mm58XvwMDdkz0rG3Hg8RnSADMOwr3LiedY+PLFhwxIP8TV0wQOWtUjvaMOZWB0XIZzjrdjGGid+ikHp5VcJU9mR1ZQd8QqFqLQgkdDevDSuAejUBaghbK/oc97TKvly75Ho04EiDxKUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ji30Ivo4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VIQpOrsM; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id C210413818DC;
	Sat, 13 Jul 2024 23:11:26 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 13 Jul 2024 23:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720926686;
	 x=1721013086; bh=3Yjj2RLF0TMgeq12zZcqwE6jYJkecT8tUCcWjNExOnA=; b=
	ji30Ivo4k6urXKZHnJUqAaN5rYX+cckz9UBOL9iQ4bwiATW0Q0AouNI/JFdfExxh
	+XONhxsA6/qMZnQCGtErz2JHycsySlZ+1x8tGQCtYmzJUBqLd1qXF7Gn/FcCBnfs
	M+b/nqAhhwWhCFHD9mQI/uapWIknrRGCv/RFTIpkDXqeQfi6MZ5Iamp+iSpqMBhQ
	xTuj5dMDaM8vAeyiFyEBld6wTtFRIytJX65YrDv6Qj7NRmyIa6GR97MpI/AHd3xl
	Ks8bguBa4CYJu5uHsRj3SmXxVzUhMbk2hf/yuj2IKdiDMJA91ma88yc5K0xntoC5
	diEc5zCIP424eoDK5OIeZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720926686; x=
	1721013086; bh=3Yjj2RLF0TMgeq12zZcqwE6jYJkecT8tUCcWjNExOnA=; b=V
	IQpOrsMAAQSLS093IYW+w1vq91JbEgnFiH3s7olYjNXj8mLM30ba1wW1kEjXehFP
	qbrPBgqCQIQfo6Ma/c8MRrgqihj/dYJmEoYjxhkw9c47Tejq3dB4OKm/mmwlLX+a
	DzexDic4yJaoxCtKYE885sqd7WAIuDhqzXf+tWKphyLzlh7HhfX7dXD6v/JZYoHm
	LovxPi1UN7MMNYEn/87RIW7ENIJLoL09E5K+cBPYAz8QubPHY+PPGM5WceH2qbsN
	eSyq9d6XVuiqWwa9CoUmjIvlFi5FYyiSDjda56jS24xS6m3Q+uNw5VxKZ+FmVHHN
	cEAAzFaTe/1Gn3nxzqyaw==
X-ME-Sender: <xms:3UGTZoPhAnLB-3uqFuT4YmCNLwVYt5SpaBS-_0uiao5XwIuqlGdO1Q>
    <xme:3UGTZu_Sj-j8KsV6EyL0jND612xK-oIdBWMmCXp5xAbCQsKGI1aY3NyomaoMbJkyp
    ZHAY3H8PUsGkUyY0i4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:3UGTZvThc-qOURldFued4C0CiZuOPk6dTK9Ea1T8XVTAiGZ0s8UbmQ>
    <xmx:3UGTZgvZKxpyzVn2oeh_23Q4K-G78S-u3VDl6-tdMKyha3gMpubTgQ>
    <xmx:3UGTZgcQE2Yl9sfWZ-rVvPhcoamp2Eta_rVlofgyw5j77iUOZ_xgmA>
    <xmx:3UGTZk253u-wKVbh5JfDL0dMc-A0grpgO1Ln4QDguGCxP-Gcwvtb8Q>
    <xmx:3kGTZoStR_N3aEmhHxaSSPa4of7XC9hB2GyIl6S8czokFsb2h2uGd2f1>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4480736A0074; Sat, 13 Jul 2024 23:11:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
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
Date: Sun, 14 Jul 2024 11:11:05 +0800
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



=E5=9C=A82024=E5=B9=B47=E6=9C=8812=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=888:22=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 12 Jul 2024, Jiaxun Yang wrote:
>
>> >> >  It would be good to check with hard-float QEMU configured for w=
ritable=20
>> >> > FCSR.NAN2008 (which is one way original code was verified) that =
things=20
>> >> > have not regressed.  And also what happens if once our emulation=
 has=20
>> >> > triggered for the unsupported FCSR.NAN2008 mode, an attempt is m=
ade to=20
>> >> > flip the mode bit via ptrace(2), e.g. under GDB, which I reckon =
our=20
>> >> > emulation permits for non-legacy CPUs (and which I think should =
not be=20
>> >> > allowed under the new setting).
>> >>=20
>> >> PTrace is working as expected (reflects emulated value).
>> >
>> >  Yes, sure for reads, but how about *writing* to the bit?
>>=20
>> Tested flipping nan2008 bits with ieee754=3Demulated with ptrace, it =
works on some extent.
>> (flipping the bit to unsupported value immediately triggered emulatio=
n).
>
>  What about the other way round?

It works on both side (NaN2008 binary with ptrace flipped back to legacy=
 and legacy flipped
back to NaN2008).

>
>  Anyway I think we need to prevent it from happening, matching runtime=20
> behaviour, i.e. if the program itself cannot flip FCSR.NAN2008 via CTC=
1,=20
> then ptrace(2) must not either.  And the same for the emulator in the=20
> "ieee754=3Demulated" mode (but not for the emulator modes where the fl=
ipping=20
> is currently permitted), as it would be a one-way switch.

It is out of the scope of this patch I think. Maybe we need a prctl to s=
et NaN2008 status.

We are unable to prevent user applications write NAN2008 bits for the "s=
witchable
QEMU" as well. So I'd perfer leave it as is, and let this feature go int=
o 6.11 so people
can start to use it.

This is actually a request from Debian MIPS team so they can get glibc t=
ests run on
mismatched NaN hardware.

Thanks
>
>  In other words we need to be consistent and the NaN mode of operation=
 has=20
> to be strapped in "ieee754=3Demulated" mode according to ELF file head=
er's=20
> EF_MIPS_NAN2008 bit for the duration of execution of a given program.
>
>  Likewise FCSR.ABS2008.
>
[...]
--=20
- Jiaxun

