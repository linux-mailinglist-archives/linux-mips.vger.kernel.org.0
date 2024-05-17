Return-Path: <linux-mips+bounces-3287-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815C8C84A0
	for <lists+linux-mips@lfdr.de>; Fri, 17 May 2024 12:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BBA11C22CF2
	for <lists+linux-mips@lfdr.de>; Fri, 17 May 2024 10:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A13532C8B;
	Fri, 17 May 2024 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="SUKAzxbR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KFqHlEw8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5CA2D796;
	Fri, 17 May 2024 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940947; cv=none; b=bOcgRfarT4Y6CYWeSpsJqnUGzIDLy8Z/vhkWWLk0EwbH1OUIgd3D+CrjojaKxK12AqIZfATgWOvP9DyGorU6OHgqxNXargYPaQHQ1gqqx7DNtTZpns2mG2iXdbRJpu9WyAuL4M21/cC+hbg0aXjD8nAo4btxy846cizgKjddug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940947; c=relaxed/simple;
	bh=Q4/Q7ovHhCBmkCyzTK6BeYz3diumYBC35ir/LQD2ZO4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=lGwKk7znETvlw2FZYmzCkvj5EfBK6pHzFjjRwyLN0ghMKxIc9PPNGFLR1uV1VRQl1jFXcSsezOVfMzeTF+0IVCtiLK9eyEE61DsBAwInAwlFRjWG56j8yXQ1ENlWlHze/CVJoSr0DF3WnyENJny888/mhPrv5QkfyBL8vEFKarA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=SUKAzxbR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KFqHlEw8; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 163791380DEF;
	Fri, 17 May 2024 06:15:45 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 17 May 2024 06:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715940945;
	 x=1716027345; bh=6/O6p5VBMNiw5tjN8y1NAmEQQY0D2tHQjKLIsmFA2Ek=; b=
	SUKAzxbR4GdfoL5Zq/IrRbgbY2YMsxOnmtrrwBya0dNhXDt+nmxB7uE4jJH/Gvmx
	cVtvWuRyzQFGz5oe4ROMZPWrj/KZxVAPYDpJyRQo4W65OzO8f38YZ8bbRVdHf/R+
	2eEpLCIkifcdnoIsjT1hGv1mr+Qfq0aU/ZOcOQURb31C450V+8R85o3kq/82WCF3
	Q8sKfPQE9R4TUm9Y2qtdIFzx9CY8U+arWQamuxGC9Y37zMg0+ECY3niPZH9arM3j
	qjXqveOi22WgD2blahTVbegz77BWDCeRnSPr4GlUsMu/U1xNHymaENKzTibJmyK7
	UY/0UvsH4OORWMee8l74oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715940945; x=
	1716027345; bh=6/O6p5VBMNiw5tjN8y1NAmEQQY0D2tHQjKLIsmFA2Ek=; b=K
	FqHlEw8UVV704fkaAOTz8cnPTlSPUjdZrA/EDIG/iyMw1w8xcJpZH2404yWfGKFX
	XkntJPmt9EvcXYAs2tVyOycPe9o2fTVk2tU4OXUEXeWLf5hTWzvPzuAEAEbCCoHl
	+dggowz0RaJEaHNX5wguEIjuWCcYBL9MXVe+iE0v/57FBnxfr7V3VQihyPcGTgD0
	Efe/5364lD/uQta3tm7TqQJyQLT20hqoIvbZdtv1QvO1cagurQ9ftTWBXGL6tIaa
	SJ34Y7dlV7w8MZvBJ7uapXKxlQEiLZVvVJrVBov8QJcEVzQHTV7aI3InQMYh4ryv
	lHHr/gemTuFJJrWi8WM2g==
X-ME-Sender: <xms:UC5HZn0PHeFBsHcEGZZiFfVvHevyyOOp9Qx_fIyF10F2-F-KmGPHLw>
    <xme:UC5HZmECfOoL_jSoXrcc7ttDwCLTObItO6Vemzcx6Jyvp7Sk2oT0si3OYjx5bgsvQ
    KemgFK0LCprb4x1wg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehfedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeejuddtuefhvdejvefgheduiedtheeigfevleehffdu
    udelhfekiefhheduhefgveenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:UC5HZn6BvIdBgtVU-881dRpPuCc-lgdku8Pc50mPeXcSbDM7-erIyA>
    <xmx:UC5HZs3CpRCApNjB7FG5tJlcL5giaDfiNzh-z4p-mRgF64jExM8DPw>
    <xmx:UC5HZqHj15rb5F9PQSyTlttvKZjxnU3mk-4U6dpOuevOfzhWKlKR5Q>
    <xmx:UC5HZt8twds8F6rZdgEBPYpYwGxLpCjR3meLQXQqrtjsTIzLvPR1rA>
    <xmx:US5HZtAwlcdVFnmW4KVknMPvOQF7bSI6qp1wUL_1P7wR2CKn1v9XElbF>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 71DD836A0074; Fri, 17 May 2024 06:15:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2aec4e38-f596-47d7-9e2a-a99e628dff5a@app.fastmail.com>
In-Reply-To: <2245e750-0b5d-49d1-88f3-7c1c75f275e7@kernel.org>
References: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
 <20240513-boston-syscon-v1-1-93ff557d3548@flygoat.com>
 <c7317ea0-fcd6-40e0-9d90-bb1ff349c0e0@kernel.org>
 <31769e8d-ab52-4f4c-84ca-2f546287d006@kernel.org>
 <61445fe0-9137-44a6-ab36-ffb8985254df@app.fastmail.com>
 <2245e750-0b5d-49d1-88f3-7c1c75f275e7@kernel.org>
Date: Fri, 17 May 2024 11:15:23 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add img,boston-platform-regs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8817=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=E5=
=8D=889:58=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 15/05/2024 23:44, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B45=E6=9C=8814=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=
=E5=8D=8810:11=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
>>> On 14/05/2024 11:08, Krzysztof Kozlowski wrote:
>>>> On 13/05/2024 20:58, Jiaxun Yang wrote:
>>>>> This compatible has been used in arch/mips/boot/dts/img/boston.dts
>>>>> for a while but never documented properly.
>>>>>
>>>>> Add it to simple syscon binding.
>>>>>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>>>>
>>>> It is documented in clock/img,boston-clock.txt. Please fix/convert/=
work
>>>> on that.
>>>
>>> No, that's different device.
>>>
>>> Anyway, this is wrong - does no work with your second patch. Please =
test
>>> them before sending.
>>=20
>> Hi Krzysztof,
>>=20
>> Do you mind telling dumb as me how to test bindings properly?
>>=20
>> I tried to run make check_dtbs after applying this patch and that's a=
ll
>> the warnings I got:
>> ```
>> arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed pr=
erequisite 'interrupt_provider'
>> /home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: /: 'model=
' is a required property
>>         from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/img/boston.dtb: /: failed to match any schema with=
 compatible: ['img,boston']
>> arch/mips/boot/dts/img/boston.dtb: /cpus/cpu@0: failed to match any s=
chema with compatible: ['img,mips']
>> arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000/clock:=
 failed to match any schema with compatible: ['img,boston-clock']
>> /home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: uart@17ff=
e000: $nodename:0: 'uart@17ffe000' does not match '^serial(@.*)?$'
>>         from schema $id: http://devicetree.org/schemas/serial/8250.ya=
ml#
>> ```
>>=20
>> I think there is no new warning introduced by this patch.
>> Did I miss anything here?
>
> Indeed there might be no warning for this, because syscon allows a lot,
> including children. You need custom binding anyway.

Hi Krzysztof,

I really don't understand the reason behind having a custom binding for
such device. It even doesn't have a driver and purely rely on generic
syscon regmap to work.

I can see devices like mediatek,mt8365-syscfg being described by simple
binding have a similar nature, they all describe a register bank and with
serval sub nodes to describe devices being instanced under that register
block.

What makes img,boston-platform-regs special here?

Thanks
- Jiaxun

>
> Best regards,
> Krzysztof

--=20
- Jiaxun

