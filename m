Return-Path: <linux-mips+bounces-6470-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92A9B1107
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 22:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABA42B22D9D
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 20:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D104B21620A;
	Fri, 25 Oct 2024 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="K4V7SCYn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gIeJwqHW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6317DFEC;
	Fri, 25 Oct 2024 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889282; cv=none; b=NFqVLSIL+e1H6dXJpBJrVGn+ajbS7WV+T2QfxxqE1/18fm1hCnKAbYzFmWtXMqHsMiOaETLaBq4mQtDvPlPt+6yMHaW9bHBApbglQe00XJg8H/awkwVtl6USBFs/mdBLCZAkfbwo4/6SRX+jyKAhYmqRhhuhAHZKQAsVw1+e3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889282; c=relaxed/simple;
	bh=vbS1uyGqfDTIFJ7soGB8WDKP2dnDHSc2bUdOiLpNmn0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mUCoIbNyc6fNgHirTnSG5Q8Yyq6AVYUzfIf25l4MZdvuRU5repGloSlgDc+LcEXi+Jk+C4jxZeYs9uRl4/QAKI/KWPtc3jJTBTG7NgV8UHbSqnptT4bYeTiV2P37d3ZmmpfxFUTBQmA7nVLQNUqLnMgXghDil/D+B/p0h/36PDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=K4V7SCYn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gIeJwqHW; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A2961380231;
	Fri, 25 Oct 2024 16:47:59 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 25 Oct 2024 16:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729889279;
	 x=1729975679; bh=vbS1uyGqfDTIFJ7soGB8WDKP2dnDHSc2bUdOiLpNmn0=; b=
	K4V7SCYn0EjWUNjCns3IYpnKTclEp/aWNQ1v+Fuv2N2UMrGCKj2r/eunKoOc1zL8
	+ibSLoxRcp0xvfUSHcMqxlpC4rwRlio/RdmX0XkfmKXoRgCBU/ZcuULJOM5+RW0V
	qA3uE9M7oash3cp0Jleo2SKgJmLtAWP0inyaa62dE4k94chhUyGZh9ePQexXVJh0
	e4zaLCRdaxPhS/IOBcH3kRsxgxzHO/JqF09hOOjG9VUo6T6tSueRna28KcxOlNAt
	vbITqKO0Ny/y4AguPZwNRrdsaZUaCNM4NkG7Cc/RkSXa91Evmm+9yWLey932pOpc
	ITOpu70w3MgM1rqY7HP5XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729889279; x=
	1729975679; bh=vbS1uyGqfDTIFJ7soGB8WDKP2dnDHSc2bUdOiLpNmn0=; b=g
	IeJwqHW21tSd6xL0dhUZ3Td3tCUegktVz85rP8M+ijZqgdqsDIV+rRaa+DRsk/Dr
	F52oneiDFY+jUQiyNIN07GQuV+UJgib2AdDBfZziCZwNK5IjnCrjoS50Ak7a4S+Z
	oYuZEDNgS0m9lbShGaeFrhoaOmJ94MUv5UFDAyVn+iKmCX6RHVFxyAbLOqQmcxvR
	fACkmgOQYS5x332pkBUd3r9jQoWCx1A+Ls/kDcyDXI3m5hBNuNpGp8hRSvTYImgM
	2uv35sb1NhpcrJThKrwOlGb1A0xVz0RAWEMestqUHFdt65MX04K6tB/fPbzVtTSf
	Dq7EPRD4pMWb3K1kHzK2w==
X-ME-Sender: <xms:_gMcZ_NEllb6-Lmfac7W8QN6b4tLSnwwWPzWoVY1rpiiKLh1u5dHlA>
    <xme:_gMcZ5_J53E9YMUnWjE3fFo721NVCdUcPSlQqTnUJtucnAhV5xu8PaJ8rV14ollWY
    Mx-szKIXkaFz1iXkhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpth
    htohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopeht
    hhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhope
    grrhhikhgrlhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhht
    rhhonhhigidruggvpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilh
    gvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhes
    mhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_gMcZ-QKynapTsXxHfMfohgmM8MFl9UmWgCzuL8cwEYhtIegppFSDw>
    <xmx:_gMcZzvn4iClDRuHq5LO1jI0yoJYlk78wU58IitocaYWSJlZjW74wg>
    <xmx:_gMcZ3c6A23tcQLoRWP2m_1DpXWEtpsH7pVJUp9wDsPV2ZVfdGJa_Q>
    <xmx:_gMcZ_1qgemi6oAY2Ru6SdnQZm4Q3cDdqctFhbMaMAGD9_I19kxezQ>
    <xmx:_wMcZ75MPCOep3kc_6eQ3ZiQEIDjRNfhTBnoayFHkMgHlwNJJKacAIqt>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 91D7F1C20066; Fri, 25 Oct 2024 16:47:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 21:47:18 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-Id: <4acb9693-ba68-4f09-a4da-677c8b1e583b@app.fastmail.com>
In-Reply-To: <87jzdvc3wo.fsf@BLaptop.bootlin.com>
References: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
 <70b28614-e40e-4022-818b-80711c05c7a4@app.fastmail.com>
 <87jzdvc3wo.fsf@BLaptop.bootlin.com>
Subject: Re: [PATCH] irqchip: mips-gic: Handle case with cluster without CPU cores
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8825=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=889:40=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> Hi Jiaxun,
>
[...]
>> Is second cluster IOCU only?
>
> Yes indeed in EyeQ5, the second cluster is the place for many
> accelerator for vision that benefit of the L2 cache and of the coheren=
cy
> unit.

It makes sense to me then, that for the information. I just checked
IOCU only MPS release and indeed those special handling are necessary.

Reviewd-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I think some initialisation to IOCU and L2C in second cluster is also
necessary, but I guess those are already done by firmware in your case?

Thanks
--=20
- Jiaxun

