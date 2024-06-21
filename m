Return-Path: <linux-mips+bounces-3834-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3759122C7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 12:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731C9282554
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 10:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61F3171E4F;
	Fri, 21 Jun 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="VLTvLFBS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m3hJLn8J"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6F116F8E3;
	Fri, 21 Jun 2024 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966782; cv=none; b=huhXn11VLSQI7PNdp0ln/YxE3g4RLxaM3GlAgnKFfdrwLZciFiSOcit1qlXN839KefxSmuMwosoDYBwC4aAZUJQQxq0mFKdiWz/jtkwN5+1jtjBYw9gcpJ+tNYW4sWSq4W1PUuJOvAgnT6wLIUFF7UJIewCI5XPyVoBdTXho7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966782; c=relaxed/simple;
	bh=zSB1STr2bBQAh/5Jdwsp6IX4g62SfhyrEo5rMbFs3jc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=hI7+QcBgGxZHajvL5r43EjwboQjghkcfJjRHnZEk1bx7oYyOubtUhgFfdUt311VsWuvGg2bRU60AiEDZu1NWMJotywn7hFlgnVhHW6fOfg8oOYIduPddMVSvLp+fe4eTHxzDwqVEaZiWKBYC9fXlwnHUmNTj4tfP/qeJmfASTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=VLTvLFBS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m3hJLn8J; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id AAA251C00063;
	Fri, 21 Jun 2024 06:46:19 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 21 Jun 2024 06:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718966779;
	 x=1719053179; bh=vNXsJmdir0Xv77IAtckKiaw1MH1hpHUSKfVRwspug3c=; b=
	VLTvLFBSey95k5TiD7bpNPHcMkQnLN9eAKlzbAeofLVEsyixujK7I5ovCDe40SWs
	FLgU8BmoGDe+BgUGXtCUdmKeURgn9HQpzVZqK9qJPfiIOTBu7dewzoPVaO/7q/3x
	DsA1aSVzUatWH4BZLs1PnEl8Bu5+BLjgNI1+zhCzZRdQUm8J0nZp2UTKRxkIpTVx
	WA/DEyfUCG8D1v5T8przxqUYfSHXLpmfpFrhobmquwX615UHxTyP60QwQ8sEsOIa
	BhR6QdwDwpHEjPNKnqiQakWMo23jjtZkpnnt9x+OzoSmxq16i+aDqyoZ/sL0vmOT
	3JhyZXtIxVBmLjP1wjapUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718966779; x=
	1719053179; bh=vNXsJmdir0Xv77IAtckKiaw1MH1hpHUSKfVRwspug3c=; b=m
	3hJLn8J2QBaWmtsH+6TdZdEGxYsMgTqKKaDLIcIz96QR4xMt/iZcfnIUx7zlu7xr
	wk8q6ymX0xHrX7BmIvIy5StVEr4sn/usivp4kQBFcUni32NT4b2Ha4heyePpxYCi
	21+a2YrJHgkzHCRPNAQ8Cv+RdN+zlTweWqpTtoIt2jm+gz0gixe9Zodekx+Y5mfn
	m8aDd0LSstzlJCHd7Z+n2SN3hnqZFoyhBTgkcaGAONZW8iRQlzyTVKpHs+REc8H2
	tJpGcsLtT5XFmBn35UiXwjs9gVXuYNnwBbpWsbpuGHgiCp1FDYRPjTMvvWdUlvIw
	OoEmxjBNIyG9MsldTxjGw==
X-ME-Sender: <xms:-ll1ZlkDLAukEljR8R7lhsaSooXKhYasckmb4fB_UMh1rirNIcfKyQ>
    <xme:-ll1Zg1_wdjDROQyeBvDcU_ZB4HYf4riZotE8sYx5WAUpcCI9zD1mpJHqF51PXTKI
    SbUBWHDWDXnh_JibPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:-ll1Zroe5X-HcjdaOF9-AA6PRahlbiKrggujHaghQUybU_nRLpTKfw>
    <xmx:-1l1ZlmdhDIJdwOAxvSN2kmVRbBKHAtN5XP1sKulKDn54GddnTE9og>
    <xmx:-1l1Zj25JCAdymEVaYhZbJMiy5RDNHZeD14r2Qmzaubm5ejV-Kp93g>
    <xmx:-1l1ZktJMtmGb97HPujk4VmM_spCf00AjxphP2bjMbbpHl9fVAPrqA>
    <xmx:-1l1ZuRwhOTRuP3C3Rf7RixgEMpHPcxkfENNiKh8rTvTunG4ntmKtlOP>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CD7A236A0075; Fri, 21 Jun 2024 06:46:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2c26a07f-fa68-48f1-8f3b-3b5e4f77130b@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
 <alpine.DEB.2.21.2406210041140.43454@angie.orcam.me.uk>
Date: Fri, 21 Jun 2024 11:45:41 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Jonas Gorski" <jonas.gorski@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC availability
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8821=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=881:00=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, 12 Jun 2024, Jiaxun Yang wrote:
>
>> Introduce CPU_HAS_LLSC and CPU_MAY_HAVE_LLSC to determine availability
>> of LLSC and Kconfig level.
>
>  Taking the subsequent patches in this series into account this seems =
to=20
> create a parallel universe in which the availability of LL/SC for cert=
ain=20
> features is handled at the Kconfig level while in the other universe i=
t's=20
> handled via <asm/mach-*/cpu-feature-overrides.h>.
>
>  I think this ought not to be done in two places independently and the=20
> pieces in <asm/mach-*/cpu-feature-overrides.h> need to be removed, lik=
ely=20
> in the same change even, *however* not without double-checking whether=20
> there is not a case among them where a platform actually has LL/SC sup=
port=20
> disabled despite the CPU used there having architectural support for t=
he=20
> feature.  Otherwise we may end up with a case where a platform has LL/=
SC=20
> support disabled via its <asm/mach-*/cpu-feature-overrides.h> setting =
and=20
> yet we enable ARCH_SUPPORTS_ATOMIC_RMW or ARCH_HAVE_NMI_SAFE_CMPXCHG f=
or=20
> it via Kconfig.

IMO it's necessary for platforms who know what are they doing such as AT=
H25,
which we took care in this series.

I'll add a build time assertion to ensure when CONFIG_CPU_HAS_LLSC is se=
lected
kernel_uses_llsc is statically 1, so any incorrect overrides can be spot=
ted
at build time.

It's better to clean up platform's overrides at some point, I'll leave
it to a future patch.

>
>  The note from <asm/mach-ip32/cpu-feature-overrides.h> seems a candida=
te=20
> to move to arch/mips/Kconfig at the relevant place on this occasion to=
o.
> There may be more such notes and they ought not to be lost.

Noted, I'll add a Kconfig symbol WAR_R5000_LLSC and rescue this comment.

Thanks
>
>   Maciej

--=20
- Jiaxun

