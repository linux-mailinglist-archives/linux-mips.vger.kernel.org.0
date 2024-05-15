Return-Path: <linux-mips+bounces-3279-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 110DB8C6DEE
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 23:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961E01F225EE
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 21:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0848615B553;
	Wed, 15 May 2024 21:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ERT99NLN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MgOwK9gW"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3F1591EC;
	Wed, 15 May 2024 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715809532; cv=none; b=PTZsex0EzKbFdXXYcJhUHHB1/saJvjQR65QGklzyjjEGbdg0Ksmi0t8tZMXHPEtvHE+nfM/il/IdTdYpvJ0qIl2epvDcgBrwymzx6je+KxUBNMWk5qCjX+ehpTqJfNAc3Smj0NveD0gQ8Q+VRRws4yv4kQfMeVyk/oNcX9gdfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715809532; c=relaxed/simple;
	bh=yhT8qH87UFLaU0oO9HTe6eN8eKuVid3cRTVIc+jIXAs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=VtG3pbbmcBRQx1HHLPYcw6UX8l21N6Q0TI48vf5lGFmzI6pSYHjb6OCDi0F7xaGItasSE+nD6W9s77vlA1ZDRTstlxVR4DzRusv5P7dqGePqwM/XTIiNKgZLlF5/KC2LcxK9gxu+JMwjdW+zYRP1zmDmVoDlMQyI6rpnN2w1+Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ERT99NLN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MgOwK9gW; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id D8BAF1800132;
	Wed, 15 May 2024 17:45:29 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 15 May 2024 17:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715809529;
	 x=1715895929; bh=DYfY0QLhy4/rRWL7kh0u1T/d2BAKUWKyXAVHHKbZmaw=; b=
	ERT99NLNvaEezIzDDFT0UXdcx7BbZrozkgm/DkZWKZPaFV8X2xCknjdLXZ++Yqw3
	EASsxozJqSkUSk30OPe1EU05gfmT9YHuDo1VDohHmW46QSj8BPz2WDyvnLlPKB5S
	rrkSiI9hldImW0vLrX0MSzBhqPzK229MLjgjTAWbIq0NrNvTlhnCAAMJk8/8gkP6
	DjNfFoL3fk0kysHYEMyAQHA57gWJ/+aJsUePENc8pJxm6OYI8XHxUvd5crB5O9qy
	Vr1dKnUWLhrYvFChKZ9a0m1NBrASAQZ3T0C+7sWTlXY6y9NYYdyX3MiwCDrxBpae
	LHVkXUQ2skkaJgSgxL3H3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715809529; x=
	1715895929; bh=DYfY0QLhy4/rRWL7kh0u1T/d2BAKUWKyXAVHHKbZmaw=; b=M
	gOwK9gW26E5deyuZdMckL0EHDqzk3qsrTm+f1m93fehvBwejE2fj7SYkakM5me7P
	PFFFsPxaI3ucuzvKoh54GO91v426XAUnyKRMwFwYlOUjk6MVLyEaTXGRw4LfPriB
	FxSBYe4YxurBUY2FXR7OyOBmFkg1lV/1YccJJwwq3EPu09zA/p+19lZ2JAhFLFdy
	pFwuj9pAF/81//9q8L5ZYORBYz5McAT4tJ01xB6m9MwT6u7ITFxRnQo8/55i7fy7
	p38aCy/zuXIylUskZAn/9groJVPY/nklfSx7cE2LugbvA3zjJ4M04APU5+cPEl7E
	jnTpF6PQVwEAIGQmL9B3g==
X-ME-Sender: <xms:-SxFZmLJbFR0nWQw2kNTOOGUcFn4KYJtr2WH83zzJJ0A5tFxLE97Ww>
    <xme:-SxFZuLmjZn3itRQkRvsbv2CE46zFkyWDgUMkT4UxBYR7G69AP0e8t19wz__lXAed
    Zp7k6xM0ovAO3QZ6BE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeejuddtuefhvdejvefgheduiedtheeigfevleehffdu
    udelhfekiefhheduhefgveenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:-SxFZmuykqqzXTbCa4HPtnYlXjtt0mN8Ex5UAbbDIC5RJXtpTTZPeg>
    <xmx:-SxFZraFSfajIxYvKtjwR7FE6441EkFEXucinRsBjWKDNKrA-Nzynw>
    <xmx:-SxFZtY2ez9qpnea6HDOpQTDQkFdD578P7gyd3U1rpm4Aj1LV6Cq-Q>
    <xmx:-SxFZnA56Vy738mX7sTA1VUdGVOFoTkpWPTIoX4HxY09bFn9sibgiw>
    <xmx:-SxFZvl_Qw_W4r3XPZe9UdcMK3N3r3_UKLs8VLkCi7AeAlpZKqM2yOWv>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 353AE36A0077; Wed, 15 May 2024 17:45:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <61445fe0-9137-44a6-ab36-ffb8985254df@app.fastmail.com>
In-Reply-To: <31769e8d-ab52-4f4c-84ca-2f546287d006@kernel.org>
References: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
 <20240513-boston-syscon-v1-1-93ff557d3548@flygoat.com>
 <c7317ea0-fcd6-40e0-9d90-bb1ff349c0e0@kernel.org>
 <31769e8d-ab52-4f4c-84ca-2f546287d006@kernel.org>
Date: Wed, 15 May 2024 22:44:28 +0100
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



=E5=9C=A82024=E5=B9=B45=E6=9C=8814=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:11=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 14/05/2024 11:08, Krzysztof Kozlowski wrote:
>> On 13/05/2024 20:58, Jiaxun Yang wrote:
>>> This compatible has been used in arch/mips/boot/dts/img/boston.dts
>>> for a while but never documented properly.
>>>
>>> Add it to simple syscon binding.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>>=20
>> It is documented in clock/img,boston-clock.txt. Please fix/convert/wo=
rk
>> on that.
>
> No, that's different device.
>
> Anyway, this is wrong - does no work with your second patch. Please te=
st
> them before sending.

Hi Krzysztof,

Do you mind telling dumb as me how to test bindings properly?

I tried to run make check_dtbs after applying this patch and that's all
the warnings I got:
```
arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prere=
quisite 'interrupt_provider'
/home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: /: 'model' i=
s a required property
        from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/mips/boot/dts/img/boston.dtb: /: failed to match any schema with co=
mpatible: ['img,boston']
arch/mips/boot/dts/img/boston.dtb: /cpus/cpu@0: failed to match any sche=
ma with compatible: ['img,mips']
arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000/clock: fa=
iled to match any schema with compatible: ['img,boston-clock']
/home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: uart@17ffe00=
0: $nodename:0: 'uart@17ffe000' does not match '^serial(@.*)?$'
        from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
```

I think there is no new warning introduced by this patch.
Did I miss anything here?

Thanks
- Jiaxun
>
> You need proper, dedicated schema.
>
> Best regards,
> Krzysztof

--=20
- Jiaxun

