Return-Path: <linux-mips+bounces-4100-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12750925377
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 08:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C9CF1C22F51
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 06:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3814776A;
	Wed,  3 Jul 2024 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="JTxY9BI/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fvlhJpA5"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4F4CDF9;
	Wed,  3 Jul 2024 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986418; cv=none; b=n99MiOUKgT9xfb19mngUbXfJ4a7moEP9evpQZ3QamsMPUGg7HUM+eB4qvng2MFiysVSs2WwVNfLFrtFfPpMaLwqDE9aaQnT+JCCPHwFSk3rprNYCLMpymKYEmeYNn2jwYpdONgxaVio/SPj+iH2TI1uI6JFW3iN3m1gTkBSvgBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986418; c=relaxed/simple;
	bh=bynH4JIpf+ThJfRKAuqxL4Bv8lhpK/5XW9uHXuTU5h8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=nR1Af97k7IYwXz2c203C+pUgkw1j8KMEuH1j2o6EHmDl0w7XQbfDqU5/XNuYes5bDsPPwlCfkhrKt5lHpeq2qHzD2jBO91ypxua2MvBXEofcp87mYCTadiSLDACcTTFKXFaJte36bY+Neu6VigXhEw2knLqKizLECY6Qins675o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=JTxY9BI/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fvlhJpA5; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id BE35C2005FC;
	Wed,  3 Jul 2024 02:00:14 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 02:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719986414;
	 x=1719993614; bh=nU/IhCnZH8WPW+7h0yQqRVcSFulSCDDqC8Tuu7K8p4A=; b=
	JTxY9BI/qqJHnmLIHh/eLszIkGKAEW4hfYIlt30wSVobtcVAO+JadGHF1DNSH/1S
	pAwA9DjWYxaxHR2FqPc+stzh1gOrmRcxKoPjYq5e3o856S0CZUlrPAGyQl0SqvH4
	xeA9yLuk8shRQu5979ZKs7EYS1AmN4SETdmiNPnqWfjxW7UhW6hqfETCu5XCoplW
	I49ABE6EjJNVlxxyn14aajFmaj3FhS0P004YT7CXOlqquKnJrBfPxJ783wUAXAb0
	dHOJwb0d6PuucQkmZtzwrGUTtPeetyUPM0WSNBK6Drd+ZN4VGGnkgJ5owEa8FfC+
	ov8/2H3gWeFYC+We7TM+1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
	1719986414; x=1719993614; bh=nU/IhCnZH8WPW+7h0yQqRVcSFulSCDDqC8T
	uu7K8p4A=; b=fvlhJpA5jqRNuQt8xxuygZLTzqFl15ZX/dEiFfBlQzF49g1XwI1
	bM4VsiibjSb/dPGb0kKgIGIjPUuE+Yo0MQwEe5j1HeXfPAKZPH/nlwepuxBAnncR
	4bGaVbTb8idZEoI/9WdY0N3gxZ+yP0GX9sLLujS3z4sWYUQq0fmX5Gpfb89mb/Tw
	h72+bUySW3yFU21XGFE5C/c7hTMVAKsiDDjCdZGBLHBKavaK9GwxhkSUQCzxSuL/
	oJIqzrXUhyYKUXae5YkTtXqCXmVY+VswpOYeo6H7Y9za2UphcG+nJT3qisHZ25Ve
	mHGEtqrnLSEosP8GmzaZ5BXkirSX9KnJRXQ==
X-ME-Sender: <xms:7uiEZhWZREUI5bMwasZrX8AlaOjx2-ttBa7YMQ1lx0K4F5-pDvVNPg>
    <xme:7uiEZhkoEL3jY1FvzH2e3ooQnHqcw_H92a8etL_m7PJIhYx-ogBft-XgxKnQyTV5A
    0LZwfY8l9PjxfrTKyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeigddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:7uiEZtbgU6DWVCQwTmcI_Q1LjUvvBQ2JtdSnjTFz7cBn5ahvRsGnNQ>
    <xmx:7uiEZkVr4r3I1l8Aw2ll_3ICWcqOp6Og1cAkJRaVmEg8kLmM-NUiEw>
    <xmx:7uiEZrlupzuiESAPWgZ8Y60gzvLIrWcoJjEz76cxaWEoWDwsVE5V7Q>
    <xmx:7uiEZhf3NtXydzBplhQ1NvjkD8Reon7WaR3ruAKj7NbhkD2s-O3gRw>
    <xmx:7uiEZlFwN1hhXLbvZNhtjVCiZOATASMAqYIA42ao7mPGWmza6b3Rhs_Z>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85C8536A0074; Wed,  3 Jul 2024 02:00:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0b838b9e-b3c7-4da0-b7f8-af38fb0f6927@app.fastmail.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
Date: Wed, 03 Jul 2024 13:59:54 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 0/7] MIPS: clocksource cumulative enhancements
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=884:54=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This series combined many enhancements for MIPS clocksource subsystems,
> It improved r4k count synchronisation process, clock source rating for
> selection, sched_clock eligibility and so on.
>
> It seems fixed random RCU stall issue on Loongson 3A4000 multi-node
> system and some boot failures on QEMU.

Ping :-)

>
> Please review.
>
> Thanks=20
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix number of zeros in rating computation (Maciej)
> - Only select HAVE_UNSTABLE_SCHED_CLOCK for SMP (Maciej)
> - Link to v1:=20
> https://lore.kernel.org/r/20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat=
.com
>
> ---
> Jiaxun Yang (7):
>       MIPS: csrc-r4k: Refine rating computation
>       MIPS: csrc-r4k: Apply verification clocksource flags
>       MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>       MIPS: csrc-r4k: Don't register as sched_clock if unfit
>       MIPS: sync-r4k: Rework based on x86 tsc_sync
>       clocksource: mips-gic-timer: Refine rating computation
>       clocksource: mips-gic-timer: Correct sched_clock width
>
>  arch/mips/Kconfig                    |   1 +
>  arch/mips/include/asm/r4k-timer.h    |   5 -
>  arch/mips/kernel/csrc-r4k.c          |  24 ++-
>  arch/mips/kernel/smp.c               |   2 -
>  arch/mips/kernel/sync-r4k.c          | 281 +++++++++++++++++++++++++-=
---------
>  drivers/clocksource/mips-gic-timer.c |  20 ++-
>  6 files changed, 234 insertions(+), 99 deletions(-)
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-mips-clks-9001264fcfbe
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

