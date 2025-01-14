Return-Path: <linux-mips+bounces-7446-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EFA1107F
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1343C3A5CCA
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 18:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03D31FBBC5;
	Tue, 14 Jan 2025 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vdWQ5sxL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pz/BH6xB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF351B21AD;
	Tue, 14 Jan 2025 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880684; cv=none; b=h7QJA/ELXxuTGlnHa6Y1c57grQtSYwnnZv/pwvEgNhPpEwx10ax5KRC7fc0CnEdhZOENeGvvMc9lAvbNMEhv95tEYwWL9/nuwsH5dmoxWS0vlTNtZidgIkm1rZM0lI2NOsTUvx4l817iGeQ8RlF4nlsYhKrFiI3QQrxAuwyv7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880684; c=relaxed/simple;
	bh=tgNjXSfJZZXt0y/ddetLU6Vx/9hH6IFbQHS06fJyvAs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CFx1T497rGXGB36HAy3aKe5mwx8Rq6MkOfKLAfsUbRBcc4ti7BRQP2tQV9IM9uha+b2YuoKkTo5igjScEU0ErJvAXXyjNcrRCsC/JAJc7TEsO0BXqS7U2f0FtsQsoVRjpZ+Sot0t78hypCH6xqERKdgJLFV5o7EhDsRaNSwmIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vdWQ5sxL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pz/BH6xB; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 168B911401FF;
	Tue, 14 Jan 2025 13:51:22 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 13:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736880682;
	 x=1736967082; bh=tgNjXSfJZZXt0y/ddetLU6Vx/9hH6IFbQHS06fJyvAs=; b=
	vdWQ5sxLoPHcKmk5Zypii9xdfdEZQVunn7b2b8wA/Sel9IgMHLiX0hYgnfGKKxQq
	bkdSI4aSSNxq8t/rPRyqhcruT2RrXPdZ2Cm2DMwalVXaI0S6osoqt2M87KREtMOI
	+8FZRtcXK8vzHjp2Vcof1B9XQXPMtPziwgmFnXdWKYs3vknBZHN56zEUBNZViohh
	zvJjlU2HFRGRCgqvlmWit1u7BU1TRb68cYIbuMAHLARrCihLoywVmCr+0p032cDo
	NMjgH7ThJyyzMx4Wl8njUAkJsC2FBUMsaA8S1+Lz3/Fz0eF21y1wA3pkoJWO/7zJ
	+SleihWOn+crBqo9mz0fXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736880682; x=
	1736967082; bh=tgNjXSfJZZXt0y/ddetLU6Vx/9hH6IFbQHS06fJyvAs=; b=p
	z/BH6xB7W/yRwmBpxVtHxbvVCv+THWqpIoxgy4xQqzS3hF2TR9rb7Zcc3IDRotrP
	9WGEQEee3ENhLAVcU0Vxgv9Zi8zBBTGeNWe8tn7YbKUxOVNG2yc93RgvB7iB7gWZ
	uPrbWHLGnoDWcbzjpF9fM011VymFLwApOfFOafY6+I7szz6LaSIBh4uDaFbT+J6d
	+h/7lsPGcZRX7vGOoGjf6gqVOoUhVgakwwmn9/39u8KCfpuKJVLEezCLPVv2eI3k
	o6vHi6ULbU3lMflwdQ27a3/Qm4/wxqQkd1qtMkw+6UJJWqYvnDWetOAk2ejleUue
	9e/aBbkO7koZDPFxC67oA==
X-ME-Sender: <xms:KbKGZzr9FW9Lchwso7bxP5Qm25AkjO68N1q6uJl_wDl2ksDKL2hl8w>
    <xme:KbKGZ9oJTRNGMIZv7lG7xoY66qNpIPi9qpSXYxoi1_Fy33EL07yg3D5WSL6_mYQ5U
    mwLuO8d2Zzbu2lTRM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehmrghtrdhjohhntgiihihkse
    hovddrphhlpdhrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KbKGZwNm_4bbPkWMiE9ZoA6u6QZ1ZsxO2_LI3KyQlHqXrjZPtXgpsg>
    <xmx:KbKGZ26NDNozuMhkrQxVor9r7nFncVEqFyduzQCl09COmbuuG-NZSw>
    <xmx:KbKGZy7QFCAEqf0jQ8hkID0jovd8SETefKq0JQG1h_fblYhP7ihwtA>
    <xmx:KbKGZ-iTNKuvfxkXy2HaK8gGqp-hTxbYnFNenjf9XjuvFpXUMR_ldg>
    <xmx:KrKGZ_skRYrv1AgFJWnKoRDXQ7FUJAqIujGHoVZtLL7vpb_ZjAGzrOmk>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 98FB81C20066; Tue, 14 Jan 2025 13:51:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 18:51:02 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Arnd Bergmann" <arnd@arndb.de>, "Baoquan He" <bhe@redhat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <28d6ed91-a5de-4a0d-8e76-9e79375a9db3@app.fastmail.com>
In-Reply-To: <6946ae6b-814c-4916-9428-e823c83aed3d@o2.pl>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <6946ae6b-814c-4916-9428-e823c83aed3d@o2.pl>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8814=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=886:42=EF=BC=8CMateusz Jo=C5=84czyk=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> Hello,
>
> Thank you for this patch, I'm testing it right now.
>
> Shouldn't this be #ifndef-ed CONFIG_MACH_LOONGSON64 and perhaps=20
> CONFIG_RALINK?

Hi Mateusz,

Those platforms are not using PCI_DRIVERS_LEGACY, so won't be affected
by this patch.

PCI_DRIVERS_GENERIC systems are handling logic_pio properly, so no need
for this workaround.

Thanks
>
> Loongson64 explicitly calls logic_pio_register_range(), so seems not t=
o=20
> need this. Ralink also
> defined PCI_IOBASE a long time ago.
>
> Greetings,
>
> Mateusz

--=20
- Jiaxun

