Return-Path: <linux-mips+bounces-8052-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A199A4A228
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 19:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B31B87A1B1A
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 18:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB81527700F;
	Fri, 28 Feb 2025 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="gRJVfSVA";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="bIst71UO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF277277005;
	Fri, 28 Feb 2025 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740768692; cv=pass; b=W4EkuPnOD1TMEqQmU62PRFHTAkfzStkj0ovEpllRG1X6jNxg/AtI0M4rrFBMbRsyIGAtV5VUmH+TkuUfjw5YjOUmQiymQ5ybca4np34Kdx6gdIxG2bTQYKVf4QojRH7Xp1onj5VB6i4242zF5GIe5R8UFWgdNS3qJKJwbU5i4/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740768692; c=relaxed/simple;
	bh=CWSgS9XJdwR2l2RX3Aso1qZio2y1aTXn9vpmWAWnbIs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dWjjmfuiEcF64aXW2BxISuWhbSgJJRp9bgKK9P1tmqwFgckEjxq55RRSSn5pB0X+NJJ7NnLU2OoBFNs3HgIkHGhltq92Mincqc/IPruUs2UTal8HmPsXp3Y7f0iPkCA3oIZgJibR3DQsx72zp9M60j4MsWyiH+pLR+ZBBHTlNTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=gRJVfSVA; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=bIst71UO; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740768674; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OAZ3ooUSoj9IZWelTJj3DkzO9MOXH6IMK5hoGOlACtnXZgQDIH9fN2ioHUS0f/0cTe
    Sg3p0bDODhsDlCQaGgFl2TqYCntE7uj5V8TTPkvAuQIir/odCtJBbJSQyD+Ct34WWgdl
    f3gOxOAE/g8UHn3t64NwfOE8Et5Fxl8s53YSBDZojJMEzglMxq8GtQ8Ui/5Qni/iwxuD
    Dj3NYiSahxQYSE72hIWQaFpheePsMCl1sRbKIMTEWBV9pItIgM8p3m1T+wq5jlgDAhF4
    mB6tyUPPeXUFXpqi6W4xiGt5Md1ggULAg7NLoWOm8vObNL+KoQLDWh5Ost6MQj6J+ybd
    LtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740768674;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=hu5mqh9J42pIB/dnWsD6fShYZzFBfeLF8CLj4v05IZg=;
    b=XiaZU9x/MmZfucBCKgLzcnqPsgt6XjW7uMTOuQ/jaXin9kn8ZMmtOCf2rTgAuaf3OV
    Si5RqdcFoxnyGxl03ZVVIIepzVueWdHPAeCnf1kvW1zEJUV4NGVAKsX+r4uq6ZlSu3SL
    PL+TdxMxO1DnmNKZ5zwXb6XLt5JRf4EQf+Z1BH+/Wb9Un/y5WH9Ei0V6xYHT7jFOpNrt
    jPIKLxCGW5tggr4y7CpBGEdbHQMafpJkIvOj8MzvR7x3tgy3YADDVr4ot5K3H+FNPxGF
    gLgilumst5xdQniZY3DpA7iEHcg2XGK9viL4nv3UN9POVRoi1jWvo78DdX2pE3Bp7ZEf
    8R2g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740768674;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=hu5mqh9J42pIB/dnWsD6fShYZzFBfeLF8CLj4v05IZg=;
    b=gRJVfSVA2vTYaRHtuc9Xh1ITLkJQ+EuxqJm1kSuJOr9QpyPgFyf6kx+FM14y4HCDbU
    fxzjfxbON0Eg/4uQIDxNy7rZ3oi7vqXG9g4XzSXA4WjBwYjOx1LOY2fUMH51kuvH4d1H
    jg5tDZWIY3ro2scQsXCJgnK/vBM8rQmOhxEKrQRFtCHRPGEXnjonUt1gd4t4k+81C+EU
    jiEr6w/OSYRk8cWnr78UwehrnKxwO5yEdQdYoZOBdLoplEAKxyvdrDNru2m+nsXVDGth
    JCcUvCVM+ayoWkmXmQgWQuKma2V6L6RB1HEgmjD1TMU8zE8aXphPnA8VHmsrxSnQ6Ayy
    nz0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740768674;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=hu5mqh9J42pIB/dnWsD6fShYZzFBfeLF8CLj4v05IZg=;
    b=bIst71UOqIgJWUhvJ8sjydSymX01PzXlU6IUXzTbk2mtO2q31JFyo723U5emcKAU37
    0VAaK+t9J0D5vEZLT9Dg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SIpDPpY
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 19:51:13 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2 4/4] pinctrl: ingenic: jz4730: add pinmux for I2S
 interface
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f1ffee11ef563d8c7486503eef3d21b8b7e2ccd9.camel@crapouillou.net>
Date: Fri, 28 Feb 2025 19:51:03 +0100
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Paul Boddie <paul@boddie.org.uk>,
 Tim Bysun <tim.bysun@ingenic.com>,
 linux-gpio@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <230B1328-40F2-49F4-BA4E-7BFC3456383F@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
 <1d50f0c980155dd22ccd164a6d281e3ac68e7446.1740749637.git.hns@goldelico.com>
 <f1ffee11ef563d8c7486503eef3d21b8b7e2ccd9.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Paul and Conor,

> Am 28.02.2025 um 19:26 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le vendredi 28 f=C3=A9vrier 2025 =C3=A0 14:33 +0100, H. Nikolaus =
Schaller a
> =C3=A9crit :
>> I2S is used for the sound codec of the Alpha400.
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 08e082e84f5c6..6d7dc077c373e 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -209,10 +209,14 @@ static int jz4730_nand_cs4_pins[] =3D { 0x56, =
};
>>  static int jz4730_nand_cs5_pins[] =3D { 0x57, };
>>  static int jz4730_pwm_pwm0_pins[] =3D { 0x5e, };
>>  static int jz4730_pwm_pwm1_pins[] =3D { 0x5f, };
>> -
>=20
> Just a nit - but you remove a blank line in patch 4/4 that was added =
in
> 3/4, better not add it in the first place :)

Ah, sometimes this gets missed.

>=20
> That's the only comment I have on the whole patchset, so either fix it
> in a v3 while adding my review tag, or maybe Linus can do it when
> applying the patchset.

I'll send a V3 tomorrow together with Conor's comment/fix for 1/4.

BR and thanks,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>>  static int jz4730_mii_pins[] =3D { 0x70, 0x71, 0x72, 0x73, 0x74, =
0x75,
>> 0x76,
>>   0x77, 0x78, 0x19, 0x7a, 0x1b, 0x7c,
>> };
>> =20
>> +static int jz4730_i2s_mclk_pins[] =3D { 0x44, };
>> +static int jz4730_i2s_acreset_pins[] =3D { 0x45, };
>> +static int jz4730_i2s_data_pins[] =3D { 0x46, 0x47, };
>> +static int jz4730_i2s_clock_pins[] =3D { 0x4d, 0x4e, };
>> +
>>  static u8 jz4730_lcd_8bit_funcs[] =3D { 1, 1, 1, 1, 1, 1, 1, 1, 2, =
2,
>> 2, };
>> =20
>>  static const struct group_desc jz4730_groups[] =3D {
>> @@ -235,6 +239,11 @@ static const struct group_desc jz4730_groups[] =3D=

>> {
>>   INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
>>   INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
>>   INGENIC_PIN_GROUP("mii", jz4730_mii, 1),
>> + INGENIC_PIN_GROUP("i2s-mclk-out", jz4730_i2s_mclk, 1),
>> + INGENIC_PIN_GROUP("i2s-acreset", jz4730_i2s_acreset, 1),
>> + INGENIC_PIN_GROUP("i2s-data", jz4730_i2s_data, 1),
>> + INGENIC_PIN_GROUP("i2s-master", jz4730_i2s_clock, 1),
>> + INGENIC_PIN_GROUP("i2s-slave", jz4730_i2s_clock, 2),
>>  };
>> =20
>>  static const char *jz4730_mmc_groups[] =3D { "mmc-1bit", "mmc-4bit",
>> };
>> @@ -251,6 +260,7 @@ static const char *jz4730_nand_groups[] =3D {
>>  static const char *jz4730_pwm0_groups[] =3D { "pwm0", };
>>  static const char *jz4730_pwm1_groups[] =3D { "pwm1", };
>>  static const char *jz4730_mii_groups[] =3D { "mii", };
>> +static const char *jz4730_i2s_groups[] =3D { "i2s-data", =
"i2s-master",
>> "i2s-slave", };
>> =20
>>  static const struct function_desc jz4730_functions[] =3D {
>>   INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
>> @@ -263,6 +273,7 @@ static const struct function_desc
>> jz4730_functions[] =3D {
>>   INGENIC_PIN_FUNCTION("pwm0", jz4730_pwm0),
>>   INGENIC_PIN_FUNCTION("pwm1", jz4730_pwm1),
>>   INGENIC_PIN_FUNCTION("mii", jz4730_mii),
>> + INGENIC_PIN_FUNCTION("i2s", jz4730_i2s),
>>  };
>> =20
>>  static const struct ingenic_chip_info jz4730_chip_info =3D {
>=20


