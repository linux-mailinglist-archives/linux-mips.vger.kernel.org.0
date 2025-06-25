Return-Path: <linux-mips+bounces-9499-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FFAE86E3
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 16:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25AEB1637C4
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 14:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F651269817;
	Wed, 25 Jun 2025 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pop4ozTM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jZLqytQG"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF57268688;
	Wed, 25 Jun 2025 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862666; cv=none; b=VOriPHZTfi5WCYwnwxgYuY1sJJyaGv7/Br0GqsmLBW8v/mLzFDkN2oO0x/7zhuKWEyOHGtmU7Uc9aPNciI2ADTe8LKUSume0GFnw0rAqh5CABHOpIRvBm3kjPmhe3w9DWxRWZV15i3lO+8mVOd0ZiQq+L92vErxHIHBY8OEWitU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862666; c=relaxed/simple;
	bh=tb+Qf0bMOlqi5RQUGlXx2ej++rgDmLKQRnHq8rCRq4o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V46kqpzyc9Czl4Pxx6nEnuoEDXIc6nPUAmqza7Q84KoCTpWNX5v97nf032gFLh2WHOJVTBsr0DnXqrnyFSXBmHXii3BCHDr0n1iW7AlzeB6QpCWpziAnMUL1bd1I/xL3DYrOVbPOVaDKzKk+N1+IRPXrknrXKPNq2OaAQLK0Myo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pop4ozTM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jZLqytQG; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id BA94A1D00129;
	Wed, 25 Jun 2025 10:44:21 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750862661;
	 x=1750949061; bh=F7MlgIBtKJDe2dIIvnJcjftvaO+3hOLqw6764Puv5SQ=; b=
	pop4ozTMmJUafXrwB/riS2yemR7pJlIesh6TVKGlul5lA3byEDidzR7Feb+h7NZ/
	vN5931aOKd9vgnH2ytAk7qT7ggdwsZpMo+NsTDaKQTKoHl0MhwKAipFuVWTLS/8q
	h1+z5yiEn3RteCBRvkmI+My0pIwkUT6vr7ZKV/MNVZ3IyvyscDdhY8pznMpChZVF
	8gU4Ggbe9b+sC76ZbU4OO5IRw1KbCCWnTPcF0M0mRWn/9/siVWNZ5RdEBJz/BwMr
	h/yvL2LfEY1PDEvJIn2B9Qv7LIi/y1pUFc5eSiC73QiWXYng68pG75B985RbvJZ5
	mhzjoflqr45vLDg6oN0Njw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750862661; x=
	1750949061; bh=F7MlgIBtKJDe2dIIvnJcjftvaO+3hOLqw6764Puv5SQ=; b=j
	ZLqytQG600SI1oly4aMNgMY68VrlzvfVn3EibI7lMltP6YRZc/HkUwy5sxXOkliD
	0Lag8sMQYpBngvzSUtH+pmljhkoSGVQPkiKo6qp/lMOhFrTfnDn/9o4jde2OZ0dh
	xujN3paw9w2+4MqGCYa7OwSJpEdZrxlsCVELYe6gxoPpEQsadE5DwLx/+oNQjbO9
	i/hTN4B1XmOqwEkau5NB2JpyolL4AvPux3cnH40dNbPyYaV48fsP7AlvM/c9oJdo
	W0bqkWtD+FRaQrP1DUlAC/UQxLiQmDlqGEpWAbAaDwGXMOyKjUZriowF8q9MpjfZ
	LtAx0L8MRoYznhUjUf3ZQ==
X-ME-Sender: <xms:RAtcaOApX5Rk0g7kxCek02TYWVJKSEgQ_l2Cgx1wU4ZEVs7Yb9MaRA>
    <xme:RAtcaIgwms4mLrM6Y-EGwDvEqj64duscZUrBMjd8ETfdZ40bECSWTMod7n-w5KyC1
    C-SuD0_Yt_J48uGNWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghm
    vghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnse
    gsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmh
    hosghilhgvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrght
    ihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RAtcaBkyASSJ-C6pcwcLZsf_DZikVFx9vabBJpgxAWG8coXE5_SKag>
    <xmx:RAtcaMw2dIl4sWK-Hz1VZefU0T4ndBhM9eXRrHEwK5wcIjRSPdXpxw>
    <xmx:RAtcaDRhCphTEEOgxz6s5Kv0bfWla6ewgQXDg-HVZ-uaEI62_jaOuA>
    <xmx:RAtcaHa3lkQKAIqLfVfXtJmOTHjraPImyBLdsP8XgWhf7YEhuC7XgQ>
    <xmx:RQtcaFanIxcDhtx5bNX_rnscWD8lq6LRJTJat3xPGke9mNP1aVBYIt60>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B8C432CE0072; Wed, 25 Jun 2025 10:44:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5c6495ba301cbe19
Date: Wed, 25 Jun 2025 15:44:00 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <808e21d2-1212-4358-9ba6-29f9d097be8a@app.fastmail.com>
In-Reply-To: 
 <20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com>
References: 
 <20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com>
Subject: Re: [PATCH] MIPS: disable MMID if GINVT is not usable
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A82025=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=
=8D=882:27=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A

Hi Gregory,

> If System-level Interconnect (aka Network on Chip) does not support
> the global invalidation, then MMID feature is not usable. Indeed the
> current implementation of MMID relies on the GINV* instruction.

Yes, it is the case if the NoC IP can't handle AMBA ACE DVM requests.

>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/Kconfig                    | 6 ++++++
>  arch/mips/include/asm/cpu-features.h | 5 ++++-
>  arch/mips/mobileye/Kconfig           | 2 ++
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index=20
> 1e48184ecf1ec8e29c0a25de6452ece5da835e30..05ce008459b89f03fa71d9442960=
7feb9d06526f=20
> 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2575,6 +2575,12 @@ config WAR_R10000_LLSC
>  config WAR_MIPS34K_MISSED_ITLB
>  	bool
>=20
> +# Some I6500 based SoC do not support the global invalidation on their
> +# System-level Interconnect (aka Network on Chip), this have an
> +# influence on the MMID support.
> +config GINVT_UNSUPPORTED_NOC
> +	bool
> +

I believe this should be a DeviceTree property of CM node instead of Kco=
nfig
hack.

Thanks

--=20
- Jiaxun

