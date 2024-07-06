Return-Path: <linux-mips+bounces-4173-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CFA929117
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA1D1C203A9
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DCE211C;
	Sat,  6 Jul 2024 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="AcQARgW0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qDo66Agc"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA749134A9;
	Sat,  6 Jul 2024 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242624; cv=none; b=MLUZOmJNoQmQW8EBFsImKk55lI+aaruttWnN32g9Q7WxwVCPs+btqQ1H+KIqwsKisCAcgElKC3Uf93dgj3H+x+KWq8hI9MUW7ETE/HyYZQAZ7VghbXTNM5JWB2BRsd1MSYlFCXDHSgmMBMP+qIu/pKxo6UvAz+IubwjwNFYO9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242624; c=relaxed/simple;
	bh=uXJuO0ar4KNAfctKzaMcvzcLTidBa4zbvW5elDHMKgU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ALP2wikxbfASm3LpbFuWdur+XLX6mu9zuYLj3oRHvWLI/L1TieX78MOO9P8g8nFYYgA1e3S6cyKkmdKTT7F3chnB2sWhMExrgPNhhkXIqgtnvsiyApSj3o4WKzvfIm0H8yRUu5t9b6WSgJeylv8rXk9FZFn15KYgrcvo0oFleJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=AcQARgW0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qDo66Agc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0651611402C1;
	Sat,  6 Jul 2024 01:10:22 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 06 Jul 2024 01:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242622;
	 x=1720329022; bh=GSLngGMalGZD/Qlig2AUU7rfR0AN7E8izaKIuOLpo6Q=; b=
	AcQARgW0s4SJP0My25QGHeYpRaGMMEDlwt+klbiCiuvcQ13T+4nhq8ImBI05mh43
	jo9pVHz35moc7DXyI1f6saDB/FFBGcZDOIGxFqSS2Vtp3rmJKFRrhcMI7YdMHFK/
	rrpzWbwQOsjviRZsGBLXsALxP2RNFuJJpMxtH1d3G9hgwPiSwXc3sIjbxfWLX1mf
	nxA2qxydDU4p9uOlAMc1xjcoLFKByQTAUljy/aKtSD/8w05XBVDg6LJY8ZW9l922
	Xry+P0HIuB+AO4CNVGdIRX7kMXal9pSbSo2zGklx/D7Rk8UG1rvhJ6b9tCYyxiQa
	QLQ3CUee7OvBSekHJ461sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242622; x=
	1720329022; bh=GSLngGMalGZD/Qlig2AUU7rfR0AN7E8izaKIuOLpo6Q=; b=q
	Do66AgcxXU04ALV49GJUAlraBQMExbRzlQL7uYYkt0LaaEEqMP6MkkfNBy/XTPBB
	pTmK19APYOLdNrU41agim1lXkE9WIQb2D1Ug44yGW5wjwqoq1AyUcNayIz9UjorP
	UBDSRS17duXHmERxrS7tQTXKmb8dGlOvb4nssIaPdjZvXz7W90RI2jri8qZYrmiU
	xWg3jaQgwfhdrajym7mlR+glgyndPHg7/X83mmf3ivPdoSGqcThTFqonYTU6Js3C
	J69c+UPuqxSChUaGZsSaSZqrY5I+Fa9JLW+6ltzUQ8xLzF4FhWaCrYs8Ya49iYVP
	6gEnGjIF/Xmw0hN3UrPCA==
X-ME-Sender: <xms:vdGIZiYv0sLjORJ7iw85-aK8C6a2qtUVURyoLrjCgNPXDTUjH2Vp4g>
    <xme:vdGIZlZT2HxL8QYFfaFRdhjSWqD2OUYWk9elpT1MsIcKFaIA7s17OOjj-m55zhaA2
    ysVjYdYKmKBgtb-G2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:vdGIZs8Xo-EjmBngwmdKl7Hlxk1BGiU3hdpHLgmruba7zm9TYIKhVQ>
    <xmx:vdGIZkqJjFOCeIoXL8kaQuxhcs9OxpedJJedMu4EXd40cTVB5KZ4zA>
    <xmx:vdGIZtq0qs7uJTrmeqxA82Bmi4Zh0WZbBpDy96fb93eFL7uPEAOekg>
    <xmx:vdGIZiR5CaO_SpXqlmPbKQ6XhxLtpjBKvkPy3DAzxDBgX7eYjn6_Dw>
    <xmx:vdGIZk3DofCj4ql_v1LJTMQo2Izlt9iU-Jg-5kE7fP185XAExRtFu50F>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BA6D836A0074; Sat,  6 Jul 2024 01:10:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f9030076-4356-4eb8-820f-033a324c673a@app.fastmail.com>
In-Reply-To: <20240706-config-refresh-v1-1-5dba0064cf08@flygoat.com>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
 <20240706-config-refresh-v1-1-5dba0064cf08@flygoat.com>
Date: Sat, 06 Jul 2024 13:10:01 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] MIPS: config: Enable MSA and virtualization for MIPS64R6
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=886=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=881:07=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> All MIPS64R6 cores so far supports MSA and vz, so it makes sense
> to enable them in 64R6 default config.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/configs/generic/64r6.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/configs/generic/64r6.config=20
> b/arch/mips/configs/generic/64r6.config
> index 5dd8e8503e34..2a2036abdd2d 100644
> --- a/arch/mips/configs/generic/64r6.config
> +++ b/arch/mips/configs/generic/64r6.config
> @@ -3,4 +3,6 @@ CONFIG_64BIT=3Dy
>  CONFIG_MIPS32_O32=3Dy
>  CONFIG_MIPS32_N32=3Dy
>=20
> +CONIFG_CPU_HAS_MSA=3Dy
^ Ouch, typo here when I copy changes back from my build machine.

Will respin after initial review.

Thanks
>  CONFIG_CRYPTO_CRC32_MIPS=3Dy
> +CONFIG_VIRTUALIZATION=3Dy
>
> --=20
> 2.45.2

--=20
- Jiaxun

