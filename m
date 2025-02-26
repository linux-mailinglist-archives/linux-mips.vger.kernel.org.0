Return-Path: <linux-mips+bounces-7995-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D5A46B53
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 20:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9D053A84BF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 19:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C79A2561CB;
	Wed, 26 Feb 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="bgo5mc4e";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="hLC8POc5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC1254B0D;
	Wed, 26 Feb 2025 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740599135; cv=pass; b=K7DA9NdlBPP6Nwz7iK8SvyStsLhp7ZLQkvJgdtxz/CnQcLGH6btXB0Trsdx7E+/p0bTBvFL0lU/npKjREVW0hN6IgWoZIkSmpFpeMRIGpUXiWVJH2QhDSLegyRE83cuHRhwNIYIjcV4G3rcUmzFzHAhs4AK2mjgPfBXpKpTVo/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740599135; c=relaxed/simple;
	bh=RYQCNGKuP1EXs5WFyDeGmrRauSi8ya0jz/61QAZrDbI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sqbA1OAajGo0V2DI2aTP8uaMqiM+tz+rv35PYhLhBXllvy/DA18MlqieUSmLtjg/xfMFluk5miShoixO+ikYqUkWP+48D5hfe5z6tKi7CPBlnDI2rizcZn755D032d5fEvS8rk7lEiek97E6HSzjH8oz8CLl3rKx4nnKAvpcbHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=bgo5mc4e; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=hLC8POc5; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740598948; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gAcdg5F3j8tQYFVhjKM6lsWyJIFo0fBY3zuhNPsur/0PD93DqSl2PNgH3HvF5v/HfF
    rHwGrk6cSTkSzDAN3LiWITfkHg5669N9W+mDONbWTswvMA6Yssyx9D+8rJ+c/COrfpMu
    gCsomL24pQ3xEorR+5e+z/D5AJW/re0J7EmhFHA04gY86rLlacVQfNP83nfBZMKDtUax
    R7rc1WEk7heW3ZX44mIPP8vfomCbGyzjPneYU/LgUZwLFXNBYirIyd2PEKkA4D27OHa5
    lCHUyKpOHfOnjVYEB8nTFIHGRrRpmYPFYY5PdCkzwY209aO7d7Vugh5R5FHEeO+a9mxI
    hhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740598948;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=R5f4mPWNMYa3jvP8E4nC8FlbQ8ap1CDhL0ncKggZ6Cw=;
    b=WLt6ab+P5tGC+UqV9ypZgjqAmEyGV7YdVTuD1Y/mBrCYYkpb+IPIPFu7QWnDIO00xm
    /qE/qcK45/Y03pcsmyFMN6tYdBDRAkNBV2rUUOjNp21b1Hk7GVyxl0pIhiOqc7UfMtQm
    J9ucYkddNy9ZsyEhEOgXKWPswIosqvDNmTQguYeqxtnOcZ5BrIdkkU+vWqwND8UtX7jT
    Gnja6aEj6O6BeiEgJZQSt/PO3URA3ju/jsXvjoV1arhMFRODJXMANoWAiUJy4Z4dzV4i
    oawCoHQe9FxdC0Rl8ivE9mAgQkbZaM6yzaOWVbFf0PxX/kNR6mPQjMyP8CmuhkCAULmo
    xMAQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740598948;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=R5f4mPWNMYa3jvP8E4nC8FlbQ8ap1CDhL0ncKggZ6Cw=;
    b=bgo5mc4eMFQ32o7ofct7xcW4LSr4aa409WaxMln67qaxxbAMod1O3n+fsmTKKdNfO+
    /s2QjpNbQPiPetXom1nNVleCnuxlawPrsQ+EmuFDdoy1pAJCTAZDVZPDFz9m6wkSmPzK
    sxdckV8WteNSSuGei9LKyF0ejTLZNd+GT3jb6Nd0ETObqIkuxEGBx2bATEWzNp73Cz79
    5a87vrgjMNNJNicbf48cUw533iMPAtVWMcT1AQaitBYXzP4wXpE/MOYskS3edBVAtlbT
    3IOTD5VC2TBrKclk+qE8/786bJRWckwIsR+6uYnQ0XDnyJdQOSNyUw7ky5QECNfTY4tY
    GnaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740598948;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=R5f4mPWNMYa3jvP8E4nC8FlbQ8ap1CDhL0ncKggZ6Cw=;
    b=hLC8POc5uHNCS6sHT7SPbgK0w9q+BNgGiI9lQ+87ywS5noXxdTwB4XcBHt/3F+MaYQ
    1Vjl65kNbEnPxJ85p0BA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSj5pclMiNMZF+m+5OQHpi5J5qjcB/gTWSZCs="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.23 AUTH)
    with ESMTPSA id Qe5b2211QJgQhvk
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 20:42:26 +0100 (CET)
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
In-Reply-To: <627ed9f29819e42e8efa449d87eb2ddbc6acb8a1.camel@crapouillou.net>
Date: Wed, 26 Feb 2025 20:42:16 +0100
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
Message-Id: <1D2A7741-EFC1-4144-B2E8-C5707BBF9A93@goldelico.com>
References: <cover.1740590093.git.hns@goldelico.com>
 <f633a14ccafc596e4611a1fae3e1c958ddfac2dc.1740590093.git.hns@goldelico.com>
 <627ed9f29819e42e8efa449d87eb2ddbc6acb8a1.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Paul,

> Am 26.02.2025 um 19:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus, and everyone involved,
>=20
> Le mercredi 26 f=C3=A9vrier 2025 =C3=A0 18:16 +0100, H. Nikolaus =
Schaller a
> =C3=A9crit :
>> From: Paul Boddie <paul@boddie.org.uk>
>>=20
>> Add support for the Lumissil/Ingenic X1600 SoC.
>>=20
>> It uses shadow registers to commit changes to multiple pinctrl
>> registers in parallel.
>>=20
>> Define specific Chip ID, register offsets, pin tables etc.
>>=20
>> Handling the unique X1600_GPIO_PU only for the x1600 but
>> not for x1830 and above must be carefully taken into account.
>>=20
>> Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
>> Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 242
>> +++++++++++++++++++++++++++++-
>>  1 file changed, 240 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index bc7ee54e062b5..dfdc89ece9b8a 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -3,7 +3,7 @@
>>   * Ingenic SoCs pinctrl driver
>>   *
>>   * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
>> - * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
>> + * Copyright (c) 2017, 2019, 2020, 2023 Paul Boddie
>> <paul@boddie.org.uk>
>>   * Copyright (c) 2019, 2020 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie)
>> <zhouyanjie@wanyeetech.com>
>>   */
>> =20
>> @@ -58,6 +58,8 @@
>>  #define JZ4770_GPIO_FLAG 0x50
>>  #define JZ4770_GPIO_PEN 0x70
>> =20
>> +#define X1600_GPIO_PU 0x80
>> +
>>  #define X1830_GPIO_PEL 0x110
>>  #define X1830_GPIO_PEH 0x120
>>  #define X1830_GPIO_SR 0x150
>> @@ -112,6 +114,7 @@ enum jz_version {
>>   ID_JZ4780,
>>   ID_X1000,
>>   ID_X1500,
>> + ID_X1600,
>>   ID_X1830,
>>   ID_X2000,
>>   ID_X2100,
>> @@ -162,6 +165,7 @@ static const unsigned long enabled_socs =3D
>>   IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
>>   IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
>>   IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
>> + IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
>>   IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>   IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>>   IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>> @@ -2351,6 +2355,231 @@ static const struct ingenic_chip_info
>> x1500_chip_info =3D {
>>   .access_table =3D &x1000_access_table,
>>  };
>> =20
>> +static const u32 x1600_pull_ups[4] =3D {
>> + 0xffffffff, 0xdffbf7bf, 0x987e0000, 0x0000003f,
>> +};
>> +
>> +static const u32 x1600_pull_downs[4] =3D {
>> + 0x00000000, 0x00000000, 0x07000007, 0x00000000,
>> +};
>> +
>> +static int x1600_uart0_data_pins[] =3D { 0x27, 0x28, };
>> +static int x1600_uart0_hwflow_pins[] =3D { 0x29, 0x2a, };
>> +static int x1600_uart1_data_pins[] =3D { 0x23, 0x22, };
>> +static int x1600_uart1_hwflow_pins[] =3D { 0x25, 0x24, };
>> +static int x1600_uart2_data_a_pins[] =3D { 0x1f, 0x1e, };
>> +static int x1600_uart2_data_b_pins[] =3D { 0x21, 0x20, };
>> +static int x1600_uart3_data_b_pins[] =3D { 0x25, 0x24, };
>> +static int x1600_uart3_data_d_pins[] =3D { 0x65, 0x64, };
>> +static int x1600_sfc_pins[] =3D { 0x53, 0x54, 0x55, 0x56, 0x51, =
0x52,
>> 0x24, };
>> +static int x1600_ssi_dt_a_pins[] =3D { 0x1e, };
>> +static int x1600_ssi_dt_b_pins[] =3D { 0x2d, };
>> +static int x1600_ssi_dr_a_pins[] =3D { 0x1d, };
>> +static int x1600_ssi_dr_b_pins[] =3D { 0x2e, };
>> +static int x1600_ssi_clk_a_pins[] =3D { 0x1f, };
>> +static int x1600_ssi_clk_b_pins[] =3D { 0x2c, };
>> +static int x1600_ssi_ce0_a_pins[] =3D { 0x1c, };
>> +static int x1600_ssi_ce0_b_pins[] =3D { 0x31, };
>> +static int x1600_ssi_ce1_a_pins[] =3D { 0x22, };
>> +static int x1600_ssi_ce1_b_pins[] =3D { 0x30, };
>> +static int x1600_mmc0_1bit_b_pins[] =3D { 0x2c, 0x2d, 0x2e, };
>> +static int x1600_mmc0_4bit_b_pins[] =3D { 0x2f, 0x30, 0x31, };
>> +static int x1600_mmc0_1bit_c_pins[] =3D { 0x51, 0x53, 0x54, };
>> +static int x1600_mmc0_4bit_c_pins[] =3D { 0x56, 0x55, 0x52, };
>> +static int x1600_mmc1_1bit_pins[] =3D { 0x60, 0x61, 0x62, };
>> +static int x1600_mmc1_4bit_pins[] =3D { 0x63, 0x64, 0x65, };
>> +static int x1600_i2c0_a_pins[] =3D { 0x1d, 0x1c, };
>> +static int x1600_i2c0_b_pins[] =3D { 0x3f, 0x3e, };
>> +static int x1600_i2c1_b_15_pins[] =3D { 0x30, 0x2f, };
>> +static int x1600_i2c1_b_19_pins[] =3D { 0x34, 0x33, };
>> +static int x1600_i2s_data_tx_pins[] =3D { 0x39, };
>> +static int x1600_i2s_data_rx_pins[] =3D { 0x35, };
>> +static int x1600_i2s_clk_rx_pins[] =3D { 0x37, 0x38, };
>> +static int x1600_i2s_clk_tx_pins[] =3D { 0x3b, 0x3c, };
>> +static int x1600_i2s_sysclk_pins[] =3D { 0x36, 0x3a, };
>> +
>> +static int x1600_cim_pins[] =3D {
>> + 0x14, 0x16, 0x15, 0x18, 0x13,
>> + 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
>> +};
>> +
>> +static int x1600_slcd_8bit_pins[] =3D {
>> + 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
>> + 0x17, 0x19, 0x1a, 0x1b,
>> +};
>> +
>> +static int x1600_slcd_16bit_pins[] =3D {
>> + 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
>> +};
>> +
>> +static int x1600_lcd_16bit_pins[] =3D {
>> + 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
>> + 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
>> + 0x18, 0x19, 0x1a, 0x1b,
>> +};
>> +
>> +static int x1600_lcd_18bit_pins[] =3D {
>> + 0x10, 0x11,
>> +};
>> +
>> +static int x1600_lcd_24bit_pins[] =3D {
>> + 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
>> +};
>> +
>> +static int x1600_pwm_pwm0_pins[] =3D { 0x40, };
>> +static int x1600_pwm_pwm1_pins[] =3D { 0x41, };
>> +static int x1600_pwm_pwm2_pins[] =3D { 0x42, };
>> +static int x1600_pwm_pwm3_pins[] =3D { 0x58, };
>> +static int x1600_pwm_pwm4_pins[] =3D { 0x59, };
>> +static int x1600_pwm_pwm5_pins[] =3D { 0x33, 0x5a, };
>> +static int x1600_pwm_pwm6_pins[] =3D { 0x29, 0x34, };
>> +static int x1600_pwm_pwm7_pins[] =3D { 0x2a, 0x35, };
>=20
> Just a quick question about these ones: why are there 2 pins here? If
> you have the PWM5/6/7 function on two different pins then you should
> probably have two groups.

I think they are added through INGENIC_PIN_GROUP_FUNCS()
to x1600_groups[].

So the pins list is different from pwm0 to 4 which
uses INGENIC_PIN_GROUP().

But Paul Boddie should know even better than me.
>=20
> The rest looks OK.
>=20
> Cheers,
> -Paul

Best regards and thanks,
Nikolaus

>=20
>> +
>> +static int x1600_mac_pins[] =3D {
>> + 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
>> +};
>> +
>> +static int x1600_sfc_funcs[] =3D { 0, 0, 0, 0, 0, 0, 2, };
>> +
>> +static int x1600_pwm_pwm5_funcs[] =3D { 2, 1, };
>> +static int x1600_pwm_pwm6_funcs[] =3D { 1, 2, };
>> +static int x1600_pwm_pwm7_funcs[] =3D { 1, 2, };
>> +
>> +static const struct group_desc x1600_groups[] =3D {
>> + INGENIC_PIN_GROUP("uart0-data", x1600_uart0_data, 0),
>> + INGENIC_PIN_GROUP("uart0-hwflow", x1600_uart0_hwflow, 0),
>> + INGENIC_PIN_GROUP("uart1-data", x1600_uart1_data, 1),
>> + INGENIC_PIN_GROUP("uart1-hwflow", x1600_uart1_hwflow, 1),
>> + INGENIC_PIN_GROUP("uart2-data-a", x1600_uart2_data_a, 2),
>> + INGENIC_PIN_GROUP("uart2-data-b", x1600_uart2_data_b, 1),
>> + INGENIC_PIN_GROUP("uart3-data-b", x1600_uart3_data_b, 0),
>> + INGENIC_PIN_GROUP("uart3-data-d", x1600_uart3_data_d, 2),
>> + INGENIC_PIN_GROUP_FUNCS("sfc", x1600_sfc, x1600_sfc_funcs),
>> + INGENIC_PIN_GROUP("ssi-dt-a", x1600_ssi_dt_a, 0),
>> + INGENIC_PIN_GROUP("ssi-dt-b", x1600_ssi_dt_b, 1),
>> + INGENIC_PIN_GROUP("ssi-dr-a", x1600_ssi_dr_a, 0),
>> + INGENIC_PIN_GROUP("ssi-dr-b", x1600_ssi_dr_b, 1),
>> + INGENIC_PIN_GROUP("ssi-clk-a", x1600_ssi_clk_a, 0),
>> + INGENIC_PIN_GROUP("ssi-clk-b", x1600_ssi_clk_b, 1),
>> + INGENIC_PIN_GROUP("ssi-ce0-a", x1600_ssi_ce0_a, 0),
>> + INGENIC_PIN_GROUP("ssi-ce0-b", x1600_ssi_ce0_b, 1),
>> + INGENIC_PIN_GROUP("ssi-ce1-a", x1600_ssi_ce1_a, 2),
>> + INGENIC_PIN_GROUP("ssi-ce1-b", x1600_ssi_ce1_b, 1),
>> + INGENIC_PIN_GROUP("mmc0-1bit-b", x1600_mmc0_1bit_b, 0),
>> + INGENIC_PIN_GROUP("mmc0-4bit-b", x1600_mmc0_4bit_b, 0),
>> + INGENIC_PIN_GROUP("mmc0-1bit-c", x1600_mmc0_1bit_c, 1),
>> + INGENIC_PIN_GROUP("mmc0-4bit-c", x1600_mmc0_4bit_c, 1),
>> + INGENIC_PIN_GROUP("mmc1-1bit", x1600_mmc1_1bit, 0),
>> + INGENIC_PIN_GROUP("mmc1-4bit", x1600_mmc1_4bit, 0),
>> + INGENIC_PIN_GROUP("i2c0-data-a", x1600_i2c0_a, 2),
>> + INGENIC_PIN_GROUP("i2c0-data-b", x1600_i2c0_b, 0),
>> + INGENIC_PIN_GROUP("i2c1-data-b-15", x1600_i2c1_b_15, 2),
>> + INGENIC_PIN_GROUP("i2c1-data-b-19", x1600_i2c1_b_19, 0),
>> + INGENIC_PIN_GROUP("i2s-data-tx", x1600_i2s_data_tx, 0),
>> + INGENIC_PIN_GROUP("i2s-data-rx", x1600_i2s_data_rx, 0),
>> + INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
>> + INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
>> + INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
>> + INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
>> + INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
>> + INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
>> + INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
>> + INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
>> + INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
>> + INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
>> + INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
>> + INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
>> + INGENIC_PIN_GROUP("pwm3", x1600_pwm_pwm3, 1),
>> + INGENIC_PIN_GROUP("pwm4", x1600_pwm_pwm4, 1),
>> + INGENIC_PIN_GROUP_FUNCS("pwm5", x1600_pwm_pwm5,
>> x1600_pwm_pwm5_funcs),
>> + INGENIC_PIN_GROUP_FUNCS("pwm6", x1600_pwm_pwm6,
>> x1600_pwm_pwm6_funcs),
>> + INGENIC_PIN_GROUP_FUNCS("pwm7", x1600_pwm_pwm7,
>> x1600_pwm_pwm7_funcs),
>> + INGENIC_PIN_GROUP("mac", x1600_mac, 1),
>> +};
>> +
>> +static const char * const x1600_uart0_groups[] =3D { "uart0-data",
>> "uart0-hwflow", };
>> +static const char * const x1600_uart1_groups[] =3D { "uart1-data",
>> "uart1-hwflow", };
>> +static const char * const x1600_uart2_groups[] =3D { "uart2-data-a",
>> "uart2-data-b", };
>> +static const char * const x1600_uart3_groups[] =3D { "uart3-data-b",
>> "uart3-data-d", };
>> +
>> +static const char * const x1600_sfc_groups[] =3D { "sfc", };
>> +
>> +static const char * const x1600_ssi_groups[] =3D {
>> + "ssi-dt-a", "ssi-dt-b",
>> + "ssi-dr-a", "ssi-dr-b",
>> + "ssi-clk-a", "ssi-clk-b",
>> + "ssi-ce0-a", "ssi-ce0-b",
>> + "ssi-ce1-a", "ssi-ce1-b",
>> +};
>> +
>> +static const char * const x1600_mmc0_groups[] =3D { "mmc0-1bit-b",
>> "mmc0-4bit-b",
>> + "mmc0-1bit-c", "mmc0-4bit-c",
>> +};
>> +
>> +static const char * const x1600_mmc1_groups[] =3D { "mmc1-1bit",
>> "mmc1-4bit", };
>> +
>> +static const char * const x1600_i2c0_groups[] =3D { "i2c0-data-a",
>> "i2c0-data-b", };
>> +static const char * const x1600_i2c1_groups[] =3D { =
"i2c1-data-b-15",
>> "i2c1-data-b-19", };
>> +
>> +static const char * const x1600_i2s_groups[] =3D {
>> + "i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx",
>> "i2s-sysclk",
>> +};
>> +
>> +static const char * const x1600_cim_groups[] =3D { "cim-data", };
>> +
>> +static const char * const x1600_lcd_groups[] =3D { "slcd-8bit", =
"slcd-
>> 16bit",
>> + "lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
>> +};
>> +
>> +static const char * const x1600_pwm0_groups[] =3D { "pwm0", };
>> +static const char * const x1600_pwm1_groups[] =3D { "pwm1", };
>> +static const char * const x1600_pwm2_groups[] =3D { "pwm2", };
>> +static const char * const x1600_pwm3_groups[] =3D { "pwm3", };
>> +static const char * const x1600_pwm4_groups[] =3D { "pwm4", };
>> +static const char * const x1600_pwm5_groups[] =3D { "pwm5", };
>> +static const char * const x1600_pwm6_groups[] =3D { "pwm6", };
>> +static const char * const x1600_pwm7_groups[] =3D { "pwm7", };
>> +
>> +static const char * const x1600_mac_groups[] =3D { "mac", };
>> +
>> +static const struct function_desc x1600_functions[] =3D {
>> + INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
>> + INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
>> + INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
>> + INGENIC_PIN_FUNCTION("uart3", x1600_uart3),
>> + INGENIC_PIN_FUNCTION("sfc", x1600_sfc),
>> + INGENIC_PIN_FUNCTION("ssi", x1600_ssi),
>> + INGENIC_PIN_FUNCTION("mmc0", x1600_mmc0),
>> + INGENIC_PIN_FUNCTION("mmc1", x1600_mmc1),
>> + INGENIC_PIN_FUNCTION("i2c0", x1600_i2c0),
>> + INGENIC_PIN_FUNCTION("i2c1", x1600_i2c1),
>> + INGENIC_PIN_FUNCTION("i2s", x1600_i2s),
>> + INGENIC_PIN_FUNCTION("cim", x1600_cim),
>> + INGENIC_PIN_FUNCTION("lcd", x1600_lcd),
>> + INGENIC_PIN_FUNCTION("pwm0", x1600_pwm0),
>> + INGENIC_PIN_FUNCTION("pwm1", x1600_pwm1),
>> + INGENIC_PIN_FUNCTION("pwm2", x1600_pwm2),
>> + INGENIC_PIN_FUNCTION("pwm3", x1600_pwm3),
>> + INGENIC_PIN_FUNCTION("pwm4", x1600_pwm4),
>> + INGENIC_PIN_FUNCTION("pwm5", x1600_pwm5),
>> + INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
>> + INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
>> + INGENIC_PIN_FUNCTION("mac", x1600_mac),
>> +};
>> +
>> +static const struct ingenic_chip_info x1600_chip_info =3D {
>> + .num_chips =3D 4,
>> + .reg_offset =3D 0x100,
>> + .version =3D ID_X1600,
>> + .groups =3D x1600_groups,
>> + .num_groups =3D ARRAY_SIZE(x1600_groups),
>> + .functions =3D x1600_functions,
>> + .num_functions =3D ARRAY_SIZE(x1600_functions),
>> + .pull_ups =3D x1600_pull_ups,
>> + .pull_downs =3D x1600_pull_downs,
>> + .access_table =3D &x1000_access_table,
>> +};
>> +
>>  static const u32 x1830_pull_ups[4] =3D {
>>   0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
>>  };
>> @@ -3860,7 +4089,9 @@ static int ingenic_pinconf_get(struct
>> pinctrl_dev *pctldev,
>>   pulldown =3D (bias =3D=3D GPIO_PULL_DOWN) && (jzpc->info-
>>> pull_downs[offt] & BIT(idx));
>> =20
>>   } else {
>> - if (is_soc_or_above(jzpc, ID_JZ4770))
>> + if (is_soc_or_above(jzpc, ID_X1600))
>> + pull =3D ingenic_get_pin_config(jzpc, pin,
>> X1600_GPIO_PU);
>> + else if (is_soc_or_above(jzpc, ID_JZ4770))
>>   pull =3D !ingenic_get_pin_config(jzpc, pin,
>> JZ4770_GPIO_PEN);
>>   else if (is_soc_or_above(jzpc, ID_JZ4740))
>>   pull =3D !ingenic_get_pin_config(jzpc, pin,
>> JZ4740_GPIO_PULL_DIS);
>> @@ -3959,6 +4190,8 @@ static void ingenic_set_bias(struct
>> ingenic_pinctrl *jzpc,
>>   REG_SET(X1830_GPIO_PEH),
>> bias << idxh);
>>   }
>> =20
>> + } else if (is_soc_or_above(jzpc, ID_X1600)) {
>> + ingenic_config_pin(jzpc, pin, X1600_GPIO_PU, bias);
>>   } else if (is_soc_or_above(jzpc, ID_JZ4770)) {
>>   ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN,
>> !bias);
>>   } else if (is_soc_or_above(jzpc, ID_JZ4740)) {
>> @@ -4150,6 +4383,7 @@ static const struct of_device_id
>> ingenic_gpio_of_matches[] __initconst =3D {
>>   { .compatible =3D "ingenic,jz4775-gpio" },
>>   { .compatible =3D "ingenic,jz4780-gpio" },
>>   { .compatible =3D "ingenic,x1000-gpio" },
>> + { .compatible =3D "ingenic,x1600-gpio" },
>>   { .compatible =3D "ingenic,x1830-gpio" },
>>   { .compatible =3D "ingenic,x2000-gpio" },
>>   { .compatible =3D "ingenic,x2100-gpio" },
>> @@ -4397,6 +4631,10 @@ static const struct of_device_id
>> ingenic_pinctrl_of_matches[] =3D {
>>   .compatible =3D "ingenic,x1500-pinctrl",
>>   .data =3D IF_ENABLED(CONFIG_MACH_X1500,
>> &x1500_chip_info)
>>   },
>> + {
>> + .compatible =3D "ingenic,x1600-pinctrl",
>> + .data =3D IF_ENABLED(CONFIG_MACH_X1600,
>> &x1600_chip_info)
>> + },
>>   {
>>   .compatible =3D "ingenic,x1830-pinctrl",
>>   .data =3D IF_ENABLED(CONFIG_MACH_X1830,
>> &x1830_chip_info)
>=20


