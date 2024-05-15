Return-Path: <linux-mips+bounces-3278-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D68C6DCB
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 23:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDE71F21351
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 21:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216F215B159;
	Wed, 15 May 2024 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="tDJdlNJF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y4TDIZc9"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9A1FC4;
	Wed, 15 May 2024 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715808521; cv=none; b=HYigwv4FQzRshNVgaRTcEt91qZv/+gwjwMwaweW4yTH4+10h1zJrcPpzWRJQptexU1aYP3zE6hJdl8L+jMeR7grW0H6cF1ERNdcb3aE1pwCFTIRkVcpCuDAYwNxtdIk1Jtu6v7BSvZbeYHEpaE6gshopQHZQg499iFWOToqTPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715808521; c=relaxed/simple;
	bh=JsishlYutza6HkbyIEvx9CmiWiE8OXCeNDbrTOBPCXc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=hyw+3UvFtlQ9lO890kTjsTTmduOFrwySH6XJNdtfjf+8TX+Q1VVrAJ1k1APvl4uk6B+R/XK8KokzCaodN0yrxP9nIGOXlBVI5Z6q+FwUEHe/TEAsTmroZabL4XSlNRsJXrpzqZfepn8RoTP0Wi5CAods+eFtD7Bb4h2wJangk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=tDJdlNJF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y4TDIZc9; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id C109C18000EF;
	Wed, 15 May 2024 17:28:38 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 15 May 2024 17:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715808517;
	 x=1715894917; bh=JsishlYutza6HkbyIEvx9CmiWiE8OXCeNDbrTOBPCXc=; b=
	tDJdlNJFhXRoWMLDg5bwFOrUlh7UrUC39TWZGZbEJK3q167BGtICXK1gtF0f1bcG
	YD/gJqYzmdGvA9ACzfApOg7sUvfMYbO14ipwBEVWq7/OU/Rymkg445LyFBUN/kIp
	MsvzPJd1Krf+B00I/Qg/kF5nZzD5W6pTjjWTrfVTEdQzcCj7e7IJneTRkEEfh5oW
	A3cP2kJOGYSZmcdYFTfYg9/edn+AFShsc1c1U2VJDhyviKzVhCiYI5kprgOj+gI8
	OE0Uf+a4AN7Sk+A9zJ1a0Ii9sFyr3xXjN1ZcMPp/J4773mLdcNTKJLuY688mhFL7
	itYaDdl08VNI2nYd2utq9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715808517; x=
	1715894917; bh=JsishlYutza6HkbyIEvx9CmiWiE8OXCeNDbrTOBPCXc=; b=Y
	4TDIZc9MtepsOkJqeV6H2LtvmeoEjNqr8L1rQ8ARMh73hy5/ZwWUz4AJdCteU73p
	agH1EAI7RFV4+EAXHaFl6TTP5P7gU5CUjNCcjcON7K6gnyKkpWysb4zb2qYVKSr6
	dVHgewwEOmR9/EI3VfAoxyTMy5ZaJ0Ec8KK/AJKBb4lgLSnnJwEwrIi0yydttsg9
	8kyFFK+awv36pVx/e6C1GimJeo88bhr0aWxpdIdl8AFfxK2mHSMcrm5Ke56JV8KK
	FtvO8OOAMP6E7zs8xqZ83a+bW2AQT1AFOiGTooQaXGXP/NAJpAdsAmFLBL0LhIs+
	jOoZB0u0pSUsmkXETky/Q==
X-ME-Sender: <xms:BSlFZjsbeF2Cgtx827Mt_kRcu1Jdl1NDsOMko_BtiZthU_BihcXE9g>
    <xme:BSlFZke29EBk37OF8G2koRvS1MOZ2_StGr4muiD7ARYSg4MDY_ng_ZzcOwezkbeV2
    cHYOfsv3qDMftGRyQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegkedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:BSlFZmy-yRZ4y9Y40SURWTT7405njdUmAhRpRGg-3Ew7KaMtyDrICg>
    <xmx:BSlFZiOIbm09mjJNWF8s6tOqacLGvPdEAN-9UpymdsCYmulMnnpMOg>
    <xmx:BSlFZj8t5_zCO44DbO5sVGP-JZ25-1dsT5BKvbXBjx20adCdYWx-iA>
    <xmx:BSlFZiV6DzoJfty4XqP1HWr3lU54lCHeSDfb2O_hQHfO3H7K6TMNlw>
    <xmx:BSlFZmYf3aDtNu4JTI0cSlIBT-b5zFvd-hj-zyKGcZjPXsd2wBtuiBIY>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2267636A0075; Wed, 15 May 2024 17:28:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
In-Reply-To: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
Date: Wed, 15 May 2024 22:28:15 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=882=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:59=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This is a attempt to bring all low-level debugging print functions
> together and provide a arm-like low-level debugging interface and
> a further capability to debug early exceptions.
>
> This patch elimiate platform specific early_printk, zboot printing
> functions and cps-vec-ns16550 by newly introduced debug_ll.
>
> Hope you'll find them handy :-)
>
> Happy hacking!
>
> Thanks
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

A gentle ping.

Our reviewing capacity is quite low recently, hope everything is fine
with Thomas.

Thanks
[...]
- Jiaxun

