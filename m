Return-Path: <linux-mips+bounces-7356-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A287BA09902
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 19:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467A4188B547
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 18:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCCC21128A;
	Fri, 10 Jan 2025 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="EkrqWOkN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lnTPEnx0"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDD224D7;
	Fri, 10 Jan 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532086; cv=none; b=Jy2/SuRH3LDsik4p64O8VmSFAskwkE3CjuQpFp4OgcubKqSUDmtIsMLsdU6lb1n4C885LNobWEXhOaUrcj0Q2NPijh53VFB1DVI3C38VG4x4TF0vqX3vy5u2Ot3b26s+OM3YTPUnYnTLB6EpeOhTLtNuxB6bAg/whwQYUMMAOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532086; c=relaxed/simple;
	bh=O57R9mirbuUO5wVAF4LfDqbIONsq2MWMpUtCISZxgcQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nFfoDfRyVWM59J/TegcM3qTq0gxhInTK1FWr1R3LnYYG6WByZVjSFh3bHYFrkJKSBKFTJP7uo0exlfly41LERqAPRxmXbrWsZFD99EQ0qAXok8q5cSteEb5lR1w6IBRGj42SM2+xxgHQYLI6ZNblxKHB9yNqfnwGr8HNzQL5Pac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=EkrqWOkN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lnTPEnx0; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6848211400D7;
	Fri, 10 Jan 2025 13:01:23 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 10 Jan 2025 13:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736532083;
	 x=1736618483; bh=yen/mjiGBKQk9WGCqCrEDEXsWoRARsSFozzPh57oQTY=; b=
	EkrqWOkNIo0IOoGGUZiUhGm7roWQAEmhKjgHA7HWOoLw05URjFp5cbuPcTQme0of
	LdvuW+uIoRhWCJWGUrVl0EejrcwVCE+0uLw2juQinIxUZbe9rU5sOsJuOEr0Wr0V
	OOQw6HvIwz29zDjJU42Yf2KhWy4V7IwvIbdKnwErjaX82bUrxAxPywD2ljDzwTmJ
	Hok9eAq3Y7hHKZiBnnOGw+TlfT1/KDdTtdY8Fmu7AXPEypAUZ/vJVD/G2AW2dcxm
	iRdotCOvmg+XtQlRqQcioiyE4M53AHuElJJoO9jMrH6mu/qzic9gu5ief7+UGQS5
	x4AHTlJhnEN7Y+nwHcEFuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736532083; x=
	1736618483; bh=yen/mjiGBKQk9WGCqCrEDEXsWoRARsSFozzPh57oQTY=; b=l
	nTPEnx0hlE2+L5EzFlRGn2sD4iPV4/rWCW9IMTQRaNPzwj1qmUJBY2Xkj2VRMK4v
	bWq05mKmP4s5HXs6cZrt12niefTYJ5rkcZP4aa/NlgyOo7rZ2O3Vq0WA8f91j2Tf
	Cqj7ZZONt5YYNpViWjNghJXlMB4LQ5tDcpGaLel20PxxzH1lVMzqJVG5WxXuIZ22
	9qnDKlcerkE+eBo4/ki/edARfQI4qqyuP6KG0ZRQkg2ghi8F5oCSkON418l+KObQ
	QN6GGs4rMCUgQl0xz8+P37mKnnwbg7aHLdOioocHLQJDv9qsOA5qqMF1I9WKpmBP
	TDpjF3NkPioNyUmn3BjuQ==
X-ME-Sender: <xms:cmCBZ2M5PHmJqf94aZ9oApIm8ZUiwSjI_9R_MFfpFq3sej1br-iNRQ>
    <xme:cmCBZ099bcOdDUb33SxxMu8GedAmuSmYvKVl5dMYT71ozLxA5TLaqT1FDNl41RY9L
    FtJQV2G3y3MIMeQO-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegkedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepjhgvfhhfsggrihesrghoshgtrdhiohdprhgtphhtthhopehkvgighigsihhstghuih
    htsegrohhstgdrihhopdhrtghpthhtohepuhifuhesihgtvghnohifhidrmhgvpdhrtghp
    thhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihrg
    hnghhtihgviihhuheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cmCBZ9SsZ5KJPwtH4px0oWT95baoTgMdfdzkYz3DPKrMJtSgOe1vzg>
    <xmx:cmCBZ2t6vuuMD7jqVPdmuvdDbn7t7B-HITml3YMsjCU1v4waeNX4eg>
    <xmx:cmCBZ-cF_mIQZroTcJHa-LhoZP8-BnITQnIKhn3skJyv9fy7qxppyQ>
    <xmx:cmCBZ62pUKPX3kOw3omLcWhLOGbxB9tZCyZXhpvleoxOrVQ4XMFnUg>
    <xmx:c2CBZ1xyawMIT9mRuiVZJsErqSfryRgPEYr5QKFewIJuNFC6GdDZdpDw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7059C1C20066; Fri, 10 Jan 2025 13:01:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 18:01:02 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Kexy Biscuit" <kexybiscuit@aosc.io>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Mingcong Bai" <jeffbai@aosc.io>,
 "Icenowy Zheng" <uwu@icenowy.me>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <0a9d5494-f220-4883-95e2-112223f14c23@app.fastmail.com>
In-Reply-To: 
 <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
References: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
Subject: Re: [PATCH 0/2] MIPS: Loongson64: Remove ROM Size in LEFI boardinfo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8810=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=885:22=EF=BC=8CKexy Biscuit=E5=86=99=E9=81=93=EF=BC=9A
> In "MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo", "ROM Size" was
> added under section "BIOS Info". However, that is incorrect per Append=
ix
> A.7 in Q/LS 0013-2014 (=E9=BE=99=E8=8A=AFCPU=E5=BC=80=E5=8F=91=E7=B3=BB=
=E7=BB=9F=E5=9B=BA=E4=BB=B6=E4=B8=8E=E5=86=85=E6=A0=B8=E6=8E=A5=E5=8F=A3=
=E8=A7=84=E8=8C=83 V2.2,
> lit. Loongson DevSys Firmware Kernel Interface Specification V2.2),
> which defines the size to be the size of this interface itself.
>
> Removing "ROM Size" from boardinfo, and also adding comments to the
> struct interface_info to clarify meanings of its members.
>
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>

For the series:

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Good catch, thanks!

> ---
> Kexy Biscuit (2):
>       MIPS: Loongson64: remove ROM Size unit in boardinfo
>       MIPS: Loongson: Add comments for interface_info
>
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 8 ++++----
>  arch/mips/loongson64/boardinfo.c                   | 2 --
>  2 files changed, 4 insertions(+), 6 deletions(-)
> ---
> base-commit: 2144da25584eb10b84252230319b5783f6a83041
> change-id: 20250111-loongson64-boardinfo-no-size-a25dd2a03a8b
>
> Best regards,
> --=20
> Kexy Biscuit <kexybiscuit@aosc.io>

--=20
- Jiaxun

