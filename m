Return-Path: <linux-mips+bounces-3314-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A78CC3D1
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 17:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA8BFB23A6E
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 15:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1677151016;
	Wed, 22 May 2024 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ZFfRwpi3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jx4WIM/k"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289E502BB;
	Wed, 22 May 2024 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716390500; cv=none; b=Q9pYYZNeUvTjw2a/ZH6csytlqIkvWlyEnntyf61SuiKMlaXWFd3/3bO2vvZZ+X2uKRPVyXrdEJLtLLC1Vn+eKgapKYfUwQGjsrp5/hoSkbYBA/pcsu2Ye3zHseO+Mk17bNicaNgu0Zc6ya1xUxRDoaOpg27Cak1yQVlA6Tn2ovA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716390500; c=relaxed/simple;
	bh=WBXWn9DF64PWHy/GS7QgpNWwnjYvO9xO1VVoediKDPU=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=X0309CXS2HHtCulkPW4wRKCtkE084/cEVmk01anyJ4sZ4UVO7hHtnmZv/K0tD15GMSLQ1ia/GG7KvmJfL00Yh4Tc1nKms++7jJMbu2Vbx/mSisVGjx1AMT2tpQsxB1X+m3anaqFy8gv2t06PAzibFEyD5vZHGZpgx+HyGYbbDKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ZFfRwpi3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jx4WIM/k; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 07B271800158;
	Wed, 22 May 2024 11:08:16 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 22 May 2024 11:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716390496;
	 x=1716476896; bh=WBXWn9DF64PWHy/GS7QgpNWwnjYvO9xO1VVoediKDPU=; b=
	ZFfRwpi3IXavn3EK5rm0cfzBzvdvkwBbYkz+UlMh0SJ1x8POl5dCNb+ec50HAkRD
	gfW+nV0em4vlP5gzLtmDCbIkO7BtMRSkXJP6NsaErFuPgiRr0+CfCGqqVl5gUr+J
	YJEa+eEnAqZGbjibs8lrYYMfJXmBf7PfOfip1W+0fdA6lQzB4KVzSUdQccEgJCEs
	IB69KqvcBNl7gjXwqk5Opr2GrJwRu5Q2wRpf6buU7txfVBtvvj+o41w3WVwHvfuK
	sCrRw7e09HdnKRfBnh0ixLk23q9tnnAES8IAV8h3WwFfvVOMzeNihOgNfQFiOzZs
	YvwfBuoWbTjf9ZreMhmF5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716390496; x=
	1716476896; bh=WBXWn9DF64PWHy/GS7QgpNWwnjYvO9xO1VVoediKDPU=; b=j
	x4WIM/kur8rVyPPpTX6nlnmxAM1VS1W9jYDk9B2JKHYWl7C2yfsUM0INfkTfNwsB
	aYoOGK88inxHoBqwiNGcshyTNFunpyVG8OCpUUxb1ZColTwt3UtL427yEyYZ408y
	kvdCc+bY08ymQR96gbHKxvtbfLHAdCvsB0k6D+V1EvGYWlcNUXfI9RGywLN/W7PP
	JcRhoh9vecVImWLNY5fM2Td9W2RIZFvVGcEGjZmJ7fX4NhhA42Px34aLknvOurS7
	iizQuzlA+Hrbc80BbIR47gLzLJLKBVfrWT+SzzvO1RgEYDB+GsulRMEq3bWdBVT4
	WpWuQzZc5wgen6P1NURDg==
X-ME-Sender: <xms:YApOZmg3XU0Bm_J4L_152xo4H-M1MVnFbSGLEsgxggBeIzYinpxtjQ>
    <xme:YApOZnAjTjwi0bz5QaOrkd8wf5qqdgUxH3pjGqceHOuqXT79vBFukY-S4HQYKolgX
    G9Zlvl6kJWGeNMsEyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:YApOZuEOvKNNwS4K-FM_ND0ScK1AVTK76dgEY_LCcoAPdCETbr4EOA>
    <xmx:YApOZvTnv8ZJya5hdVxrXAD0VkOahc4A1bPrWm7WWJS1VOsqBVIL5g>
    <xmx:YApOZjy_TrPDrjqpnUkIIgNLFL-ySN0fMkZkhGZkSmISV31Xwn8w_A>
    <xmx:YApOZt7wjey5NX8RAL2wTGuHJVz_nifnPdKSo8VNJaBsQxG7Ao-r-Q>
    <xmx:YApOZj9UpD6SIdFZjQcDDUBOhlT1iJkHI7OlR6BFaU4aFK2RkDZoTbgv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 209A136A0078; Wed, 22 May 2024 11:08:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <a62c1c0b-0b2a-4b3f-85df-da586e103fcb@app.fastmail.com>
In-Reply-To: <13aa508f-6830-4d52-87fd-5063f737c990@app.fastmail.com>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
 <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
 <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>
 <Zk2mt/FsgltvhVzf@alpha.franken.de>
 <13aa508f-6830-4d52-87fd-5063f737c990@app.fastmail.com>
Date: Wed, 22 May 2024 16:07:37 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8822=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=E5=
=8D=889:28=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B45=E6=9C=8822=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=
=E5=8D=889:03=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> [...]
>>
>> hmmm, I thought I was clear enough on version 1 of this series.
>>
>> I don't want an additional printk like debug interface, There is
>> prom_putchar() and early printk console, which always got me past
>> any boot issue.
>
> So it's not an additional printk like debug interface, it actually
> merged 3 existing debug interfaces, the first being zboot's assembly
> print routines, the second being CPS's assembly print routines, the
> third being some platform specific early printk. I think they are
> all essential for debugging early faults, for zboot that's the only
> way to print something at decompressing stage, for CPS as other cores
> are booting in non-coherent state we can't safely use any kernel
> functions, for early_printk that can help us *reduce* the amount
> of early printk code by just adding UART base to config.
>
> The only thing being added is the ability to debug very early exceptio=
n,
> even that is partially ported from existing CPS assembly debugging rou=
tines.
>
> Please let me know your thoughts.

That being said, have you noticed that prom_putchar and early_printk is
a non-extant on generic mach, ingenic, ralink etc? That's because we
really don't want to introduce any platform specific UART code for
early debugging on new platforms. With DEBUG_LL introduced by Arm it's
only a Kconfig option to do the trick.

I've got review tags in PATCH v2, that means not only me feeling that
this series is reasonable.

arm64 / riscv doesn't need that because they are well standardized
and it's almost guaranteed that kernel can boot into earlycon without
much drama. For MIPS that's not the case, there are too many things that
may go wrong, from zboot decompressor to cpu-probe and memblock. We real=
ly
lacks a way to debug things early, we need something that is available
at 1st instruction at kernel entry. Furthermore, many MIPS processors
don't come with JTAG or alike debugging support, that makes debugging
even harder, there is no way to debug an early exception if your firmware
doesn't handle it. That's all the motivation behind the series.

Besides, I think our communication needs to be improved. At PATCH v1
you made your point in reply, that's fair. So I also replied twice for
clarification. I heard nothing back, so I assume you want to see how
would it develop to address your concern. Then I posted PATCH v2 and
v3 to further improve the series, after that I pinged twice on PATCH v3.

That's in a 6-month timeframe with multiple transactions, you need to
inform us your intention, even if it's a NAK or you don't want to engage
on this topic further.

Quoting the maintainer handbook [1]: "If the review process or validation
for a particular change will take longer than the expected review timeli=
ne
for the subsystem, maintainer should reply to the submission indicating
that the work is being done, and when to expect full results." Radio sil=
ence
won't help anything, it's wasting time for both of us. Please, give a
shout if it's possible.

I can see some other series being slipped away this way, like I6500
multi-cluster patch, which is sent even earlier and respined many times
over. I can recall Mobileye series had a hard time on getting your
attention, luckily we went through it.

Quoting the maintainer handbook [1]: "Nonetheless when the work does
arrive (in form of patches which need review, user bug reports etc.)
it has to be acted upon promptly.". I understand Linux/MIPS is not
your day job, also you need to take breaks or go on holidays. Sometimes
you may burn out from your maintainer duties. That's fine, we are all
human beings. I'm not expecting a 1-week SLA or something, but 6 months
or longer to expect an action is appalling to me.

I'd strongly recommend you to look for a secondary maintainer, as mentio=
ned
in maintainer handbook [1]: "Modern best practices dictate that there sh=
ould
be at least two maintainers for any piece of code, no matter how trivial=
".
I understand you reject the idea once when Paul handed maintainership to
you, but there are clear evidences to show that something needs to be do=
ne.
You might need a hand on handling stuff promptly and understanding some
modern MIPS stuff.

I have many, many tiny improvements to MIPS kernel locally. Furthermore,
I do bring-up for both new and ancient MIPS systems. I never got a chance
to send them out because I want you prioritise on those fundamental seri=
es.

Apologise for potential aggressive tone in this email. I just can't clam
down when I think back about your reply, and I think we really need to
talk about it.

Thanks

[1]: https://docs.kernel.org/maintainer/feature-and-driver-maintainers.h=
tml
--=20
- Jiaxun

