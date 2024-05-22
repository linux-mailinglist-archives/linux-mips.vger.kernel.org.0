Return-Path: <linux-mips+bounces-3311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB418CBBCF
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 09:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17A11C21056
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 07:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE50762E8;
	Wed, 22 May 2024 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="c1sPnC3D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g501cE5u"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27A2233A;
	Wed, 22 May 2024 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716362214; cv=none; b=XxqogtoCVfeMrrWEiirkq+2gzxbdJ89A/9ObdlP6DXimhnaON2lXdKdcewd6pmbrF/raBb2hjoIT0Q+dXKy6w/ljKYlvUJ/mUK2tGUmEW6/QaWl0IBQzOslJ79MTvYE3eDDGum9zhndE4Z4kG2cJpoXLqTlbGORkDK757FvxBog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716362214; c=relaxed/simple;
	bh=znNvC8vQSnd8OwZ2DgtpeRLsjcKBGhkGR59DMm3Fm3o=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=q0MFzuRBG9oDtqkkcTUkdxZm5EjKyQ6SJCJBInbWIzzerkBgDeBy7sXPTuQQCO61FOlKJHpcKEhqiOtOP7iD/udtYFZhZckBy3s9wHAnZuVng0brzKcHkFJHSzlDrm/IK9StAP7E19GRrR0C2HvFjGalOU/JXy81DHmY2xmDC1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=c1sPnC3D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g501cE5u; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 5ED6811401C7;
	Wed, 22 May 2024 03:16:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 22 May 2024 03:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716362211;
	 x=1716448611; bh=znNvC8vQSnd8OwZ2DgtpeRLsjcKBGhkGR59DMm3Fm3o=; b=
	c1sPnC3DNhLj5hgrH6iW/v50xn/E5aI/dlmQkDx4Mv13d/MFj6D0jGeDzpScQT9W
	VN4LiV8zSsEBA+ME0iUgRI//i4dQdjKgfv8P9HwetwDkYYaJjmWGDnVJ2EK9lik9
	C2ohK2sbPIN6/xzliAnce97+G4G6rgksxixe5tnOpKfR0k+RvLfieZTgI5SatSob
	hwT8pMNIMOyujhGW8wNWPKlyvnGFm9NDpASqTYbxBAkmfZIo5q4g5fcvF3A6BdK9
	sN2o2ubnt+mgR9K76PozSuZhNMBlB7gxqMYf6VANAyaJiz8KDOD86mwbZRRBkeYZ
	DTo1vyCPpYpxMqovPQi8nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716362211; x=
	1716448611; bh=znNvC8vQSnd8OwZ2DgtpeRLsjcKBGhkGR59DMm3Fm3o=; b=g
	501cE5uJc6zogNXzObzIUIFj+LMItSh0K6mkbm5ve+kEms3yWC7zTTjhd9uH9Bcq
	65T199+vc2FAy733u+E/sNz3gzFMTgQLTZye3mh20ZX7yunxvoYYU6fY4UWAD5VE
	XtIPE0p6jB/DxV7o8BSTWqobUStyInib1bNmpwBlc80M4uDoawAS8KHzBy1v9Rtj
	pdF0aPULvGEMei0qE3PQq7iLFdtNxj56x2pmX+sxOfw0g941cXdVAxNmdLx2IYQl
	ENa4m9Zej1Ppimgo6a11aGAx1Ian5OwRW55qMsFmfbZuuYgEhKAgmZweLfpNz3h0
	O3E2BP+Tc0UovgQCJXoEQ==
X-ME-Sender: <xms:4ptNZtLuqr9bkZF3Pjt1iNOVEfd35ueFA9Hfqepzp7ekyGlenPQEFQ>
    <xme:4ptNZpJ35ruISutVxZtENlTwCkp7SDwQJSTU_RNn9tKqgerflkoo_6XKv6ZH_vJv8
    4pjF3GXXl7p5fCLWXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeifedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:4ptNZlttht7BAN07Wsmn-kHo7g6hqD5yJhno9zQbaiyKef6i1YoAPg>
    <xmx:4ptNZua9Q4RwsKMha5ocdgLQLCksoZ8CUXLzfFMKcz1CDCq0dY34nA>
    <xmx:4ptNZkZDwO2-HbxSectdx_bKsRUTBc5vq2UFOkljgEhroeTBM6x6hg>
    <xmx:4ptNZiAlvDBWd7gSf-wPqWNtvuBUKjc_GpETTa89pTki4mufD4IG0Q>
    <xmx:45tNZsEOmEaCgQVEb8IPPm6Jx6QZY3pRB0qEVkooTCw8Xf8R8oKesMla>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D510E36A0074; Wed, 22 May 2024 03:16:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>
In-Reply-To: <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
 <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
Date: Wed, 22 May 2024 08:15:22 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8815=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=8810:28=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> A gentle ping.
>
> Our reviewing capacity is quite low recently, hope everything is fine
> with Thomas.

Another gentle-ish ping after 6.10 merge window.

This series has been floating here for so long, if I missed the merge
window, I think I deserve a notice.

Thanks
>
> Thanks
> [...]
> - Jiaxun

--=20
- Jiaxun

