Return-Path: <linux-mips+bounces-4403-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70743937FB6
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 09:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACB21F21997
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 07:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F04179B2;
	Sat, 20 Jul 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="LSUf8rpe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ho/8Cdye"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC0CDF60;
	Sat, 20 Jul 2024 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721460671; cv=none; b=ZH/oaK8n2FGsTVdOLpzt3p0Y4EPyM+Zgxnd2dcOgN9wuMSPqeoWk66iubRHbXhCAyaasnHuIUsppUn2T36ceeenTNt07xUpcaNWnB7r7azV/H6yoUFQiW0yqPOm3I62MtJ2sefr+bZYubMqn/Ex7YUjst8lURjAfnuNq/wVVBOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721460671; c=relaxed/simple;
	bh=eIv0y7+3oBIw7z9EWqT2JhkyAb3y5kxe+B1Y4QrHcAI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=DHFfOGRB+ceGgiURCT/SmwUGYviF530fTqJrbPfi8Xeh30YBGASorLxvrxc59YJsiNhYIO3nglOxLll+DT0yzY/8UtSHrJzFxd0OwTplN842U8l8u8T6MR4Owr+ba511ABYqR9pH94xwhflBIclsV2yoFNRdkz6GPDQ6VZBRRQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=LSUf8rpe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ho/8Cdye; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 63DD71140338;
	Sat, 20 Jul 2024 03:31:06 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute1.internal (MEProxy); Sat, 20 Jul 2024 03:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721460666;
	 x=1721547066; bh=nFprbjbzfK3PCUnhXYMQrjytRzneuqNBK6Wvnc9m4TQ=; b=
	LSUf8rpexnDThcuaJ1C6Q4/osWletTYa6Q5PajlcA7KZ7saPbb5JHak6DrqIRxRo
	DkmzZS3lwXX/GB3z8zjO2y6w4sCJMzhx8qTGCNRqrssyd3erwIeW8AhGlICI5d8p
	qsMxtmIOBYy0cb8TYPZ4r8OMWKLzwds23gvYsRMMochGG3pJHyj/Vs+DkYIWPmv+
	Cq8xUYV9ZliTuD/A7GrkdkDmoH2OWgx9EI9yl1Glb10dXT9QiUfDEh6ia8nUgzoS
	SuxpuZW1bZGFxjuiebEuf/XWEO1mTUTw2C14alaIIM1t/KrVl5vW2XQOKcT4cfEp
	p9xYzUsS6RqyGcNl809Qvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721460666; x=
	1721547066; bh=nFprbjbzfK3PCUnhXYMQrjytRzneuqNBK6Wvnc9m4TQ=; b=H
	o/8CdyebdSxfutXtvsYE6HUP7KzoAw+I7c8BWBXdJRZbi5bnYx+E6wuAY5fAV2Dc
	pyJSoYb8Q1FknJRSNkOi2DYs2GLoqfOdzGo+CRsqWHOMz2M90xCgbSLrbn/nF3WX
	6nYEAitdaAK3r9qEmJTVPc1Llw3jqYvg7lTx103qUDKAGTw28g/qwYxb8FwkOpVF
	16p03zbI2dXLZ2T9VrSqmPoMNbTS2Ksfn+JQbxnvrouf9loyQHHGBcuJWMBuO7YP
	HestUaKFX8+cTFFpGZ44gWSRymjJie+oLXNABKfUPWqy9lHUNDsI4eWR2toIBqsk
	jelzalXxn4d07jar1+guA==
X-ME-Sender: <xms:uWebZsKRD-MBZ4GQDlz7Tbj5jsefWjmw4UmNZpJGefdHdw_1wL_1tQ>
    <xme:uWebZsJ3Y40-TOL0R0Aj5Bp92KRNtsRcLH2Iw63no7HOcS5_o3ZmAL6-utU6E_dXv
    o5qvw4JV9zG5szTlyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedvgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:umebZsuhKisa3V4RQwIu8xZESIlpdW_kjhM_i1giBgft5r7yXzyqww>
    <xmx:umebZpaxiiSmzomhZaTR1naSdXEHOdns3Kc2xmuFc3VJRue79_O6bw>
    <xmx:umebZjYlJjGcFnogOYO8VBvm6IiDRuLbHl1yu2ga0-YGbdgquUhNSg>
    <xmx:umebZlD4WtW8Ao-E6iMDOYDBiWquCG973QqGQVh55PhQhxsjAHBFHA>
    <xmx:umebZhOTwfIWwqiTVd4aBYW58PvnEZw5CVCdWATjutXSuySVNKuz5J7b>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC23D19C0069; Sat, 20 Jul 2024 03:31:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <58e26927-cfda-4414-a037-7d0057184bf5@app.fastmail.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
Date: Sat, 20 Jul 2024 15:30:44 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Serge Semin" <fancer.lancer@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=886:08=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This series enabled mips-cm code to probe GCR address from devicetree.
>
> This feature has been implemented in MIPS's out-of-tree kernel for
> a while, and MIPS's u-boot fork on boston will generate required
> "mti,mips-cm" node as well.
>
> Please review.
> Thanks


Ping on this?


Thanks

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix probe order on malta (Serge)
> - dt binding improvements (Conor)
> - Build warning fix
> - Link to v1:=20
> https://lore.kernel.org/r/20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.=
com
>
> ---
> Jiaxun Yang (6):
>       MIPS: generic: Do __dt_setup_arch in prom_init
>       MIPS: malta: Move SMP initialisation to device_tree_init
>       MIPS: cm: Prefix probe functions with __init
>       MIPS: Move mips_cm_probe after prom_init
>       dt-bindings: mips: Document mti,mips-cm
>       MIPS: cm: Probe GCR address from DeviceTree
>
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++
>  arch/mips/generic/init.c                           |  9 ++-
>  arch/mips/include/asm/mips-cm.h                    |  4 +-
>  arch/mips/kernel/mips-cm.c                         | 69 +++++++++++++=
+++++----
>  arch/mips/kernel/setup.c                           |  2 +-
>  arch/mips/mti-malta/malta-init.c                   |  8 ++-
>  6 files changed, 111 insertions(+), 19 deletions(-)
> ---
> base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
> change-id: 20240506-cm_probe-0c667c8b63bf
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

