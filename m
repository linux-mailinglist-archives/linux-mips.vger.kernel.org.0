Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1540F348BAF
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 09:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhCYIjz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 04:39:55 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:45700 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYIjj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 04:39:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.422888-0.000285545-0.576826;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jq0nLNT_1616661574;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jq0nLNT_1616661574)
          by smtp.aliyun-inc.com(10.147.40.26);
          Thu, 25 Mar 2021 16:39:35 +0800
Subject: Re: [PATCH v3 09/10] pinctrl: Ingenic: Add pinctrl driver for JZ4775.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615975084-68203-10-git-send-email-zhouyanjie@wanyeetech.com>
 <W5VDQQ.VB9HP582KGC7@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <7d3f12a8-6e6a-fc1e-d92e-99f3bff1a844@wanyeetech.com>
Date:   Thu, 25 Mar 2021 16:39:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <W5VDQQ.VB9HP582KGC7@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2021/3/23 上午2:25, Paul Cercueil wrote:
>
>
> Le mer. 17 mars 2021 à 17:58, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing the pinctrl-ingenic driver on the
>> JZ4775 SoC from Ingenic.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v3:
>>     New patch.
>>
>>  drivers/pinctrl/pinctrl-ingenic.c | 259 
>> ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 259 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
>> b/drivers/pinctrl/pinctrl-ingenic.c
>> index d8b37fa..eb4912d 100644
>> --- a/drivers/pinctrl/pinctrl-ingenic.c
>> +++ b/drivers/pinctrl/pinctrl-ingenic.c
>> @@ -89,6 +89,7 @@ enum jz_version {
>>      ID_JZ4755,
>>      ID_JZ4760,
>>      ID_JZ4770,
>> +    ID_JZ4775,
>>      ID_JZ4780,
>>      ID_X1000,
>>      ID_X1500,
>> @@ -1237,6 +1238,259 @@ static const struct ingenic_chip_info 
>> jz4770_chip_info = {
>>      .pull_downs = jz4770_pull_downs,
>>  };
>>
>> +static const u32 jz4775_pull_ups[7] = {
>> +    0x28ff00ff, 0xf030f3fc, 0x0fffffff, 0xfffe4000, 0xf0f0000c, 
>> 0x0000f00f, 0x0000f3c0,
>> +};
>> +
>> +static const u32 jz4775_pull_downs[7] = {
>> +    0x00000000, 0x00030c03, 0x00000000, 0x00008000, 0x00000403, 
>> 0x00000ff0, 0x00030c00,
>> +};
>> +
>> +static int jz4775_uart0_data_pins[] = { 0xa0, 0xa3, };
>> +static int jz4775_uart0_hwflow_pins[] = { 0xa1, 0xa2, };
>> +static int jz4775_uart1_data_pins[] = { 0x7a, 0x7c, };
>> +static int jz4775_uart1_hwflow_pins[] = { 0x7b, 0x7d, };
>> +static int jz4775_uart2_data_c_pins[] = { 0x54, 0x4a, };
>> +static int jz4775_uart2_data_f_pins[] = { 0xa5, 0xa4, };
>> +static int jz4775_uart3_data_pins[] = { 0x1e, 0x1f, };
>> +static int jz4775_ssi_dt_a_pins[] = { 0x13, };
>> +static int jz4775_ssi_dt_d_pins[] = { 0x75, };
>> +static int jz4775_ssi_dr_a_pins[] = { 0x14, };
>> +static int jz4775_ssi_dr_d_pins[] = { 0x74, };
>> +static int jz4775_ssi_clk_a_pins[] = { 0x12, };
>> +static int jz4775_ssi_clk_d_pins[] = { 0x78, };
>> +static int jz4775_ssi_gpc_pins[] = { 0x76, };
>> +static int jz4775_ssi_ce0_a_pins[] = { 0x17, };
>> +static int jz4775_ssi_ce0_d_pins[] = { 0x79, };
>> +static int jz4775_ssi_ce1_pins[] = { 0x77, };
>> +static int jz4775_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
>> +static int jz4775_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
>> +static int jz4775_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, };
>> +static int jz4775_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
>> +static int jz4775_mmc0_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
>> +static int jz4775_mmc1_1bit_d_pins[] = { 0x78, 0x79, 0x74, };
>> +static int jz4775_mmc1_4bit_d_pins[] = { 0x75, 0x76, 0x77, };
>> +static int jz4775_mmc1_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
>> +static int jz4775_mmc1_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
>> +static int jz4775_mmc2_1bit_b_pins[] = { 0x3c, 0x3d, 0x34, };
>> +static int jz4775_mmc2_4bit_b_pins[] = { 0x35, 0x3e, 0x3f, };
>> +static int jz4775_mmc2_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
>> +static int jz4775_mmc2_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
>> +static int jz4775_nemc_8bit_data_pins[] = {
>> +    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
>> +};
>> +static int jz4775_nemc_16bit_data_pins[] = {
>> +    0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1,
>> +};
>> +static int jz4775_nemc_cle_ale_pins[] = { 0x20, 0x21, };
>> +static int jz4775_nemc_addr_pins[] = { 0x22, 0x23, 0x24, 0x25, };
>> +static int jz4775_nemc_rd_we_pins[] = { 0x10, 0x11, };
>> +static int jz4775_nemc_frd_fwe_pins[] = { 0x12, 0x13, };
>> +static int jz4775_nemc_wait_pins[] = { 0x1b, };
>> +static int jz4775_nemc_cs1_pins[] = { 0x15, };
>> +static int jz4775_nemc_cs2_pins[] = { 0x16, };
>> +static int jz4775_nemc_cs3_pins[] = { 0x17, };
>> +static int jz4775_i2c0_pins[] = { 0x7e, 0x7f, };
>> +static int jz4775_i2c1_pins[] = { 0x9e, 0x9f, };
>> +static int jz4775_i2c2_pins[] = { 0x80, 0x83, };
>> +static int jz4775_i2s_data_tx_pins[] = { 0xa3, };
>> +static int jz4775_i2s_data_rx_pins[] = { 0xa2, };
>> +static int jz4775_i2s_clk_txrx_pins[] = { 0xa0, 0xa1, };
>> +static int jz4775_i2s_sysclk_pins[] = { 0x83, };
>> +static int jz4775_cim_pins[] = {
>> +    0x26, 0x27, 0x28, 0x29,
>> +    0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
>> +};
>> +static int jz4775_lcd_24bit_pins[] = {
>> +    0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
>> +    0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
>> +    0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
>> +    0x58, 0x59, 0x5a, 0x5b,
>> +};
>> +static int jz4775_pwm_pwm0_pins[] = { 0x80, };
>> +static int jz4775_pwm_pwm1_pins[] = { 0x81, };
>> +static int jz4775_pwm_pwm2_pins[] = { 0x82, };
>> +static int jz4775_pwm_pwm3_pins[] = { 0x83, };
>> +static int jz4775_mac_rmii_pins[] = {
>> +    0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
>> +};
>> +static int jz4775_mac_mii_pins[] = {
>> +    0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,
>> +};
>> +static int jz4775_mac_rgmii_pins[] = {
>> +    0xa9, 0x7b, 0x7a, 0xab, 0xaa, 0xac, 0x7d, 0x7c, 0xa5, 0xa4,
>> +    0xad, 0xae, 0xa7, 0xa6,
>> +};
>> +static int jz4775_mac_gmii_pins[] = {
>> +    0x31, 0x30, 0x2f, 0x2e, 0x2d, 0x2c, 0x2b, 0x2a,
>> +    0xa8, 0x28, 0x24, 0xaf,
>> +};
>> +static int jz4775_otg_pins[] = { 0x8a, };
>> +
>> +static u8 jz4775_uart3_data_funcs[] = { 0, 1, };
>> +static u8 jz4775_mac_mii_funcs[] = { 1, 1, 1, 1, 0, 1, 0, };
>> +static u8 jz4775_mac_rgmii_funcs[] = {
>> +    0, 1, 1, 0, 0, 0, 1, 1, 0, 0,
>> +    0, 0, 0, 0,
>> +};
>> +static u8 jz4775_mac_gmii_funcs[] = {
>> +    1, 1, 1, 1, 1, 1, 1, 1,
>> +    0, 1, 1, 0,
>> +};
>> +
>> +static const struct group_desc jz4775_groups[] = {
>> +    INGENIC_PIN_GROUP("uart0-data", jz4775_uart0_data, 0),
>> +    INGENIC_PIN_GROUP("uart0-hwflow", jz4775_uart0_hwflow, 0),
>> +    INGENIC_PIN_GROUP("uart1-data", jz4775_uart1_data, 0),
>> +    INGENIC_PIN_GROUP("uart1-hwflow", jz4775_uart1_hwflow, 0),
>> +    INGENIC_PIN_GROUP("uart2-data-c", jz4775_uart2_data_c, 2),
>> +    INGENIC_PIN_GROUP("uart2-data-f", jz4775_uart2_data_f, 1),
>> +    INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4775_uart3_data,
>> +                jz4775_uart3_data_funcs),
>> +    INGENIC_PIN_GROUP("ssi-dt-a", jz4775_ssi_dt_a, 2),
>> +    INGENIC_PIN_GROUP("ssi-dt-d", jz4775_ssi_dt_d, 1),
>> +    INGENIC_PIN_GROUP("ssi-dr-a", jz4775_ssi_dr_a, 2),
>> +    INGENIC_PIN_GROUP("ssi-dr-d", jz4775_ssi_dr_d, 1),
>> +    INGENIC_PIN_GROUP("ssi-clk-a", jz4775_ssi_clk_a, 2),
>> +    INGENIC_PIN_GROUP("ssi-clk-d", jz4775_ssi_clk_d, 1),
>> +    INGENIC_PIN_GROUP("ssi-gpc", jz4775_ssi_gpc, 1),
>> +    INGENIC_PIN_GROUP("ssi-ce0-a", jz4775_ssi_ce0_a, 2),
>> +    INGENIC_PIN_GROUP("ssi-ce0-d", jz4775_ssi_ce0_d, 1),
>> +    INGENIC_PIN_GROUP("ssi-ce1", jz4775_ssi_ce1, 1),
>> +    INGENIC_PIN_GROUP("mmc0-1bit-a", jz4775_mmc0_1bit_a, 1),
>> +    INGENIC_PIN_GROUP("mmc0-4bit-a", jz4775_mmc0_4bit_a, 1),
>> +    INGENIC_PIN_GROUP("mmc0-8bit-a", jz4775_mmc0_8bit_a, 1),
>> +    INGENIC_PIN_GROUP("mmc0-1bit-e", jz4775_mmc0_1bit_e, 0),
>> +    INGENIC_PIN_GROUP("mmc0-4bit-e", jz4775_mmc0_4bit_e, 0),
>> +    INGENIC_PIN_GROUP("mmc1-1bit-d", jz4775_mmc1_1bit_d, 0),
>> +    INGENIC_PIN_GROUP("mmc1-4bit-d", jz4775_mmc1_4bit_d, 0),
>> +    INGENIC_PIN_GROUP("mmc1-1bit-e", jz4775_mmc1_1bit_e, 1),
>> +    INGENIC_PIN_GROUP("mmc1-4bit-e", jz4775_mmc1_4bit_e, 1),
>> +    INGENIC_PIN_GROUP("mmc2-1bit-b", jz4775_mmc2_1bit_b, 0),
>> +    INGENIC_PIN_GROUP("mmc2-4bit-b", jz4775_mmc2_4bit_b, 0),
>> +    INGENIC_PIN_GROUP("mmc2-1bit-e", jz4775_mmc2_1bit_e, 2),
>> +    INGENIC_PIN_GROUP("mmc2-4bit-e", jz4775_mmc2_4bit_e, 2),
>> +    INGENIC_PIN_GROUP("nemc-8bit-data", jz4775_nemc_8bit_data, 0),
>> +    INGENIC_PIN_GROUP("nemc-16bit-data", jz4775_nemc_16bit_data, 1),
>> +    INGENIC_PIN_GROUP("nemc-cle-ale", jz4775_nemc_cle_ale, 0),
>> +    INGENIC_PIN_GROUP("nemc-addr", jz4775_nemc_addr, 0),
>> +    INGENIC_PIN_GROUP("nemc-rd-we", jz4775_nemc_rd_we, 0),
>> +    INGENIC_PIN_GROUP("nemc-frd-fwe", jz4775_nemc_frd_fwe, 0),
>> +    INGENIC_PIN_GROUP("nemc-wait", jz4775_nemc_wait, 0),
>> +    INGENIC_PIN_GROUP("nemc-cs1", jz4775_nemc_cs1, 0),
>> +    INGENIC_PIN_GROUP("nemc-cs2", jz4775_nemc_cs2, 0),
>> +    INGENIC_PIN_GROUP("nemc-cs3", jz4775_nemc_cs3, 0),
>> +    INGENIC_PIN_GROUP("i2c0-data", jz4775_i2c0, 0),
>> +    INGENIC_PIN_GROUP("i2c1-data", jz4775_i2c1, 0),
>> +    INGENIC_PIN_GROUP("i2c2-data", jz4775_i2c2, 1),
>> +    INGENIC_PIN_GROUP("i2s-data-tx", jz4775_i2s_data_tx, 1),
>> +    INGENIC_PIN_GROUP("i2s-data-rx", jz4775_i2s_data_rx, 1),
>> +    INGENIC_PIN_GROUP("i2s-clk-txrx", jz4775_i2s_clk_txrx, 1),
>> +    INGENIC_PIN_GROUP("i2s-sysclk", jz4775_i2s_sysclk, 2),
>> +    INGENIC_PIN_GROUP("cim-data", jz4775_cim, 0),
>> +    INGENIC_PIN_GROUP("lcd-24bit", jz4775_lcd_24bit, 0),
>
> Same comments as the previous patch.


Sure.


>
>> +    { "lcd-no-pins", },
>
> And here too.
>
> Cheers,
> -Paul
>
>> +    INGENIC_PIN_GROUP("pwm0", jz4775_pwm_pwm0, 0),
>> +    INGENIC_PIN_GROUP("pwm1", jz4775_pwm_pwm1, 0),
>> +    INGENIC_PIN_GROUP("pwm2", jz4775_pwm_pwm2, 0),
>> +    INGENIC_PIN_GROUP("pwm3", jz4775_pwm_pwm3, 0),
>> +    INGENIC_PIN_GROUP("mac-rmii", jz4775_mac_rmii, 0),
>> +    INGENIC_PIN_GROUP_FUNCS("mac-mii", jz4775_mac_mii,
>> +                jz4775_mac_mii_funcs),
>> +    INGENIC_PIN_GROUP_FUNCS("mac-rgmii", jz4775_mac_rgmii,
>> +                jz4775_mac_rgmii_funcs),
>> +    INGENIC_PIN_GROUP_FUNCS("mac-gmii", jz4775_mac_gmii,
>> +                jz4775_mac_gmii_funcs),
>> +    INGENIC_PIN_GROUP("otg-vbus", jz4775_otg, 0),
>> +};
>> +
>> +static const char *jz4775_uart0_groups[] = { "uart0-data", 
>> "uart0-hwflow", };
>> +static const char *jz4775_uart1_groups[] = { "uart1-data", 
>> "uart1-hwflow", };
>> +static const char *jz4775_uart2_groups[] = { "uart2-data-c", 
>> "uart2-data-f", };
>> +static const char *jz4775_uart3_groups[] = { "uart3-data", };
>> +static const char *jz4775_ssi_groups[] = {
>> +    "ssi-dt-a", "ssi-dt-d",
>> +    "ssi-dr-a", "ssi-dr-d",
>> +    "ssi-clk-a", "ssi-clk-d",
>> +    "ssi-gpc",
>> +    "ssi-ce0-a", "ssi-ce0-d",
>> +    "ssi-ce1",
>> +};
>> +static const char *jz4775_mmc0_groups[] = {
>> +    "mmc0-1bit-a", "mmc0-4bit-a", "mmc0-8bit-a",
>> +    "mmc0-1bit-e", "mmc0-4bit-e",
>> +};
>> +static const char *jz4775_mmc1_groups[] = {
>> +    "mmc1-1bit-d", "mmc1-4bit-d",
>> +    "mmc1-1bit-e", "mmc1-4bit-e",
>> +};
>> +static const char *jz4775_mmc2_groups[] = {
>> +    "mmc2-1bit-b", "mmc2-4bit-b",
>> +    "mmc2-1bit-e", "mmc2-4bit-e",
>> +};
>> +static const char *jz4775_nemc_groups[] = {
>> +    "nemc-8bit-data", "nemc-16bit-data", "nemc-cle-ale",
>> +    "nemc-addr", "nemc-rd-we", "nemc-frd-fwe", "nemc-wait",
>> +};
>> +static const char *jz4775_cs1_groups[] = { "nemc-cs1", };
>> +static const char *jz4775_cs2_groups[] = { "nemc-cs2", };
>> +static const char *jz4775_cs3_groups[] = { "nemc-cs3", };
>> +static const char *jz4775_i2c0_groups[] = { "i2c0-data", };
>> +static const char *jz4775_i2c1_groups[] = { "i2c1-data", };
>> +static const char *jz4775_i2c2_groups[] = { "i2c2-data", };
>> +static const char *jz4775_i2s_groups[] = {
>> +    "i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
>> +};
>> +static const char *jz4775_cim_groups[] = { "cim-data", };
>> +static const char *jz4775_lcd_groups[] = { "lcd-24bit", 
>> "lcd-no-pins", };
>> +static const char *jz4775_pwm0_groups[] = { "pwm0", };
>> +static const char *jz4775_pwm1_groups[] = { "pwm1", };
>> +static const char *jz4775_pwm2_groups[] = { "pwm2", };
>> +static const char *jz4775_pwm3_groups[] = { "pwm3", };
>> +static const char *jz4775_mac_groups[] = {
>> +    "mac-rmii", "mac-mii", "mac-rgmii", "mac-gmii",
>> +};
>> +static const char *jz4775_otg_groups[] = { "otg-vbus", };
>> +
>> +static const struct function_desc jz4775_functions[] = {
>> +    { "uart0", jz4775_uart0_groups, ARRAY_SIZE(jz4775_uart0_groups), },
>> +    { "uart1", jz4775_uart1_groups, ARRAY_SIZE(jz4775_uart1_groups), },
>> +    { "uart2", jz4775_uart2_groups, ARRAY_SIZE(jz4775_uart2_groups), },
>> +    { "uart3", jz4775_uart3_groups, ARRAY_SIZE(jz4775_uart3_groups), },
>> +    { "ssi", jz4775_ssi_groups, ARRAY_SIZE(jz4775_ssi_groups), },
>> +    { "mmc0", jz4775_mmc0_groups, ARRAY_SIZE(jz4775_mmc0_groups), },
>> +    { "mmc1", jz4775_mmc1_groups, ARRAY_SIZE(jz4775_mmc1_groups), },
>> +    { "mmc2", jz4775_mmc2_groups, ARRAY_SIZE(jz4775_mmc2_groups), },
>> +    { "nemc", jz4775_nemc_groups, ARRAY_SIZE(jz4775_nemc_groups), },
>> +    { "nemc-cs1", jz4775_cs1_groups, ARRAY_SIZE(jz4775_cs1_groups), },
>> +    { "nemc-cs2", jz4775_cs2_groups, ARRAY_SIZE(jz4775_cs2_groups), },
>> +    { "nemc-cs3", jz4775_cs3_groups, ARRAY_SIZE(jz4775_cs3_groups), },
>> +    { "i2c0", jz4775_i2c0_groups, ARRAY_SIZE(jz4775_i2c0_groups), },
>> +    { "i2c1", jz4775_i2c1_groups, ARRAY_SIZE(jz4775_i2c1_groups), },
>> +    { "i2c2", jz4775_i2c2_groups, ARRAY_SIZE(jz4775_i2c2_groups), },
>> +    { "i2s", jz4775_i2s_groups, ARRAY_SIZE(jz4775_i2s_groups), },
>> +    { "cim", jz4775_cim_groups, ARRAY_SIZE(jz4775_cim_groups), },
>> +    { "lcd", jz4775_lcd_groups, ARRAY_SIZE(jz4775_lcd_groups), },
>> +    { "pwm0", jz4775_pwm0_groups, ARRAY_SIZE(jz4775_pwm0_groups), },
>> +    { "pwm1", jz4775_pwm1_groups, ARRAY_SIZE(jz4775_pwm1_groups), },
>> +    { "pwm2", jz4775_pwm2_groups, ARRAY_SIZE(jz4775_pwm2_groups), },
>> +    { "pwm3", jz4775_pwm3_groups, ARRAY_SIZE(jz4775_pwm3_groups), },
>> +    { "mac", jz4775_mac_groups, ARRAY_SIZE(jz4775_mac_groups), },
>> +    { "otg", jz4775_otg_groups, ARRAY_SIZE(jz4775_otg_groups), },
>> +};
>> +
>> +static const struct ingenic_chip_info jz4775_chip_info = {
>> +    .num_chips = 7,
>> +    .reg_offset = 0x100,
>> +    .version = ID_JZ4775,
>> +    .groups = jz4775_groups,
>> +    .num_groups = ARRAY_SIZE(jz4775_groups),
>> +    .functions = jz4775_functions,
>> +    .num_functions = ARRAY_SIZE(jz4775_functions),
>> +    .pull_ups = jz4775_pull_ups,
>> +    .pull_downs = jz4775_pull_downs,
>> +};
>> +
>>  static const u32 jz4780_pull_ups[6] = {
>>      0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xfffffb7c, 
>> 0x7fa7f00f,
>>  };
>> @@ -2775,6 +3029,7 @@ static const struct of_device_id 
>> ingenic_gpio_of_match[] __initconst = {
>>      { .compatible = "ingenic,jz4755-gpio", },
>>      { .compatible = "ingenic,jz4760-gpio", },
>>      { .compatible = "ingenic,jz4770-gpio", },
>> +    { .compatible = "ingenic,jz4775-gpio", },
>>      { .compatible = "ingenic,jz4780-gpio", },
>>      { .compatible = "ingenic,x1000-gpio", },
>>      { .compatible = "ingenic,x1830-gpio", },
>> @@ -2997,6 +3252,10 @@ static const struct of_device_id 
>> ingenic_pinctrl_of_match[] = {
>>          .data = IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_info)
>>      },
>>      {
>> +        .compatible = "ingenic,jz4775-pinctrl",
>> +        .data = IF_ENABLED(CONFIG_MACH_JZ4775, &jz4775_chip_info)
>> +    },
>> +    {
>>          .compatible = "ingenic,jz4780-pinctrl",
>>          .data = IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_info)
>>      },
>> -- 
>> 2.7.4
>>
>
