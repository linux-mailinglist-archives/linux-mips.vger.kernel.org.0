Return-Path: <linux-mips+bounces-3334-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C38D08AF
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 18:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBAF1F21DD8
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 16:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D56261FE5;
	Mon, 27 May 2024 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DOlHSyAF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EzRLbrem"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962C17D2;
	Mon, 27 May 2024 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716827556; cv=none; b=arAHM2Wy5ssy71U9PCnA0RfrS7bflpm32lFxbZH7Fr1tczPUgNVXxslDJrIuUAxgWs+/4/rGtvcpMtB73/WZTR/84kvKIKUBibmsH4cPeSTEeY+iNWww9UN5r53d8jN/c1LxklrruJYUiyW2NTHJvPYSr0d9ss1TMExsr+F1nLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716827556; c=relaxed/simple;
	bh=vvZ/FbEHkHjmV4YVtrOr07e4SJaIpDJtFPbO2aNqId0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=X7bYtZcTvaQfizoBpHrrtse7C4gumJ9gS+l6D9+pcB4zlwj4YKEFTlmccGHqzXpYRCcpzD70virV91FzDbTejKhbaZkOgHIBP8uiBzt/o0tZnnUFpKs/5HO0R/CvmtNq52V66zfvyws/UZXl5xzlR739Y90l0+Bpg811Z8DLRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DOlHSyAF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EzRLbrem; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 800FD18000A9;
	Mon, 27 May 2024 12:32:33 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 27 May 2024 12:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716827553;
	 x=1716913953; bh=x9BxI7LFCFkFrM7Q7G2UlUaRQ+JZjCElOdG4eDd2QZk=; b=
	DOlHSyAFRBV2Mx/yoQUqxNcEmIiKW/GwGshwVqBYrQSBRxAVWowiOVzcEhjhA+fB
	XtqIigGL/JpZoDv502EyXr5HBsLEh8ovEexssgrcl3JAk5NnazoRuHcFat0gdIFt
	WTOhrFyDIoWZYn1WFst/+gPf8sJrwcgIt0eCEcUgs4wHPciLSsKTigQzWoDqvrn1
	HGO3CGFhT7FVXDi808om8xYMMKp27cKK2awOfboGxzDlxJ94ytEhOoys1QWa9xfi
	Eul8N5jZq4N42rROWGQ6gy/9/9WZwWu5Djbl0jkRy1GjY4O72JxDuyPkEetUvwTd
	wO0UxAgy5wLHF6yC2boSSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716827553; x=
	1716913953; bh=x9BxI7LFCFkFrM7Q7G2UlUaRQ+JZjCElOdG4eDd2QZk=; b=E
	zRLbrem9B11b3QyZ5S6rJQaBGIeTJA5k3Df96Me+aQ6QYrVIab0ypx1XJZRUPHyX
	LqZAKRCUc9KD4IIi4c5sT3M4s0KS9EOHAQWBQJIUbyMfO6k7aPikgMoSxvXeoWv4
	I6K4kFxm3zzCM/Cuk5qQSsoPkQUX/MAcUGgLvmFrijf5+nhu3cpfyXPQpyKJLOg+
	xDB1vXr/xk57NfazKFmcSbJ4Ok3vhd+SBA1XGOaRPoODSwLvyC5epMo8O8E1II6w
	mmx6ufFb2sFfUbtBHgs3YEox7jGaoeYu9w4IvKjLGYIRslOLIS1o3wFIRyzW/JoK
	A6fybOG+tLeGaPhQfHJvA==
X-ME-Sender: <xms:oLVUZhPCTZy0dV6wRPWdZEKtMWRq1_ctX1olunHacysejeYJqs8K8g>
    <xme:oLVUZj_Q8hQ47ybqxnJHCblDxf91ybhPR6vHuW7nvbQ2VHT7bkCRW7aEw3sJRPAeP
    j-36S_8A7dU90xJDX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:oLVUZgSd76ViWuBKm_4CkA_HTmf0j12gauMghmwtYyHmKcLXHnegDQ>
    <xmx:oLVUZtveqmox785dgDlQI-Z0uT-puGopVSwe_BNFlKDBuv9Rva6sOQ>
    <xmx:oLVUZpdpIYfhoDcepnSrSRj6ZMXIA_APGcz4teLqoqn-mvBb_fATgg>
    <xmx:oLVUZp07MlhMW91f5DVk0czmvJ3kHRsQIiR71beLbG-dC8Q3zo4_kw>
    <xmx:obVUZiEJRuFrOK4hgbiPkzTBa6CAzEtwSY0i-Cb-K2WAfsJrRQtBo1T5>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A288536A0074; Mon, 27 May 2024 12:32:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9947f7a5-1a95-48f2-b0eb-0385eb2b3d55@app.fastmail.com>
In-Reply-To: <87sey3b6de.ffs@tglx>
References: <20240517-loongson_nodecnt-v2-1-5bd0bb20ff5f@flygoat.com>
 <87sey3b6de.ffs@tglx>
Date: Mon, 27 May 2024 17:32:13 +0100
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
=8D=884:51=EF=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
> Jiaxun!
>
Hi Thomas,
[...]
>
> What's this indirection for? Why dont you update=20
[...]
>
>> +static struct clocksource nodecnt_clocksource =3D {
>> +	.name	=3D "nodecnt",
>> +	.read	=3D nodecnt_clocksource_read,
>
> the read function pointer here and spare the indirection?
Smart! sched_clock takes slightly different function pointer argument ty=
pe
but as we don't use the argument anyway, it should be safe to relax this
indirection.

Will fix in v3.

Thanks
>
> Thanks
>
>         tglx

--=20
- Jiaxun

