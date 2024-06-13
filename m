Return-Path: <linux-mips+bounces-3669-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6476907CA4
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 21:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B03F1F23893
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 19:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECA0136E04;
	Thu, 13 Jun 2024 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="J+jPP3kU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E56+plvU"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE92F50;
	Thu, 13 Jun 2024 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307128; cv=none; b=R+uZHpMWqn9h4tA32ZNCfpe/yWXfQWQveB7BtsDBFkSwUESQRa8BenAGhdwoRqW5IkxCwi/xg0y0w6sVCVC0orVnQjkWhvPjHN/h8F67wHlJU9b3t49KP7oRu4Yz0gNPqMw4zFe1iQ2yM9rmRaf9oXxHotnlGKL1s6/+vNDs5XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307128; c=relaxed/simple;
	bh=7SxxRthBao7cElNlUWiApM5FlMLnMOaKyIDs5ynswf0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=pIDkRr5wChR1bk9jQpJSnKmjdLZlfbd2ywIOz/6wI9RyGaOdLacf07DqLazF8+q8nc04wpECWO6KN6e6lWrmadi97CF04Xsq3AHt+J82CwEhevh0RrBVGkKEf4NvQ4MhxLlepSRXWDg6q89N/OG0KZLMj/F4O2pSjRjASyVg6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=J+jPP3kU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E56+plvU; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1CB9A13800BB;
	Thu, 13 Jun 2024 15:32:06 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 13 Jun 2024 15:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718307126;
	 x=1718393526; bh=Qtdq9rJNyFwVn/RbNhPVjnJth7o/5tp1gNYGUREYPVw=; b=
	J+jPP3kUiQB+p0OzFv69I7crLebKK0KJTmOseeQZrgu83Emb5ApmO0mXKG42ULu7
	PlAj4D2UAM4ZD4cV6ulNdlZ7hph+1v4A6Ie+fATkwBjH3TkrHpZl6l41yqM/eBkW
	K5XoaqW2m75lCmVn289jO8lcP7QPOccSVRGnVW3cy41f7t3cIDyC5L0B7HnohqYw
	Gcvo8bOeb/tbdi37m7XNMZdBRGVupsFRatCaX48DWeFA/c/1+2AbhgDCBHhdQFOe
	/ev1H+KAISfBwRKX+X8GAXRCrll6eD1c5RRknwzllVDlRGO8+ZezkawtTsOl/7/a
	nJMRILl6UDrcqkikMX7+OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718307126; x=
	1718393526; bh=Qtdq9rJNyFwVn/RbNhPVjnJth7o/5tp1gNYGUREYPVw=; b=E
	56+plvUJ27Zj8HPv789bSPdsiRumPzds6J54ktB4SNqqK23v61XPKVOmDYHZpFrG
	ujZhP5zWC9Ytn87SMVL+FgwFtFi0h9R6bY2Ytt/0/Ots5B+PD+AdUuJtfRzHd+TZ
	ajcbSN3FyppWNR/T/JYcgiYtj3MyVWGClXXPS7kqPAuvMwD1PzVCq1fY0oaaRx8k
	iyLXF1z7uXpkgUCzhoHaMSkhgTrfo660nb/8kqsdeIAvjDJHj4qws08GiJdm9uYM
	8tGxZFXmOP6rDUL+uFMzeY8AgXjQGJqXyScyitSBZtVTUjnJXKOLOz4e7TVQXJiq
	HiHFJmAvkf0fS78fj3GTg==
X-ME-Sender: <xms:NUlrZmwu8udUXVB1tpCehjs1rbV0hfLeND86JgU-6bcZaYNnXuorUQ>
    <xme:NUlrZiToWBOKkzlGX9jaK5Tg5sYg-rZNI0GhUdG1e7h0KnLFtO6FPL5XL3xjJjvGn
    B8A-iA-XntPtIK7t-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepjedutdeuhfdvjeevgfehudeitdehiefgveelheff
    uddulefhkeeihfehudehgfevnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:NUlrZoWH-01odsK7Zl-L6Cyvx_7KHhGAMpMqUu0kmkxPq10C3H2XaQ>
    <xmx:NUlrZsidWbnC40N5cHcOCMChghCfZJzdvacF8q5YgIadXzHkgjVOTA>
    <xmx:NUlrZoCijY_ait4cLZBkx0mJQnDaj-t1eSJBSFbr4FjclinJ6njgoA>
    <xmx:NUlrZtLMM65QDsmKhc_AzoNvF3o5pcb7GYJtmtf7wQdsMe-Xvm0auQ>
    <xmx:NklrZk1b30NEU0lDy1VRCU1ixKoSHJgHzjKqattoKeOeg2UR4cRAUsD1>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7992036A0076; Thu, 13 Jun 2024 15:32:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <bbbd52c2-aaf2-4777-bee4-855d805923b5@app.fastmail.com>
In-Reply-To: <20240613190429.GA2309072-robh@kernel.org>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-6-9f8e1a07fa63@flygoat.com>
 <20240613190429.GA2309072-robh@kernel.org>
Date: Thu, 13 Jun 2024 20:31:46 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rob Herring" <robh@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: mfd: Add img,boston-platform-regs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8813=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=888:04=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jun 12, 2024 at 12:56:25PM +0100, Jiaxun Yang wrote:
>> This compatible has been used in arch/mips/boot/dts/img/boston.dts
>> for a while but never documented properly.
>>=20
>> Write a new binding for this device.
>> This also covers old img,boston-clock binding so remove that binding.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  .../devicetree/bindings/clock/img,boston-clock.txt | 31 ---------
>>  .../bindings/mfd/img,boston-platform-regs.yaml     | 74 ++++++++++++=
++++++++++
>>  2 files changed, 74 insertions(+), 31 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock=
.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
>> deleted file mode 100644
>> index 7bc5e9ffb624..000000000000
>> --- a/Documentation/devicetree/bindings/clock/img,boston-clock.txt
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Binding for Imagination Technologies MIPS Boston clock sources.
>> -
>> -This binding uses the common clock binding[1].
>> -
>> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> -
>> -The device node must be a child node of the syscon node correspondin=
g to the
>> -Boston system's platform registers.
>> -
>> -Required properties:
>> -- compatible : Should be "img,boston-clock".
>> -- #clock-cells : Should be set to 1.
>> -  Values available for clock consumers can be found in the header fi=
le:
>> -    <dt-bindings/clock/boston-clock.h>
>> -
>> -Example:
>> -
>> -	system-controller@17ffd000 {
>> -		compatible =3D "img,boston-platform-regs", "syscon";
>> -		reg =3D <0x17ffd000 0x1000>;
>> -
>> -		clk_boston: clock {
>> -			compatible =3D "img,boston-clock";
>> -			#clock-cells =3D <1>;
>> -		};
>> -	};
>> -
>> -	uart0: uart@17ffe000 {
>> -		/* ... */
>> -		clocks =3D <&clk_boston BOSTON_CLK_SYS>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platfor=
m-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-=
regs.yaml
>> new file mode 100644
>> index 000000000000..bf94de38a89f
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
> Why did you add 'simple-mfd'? That's not what is in use.
>

U-Boot needs this to probe sub-nodes such as reboot and clock :-(

I had updated dts in an earlier patch of this series.

Thanks
>>

--=20
- Jiaxun

