Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E07108F21
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 14:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfKYNqv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 08:46:51 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25743 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfKYNqv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 08:46:51 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574689596; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=CMAYvNoedcm40Yr7yqDNmxX/YeAAJKvWtK6R3fYDkT14hlXChE2FhEqpG1q9f2OEdgNVrHOQoav77S+xAbqrg8/AP+8jlBb7OqE7ShESUksCJJ6YH8WKZyUvB0fD75hPMfGjzKkWkpQc0sJbr0cM+VQT8IaGwlZSqJdBcn568E8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574689596; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=IpnS4/anD51wdDmH5goaLWJedQlGL7/hW10plnjDyHg=; 
        b=FPt0id7HlnXKzmfJIIKCcY9RP50MnQIj6+MpDoRmhJw9N3JGG7q8BwYz9SXbr6qHJKlGSLgTrkoQFngD0KIzf+WG6e+5UyUKN6FLjzLpA44EDO/6fFmHEGi+zt9fUKFnk1yVTSPk+Ck4ko4aiMp4btnmAwkd19AeE9Tq886Z5Mc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=ru2Laf+MDcAintoTvfLpHU+Bb6Fgs92CNApucp/SWWTHpO9vJxHi234cK+iifkSTeRc0N070nWUr
    sys4N60jgsQ75VONGohqZNI14GCWy/VrsZqcwHqHA61k/I+OvmND  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574689596;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=IpnS4/anD51wdDmH5goaLWJedQlGL7/hW10plnjDyHg=;
        b=ewuJYLw9pXEy1R2JpYkoL2xmPIm8boPqRNadh3MLohyEPsTSHXzdQlRYrx9uEize
        xDm3P52ZanU+c+h0CDLGYXzmhJQOsWCscvIy+gJliYvgbI985f45PIGmRSs7PrYCRrF
        TXkIA8lYEl4FBezQcEqvmtzmiJYj75REY+7GSfa8=
Received: from [192.168.88.130] (171.221.113.185 [171.221.113.185]) by mx.zohomail.com
        with SMTPS id 1574689595445230.63787535525591; Mon, 25 Nov 2019 05:46:35 -0800 (PST)
Subject: Re: [PATCH v5 2/4] pinctrl: Ingenic: Add missing parts for X1000 and
 X1500.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574682283-87655-1-git-send-email-zhouyanjie@zoho.com>
 <1574682283-87655-3-git-send-email-zhouyanjie@zoho.com>
 <1574688681.3.0@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, syq@debian.org
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDBDB26.1080102@zoho.com>
Date:   Mon, 25 Nov 2019 21:46:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574688681.3.0@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8825=E6=97=A5 21:31, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le lun., nov. 25, 2019 at 19:44, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> 1.Add pinctrl drivers for the SPI flash controller (SFC) of
>>   X1000 and X1500.
>> 2.Add pinctrl driver for the synchronous serial interface (SSI)
>>   of X1000.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     Fix typo.
>>
>>     v3->v4:
>>     No change.
>>
>>     v4->v5:
>>     No change.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 64=20
>> +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 059e39a..1a99715 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -1031,6 +1031,23 @@ static int x1000_uart1_data_d_pins[] =3D { 0x62,=
=20
>> 0x63, };
>>  static int x1000_uart1_hwflow_pins[] =3D { 0x64, 0x65, };
>>  static int x1000_uart2_data_a_pins[] =3D { 0x02, 0x03, };
>>  static int x1000_uart2_data_d_pins[] =3D { 0x65, 0x64, };
>> +static int x1000_sfc_pins[] =3D { 0x1d, 0x1c, 0x1e, 0x1f, 0x1a, 0x1b, }=
;
>> +static int x1000_ssi_dt_a_22_pins[] =3D { 0x16, };
>> +static int x1000_ssi_dt_a_29_pins[] =3D { 0x1d, };
>> +static int x1000_ssi_dt_d_pins[] =3D { 0x62, };
>> +static int x1000_ssi_dr_a_23_pins[] =3D { 0x17, };
>> +static int x1000_ssi_dr_a_28_pins[] =3D { 0x1c, };
>> +static int x1000_ssi_dr_d_pins[] =3D { 0x63, };
>> +static int x1000_ssi_clk_a_24_pins[] =3D { 0x18, };
>> +static int x1000_ssi_clk_a_26_pins[] =3D { 0x1a, };
>> +static int x1000_ssi_clk_d_pins[] =3D { 0x60, };
>> +static int x1000_ssi_gpc_a_20_pins[] =3D { 0x14, };
>> +static int x1000_ssi_gpc_a_31_pins[] =3D { 0x1f, };
>> +static int x1000_ssi_ce0_a_25_pins[] =3D { 0x19, };
>> +static int x1000_ssi_ce0_a_27_pins[] =3D { 0x1b, };
>> +static int x1000_ssi_ce0_d_pins[] =3D { 0x61, };
>> +static int x1000_ssi_ce1_a_21_pins[] =3D { 0x15, };
>> +static int x1000_ssi_ce1_a_30_pins[] =3D { 0x1e, };
>>  static int x1000_mmc0_1bit_pins[] =3D { 0x18, 0x19, 0x17, };
>>  static int x1000_mmc0_4bit_pins[] =3D { 0x16, 0x15, 0x14, };
>>  static int x1000_mmc0_8bit_pins[] =3D { 0x13, 0x12, 0x11, 0x10, };
>> @@ -1081,6 +1098,23 @@ static int x1000_uart1_data_d_funcs[] =3D { 1,=20
>> 1, };
>>  static int x1000_uart1_hwflow_funcs[] =3D { 1, 1, };
>>  static int x1000_uart2_data_a_funcs[] =3D { 2, 2, };
>>  static int x1000_uart2_data_d_funcs[] =3D { 0, 0, };
>> +static int x1000_sfc_funcs[] =3D { 1, 1, 1, 1, 1, 1, };
>> +static int x1000_ssi_dt_a_22_funcs[] =3D { 2, };
>> +static int x1000_ssi_dt_a_29_funcs[] =3D { 2, };
>> +static int x1000_ssi_dt_d_funcs[] =3D { 0, };
>> +static int x1000_ssi_dr_a_23_funcs[] =3D { 2, };
>> +static int x1000_ssi_dr_a_28_funcs[] =3D { 2, };
>> +static int x1000_ssi_dr_d_funcs[] =3D { 0, };
>> +static int x1000_ssi_clk_a_24_funcs[] =3D { 2, };
>> +static int x1000_ssi_clk_a_26_funcs[] =3D { 2, };
>> +static int x1000_ssi_clk_d_funcs[] =3D { 0, };
>> +static int x1000_ssi_gpc_a_20_funcs[] =3D { 2, };
>> +static int x1000_ssi_gpc_a_31_funcs[] =3D { 2, };
>> +static int x1000_ssi_ce0_a_25_funcs[] =3D { 2, };
>> +static int x1000_ssi_ce0_a_27_funcs[] =3D { 2, };
>> +static int x1000_ssi_ce0_d_funcs[] =3D { 0, };
>> +static int x1000_ssi_ce1_a_21_funcs[] =3D { 2, };
>> +static int x1000_ssi_ce1_a_30_funcs[] =3D { 2, };
>>  static int x1000_mmc0_1bit_funcs[] =3D { 1, 1, 1, };
>>  static int x1000_mmc0_4bit_funcs[] =3D { 1, 1, 1, };
>>  static int x1000_mmc0_8bit_funcs[] =3D { 1, 1, 1, 1, 1, };
>> @@ -1119,6 +1153,23 @@ static const struct group_desc x1000_groups[] =3D=
 {
>>      INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
>>      INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
>>      INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
>> +    INGENIC_PIN_GROUP("sfc", x1000_sfc),
>> +    INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22),
>> +    INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29),
>> +    INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d),
>> +    INGENIC_PIN_GROUP("ssi-dr-a-23", x1000_ssi_dr_a_23),
>> +    INGENIC_PIN_GROUP("ssi-dr-a-28", x1000_ssi_dr_a_28),
>> +    INGENIC_PIN_GROUP("ssi-dr-d", x1000_ssi_dr_d),
>> +    INGENIC_PIN_GROUP("ssi-clk-a-24", x1000_ssi_clk_a_24),
>> +    INGENIC_PIN_GROUP("ssi-clk-a-26", x1000_ssi_clk_a_26),
>> +    INGENIC_PIN_GROUP("ssi-clk-d", x1000_ssi_clk_d),
>> +    INGENIC_PIN_GROUP("ssi-gpc-a-20", x1000_ssi_gpc_a_20),
>> +    INGENIC_PIN_GROUP("ssi-gpc-a-31", x1000_ssi_gpc_a_31),
>> +    INGENIC_PIN_GROUP("ssi-ce0-a-25", x1000_ssi_ce0_a_25),
>> +    INGENIC_PIN_GROUP("ssi-ce0-a-27", x1000_ssi_ce0_a_27),
>> +    INGENIC_PIN_GROUP("ssi-ce0-d", x1000_ssi_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi-ce1-a-21", x1000_ssi_ce1_a_21),
>> +    INGENIC_PIN_GROUP("ssi-ce1-a-30", x1000_ssi_ce1_a_30),
>>      INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
>>      INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit),
>>      INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
>> @@ -1152,6 +1203,15 @@ static const char *x1000_uart1_groups[] =3D {
>>      "uart1-data-a", "uart1-data-d", "uart1-hwflow",
>>  };
>>  static const char *x1000_uart2_groups[] =3D { "uart2-data-a",=20
>> "uart2-data-d", };
>> +static const char *x1000_sfc_groups[] =3D { "sfc", };
>> +static const char *x1000_ssi_groups[] =3D {
>> +    "ssi-dt-a-22", "ssi-dt-a-29", "ssi-dt-d",
>> +    "ssi-dr-a-23", "ssi-dr-a-28", "ssi-dr-d",
>> +    "ssi-clk-a-24", "ssi-clk-a-26", "ssi-clk-d",
>> +    "ssi-gpc-a-20", "ssi-gpc-a-31",
>> +    "ssi-ce0-a-25", "ssi-ce0-a-27", "ssi-ce0-d",
>> +    "ssi-ce1-a-21", "ssi-ce1-a-30", "ssi-ce0-d",
>
> "ssi-ce0-d" is set twice.
>

My fault, I will fix it in v6.

Thanks and best regards!

>
>> +};
>>  static const char *x1000_mmc0_groups[] =3D {
>>      "mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
>>  };
>> @@ -1182,6 +1242,8 @@ static const struct function_desc=20
>> x1000_functions[] =3D {
>>      { "uart0", x1000_uart0_groups, ARRAY_SIZE(x1000_uart0_groups), },
>>      { "uart1", x1000_uart1_groups, ARRAY_SIZE(x1000_uart1_groups), },
>>      { "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
>> +    { "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
>> +    { "ssi", x1000_ssi_groups, ARRAY_SIZE(x1000_ssi_groups), },
>>      { "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
>>      { "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
>>      { "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
>> @@ -1271,6 +1333,7 @@ static const struct group_desc x1500_groups[] =3D =
{
>>      INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
>>      INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
>>      INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
>> +    INGENIC_PIN_GROUP("sfc", x1000_sfc),
>>      INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
>>      INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
>>      INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
>> @@ -1307,6 +1370,7 @@ static const struct function_desc=20
>> x1500_functions[] =3D {
>>      { "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
>>      { "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
>>      { "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
>> +    { "sfc", x1000_sfc_groups, ARRAY_SIZE(x1000_sfc_groups), },
>>      { "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
>>      { "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
>>      { "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
>> --=20
>> 2.7.4
>>
>>
>
>



