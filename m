Return-Path: <linux-mips+bounces-7390-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD2A0A29C
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 11:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE1E57A360B
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 10:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120E1632F3;
	Sat, 11 Jan 2025 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Z+gkIE1H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wsj5qPnT"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE20156F54;
	Sat, 11 Jan 2025 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590218; cv=none; b=oSmENs8emgS8vFbbFxvyGleIOAUL2VDdN/F5bLEOv4+sR9yl2JpBXgAIxzHl+UDKqvLavP+G1HKF8aG9JEvfxZP/PYCx5Z+yStwABQ7nhlAAcqKvtwKFFADRN69AkWJqycj/rHwALy3thsW4FkzsSjkgA5cegvaby7csuEiEY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590218; c=relaxed/simple;
	bh=+pePf+vX2sOiCsqc53oErDobopFjS3fed6qpiuZppOU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jl/THN9wyeDq9Wb66WEHawwjE20bE76849Sb1pDtDcVigIvycetjVC9EGXnFh7YWx2v6M+QKwbp/G6eWjOYUBXOqtxLxreRCxT0mXi52UIbh74GH/uM5yIgep/BYbV9kob8PFe/VIS8bhcWakmbo1ubIratMuS3JNjPiUwxUQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Z+gkIE1H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wsj5qPnT; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 1A0091380143;
	Sat, 11 Jan 2025 05:10:15 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sat, 11 Jan 2025 05:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736590215;
	 x=1736676615; bh=7HBp2SadmpOAT3FBbLsoTTEospLUqzeWu04/XaaaIhA=; b=
	Z+gkIE1HT6cmRLSeLASmMkUkePV2U9LJ3xF9wN6Vg2v1S0RlLwGT+I9LCZJW7cHv
	wJ+W5nn8buTd4B/2GjditvSSR/VBc1O7lnTabZmS8A50xmZes6m7VWq7LZANC8r1
	1Il031haWA9psYA1E6kqTQs0AmNiVRQUkL2t4dFjK0hOkkikRZo1+zWrzm0ado0y
	436OnPTnzwg4pp1gvQ3tCmbs7bbnwQ6P5fi0zaB9gxFPR76DwPnh27B1EzZhSRnL
	X47V53gm0e7HaBiN7ErM0ROdrr1ZKFZLlyHTordxhAel06HexXj+V594K387SQpZ
	VIPRRFejEz2PS0ColBCQwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736590215; x=
	1736676615; bh=7HBp2SadmpOAT3FBbLsoTTEospLUqzeWu04/XaaaIhA=; b=W
	sj5qPnT2po1/J7IEJdHW7TwvwqFJBVIcdaioUXfmHg3Bn1QT+S69Pj8XUsNCVFiD
	B3frfZnuABQsaN5RE0ODK2c6LGfi0AiAAYc0m/8298mQyOKjezggEb5lp8+Z2PZ/
	vJVuEl1l31oVxo7e45Uovfd39LDqsBCpCZ0hYBFIlsjzE5eymL6JRO/i9CeUyEVF
	Ur6/MloxE7HZasqugsb55wPUhmTlI7YnzJiPJx2HI+q7H9m3V9N5YAPYHYOxErET
	NyppVfMgDPlcVx7IZcfRN8vtifvE1lJn+PyWsZXEWAugb+k7OgLpWq5VzwK11bm+
	suV8GRIu1gpdYmRi9k8lQ==
X-ME-Sender: <xms:hkOCZ1ABH1d1rzemBgubB0NzQgD9CBVavoUau2KtdUrTwsfKnTBf-Q>
    <xme:hkOCZziLF9EmABuaaMlReI0txHnmkYCNinbZKxRHCJF7LTJqYkyGW8cbPGvYgG5My
    Z5HHhUVC8TgZN6DQpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehtddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehitggvnhhofiihsegrohhstgdrihhopdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgihrhiduudduseigrhihudduuddrshhi
    thgv
X-ME-Proxy: <xmx:hkOCZwnvGg1_1qMNVbhFSF1ZETFYY00PQYlwxiqHwMPJD5GjHB4bJg>
    <xmx:hkOCZ_xIaTZSLbWSXtlVZPmEgW7HnYfof0XsieLCUYPAE_XYUwfOrg>
    <xmx:hkOCZ6Q_-s6ZZxf9mPvztr5o03kZn7aNrvWBY-9i6jH8Hh9_G2rq0g>
    <xmx:hkOCZyYN0VnF2yIMaGqN_zzx6MyhFxgh1wUTwdfbfxK54OvoaC3jVg>
    <xmx:h0OCZ5Faj6AtsYFINV63ALUBj9k7MksLrc92j60s7CoUyi_90qBwC1i8>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5FB651C20066; Sat, 11 Jan 2025 05:10:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 10:09:55 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Xi Ruoyao" <xry111@xry111.site>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Icenowy Zheng" <icenowy@aosc.io>
Message-Id: <ea1fc568-91b7-4781-b870-ae90675214e3@app.fastmail.com>
In-Reply-To: <20241223092041.257941-1-xry111@xry111.site>
References: <20241223092041.257941-1-xry111@xry111.site>
Subject: Re: [PATCH] Revert "MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP &&
 64BIT"
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B412=E6=9C=8823=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8A=E5=8D=889:20=EF=BC=8CXi Ruoyao=E5=86=99=E9=81=93=EF=BC=9A
> This reverts commit 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6.
>
> The commit has caused two issues on Loongson 3A4000:
>
> 1. The timestamp in dmesg become erratic, like:
>
>     [3.736957] amdgpu 0000:04:00.0: ... ...
>     [3.748895] [drm] Initialized amdgpu ... ...
>     [18446744073.381141] amdgpu 0000:04:00:0: ... ...
>     [1.613326] igb 0000:03:00.0 enp3s0: ... ...
>
> 2. More seriously, some workloads (for example, the test
>    stdlib/test-cxa_atexit2 in the Glibc test suite) triggers an RCU
>    stall and hang the system with a high probably (4 hangs out of 5
>    tests).
>
> Revert this commit to use jiffie on Loongson MIPS systems and fix these
> issues for now.  The root cause may need more investigation.
>
> Cc: stable@vger.kernel.org # 6.11+
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

It's indeed problematic in some scenarios.

Let's revert for now.

Thanks
- Jiaxun

> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 467b10f4361a..5078ebf071ec 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1084,7 +1084,6 @@ config CSRC_IOASIC
>=20
>  config CSRC_R4K
>  	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
> -	select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>  	bool
>=20
>  config CSRC_SB1250
> --=20
> 2.47.1

--=20
- Jiaxun

