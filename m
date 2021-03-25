Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57114348AD0
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 08:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhCYHzs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 03:55:48 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:47223 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhCYHzR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 03:55:17 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.200372-0.000483074-0.799145;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jq.8Wv8_1616658912;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jq.8Wv8_1616658912)
          by smtp.aliyun-inc.com(10.147.42.253);
          Thu, 25 Mar 2021 15:55:13 +0800
Subject: Re: [PATCH v3 07/10] pinctrl: Ingenic: Add pinctrl driver for JZ4750.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-8-git-send-email-zhouyanjie@wanyeetech.com>
 <PXUDQQ.WI3R8L8RS0751@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <183f59e8-3220-2299-cb23-f8abb26fdf6c@wanyeetech.com>
Date:   Thu, 25 Mar 2021 15:55:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <PXUDQQ.WI3R8L8RS0751@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/3/23 上午2:20, Paul Cercueil wrote:
>
>
> Le mer. 17 mars 2021 à 17:58, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing the pinctrl-ingenic driver on the
>> JZ4750 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v3:
>>     New patch.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 137 
>> ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 137 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index 25458d6..d98767b 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -85,6 +85,7 @@ enum jz_version {
>>      ID_JZ4730,
>>      ID_JZ4740,
>>      ID_JZ4725B,
>> +    ID_JZ4750,
>>      ID_JZ4760,
>>      ID_JZ4770,
>>      ID_JZ4780,
>> @@ -424,6 +425,138 @@ static const struct ingenic_chip_info 
>> jz4725b_chip_info = {
>>      .pull_downs = jz4740_pull_downs,
>>  };
>>
>> +static const u32 jz4750_pull_ups[6] = {
>> +    0xffffffff, 0xffffffff, 0x3fffffff, 0x7fffffff, 0x1fff3fff, 
>> 0x00ffffff,
>> +};
>> +
>> +static const u32 jz4750_pull_downs[6] = {
>> +    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
>> 0x00000000,
>> +};
>> +
>> +static int jz4750_uart0_data_pins[] = { 0xa4, 0xa5, };
>> +static int jz4750_uart0_hwflow_pins[] = { 0xa6, 0xa7, };
>> +static int jz4750_uart1_data_pins[] = { 0x90, 0x91, };
>> +static int jz4750_uart1_hwflow_pins[] = { 0x92, 0x93, };
>> +static int jz4750_uart2_data_pins[] = { 0x9b, 0x9a, };
>> +static int jz4750_uart3_data_pins[] = { 0xb0, 0xb1, };
>> +static int jz4750_uart3_hwflow_pins[] = { 0xb2, 0xb3, };
>> +static int jz4750_mmc0_1bit_pins[] = { 0xa8, 0xa9, 0xa0, };
>> +static int jz4750_mmc0_4bit_pins[] = { 0xa1, 0xa2, 0xa3, };
>> +static int jz4750_mmc0_8bit_pins[] = { 0xa4, 0xa5, 0xa6, 0xa7, };
>> +static int jz4750_mmc1_1bit_pins[] = { 0xae, 0xaf, 0xaa, };
>> +static int jz4750_mmc1_4bit_pins[] = { 0xab, 0xac, 0xad, };
>> +static int jz4750_i2c_pins[] = { 0x8c, 0x8d, };
>> +static int jz4750_cim_pins[] = {
>> +    0x89, 0x8b, 0x8a, 0x88,
>> +    0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
>> +};
>> +static int jz4750_lcd_8bit_pins[] = {
>> +    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x72, 0x73, 0x74,
>> +};
>> +static int jz4750_lcd_16bit_pins[] = {
>> +    0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x75,
>> +};
>> +static int jz4750_lcd_18bit_pins[] = { 0x70, 0x71, };
>> +static int jz4750_lcd_18bit_tft_pins[] = { 0x78, 0x79, 0x76, 0x77, };
>> +static int jz4750_nand_cs1_pins[] = { 0x55, };
>> +static int jz4750_nand_cs2_pins[] = { 0x56, };
>> +static int jz4750_nand_cs3_pins[] = { 0x57, };
>> +static int jz4750_nand_cs4_pins[] = { 0x58, };
>> +static int jz4750_nand_fre_fwe_pins[] = { 0x5c, 0x5d, };
>> +static int jz4750_pwm_pwm0_pins[] = { 0x94, };
>> +static int jz4750_pwm_pwm1_pins[] = { 0x95, };
>> +static int jz4750_pwm_pwm2_pins[] = { 0x96, };
>> +static int jz4750_pwm_pwm3_pins[] = { 0x97, };
>> +static int jz4750_pwm_pwm4_pins[] = { 0x98, };
>> +static int jz4750_pwm_pwm5_pins[] = { 0x99, };
>> +
>> +static const struct group_desc jz4750_groups[] = {
>> +    INGENIC_PIN_GROUP("uart0-data", jz4750_uart0_data, 1),
>> +    INGENIC_PIN_GROUP("uart0-hwflow", jz4750_uart0_hwflow, 1),
>> +    INGENIC_PIN_GROUP("uart1-data", jz4750_uart1_data, 0),
>> +    INGENIC_PIN_GROUP("uart1-hwflow", jz4750_uart1_hwflow, 0),
>> +    INGENIC_PIN_GROUP("uart2-data", jz4750_uart2_data, 1),
>> +    INGENIC_PIN_GROUP("uart3-data", jz4750_uart3_data, 0),
>> +    INGENIC_PIN_GROUP("uart3-hwflow", jz4750_uart3_hwflow, 0),
>> +    INGENIC_PIN_GROUP("mmc0-1bit", jz4750_mmc0_1bit, 0),
>> +    INGENIC_PIN_GROUP("mmc0-4bit", jz4750_mmc0_4bit, 0),
>> +    INGENIC_PIN_GROUP("mmc0-8bit", jz4750_mmc0_8bit, 0),
>> +    INGENIC_PIN_GROUP("mmc1-1bit", jz4750_mmc1_1bit, 0),
>> +    INGENIC_PIN_GROUP("mmc1-4bit", jz4750_mmc1_4bit, 0),
>> +    INGENIC_PIN_GROUP("i2c-data", jz4750_i2c, 0),
>> +    INGENIC_PIN_GROUP("cim-data", jz4750_cim, 0),
>> +    INGENIC_PIN_GROUP("lcd-8bit", jz4750_lcd_8bit, 0),
>> +    INGENIC_PIN_GROUP("lcd-16bit", jz4750_lcd_16bit, 0),
>> +    INGENIC_PIN_GROUP("lcd-18bit", jz4750_lcd_18bit, 0),
>> +    INGENIC_PIN_GROUP("lcd-18bit-tft", jz4750_lcd_18bit_tft, 0),
>> +    { "lcd-no-pins", },
>
> Please drop "lcd-no-pins" from your patches, it is pointless.
>

Sure.


> Cheers,
> -Paul
>
>> +    INGENIC_PIN_GROUP("nand-cs1", jz4750_nand_cs1, 0),
>> +    INGENIC_PIN_GROUP("nand-cs2", jz4750_nand_cs2, 0),
>> +    INGENIC_PIN_GROUP("nand-cs3", jz4750_nand_cs3, 0),
>> +    INGENIC_PIN_GROUP("nand-cs4", jz4750_nand_cs4, 0),
>> +    INGENIC_PIN_GROUP("nand-fre-fwe", jz4750_nand_fre_fwe, 0),
>> +    INGENIC_PIN_GROUP("pwm0", jz4750_pwm_pwm0, 0),
>> +    INGENIC_PIN_GROUP("pwm1", jz4750_pwm_pwm1, 0),
>> +    INGENIC_PIN_GROUP("pwm2", jz4750_pwm_pwm2, 0),
>> +    INGENIC_PIN_GROUP("pwm3", jz4750_pwm_pwm3, 0),
>> +    INGENIC_PIN_GROUP("pwm4", jz4750_pwm_pwm4, 0),
>> +    INGENIC_PIN_GROUP("pwm5", jz4750_pwm_pwm5, 0),
>> +};
>> +
>> +static const char *jz4750_uart0_groups[] = { "uart0-data", 
>> "uart0-hwflow", };
>> +static const char *jz4750_uart1_groups[] = { "uart1-data", 
>> "uart1-hwflow", };
>> +static const char *jz4750_uart2_groups[] = { "uart2-data", };
>> +static const char *jz4750_uart3_groups[] = { "uart3-data", 
>> "uart3-hwflow", };
>> +static const char *jz4750_mmc0_groups[] = {
>> +    "mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
>> +};
>> +static const char *jz4750_mmc1_groups[] = { "mmc0-1bit", 
>> "mmc0-4bit", };
>> +static const char *jz4750_i2c_groups[] = { "i2c-data", };
>> +static const char *jz4750_cim_groups[] = { "cim-data", };
>> +static const char *jz4750_lcd_groups[] = {
>> +    "lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-18bit-tft", 
>> "lcd-no-pins",
>> +};
>> +static const char *jz4750_nand_groups[] = {
>> +    "nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
>> +};
>> +static const char *jz4750_pwm0_groups[] = { "pwm0", };
>> +static const char *jz4750_pwm1_groups[] = { "pwm1", };
>> +static const char *jz4750_pwm2_groups[] = { "pwm2", };
>> +static const char *jz4750_pwm3_groups[] = { "pwm3", };
>> +static const char *jz4750_pwm4_groups[] = { "pwm4", };
>> +static const char *jz4750_pwm5_groups[] = { "pwm5", };
>> +
>> +static const struct function_desc jz4750_functions[] = {
>> +    { "uart0", jz4750_uart0_groups, ARRAY_SIZE(jz4750_uart0_groups), },
>> +    { "uart1", jz4750_uart1_groups, ARRAY_SIZE(jz4750_uart1_groups), },
>> +    { "uart2", jz4750_uart2_groups, ARRAY_SIZE(jz4750_uart2_groups), },
>> +    { "uart3", jz4750_uart3_groups, ARRAY_SIZE(jz4750_uart3_groups), },
>> +    { "mmc0", jz4750_mmc0_groups, ARRAY_SIZE(jz4750_mmc0_groups), },
>> +    { "mmc1", jz4750_mmc1_groups, ARRAY_SIZE(jz4750_mmc1_groups), },
>> +    { "i2c", jz4750_i2c_groups, ARRAY_SIZE(jz4750_i2c_groups), },
>> +    { "cim", jz4750_cim_groups, ARRAY_SIZE(jz4750_cim_groups), },
>> +    { "lcd", jz4750_lcd_groups, ARRAY_SIZE(jz4750_lcd_groups), },
>> +    { "nand", jz4750_nand_groups, ARRAY_SIZE(jz4750_nand_groups), },
>> +    { "pwm0", jz4750_pwm0_groups, ARRAY_SIZE(jz4750_pwm0_groups), },
>> +    { "pwm1", jz4750_pwm1_groups, ARRAY_SIZE(jz4750_pwm1_groups), },
>> +    { "pwm2", jz4750_pwm2_groups, ARRAY_SIZE(jz4750_pwm2_groups), },
>> +    { "pwm3", jz4750_pwm3_groups, ARRAY_SIZE(jz4750_pwm3_groups), },
>> +    { "pwm4", jz4750_pwm4_groups, ARRAY_SIZE(jz4750_pwm4_groups), },
>> +    { "pwm5", jz4750_pwm5_groups, ARRAY_SIZE(jz4750_pwm5_groups), },
>> +};
>> +
>> +static const struct ingenic_chip_info jz4750_chip_info = {
>> +    .num_chips = 6,
>> +    .reg_offset = 0x100,
>> +    .version = ID_JZ4750,
>> +    .groups = jz4750_groups,
>> +    .num_groups = ARRAY_SIZE(jz4750_groups),
>> +    .functions = jz4750_functions,
>> +    .num_functions = ARRAY_SIZE(jz4750_functions),
>> +    .pull_ups = jz4750_pull_ups,
>> +    .pull_downs = jz4750_pull_downs,
>> +};
>> +
>>  static const u32 jz4760_pull_ups[6] = {
>>      0xffffffff, 0xfffcf3ff, 0xffffffff, 0xffffcfff, 0xfffffb7c, 
>> 0xfffff00f,
>>  };
>> @@ -2512,6 +2645,7 @@ static const struct of_device_id 
>> ingenic_gpio_of_match[] __initconst = {
>>      { .compatible = "ingenic,jz4730-gpio", },
>>      { .compatible = "ingenic,jz4740-gpio", },
>>      { .compatible = "ingenic,jz4725b-gpio", },
>> +    { .compatible = "ingenic,jz4750-gpio", },
>>      { .compatible = "ingenic,jz4760-gpio", },
>>      { .compatible = "ingenic,jz4770-gpio", },
>>      { .compatible = "ingenic,jz4780-gpio", },
>> @@ -2716,6 +2850,9 @@ static const struct of_device_id 
>> ingenic_pinctrl_of_match[] = {
>>          .data = IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_info)
>>      },
>>      {
>> +        .compatible = "ingenic,jz4750-pinctrl",
>> +        .data = IF_ENABLED(CONFIG_MACH_JZ4750, &jz4750_chip_info)
>> +    },
>>          .compatible = "ingenic,jz4760-pinctrl",
>>          .data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
>>      },
>> -- 
>> 2.7.4
>>
>
