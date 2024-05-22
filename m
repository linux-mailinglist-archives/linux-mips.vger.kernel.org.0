Return-Path: <linux-mips+bounces-3313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A78CBCFF
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 10:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC37282EA5
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C817FBAE;
	Wed, 22 May 2024 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aA1zAWr4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OBVPMh5I"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE77FBA2;
	Wed, 22 May 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716366523; cv=none; b=gNtn+l3KmyWdy3YGiHDA1sPeuYQND6LttzEEuJl9NvTDZ+dJuF6ELoRIdE59JgE7MMjhIe20/8EA+3uhrksIeycD0FRyfkiNTGEV0p8GoKKG/swQvyiC8n7J1ngbXXQ8eFR4Y279fUzX0oO59zzc8pTRjqDv+iZwQoOGjCTNPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716366523; c=relaxed/simple;
	bh=BCSWIERW/CzbZMGD5Q5Ts/scWWhcLl5JApEzwfk/x0k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=p00l+GAR/VM0F4fp1j7OOK71fVaiMXVvSP4GuBWhjXoj28JKoDHBnN4pSP8x4duU4xkZru7AjoypY+ZXcDXMxzoIegMLos1zD5dHeXYplLBkEXoMCMOwZKiIyPwJDxmHwlWmslYdj+YsWzNgUSlE8o5HAI3AycqDmBJQFqwkMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aA1zAWr4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OBVPMh5I; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id DC7801140190;
	Wed, 22 May 2024 04:28:40 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 22 May 2024 04:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716366520;
	 x=1716452920; bh=zPBylMyx9adf3Iiq2rlEqVXCiuXLUMTM7dbVivl5iQI=; b=
	aA1zAWr48Pj8wCThXE6dLBR4MeeLjb7l5Fvo2zI0n5MFTDC38uAXIwampX/2rnxD
	6ZpMhW2xaYXTeLNwXnskqQ2TUaI7aYuDhiS4mz8XhAOS2RRip3GphW/E6cieAeqN
	aVEjJeEjOD71jyhflolh+fjkjjatcO1OIwlEhMu/1w7OYhbFgI/vpdu22scMkT1B
	LnV8RlNTzhcoHg04WcLu+L6rYd/sPHkDFzqYYi1BaBYOVTaT2TWbg4TwCeIvfK2K
	chya0WIL41b+yyOlazeRpQ08YjOYv3Eeqt8DgpZI1vCnhXeCudv8kJ71SnXXHZVR
	qJVLmSePohID+hK17PSTGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716366520; x=
	1716452920; bh=zPBylMyx9adf3Iiq2rlEqVXCiuXLUMTM7dbVivl5iQI=; b=O
	BVPMh5I5KiZWRcP2lBkze+JNfXo55BRGU/tnJaqa4tHa2qhCMK746752jkL9vlqu
	pTGBVL1d/g0g+lT5RtyW0aFsEz7QcZRiKxcqent/uOZNOPb4EDks9ZL+oa56vxqg
	Gj4F9ORXBqTZsVvTo9O6YiYEgirGvLUkLMJTT2kTOsOR403SZygTCuGHZ5SdvfPB
	ydShheNspp1E/QpJTUShJsUbWjj/Ontfyhy/3p46UJkL/V/25Gw6e6+3bcCZc9HT
	Gv6zZJ28TlNIVuJ6fcZvuo295LR6yu7NAYo4tDvLkeHjqSqcOl+Y+FVPkWAt9cWx
	ruLCl+SX5PghIiilvYaiQ==
X-ME-Sender: <xms:uKxNZl2TF2PX2hYxG09x1IsEp4U6OmxV79yyS4YL0N9I0bVvEqte0g>
    <xme:uKxNZsFoISeUiJg6fRGN-UPweem_43qiQLZMBxsuuCqW25hKADeVFT1HkHbcLlpup
    dajbbtVQBZzTjC_3-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeifedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:uKxNZl5Yo5RnRM8qKnGjSaUbUlKblGYrE2N4lOfJGfD4E-LeU9mI0w>
    <xmx:uKxNZi2AfEojAhUoVq3o9Tolec835sOfkb0qyDhr5bAHObmUOlcc8A>
    <xmx:uKxNZoHF6v3SLWHXJwBoJI9bqm0ymiJAapWBpnDVa0VxUzfHb1Ri-g>
    <xmx:uKxNZj-aOnyEf6eOBFwwmAQpgM2K6IgZtWZB4qsWnp5v4i4dMTQ2dw>
    <xmx:uKxNZsBoHrvPGGKdYY7MpoTU8zQ5tjYPtheJsce7p87ttUNZEFgvMmRM>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8630136A006A; Wed, 22 May 2024 04:28:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <13aa508f-6830-4d52-87fd-5063f737c990@app.fastmail.com>
In-Reply-To: <Zk2mt/FsgltvhVzf@alpha.franken.de>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
 <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
 <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>
 <Zk2mt/FsgltvhVzf@alpha.franken.de>
Date: Wed, 22 May 2024 09:28:22 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8822=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=E5=
=8D=889:03=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> hmmm, I thought I was clear enough on version 1 of this series.
>
> I don't want an additional printk like debug interface, There is
> prom_putchar() and early printk console, which always got me past
> any boot issue.

So it's not an additional printk like debug interface, it actually
merged 3 existing debug interfaces, the first being zboot's assembly
print routines, the second being CPS's assembly print routines, the
third being some platform specific early printk. I think they are
all essential for debugging early faults, for zboot that's the only
way to print something at decompressing stage, for CPS as other cores
are booting in non-coherent state we can't safely use any kernel
functions, for early_printk that can help us *reduce* the amount
of early printk code by just adding UART base to config.

The only thing being added is the ability to debug very early exception,
even that is partially ported from existing CPS assembly debugging routi=
nes.

Please let me know your thoughts.

Thanks
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

