Return-Path: <linux-mips+bounces-135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D637F2D82
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 13:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8484BB210E3
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 12:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF781D687;
	Tue, 21 Nov 2023 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ROqpP4TU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L0s+cPl9"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D27C19F;
	Tue, 21 Nov 2023 04:46:00 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2280E3201292;
	Tue, 21 Nov 2023 07:45:59 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 21 Nov 2023 07:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1700570758; x=1700657158; bh=8Alesg8n/m/l4EguxqnZHIHwWbAHfgNV/z7
	L4ZWi6qQ=; b=ROqpP4TUII06ukDQivp6I63q9eTmsr3V3sXlGL798Kct3Qqw+gr
	Vr0qGMgykhQGhe1frmTwfwvqJajEoPXJr2YG3WGQEnKXf5BOX4utitGOvJzMS+7e
	R77UURWhqOEQEPe3197hW0IVyKpjditB8h/GF8YGC0cX827ySiTMdXMlDcLlgna3
	czawzjxt6VMQw4mIrXOBHwwImncFnntpS0DRWzgrsW5aeq9FDtY0qnos6sbpkkOd
	TZFzOOukNVOc2MpTjEUyXis+viJqs6lcNrAjBwarohCh6GLh/E3LSFHxP6mf2Wzu
	abBmgbv4gDt3iv2IqCF8CN3tdEX9oq3Cf9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1700570758; x=1700657158; bh=8Alesg8n/m/l4EguxqnZHIHwWbAHfgNV/z7
	L4ZWi6qQ=; b=L0s+cPl9BcuP0l5MC9HuL0sac3vXoe6j18jjLV23i0XEMjtNuf0
	nPYc6UbykNAH5p03K4OG/zznFcRNpyU+7Zo+7iLSwqKnzCeFqxfXyPKwidgKFdzw
	Am1vijr6xBRinwwmtvCMueVwV82vK6FsEhmX3RAzmj8gifort5tN8kZtZo9D5jhQ
	wfe+kScdQ7Et+nNf0iBOhMUQybwO8DNhwpY4vLE1XXyyhR6FZPBflCixjXAU9MBE
	w4rV79f/HyTeBeOi4TgihKPnd6JcDhGRf/FWaahk7yIXu3WH+Kx7+cs9i4biQUSZ
	bVhsBqPYuQUyybItdlVBjM4aQPAbYebtkJQ==
X-ME-Sender: <xms:hqZcZdH5j2Q_SQS9725DKr7VBsAdCme_-4o8g9B8eJp4C1fkouVy_A>
    <xme:hqZcZSVAYf4mz7GtVTxGZfZlQp43S1QBUTToKJ6tr_TrK1jSNspyjFpSAAfuUTgiV
    xe4ZkkZ0bGSlzXSSKY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:hqZcZfLlhd50zl-bUE3TJ1wxx84IRpw7ntyBV7Co1awsvSjT0XrWgQ>
    <xmx:hqZcZTHAlSdGThnY8odJjqVWTH41yoLAGfXaMyma3g7k5RLomiSOxQ>
    <xmx:hqZcZTWf3kxTuOPFRorP9ZeznHf6vlK-BS8bDdevTVTxLHIZM1mfBQ>
    <xmx:hqZcZQh-CNgBkn_Lpaa46KoUI1Tav5teVyObhy4pMRG9VbKgQlx56A>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E81E36A0075; Tue, 21 Nov 2023 07:45:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3873e797-bc83-4fe0-bd84-94ff5889c2ac@app.fastmail.com>
In-Reply-To: <c2a65fba-6f70-48e6-a336-9ba1724b1add@app.fastmail.com>
References: <20231026111715.1281728-1-jiaxun.yang@flygoat.com>
 <ZTvQGs/lEpizUFLh@aurel32.net> <ZVjaDTcjNpD3m0cC@aurel32.net>
 <ZVuuqAUJ7f2ELIYW@alpha.franken.de>
 <c9e2daa2-65a8-445e-bace-ab750f04411a@app.fastmail.com>
 <ZVykwhGE/aqjcpaK@alpha.franken.de>
 <c2a65fba-6f70-48e6-a336-9ba1724b1add@app.fastmail.com>
Date: Tue, 21 Nov 2023 12:45:41 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "YunQiang Su" <syq@debian.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: process: Remove lazy context flags for new kernel thread
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B411=E6=9C=8821=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =
=E4=B8=8B=E5=8D=8812:44=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82023=E5=B9=B411=E6=9C=8821=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88=
 =E4=B8=8B=E5=8D=8812:38=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=
=BC=9A
>> On Tue, Nov 21, 2023 at 12:27:11PM +0000, Jiaxun Yang wrote:
>>> > I don't like the patch doing too much code restructing. I can't
>>> To reproduce, you can just install Debian sid and build kitinerary w=
ith
>>
>> I found an io_uring test program, which triggers it. Now my loongson3
>> machine needs pressing reset in a remote location... is there a way
>> to configure it to start automatically after power-off/power-on ?
>
> There might be a switch in UEFI firmware, I'm not 100% sure:-(
> WoL may work on that machine as well, my personal remote lab setup uses
> an ESP8266 to control reset and power button signal.
>
>>
>>> sbuild. However, it seems like loongson3_defconfig won't expose this
>>> problem, you'll have to build kernel with Debian's config.
>>
>> CONFIG_IO_URING=3Dy
>>
>> that's the needed config option.
>
> I tried before but it seems like looks like that's not enough.
^ nvm that's for cmake's workload.

Thanks
--=20
- Jiaxun

