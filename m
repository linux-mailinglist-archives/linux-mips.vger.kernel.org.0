Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94A72FD259
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 15:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732779AbhATOIF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 20 Jan 2021 09:08:05 -0500
Received: from aposti.net ([89.234.176.197]:49608 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387536AbhATNZU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 08:25:20 -0500
Date:   Wed, 20 Jan 2021 13:24:24 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Improve JZ4760 support
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        linux-gpio@vger.kernel.org,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Lubomir Rintel <lkundrak@v3.sk>
Message-Id: <OKI8NQ.JSUCTWEE24HU2@crapouillou.net>
In-Reply-To: <5CD80D68-0E53-4DB8-8FA6-1A9DEF270B11@goldelico.com>
References: <20210120110722.20133-1-paul@crapouillou.net>
        <5CD80D68-0E53-4DB8-8FA6-1A9DEF270B11@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 20 janv. 2021 à 14:13, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> 
>>  Am 20.01.2021 um 12:07 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  - Add otg function and otg-vbus group.
>> 
>>  - Add lcd-8bit, lcd-16bit, lcd-18bit, lcd-generic and lcd-special
>>   groups. Change the lcd-24bit group so that it only selects the pins
>>   that aren't in the lcd-18bit and lcd-generic groups (which breaks
>>   Device Tree in theory, but there is none out there for any JZ4760
>>   based board, yet). Remove the lcd-no-pins group which is just 
>> useless.
> 
> Does this mean it is also usless for the other Ingenic SoC?
> Background: we are working on jz4730 support and have simply copied 
> it.

Yes, you can remove it.

-Paul

>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>  drivers/pinctrl/pinctrl-ingenic.c | 38 
>> +++++++++++++++++++++++--------
>>  1 file changed, 28 insertions(+), 10 deletions(-)
>> 
>>  diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>>  index 76fec77c5b67..f2746125b077 100644
>>  --- a/drivers/pinctrl/pinctrl-ingenic.c
>>  +++ b/drivers/pinctrl/pinctrl-ingenic.c
>>  @@ -376,12 +376,21 @@ static int jz4760_cim_pins[] = {
>>  	0x26, 0x27, 0x28, 0x29,
>>  	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
>>  };
>>  +static int jz4760_lcd_8bit_pins[] = {
>>  +	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x4c,
>>  +	0x4d, 0x52, 0x53,
>>  +};
>>  +static int jz4760_lcd_16bit_pins[] = {
>>  +	0x4e, 0x4f, 0x50, 0x51, 0x56, 0x57, 0x58, 0x59,
>>  +};
>>  +static int jz4760_lcd_18bit_pins[] = {
>>  +	0x5a, 0x5b,
>>  +};
>>  static int jz4760_lcd_24bit_pins[] = {
>>  -	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
>>  -	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
>>  -	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
>>  -	0x58, 0x59, 0x5a, 0x5b,
>>  +	0x40, 0x41, 0x4a, 0x4b, 0x54, 0x55,
>>  };
>>  +static int jz4760_lcd_special_pins[] = { 0x40, 0x41, 0x4a, 0x54 };
>>  +static int jz4760_lcd_generic_pins[] = { 0x49, };
>>  static int jz4760_pwm_pwm0_pins[] = { 0x80, };
>>  static int jz4760_pwm_pwm1_pins[] = { 0x81, };
>>  static int jz4760_pwm_pwm2_pins[] = { 0x82, };
>>  @@ -390,6 +399,7 @@ static int jz4760_pwm_pwm4_pins[] = { 0x84, };
>>  static int jz4760_pwm_pwm5_pins[] = { 0x85, };
>>  static int jz4760_pwm_pwm6_pins[] = { 0x6a, };
>>  static int jz4760_pwm_pwm7_pins[] = { 0x6b, };
>>  +static int jz4760_otg_pins[] = { 0x8a, };
>> 
>>  static u8 jz4760_uart3_data_funcs[] = { 0, 1, };
>>  static u8 jz4760_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
>>  @@ -436,8 +446,12 @@ static const struct group_desc jz4760_groups[] 
>> = {
>>  	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0, 0),
>>  	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1, 0),
>>  	INGENIC_PIN_GROUP("cim-data", jz4760_cim, 0),
>>  +	INGENIC_PIN_GROUP("lcd-8bit", jz4760_lcd_8bit, 0),
>>  +	INGENIC_PIN_GROUP("lcd-16bit", jz4760_lcd_16bit, 0),
>>  +	INGENIC_PIN_GROUP("lcd-18bit", jz4760_lcd_18bit, 0),
>>  	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit, 0),
>>  -	{ "lcd-no-pins", },
>>  +	INGENIC_PIN_GROUP("lcd-generic", jz4760_lcd_generic, 0),
>>  +	INGENIC_PIN_GROUP("lcd-special", jz4760_lcd_special, 1),
>>  	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0, 0),
>>  	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1, 0),
>>  	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2, 0),
>>  @@ -446,6 +460,7 @@ static const struct group_desc jz4760_groups[] 
>> = {
>>  	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5, 0),
>>  	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6, 0),
>>  	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7, 0),
>>  +	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
>>  };
>> 
>>  static const char *jz4760_uart0_groups[] = { "uart0-data", 
>> "uart0-hwflow", };
>>  @@ -477,7 +492,10 @@ static const char *jz4760_cs6_groups[] = { 
>> "nemc-cs6", };
>>  static const char *jz4760_i2c0_groups[] = { "i2c0-data", };
>>  static const char *jz4760_i2c1_groups[] = { "i2c1-data", };
>>  static const char *jz4760_cim_groups[] = { "cim-data", };
>>  -static const char *jz4760_lcd_groups[] = { "lcd-24bit", 
>> "lcd-no-pins", };
>>  +static const char *jz4760_lcd_groups[] = {
>>  +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
>>  +	"lcd-special", "lcd-generic",
>>  +};
>>  static const char *jz4760_pwm0_groups[] = { "pwm0", };
>>  static const char *jz4760_pwm1_groups[] = { "pwm1", };
>>  static const char *jz4760_pwm2_groups[] = { "pwm2", };
>>  @@ -486,6 +504,7 @@ static const char *jz4760_pwm4_groups[] = { 
>> "pwm4", };
>>  static const char *jz4760_pwm5_groups[] = { "pwm5", };
>>  static const char *jz4760_pwm6_groups[] = { "pwm6", };
>>  static const char *jz4760_pwm7_groups[] = { "pwm7", };
>>  +static const char *jz4760_otg_groups[] = { "otg-vbus", };
>> 
>>  static const struct function_desc jz4760_functions[] = {
>>  	{ "uart0", jz4760_uart0_groups, ARRAY_SIZE(jz4760_uart0_groups), },
>>  @@ -514,6 +533,7 @@ static const struct function_desc 
>> jz4760_functions[] = {
>>  	{ "pwm5", jz4760_pwm5_groups, ARRAY_SIZE(jz4760_pwm5_groups), },
>>  	{ "pwm6", jz4760_pwm6_groups, ARRAY_SIZE(jz4760_pwm6_groups), },
>>  	{ "pwm7", jz4760_pwm7_groups, ARRAY_SIZE(jz4760_pwm7_groups), },
>>  +	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
>>  };
>> 
>>  static const struct ingenic_chip_info jz4760_chip_info = {
>>  @@ -648,7 +668,6 @@ static int jz4770_mac_rmii_pins[] = {
>>  	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
>>  };
>>  static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
>>  -static int jz4770_otg_pins[] = { 0x8a, };
>> 
>>  static const struct group_desc jz4770_groups[] = {
>>  	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
>>  @@ -747,7 +766,7 @@ static const struct group_desc jz4770_groups[] 
>> = {
>>  	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7, 0),
>>  	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii, 0),
>>  	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii, 0),
>>  -	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg, 0),
>>  +	INGENIC_PIN_GROUP("otg-vbus", jz4760_otg, 0),
>>  };
>> 
>>  static const char *jz4770_uart0_groups[] = { "uart0-data", 
>> "uart0-hwflow", };
>>  @@ -808,7 +827,6 @@ static const char *jz4770_pwm5_groups[] = { 
>> "pwm5", };
>>  static const char *jz4770_pwm6_groups[] = { "pwm6", };
>>  static const char *jz4770_pwm7_groups[] = { "pwm7", };
>>  static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
>>  -static const char *jz4770_otg_groups[] = { "otg-vbus", };
>> 
>>  static const struct function_desc jz4770_functions[] = {
>>  	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
>>  @@ -841,7 +859,7 @@ static const struct function_desc 
>> jz4770_functions[] = {
>>  	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
>>  	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
>>  	{ "mac", jz4770_mac_groups, ARRAY_SIZE(jz4770_mac_groups), },
>>  -	{ "otg", jz4770_otg_groups, ARRAY_SIZE(jz4770_otg_groups), },
>>  +	{ "otg", jz4760_otg_groups, ARRAY_SIZE(jz4760_otg_groups), },
>>  };
>> 
>>  static const struct ingenic_chip_info jz4770_chip_info = {
>>  --
>>  2.29.2
>> 
> 


