Return-Path: <linux-mips+bounces-4295-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373092F31A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 02:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C875D1F231AC
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 00:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E920184E;
	Fri, 12 Jul 2024 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="FsosVVXB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vpP7hlSv"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB184A28;
	Fri, 12 Jul 2024 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720744629; cv=none; b=kdV1wrxH4L2yxv4eQJH8h0OlJ7MfKupZxJ/3u590SpNoauaE2/3x8NOorAJArGUcFZITA8mgvTD9xzVauX6c/weg0hD6LFk3of3AHiVe71BQ8bHWMjNPoXRme7THXBsne1yY9aE3jJ34ip9aJGWu2T1Xbsv5NeTy4aM/ZYVir+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720744629; c=relaxed/simple;
	bh=/ebUXyV+RPOCirS3YaDlQ6O5GI5gRfLlgbsh5ADbg8s=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=CNg+lhRPq0zhhmtYN3cLbQGvoBQF+7OR3MDBCxaSeuM70yIb9H6AeyKwhFSY5IA81rGksmbemma4oXA2PDIUkKiyEnoxGbNwTiePWpUwxE8akj/fk+krRan8krJqqyjQCCkMGnue3TUgOpD6Je9FBY1W9uzMccFZx1K3bR8mjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=FsosVVXB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vpP7hlSv; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5EF3C1386B6D;
	Thu, 11 Jul 2024 20:37:06 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 11 Jul 2024 20:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720744626;
	 x=1720831026; bh=QRDiPsb95Cfr0uPU9/xmF1u6tyqUMbrTsI9uk4kLr6c=; b=
	FsosVVXBC8/gnSHWueJDtAuOJTlSrG+Wt0Zp52SEU7dQhA3vtZkgBpiaEnsaFmsi
	VWxjuOc2slOjvCS1DHos0aN7wr61d85aWMuq/7s+plYTsnV9ZDX50EUQnQ4ilg/2
	ZeelDwgq3kj+GbIOcxLfdZB73Xc8+EkYvig6jzVoHZFmb8blMG0JmtPjtIbaBF9G
	nHc2kn6T2LDPX+0f6lJdfv5EMYrXV/QMQYgwJ+wSASRvVlZ1N6gp+yelk12/OPnW
	TJIJslMaqw96r2GyQky+75CflWewXwtqZ31Wx/Arn+d5xWASQECWS4ixgIz/zA79
	opVNP/Kn9xybFshaFulEnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720744626; x=
	1720831026; bh=QRDiPsb95Cfr0uPU9/xmF1u6tyqUMbrTsI9uk4kLr6c=; b=v
	pP7hlSv76DDjl6ougIdqfgK0ifgQFZ/QQGmQUT72Dy2l1s9SCQ0r439J6eDBF9Oz
	fTE2zQM1ucCxNh3P8CRRhPaxB9EvazO2j4T2ZZhv0cfP+J9IpIhD26hzpskwGl2v
	SDYuW8riZvcyjACup1W0icO6vFl8GQu3D6IRpPTcbU+eK8dMy9TQ5wfBxhCymrLl
	j+70bEQrpiWr+29AM91KHZkL2axwVsU9z9jYeFmA9Ciu1oLjIszUQ3qGvFN+oiGP
	uV6fpU4Ep6+H9qL1dpgp4v7LN5KMbRQjHBdNZKCMYkPHdQ8L+SnMfyZv3Vt1PBij
	Sgzf42l5eVpdNsumfyldg==
X-ME-Sender: <xms:sXqQZjnAy_7JwwRmtVoA50MlDdFGbwiZbmYdys0Sb6XsMVtrwsz_Tg>
    <xme:sXqQZm0q9nWcspWJSVHf1o0WGutAHmY967PniPqL4y47iFf1LkumQm0f1tH5mSw-G
    IavEo2MyTRqwdN5e1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:sXqQZppWyv0hLAO4bSYbyojH9AobwSzorc5H7FLZi_n1sDnGJ4vbJQ>
    <xmx:sXqQZrmn0H8_bae7tViNKN1xkEw3M_H_80hCsrELgvsZxK4ZsgWwIw>
    <xmx:sXqQZh1kVyslV27StSt5hd4hLnFAwm3CbKLzHeIZEhYAe3r6YNsMvQ>
    <xmx:sXqQZqtKyultxy5QixScOtMoqSb8hD7KQ753ZINBJa3yofPtUvSR3A>
    <xmx:snqQZrqlfW61wsHrLedah0LNMis8bcX2fJg5CZDvZL0vwxJvHhuabXhX>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B5FF036A0074; Thu, 11 Jul 2024 20:37:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk>
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
Date: Fri, 12 Jul 2024 08:36:45 +0800
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



=E5=9C=A82024=E5=B9=B47=E6=9C=8811=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=886:20=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 11 Jul 2024, Jiaxun Yang wrote:
>
>> >> that's just one case, what about NaN2008 binaries on a legacy MIPS=
 CPU ?
>> >
>> >  It would be good to check with hard-float QEMU configured for writ=
able=20
>> > FCSR.NAN2008 (which is one way original code was verified) that thi=
ngs=20
>> > have not regressed.  And also what happens if once our emulation ha=
s=20
>> > triggered for the unsupported FCSR.NAN2008 mode, an attempt is made=
 to=20
>> > flip the mode bit via ptrace(2), e.g. under GDB, which I reckon our=20
>> > emulation permits for non-legacy CPUs (and which I think should not=
 be=20
>> > allowed under the new setting).
>>=20
>> PTrace is working as expected (reflects emulated value).
>
>  Yes, sure for reads, but how about *writing* to the bit?

Tested flipping nan2008 bits with ieee754=3Demulated with ptrace, it wor=
ks on some extent.
(flipping the bit to unsupported value immediately triggered emulation).

>
>> The actual switchable NaN hardware (M5150, P5600) uses a dedicated Co=
nfig7
>> bit rather than writable FCSR.NAN2008 to control NaN2008 mode. This i=
s undocumented
>> and not present on some RTL releases. FCSR.NAN2008 is R/O as per The =
MIPS32 Instruction
>> Set Manual. This renders the purposed test pointless.
>
>  Yes, for R6 and arguably R5, but not for R3.  Architecture specificat=
ion=20
> revisions 3.50 through 5.02 define FCSR.NAN2008 (and also FCSR.ABS2008=
) as=20
> either R/O or R/W, at the implementer's discretion, so it is a conform=
ing=20
> implementation to have these bits writable and our FPU emulator reflec=
ts=20
> it.  I won't go into the details here as to why the later revisions of=
 the=20
> specification have been restricted to the R/O implementation only.
>
>  NB architecture specification revisions 3.50 through 5.01 also have t=
he=20
> FCSR.MAC2008 bit defined, removed altogether later on.

Thanks for the information, I don't have access to those manuals so I wa=
s unaware
of that. R/W NAN2008 is prohibited by AVP as well.

I briefly tested NaN2008 distro on QEMU modified with r/w NaN2008 bits i=
n ieee754=3D
strict mode, it seems working fine.

Thanks
>
>   Maciej

--=20
- Jiaxun

