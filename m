Return-Path: <linux-mips+bounces-7570-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50BA19122
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 13:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAB5618881B8
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 12:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC52212D8A;
	Wed, 22 Jan 2025 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IOG3l0d5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pOUSidew"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CA4212B2D;
	Wed, 22 Jan 2025 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547558; cv=none; b=g5jUrUu+sMXerShshqN2ZBL1wvfpRHV5jXHCiU5tKqF+w/fUUb/PUDjfjwh29uXY9TrSkcwREVU9l3p5FOhMGlEeH5mopeFtAikWfWsmOgCiyN4CtePKHEzdxnbUmvqY3KMZvMzkAXIl2BeskSmAPuCssAC79E4F8YJ0bie8AII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547558; c=relaxed/simple;
	bh=4QqJKcD+9dXGuSctWe+Vghvij8ljB0HQQywRGhvi/F0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D3Rg0yPjm0JQJRuPSE/QUaTYi2euCRwQs9LpFhkFzNZupshasD1AJYHPT3gg6h+o+pmtd/Lr1gCAtcJ6KWYmzf2CosXnWMhVTGctnEORLFmCWclIk6vjJrEIiqwtbjrgXvrbyBQ/pWKxF1Zmaksfz0I6ektqmRywT0MM9yyxETA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IOG3l0d5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pOUSidew; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 8FE7E13802FB;
	Wed, 22 Jan 2025 07:05:55 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Wed, 22 Jan 2025 07:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1737547555;
	 x=1737633955; bh=4QqJKcD+9dXGuSctWe+Vghvij8ljB0HQQywRGhvi/F0=; b=
	IOG3l0d5twlMgylRdwhMUgsexW5K18TcGNXBGYNhn18kZX/68G1hQUYwON1j2M0v
	p0UroxsIHQYN48Yr1cWPs4p1Iwj0pmNSo5TgBwKRJ7yETMZGePn+kG/wffDV1fmz
	D5nghH9g7RiId9yygaG9qcDD0cJV+3B8KFPdCKUBrjMjNNSOfQQ0EwVfsRfEKVP1
	6/Tb54kvoQZ3lICVnHEKDLmMM23hSmrCg7LlT8b9B7vAAzuXiXFhXAFiIs1gCRoi
	BK5evpsmFh/fN+IOTl1myBdFAfYKoQB2IHQbz/73hNgZDe2mnl7YCh06fRT8zoeP
	92x2CHNwOMa4FogDm/4G0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737547555; x=
	1737633955; bh=4QqJKcD+9dXGuSctWe+Vghvij8ljB0HQQywRGhvi/F0=; b=p
	OUSidewZZYjbl++jrJo5Be99XDdHFaYj4A5+9CNfC8b87Zl3uLosQgSAOob6cFy4
	iuQZTOLBSmhr39xmjLBrYX3piFvdIyClyUivZwQUSmHrI6D9GKwWMcMuOfODggTf
	jQjRv2r3doTSNl2PxkwIw05SCefxmqOH/Tkj5dMBv3G0stVgR3/oVNyzs8eBY7G/
	yJftP4lmUdSsCro/FjOgJJG3mTYKc1rL1AvKXqBoutybGIS5mXj/tyJ3JSTY5srM
	UyaleMpYYVsVgReIVOXifA2Gt3MQvq3HCvrIewDaPrHbH4Notn/tTLQfOskPE16C
	WZquSCMxJJMqQxN+BOwyw==
X-ME-Sender: <xms:It-QZzmnYEeeg-ci7uPPimpWTVs75k4PGKchuQBo87PRcozq-i8XUA>
    <xme:It-QZ22F5hjtiWIvMaKJJFIgA277Tzwl8--N01Y7316SxNqmTJBKCysNitOVA7XfA
    rmqbeObpH80ul-q3YU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepghgthhelkeduvddufeesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhgsuh
    hrthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhsse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:It-QZ5oV4zMTpmYWy3ZJeRQu9I2EkHg8Pw1kjnUZKj0h_u2ihjchPg>
    <xmx:It-QZ7n689fDQEyU-HWZFYDcNCWTa5G-l5648EfEGhLZFzB4pC_8VA>
    <xmx:It-QZx278_JbAhM4yEyhYpvX-ce3uv8ietuC3eRgcdnK79g5P-kxFA>
    <xmx:It-QZ6tVhZGJVAus43uS8WKB99PP05d32-HiVCYN7tOqLq0hW1SnEw>
    <xmx:I9-QZ8SxtrGRAkrRbgzus0QymskpxBKw8cxRX8WUWa2S6ywrboSBUit4>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ABAD01C20066; Wed, 22 Jan 2025 07:05:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 12:05:35 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Chuanhong Guo" <gch981213@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <0625de4d-35c5-40c8-b81c-583a949c2e2a@app.fastmail.com>
In-Reply-To: <20250120015254.124447-1-gch981213@gmail.com>
References: <20250120015254.124447-1-gch981213@gmail.com>
Subject: Re: [PATCH] mips: add support for Siflower MIPS SoCs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8820=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=881:52=EF=BC=8CChuanhong Guo=E5=86=99=E9=81=93=EF=BC=9A
> Siflower MIPS SoCs like SF19A2890 uses dual-core MIPS InterAptiv
> processor, built-in GMAC, USB, dual-band WiFi and various other
> peripherals.
> Notably, it uses some ARM PLxxx peripherals, and ARM_AMBA is
> selected for the drivers.
> Most devices on the market with this chip come with 64M or less
> DRAM. A kmalloc.h with malloc alignment override is added to
> conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
> features instead of using the generic kernel.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Hmm, why not using MIPS_GENERIC.

Thanks
- Jiaxun

[...]

--=20
- Jiaxun

