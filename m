Return-Path: <linux-mips+bounces-3841-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 415AB91299C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 17:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B0E5B20C02
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 15:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FC855C3E;
	Fri, 21 Jun 2024 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="WNIv1Prk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fTv5X9rv"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E953B7AC;
	Fri, 21 Jun 2024 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983331; cv=none; b=kNp4mSiXrftz4kfhHfKwZM7QXR301R9zvQ5hVCIpfFKdHDcCKvPkiLwhc+hGFn+C+jeh1xnbjo14bjXwAZ/GLdY02IbjELci7IfSvCrozEzlD8GuP3QCBM6JrRSWirtqbdl/Yvx06r/Ox0EexQM7Bx+4oOlTCmnbCjxC/OXZ/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983331; c=relaxed/simple;
	bh=bwzVVU0DpaOag2gJQjv5Wo7VFmiNol555mt6C8q3IGs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Zd4qegSADY5SwJwxKV2j502jst6YqyXhwka/mf9VlUZMPbgfvfFFN3UekHC4Sl8+U5iM08O52quHqZR2byECzQS1t5a+xwBl7dq0x93MIhz5GrW0blXwln5ZKYghrpyDPioBILsJhTqdOQOKsrKSgr1GBTs7pvSS5nMjJByHbmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=WNIv1Prk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fTv5X9rv; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4D30011400AD;
	Fri, 21 Jun 2024 11:22:08 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 21 Jun 2024 11:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718983328;
	 x=1719069728; bh=sxE25uVd20ukxwTOUCuTr+p1UO+6v1RmLwyafcdb1cg=; b=
	WNIv1PrkDW48ZDK4Ccwgpy7G/sSLfPEZJrPl/Is+F58mVw0+dCsVu5+M/32wLC48
	N91ud+LGN/jCrhtaDN7vd04Kzt3dVV5ZKOj1DZhGZBcZ+L1op5N4XNwf4GlDEtHA
	yi0qe7n3+9m1NIe/U7nTDhrz6ScGGQa0mhci2lwnfbNsk3X51DsABtPWYioUzj/w
	O2ZXAivgz7sSpUr9b+HTBM+dpnibLcEHFyEmmbRPIFEvOkOLHL8LrE2JIplgODgK
	WaHiBqhPt4DJV2QEVsRMXI0t7UpGO/0y3WsQgA7H1XH/fXVAoR4E24nKegPA3GDf
	cHeIWENOgJZ+mxm5H9uZhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718983328; x=
	1719069728; bh=sxE25uVd20ukxwTOUCuTr+p1UO+6v1RmLwyafcdb1cg=; b=f
	Tv5X9rvVlAaoEj80J8CzZKYkyA4o07gPGAoKICe/rnUiFUaS+q99NEwnlLAWMY3v
	XbyfNhVxUMJA2zjuD3MlcXrDWvGXr+pcvRJ3ckmVj2JjcAtC7FzYLd9W8g3JS2ub
	erqVGGNUSbB+J0Dd9pVp5VobWd/pEUdWq2KeLU0FZPCiKtQvT0S3oqqtRLTyF36Y
	OFO85RV0oF8+Em4o3bYsKSxnYz4gEerWamDTuSNHJjnsewedFTN/RGZ+1qYC30sw
	TwSLWZaLVLT7VHN1qM+Rb0FKdRwWFQ4c+jKfs5r2baZxm98srhEmFevG2p4zo2ar
	otvH2FyxUmglHKFKjZz6Q==
X-ME-Sender: <xms:n5p1Zi_BdyaqkOwg1i22NzNH3TUoMdbj_LLDSKDfbAAUP_0jXaBWFw>
    <xme:n5p1ZiuX1xlmTSjMg0s85By-mpYZugfYf67_sUKA9taR3yIQyPSeekez6ErYZBKbu
    6xEYETrzmQJfKihGro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:n5p1ZoBXoE-VUUPqgmywCUvFkNj6h_5SR_h_YbiMscURP7nA-qYxGg>
    <xmx:n5p1ZqetxeRUJuE0Z20AVYB3tduaek-5o5cH1BjWeXrAQ4B4K8_iZg>
    <xmx:n5p1ZnO-ZiaroVQsnvDd50IowXj7np4IGJBzN0gzjZFbsMYqDufMlQ>
    <xmx:n5p1ZkkFxXV3HdwkeMXtUa4f7CybuxupUdikif94bi4qVKSwLDkWqA>
    <xmx:oJp1Zsouy4CvRvJLRFZVW780P0QWGBtuNDVixUFWJwQhmHxEX6nXBW62>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9885636A0074; Fri, 21 Jun 2024 11:22:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <83cf475c-86a3-4acb-bc82-d94c66c53779@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2406211446500.43454@angie.orcam.me.uk>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
 <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk>
 <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com>
 <alpine.DEB.2.21.2406211446500.43454@angie.orcam.me.uk>
Date: Fri, 21 Jun 2024 16:21:49 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Jonas Gorski" <jonas.gorski@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC availability
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8821=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=882:57=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 21 Jun 2024, Jiaxun Yang wrote:
>
>> >  I think this ought not to be done in two places independently and =
the=20
>> > pieces in <asm/mach-*/cpu-feature-overrides.h> need to be removed, =
likely=20
>> > in the same change even, *however* not without double-checking whet=
her=20
>> > there is not a case among them where a platform actually has LL/SC =
support=20
>> > disabled despite the CPU used there having architectural support fo=
r the=20
>> > feature.  Otherwise we may end up with a case where a platform has =
LL/SC=20
>> > support disabled via its <asm/mach-*/cpu-feature-overrides.h> setti=
ng and=20
>> > yet we enable ARCH_SUPPORTS_ATOMIC_RMW or ARCH_HAVE_NMI_SAFE_CMPXCH=
G for=20
>> > it via Kconfig.
>>=20
>> IMO it's necessary for platforms who know what are they doing such as=
 ATH25,
>> which we took care in this series.
>>=20
>> I'll add a build time assertion to ensure when CONFIG_CPU_HAS_LLSC is=
 selected
>> kernel_uses_llsc is statically 1, so any incorrect overrides can be s=
potted
>> at build time.
>
>  That might do in the interim as a sanity check, however ultimately th=
e=20
> sole reason these <asm/mach-*/cpu-feature-overrides.h> exist (and the=20
> `cpu_has_llsc' setting there) is so that a dynamic check at run time i=
s=20
> avoided where the result is known from elsewhere beforehand anyway, an=
d=20
> your change effectively supersedes the overrides, and therefore they n=
eed=20
> to be removed.
>
No, overrides are still valid if platform did CPU_MAY_HAVE_LLSC, this is=
 at
least valid for R10000 systems (IP28 decided to opt-out from llsc someho=
w),
ATH25 (platform made assumption on IP version shipped with CPU), cavium
octeon (platform decided to opt-out llsc for non-SMP build). I'm not con=
fident
with handling them all in Kconfig so I think the best approach so far is=
 to do
build time assertion.

Does anyone reckon the reason behind opt-out LLSC for IP28? As far as I =
understand
there is no restriction on using LLSC after workaround being applied. If=
 it's purely
performance reason, I think I'll need to move kernel_uses_llsc logic to =
Kconfig as well.

Thanks
>
>   Maciej

--=20
- Jiaxun

