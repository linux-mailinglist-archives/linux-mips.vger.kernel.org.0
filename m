Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D4C362F0F
	for <lists+linux-mips@lfdr.de>; Sat, 17 Apr 2021 11:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhDQJwl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 17 Apr 2021 05:52:41 -0400
Received: from aposti.net ([89.234.176.197]:40966 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhDQJwl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Apr 2021 05:52:41 -0400
Date:   Sat, 17 Apr 2021 10:52:01 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 10/11] pinctrl: Ingenic: Add pinctrl driver for JZ4775.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        siyanteng@loongson.cn
Message-Id: <PQCPRQ.YBZIFSORZNA7@crapouillou.net>
In-Reply-To: <1618589645-96504-11-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1618589645-96504-11-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam. 17 avril 2021 à 0:14, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add support for probing the pinctrl-ingenic driver on the
> JZ4775 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v3:
>     New patch.
> 
>     v3->v4:
>     1.Split lcd pins into several groups.
>     2.Drop "lcd-no-pins" which is pointless.
> 
>     v4->v5:
>     No change.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 275 
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 3b649fb..9bf9100 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -89,6 +89,7 @@ enum jz_version {
>  	ID_JZ4755,
>  	ID_JZ4760,
>  	ID_JZ4770,
> +	ID_JZ4775,
>  	ID_JZ4780,
>  	ID_X1000,
>  	ID_X1500,
> @@ -1261,6 +1262,275 @@ static const struct ingenic_chip_info 
> jz4770_chip_info = {
>  	.pull_downs = jz4770_pull_downs,
>  };
> 
> +static const u32 jz4775_pull_ups[7] = {
> +	0x28ff00ff, 0xf030f3fc, 0x0fffffff, 0xfffe4000, 0xf0f0000c, 
> 0x0000f00f, 0x0000f3c0,
> +};
> +
> +static const u32 jz4775_pull_downs[7] = {
> +	0x00000000, 0x00030c03, 0x00000000, 0x00008000, 0x00000403, 
> 0x00000ff0, 0x00030c00,
> +};
> +
> +static int jz4775_uart0_data_pins[] = { 0xa0, 0xa3, };
> +static int jz4775_uart0_hwflow_pins[] = { 0xa1, 0xa2, };
> +static int jz4775_uart1_data_pins[] = { 0x7a, 0x7c, };
> +static int jz4775_uart1_hwflow_pins[] = { 0x7b, 0x7d, };
> +static int jz4775_uart2_data_c_pins[] = { 0x54, 0x4a, };
> +static int jz4775_uart2_data_f_pins[] = { 0xa5, 0xa4, };
> +static int jz4775_uart3_data_pins[] = { 0x1e, 0x1f, };
> +static int jz4775_ssi_dt_a_pins[] = { 0x13, };
> +static int jz4775_ssi_dt_d_pins[] = { 0x75, };
> +static int jz4775_ssi_dr_a_pins[] = { 0x14, };
> +static int jz4775_ssi_dr_d_pins[] = { 0x74, };
> +static int jz4775_ssi_clk_a_pins[] = { 0x12, };
> +static int jz4775_ssi_clk_d_pins[] = { 0x78, };
> +static int jz4775_ssi_gpc_pins[] = { 0x76, };
> +static int jz4775_ssi_ce0_a_pins[] = { 0x17, };
> +static int jz4775_ssi_ce0_d_pins[] = { 0x79, };
> +static int jz4775_ssi_ce1_pins[] = { 0x77, };
> +static int jz4775_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
> +static int jz4775_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
> +static int jz4775_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, };
> +static int jz4775_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
> +static int jz4775_mmc0_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
> +static int jz4775_mmc1_1bit_d_pins[] = { 0x78, 0x79, 0x74, };
> +static int jz4775_mmc1_4bit_d_pins[] = { 0x75, 0x76, 0x77, };
> +static int jz4775_mmc1_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
> +static int jz4775_mmc1_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
> +static int jz4775_mmc2_1bit_b_pins[] = { 0x3c, 0x3d, 0x34, };
> +static int jz4775_mmc2_4bit_b_pins[] = { 0x35, 0x3e, 0x3f, };
> +static int jz4775_mmc2_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
> +static int jz4775_mmc2_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
> +static int jz4775_nemc_8bit_data_pins[] = {
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +};
> +static int jz4775_nemc_16bit_data_pins[] = {
> +	0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1,
> +};
> +static int jz4775_nemc_cle_ale_pins[] = { 0x20, 0x21, };
> +static int jz4775_nemc_addr_pins[] = { 0x22, 0x23, 0x24, 0x25, };
> +static int jz4775_nemc_rd_we_pins[] = { 0x10, 0x11, };
> +static int jz4775_nemc_frd_fwe_pins[] = { 0x12, 0x13, };
> +static int jz4775_nemc_wait_pins[] = { 0x1b, };
> +static int jz4775_nemc_cs1_pins[] = { 0x15, };
> +static int jz4775_nemc_cs2_pins[] = { 0x16, };
> +static int jz4775_nemc_cs3_pins[] = { 0x17, };
> +static int jz4775_i2c0_pins[] = { 0x7e, 0x7f, };
> +static int jz4775_i2c1_pins[] = { 0x9e, 0x9f, };
> +static int jz4775_i2c2_pins[] = { 0x80, 0x83, };
> +static int jz4775_i2s_data_tx_pins[] = { 0xa3, };
> +static int jz4775_i2s_data_rx_pins[] = { 0xa2, };
> +static int jz4775_i2s_clk_txrx_pins[] = { 0xa0, 0xa1, };
> +static int jz4775_i2s_sysclk_pins[] = { 0x83, };
> +static int jz4775_cim_pins[] = {
> +	0x26, 0x27, 0x28, 0x29,
> +	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
> +};
> +static int jz4775_lcd_8bit_pins[] = {
> +	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x4c, 0x4d,
> +	0x48, 0x52, 0x53,
> +};
> +static int jz4775_lcd_16bit_pins[] = {
> +	0x4e, 0x4f, 0x50, 0x51, 0x56, 0x57, 0x58, 0x59,
> +};
> +static int jz4775_lcd_18bit_pins[] = {
> +	0x5a, 0x5b,
> +};
> +static int jz4775_lcd_24bit_pins[] = {
> +	0x40, 0x41, 0x4a, 0x4b, 0x54, 0x55,
> +};
> +static int jz4775_lcd_special_pins[] = { 0x54, 0x4a, 0x41, 0x40, };
> +static int jz4775_lcd_generic_pins[] = { 0x49, };
> +static int jz4775_pwm_pwm0_pins[] = { 0x80, };
> +static int jz4775_pwm_pwm1_pins[] = { 0x81, };
> +static int jz4775_pwm_pwm2_pins[] = { 0x82, };
> +static int jz4775_pwm_pwm3_pins[] = { 0x83, };
> +static int jz4775_mac_rmii_pins[] = {
> +	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
> +};
> +static int jz4775_mac_mii_pins[] = {
> +	0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,
> +};
> +static int jz4775_mac_rgmii_pins[] = {
> +	0xa9, 0x7b, 0x7a, 0xab, 0xaa, 0xac, 0x7d, 0x7c, 0xa5, 0xa4,
> +	0xad, 0xae, 0xa7, 0xa6,
> +};
> +static int jz4775_mac_gmii_pins[] = {
> +	0x31, 0x30, 0x2f, 0x2e, 0x2d, 0x2c, 0x2b, 0x2a,
> +	0xa8, 0x28, 0x24, 0xaf,
> +};
> +static int jz4775_otg_pins[] = { 0x8a, };
> +
> +static u8 jz4775_uart3_data_funcs[] = { 0, 1, };
> +static u8 jz4775_mac_mii_funcs[] = { 1, 1, 1, 1, 0, 1, 0, };
> +static u8 jz4775_mac_rgmii_funcs[] = {
> +	0, 1, 1, 0, 0, 0, 1, 1, 0, 0,
> +	0, 0, 0, 0,
> +};
> +static u8 jz4775_mac_gmii_funcs[] = {
> +	1, 1, 1, 1, 1, 1, 1, 1,
> +	0, 1, 1, 0,
> +};
> +
> +static const struct group_desc jz4775_groups[] = {
> +	INGENIC_PIN_GROUP("uart0-data", jz4775_uart0_data, 0),
> +	INGENIC_PIN_GROUP("uart0-hwflow", jz4775_uart0_hwflow, 0),
> +	INGENIC_PIN_GROUP("uart1-data", jz4775_uart1_data, 0),
> +	INGENIC_PIN_GROUP("uart1-hwflow", jz4775_uart1_hwflow, 0),
> +	INGENIC_PIN_GROUP("uart2-data-c", jz4775_uart2_data_c, 2),
> +	INGENIC_PIN_GROUP("uart2-data-f", jz4775_uart2_data_f, 1),
> +	INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4775_uart3_data,
> +				jz4775_uart3_data_funcs),
> +	INGENIC_PIN_GROUP("ssi-dt-a", jz4775_ssi_dt_a, 2),
> +	INGENIC_PIN_GROUP("ssi-dt-d", jz4775_ssi_dt_d, 1),
> +	INGENIC_PIN_GROUP("ssi-dr-a", jz4775_ssi_dr_a, 2),
> +	INGENIC_PIN_GROUP("ssi-dr-d", jz4775_ssi_dr_d, 1),
> +	INGENIC_PIN_GROUP("ssi-clk-a", jz4775_ssi_clk_a, 2),
> +	INGENIC_PIN_GROUP("ssi-clk-d", jz4775_ssi_clk_d, 1),
> +	INGENIC_PIN_GROUP("ssi-gpc", jz4775_ssi_gpc, 1),
> +	INGENIC_PIN_GROUP("ssi-ce0-a", jz4775_ssi_ce0_a, 2),
> +	INGENIC_PIN_GROUP("ssi-ce0-d", jz4775_ssi_ce0_d, 1),
> +	INGENIC_PIN_GROUP("ssi-ce1", jz4775_ssi_ce1, 1),
> +	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4775_mmc0_1bit_a, 1),
> +	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4775_mmc0_4bit_a, 1),
> +	INGENIC_PIN_GROUP("mmc0-8bit-a", jz4775_mmc0_8bit_a, 1),
> +	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4775_mmc0_1bit_e, 0),
> +	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4775_mmc0_4bit_e, 0),
> +	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4775_mmc1_1bit_d, 0),
> +	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4775_mmc1_4bit_d, 0),
> +	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4775_mmc1_1bit_e, 1),
> +	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4775_mmc1_4bit_e, 1),
> +	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4775_mmc2_1bit_b, 0),
> +	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4775_mmc2_4bit_b, 0),
> +	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4775_mmc2_1bit_e, 2),
> +	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4775_mmc2_4bit_e, 2),
> +	INGENIC_PIN_GROUP("nemc-8bit-data", jz4775_nemc_8bit_data, 0),
> +	INGENIC_PIN_GROUP("nemc-16bit-data", jz4775_nemc_16bit_data, 1),
> +	INGENIC_PIN_GROUP("nemc-cle-ale", jz4775_nemc_cle_ale, 0),
> +	INGENIC_PIN_GROUP("nemc-addr", jz4775_nemc_addr, 0),
> +	INGENIC_PIN_GROUP("nemc-rd-we", jz4775_nemc_rd_we, 0),
> +	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4775_nemc_frd_fwe, 0),
> +	INGENIC_PIN_GROUP("nemc-wait", jz4775_nemc_wait, 0),
> +	INGENIC_PIN_GROUP("nemc-cs1", jz4775_nemc_cs1, 0),
> +	INGENIC_PIN_GROUP("nemc-cs2", jz4775_nemc_cs2, 0),
> +	INGENIC_PIN_GROUP("nemc-cs3", jz4775_nemc_cs3, 0),
> +	INGENIC_PIN_GROUP("i2c0-data", jz4775_i2c0, 0),
> +	INGENIC_PIN_GROUP("i2c1-data", jz4775_i2c1, 0),
> +	INGENIC_PIN_GROUP("i2c2-data", jz4775_i2c2, 1),
> +	INGENIC_PIN_GROUP("i2s-data-tx", jz4775_i2s_data_tx, 1),
> +	INGENIC_PIN_GROUP("i2s-data-rx", jz4775_i2s_data_rx, 1),
> +	INGENIC_PIN_GROUP("i2s-clk-txrx", jz4775_i2s_clk_txrx, 1),
> +	INGENIC_PIN_GROUP("i2s-sysclk", jz4775_i2s_sysclk, 2),
> +	INGENIC_PIN_GROUP("cim-data", jz4775_cim, 0),
> +	INGENIC_PIN_GROUP("lcd-8bit", jz4775_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4775_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4775_lcd_18bit, 0),
> +	INGENIC_PIN_GROUP("lcd-24bit", jz4775_lcd_24bit, 0),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4775_lcd_generic, 0),
> +	INGENIC_PIN_GROUP("lcd-special", jz4775_lcd_special, 1),
> +	INGENIC_PIN_GROUP("pwm0", jz4775_pwm_pwm0, 0),
> +	INGENIC_PIN_GROUP("pwm1", jz4775_pwm_pwm1, 0),
> +	INGENIC_PIN_GROUP("pwm2", jz4775_pwm_pwm2, 0),
> +	INGENIC_PIN_GROUP("pwm3", jz4775_pwm_pwm3, 0),
> +	INGENIC_PIN_GROUP("mac-rmii", jz4775_mac_rmii, 0),
> +	INGENIC_PIN_GROUP_FUNCS("mac-mii", jz4775_mac_mii,
> +				jz4775_mac_mii_funcs),
> +	INGENIC_PIN_GROUP_FUNCS("mac-rgmii", jz4775_mac_rgmii,
> +				jz4775_mac_rgmii_funcs),
> +	INGENIC_PIN_GROUP_FUNCS("mac-gmii", jz4775_mac_gmii,
> +				jz4775_mac_gmii_funcs),
> +	INGENIC_PIN_GROUP("otg-vbus", jz4775_otg, 0),
> +};
> +
> +static const char *jz4775_uart0_groups[] = { "uart0-data", 
> "uart0-hwflow", };
> +static const char *jz4775_uart1_groups[] = { "uart1-data", 
> "uart1-hwflow", };
> +static const char *jz4775_uart2_groups[] = { "uart2-data-c", 
> "uart2-data-f", };
> +static const char *jz4775_uart3_groups[] = { "uart3-data", };
> +static const char *jz4775_ssi_groups[] = {
> +	"ssi-dt-a", "ssi-dt-d",
> +	"ssi-dr-a", "ssi-dr-d",
> +	"ssi-clk-a", "ssi-clk-d",
> +	"ssi-gpc",
> +	"ssi-ce0-a", "ssi-ce0-d",
> +	"ssi-ce1",
> +};
> +static const char *jz4775_mmc0_groups[] = {
> +	"mmc0-1bit-a", "mmc0-4bit-a", "mmc0-8bit-a",
> +	"mmc0-1bit-e", "mmc0-4bit-e",
> +};
> +static const char *jz4775_mmc1_groups[] = {
> +	"mmc1-1bit-d", "mmc1-4bit-d",
> +	"mmc1-1bit-e", "mmc1-4bit-e",
> +};
> +static const char *jz4775_mmc2_groups[] = {
> +	"mmc2-1bit-b", "mmc2-4bit-b",
> +	"mmc2-1bit-e", "mmc2-4bit-e",
> +};
> +static const char *jz4775_nemc_groups[] = {
> +	"nemc-8bit-data", "nemc-16bit-data", "nemc-cle-ale",
> +	"nemc-addr", "nemc-rd-we", "nemc-frd-fwe", "nemc-wait",
> +};
> +static const char *jz4775_cs1_groups[] = { "nemc-cs1", };
> +static const char *jz4775_cs2_groups[] = { "nemc-cs2", };
> +static const char *jz4775_cs3_groups[] = { "nemc-cs3", };
> +static const char *jz4775_i2c0_groups[] = { "i2c0-data", };
> +static const char *jz4775_i2c1_groups[] = { "i2c1-data", };
> +static const char *jz4775_i2c2_groups[] = { "i2c2-data", };
> +static const char *jz4775_i2s_groups[] = {
> +	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
> +};
> +static const char *jz4775_cim_groups[] = { "cim-data", };
> +static const char *jz4775_lcd_groups[] = {
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
> +	"lcd-special", "lcd-generic",
> +};
> +static const char *jz4775_pwm0_groups[] = { "pwm0", };
> +static const char *jz4775_pwm1_groups[] = { "pwm1", };
> +static const char *jz4775_pwm2_groups[] = { "pwm2", };
> +static const char *jz4775_pwm3_groups[] = { "pwm3", };
> +static const char *jz4775_mac_groups[] = {
> +	"mac-rmii", "mac-mii", "mac-rgmii", "mac-gmii",
> +};
> +static const char *jz4775_otg_groups[] = { "otg-vbus", };
> +
> +static const struct function_desc jz4775_functions[] = {
> +	{ "uart0", jz4775_uart0_groups, ARRAY_SIZE(jz4775_uart0_groups), },
> +	{ "uart1", jz4775_uart1_groups, ARRAY_SIZE(jz4775_uart1_groups), },
> +	{ "uart2", jz4775_uart2_groups, ARRAY_SIZE(jz4775_uart2_groups), },
> +	{ "uart3", jz4775_uart3_groups, ARRAY_SIZE(jz4775_uart3_groups), },
> +	{ "ssi", jz4775_ssi_groups, ARRAY_SIZE(jz4775_ssi_groups), },
> +	{ "mmc0", jz4775_mmc0_groups, ARRAY_SIZE(jz4775_mmc0_groups), },
> +	{ "mmc1", jz4775_mmc1_groups, ARRAY_SIZE(jz4775_mmc1_groups), },
> +	{ "mmc2", jz4775_mmc2_groups, ARRAY_SIZE(jz4775_mmc2_groups), },
> +	{ "nemc", jz4775_nemc_groups, ARRAY_SIZE(jz4775_nemc_groups), },
> +	{ "nemc-cs1", jz4775_cs1_groups, ARRAY_SIZE(jz4775_cs1_groups), },
> +	{ "nemc-cs2", jz4775_cs2_groups, ARRAY_SIZE(jz4775_cs2_groups), },
> +	{ "nemc-cs3", jz4775_cs3_groups, ARRAY_SIZE(jz4775_cs3_groups), },
> +	{ "i2c0", jz4775_i2c0_groups, ARRAY_SIZE(jz4775_i2c0_groups), },
> +	{ "i2c1", jz4775_i2c1_groups, ARRAY_SIZE(jz4775_i2c1_groups), },
> +	{ "i2c2", jz4775_i2c2_groups, ARRAY_SIZE(jz4775_i2c2_groups), },
> +	{ "i2s", jz4775_i2s_groups, ARRAY_SIZE(jz4775_i2s_groups), },
> +	{ "cim", jz4775_cim_groups, ARRAY_SIZE(jz4775_cim_groups), },
> +	{ "lcd", jz4775_lcd_groups, ARRAY_SIZE(jz4775_lcd_groups), },
> +	{ "pwm0", jz4775_pwm0_groups, ARRAY_SIZE(jz4775_pwm0_groups), },
> +	{ "pwm1", jz4775_pwm1_groups, ARRAY_SIZE(jz4775_pwm1_groups), },
> +	{ "pwm2", jz4775_pwm2_groups, ARRAY_SIZE(jz4775_pwm2_groups), },
> +	{ "pwm3", jz4775_pwm3_groups, ARRAY_SIZE(jz4775_pwm3_groups), },
> +	{ "mac", jz4775_mac_groups, ARRAY_SIZE(jz4775_mac_groups), },
> +	{ "otg", jz4775_otg_groups, ARRAY_SIZE(jz4775_otg_groups), },
> +};
> +
> +static const struct ingenic_chip_info jz4775_chip_info = {
> +	.num_chips = 7,
> +	.reg_offset = 0x100,
> +	.version = ID_JZ4775,
> +	.groups = jz4775_groups,
> +	.num_groups = ARRAY_SIZE(jz4775_groups),
> +	.functions = jz4775_functions,
> +	.num_functions = ARRAY_SIZE(jz4775_functions),
> +	.pull_ups = jz4775_pull_ups,
> +	.pull_downs = jz4775_pull_downs,
> +};
> +
>  static const u32 jz4780_pull_ups[6] = {
>  	0x3fffffff, 0xfff0f3fc, 0x0fffffff, 0xffff4fff, 0xfffffb7c, 
> 0x7fa7f00f,
>  };
> @@ -2806,6 +3076,7 @@ static const struct of_device_id 
> ingenic_gpio_of_match[] __initconst = {
>  	{ .compatible = "ingenic,jz4755-gpio", },
>  	{ .compatible = "ingenic,jz4760-gpio", },
>  	{ .compatible = "ingenic,jz4770-gpio", },
> +	{ .compatible = "ingenic,jz4775-gpio", },
>  	{ .compatible = "ingenic,jz4780-gpio", },
>  	{ .compatible = "ingenic,x1000-gpio", },
>  	{ .compatible = "ingenic,x1830-gpio", },
> @@ -3028,6 +3299,10 @@ static const struct of_device_id 
> ingenic_pinctrl_of_match[] = {
>  		.data = IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_info)
>  	},
>  	{
> +		.compatible = "ingenic,jz4775-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_JZ4775, &jz4775_chip_info)
> +	},
> +	{
>  		.compatible = "ingenic,jz4780-pinctrl",
>  		.data = IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_info)
>  	},
> --
> 2.7.4
> 


