Return-Path: <linux-mips+bounces-3739-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FA90E92E
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 13:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09B83B22CB4
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 11:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACC2139CEC;
	Wed, 19 Jun 2024 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="GAJvqYF9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a8FZfWAN"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525A80BF2;
	Wed, 19 Jun 2024 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796079; cv=none; b=SUz9Mv7dU7nvR2KnkyZPldhvCikJ9nsdsAsbD4C3pUVxIeHAYU44JMu/vTvbNsENmUjgiLTiYErDj1LMkmipb4m0K4VYSCodA8Y27M68GWGddHJhc7vkw1dhLDDR/PARvVm9NbyGF8mVRqS+vOz5AK28KYUZiPa2hrCkU70k7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796079; c=relaxed/simple;
	bh=lJag+1fbrwMQnztvg/igMdKn97ngrF8e0mxi4S1uu/c=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TWaDo9Nj4TWzdz4kIb7Ij6dMV33Z4gnqC1dyrslQASZyoauKF4at2vS/yIlwFzxmK7cBTouVkU2g2MnO+M2/6epSSIjdsBcGXQVbVhd3J8SsnBrFzu8hyusuEdzu3hcqi8SwHBQds9c8SoSByCHrGgCA8mL1Nkuh+LSjnNGC8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=GAJvqYF9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a8FZfWAN; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 105EC114031A;
	Wed, 19 Jun 2024 07:21:17 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 19 Jun 2024 07:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718796077;
	 x=1718882477; bh=oCiDfMfoIx8Dknjet+/zotUclsMguSAJKG9ERhmW2JY=; b=
	GAJvqYF9N4U2gKO36Snlr8Dedf0GRL9jCkugya0Fe8/Tah3ti5GmN7gMmggvZhIQ
	31UaYc5gU7Jqw1yeyTxCUWQQMyjQb2t/zjTeWIvJCCVhK5uD5voAPgHYe3+0KQzH
	bAmYnv6fVXbublfRbPXc/lq9+oDqPyGzXwbqA673/zf8+qK0FY/Wff0rmlCD3VX5
	5LnPU9GKoUFYrytgUFgbzJ45SDeVk2vNS4TR6uMLc8HJudCOSNi3mi9MQxHNw2xa
	S3zfTqRTNoBqk8cNRTD4InrmPA5dq44C3EhVN7wUSqeO/xOYZ2JznaobfRU9nbBB
	JbGepX/IZZ3W7MFx6wfq8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718796077; x=
	1718882477; bh=oCiDfMfoIx8Dknjet+/zotUclsMguSAJKG9ERhmW2JY=; b=a
	8FZfWANd2zWXqwwFt3YxIowcsfclQqnRb5U0qRfwfbPoHIXFaaNCRTbirAlOa9i1
	AS0NrFE3VKcKOg1QbhJWnynJl4taN/GlxagmBMMaMIofLTakHeJ7+Ywrlrme8i7s
	yvB3VstHkauf6poGe8xPr1ESN9ipy6mvsUXthmYYnflF6L2OsThcf7BAQLgN2tsO
	YEfz2SSWu9q3+PVsAFYafwfx07aVU+McJM0ZleioPbqTaOB/IJpNz/Jn37muAANo
	n+S0nZ/xLrK1qKBAS8O1HJVQ2KT9FMitfYzlLC1bI/ZlpMe6sotHEtagYesH3Ze/
	YKphkjhUz5jYkqrD0WTfw==
X-ME-Sender: <xms:LL9yZmRBWlx1EMSyRq9B_-Jnw5vQNE0pZCCpsfd23Vt148V_44hNzw>
    <xme:LL9yZrzLU7HopX-N80gNXRd8VF9jw51WYxiDIhOFOdxYENYjnUo88yqBYT3OyOTDz
    SKup4rRWrO9sXo0PEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeejuddtuefhvdejvefgheduiedtheeigfevleehffdu
    udelhfekiefhheduhefgveenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:LL9yZj3_aJp9ayHcLEU8YPBz5VRGhHe3enAPUHTTmo3TDrS-EdZw7w>
    <xmx:LL9yZiDnJIsbOKtNbH6YUXekR_CaXY0iYoARMfMeaFAf72wh1rnweA>
    <xmx:LL9yZvjsIHTYGeTxnzYddUA4zgaR9d6LtLhJPeUTBkYkQHrd6SHBbw>
    <xmx:LL9yZupRcgy92XrFpgUmx7s5PiLGMd94TApP67Om5_XfK3l7FyC7CA>
    <xmx:Lb9yZuMPwnULgUULO3IkDctHnf4IgquLUoKPnPlHYqrbBPv7tzWpVa3D>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C015936A0075; Wed, 19 Jun 2024 07:21:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
In-Reply-To: <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
Date: Wed, 19 Jun 2024 12:20:54 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8819=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:28=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 18/06/2024 17:11, Jiaxun Yang wrote:
>> This compatible has been used in arch/mips/boot/dts/img/boston.dts
>> for a while but never documented properly.
>>=20
>
>> diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platfor=
m-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-=
regs.yaml
>> new file mode 100644
>> index 000000000000..79cae87c6758
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.=
yaml
>> @@ -0,0 +1,74 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/img,boston-platform-regs.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Imagination Technologies Boston Platform Registers
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: img,boston-platform-regs
>> +      - const: syscon
>> +      - const: simple-mfd
>
>
> Fix U-boot to populate devices instead of relying on simple-mfd.

Hi Krzysztof,

I believe U-Boot's implementation is correct. As per simple-mfd binding:

```
simple-mfd" - this signifies that the operating system should
  consider all subnodes of the MFD device as separate devices akin to how
  "simple-bus" indicates when to see subnodes as children for a simple
  memory-mapped bus.
```

This reads to me as "if you want sub nodes to be populated as devices
you need this."

In our case there are "clock" and "reset" node sub nodes which should be
probed as regular device, so it's true for us.

Linux managed to work without "simple-mfd" only because clock subsystem
is bypassing regular OF population process. Semantically we need this.

Besides Linux as upstream of devicetree source had accepted U-Boot
only stuff here, such as "bootph-all" property.

Thanks
- Jiaxun
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clock-controller:
>> +    type: object
>> +
>> +    description: Boston Clock Controller Device Node
>> +      The clock consumer should specify the desired clock by having =
the clock
>> +      ID in its "clocks" phandle cell.
>> +      See include/dt-bindings/clock/boston-clock.h for the full list=
 of boston
>> +      clock IDs.
>> +
>> +    properties:
>> +      "#clock-cells":
>> +        const: 1
>> +
>> +      compatible:
>> +        const: img,boston-clock
>
> Please put compatible first in the list of properties (and follow the
> same order in "required"). It's the most important piece, so we want it
> to be the first to see. It also follows the convention of DTS, where
> compatible is expected to be first.
>
>> +
>> +    required:
>> +      - "#clock-cells"
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>> +  reboot:
>> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
>
>
> Best regards,
> Krzysztof

--=20
- Jiaxun

