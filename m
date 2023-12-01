Return-Path: <linux-mips+bounces-423-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56105800907
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F241C210CC
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 10:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884D8210EB;
	Fri,  1 Dec 2023 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="p2g4QjVx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tpt0UfRq"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9781A1985;
	Fri,  1 Dec 2023 02:50:00 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D0F4D3200C64;
	Fri,  1 Dec 2023 05:49:56 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 01 Dec 2023 05:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1701427796; x=1701514196; bh=w1TPaQlt1j+Yzi/AdEgjJ87bFQJVx6EVRnY
	ldXhEoA0=; b=p2g4QjVxfltmOaT4hr8ZEQmfQNNnP+FG3LeRYMbRTM4dNNWy1wD
	jo1xr7Aw7nw+SxXM/KOJS2o8/x8dCN1y3v9BWlhjcMomN6yuuHNBtCiUhU3X0lxM
	4D3CZu6t0f7BYYWmvLHp2Nw4UKHsv9Oiyrkx0nwKiqWHwxuL5X9xC3ENpcDfWAu1
	kX5dSUNAAwgAWbjjzPu7+o+DVrHC5IdglL9HWlQVAIRlNdfdlgyt1GySqo49uZOJ
	3dbkOILPvjTTl5gv4L/sigSmsTBpJw6cXqnERkYNd0ZySIAgFCKJ2qwtbqgLn+FD
	1v45DxWYB1/9EM8jEpfC4ccGLZh6tFwRFfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1701427796; x=1701514196; bh=w1TPaQlt1j+Yzi/AdEgjJ87bFQJVx6EVRnY
	ldXhEoA0=; b=tpt0UfRq81Fq/vvm1MJV+khkgKzTbigqpwABKUosSHKjp7uXgT4
	x1mecn7vmvtPMdegwSPDF1X06966Ob9u33GtSYi1RCAJibc6fIB7cUeqnNbR5HKy
	jNgTs5S2DsKQP7RT7dYkRnoDkOYR25Ix/en9aPHZ9iHJLjmOyzlRcfUJ9l7X0X76
	8ryK014rBULzp6CBeT+hvvCsW34e1vfGi+51wo4suQoV/bXfqiMMRRLGVOO97yIa
	LM7pDHq8UmC0d9lbCh9P97mzcVLuhMZ3FABKlqd+BZdLZftQXFeQIs71RoVzAHFe
	EUkfKjKHG4scDeEbwubKF3S3FWYfjJeCuTg==
X-ME-Sender: <xms:U7ppZT1EWQDr55SjwLyscnC_3lJWnNujVqG2lzezA5CiGuUmv08kTA>
    <xme:U7ppZSH4gm92xyHkxtyQwXByy2X63rmmxo4L5LTJAkbMRdXXZuQZ9T8WLGvlhXiSO
    6Gj7zN4MyMCazEI8Tk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiledgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedtleduffeiieffjedtiedvjeehfedvteeuhfelvefh
    hfdvheeugefgffegleetleenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:VLppZT6kfXmO0fmO-FlDlVa_mPq_4ZL1D5Rb-qw5K8hX3dSWWyka8A>
    <xmx:VLppZY0OGg6kH8iqUmh7GJHPzVzqlHvsrMIDSwKdwcoxoxedYcQGAQ>
    <xmx:VLppZWGkalY7zIuUmz3l-54sDXpvLvGUdW3Wp7kY0Q7DatCvVzuqLQ>
    <xmx:VLppZe8QtzLNBkq1sYYRldd8CI0kIuJA4roXIgLjdS-vqyjW3DII7Q>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1A9736A0075; Fri,  1 Dec 2023 05:49:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7cdf280c-c3b4-4996-9854-d24c4842ff4d@app.fastmail.com>
In-Reply-To: <87ttp2dxe1.fsf@BL-laptop>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-21-gregory.clement@bootlin.com>
 <db993514-7daa-41cb-8e6e-179305c16e24@app.fastmail.com>
 <87ttp2dxe1.fsf@BL-laptop>
Date: Fri, 01 Dec 2023 10:49:19 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 20/21] MIPS: generic: Add support for Mobileye EyeQ5
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B412=E6=9C=881=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =E4=
=B8=8A=E5=8D=8810:34=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> "Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:
>
>> =E5=9C=A82023=E5=B9=B411=E6=9C=8823=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88=
 =E4=B8=8B=E5=8D=883:26=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>> Introduce support for the MIPS based Mobileye EyeQ5 SoCs.
>>>
>>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>> ---
>> [...]
>>> diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
>>> index 7dc5b3821cc6e..04e1fc6f789b5 100644
>>> --- a/arch/mips/generic/Kconfig
>>> +++ b/arch/mips/generic/Kconfig
>>> @@ -48,6 +48,13 @@ config SOC_VCOREIII
>>>  config MSCC_OCELOT
>>>  	bool
>>>=20
>>> +config SOC_EYEQ5
>>> +	select ARM_AMBA
>>> +	select WEAK_ORDERING
>>> +	select WEAK_REORDERING_BEYOND_LLSC
>>> +	select PHYSICAL_START_BOOL
>>> +	bool
>>
>> ^ I believe WEAK_ORDERING is already selected by MIPS_CPS,
>
> But MIPS_CPS can be disabled: it is not selected by
> MIPS_GENERIC_KERNEL.

IMO if MIPS_CPS is not select then there is no SMP support on this platf=
orm.
WEAK_ORDERING only make sense for SMP system.

>
>> and WEAK_REORDERING_BEYOND_LLSC should be selected by MIPS_CPS as wel=
l.
>
> WEAK_REORDERING_BEYOND_LLSC is only selected by CPU_LOONGSON64 for
> now not by MIPS_CPS

I believe this applies to all SMP cores from MTI, I'll check with hardwa=
re
folks.

Thanks
- Jiaxun

>
> Thanks,
>
> Gregory
>> =20
>> Thanks
>> --=20
>> - Jiaxun
>
> --=20
> Gregory Clement, Bootlin
> Embedded Linux and Kernel engineering
> http://bootlin.com

--=20
- Jiaxun

