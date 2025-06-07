Return-Path: <linux-mips+bounces-9164-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EDAAD0CDE
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 12:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 239F57A5112
	for <lists+linux-mips@lfdr.de>; Sat,  7 Jun 2025 10:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AA920D50C;
	Sat,  7 Jun 2025 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ssuhWOIZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ea63CQyY"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6F13B2A0;
	Sat,  7 Jun 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749292637; cv=none; b=ByGf/TbKvfCuooR2uF6kKtB3u5jw5rLLcV0RequondlQp+0zWzu8b0r+HtXc1TLNylvDLVKGKl09AtGxqF1OQzKy5cCmEliqoSjIKHk2OwzUE9jnD/ra8b2JMHFe4cofn4SP7zzzri5XWhYDG6yHiVL7hOGPfYtV3ww0XZlNT6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749292637; c=relaxed/simple;
	bh=gY5IB5+OXmtOZhxYSyPMZEpmkUHeAnHZwVikIIs8rpA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lPX2JZpYEb0xDEDqoYunijk2nLz5QDomUg68Px8i+iU/t1L1OGbY7OBTCI5NScSicZAln7rz/uNds1noMEmWQv8wOx+AQkOL4SBcVDp19P7KDPqFy9KiUM30vLKU6sNCjRnbUHovyvFQOJK7lFyHMBynERWuJnGhsn6eg1+Ieqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ssuhWOIZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ea63CQyY; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D3A8511400DE;
	Sat,  7 Jun 2025 06:37:13 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Sat, 07 Jun 2025 06:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749292633;
	 x=1749379033; bh=cvgmmEJtABl4x5NTALpRDuyvTzE9kDx+5yiLNZhZiaQ=; b=
	ssuhWOIZOo5qakjbKHT1vaBwKkd7qkWhuUY6YXO1o+oyA+Q5lsCcz4J8ASrBIG2g
	IyJ1B5V89Sj9nEOQiHHG/EWabMv4CEfp1tzMQVttNRe22//299phYBdP+5881v8P
	mzvyLbR5vd5RUAXxZ7POo6Wn638PFMJZ/1L/etXnhAQ8JzEdXqrfubXcctJXcNEJ
	RJxs2f4aPxdkMnuKNsSA2xCMCRXaLMJZdb7gJRLLMGwsk3No3MkEHnbK6+KO9fUv
	CIqZgcd81PQuXzFxLRw66OdruH0vSbqKz5wIq7WSxSx3tb2Z1LsxXG275j2YifuI
	hpt/iE+fwChBq3gfTj5a1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749292633; x=
	1749379033; bh=cvgmmEJtABl4x5NTALpRDuyvTzE9kDx+5yiLNZhZiaQ=; b=e
	a63CQyYxcxcFXHM5HGmEDe0SQ24+DQSnkNGkv7lPi3K3zdOpsZ2B7u7H7y+EPVQo
	j5oHXXZeIA1vQs7MDQ9jeqtCKIkxRayQijsIZNJHKZJSoQs0XbuYin2JkRklZdA2
	DdG4fcWv8nIPKpkn1Bkc9rIhJWIVJnz5v2ccF0IKhePK6cyMWeMgBTXJsQjD28Gi
	vEY43knl07VKPok3K9S0/OnPCuyBh2w5JMQcN9PNOMqu+BgldrPxFgHTa8UD5AeE
	R/k1/O8EnmNlKoohDIahMrmlzXURW2XJ7N+flBU822fK1/03SZOqSLSf4E82+S6P
	6tI/g3J1cBxETgmq8qwow==
X-ME-Sender: <xms:WRZEaNz-cPlBbFfeLuVDW_Hcz5lWWSEy_rt8Bu-5gvMISB0VWKHrDA>
    <xme:WRZEaNRH3Ly8b1wqmsxdBo2gpLbReF3Acmee95C5lnAqFRXbYXz6k-HltDWh4mGNG
    k6LDCZGlINxzSg9YIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeigeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehmrggtrhhosehorhgtrghmrdhmvgdruhhkpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhi
    phhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WRZEaHVlI1lhmvhphAh2EJKoI8_hRP7g-S7qDSL93NlPnUQZm2914w>
    <xmx:WRZEaPi8-AM8OqWb3trPoji071n7wQjMGaSXHyAzMTzJHyWzyrarQA>
    <xmx:WRZEaPAJk6u-VctWH8CPpz3PgdG3fOs--O4mh0UmuNX5mt1cQyxpLA>
    <xmx:WRZEaIJ3r_JA9g9xOdb49zGcMj_m2gTNLEFZt3caJjRs6Qoz-wuzAA>
    <xmx:WRZEaMM8xw9lINe3PUXZTeYvfmLoyT4l9Kz0rmiWfY7DlehyEScR5k8y>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 27A182CE0065; Sat,  7 Jun 2025 06:37:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfa3886415041e94f
Date: Sat, 07 Jun 2025 11:36:52 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <40ff6065-2f2b-4a07-b247-02e11fd46eb8@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2506070300430.1790@angie.orcam.me.uk>
References: <20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.com>
 <alpine.DEB.2.21.2506070300430.1790@angie.orcam.me.uk>
Subject: Re: [PATCH] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B46=E6=9C=887=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=
=8D=883:48=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 5 Jun 2025, Jiaxun Yang wrote:
>
>> +static unsigned long r4k_safe_entryhi(void)
>> +{
>> +	int entry =3D current_cpu_data.tlbsize;
>> +	int old_index;
>> +
>> +	old_index =3D read_c0_index();
>> +	while (entry >=3D 0) {
> [...]
>> +		entry++;
>> +	}
>
>  Hmm, how is it supposed to work: you start from say 48 and then itera=
te=20
> until 0x80000000 before giving up?  Also a signed overflow condition i=
s UB=20
> pre-C23, so the compiler may well optimise the loop control away.

Ah sorry I didn't realise it's a UB. However, this loop is likely to be
terminated very early as it should be fairly easily to find a free Entry=
Hi
value with TLBP.

>
>  How did you verify this code?

Boot tested on Boston as well as M5150 simulation. I tried to manually s=
etup a
TLB entry collision situation with Boot-MIPS.

>
>   Maciej

Thanks

--=20
- Jiaxun

