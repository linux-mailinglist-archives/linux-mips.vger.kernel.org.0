Return-Path: <linux-mips+bounces-4125-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6392694C
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 22:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA29B257E7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 20:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FFE183082;
	Wed,  3 Jul 2024 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="CHiBEetX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K/3l21EX"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DD13DBB1;
	Wed,  3 Jul 2024 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720037313; cv=none; b=smkswaIAcfW4Lqmpnz/u5ui+lc07k8MrVAQ+PJ+Lcan/zcxwpBofel+YzRIE1LTlB0xO0jgpGT78xC/GLObwLyq5PD61ioegN3V8l9C0HDkhZ4tihWk242siCw9X1OGj9F7A75FjC9Pm0EGTkl6JC6cZrUph3hOPcr5z1SqHQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720037313; c=relaxed/simple;
	bh=nU2pXnhzAvsvmAcvvLiC+iYIfVNN1Uq6u1W1gFKqZGU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=e5H2bdUfrFBlMAb+lLYTQDyDkU6wYS4+TE04SXTuizW3iwOD4VWURaxtFjgOBj93Si1uoVedXlr0BaqHPHd2iKZTHSMmpSBeTlwnLJqXVu3DeO+HmlS0wsjXQKGvQkeZN7AWdQTB3nYxShgiEowM9Zxe1HfoabO3tBIkWeuERWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=CHiBEetX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K/3l21EX; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id C5F04200593;
	Wed,  3 Jul 2024 16:08:29 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 16:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720037309;
	 x=1720044509; bh=q7kdcCvnntxLjzglADr/q/s487tYnVnAB6QRWdJCbrA=; b=
	CHiBEetXWdYC7nUtppIBhNwBGUzQ0u+LWoNRshZ3+oErzqddHPzxmbX62WmOeoaM
	6e4MciMgUX/7J4vHxf/FkDFvyLZ5bMfMjj9Dd708FHlwCfM6vHSfiibOgOprXMyN
	nCVw9yv1jnG9B+45sXGAV4v07ZOAjlspdL9SUi1UCOthIQIZFSSfNqrXcRJZpW6R
	kMsrOS8bq9zZzlmoyRSyoUNnNXN1IE2tKJao0oEgNSl95YSWJXiGGQky+bLx2cYO
	AL1BgaEiYLR5AyVFYITi2XDTdhiRYV8s1b6vfnIT72gKpPZBuPn8vjTxKsd2br/U
	g917bk+Knch2+YcURGjXkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
	1720037309; x=1720044509; bh=q7kdcCvnntxLjzglADr/q/s487tYnVnAB6Q
	RWdJCbrA=; b=K/3l21EXtNN6TnWvLnRXTXprRbnRR7jEE0P3iOTOGLxJS0f9d8A
	BHbn+YAqUX6QK+j466D58KCBMl70OZQ/kawYoCLlETb0wVT1i3OqUtNvmgCmOTmN
	aSsprhPtdMmkzpqxqiCJ5a1Uq6G16D8ezHtw/zPx5RqpVwpC1veZXeVtab95XqbR
	yCytSY0lUdEU8+ZuqnAn7Ld4aTf8/KBkHoAmvUjiLeDcvqPNMAaZcs8bOcI/e6JO
	k+i/dIYzro9X7tocj8lpew/LI+EUmkjrh8cViF/3J8L8Wm9l/cfznWFTfM58pW/C
	hczoip4o5D2E1peul4zS6FF03zTglkuxWbQ==
X-ME-Sender: <xms:va-FZt1cA4VeABbmtnJRYeRWoBSVUpRwH2HX4yulzCVXo7447lQS1Q>
    <xme:va-FZkE0jzEs74iuMg4NLdP-gTc8MfDVWtwemnldnABFzGrQQCNekagKpzDGQ_Fj2
    kThu8JtRcaKa7D2jVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:va-FZt79N0Tdhm2JdZCvX2nIH-8GZ2pyxtjhNiiGQmJ_6uOpX0_8cw>
    <xmx:va-FZq33dyvWgBdB4PvuJEKYwaauYzDpjuXjhMAJVfUX0e8_SFcRoA>
    <xmx:va-FZgGnWeCF9NbeZ1hihlYzWC2miAY8eKXhk9tYmpLyYDEE1_edHA>
    <xmx:va-FZr-dCWb33QceubiT3kK9wxTBGPhfZPYPyj7KnJffrr2y1Oj4gw>
    <xmx:va-FZtlVg5ZyOpD2_-KIN4HITICdhMkLT6aeP_P9tJm-J2vXQ5sxQRf9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 95FCF36A0075; Wed,  3 Jul 2024 16:08:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <fdedcd38-4688-4938-9184-2eaa5dedeb43@app.fastmail.com>
In-Reply-To: <ZoVoUabfZiiAXWKR@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-2-e332687f1692@flygoat.com>
 <ZoVoUabfZiiAXWKR@alpha.franken.de>
Date: Thu, 04 Jul 2024 04:08:09 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=883=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=8811:03=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> there is no user of mips_smp_ipi_disable() (at least I didn't see one),
> so do we need this patch at all ? Just looking like ARM or RiscV isn't
> a justification for code churn.

Hi Thomas,

The per-cpu enablement process is necessary for IPI_MUX and
my upcoming IPI driver.

The disablement, I'm not really sure, maybe it's a good idea to call it =
at
platform's __cpu_disable to prevent spurious IPI after IRQ migration.

Thanks
- Jiaxun

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

