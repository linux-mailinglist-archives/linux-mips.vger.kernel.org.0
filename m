Return-Path: <linux-mips+bounces-3499-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E487B8FCFA1
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 15:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4526B28553B
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566991993AA;
	Wed,  5 Jun 2024 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="b+tDXKHS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XhxRBfMk"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101E19924D;
	Wed,  5 Jun 2024 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717593480; cv=none; b=iQuaTiuivbi2pvte2LeKGB+Bcl/LpMK9CwwlRoO2PMME2eOBGtJ1nCjby2MfGU/X2KpZogK0gRMa4i9PdlsIoP2HAYEW2Kzzy+FwSFPeQxIq7P5+3NJrBKAnoIPuajXKcUBBcUSrlmw7FVxRWoqzLWgMcLnlIrF6yK1cQ9Isf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717593480; c=relaxed/simple;
	bh=78/x5XUPo5xusPgNw/FNUoT8dnpyBDLoUYTIoTMbIkI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=r3VwWDCF5y/GJmcclUZclWQRIn9R/KZq63CKxPBSGP887luioE2SRdEHI8Ej/N8ABigeNyOVh7kSDDHlrfK/tQ05F7xXVCgBpM2PpNp6Lf/jF4Wbfd7ddegs+CvpWFDl8c7eVTa/VjohKSjQ/YChXHF0Nbt8ivu520TGDwu9OjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=b+tDXKHS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XhxRBfMk; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 9AB20138008D;
	Wed,  5 Jun 2024 09:17:57 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 05 Jun 2024 09:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1717593477;
	 x=1717679877; bh=N2eL8RwybwiJUKVprjaoTWy+fNNjx5dXfQ7CD829ifE=; b=
	b+tDXKHSZUiRtQKPGC5EZY89buxGvF7wJQIfNACRZgkiqnL5kS/TiYkw9na32eWc
	UnMp7+r6j7nyE773712+a570z3NAUG0ygd38JI1fydRKHn2EWA4ds1aWQ+KzyT5A
	xsIdYrOvoyjjTYvMWQq/oztPCun0CZV0YpfeIU+rN4xiMlSfRk4EjyNygK9oRm4i
	HZkQG0TNeXHI/Gu0hG1IZRe9irjAIzZ4BcQwXvR7SU9FxfkqCTDvN1GoH3bqxOD8
	KirLCtXgZb6vORHR7qZbTJm5wtkJklT2b6StSPo4iapD7RLjN8u9ADnFJNA0Smk3
	GGnRq2eymrEFophjm84dTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717593477; x=
	1717679877; bh=N2eL8RwybwiJUKVprjaoTWy+fNNjx5dXfQ7CD829ifE=; b=X
	hxRBfMkDblW4U9mMyDka2s4QLmNQMLA+rGZP97Q5uoEF6vuShzzIxHGyosgvmca8
	WCuc+6+zj0vQIgoxCq6bgZy3pZkemtvzfSpo/zxoZlQtIoZuEezgSTLyRhe6siE4
	SQOxlMpMUHBFTNSU07WwRQvJn9rkyAh106QS+gSfqLRb/DpVmGh/tYpu0uk8x3/Z
	6GtekL9c+iy4293mzELBWmnt7W8CnTi0q+x+eZkdZWqai3LyZyQbpYO08B/cPGRO
	G9fdoL9Z/FMB39uM7Cy71wZHookk8rQdpeOi4PqlfQIGn/qnL57dI+BYcqFBqy4h
	JkJmg+2gQ3sFTgmdgrQdw==
X-ME-Sender: <xms:hWVgZmEypVF6k5cR8kWOtCsFwHhwP6RO7gpEZGcYOeusDnxwCH6KlA>
    <xme:hWVgZnW1-wUrGbleNw1caKLCqkRvLSF_h0djxwCL6GRGldZFfitLVNRBLoAQjn1mD
    qQbZk5qNLKXV_XCtDI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeliedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:hWVgZgK5b2ZajJ0AU_NIHnmXE5-iHYiKbihSIHArIRcCR4vPjaZ_oQ>
    <xmx:hWVgZgH-hIy5j8d0ADNgQ1Iov5Vc7Y4tcaE4o2qrfO8JmsegiNYytA>
    <xmx:hWVgZsXQBJTwjVJKMwXGEfdGmF5ofNYtseWUtW9NtZqAaXbAFGE_Qg>
    <xmx:hWVgZjN-ICa2Z_GMP_ffklLYyz6SPb0iEm-6dQPh1IdmBaaDUFNRHA>
    <xmx:hWVgZmffpLUpXM1Q80stXS9u3zFhQR1pTkwhiAWWUfVioDvqpAhrHOFG>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E7DE336A0074; Wed,  5 Jun 2024 09:17:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <310c2bce-e6cb-4268-858b-8466c92266dd@app.fastmail.com>
In-Reply-To: <878qztbvb4.ffs@tglx>
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
 <87sey3b6de.ffs@tglx> <9947f7a5-1a95-48f2-b0eb-0385eb2b3d55@app.fastmail.com>
 <558b1d58-08a5-410d-97b8-e77def7c1cf8@app.fastmail.com> <878qztbvb4.ffs@tglx>
Date: Wed, 05 Jun 2024 14:17:38 +0100
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



=E5=9C=A82024=E5=B9=B45=E6=9C=8828=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=888:17=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, May 28 2024 at 15:31, Jiaxun Yang wrote:
>> =E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=
=E5=8D=885:32=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>>> =E5=9C=A82024=E5=B9=B45=E6=9C=8827=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=
=8B=E5=8D=884:51=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
>>>> Jiaxun!
>>>>
>>> Hi Thomas,
>>> [...]
>>>>
>>>> What's this indirection for? Why dont you update=20
>>> [...]
>>>>
>>>>> +static struct clocksource nodecnt_clocksource =3D {
>>>>> +	.name	=3D "nodecnt",
>>>>> +	.read	=3D nodecnt_clocksource_read,
>>>>
>>>> the read function pointer here and spare the indirection?
>>> Smart! sched_clock takes slightly different function pointer argumen=
t type
>>> but as we don't use the argument anyway, it should be safe to relax =
this
>>> indirection.
>>
>> Sadly, I'm unable to remove it with force type catsing :-/
>>
>> drivers/clocksource/loongson-nodecnt.c: In function =E2=80=98nodecnt_=
clocksource_init=E2=80=99:
>> drivers/clocksource/loongson-nodecnt.c:89:36: warning: cast between i=
ncompatible function types from =E2=80=98u64 (*)(void)=E2=80=99 {aka =E2=
=80=98long long unsigned int (*)(void)=E2=80=99} to =E2=80=98u64 (*)(str=
uct clocksource *)=E2=80=99 {aka =E2=80=98long long unsigned int (*)(str=
uct clocksource *)=E2=80=99} [-Wcast-function-type]
>>    89 |         nodecnt_clocksource.read =3D (u64 (*)(struct clocksou=
rce *))nodecnt_read_fn;
>>
>
> What about making the actual read functions have the required function
> signature? The clocksource argument is not used in those real function=
s.

Sadly sched_clock requires another signature :-/

I can see timer-clint hit into the same pitfall.

Thanks
>
> Thanks,
>
>         tglx

--=20
- Jiaxun

