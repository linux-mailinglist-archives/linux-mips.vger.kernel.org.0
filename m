Return-Path: <linux-mips+bounces-7996-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB47A46C18
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 21:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929A116C1A0
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 20:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163362755F6;
	Wed, 26 Feb 2025 20:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="WSOgHRdG";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="ttIj/9tj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C22755E8;
	Wed, 26 Feb 2025 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740600600; cv=pass; b=F//DStEYhsh5lA4MH2Et2E7T9t911MYFRL1WWizk+IffW4VDY+BGiUUBpG6A9baQdatmGpUVDjOIW554kKmYHHVhp1wxSTXMFlLAXyhOwilD2J/0RnaK555XCcx5kEZ8pr+iE8anIgH9PwwK3YKcVviGqvbB8ah0RknICvyDPQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740600600; c=relaxed/simple;
	bh=mLir7XwBspBdDwsD/s9G81odxFhscf7wYuOasgJF8Ww=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mWnpbSu3cDKyX0aoQEydJTEfLntD/CWxaVWrH8SRmnmyxjG0vzfDOxhbfkeQQGQLsJaZNvBEC7ntKevqj6Swx/lLEhE50Cv4jLJp43IpVxmqSRstySdPevZE/nTUPT2ueBaNMKQ/CCQEgPWDvs90RXXOoYNIH6Yxs8rgYhBNeSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=WSOgHRdG; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=ttIj/9tj; arc=pass smtp.client-ip=85.215.255.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740600591; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q/DeuSUgJPhpiuo/9S77eV8SkZQoVeHMUj3y3LpLMRsztr6vYWuCRVSTLdnH/a8yA3
    6nRF3EOg2pQmlD4P4X//6QztLwzJH9B7+/bdwJza+8nToUvuvsVi6r7+cM9fUzK4WU1g
    GlM76kbay0ocSsBZRkCTNX0GdC7F2OScvuh8Va60N6KFImNmszrsIvNfkBz0tlvhe57u
    IMhIml1vuX7yU6cx8Fk6M4yKukZJdOjciNGQkwZyAyqqddKW2DHn3XECJrC27Ogk0zCs
    EwsBluzH0sdi3T/ehPAZPASqexc3NMFop4KdWLsJEJ1zeAAkkreApAq1Ncfk/TqqDReM
    BXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740600591;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=mLir7XwBspBdDwsD/s9G81odxFhscf7wYuOasgJF8Ww=;
    b=hqLQbvM2WvUmuYVnrZ/ofqYJ1Ftf0arUeOV46U0p2+WtL6U0S2CtvCTqctwdz3rJpJ
    aVyfSYi8fAoH59KX18Bg/Q0slNbsO4l2vtTSMd8YcNcBAIsLCb4BDEUclLFT1JIh1MLG
    Iyid5xog3gdsPzOIVU71569hwYmTz+jBZrDAfRe0gcdikrhJFhdgewyfFqcITGwJRanR
    7taeMkHVnsyTT9XYOF7xcqxbsHXxXcG4edcG3lxI2y9LX5nnzH0bmquxThB6fOAmd7RY
    UWs9c/WHkwF8nGU91+WhnCgNlrx0rVnyU2VGm+VjTxUlTGx3KjvIF80nICwAKs5cjLnZ
    Ddvg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740600591;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=mLir7XwBspBdDwsD/s9G81odxFhscf7wYuOasgJF8Ww=;
    b=WSOgHRdGNOi8frT1q0qgQWxOcYzSNdl1disTsr1Gyl1FmDVwxCLYm9nUKNERUgcbde
    GoXDQVaBNZb/CB5jm1wTcpBoIYiOsHgPUSDITqGQqrpWa7aZEvaMZoEEG8NAZMv0imF/
    t76U6PpHJSIe25e7FPdc0xTlQkqI5ckQCS5ljCOqDNAA8eMtjL6ThtYZ5X53z0wZkrZV
    GUnSKoLxOGESqAdjq5mdXkYSD3Z64PT2lj9zdHSMoBgCTpDhVmK3doE7YT4f+pAHzGsr
    yLyPAjwCyU1YZHujPk9zvd0V4uSgDXXVXDhzNconm49whFLq+WYTnasSvH0xgBVbU3Me
    gnVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740600591;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=mLir7XwBspBdDwsD/s9G81odxFhscf7wYuOasgJF8Ww=;
    b=ttIj/9tj3DTWbUc5eJsYVZ9MN7QEl5igNYyqQL+pGl0Ok+NoF0mGgG6o0B9kBrlFhd
    DuuedRbacP2F4vIBXxBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QK9oiOH
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 21:09:50 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 2/4] pinctrl: ingenic: add x1600 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1D2A7741-EFC1-4144-B2E8-C5707BBF9A93@goldelico.com>
Date: Wed, 26 Feb 2025 21:09:39 +0100
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Tim Bysun <tim.bysun@ingenic.com>,
 linux-gpio@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4FCA3DA-67C9-4553-8506-4EC5AC81E3D0@goldelico.com>
References: <cover.1740590093.git.hns@goldelico.com>
 <f633a14ccafc596e4611a1fae3e1c958ddfac2dc.1740590093.git.hns@goldelico.com>
 <627ed9f29819e42e8efa449d87eb2ddbc6acb8a1.camel@crapouillou.net>
 <1D2A7741-EFC1-4144-B2E8-C5707BBF9A93@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi all,

> Am 26.02.2025 um 20:42 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Paul,
>=20
>> Am 26.02.2025 um 19:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Hi Nikolaus, and everyone involved,
>>=20
>> Le mercredi 26 f=C3=A9vrier 2025 =C3=A0 18:16 +0100, H. Nikolaus =
Schaller a
>> =C3=A9crit :
>>> From: Paul Boddie <paul@boddie.org.uk>
>>>=20
>>> Add support for the Lumissil/Ingenic X1600 SoC.
>>>=20
>>> It uses shadow registers to commit changes to multiple pinctrl
>>> registers in parallel.
>>>=20
>>> Define specific Chip ID, register offsets, pin tables etc.
>>>=20
>>> Handling the unique X1600_GPIO_PU only for the x1600 but
>>> not for x1830 and above must be carefully taken into account.
>>>=20
>>> Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
>>> Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> drivers/pinctrl/pinctrl-ingenic.c | 242
>>> +++++++++++++++++++++++++++++-
>>> 1 file changed, 240 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
>>> b/drivers/pinctrl/pinctrl-ingenic.c
>>> index bc7ee54e062b5..dfdc89ece9b8a 100644
>>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>>=20

...

>>> +static int x1600_pwm_pwm0_pins[] =3D { 0x40, };
>>> +static int x1600_pwm_pwm1_pins[] =3D { 0x41, };
>>> +static int x1600_pwm_pwm2_pins[] =3D { 0x42, };
>>> +static int x1600_pwm_pwm3_pins[] =3D { 0x58, };
>>> +static int x1600_pwm_pwm4_pins[] =3D { 0x59, };
>>> +static int x1600_pwm_pwm5_pins[] =3D { 0x33, 0x5a, };
>>> +static int x1600_pwm_pwm6_pins[] =3D { 0x29, 0x34, };
>>> +static int x1600_pwm_pwm7_pins[] =3D { 0x2a, 0x35, };
>>=20
>> Just a quick question about these ones: why are there 2 pins here? If
>> you have the PWM5/6/7 function on two different pins then you should
>> probably have two groups.
>=20
> I think they are added through INGENIC_PIN_GROUP_FUNCS()
> to x1600_groups[].
>=20
> So the pins list is different from pwm0 to 4 which
> uses INGENIC_PIN_GROUP().

I have now checked with the programming manual.

Yes, pwm5 to pwm7 can be pinmuxed to different pads,
while pwm0 to pwm4 have only one option.

E.g. pwm5: PC26 in function 1 or PB19 in function 2.

This is simular to what we have with uart2-data-a and
uart2-data-b.

So I tend to agree that we need different pin groups
("pwm5-a", "pwm5-b") and no need to use INGENIC_PIN_GROUP_FUNCS().

Maybe we didn't realize since we have not yet used PWM in
any x1600 based device.

...

>>> +static int x1600_pwm_pwm5_funcs[] =3D { 2, 1, };
>>> +static int x1600_pwm_pwm6_funcs[] =3D { 1, 2, };
>>> +static int x1600_pwm_pwm7_funcs[] =3D { 1, 2, };
>>> +
>>> +static const struct group_desc x1600_groups[] =3D {
>>> + INGENIC_PIN_GROUP("uart0-data", x1600_uart0_data, 0),
>>> + INGENIC_PIN_GROUP("uart0-hwflow", x1600_uart0_hwflow, 0),
>>> + INGENIC_PIN_GROUP("uart1-data", x1600_uart1_data, 1),
>>> + INGENIC_PIN_GROUP("uart1-hwflow", x1600_uart1_hwflow, 1),
>>> + INGENIC_PIN_GROUP("uart2-data-a", x1600_uart2_data_a, 2),
>>> + INGENIC_PIN_GROUP("uart2-data-b", x1600_uart2_data_b, 1),
>>> + INGENIC_PIN_GROUP("uart3-data-b", x1600_uart3_data_b, 0),
>>> + INGENIC_PIN_GROUP("uart3-data-d", x1600_uart3_data_d, 2),

...

>>> + INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
>>> + INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
>>> + INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
>>> + INGENIC_PIN_GROUP("pwm3", x1600_pwm_pwm3, 1),
>>> + INGENIC_PIN_GROUP("pwm4", x1600_pwm_pwm4, 1),
>>> + INGENIC_PIN_GROUP_FUNCS("pwm5", x1600_pwm_pwm5,
>>> x1600_pwm_pwm5_funcs),
>>> + INGENIC_PIN_GROUP_FUNCS("pwm6", x1600_pwm_pwm6,
>>> x1600_pwm_pwm6_funcs),
>>> + INGENIC_PIN_GROUP_FUNCS("pwm7", x1600_pwm_pwm7,
>>> x1600_pwm_pwm7_funcs),
>>> + INGENIC_PIN_GROUP("mac", x1600_mac, 1),
>>> +};
>>> +

If Paul Boddie agrees, I will add it to the V2.

BR and thanks,
Nikolaus


