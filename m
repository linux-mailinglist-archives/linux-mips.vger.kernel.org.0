Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C1711F1B4
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 13:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfLNMQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 07:16:42 -0500
Received: from out28-50.mail.aliyun.com ([115.124.28.50]:56081 "EHLO
        out28-50.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfLNMQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 07:16:42 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.621462-0.00214031-0.376398;DS=CONTINUE|ham_system_inform|0.240006-0.000248337-0.759746;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16384;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GH.BQ-m_1576325690;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GH.BQ-m_1576325690)
          by smtp.aliyun-inc.com(10.147.40.7);
          Sat, 14 Dec 2019 20:14:51 +0800
Subject: Re: [PATCH v7 4/4] pinctrl: Ingenic: Add pinctrl driver for X1830.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576068625-125234-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576068625-125234-5-git-send-email-zhouyanjie@wanyeetech.com>
 <1576270504.3.1@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        zhenwenjin@gmail.com, sernia.zhou@foxmail.com
From:   zhouyanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF4D23A.8080609@wanyeetech.com>
Date:   Sat, 14 Dec 2019 20:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576270504.3.1@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul，

On 2019年12月14日 04:55, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer., déc. 11, 2019 at 20:50, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing the pinctrl-ingenic driver on the
>> X1830 Soc from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v2:
>>     New patch.
>>
>>     v2->v3:
>>     Add pinctrl drivers for the PWM of X1830.
>>
>>     v3->v4:
>>     1.Use local variables to streamline code.
>>     2.Prevents processors older than X1830 from being
>>       configured in HiZ mode.
>>
>>     v4->v5:
>>     Fix compile-time warnings.
>>     Reported-by: kbuild test robot <lkp@intel.com>
>>
>>     v5->v6:
>>     1.Use local variables to streamline code.
>>     2.Rename "GPIO_HIZ" to "GPIO_PULL_DIS", and adjust
>>       related code.
>>
>>     v6->v7:
>>     1.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>>       to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
>>       the old mailbox is in an unstable state.
>>     2.Add "ingenic_chip_info.reg_offset", use it instead of having
>>       hardcoded, and add "PZ_BASE()" / "PZ_GID2LD()" macros, use it
>>       with "ingenic_chip_info.reg_offset" to simplify code related
>>       to shadow registers.
>>     3.Simplify the code of the "ingenic_set_bias" function.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 297 
>> +++++++++++++++++++++++++++++++++++---
>>  1 file changed, 278 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index ca947fa..e72c20b 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -3,7 +3,7 @@
>>   * Ingenic SoCs pinctrl driver
>>   *
>>   * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
>> - * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
>> + * Copyright (c) 2019 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>   */
>>
>>  #include <linux/compiler.h>
>> @@ -42,12 +42,19 @@
>>  #define JZ4760_GPIO_FLAG    0x50
>>  #define JZ4760_GPIO_PEN        0x70
>>
>> -#define X1000_GPIO_PZ_BASE        0x700
>> -#define X1000_GPIO_PZ_GID2LD    0x7f0
>> +#define X1830_GPIO_PEL            0x110
>> +#define X1830_GPIO_PEH            0x120
>>
>>  #define REG_SET(x) ((x) + 0x4)
>>  #define REG_CLEAR(x) ((x) + 0x8)
>>
>> +#define REG_PZ_BASE(x) ((x) * 7)
>> +#define REG_PZ_GID2LD(x) ((x) * 7 + 0xf0)
>> +
>> +#define GPIO_PULL_DIS    0
>> +#define GPIO_PULL_UP    1
>> +#define GPIO_PULL_DOWN    2
>> +
>>  #define PINS_PER_GPIO_CHIP 32
>>
>>  enum jz_version {
>> @@ -60,10 +67,12 @@ enum jz_version {
>>      ID_X1000,
>>      ID_X1000E,
>>      ID_X1500,
>> +    ID_X1830,
>>  };
>>
>>  struct ingenic_chip_info {
>>      unsigned int num_chips;
>> +    unsigned int reg_offset;
>>
>>      const struct group_desc *groups;
>>      unsigned int num_groups;
>> @@ -216,6 +225,7 @@ static const struct function_desc 
>> jz4740_functions[] = {
>>
>>  static const struct ingenic_chip_info jz4740_chip_info = {
>>      .num_chips = 4,
>> +    .reg_offset = 0x100,
>>      .groups = jz4740_groups,
>>      .num_groups = ARRAY_SIZE(jz4740_groups),
>>      .functions = jz4740_functions,
>> @@ -339,6 +349,7 @@ static const struct function_desc 
>> jz4725b_functions[] = {
>>
>>  static const struct ingenic_chip_info jz4725b_chip_info = {
>>      .num_chips = 4,
>> +    .reg_offset = 0x100,
>>      .groups = jz4725b_groups,
>>      .num_groups = ARRAY_SIZE(jz4725b_groups),
>>      .functions = jz4725b_functions,
>> @@ -592,6 +603,7 @@ static const struct function_desc 
>> jz4760_functions[] = {
>>
>>  static const struct ingenic_chip_info jz4760_chip_info = {
>>      .num_chips = 6,
>> +    .reg_offset = 0x100,
>>      .groups = jz4760_groups,
>>      .num_groups = ARRAY_SIZE(jz4760_groups),
>>      .functions = jz4760_functions,
>> @@ -602,6 +614,7 @@ static const struct ingenic_chip_info 
>> jz4760_chip_info = {
>>
>>  static const struct ingenic_chip_info jz4760b_chip_info = {
>>      .num_chips = 6,
>> +    .reg_offset = 0x100,
>>      .groups = jz4760_groups,
>>      .num_groups = ARRAY_SIZE(jz4760_groups),
>>      .functions = jz4760_functions,
>> @@ -880,6 +893,7 @@ static const struct function_desc 
>> jz4770_functions[] = {
>>
>>  static const struct ingenic_chip_info jz4770_chip_info = {
>>      .num_chips = 6,
>> +    .reg_offset = 0x100,
>>      .groups = jz4770_groups,
>>      .num_groups = ARRAY_SIZE(jz4770_groups),
>>      .functions = jz4770_functions,
>> @@ -1013,6 +1027,7 @@ static const struct function_desc 
>> jz4780_functions[] = {
>>
>>  static const struct ingenic_chip_info jz4780_chip_info = {
>>      .num_chips = 6,
>> +    .reg_offset = 0x100,
>>      .groups = jz4780_groups,
>>      .num_groups = ARRAY_SIZE(jz4780_groups),
>>      .functions = jz4780_functions,
>> @@ -1269,6 +1284,7 @@ static const struct function_desc 
>> x1000_functions[] = {
>>
>>  static const struct ingenic_chip_info x1000_chip_info = {
>>      .num_chips = 4,
>> +    .reg_offset = 0x100,
>>      .groups = x1000_groups,
>>      .num_groups = ARRAY_SIZE(x1000_groups),
>>      .functions = x1000_functions,
>> @@ -1279,6 +1295,7 @@ static const struct ingenic_chip_info 
>> x1000_chip_info = {
>>
>>  static const struct ingenic_chip_info x1000e_chip_info = {
>>      .num_chips = 4,
>> +    .reg_offset = 0x100,
>>      .groups = x1000_groups,
>>      .num_groups = ARRAY_SIZE(x1000_groups),
>>      .functions = x1000_functions,
>> @@ -1391,6 +1408,7 @@ static const struct function_desc 
>> x1500_functions[] = {
>>
>>  static const struct ingenic_chip_info x1500_chip_info = {
>>      .num_chips = 4,
>> +    .reg_offset = 0x100,
>
> Could you first introduce .reg_offset in a separate commit, then add 
> X1830 support?
>

Sure, I will separate it in two commit when I send v8.

Thanks and best regards！

> Thanks,
> -Paul
>
>
>>      .groups = x1500_groups,
>>      .num_groups = ARRAY_SIZE(x1500_groups),
>>      .functions = x1500_functions,
>> @@ -1399,6 +1417,221 @@ static const struct ingenic_chip_info 
>> x1500_chip_info = {
>>      .pull_downs = x1000_pull_downs,
>>  };
>>
>> +static const u32 x1830_pull_ups[4] = {
>> +    0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
>> +};
>> +
>> +static const u32 x1830_pull_downs[4] = {
>> +    0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
>> +};
>> +
>> +static int x1830_uart0_data_pins[] = { 0x33, 0x36, };
>> +static int x1830_uart0_hwflow_pins[] = { 0x34, 0x35, };
>> +static int x1830_uart1_data_pins[] = { 0x38, 0x37, };
>> +static int x1830_sfc_pins[] = { 0x17, 0x18, 0x1a, 0x19, 0x1b, 0x1c, };
>> +static int x1830_ssi0_dt_pins[] = { 0x4c, };
>> +static int x1830_ssi0_dr_pins[] = { 0x4b, };
>> +static int x1830_ssi0_clk_pins[] = { 0x4f, };
>> +static int x1830_ssi0_gpc_pins[] = { 0x4d, };
>> +static int x1830_ssi0_ce0_pins[] = { 0x50, };
>> +static int x1830_ssi0_ce1_pins[] = { 0x4e, };
>> +static int x1830_ssi1_dt_c_pins[] = { 0x53, };
>> +static int x1830_ssi1_dr_c_pins[] = { 0x54, };
>> +static int x1830_ssi1_clk_c_pins[] = { 0x57, };
>> +static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
>> +static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
>> +static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
>> +static int x1830_ssi1_dt_d_pins[] = { 0x62, };
>> +static int x1830_ssi1_dr_d_pins[] = { 0x63, };
>> +static int x1830_ssi1_clk_d_pins[] = { 0x66, };
>> +static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
>> +static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
>> +static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
>> +static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
>> +static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
>> +static int x1830_mmc1_1bit_pins[] = { 0x42, 0x43, 0x44, };
>> +static int x1830_mmc1_4bit_pins[] = { 0x45, 0x46, 0x47, };
>> +static int x1830_i2c0_pins[] = { 0x0c, 0x0d, };
>> +static int x1830_i2c1_pins[] = { 0x39, 0x3a, };
>> +static int x1830_i2c2_pins[] = { 0x5b, 0x5c, };
>> +static int x1830_pwm_pwm0_b_pins[] = { 0x31, };
>> +static int x1830_pwm_pwm0_c_pins[] = { 0x4b, };
>> +static int x1830_pwm_pwm1_b_pins[] = { 0x32, };
>> +static int x1830_pwm_pwm1_c_pins[] = { 0x4c, };
>> +static int x1830_pwm_pwm2_c_8_pins[] = { 0x48, };
>> +static int x1830_pwm_pwm2_c_13_pins[] = { 0x4d, };
>> +static int x1830_pwm_pwm3_c_9_pins[] = { 0x49, };
>> +static int x1830_pwm_pwm3_c_14_pins[] = { 0x4e, };
>> +static int x1830_pwm_pwm4_c_15_pins[] = { 0x4f, };
>> +static int x1830_pwm_pwm4_c_25_pins[] = { 0x59, };
>> +static int x1830_pwm_pwm5_c_16_pins[] = { 0x50, };
>> +static int x1830_pwm_pwm5_c_26_pins[] = { 0x5a, };
>> +static int x1830_pwm_pwm6_c_17_pins[] = { 0x51, };
>> +static int x1830_pwm_pwm6_c_27_pins[] = { 0x5b, };
>> +static int x1830_pwm_pwm7_c_18_pins[] = { 0x52, };
>> +static int x1830_pwm_pwm7_c_28_pins[] = { 0x5c, };
>> +static int x1830_mac_pins[] = {
>> +    0x29, 0x30, 0x2f, 0x28, 0x2e, 0x2d, 0x2a, 0x2b, 0x26, 0x27,
>> +};
>> +
>> +static int x1830_uart0_data_funcs[] = { 0, 0, };
>> +static int x1830_uart0_hwflow_funcs[] = { 0, 0, };
>> +static int x1830_uart1_data_funcs[] = { 0, 0, };
>> +static int x1830_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
>> +static int x1830_ssi0_dt_funcs[] = { 0, };
>> +static int x1830_ssi0_dr_funcs[] = { 0, };
>> +static int x1830_ssi0_clk_funcs[] = { 0, };
>> +static int x1830_ssi0_gpc_funcs[] = { 0, };
>> +static int x1830_ssi0_ce0_funcs[] = { 0, };
>> +static int x1830_ssi0_ce1_funcs[] = { 0, };
>> +static int x1830_ssi1_dt_c_funcs[] = { 1, };
>> +static int x1830_ssi1_dr_c_funcs[] = { 1, };
>> +static int x1830_ssi1_clk_c_funcs[] = { 1, };
>> +static int x1830_ssi1_gpc_c_funcs[] = { 1, };
>> +static int x1830_ssi1_ce0_c_funcs[] = { 1, };
>> +static int x1830_ssi1_ce1_c_funcs[] = { 1, };
>> +static int x1830_ssi1_dt_d_funcs[] = { 2, };
>> +static int x1830_ssi1_dr_d_funcs[] = { 2, };
>> +static int x1830_ssi1_clk_d_funcs[] = { 2, };
>> +static int x1830_ssi1_gpc_d_funcs[] = { 2, };
>> +static int x1830_ssi1_ce0_d_funcs[] = { 2, };
>> +static int x1830_ssi1_ce1_d_funcs[] = { 2, };
>> +static int x1830_mmc0_1bit_funcs[] = { 0, 0, 0, };
>> +static int x1830_mmc0_4bit_funcs[] = { 0, 0, 0, };
>> +static int x1830_mmc1_1bit_funcs[] = { 0, 0, 0, };
>> +static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
>> +static int x1830_i2c0_funcs[] = { 1, 1, };
>> +static int x1830_i2c1_funcs[] = { 0, 0, };
>> +static int x1830_i2c2_funcs[] = { 1, 1, };
>> +static int x1830_pwm_pwm0_b_funcs[] = { 0, };
>> +static int x1830_pwm_pwm0_c_funcs[] = { 1, };
>> +static int x1830_pwm_pwm1_b_funcs[] = { 0, };
>> +static int x1830_pwm_pwm1_c_funcs[] = { 1, };
>> +static int x1830_pwm_pwm2_c_8_funcs[] = { 0, };
>> +static int x1830_pwm_pwm2_c_13_funcs[] = { 1, };
>> +static int x1830_pwm_pwm3_c_9_funcs[] = { 0, };
>> +static int x1830_pwm_pwm3_c_14_funcs[] = { 1, };
>> +static int x1830_pwm_pwm4_c_15_funcs[] = { 1, };
>> +static int x1830_pwm_pwm4_c_25_funcs[] = { 0, };
>> +static int x1830_pwm_pwm5_c_16_funcs[] = { 1, };
>> +static int x1830_pwm_pwm5_c_26_funcs[] = { 0, };
>> +static int x1830_pwm_pwm6_c_17_funcs[] = { 1, };
>> +static int x1830_pwm_pwm6_c_27_funcs[] = { 0, };
>> +static int x1830_pwm_pwm7_c_18_funcs[] = { 1, };
>> +static int x1830_pwm_pwm7_c_28_funcs[] = { 0, };
>> +static int x1830_mac_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
>> +
>> +static const struct group_desc x1830_groups[] = {
>> +    INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data),
>> +    INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow),
>> +    INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data),
>> +    INGENIC_PIN_GROUP("sfc", x1830_sfc),
>> +    INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt),
>> +    INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr),
>> +    INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk),
>> +    INGENIC_PIN_GROUP("ssi0-gpc", x1830_ssi0_gpc),
>> +    INGENIC_PIN_GROUP("ssi0-ce0", x1830_ssi0_ce0),
>> +    INGENIC_PIN_GROUP("ssi0-ce1", x1830_ssi0_ce1),
>> +    INGENIC_PIN_GROUP("ssi1-dt-c", x1830_ssi1_dt_c),
>> +    INGENIC_PIN_GROUP("ssi1-dr-c", x1830_ssi1_dr_c),
>> +    INGENIC_PIN_GROUP("ssi1-clk-c", x1830_ssi1_clk_c),
>> +    INGENIC_PIN_GROUP("ssi1-gpc-c", x1830_ssi1_gpc_c),
>> +    INGENIC_PIN_GROUP("ssi1-ce0-c", x1830_ssi1_ce0_c),
>> +    INGENIC_PIN_GROUP("ssi1-ce1-c", x1830_ssi1_ce1_c),
>> +    INGENIC_PIN_GROUP("ssi1-dt-d", x1830_ssi1_dt_d),
>> +    INGENIC_PIN_GROUP("ssi1-dr-d", x1830_ssi1_dr_d),
>> +    INGENIC_PIN_GROUP("ssi1-clk-d", x1830_ssi1_clk_d),
>> +    INGENIC_PIN_GROUP("ssi1-gpc-d", x1830_ssi1_gpc_d),
>> +    INGENIC_PIN_GROUP("ssi1-ce0-d", x1830_ssi1_ce0_d),
>> +    INGENIC_PIN_GROUP("ssi1-ce1-d", x1830_ssi1_ce1_d),
>> +    INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit),
>> +    INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit),
>> +    INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit),
>> +    INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit),
>> +    INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
>> +    INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
>> +    INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
>> +    INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b),
>> +    INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c),
>> +    INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b),
>> +    INGENIC_PIN_GROUP("pwm1-c", x1830_pwm_pwm1_c),
>> +    INGENIC_PIN_GROUP("pwm2-c-8", x1830_pwm_pwm2_c_8),
>> +    INGENIC_PIN_GROUP("pwm2-c-13", x1830_pwm_pwm2_c_13),
>> +    INGENIC_PIN_GROUP("pwm3-c-9", x1830_pwm_pwm3_c_9),
>> +    INGENIC_PIN_GROUP("pwm3-c-14", x1830_pwm_pwm3_c_14),
>> +    INGENIC_PIN_GROUP("pwm4-c-15", x1830_pwm_pwm4_c_15),
>> +    INGENIC_PIN_GROUP("pwm4-c-25", x1830_pwm_pwm4_c_25),
>> +    INGENIC_PIN_GROUP("pwm5-c-16", x1830_pwm_pwm5_c_16),
>> +    INGENIC_PIN_GROUP("pwm5-c-26", x1830_pwm_pwm5_c_26),
>> +    INGENIC_PIN_GROUP("pwm6-c-17", x1830_pwm_pwm6_c_17),
>> +    INGENIC_PIN_GROUP("pwm6-c-27", x1830_pwm_pwm6_c_27),
>> +    INGENIC_PIN_GROUP("pwm7-c-18", x1830_pwm_pwm7_c_18),
>> +    INGENIC_PIN_GROUP("pwm7-c-28", x1830_pwm_pwm7_c_28),
>> +    INGENIC_PIN_GROUP("mac", x1830_mac),
>> +};
>> +
>> +static const char *x1830_uart0_groups[] = { "uart0-data", 
>> "uart0-hwflow", };
>> +static const char *x1830_uart1_groups[] = { "uart1-data", };
>> +static const char *x1830_sfc_groups[] = { "sfc", };
>> +static const char *x1830_ssi0_groups[] = {
>> +    "ssi0-dt", "ssi0-dr", "ssi0-clk", "ssi0-gpc", "ssi0-ce0", 
>> "ssi0-ce1",
>> +};
>> +static const char *x1830_ssi1_groups[] = {
>> +    "ssi1-dt-c", "ssi1-dt-d",
>> +    "ssi1-dr-c", "ssi1-dr-d",
>> +    "ssi1-clk-c", "ssi1-clk-d",
>> +    "ssi1-gpc-c", "ssi1-gpc-d",
>> +    "ssi1-ce0-c", "ssi1-ce0-d",
>> +    "ssi1-ce1-c", "ssi1-ce1-d",
>> +};
>> +static const char *x1830_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
>> +static const char *x1830_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
>> +static const char *x1830_i2c0_groups[] = { "i2c0-data", };
>> +static const char *x1830_i2c1_groups[] = { "i2c1-data", };
>> +static const char *x1830_i2c2_groups[] = { "i2c2-data", };
>> +static const char *x1830_pwm0_groups[] = { "pwm0-b", "pwm0-c", };
>> +static const char *x1830_pwm1_groups[] = { "pwm1-b", "pwm1-c", };
>> +static const char *x1830_pwm2_groups[] = { "pwm2-c-8", "pwm2-c-13", };
>> +static const char *x1830_pwm3_groups[] = { "pwm3-c-9", "pwm3-c-14", };
>> +static const char *x1830_pwm4_groups[] = { "pwm4-c-15", "pwm4-c-25", };
>> +static const char *x1830_pwm5_groups[] = { "pwm5-c-16", "pwm5-c-26", };
>> +static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
>> +static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
>> +static const char *x1830_mac_groups[] = { "mac", };
>> +
>> +static const struct function_desc x1830_functions[] = {
>> +    { "uart0", x1830_uart0_groups, ARRAY_SIZE(x1830_uart0_groups), },
>> +    { "uart1", x1830_uart1_groups, ARRAY_SIZE(x1830_uart1_groups), },
>> +    { "sfc", x1830_sfc_groups, ARRAY_SIZE(x1830_sfc_groups), },
>> +    { "ssi0", x1830_ssi0_groups, ARRAY_SIZE(x1830_ssi0_groups), },
>> +    { "ssi1", x1830_ssi1_groups, ARRAY_SIZE(x1830_ssi1_groups), },
>> +    { "mmc0", x1830_mmc0_groups, ARRAY_SIZE(x1830_mmc0_groups), },
>> +    { "mmc1", x1830_mmc1_groups, ARRAY_SIZE(x1830_mmc1_groups), },
>> +    { "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
>> +    { "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
>> +    { "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
>> +    { "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
>> +    { "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
>> +    { "pwm2", x1830_pwm2_groups, ARRAY_SIZE(x1830_pwm2_groups), },
>> +    { "pwm3", x1830_pwm3_groups, ARRAY_SIZE(x1830_pwm3_groups), },
>> +    { "pwm4", x1830_pwm4_groups, ARRAY_SIZE(x1830_pwm4_groups), },
>> +    { "pwm5", x1830_pwm5_groups, ARRAY_SIZE(x1830_pwm4_groups), },
>> +    { "pwm6", x1830_pwm6_groups, ARRAY_SIZE(x1830_pwm4_groups), },
>> +    { "pwm7", x1830_pwm7_groups, ARRAY_SIZE(x1830_pwm4_groups), },
>> +    { "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
>> +};
>> +
>> +static const struct ingenic_chip_info x1830_chip_info = {
>> +    .num_chips = 4,
>> +    .reg_offset = 0x1000,
>> +    .groups = x1830_groups,
>> +    .num_groups = ARRAY_SIZE(x1830_groups),
>> +    .functions = x1830_functions,
>> +    .num_functions = ARRAY_SIZE(x1830_functions),
>> +    .pull_ups = x1830_pull_ups,
>> +    .pull_downs = x1830_pull_downs,
>> +};
>> +
>>  static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 
>> reg)
>>  {
>>      unsigned int val;
>> @@ -1427,12 +1660,13 @@ static void 
>> ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
>>      else
>>          reg = REG_CLEAR(reg);
>>
>> -    regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, 
>> BIT(offset));
>> +    regmap_write(jzgc->jzpc->map, 
>> REG_PZ_BASE(jzgc->jzpc->info->reg_offset) +
>> +            reg, BIT(offset));
>>  }
>>
>>  static void ingenic_gpio_shadow_set_bit_load(struct 
>> ingenic_gpio_chip *jzgc)
>>  {
>> -    regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
>> +    regmap_write(jzgc->jzpc->map, 
>> REG_PZ_GID2LD(jzgc->jzpc->info->reg_offset),
>>              jzgc->gc.base / PINS_PER_GPIO_CHIP);
>>  }
>>
>> @@ -1675,7 +1909,7 @@ static inline void ingenic_config_pin(struct 
>> ingenic_pinctrl *jzpc,
>>      unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>>      unsigned int offt = pin / PINS_PER_GPIO_CHIP;
>>
>> -    regmap_write(jzpc->map, offt * 0x100 +
>> +    regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
>>              (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>>  }
>>
>> @@ -1684,14 +1918,15 @@ static inline void 
>> ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
>>  {
>>      unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>>
>> -    regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
>> +    regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
>>              (set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
>>  }
>>
>>  static inline void ingenic_shadow_config_pin_load(struct 
>> ingenic_pinctrl *jzpc,
>>          unsigned int pin)
>>  {
>> -    regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, pin / 
>> PINS_PER_GPIO_CHIP);
>> +    regmap_write(jzpc->map, REG_PZ_GID2LD(jzpc->info->reg_offset),
>> +            pin / PINS_PER_GPIO_CHIP);
>>  }
>>
>>  static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
>> @@ -1701,7 +1936,7 @@ static inline bool 
>> ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
>>      unsigned int offt = pin / PINS_PER_GPIO_CHIP;
>>      unsigned int val;
>>
>> -    regmap_read(jzpc->map, offt * 0x100 + reg, &val);
>> +    regmap_read(jzpc->map, offt * jzpc->info->reg_offset + reg, &val);
>>
>>      return val & BIT(idx);
>>  }
>> @@ -1862,12 +2097,31 @@ static int ingenic_pinconf_get(struct 
>> pinctrl_dev *pctldev,
>>  }
>>
>>  static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
>> -        unsigned int pin, bool enabled)
>> +        unsigned int pin, unsigned int bias)
>>  {
>> -    if (jzpc->version >= ID_JZ4760)
>> -        ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !enabled);
>> -    else
>> -        ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
>> +    if (jzpc->version >= ID_X1830) {
>> +        unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>> +        unsigned int half = PINS_PER_GPIO_CHIP / 2;
>> +        unsigned int idxh = pin % half * 2;
>> +        unsigned int offt = pin / PINS_PER_GPIO_CHIP;
>> +
>> +        if (idx < half) {
>> +            regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    REG_CLEAR(X1830_GPIO_PEL), 3 << idxh);
>> +            regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    REG_SET(X1830_GPIO_PEL), bias << idxh);
>> +        } else {
>> +            regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    REG_CLEAR(X1830_GPIO_PEH), 3 << idxh);
>> +            regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
>> +                    REG_SET(X1830_GPIO_PEH), bias << idxh);
>> +        }
>> +
>> +    } else if (jzpc->version >= ID_JZ4760) {
>> +        ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
>> +    } else {
>> +        ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
>> +    }
>>  }
>>
>>  static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
>> @@ -1907,7 +2161,7 @@ static int ingenic_pinconf_set(struct 
>> pinctrl_dev *pctldev, unsigned int pin,
>>          case PIN_CONFIG_BIAS_DISABLE:
>>              dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
>>                      'A' + offt, idx);
>> -            ingenic_set_bias(jzpc, pin, false);
>> +            ingenic_set_bias(jzpc, pin, GPIO_PULL_DIS);
>>              break;
>>
>>          case PIN_CONFIG_BIAS_PULL_UP:
>> @@ -1915,7 +2169,7 @@ static int ingenic_pinconf_set(struct 
>> pinctrl_dev *pctldev, unsigned int pin,
>>                  return -EINVAL;
>>              dev_dbg(jzpc->dev, "set pull-up for pin P%c%u\n",
>>                      'A' + offt, idx);
>> -            ingenic_set_bias(jzpc, pin, true);
>> +            ingenic_set_bias(jzpc, pin, GPIO_PULL_UP);
>>              break;
>>
>>          case PIN_CONFIG_BIAS_PULL_DOWN:
>> @@ -1923,7 +2177,7 @@ static int ingenic_pinconf_set(struct 
>> pinctrl_dev *pctldev, unsigned int pin,
>>                  return -EINVAL;
>>              dev_dbg(jzpc->dev, "set pull-down for pin P%c%u\n",
>>                      'A' + offt, idx);
>> -            ingenic_set_bias(jzpc, pin, true);
>> +            ingenic_set_bias(jzpc, pin, GPIO_PULL_DOWN);
>>              break;
>>
>>          case PIN_CONFIG_OUTPUT:
>> @@ -2013,6 +2267,7 @@ static const struct of_device_id 
>> ingenic_pinctrl_of_match[] = {
>>      { .compatible = "ingenic,x1000-pinctrl", .data = (void *) 
>> ID_X1000 },
>>      { .compatible = "ingenic,x1000e-pinctrl", .data = (void *) 
>> ID_X1000E },
>>      { .compatible = "ingenic,x1500-pinctrl", .data = (void *) 
>> ID_X1500 },
>> +    { .compatible = "ingenic,x1830-pinctrl", .data = (void *) 
>> ID_X1830 },
>>      {},
>>  };
>>
>> @@ -2022,6 +2277,7 @@ static const struct of_device_id 
>> ingenic_gpio_of_match[] __initconst = {
>>      { .compatible = "ingenic,jz4770-gpio", },
>>      { .compatible = "ingenic,jz4780-gpio", },
>>      { .compatible = "ingenic,x1000-gpio", },
>> +    { .compatible = "ingenic,x1830-gpio", },
>>      {},
>>  };
>>
>> @@ -2045,7 +2301,7 @@ static int __init ingenic_gpio_probe(struct 
>> ingenic_pinctrl *jzpc,
>>          return -ENOMEM;
>>
>>      jzgc->jzpc = jzpc;
>> -    jzgc->reg_base = bank * 0x100;
>> +    jzgc->reg_base = bank * jzpc->info->reg_offset;
>>
>>      jzgc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "GPIO%c", 'A' + 
>> bank);
>>      if (!jzgc->gc.label)
>> @@ -2143,7 +2399,9 @@ static int __init ingenic_pinctrl_probe(struct 
>> platform_device *pdev)
>>      else
>>          jzpc->version = (enum jz_version)id->driver_data;
>>
>> -    if (jzpc->version >= ID_X1500)
>> +    if (jzpc->version >= ID_X1830)
>> +        chip_info = &x1830_chip_info;
>> +    else if (jzpc->version >= ID_X1500)
>>          chip_info = &x1500_chip_info;
>>      else if (jzpc->version >= ID_X1000E)
>>          chip_info = &x1000e_chip_info;
>> @@ -2240,6 +2498,7 @@ static const struct platform_device_id 
>> ingenic_pinctrl_ids[] = {
>>      { "x1000-pinctrl", ID_X1000 },
>>      { "x1000e-pinctrl", ID_X1000E },
>>      { "x1500-pinctrl", ID_X1500 },
>> +    { "x1830-pinctrl", ID_X1830 },
>>      {},
>>  };
>>
>> -- 
>> 2.7.4
>>
>

