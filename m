Return-Path: <linux-mips+bounces-3356-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9E8D1EE4
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 16:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4063D281E27
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 14:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E82F16D313;
	Tue, 28 May 2024 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mUGXXBLk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bpRwgVbJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51CC1DFDE;
	Tue, 28 May 2024 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906735; cv=none; b=o+2TW5lqxvZiI4KRi0i2V7K03ZxaID0Sb7t5l1kuodWFR/eYWmFtcQ+/8FPyoSPMCH56qwHMwlSmqGdTZpd0q/9FURv764OkPI4OnpCtb6bhSP2UmOtTrsr90RnBWhDbxC/xxDaIj2+6ojt+//a23/kyHYYMmPSclnVkaYpYOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906735; c=relaxed/simple;
	bh=E0twsAQJp0cxsMgxYktc9tQCh6ugKHehv97qng9KsZI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=GVa76KvDyHXT7Z60NS7umgmT0py8Qvr40ATsszQULYIKMG2ke83sKTiv1b8pxuwDUIsK/HvsbnrAwkrXd+tN7R0N5e6P7ZB/6ndEBVdg5+KE97V2MQJsu5pW0vnbai6cakcTToaFnMIgMkNSq6UZxIvUjTIrQ1sp6bUdfnqfslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mUGXXBLk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bpRwgVbJ; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id A549D18000E9;
	Tue, 28 May 2024 10:32:12 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 28 May 2024 10:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716906732;
	 x=1716993132; bh=GkVpBdu2u/m4Dx1VMyzxVy0HTZ7tx3XoPoYCq0553jo=; b=
	mUGXXBLkuIo2GMHF/8Wjuji5S0T+SwcCjPC6Y/t8okus5g5P5Ytg9L9ABI+oTP2S
	w15ecJMQ8txN9TQYxYfZ81iDPa/tk8YNsJQ7n9xUOOc6/PNlo79I+/S2vViHOwGF
	ingBjfO7ZOjCVTRA6/MebPtZ1oPxRBPLHp81WKMsC/0jzlOrbX2KKKGJ2XFT+Gxi
	BTeR5Cf/6BmGnUP1pUZ7t7+hiUywVJFUsuDgZVqgQ6oqmIl3vhGyLxrQ5lFEWnRW
	6SqQ3qznT78wKGEvdwNCQU8yXb6YPw6xJUOBFz1gBaRqra/ffRi9/juFSC12Pj8R
	MpLtziQ5u/De7FC0dtwH9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716906732; x=
	1716993132; bh=GkVpBdu2u/m4Dx1VMyzxVy0HTZ7tx3XoPoYCq0553jo=; b=b
	pRwgVbJRWzHY/6JbV1MbwXFdlRTnV/kbCz1Bq5V34L6sRlD7INXw3b2J84rDNa+s
	27V2VDXem5tqa0H4wzGWzQLhFcA9hfKJHjKm9iy8WvweJ2OP9RUMwf7YXgW88sJl
	efWuAZ5TY/wtE7/2EjjvFxe9a+k+C21ImbR/CqJOc+B3eSnhQd5zBBpeP3lz63yx
	7bmelkjPjC47zbJ7/lK7pRsMyxRipD007hFRpO/3rTfwGWUswizWSkjuDPnYNckP
	hcRXY5i4jr4FqSq/REIwiILrGb8ydm5jHa8WIHfRw4Uvl1Fkz9w/duAhLIbWO5nn
	/9ymi1llhl5wFA5s6Gk+Q==
X-ME-Sender: <xms:6-pVZjx9Ej-TnDdWZvrPhfgL_CpQSv9iHDzHhMsFwT4RCdHV5UVBIQ>
    <xme:6-pVZrRWqTodgLtqEjNkyQCD5yHVfNdfaPgv8PM6oB4jsswUKjxp3gpilR0MHVQHi
    thuUK9D0DRG_Obiyww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:6-pVZtX6TxtsDTv_MTgnGnLg4bMsinjkYpY0E2hAmdSf0PxDOmv_Dw>
    <xmx:6-pVZtiWqLN-ZC1dUO4cErPzhyjW8iM4DBwkwta1SD0CrRcz8lf_nA>
    <xmx:6-pVZlAOspG1OQhL87AxSBA5Rfso90uOaZdJQVhZ4MXE3bUHbvE14g>
    <xmx:6-pVZmKUUhTP88RB8P1-RQ06W2rrG158dmzjmf2OL9szF6iW_1xd1Q>
    <xmx:7OpVZo7Qq5YyLR4-OjzWXxg_bpvPJmgJu_M9FMc5qy5GE96zmMHlO6wz>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8E16A36A0074; Tue, 28 May 2024 10:32:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <558b1d58-08a5-410d-97b8-e77def7c1cf8@app.fastmail.com>
In-Reply-To: <9947f7a5-1a95-48f2-b0eb-0385eb2b3d55@app.fastmail.com>
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
 <87sey3b6de.ffs@tglx> <9947f7a5-1a95-48f2-b0eb-0385eb2b3d55@app.fastmail.com>
Date: Tue, 28 May 2024 15:31:52 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Gleixner" <tglx@linutronix.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] clocksource: Add node counter timer driver for MIPS/Loongson64
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=885:32=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=
=E5=8D=884:51=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
>> Jiaxun!
>>
> Hi Thomas,
> [...]
>>
>> What's this indirection for? Why dont you update=20
> [...]
>>
>>> +static struct clocksource nodecnt_clocksource =3D {
>>> +	.name	=3D "nodecnt",
>>> +	.read	=3D nodecnt_clocksource_read,
>>
>> the read function pointer here and spare the indirection?
> Smart! sched_clock takes slightly different function pointer argument =
type
> but as we don't use the argument anyway, it should be safe to relax th=
is
> indirection.

Sadly, I'm unable to remove it with force type catsing :-/

drivers/clocksource/loongson-nodecnt.c: In function =E2=80=98nodecnt_clo=
cksource_init=E2=80=99:
drivers/clocksource/loongson-nodecnt.c:89:36: warning: cast between inco=
mpatible function types from =E2=80=98u64 (*)(void)=E2=80=99 {aka =E2=80=
=98long long unsigned int (*)(void)=E2=80=99} to =E2=80=98u64 (*)(struct=
 clocksource *)=E2=80=99 {aka =E2=80=98long long unsigned int (*)(struct=
 clocksource *)=E2=80=99} [-Wcast-function-type]
   89 |         nodecnt_clocksource.read =3D (u64 (*)(struct clocksource=
 *))nodecnt_read_fn;

I'll leave it here.

Thanks
>
> Will fix in v3.
>
> Thanks
>>
>> Thanks
>>
>>         tglx
>
> --=20
> - Jiaxun

--=20
- Jiaxun

