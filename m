Return-Path: <linux-mips+bounces-4040-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F012891CFDB
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 04:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2357F1C20ADE
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 02:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2481C02;
	Sun, 30 Jun 2024 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="UNyQaw95";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R99U+kjk"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814A64F
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 02:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719714145; cv=none; b=AMwOFxHLzyPPmzzd6Yhs3rV8zndWn2E4AdGdO/3plS15o7FOoF9Pvlt6uol8crSswhJw4xGJnBTOmW/yOYdfFIYhY2HcA/sK7eWyeoymcplJvWPiVOS4yoUWHmABdoQD+lkTOVZd9k6ClHEAayd/bYePJkDSAH0TLmvTtGp2X6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719714145; c=relaxed/simple;
	bh=F7RaEN0iiM7e9R7X8a/2ZixKvLWifRmhYkgkKMLXWDA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=XVntEEpEdn1V8C3rFJCm6tyGiebBXhBVl057uxF9vRaTEfTNwf/nD3QUCS6xcUfxvLhAtagMoxA6aLeAUNW7FzcnTLCF2viDDYUiw6KgEOwv+a7Nj4CjumrxtlD00RD5Ov5l43UqD57aORbCsuwQ2Jsi0mVx3t7vp0farTxUA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=UNyQaw95; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R99U+kjk; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 01C0813800F2;
	Sat, 29 Jun 2024 22:22:23 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 29 Jun 2024 22:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719714142;
	 x=1719800542; bh=F7RaEN0iiM7e9R7X8a/2ZixKvLWifRmhYkgkKMLXWDA=; b=
	UNyQaw95Jgm6JWJHwf8V+4QTEjCmUBtaCaX/G7EDA4VlIg7VEy6aWxGW54MK6mq6
	fLlcW4z+z0KBDjKZQtzI1dIx0TTDsDZSQ0BIDhLM++P7BMcf0/LnSbT1c6UuS+/g
	nA/WMjRCU5ntXVfyL09EXBvVzi9y7RWd8tMekMXdZK1uax1ZOBYlMo3V6yFZc/su
	cEhgrQwm0Sok21vpf3G+FROZ1LmYBL/WyrXJqeKAbn8DNZy/VTy39QwJw0L/3G5A
	KQ5Pjtyp1bv9hNPaXsPdpacMFs4AjQoOrc8w+6GET/Yr8NiuUJ5YmPOp3o6XFPo6
	KolH63nPbWAVmBJW+uzeOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719714142; x=
	1719800542; bh=F7RaEN0iiM7e9R7X8a/2ZixKvLWifRmhYkgkKMLXWDA=; b=R
	99U+kjkiL1m/dhqgUkUatrFUnHCMfou1Cu/nxn+DnO22ZjYG2iBm6ECkRtVdCwmw
	yKV5OZfoF+ENYtTlyLWdHpOS2QszTxjQtqvQ7Lg1E+/XlMN+TUZ7r1csCjCbJoac
	yGKzyjDZP02PJUi4IoCiknPSnP1V52IJsujZsP+XRfbZ5QqR3S1HyWvUMNXNySQh
	4MxWOuIBFi+awdrKcT/QyP4bb5n57YaogJVyBC6vBClpwulLoJs0ARTNcKb8nmLK
	vqIizOEGyp7XU552TqrgwTEJmmqmKbKe96pDV9D9yVkfTqpdlUmJaQ9KytvmKaG3
	L6IGhjWP5deMS0lEsLLdQ==
X-ME-Sender: <xms:XsGAZp7Svpqbk3I4PMd8O85CI5K0hXfuvCV_rJqidGEUWipv6V2xUw>
    <xme:XsGAZm69F8oJNx3gOBJwH0i7m-6C7gA45VduF7olUIjWBNsP9PRAKbMntfsQqbkwH
    qqnaFUTingaQYCqkrE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepueduheegffdvvdeguefgledtueejffdtkefhuefhueff
    iedutdfhueehkeeuhfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:XsGAZgfUFF1qrAdsXJqECSfptGn6-_V2hzWFZGVA19hUunnDioxGKQ>
    <xmx:XsGAZiL9syWgn7vej6WqUtb8BU6F52X-1Ds2NFMcIavgRklbyNy-yg>
    <xmx:XsGAZtIXq9aNmME7bc0PL6-TGa_ACDMeMjWBpWWigOs0HRbr-rS_3g>
    <xmx:XsGAZrxsvrBCec2AcKOXFFAvX0lQ_4pVpz6qAj-cwrNq-0KcTQvT2Q>
    <xmx:XsGAZkWN_os8rpoB7vuGdSaZHy-CGkpFTf3yBZx2vOLvyY4X9Y9nN7Bs>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F4B736A0075; Sat, 29 Jun 2024 22:22:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com>
In-Reply-To: 
 <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
References: 
 <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
Date: Sun, 30 Jun 2024 03:22:05 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yu Zhao" <yuzhao@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: Linux-MM <linux-mm@kvack.org>
Subject: Re: MCEs on MIPS: multiple matching TLB entries
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=886:57=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>
> OpenWrt folks ran into MCEs caused by multiple matching TLB entries
> [1], after they updated their kernel from v6.1 to v6.6.
>
> I reported similar crashes previously [2], on v6.4. So they asked me
> whether I'm aware of a fix from the mainline, which I am not.
> on
> I took a quick look from the MM's POV and found nothing obviously
> wrong. I'm hoping they have better luck with the MIPS experts.

Hi Yu,

I never hit such problem on my (non-bcm) 74Kc systems.

However a quick glance suggested it may be related to Wired TLB entries
on your platform.

Both duplicated TLB entries, Index 2 and 3, are all below "Wired" settin=
g,
which means they are not managed by mm, but platform code.

Thanks
- Jiaxun

>
> Thanks!
>
> [1] https://github.com/openwrt/openwrt/pull/15635
> [2]=20
> https://lore.kernel.org/linux-mm/CAOUHufbAjZd4Mxkio9OGct-TZ=3DL0QRG+_6=
Xa7atQVFN_4ez86w@mail.gmail.com/
>
--=20
- Jiaxun

