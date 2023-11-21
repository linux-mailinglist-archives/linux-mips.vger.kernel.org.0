Return-Path: <linux-mips+bounces-134-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30607F2D7C
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 13:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FCD7B20AE3
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFC6200B9;
	Tue, 21 Nov 2023 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="qBfJ/ZQ9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UXfQJ9YG"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E9212A;
	Tue, 21 Nov 2023 04:45:08 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F02483201564;
	Tue, 21 Nov 2023 07:45:06 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 21 Nov 2023 07:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1700570706; x=1700657106; bh=MFZuHhIZLU1gMAvQ832C3jtNrDMpwBRoZM3
	wJLLFml0=; b=qBfJ/ZQ9XJM/ZO5WXCfwHh+1rOkZP6F+VF8tPqlPZbaXkCWKMN7
	vEu1iOfgu2nt1CNBhVHBuuTCzqHdbd+BYrWAozkBNcPhIMkcX02rI6tlkVdBLs3D
	alO/cttJ2RusKthVT4u8pOoA7VJx1GswMlJZh6VAMenaCyxieq64WTZAjjnipOIu
	hx6oPcEj6hEdx5BnGDaQdQOfDLXvgwQKtvi9qfAp2n4OWatEPUDHXjBfVhJ80aIU
	G5b8P70zOvnAbm/UqLvjBuEbJnfIQiIR50qv8KoQE4EfZGUuexZAmVv2Fg+iT66D
	zGlPZ2zXK7Pv7VqZ1XDDrsw3BZmva8vj7SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700570706; x=1700657106; bh=MFZuHhIZLU1gMAvQ832C3jtNrDMpwBRoZM3
	wJLLFml0=; b=UXfQJ9YG7o70NacKkwrJD0CVJ9FB+r94zHeQb4wytbiRAKJ1Eeb
	Aj/PpRvwueaF9lDcWRdzA+c50qFhRvk1a9ioIDRjYiVb7QuQXyRRc3j7/ij4NxP/
	Fns2+RHO/aucqpSJWBs6IoMGJnLe4kpSoeBtTYTNGfiMsCGVTQfEDunBRNi3bmTt
	le18quuzpV41MAUOYsQXfN7+dR31ShC/I4yRZ73isEDz1wDahsXlG4voH8dISKaT
	Nly2STiTaH8pD72BEZ1xe8zLyHKyhOqHlMQrGSsUNzVO2fYmH2LucCtvOEHzFlpo
	/qNV26SZWGm3C6Dy3W+d8TTZIHNzHFgjGfw==
X-ME-Sender: <xms:UqZcZVdV8YhHlmvWxGR3ktu3arjOOAdflU9M975ehUtHp4w1M8CouA>
    <xme:UqZcZTOcl4esoWc9_PtaWHidsD1Z7iINUy_rqIjIqJK0mEOdl7ucewQbZtRszuvWz
    jAdIjOqwzpDBk1NeOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:UqZcZeirRyIQdDBMeWS78IU3Wqgxz44OY18PCEjUicp5CTpehPscww>
    <xmx:UqZcZe8NuuteCLOKEEsqXKnm2WTQ7MY-lIcwGurtki2bWMSPiYONgQ>
    <xmx:UqZcZRttVN2jLwcww0T6ii-G3rn6u5sdqcvNBE5c480QYLjL7v4mUQ>
    <xmx:UqZcZa7iVz4_nzo4NV8hEhFXi3IwJWHTM8Ly8l7YtCpA0kE3szhzGg>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F373436A0075; Tue, 21 Nov 2023 07:45:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c2a65fba-6f70-48e6-a336-9ba1724b1add@app.fastmail.com>
In-Reply-To: <ZVykwhGE/aqjcpaK@alpha.franken.de>
References: <20231026111715.1281728-1-jiaxun.yang@flygoat.com>
 <ZTvQGs/lEpizUFLh@aurel32.net> <ZVjaDTcjNpD3m0cC@aurel32.net>
 <ZVuuqAUJ7f2ELIYW@alpha.franken.de>
 <c9e2daa2-65a8-445e-bace-ab750f04411a@app.fastmail.com>
 <ZVykwhGE/aqjcpaK@alpha.franken.de>
Date: Tue, 21 Nov 2023 12:44:49 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "YunQiang Su" <syq@debian.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: process: Remove lazy context flags for new kernel thread
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B411=E6=9C=8821=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =
=E4=B8=8B=E5=8D=8812:38=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=
=BC=9A
> On Tue, Nov 21, 2023 at 12:27:11PM +0000, Jiaxun Yang wrote:
>> > I don't like the patch doing too much code restructing. I can't
>> To reproduce, you can just install Debian sid and build kitinerary wi=
th
>
> I found an io_uring test program, which triggers it. Now my loongson3
> machine needs pressing reset in a remote location... is there a way
> to configure it to start automatically after power-off/power-on ?

There might be a switch in UEFI firmware, I'm not 100% sure:-(
WoL may work on that machine as well, my personal remote lab setup uses
an ESP8266 to control reset and power button signal.

>
>> sbuild. However, it seems like loongson3_defconfig won't expose this
>> problem, you'll have to build kernel with Debian's config.
>
> CONFIG_IO_URING=3Dy
>
> that's the needed config option.

I tried before but it seems like looks like that's not enough.

Thanks.
>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

