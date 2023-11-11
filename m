Return-Path: <linux-mips+bounces-15-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0437E8ACF
	for <lists+linux-mips@lfdr.de>; Sat, 11 Nov 2023 13:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A201C2081F
	for <lists+linux-mips@lfdr.de>; Sat, 11 Nov 2023 12:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C41426B;
	Sat, 11 Nov 2023 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Wer35sQr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sKUB4+fz"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05E14017
	for <linux-mips@vger.kernel.org>; Sat, 11 Nov 2023 12:07:53 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350799F
	for <linux-mips@vger.kernel.org>; Sat, 11 Nov 2023 04:07:49 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4E56E3200913;
	Sat, 11 Nov 2023 07:07:45 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 11 Nov 2023 07:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1699704464; x=1699790864; bh=lVp7sWzchkZb5A6c8jYQC265x
	b5KIKtkTMyyBsOjRpg=; b=Wer35sQrxnrzA/lOTLoviED1VM/+dxrGmknGr7kb5
	wlUN6OdSkN01GoMxomO3I3XWtdNmWRtA13t8UZ6c/3fPw/4sK4os3wEAIigddVGU
	ncKApO1uQbdhv/CiqvzsRlmCz6QR1Cc0OfsXsXzyb8j68JiejtXwGXY49pdAHszO
	XvjrZ1ZgYs567BR/yf4xvX5+XdQvuqfvpzlW1QSYPda6ZRHV3LMumnJKTR2RObLA
	D9WmEDgWNcgWG9BoI3N/VO28xnrsc/oxVo6q2rgnf+Lcz3O72UZiKHgwTuQdpt34
	eGsDvO+bYiRRy/rMpWjatWHSwGLU9m41B8xTdNB3GqSqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1699704464; x=1699790864; bh=lVp7sWzchkZb5A6c8jYQC265xb5KIKtkTMy
	yBsOjRpg=; b=sKUB4+fzOZWSle8fPj+CpHhY9hptvyptG3hHID8NHsNbn1GMHkb
	Iq1o8Rz7sc0rbyJ67+wHfked6tjmcLi5agvihay3hl44omssB2zu1kDP8fJI4YUR
	M7Cfa6CXTGMLumBRtfDkLlOhc2eZjzu2h3Yh7FDPgbci79XWv2CUmjOJKhBCGG9i
	l+R1H+BubiD0/qa4060HYKdPT/5sZAvB2XfmZZrGUf216F/I5ggD4RsGWM6Ua7Aq
	GjHj0DgWHDBCrHCO+sU8i6k+HgSQxy+CiAHyqYCCy0d1LNGZ2IXXp7M/O5wKQGhh
	3ahfGxWS9idd58wEgacEbx6bxxHl3zt4DeQ==
X-ME-Sender: <xms:j25PZfJUEJ-KCBak1SKJkcRON_mW2hfDAtR_bInGcdAIDoXOG4lixA>
    <xme:j25PZTKzU9lhgZlyUbvTnY9DZHIlObBhCN7aajWdW3LyW4CSUyS_YVzpGce8LU6vw
    iKcGx8R7ac1n3296v4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddvhedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuefhvdehheegudeuteefveejtdevledvlefhuefhffffgfeh
    veegffegleeuhffgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:j25PZXuQGkGhd-PGk09sH7YlXhAYHHRhhPn_Nkz3mB9opwfJpV7PUw>
    <xmx:j25PZYZyZbY5h8l9g4714x6fu08khjQDLP-QvWhOLT9R8n-kdL8uJw>
    <xmx:j25PZWbr4dGtr-6EnPRdPul645xjilMhGgwh62b85tKmkI8T0kdosg>
    <xmx:kG5PZfAhPVN1GPUMTPl50D90eYUsRnxEUf416uGesGMXYx3yK5XNxA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B1AF236A0075; Sat, 11 Nov 2023 07:07:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <b84cf882-1d72-49a0-a7d4-cf15e9478216@app.fastmail.com>
Date: Sat, 11 Nov 2023 12:07:25 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: kumba@gentoo.org, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: sgi/ip27 REPLICATE_KTEXT: Any user?
Content-Type: text/plain

Hi all,

I'm trying to unify the implementation of NUMA on MIPS kernel.
Currently, we have 2 NUMA platform, SGI-IP27 and Loongson64.

I'm fairly familiar with Loongson64 and I'll take care of it, for
IP27 I have limited knowledge on it, I'm confident with dealing
general NUMA stuff, but REPLICATE_KTEXT seems a little bit cursed
for me.

I had a glance on it and I think this feature won't work on modern
kernel anyway. Nowadays, we have many fancy stuff like uasm and
static key which will modify kernel text at runtime. 

So I just wonder if there is any remaining user on this feature?
Are we safe to drop it?

Thanks
- Jiaxun

