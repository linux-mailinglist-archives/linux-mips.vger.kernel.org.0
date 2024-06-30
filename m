Return-Path: <linux-mips+bounces-4043-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09F91D30C
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 19:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559282812D5
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 17:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36D0152E04;
	Sun, 30 Jun 2024 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="OvKTfhx/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZpzWAZwg"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD813D242
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719768349; cv=none; b=SyvP0mdQk3fTuckc5XTU4T4JB7pUt9ArtHdBPlx+9G37cw6F4NHvSd9GL6TCemh+HEGgdSqJVpj/i/m08LBt8/eeBjl0tlBrdx9bG0mn+K+LVAVGW66pOZiBh+ZhF8Md9KUyZWlNWidDnxSCcGyrI2BzD+TwZttLbFIxWC6GSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719768349; c=relaxed/simple;
	bh=aknC/bJ2HCNbC91FkDP/9Fd6yYCcQCOG2a8P5wpDT1k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=taonP8D7r276H7XCm/2Rk60brn3WKmHEh8S2JD5o+asOFiYg1xdwF/q6GX6xXx+TqxjUSkpyB7B0JRob7felU3cW2pNcaWyoE5dJjJeM1AnoA9jOkhry3NZmg4By7ResDdI2gsuKHPLGHTtV5lSoIEzj8eJ2O4d0dHbprO8tpcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=OvKTfhx/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZpzWAZwg; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 8C8EE1C00086;
	Sun, 30 Jun 2024 13:25:46 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sun, 30 Jun 2024 13:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719768346;
	 x=1719854746; bh=aknC/bJ2HCNbC91FkDP/9Fd6yYCcQCOG2a8P5wpDT1k=; b=
	OvKTfhx/ULSgMCWJPFCh437SGDqZECROJ+wk4HbETmNK++8H1zf9gHE9OEqpu6pS
	BapqoiGIppHhlzN+Mz6kG632a/V5mnRSdZ5KJbYesgLN8f6lJNpFZRBd1P+RCSJy
	9JNLaTTeZAfgQQ8IDkId6DpNAGvmSQm8R3SZxvyH8SJEc+L6EKoPSGb2VPu9+tQQ
	NwMNqWTXzTil5dIsZVAsf1dRsDTfFbBNHuOgmSkH+MSHilKPbZEz8rinfHfNkfUf
	7gBIqfvHY8y/IK4utqNfTJZxJwSlaEIAxctdWUsPUzLR+vG8g3kgf0vtia+5ltlF
	RLSrD/Esvz081i5oEycMLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719768346; x=
	1719854746; bh=aknC/bJ2HCNbC91FkDP/9Fd6yYCcQCOG2a8P5wpDT1k=; b=Z
	pzWAZwgb160ocDTMd7WBaQnxTYtkNnTmYE6+DAPtYUrY8m8gWDNEItjHoY1VSX6f
	qEuivnMCmS/K9HrktrRdsFKvVyJvcqD5v6FhXp2CtGlBLbgwFLhauo1EOH9dYjSY
	lwUzpryV/Fsmw6hmgXn7wutFUZKYG1EcjNKTquJZTRfZc1mSqBLPy62TFOGhJbWI
	ROYTrIcxgIl+WALp4qXQ+6nPnMvDlzn005ixkKWUIO8ltib0ICm9tPOuUgZhIb1A
	AsGpTwMkbngn2C0jBtX8v0HTgC2R5lKQwKXybYFxH54Kz/TBO6PD7XWjgvi8tY3j
	JZl/Tt+QiX8L4pO1l6ItA==
X-ME-Sender: <xms:GZWBZi7X1ck7_O_07wHh5vvDmWxhE8VoGSZqsdRRiVBTA3S3XYd3vA>
    <xme:GZWBZr4Ovpma1NMC-V97fuAoFWY5XyXlsfcIMs7M_W-OH7SX04M-hChilHFpWoQsm
    J6XB83EKyAjgiyExjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeuudehgeffvddvgeeugfeltdeujefftdekhfeuhfeu
    ffeiuddthfeuheekuefhjeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:GpWBZhdTs4kr-5noM2KdVAjEsOS466I_SEETvSI4Sl0fE8ck3BPzBA>
    <xmx:GpWBZvJ2GI7B1wDLYK5K5S43JUuVEtKk0d5RvdkS5CdyEU1ZoeJ8HA>
    <xmx:GpWBZmLVozqTKbPjtsmdxlShCwpmlRsEJzZxjkLKVm86y9iola8lHg>
    <xmx:GpWBZgyDtly6uhiU-6apgKBkzvjJFFihQBEWQgwHHWQxohHOGZ1D2A>
    <xmx:GpWBZtVsm8Ifl85ravCp8TFpgdnPnKmy1siLXcpAmS_iQ3TqE0GE32Zv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1D3E36A0074; Sun, 30 Jun 2024 13:25:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <03a8b78d-5643-4711-a57f-47f87b8bd566@app.fastmail.com>
In-Reply-To: <92ab0d2b-cda9-4d69-8312-1e1c256cf900@app.fastmail.com>
References: 
 <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
 <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com>
 <92ab0d2b-cda9-4d69-8312-1e1c256cf900@app.fastmail.com>
Date: Sun, 30 Jun 2024 18:25:30 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yu Zhao" <yuzhao@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: Linux-MM <linux-mm@kvack.org>
Subject: Re: MCEs on MIPS: multiple matching TLB entries
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=884:01=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=883:22=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=886:57=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
>>> Hi,
>>>
>>> OpenWrt folks ran into MCEs caused by multiple matching TLB entries
>>> [1], after they updated their kernel from v6.1 to v6.6.
>>>
>>> I reported similar crashes previously [2], on v6.4. So they asked me
>>> whether I'm aware of a fix from the mainline, which I am not.
>>> on
>>> I took a quick look from the MM's POV and found nothing obviously
>>> wrong. I'm hoping they have better luck with the MIPS experts.
>>
>> Hi Yu,
>>
>> I never hit such problem on my (non-bcm) 74Kc systems.
>>
>> However a quick glance suggested it may be related to Wired TLB entri=
es
>> on your platform.
>>
>> Both duplicated TLB entries, Index 2 and 3, are all below "Wired" set=
ting,
>> which means they are not managed by mm, but platform code.
>
> I just tried to dig into bcm47xx platform code and I think we should b=
lame
> bcm47xx_prom_highmem_init, which created wired entry for high mem and =
may
> conflict with kernel's mapping.
>
> Nowadays, MIPS mm code can handle highmem on it's own, so there is no =
need
> to create such entry IMO.

Sorry, I think I made a wrong diagnoses, it's actually a problem in our =
cache
alias code.

Will try to fix.

Thanks
>
>>
>> Thanks
>> - Jiaxun
>>
>>>
>>> Thanks!
>>>
>>> [1] https://github.com/openwrt/openwrt/pull/15635
>>> [2]=20
>>> https://lore.kernel.org/linux-mm/CAOUHufbAjZd4Mxkio9OGct-TZ=3DL0QRG+=
_6Xa7atQVFN_4ez86w@mail.gmail.com/
>>>
>> --=20
>> - Jiaxun
>
> --=20
> - Jiaxun

--=20
- Jiaxun

