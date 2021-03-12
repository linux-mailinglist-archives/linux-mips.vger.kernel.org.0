Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383C6338F05
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 14:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhCLNnH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 08:43:07 -0500
Received: from aposti.net ([89.234.176.197]:44114 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230302AbhCLNm5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 08:42:57 -0500
Date:   Fri, 12 Mar 2021 13:42:39 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 6/6] pinctrl: Ingenic: Add support for new Ingenic
 SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <3FZUPQ.NIGHKKC7LAJA3@crapouillou.net>
In-Reply-To: <1615476112-113101-7-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615476112-113101-7-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add support for probing the pinctrl-ingenic driver on the JZ4730 SoC,
> the JZ4750 SoC, the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from
> Ingenic.
> 
> The driver of JZ4730 is derived from Paul Boddie. It is worth noting
> that the JZ4730 is special in having two control registers 
> (upper/lower),
> so add code to handle the jz4730 specific register offsets and some
> register pairs have 2 bits for each GPIO pin.

Can you split this patch again, one commit per SoC?

Cheers,
-Paul

> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>  # on 
> Letux400/JZ4730
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>  # for JZ4730
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>  # for JZ4730
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     Fix the uninitialized warning.
>     Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 1256 
> ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 1231 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index ac5ad8a..1628a1a 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3,8 +3,8 @@
>   * Ingenic SoCs pinctrl driver
>   *
>   * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
> - * Copyright (c) 2019 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com>
>   * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
> + * Copyright (c) 2019, 2020 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com>
>   */
> 
>  #include <linux/compiler.h>
> @@ -29,6 +29,17 @@
>  #define GPIO_PIN					0x00
>  #define GPIO_MSK					0x20
> 
> +#define JZ4730_GPIO_DATA			0x00
> +#define JZ4730_GPIO_GPDIR			0x04
> +#define JZ4730_GPIO_GPPUR			0x0c
> +#define JZ4730_GPIO_GPALR			0x10
> +#define JZ4730_GPIO_GPAUR			0x14
> +#define JZ4730_GPIO_GPIDLR			0x18
> +#define JZ4730_GPIO_GPIDUR			0x1c
> +#define JZ4730_GPIO_GPIER			0x20
> +#define JZ4730_GPIO_GPIMR			0x24
> +#define JZ4730_GPIO_GPFR			0x28
> +
>  #define JZ4740_GPIO_DATA			0x10
>  #define JZ4740_GPIO_PULL_DIS		0x30
>  #define JZ4740_GPIO_FUNC			0x40
> @@ -46,6 +57,10 @@
>  #define X1830_GPIO_PEL				0x110
>  #define X1830_GPIO_PEH				0x120
> 
> +#define X2000_GPIO_EDG				0x70
> +#define X2000_GPIO_PEPU				0x80
> +#define X2000_GPIO_PEPD				0x90
> +
>  #define REG_SET(x)					((x) + 0x4)
>  #define REG_CLEAR(x)				((x) + 0x8)
> 
> @@ -57,6 +72,7 @@
>  #define GPIO_PULL_DOWN				2
> 
>  #define PINS_PER_GPIO_CHIP			32
> +#define JZ4730_PINS_PER_PAIRED_REG	16
> 
>  #define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
>  	{						\
> @@ -70,14 +86,19 @@
>  	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> 
>  enum jz_version {
> +	ID_JZ4730,
>  	ID_JZ4740,
>  	ID_JZ4725B,
> +	ID_JZ4750,
> +	ID_JZ4755,
>  	ID_JZ4760,
>  	ID_JZ4770,
> +	ID_JZ4775,
>  	ID_JZ4780,
>  	ID_X1000,
>  	ID_X1500,
>  	ID_X1830,
> +	ID_X2000,
>  };
> 
>  struct ingenic_chip_info {
> @@ -110,6 +131,96 @@ struct ingenic_gpio_chip {
>  	unsigned int irq, reg_base;
>  };
> 
> +static const u32 jz4730_pull_ups[4] = {
> +	0x3fa3320f, 0xf200ffff, 0xffffffff, 0xffffffff,
> +};
> +
> +static const u32 jz4730_pull_downs[4] = {
> +	0x00000df0, 0x0dff0000, 0x00000000, 0x00000000,
> +};
> +
> +static int jz4730_mmc_1bit_pins[] = { 0x27, 0x26, 0x22, };
> +static int jz4730_mmc_4bit_pins[] = { 0x23, 0x24, 0x25, };
> +static int jz4730_uart0_data_pins[] = { 0x7e, 0x7f, };
> +static int jz4730_uart1_data_pins[] = { 0x18, 0x19, };
> +static int jz4730_uart2_data_pins[] = { 0x6f, 0x7d, };
> +static int jz4730_uart3_data_pins[] = { 0x10, 0x15, };
> +static int jz4730_uart3_hwflow_pins[] = { 0x11, 0x17, };
> +static int jz4730_lcd_8bit_pins[] = {
> +	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x3a, 0x39, 0x38,
> +};
> +static int jz4730_lcd_16bit_pins[] = {
> +	0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x3b,
> +};
> +static int jz4730_lcd_16bit_tft_pins[] = { 0x3e, 0x3f, 0x3d, 0x3c, };
> +static int jz4730_nand_cs1_pins[] = { 0x53, };
> +static int jz4730_nand_cs2_pins[] = { 0x54, };
> +static int jz4730_nand_cs3_pins[] = { 0x55, };
> +static int jz4730_nand_cs4_pins[] = { 0x56, };
> +static int jz4730_nand_cs5_pins[] = { 0x57, };
> +static int jz4730_pwm_pwm0_pins[] = { 0x5e, };
> +static int jz4730_pwm_pwm1_pins[] = { 0x5f, };
> +
> +static u8 jz4730_lcd_8bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 
> 2, };
> +
> +static const struct group_desc jz4730_groups[] = {
> +	INGENIC_PIN_GROUP("mmc-1bit", jz4730_mmc_1bit, 1),
> +	INGENIC_PIN_GROUP("mmc-4bit", jz4730_mmc_4bit, 1),
> +	INGENIC_PIN_GROUP("uart0-data", jz4730_uart0_data, 1),
> +	INGENIC_PIN_GROUP("uart1-data", jz4730_uart1_data, 1),
> +	INGENIC_PIN_GROUP("uart2-data", jz4730_uart2_data, 1),
> +	INGENIC_PIN_GROUP("uart3-data", jz4730_uart3_data, 1),
> +	INGENIC_PIN_GROUP("uart3-hwflow", jz4730_uart3_hwflow, 1),
> +	INGENIC_PIN_GROUP_FUNCS("lcd-8bit", jz4730_lcd_8bit, 
> jz4730_lcd_8bit_funcs),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4730_lcd_16bit, 1),
> +	INGENIC_PIN_GROUP("lcd-16bit-tft", jz4730_lcd_16bit_tft, 1),
> +	INGENIC_PIN_GROUP("nand-cs1", jz4730_nand_cs1, 1),
> +	INGENIC_PIN_GROUP("nand-cs2", jz4730_nand_cs2, 1),
> +	INGENIC_PIN_GROUP("nand-cs3", jz4730_nand_cs3, 1),
> +	INGENIC_PIN_GROUP("nand-cs4", jz4730_nand_cs4, 1),
> +	INGENIC_PIN_GROUP("nand-cs5", jz4730_nand_cs5, 1),
> +	INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
> +	INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
> +};
> +
> +static const char *jz4730_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
> +static const char *jz4730_uart0_groups[] = { "uart0-data", };
> +static const char *jz4730_uart1_groups[] = { "uart1-data", };
> +static const char *jz4730_uart2_groups[] = { "uart2-data", };
> +static const char *jz4730_uart3_groups[] = { "uart3-data", 
> "uart3-hwflow", };
> +static const char *jz4730_lcd_groups[] = {
> +	"lcd-8bit", "lcd-16bit", "lcd-16bit-tft",
> +};
> +static const char *jz4730_nand_groups[] = {
> +	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-cs5",
> +};
> +static const char *jz4730_pwm0_groups[] = { "pwm0", };
> +static const char *jz4730_pwm1_groups[] = { "pwm1", };
> +
> +static const struct function_desc jz4730_functions[] = {
> +	{ "mmc", jz4730_mmc_groups, ARRAY_SIZE(jz4730_mmc_groups), },
> +	{ "uart0", jz4730_uart0_groups, ARRAY_SIZE(jz4730_uart0_groups), },
> +	{ "uart1", jz4730_uart1_groups, ARRAY_SIZE(jz4730_uart1_groups), },
> +	{ "uart2", jz4730_uart2_groups, ARRAY_SIZE(jz4730_uart2_groups), },
> +	{ "uart3", jz4730_uart3_groups, ARRAY_SIZE(jz4730_uart3_groups), },
> +	{ "lcd", jz4730_lcd_groups, ARRAY_SIZE(jz4730_lcd_groups), },
> +	{ "nand", jz4730_nand_groups, ARRAY_SIZE(jz4730_nand_groups), },
> +	{ "pwm0", jz4730_pwm0_groups, ARRAY_SIZE(jz4730_pwm0_groups), },
> +	{ "pwm1", jz4730_pwm1_groups, ARRAY_SIZE(jz4730_pwm1_groups), },
> +};
> +
> +static const struct ingenic_chip_info jz4730_chip_info = {
> +	.num_chips = 4,
> +	.reg_offset = 0x30,
> +	.version = ID_JZ4730,
> +	.groups = jz4730_groups,
> +	.num_groups = ARRAY_SIZE(jz4730_groups),
> +	.functions = jz4730_functions,
> +	.num_functions = ARRAY_SIZE(jz4730_functions),
> +	.pull_ups = jz4730_pull_ups,
> +	.pull_downs = jz4730_pull_downs,
> +};
> +
>  static const u32 jz4740_pull_ups[4] = {
>  	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
>  };
> @@ -321,6 +432,263 @@ static const struct ingenic_chip_info 
> jz4725b_chip_info = {
>  	.pull_downs = jz4740_pull_downs,
>  };
> 
> +static const u32 jz4750_pull_ups[6] = {
> +	0xffffffff, 0xffffffff, 0x3fffffff, 0x7fffffff, 0x1fff3fff, 
> 0x00ffffff,
> +};
> +
> +static const u32 jz4750_pull_downs[6] = {
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
> 0x00000000,
> +};
> +
> +static int jz4750_uart0_data_pins[] = { 0xa4, 0xa5, };
> +static int jz4750_uart0_hwflow_pins[] = { 0xa6, 0xa7, };
> +static int jz4750_uart1_data_pins[] = { 0x90, 0x91, };
> +static int jz4750_uart1_hwflow_pins[] = { 0x92, 0x93, };
> +static int jz4750_uart2_data_pins[] = { 0x9b, 0x9a, };
> +static int jz4750_uart3_data_pins[] = { 0xb0, 0xb1, };
> +static int jz4750_uart3_hwflow_pins[] = { 0xb2, 0xb3, };
> +static int jz4750_mmc0_1bit_pins[] = { 0xa8, 0xa9, 0xa0, };
> +static int jz4750_mmc0_4bit_pins[] = { 0xa1, 0xa2, 0xa3, };
> +static int jz4750_mmc0_8bit_pins[] = { 0xa4, 0xa5, 0xa6, 0xa7, };
> +static int jz4750_mmc1_1bit_pins[] = { 0xae, 0xaf, 0xaa, };
> +static int jz4750_mmc1_4bit_pins[] = { 0xab, 0xac, 0xad, };
> +static int jz4750_i2c_pins[] = { 0x8c, 0x8d, };
> +static int jz4750_cim_pins[] = {
> +	0x89, 0x8b, 0x8a, 0x88,
> +	0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
> +};
> +static int jz4750_lcd_8bit_pins[] = {
> +	0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x72, 0x73, 0x74,
> +};
> +static int jz4750_lcd_16bit_pins[] = {
> +	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x75,
> +};
> +static int jz4750_lcd_18bit_pins[] = { 0x70, 0x71, };
> +static int jz4750_lcd_18bit_tft_pins[] = { 0x78, 0x79, 0x76, 0x77, };
> +static int jz4750_nand_cs1_pins[] = { 0x55, };
> +static int jz4750_nand_cs2_pins[] = { 0x56, };
> +static int jz4750_nand_cs3_pins[] = { 0x57, };
> +static int jz4750_nand_cs4_pins[] = { 0x58, };
> +static int jz4750_nand_fre_fwe_pins[] = { 0x5c, 0x5d, };
> +static int jz4750_pwm_pwm0_pins[] = { 0x94, };
> +static int jz4750_pwm_pwm1_pins[] = { 0x95, };
> +static int jz4750_pwm_pwm2_pins[] = { 0x96, };
> +static int jz4750_pwm_pwm3_pins[] = { 0x97, };
> +static int jz4750_pwm_pwm4_pins[] = { 0x98, };
> +static int jz4750_pwm_pwm5_pins[] = { 0x99, };
> +
> +static const struct group_desc jz4750_groups[] = {
> +	INGENIC_PIN_GROUP("uart0-data", jz4750_uart0_data, 1),
> +	INGENIC_PIN_GROUP("uart0-hwflow", jz4750_uart0_hwflow, 1),
> +	INGENIC_PIN_GROUP("uart1-data", jz4750_uart1_data, 0),
> +	INGENIC_PIN_GROUP("uart1-hwflow", jz4750_uart1_hwflow, 0),
> +	INGENIC_PIN_GROUP("uart2-data", jz4750_uart2_data, 1),
> +	INGENIC_PIN_GROUP("uart3-data", jz4750_uart3_data, 0),
> +	INGENIC_PIN_GROUP("uart3-hwflow", jz4750_uart3_hwflow, 0),
> +	INGENIC_PIN_GROUP("mmc0-1bit", jz4750_mmc0_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc0-4bit", jz4750_mmc0_4bit, 0),
> +	INGENIC_PIN_GROUP("mmc0-8bit", jz4750_mmc0_8bit, 0),
> +	INGENIC_PIN_GROUP("mmc1-1bit", jz4750_mmc1_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc1-4bit", jz4750_mmc1_4bit, 0),
> +	INGENIC_PIN_GROUP("i2c-data", jz4750_i2c, 0),
> +	INGENIC_PIN_GROUP("cim-data", jz4750_cim, 0),
> +	INGENIC_PIN_GROUP("lcd-8bit", jz4750_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4750_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4750_lcd_18bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit-tft", jz4750_lcd_18bit_tft, 0),
> +	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("nand-cs1", jz4750_nand_cs1, 0),
> +	INGENIC_PIN_GROUP("nand-cs2", jz4750_nand_cs2, 0),
> +	INGENIC_PIN_GROUP("nand-cs3", jz4750_nand_cs3, 0),
> +	INGENIC_PIN_GROUP("nand-cs4", jz4750_nand_cs4, 0),
> +	INGENIC_PIN_GROUP("nand-fre-fwe", jz4750_nand_fre_fwe, 0),
> +	INGENIC_PIN_GROUP("pwm0", jz4750_pwm_pwm0, 0),
> +	INGENIC_PIN_GROUP("pwm1", jz4750_pwm_pwm1, 0),
> +	INGENIC_PIN_GROUP("pwm2", jz4750_pwm_pwm2, 0),
> +	INGENIC_PIN_GROUP("pwm3", jz4750_pwm_pwm3, 0),
> +	INGENIC_PIN_GROUP("pwm4", jz4750_pwm_pwm4, 0),
> +	INGENIC_PIN_GROUP("pwm5", jz4750_pwm_pwm5, 0),
> +};
> +
> +static const char *jz4750_uart0_groups[] = { "uart0-data", 
> "uart0-hwflow", };
> +static const char *jz4750_uart1_groups[] = { "uart1-data", 
> "uart1-hwflow", };
> +static const char *jz4750_uart2_groups[] = { "uart2-data", };
> +static const char *jz4750_uart3_groups[] = { "uart3-data", 
> "uart3-hwflow", };
> +static const char *jz4750_mmc0_groups[] = {
> +	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
> +};
> +static const char *jz4750_mmc1_groups[] = { "mmc0-1bit", 
> "mmc0-4bit", };
> +static const char *jz4750_i2c_groups[] = { "i2c-data", };
> +static const char *jz4750_cim_groups[] = { "cim-data", };
> +static const char *jz4750_lcd_groups[] = {
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-18bit-tft", 
> "lcd-no-pins",
> +};
> +static const char *jz4750_nand_groups[] = {
> +	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
> +};
> +static const char *jz4750_pwm0_groups[] = { "pwm0", };
> +static const char *jz4750_pwm1_groups[] = { "pwm1", };
> +static const char *jz4750_pwm2_groups[] = { "pwm2", };
> +static const char *jz4750_pwm3_groups[] = { "pwm3", };
> +static const char *jz4750_pwm4_groups[] = { "pwm4", };
> +static const char *jz4750_pwm5_groups[] = { "pwm5", };
> +
> +static const struct function_desc jz4750_functions[] = {
> +	{ "uart0", jz4750_uart0_groups, ARRAY_SIZE(jz4750_uart0_groups), },
> +	{ "uart1", jz4750_uart1_groups, ARRAY_SIZE(jz4750_uart1_groups), },
> +	{ "uart2", jz4750_uart2_groups, ARRAY_SIZE(jz4750_uart2_groups), },
> +	{ "uart3", jz4750_uart3_groups, ARRAY_SIZE(jz4750_uart3_groups), },
> +	{ "mmc0", jz4750_mmc0_groups, ARRAY_SIZE(jz4750_mmc0_groups), },
> +	{ "mmc1", jz4750_mmc1_groups, ARRAY_SIZE(jz4750_mmc1_groups), },
> +	{ "i2c", jz4750_i2c_groups, ARRAY_SIZE(jz4750_i2c_groups), },
> +	{ "cim", jz4750_cim_groups, ARRAY_SIZE(jz4750_cim_groups), },
> +	{ "lcd", jz4750_lcd_groups, ARRAY_SIZE(jz4750_lcd_groups), },
> +	{ "nand", jz4750_nand_groups, ARRAY_SIZE(jz4750_nand_groups), },
> +	{ "pwm0", jz4750_pwm0_groups, ARRAY_SIZE(jz4750_pwm0_groups), },
> +	{ "pwm1", jz4750_pwm1_groups, ARRAY_SIZE(jz4750_pwm1_groups), },
> +	{ "pwm2", jz4750_pwm2_groups, ARRAY_SIZE(jz4750_pwm2_groups), },
> +	{ "pwm3", jz4750_pwm3_groups, ARRAY_SIZE(jz4750_pwm3_groups), },
> +	{ "pwm4", jz4750_pwm4_groups, ARRAY_SIZE(jz4750_pwm4_groups), },
> +	{ "pwm5", jz4750_pwm5_groups, ARRAY_SIZE(jz4750_pwm5_groups), },
> +};
> +
> +static const struct ingenic_chip_info jz4750_chip_info = {
> +	.num_chips = 6,
> +	.reg_offset = 0x100,
> +	.version = ID_JZ4750,
> +	.groups = jz4750_groups,
> +	.num_groups = ARRAY_SIZE(jz4750_groups),
> +	.functions = jz4750_functions,
> +	.num_functions = ARRAY_SIZE(jz4750_functions),
> +	.pull_ups = jz4750_pull_ups,
> +	.pull_downs = jz4750_pull_downs,
> +};
> +
> +static const u32 jz4755_pull_ups[6] = {
> +	0xffffffff, 0xffffffff, 0x0fffffff, 0xffffffff, 0x33dc3fff, 
> 0x0000fc00,
> +};
> +
> +static const u32 jz4755_pull_downs[6] = {
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 
> 0x00000000,
> +};
> +
> +static int jz4755_uart0_data_pins[] = { 0x7c, 0x7d, };
> +static int jz4755_uart0_hwflow_pins[] = { 0x7e, 0x7f, };
> +static int jz4755_uart1_data_pins[] = { 0x97, 0x99, };
> +static int jz4755_uart2_data_pins[] = { 0x9f, };
> +static int jz4755_mmc0_1bit_pins[] = { 0x2f, 0x50, 0x5c, };
> +static int jz4755_mmc0_4bit_pins[] = { 0x5d, 0x5b, 0x51, };
> +static int jz4755_mmc1_1bit_pins[] = { 0x3a, 0x3d, 0x3c, };
> +static int jz4755_mmc1_4bit_pins[] = { 0x3b, 0x3e, 0x3f, };
> +static int jz4755_i2c_pins[] = { 0x8c, 0x8d, };
> +static int jz4755_cim_pins[] = {
> +	0x89, 0x8b, 0x8a, 0x88,
> +	0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
> +};
> +static int jz4755_lcd_24bit_pins[] = {
> +	0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
> +	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
> +	0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
> +	0x78, 0x79, 0x7a, 0x7b,
> +};
> +static int jz4755_nand_cs1_pins[] = { 0x55, };
> +static int jz4755_nand_cs2_pins[] = { 0x56, };
> +static int jz4755_nand_cs3_pins[] = { 0x57, };
> +static int jz4755_nand_cs4_pins[] = { 0x58, };
> +static int jz4755_nand_fre_fwe_pins[] = { 0x5c, 0x5d, };
> +static int jz4755_pwm_pwm0_pins[] = { 0x94, };
> +static int jz4755_pwm_pwm1_pins[] = { 0xab, };
> +static int jz4755_pwm_pwm2_pins[] = { 0x96, };
> +static int jz4755_pwm_pwm3_pins[] = { 0x97, };
> +static int jz4755_pwm_pwm4_pins[] = { 0x98, };
> +static int jz4755_pwm_pwm5_pins[] = { 0x99, };
> +
> +static u8 jz4755_mmc0_1bit_funcs[] = { 2, 2, 1, };
> +static u8 jz4755_mmc0_4bit_funcs[] = { 1, 0, 1, };
> +static u8 jz4755_lcd_24bit_funcs[] = {
> +	0, 0, 0, 0, 0, 0, 0, 0,
> +	0, 0, 0, 0, 0, 0, 0, 0,
> +	0, 0, 0, 0, 0, 0, 1, 1,
> +	1, 1, 0, 0,
> +};
> +
> +static const struct group_desc jz4755_groups[] = {
> +	INGENIC_PIN_GROUP("uart0-data", jz4755_uart0_data, 0),
> +	INGENIC_PIN_GROUP("uart0-hwflow", jz4755_uart0_hwflow, 0),
> +	INGENIC_PIN_GROUP("uart1-data", jz4755_uart1_data, 0),
> +	INGENIC_PIN_GROUP("uart2-data", jz4755_uart2_data, 1),
> +	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit", jz4755_mmc0_1bit,
> +				jz4755_mmc0_1bit_funcs),
> +	INGENIC_PIN_GROUP_FUNCS("mmc0-4bit", jz4755_mmc0_4bit,
> +				jz4755_mmc0_4bit_funcs),
> +	INGENIC_PIN_GROUP("mmc1-1bit", jz4755_mmc1_1bit, 1),
> +	INGENIC_PIN_GROUP("mmc1-4bit", jz4755_mmc1_4bit, 1),
> +	INGENIC_PIN_GROUP("i2c-data", jz4755_i2c, 0),
> +	INGENIC_PIN_GROUP("cim-data", jz4755_cim, 0),
> +	INGENIC_PIN_GROUP_FUNCS("lcd-24bit", jz4755_lcd_24bit,
> +				jz4755_lcd_24bit_funcs),
> +	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("nand-cs1", jz4755_nand_cs1, 0),
> +	INGENIC_PIN_GROUP("nand-cs2", jz4755_nand_cs2, 0),
> +	INGENIC_PIN_GROUP("nand-cs3", jz4755_nand_cs3, 0),
> +	INGENIC_PIN_GROUP("nand-cs4", jz4755_nand_cs4, 0),
> +	INGENIC_PIN_GROUP("nand-fre-fwe", jz4755_nand_fre_fwe, 0),
> +	INGENIC_PIN_GROUP("pwm0", jz4755_pwm_pwm0, 0),
> +	INGENIC_PIN_GROUP("pwm1", jz4755_pwm_pwm1, 1),
> +	INGENIC_PIN_GROUP("pwm2", jz4755_pwm_pwm2, 0),
> +	INGENIC_PIN_GROUP("pwm3", jz4755_pwm_pwm3, 0),
> +	INGENIC_PIN_GROUP("pwm4", jz4755_pwm_pwm4, 0),
> +	INGENIC_PIN_GROUP("pwm5", jz4755_pwm_pwm5, 0),
> +};
> +
> +static const char *jz4755_uart0_groups[] = { "uart0-data", 
> "uart0-hwflow", };
> +static const char *jz4755_uart1_groups[] = { "uart1-data", };
> +static const char *jz4755_uart2_groups[] = { "uart2-data", };
> +static const char *jz4755_mmc0_groups[] = { "mmc0-1bit", 
> "mmc0-4bit", };
> +static const char *jz4755_mmc1_groups[] = { "mmc0-1bit", 
> "mmc0-4bit", };
> +static const char *jz4755_i2c_groups[] = { "i2c-data", };
> +static const char *jz4755_cim_groups[] = { "cim-data", };
> +static const char *jz4755_lcd_groups[] = { "lcd-24bit", 
> "lcd-no-pins", };
> +static const char *jz4755_nand_groups[] = {
> +	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
> +};
> +static const char *jz4755_pwm0_groups[] = { "pwm0", };
> +static const char *jz4755_pwm1_groups[] = { "pwm1", };
> +static const char *jz4755_pwm2_groups[] = { "pwm2", };
> +static const char *jz4755_pwm3_groups[] = { "pwm3", };
> +static const char *jz4755_pwm4_groups[] = { "pwm4", };
> +static const char *jz4755_pwm5_groups[] = { "pwm5", };
> +
> +static const struct function_desc jz4755_functions[] = {
> +	{ "uart0", jz4755_uart0_groups, ARRAY_SIZE(jz4755_uart0_groups), },
> +	{ "uart1", jz4755_uart1_groups, ARRAY_SIZE(jz4755_uart1_groups), },
> +	{ "uart2", jz4755_uart2_groups, ARRAY_SIZE(jz4755_uart2_groups), },
> +	{ "mmc0", jz4755_mmc0_groups, ARRAY_SIZE(jz4755_mmc0_groups), },
> +	{ "mmc1", jz4755_mmc1_groups, ARRAY_SIZE(jz4755_mmc1_groups), },
> +	{ "i2c", jz4755_i2c_groups, ARRAY_SIZE(jz4755_i2c_groups), },
> +	{ "cim", jz4755_cim_groups, ARRAY_SIZE(jz4755_cim_groups), },
> +	{ "lcd", jz4755_lcd_groups, ARRAY_SIZE(jz4755_lcd_groups), },
> +	{ "nand", jz4755_nand_groups, ARRAY_SIZE(jz4755_nand_groups), },
> +	{ "pwm0", jz4755_pwm0_groups, ARRAY_SIZE(jz4755_pwm0_groups), },
> +	{ "pwm1", jz4755_pwm1_groups, ARRAY_SIZE(jz4755_pwm1_groups), },
> +	{ "pwm2", jz4755_pwm2_groups, ARRAY_SIZE(jz4755_pwm2_groups), },
> +	{ "pwm3", jz4755_pwm3_groups, ARRAY_SIZE(jz4755_pwm3_groups), },
> +	{ "pwm4", jz4755_pwm4_groups, ARRAY_SIZE(jz4755_pwm4_groups), },
> +	{ "pwm5", jz4755_pwm5_groups, ARRAY_SIZE(jz4755_pwm5_groups), },
> +};
> +
> +static const struct ingenic_chip_info jz4755_chip_info = {
> +	.num_chips = 6,
> +	.reg_offset = 0x100,
> +	.version = ID_JZ4755,
> +	.groups = jz4755_groups,
> +	.num_groups = ARRAY_SIZE(jz4755_groups),
> +	.functions = jz4755_functions,
> +	.num_functions = ARRAY_SIZE(jz4755_functions),
> +	.pull_ups = jz4755_pull_ups,
> +	.pull_downs = jz4755_pull_downs,
> +};
> +
>  static const u32 jz4760_pull_ups[6] = {
>  	0xffffffff, 0xfffcf3ff, 0xffffffff, 0xffffcfff, 0xfffffb7c, 
> 0xfffff00f,
>  };
> @@ -875,6 +1243,249 @@ static const struct ingenic_chip_info 
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
> +static int jz4775_lcd_24bit_pins[] = {
> +	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
> +	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
> +	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
> +	0x58, 0x59, 0x5a, 0x5b,
> +};
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
> +static int jz4775_mac_gmii_pins[] = {
> +	0xa9, 0x31, 0x30, 0x2f, 0x2e, 0x7b, 0x7a, 0xab, 0xaa,
> +	0xac, 0x2d, 0x2c, 0x2b, 0x2a, 0x7d, 0x7c, 0xa5, 0xa4,
> +	0xad, 0xae, 0xa7, 0xa6, 0xa8, 0x28, 0x24, 0xaf,
> +};
> +static int jz4775_otg_pins[] = { 0x8a, };
> +
> +static u8 jz4775_uart3_data_funcs[] = { 0, 1, };
> +static u8 jz4775_mac_mii_funcs[] = { 1, 1, 1, 1, 0, 1, 0, };
> +static u8 jz4775_mac_gmii_funcs[] = {
> +	0, 1, 1, 1, 1, 1, 1, 0, 0,
> +	0, 1, 1, 1, 1, 1, 1, 0, 0,
> +	0, 0, 0, 0, 0, 1, 1, 0,
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
> +	INGENIC_PIN_GROUP("lcd-24bit", jz4775_lcd_24bit, 0),
> +	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("pwm0", jz4775_pwm_pwm0, 0),
> +	INGENIC_PIN_GROUP("pwm1", jz4775_pwm_pwm1, 0),
> +	INGENIC_PIN_GROUP("pwm2", jz4775_pwm_pwm2, 0),
> +	INGENIC_PIN_GROUP("pwm3", jz4775_pwm_pwm3, 0),
> +	INGENIC_PIN_GROUP("mac-rmii", jz4775_mac_rmii, 0),
> +	INGENIC_PIN_GROUP_FUNCS("mac-mii", jz4775_mac_mii,
> +				jz4775_mac_mii_funcs),
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
> +static const char *jz4775_lcd_groups[] = { "lcd-24bit", 
> "lcd-no-pins", };
> +static const char *jz4775_pwm0_groups[] = { "pwm0", };
> +static const char *jz4775_pwm1_groups[] = { "pwm1", };
> +static const char *jz4775_pwm2_groups[] = { "pwm2", };
> +static const char *jz4775_pwm3_groups[] = { "pwm3", };
> +static const char *jz4775_mac_groups[] = { "mac-rmii", "mac-mii", 
> "mac-gmii", };
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
> @@ -1657,6 +2268,439 @@ static const struct ingenic_chip_info 
> x1830_chip_info = {
>  	.pull_downs = x1830_pull_downs,
>  };
> 
> +static const u32 x2000_pull_ups[5] = {
> +	0x0003ffff, 0xffffffff, 0x1ff0ffff, 0xc7fe3f3f, 0x8fff003f,
> +};
> +
> +static const u32 x2000_pull_downs[5] = {
> +	0x0003ffff, 0xffffffff, 0x1ff0ffff, 0x00000000, 0x8fff003f,
> +};
> +
> +static int x2000_uart0_data_pins[] = { 0x77, 0x78, };
> +static int x2000_uart0_hwflow_pins[] = { 0x79, 0x7a, };
> +static int x2000_uart1_data_pins[] = { 0x57, 0x58, };
> +static int x2000_uart1_hwflow_pins[] = { 0x55, 0x56, };
> +static int x2000_uart2_data_pins[] = { 0x7e, 0x7f, };
> +static int x2000_uart3_data_c_pins[] = { 0x59, 0x5a, };
> +static int x2000_uart3_data_d_pins[] = { 0x62, 0x63, };
> +static int x2000_uart3_hwflow_c_pins[] = { 0x5b, 0x5c, };
> +static int x2000_uart3_hwflow_d_pins[] = { 0x60, 0x61, };
> +static int x2000_uart4_data_a_pins[] = { 0x02, 0x03, };
> +static int x2000_uart4_data_c_pins[] = { 0x4b, 0x4c, };
> +static int x2000_uart4_hwflow_a_pins[] = { 0x00, 0x01, };
> +static int x2000_uart4_hwflow_c_pins[] = { 0x49, 0x4a, };
> +static int x2000_uart5_data_a_pins[] = { 0x04, 0x05, };
> +static int x2000_uart5_data_c_pins[] = { 0x45, 0x46, };
> +static int x2000_uart6_data_a_pins[] = { 0x06, 0x07, };
> +static int x2000_uart6_data_c_pins[] = { 0x47, 0x48, };
> +static int x2000_uart7_data_a_pins[] = { 0x08, 0x09, };
> +static int x2000_uart7_data_c_pins[] = { 0x41, 0x42, };
> +static int x2000_uart8_data_pins[] = { 0x3c, 0x3d, };
> +static int x2000_uart9_data_pins[] = { 0x3e, 0x3f, };
> +static int x2000_sfc0_d_pins[] = { 0x73, 0x74, 0x75, 0x76, 0x71, 
> 0x72, };
> +static int x2000_sfc0_e_pins[] = { 0x92, 0x93, 0x94, 0x95, 0x90, 
> 0x91, };
> +static int x2000_sfc1_pins[] = { 0x77, 0x78, 0x79, 0x7a, };
> +static int x2000_ssi0_dt_b_pins[] = { 0x3e, };
> +static int x2000_ssi0_dt_d_pins[] = { 0x69, };
> +static int x2000_ssi0_dr_b_pins[] = { 0x3d, };
> +static int x2000_ssi0_dr_d_pins[] = { 0x6a, };
> +static int x2000_ssi0_clk_b_pins[] = { 0x3f, };
> +static int x2000_ssi0_clk_d_pins[] = { 0x68, };
> +static int x2000_ssi0_ce0_b_pins[] = { 0x3c, };
> +static int x2000_ssi0_ce0_d_pins[] = { 0x6d, };
> +static int x2000_ssi1_dt_c_pins[] = { 0x4b, };
> +static int x2000_ssi1_dt_d_pins[] = { 0x72, };
> +static int x2000_ssi1_dt_e_pins[] = { 0x91, };
> +static int x2000_ssi1_dr_c_pins[] = { 0x4a, };
> +static int x2000_ssi1_dr_d_pins[] = { 0x73, };
> +static int x2000_ssi1_dr_e_pins[] = { 0x92, };
> +static int x2000_ssi1_clk_c_pins[] = { 0x4c, };
> +static int x2000_ssi1_clk_d_pins[] = { 0x71, };
> +static int x2000_ssi1_clk_e_pins[] = { 0x90, };
> +static int x2000_ssi1_ce0_c_pins[] = { 0x49, };
> +static int x2000_ssi1_ce0_d_pins[] = { 0x76, };
> +static int x2000_ssi1_ce0_e_pins[] = { 0x95, };
> +static int x2000_mmc0_1bit_pins[] = { 0x71, 0x72, 0x73, };
> +static int x2000_mmc0_4bit_pins[] = { 0x74, 0x75, 0x75, };
> +static int x2000_mmc0_8bit_pins[] = { 0x77, 0x78, 0x79, 0x7a, };
> +static int x2000_mmc1_1bit_pins[] = { 0x68, 0x69, 0x6a, };
> +static int x2000_mmc1_4bit_pins[] = { 0x6b, 0x6c, 0x6d, };
> +static int x2000_mmc2_1bit_pins[] = { 0x80, 0x81, 0x82, };
> +static int x2000_mmc2_4bit_pins[] = { 0x83, 0x84, 0x85, };
> +static int x2000_emc_8bit_data_pins[] = {
> +	0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
> +};
> +static int x2000_emc_16bit_data_pins[] = {
> +	0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
> +};
> +static int x2000_emc_addr_pins[] = {
> +	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
> +	0x28, 0x29, 0x2a, 0x2b, 0x2c,
> +};
> +static int x2000_emc_rd_we_pins[] = { 0x2d, 0x2e, };
> +static int x2000_emc_wait_pins[] = { 0x2f, };
> +static int x2000_emc_cs1_pins[] = { 0x57, };
> +static int x2000_emc_cs2_pins[] = { 0x58, };
> +static int x2000_i2c0_pins[] = { 0x4e, 0x4d, };
> +static int x2000_i2c1_c_pins[] = { 0x58, 0x57, };
> +static int x2000_i2c1_d_pins[] = { 0x6c, 0x6b, };
> +static int x2000_i2c2_b_pins[] = { 0x37, 0x36, };
> +static int x2000_i2c2_d_pins[] = { 0x75, 0x74, };
> +static int x2000_i2c2_e_pins[] = { 0x94, 0x93, };
> +static int x2000_i2c3_a_pins[] = { 0x11, 0x10, };
> +static int x2000_i2c3_d_pins[] = { 0x7f, 0x7e, };
> +static int x2000_i2c4_c_pins[] = { 0x5a, 0x59, };
> +static int x2000_i2c4_d_pins[] = { 0x61, 0x60, };
> +static int x2000_i2c5_c_pins[] = { 0x5c, 0x5b, };
> +static int x2000_i2c5_d_pins[] = { 0x65, 0x64, };
> +static int x2000_i2s1_data_tx_pins[] = { 0x47, };
> +static int x2000_i2s1_data_rx_pins[] = { 0x44, };
> +static int x2000_i2s1_clk_tx_pins[] = { 0x45, 0x46, };
> +static int x2000_i2s1_clk_rx_pins[] = { 0x42, 0x43, };
> +static int x2000_i2s1_sysclk_tx_pins[] = { 0x48, };
> +static int x2000_i2s1_sysclk_rx_pins[] = { 0x41, };
> +static int x2000_i2s2_data_rx0_pins[] = { 0x0a, };
> +static int x2000_i2s2_data_rx1_pins[] = { 0x0b, };
> +static int x2000_i2s2_data_rx2_pins[] = { 0x0c, };
> +static int x2000_i2s2_data_rx3_pins[] = { 0x0d, };
> +static int x2000_i2s2_clk_rx_pins[] = { 0x11, 0x09, };
> +static int x2000_i2s2_sysclk_rx_pins[] = { 0x07, };
> +static int x2000_i2s3_data_tx0_pins[] = { 0x03, };
> +static int x2000_i2s3_data_tx1_pins[] = { 0x04, };
> +static int x2000_i2s3_data_tx2_pins[] = { 0x05, };
> +static int x2000_i2s3_data_tx3_pins[] = { 0x06, };
> +static int x2000_i2s3_clk_tx_pins[] = { 0x10, 0x02, };
> +static int x2000_i2s3_sysclk_tx_pins[] = { 0x00, };
> +static int x2000_cim_8bit_pins[] = {
> +	0x0e, 0x0c, 0x0d, 0x4f,
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +};
> +static int x2000_cim_12bit_pins[] = { 0x08, 0x09, 0x0a, 0x0b, };
> +static int x2000_lcd_rgb_24bit_pins[] = {
> +	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
> +	0x38, 0x3b, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d,
> +	0x2e, 0x2f, 0x3a, 0x39, 0x30, 0x31, 0x32, 0x33,
> +	0x34, 0x35, 0x36, 0x37,
> +};
> +static int x2000_lcd_slcd_8bit_pins[] = {
> +	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
> +	0x3a, 0x38, 0x3b, 0x30, 0x39,
> +};
> +static int x2000_lcd_slcd_16bit_pins[] = {
> +	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
> +};
> +static int x2000_pwm_pwm0_c_pins[] = { 0x40, };
> +static int x2000_pwm_pwm0_d_pins[] = { 0x7e, };
> +static int x2000_pwm_pwm1_c_pins[] = { 0x41, };
> +static int x2000_pwm_pwm1_d_pins[] = { 0x7f, };
> +static int x2000_pwm_pwm2_c_pins[] = { 0x42, };
> +static int x2000_pwm_pwm2_e_pins[] = { 0x80, };
> +static int x2000_pwm_pwm3_c_pins[] = { 0x43, };
> +static int x2000_pwm_pwm3_e_pins[] = { 0x81, };
> +static int x2000_pwm_pwm4_c_pins[] = { 0x44, };
> +static int x2000_pwm_pwm4_e_pins[] = { 0x82, };
> +static int x2000_pwm_pwm5_c_pins[] = { 0x45, };
> +static int x2000_pwm_pwm5_e_pins[] = { 0x83, };
> +static int x2000_pwm_pwm6_c_pins[] = { 0x46, };
> +static int x2000_pwm_pwm6_e_pins[] = { 0x84, };
> +static int x2000_pwm_pwm7_c_pins[] = { 0x47, };
> +static int x2000_pwm_pwm7_e_pins[] = { 0x85, };
> +static int x2000_pwm_pwm8_pins[] = { 0x48, };
> +static int x2000_pwm_pwm9_pins[] = { 0x49, };
> +static int x2000_pwm_pwm10_pins[] = { 0x4a, };
> +static int x2000_pwm_pwm11_pins[] = { 0x4b, };
> +static int x2000_pwm_pwm12_pins[] = { 0x4c, };
> +static int x2000_pwm_pwm13_pins[] = { 0x4d, };
> +static int x2000_pwm_pwm14_pins[] = { 0x4e, };
> +static int x2000_pwm_pwm15_pins[] = { 0x4f, };
> +static int x2000_mac0_rmii_pins[] = {
> +	0x4b, 0x47, 0x46, 0x4a, 0x43, 0x42, 0x4c, 0x4d, 0x4e, 0x41,
> +};
> +static int x2000_mac0_rgmii_pins[] = {
> +	0x4b, 0x49, 0x48, 0x47, 0x46, 0x4a, 0x45, 0x44, 0x43, 0x42,
> +	0x4c, 0x4d, 0x4f, 0x4e, 0x41,
> +};
> +static int x2000_mac1_rmii_pins[] = {
> +	0x32, 0x2d, 0x2c, 0x31, 0x29, 0x28, 0x33, 0x34, 0x35, 0x37,
> +};
> +static int x2000_mac1_rgmii_pins[] = {
> +	0x32, 0x2f, 0x2e, 0x2d, 0x2c, 0x31, 0x2b, 0x2a, 0x29, 0x28,
> +	0x33, 0x34, 0x36, 0x35, 0x37,
> +};
> +static int x2000_otg_pins[] = { 0x96, };
> +
> +static u8 x2000_cim_8bit_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
> 0, 2, };
> +
> +static const struct group_desc x2000_groups[] = {
> +	INGENIC_PIN_GROUP("uart0-data", x2000_uart0_data, 2),
> +	INGENIC_PIN_GROUP("uart0-hwflow", x2000_uart0_hwflow, 2),
> +	INGENIC_PIN_GROUP("uart1-data", x2000_uart1_data, 1),
> +	INGENIC_PIN_GROUP("uart1-hwflow", x2000_uart1_hwflow, 1),
> +	INGENIC_PIN_GROUP("uart2-data", x2000_uart2_data, 0),
> +	INGENIC_PIN_GROUP("uart3-data-c", x2000_uart3_data_c, 0),
> +	INGENIC_PIN_GROUP("uart3-data-d", x2000_uart3_data_d, 1),
> +	INGENIC_PIN_GROUP("uart3-hwflow-c", x2000_uart3_hwflow_c, 0),
> +	INGENIC_PIN_GROUP("uart3-hwflow-d", x2000_uart3_hwflow_d, 1),
> +	INGENIC_PIN_GROUP("uart4-data-a", x2000_uart4_data_a, 1),
> +	INGENIC_PIN_GROUP("uart4-data-c", x2000_uart4_data_c, 3),
> +	INGENIC_PIN_GROUP("uart4-hwflow-a", x2000_uart4_hwflow_a, 1),
> +	INGENIC_PIN_GROUP("uart4-hwflow-c", x2000_uart4_hwflow_c, 3),
> +	INGENIC_PIN_GROUP("uart5-data-a", x2000_uart5_data_a, 1),
> +	INGENIC_PIN_GROUP("uart5-data-c", x2000_uart5_data_c, 3),
> +	INGENIC_PIN_GROUP("uart6-data-a", x2000_uart6_data_a, 1),
> +	INGENIC_PIN_GROUP("uart6-data-c", x2000_uart6_data_c, 3),
> +	INGENIC_PIN_GROUP("uart7-data-a", x2000_uart7_data_a, 1),
> +	INGENIC_PIN_GROUP("uart7-data-c", x2000_uart7_data_c, 3),
> +	INGENIC_PIN_GROUP("uart8-data", x2000_uart8_data, 3),
> +	INGENIC_PIN_GROUP("uart9-data", x2000_uart9_data, 3),
> +	INGENIC_PIN_GROUP("sfc0-d", x2000_sfc0_d, 1),
> +	INGENIC_PIN_GROUP("sfc0-e", x2000_sfc0_e, 0),
> +	INGENIC_PIN_GROUP("sfc1", x2000_sfc1, 1),
> +	INGENIC_PIN_GROUP("ssi0-dt-b", x2000_ssi0_dt_b, 1),
> +	INGENIC_PIN_GROUP("ssi0-dt-d", x2000_ssi0_dt_d, 1),
> +	INGENIC_PIN_GROUP("ssi0-dr-b", x2000_ssi0_dr_b, 1),
> +	INGENIC_PIN_GROUP("ssi0-dr-d", x2000_ssi0_dr_d, 1),
> +	INGENIC_PIN_GROUP("ssi0-clk-b", x2000_ssi0_clk_b, 1),
> +	INGENIC_PIN_GROUP("ssi0-clk-d", x2000_ssi0_clk_d, 1),
> +	INGENIC_PIN_GROUP("ssi0-ce0-b", x2000_ssi0_ce0_b, 1),
> +	INGENIC_PIN_GROUP("ssi0-ce0-d", x2000_ssi0_ce0_d, 1),
> +	INGENIC_PIN_GROUP("ssi1-dt-c", x2000_ssi1_dt_c, 2),
> +	INGENIC_PIN_GROUP("ssi1-dt-d", x2000_ssi1_dt_d, 2),
> +	INGENIC_PIN_GROUP("ssi1-dt-e", x2000_ssi1_dt_e, 1),
> +	INGENIC_PIN_GROUP("ssi1-dr-c", x2000_ssi1_dr_c, 2),
> +	INGENIC_PIN_GROUP("ssi1-dr-d", x2000_ssi1_dr_d, 2),
> +	INGENIC_PIN_GROUP("ssi1-dr-e", x2000_ssi1_dr_e, 1),
> +	INGENIC_PIN_GROUP("ssi1-clk-c", x2000_ssi1_clk_c, 2),
> +	INGENIC_PIN_GROUP("ssi1-clk-d", x2000_ssi1_clk_d, 2),
> +	INGENIC_PIN_GROUP("ssi1-clk-e", x2000_ssi1_clk_e, 1),
> +	INGENIC_PIN_GROUP("ssi1-ce0-c", x2000_ssi1_ce0_c, 2),
> +	INGENIC_PIN_GROUP("ssi1-ce0-d", x2000_ssi1_ce0_d, 2),
> +	INGENIC_PIN_GROUP("ssi1-ce0-e", x2000_ssi1_ce0_e, 1),
> +	INGENIC_PIN_GROUP("mmc0-1bit", x2000_mmc0_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc0-4bit", x2000_mmc0_4bit, 0),
> +	INGENIC_PIN_GROUP("mmc0-8bit", x2000_mmc0_8bit, 0),
> +	INGENIC_PIN_GROUP("mmc1-1bit", x2000_mmc1_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc1-4bit", x2000_mmc1_4bit, 0),
> +	INGENIC_PIN_GROUP("mmc2-1bit", x2000_mmc2_1bit, 0),
> +	INGENIC_PIN_GROUP("mmc2-4bit", x2000_mmc2_4bit, 0),
> +	INGENIC_PIN_GROUP("emc-8bit-data", x2000_emc_8bit_data, 0),
> +	INGENIC_PIN_GROUP("emc-16bit-data", x2000_emc_16bit_data, 0),
> +	INGENIC_PIN_GROUP("emc-addr", x2000_emc_addr, 0),
> +	INGENIC_PIN_GROUP("emc-rd-we", x2000_emc_rd_we, 0),
> +	INGENIC_PIN_GROUP("emc-wait", x2000_emc_wait, 0),
> +	INGENIC_PIN_GROUP("emc-cs1", x2000_emc_cs1, 3),
> +	INGENIC_PIN_GROUP("emc-cs2", x2000_emc_cs2, 3),
> +	INGENIC_PIN_GROUP("i2c0-data", x2000_i2c0, 3),
> +	INGENIC_PIN_GROUP("i2c1-data-c", x2000_i2c1_c, 2),
> +	INGENIC_PIN_GROUP("i2c1-data-d", x2000_i2c1_d, 1),
> +	INGENIC_PIN_GROUP("i2c2-data-b", x2000_i2c2_b, 2),
> +	INGENIC_PIN_GROUP("i2c2-data-d", x2000_i2c2_d, 2),
> +	INGENIC_PIN_GROUP("i2c2-data-e", x2000_i2c2_e, 1),
> +	INGENIC_PIN_GROUP("i2c3-data-a", x2000_i2c3_a, 0),
> +	INGENIC_PIN_GROUP("i2c3-data-d", x2000_i2c3_d, 1),
> +	INGENIC_PIN_GROUP("i2c4-data-c", x2000_i2c4_c, 1),
> +	INGENIC_PIN_GROUP("i2c4-data-d", x2000_i2c4_d, 2),
> +	INGENIC_PIN_GROUP("i2c5-data-c", x2000_i2c5_c, 1),
> +	INGENIC_PIN_GROUP("i2c5-data-d", x2000_i2c5_d, 1),
> +	INGENIC_PIN_GROUP("i2s1-data-tx", x2000_i2s1_data_tx, 2),
> +	INGENIC_PIN_GROUP("i2s1-data-rx", x2000_i2s1_data_rx, 2),
> +	INGENIC_PIN_GROUP("i2s1-clk-tx", x2000_i2s1_clk_tx, 2),
> +	INGENIC_PIN_GROUP("i2s1-clk-rx", x2000_i2s1_clk_rx, 2),
> +	INGENIC_PIN_GROUP("i2s1-sysclk-tx", x2000_i2s1_sysclk_tx, 2),
> +	INGENIC_PIN_GROUP("i2s1-sysclk-rx", x2000_i2s1_sysclk_rx, 2),
> +	INGENIC_PIN_GROUP("i2s2-data-rx0", x2000_i2s2_data_rx0, 2),
> +	INGENIC_PIN_GROUP("i2s2-data-rx1", x2000_i2s2_data_rx1, 2),
> +	INGENIC_PIN_GROUP("i2s2-data-rx2", x2000_i2s2_data_rx2, 2),
> +	INGENIC_PIN_GROUP("i2s2-data-rx3", x2000_i2s2_data_rx3, 2),
> +	INGENIC_PIN_GROUP("i2s2-clk-rx", x2000_i2s2_clk_rx, 2),
> +	INGENIC_PIN_GROUP("i2s2-sysclk-rx", x2000_i2s2_sysclk_rx, 2),
> +	INGENIC_PIN_GROUP("i2s3-data-tx0", x2000_i2s3_data_tx0, 2),
> +	INGENIC_PIN_GROUP("i2s3-data-tx1", x2000_i2s3_data_tx1, 2),
> +	INGENIC_PIN_GROUP("i2s3-data-tx2", x2000_i2s3_data_tx2, 2),
> +	INGENIC_PIN_GROUP("i2s3-data-tx3", x2000_i2s3_data_tx3, 2),
> +	INGENIC_PIN_GROUP("i2s3-clk-tx", x2000_i2s3_clk_tx, 2),
> +	INGENIC_PIN_GROUP("i2s3-sysclk-tx", x2000_i2s3_sysclk_tx, 2),
> +	INGENIC_PIN_GROUP_FUNCS("cim-data-8bit", x2000_cim_8bit,
> +				x2000_cim_8bit_funcs),
> +	INGENIC_PIN_GROUP("cim-data-12bit", x2000_cim_12bit, 0),
> +	INGENIC_PIN_GROUP("lcd-rgb-24bit", x2000_lcd_rgb_24bit, 1),
> +	INGENIC_PIN_GROUP("lcd-slcd-8bit", x2000_lcd_slcd_8bit, 2),
> +	INGENIC_PIN_GROUP("lcd-slcd-16bit", x2000_lcd_slcd_16bit, 2),
> +	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("pwm0-c", x2000_pwm_pwm0_c, 0),
> +	INGENIC_PIN_GROUP("pwm0-d", x2000_pwm_pwm0_d, 2),
> +	INGENIC_PIN_GROUP("pwm1-c", x2000_pwm_pwm1_c, 0),
> +	INGENIC_PIN_GROUP("pwm1-d", x2000_pwm_pwm1_d, 2),
> +	INGENIC_PIN_GROUP("pwm2-c", x2000_pwm_pwm2_c, 0),
> +	INGENIC_PIN_GROUP("pwm2-e", x2000_pwm_pwm2_e, 1),
> +	INGENIC_PIN_GROUP("pwm3-c", x2000_pwm_pwm3_c, 0),
> +	INGENIC_PIN_GROUP("pwm3-e", x2000_pwm_pwm3_e, 1),
> +	INGENIC_PIN_GROUP("pwm4-c", x2000_pwm_pwm4_c, 0),
> +	INGENIC_PIN_GROUP("pwm4-e", x2000_pwm_pwm4_e, 1),
> +	INGENIC_PIN_GROUP("pwm5-c", x2000_pwm_pwm5_c, 0),
> +	INGENIC_PIN_GROUP("pwm5-e", x2000_pwm_pwm5_e, 1),
> +	INGENIC_PIN_GROUP("pwm6-c", x2000_pwm_pwm6_c, 0),
> +	INGENIC_PIN_GROUP("pwm6-e", x2000_pwm_pwm6_e, 1),
> +	INGENIC_PIN_GROUP("pwm7-c", x2000_pwm_pwm7_c, 0),
> +	INGENIC_PIN_GROUP("pwm7-e", x2000_pwm_pwm7_e, 1),
> +	INGENIC_PIN_GROUP("pwm8", x2000_pwm_pwm8, 0),
> +	INGENIC_PIN_GROUP("pwm9", x2000_pwm_pwm9, 0),
> +	INGENIC_PIN_GROUP("pwm10", x2000_pwm_pwm10, 0),
> +	INGENIC_PIN_GROUP("pwm11", x2000_pwm_pwm11, 0),
> +	INGENIC_PIN_GROUP("pwm12", x2000_pwm_pwm12, 0),
> +	INGENIC_PIN_GROUP("pwm13", x2000_pwm_pwm13, 0),
> +	INGENIC_PIN_GROUP("pwm14", x2000_pwm_pwm14, 0),
> +	INGENIC_PIN_GROUP("pwm15", x2000_pwm_pwm15, 0),
> +	INGENIC_PIN_GROUP("mac0-rmii", x2000_mac0_rmii, 1),
> +	INGENIC_PIN_GROUP("mac0-rgmii", x2000_mac0_rgmii, 1),
> +	INGENIC_PIN_GROUP("mac1-rmii", x2000_mac1_rmii, 3),
> +	INGENIC_PIN_GROUP("mac1-rgmii", x2000_mac1_rgmii, 3),
> +	INGENIC_PIN_GROUP("otg-vbus", x2000_otg, 0),
> +};
> +
> +static const char *x2000_uart0_groups[] = { "uart0-data", 
> "uart0-hwflow", };
> +static const char *x2000_uart1_groups[] = { "uart1-data", 
> "uart1-hwflow", };
> +static const char *x2000_uart2_groups[] = { "uart2-data", };
> +static const char *x2000_uart3_groups[] = {
> +	"uart3-data-c", "uart3-data-d", "uart3-hwflow-c", "uart3-hwflow-d",
> +};
> +static const char *x2000_uart4_groups[] = {
> +	"uart4-data-a", "uart4-data-c", "uart4-hwflow-a", "uart4-hwflow-c",
> +};
> +static const char *x2000_uart5_groups[] = { "uart5-data-a", 
> "uart5-data-c", };
> +static const char *x2000_uart6_groups[] = { "uart6-data-a", 
> "uart6-data-c", };
> +static const char *x2000_uart7_groups[] = { "uart7-data-a", 
> "uart7-data-c", };
> +static const char *x2000_uart8_groups[] = { "uart8-data", };
> +static const char *x2000_uart9_groups[] = { "uart9-data", };
> +static const char *x2000_sfc_groups[] = { "sfc0-d", "sfc0-e", 
> "sfc1", };
> +static const char *x2000_ssi0_groups[] = {
> +	"ssi0-dt-b", "ssi0-dt-d",
> +	"ssi0-dr-b", "ssi0-dr-d",
> +	"ssi0-clk-b", "ssi0-clk-d",
> +	"ssi0-ce0-b", "ssi0-ce0-d",
> +};
> +static const char *x2000_ssi1_groups[] = {
> +	"ssi1-dt-c", "ssi1-dt-d", "ssi1-dt-e",
> +	"ssi1-dr-c", "ssi1-dr-d", "ssi1-dr-e",
> +	"ssi1-clk-c", "ssi1-clk-d", "ssi1-clk-e",
> +	"ssi1-ce0-c", "ssi1-ce0-d", "ssi1-ce0-e",
> +};
> +static const char *x2000_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", 
> "mmc0-8bit", };
> +static const char *x2000_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", 
> };
> +static const char *x2000_mmc2_groups[] = { "mmc2-1bit", "mmc2-4bit", 
> };
> +static const char *x2000_emc_groups[] = {
> +	"emc-8bit-data", "emc-16bit-data",
> +	"emc-addr", "emc-rd-we", "emc-wait",
> +};
> +static const char *x2000_cs1_groups[] = { "emc-cs1", };
> +static const char *x2000_cs2_groups[] = { "emc-cs2", };
> +static const char *x2000_i2c0_groups[] = { "i2c0-data", };
> +static const char *x2000_i2c1_groups[] = { "i2c1-data-c", 
> "i2c1-data-d", };
> +static const char *x2000_i2c2_groups[] = { "i2c2-data-b", 
> "i2c2-data-d", };
> +static const char *x2000_i2c3_groups[] = { "i2c3-data-a", 
> "i2c3-data-d", };
> +static const char *x2000_i2c4_groups[] = { "i2c4-data-c", 
> "i2c4-data-d", };
> +static const char *x2000_i2c5_groups[] = { "i2c5-data-c", 
> "i2c5-data-d", };
> +static const char *x2000_i2s1_groups[] = {
> +	"i2s1-data-tx", "i2s1-data-rx",
> +	"i2s1-clk-tx", "i2s1-clk-rx",
> +	"i2s1-sysclk-tx", "i2s1-sysclk-rx",
> +};
> +static const char *x2000_i2s2_groups[] = {
> +	"i2s2-data-rx0", "i2s2-data-rx1", "i2s2-data-rx2", "i2s2-data-rx3",
> +	"i2s2-clk-rx", "i2s2-sysclk-rx",
> +};
> +static const char *x2000_i2s3_groups[] = {
> +	"i2s3-data-tx0", "i2s3-data-tx1", "i2s3-data-tx2", "i2s3-data-tx3",
> +	"i2s3-clk-tx", "i2s3-sysclk-tx",
> +};
> +static const char *x2000_cim_groups[] = { "cim-data-8bit", 
> "cim-data-12bit", };
> +static const char *x2000_lcd_groups[] = {
> +	"lcd-rgb-24bit", "lcd-slcd-8bit", "lcd-slcd-16bit", "lcd-no-pins",
> +};
> +static const char *x2000_pwm0_groups[] = { "pwm0-c", "pwm0-d", };
> +static const char *x2000_pwm1_groups[] = { "pwm1-c", "pwm1-d", };
> +static const char *x2000_pwm2_groups[] = { "pwm2-c", "pwm2-e", };
> +static const char *x2000_pwm3_groups[] = { "pwm3-c", "pwm3-r", };
> +static const char *x2000_pwm4_groups[] = { "pwm4-c", "pwm4-e", };
> +static const char *x2000_pwm5_groups[] = { "pwm5-c", "pwm5-e", };
> +static const char *x2000_pwm6_groups[] = { "pwm6-c", "pwm6-e", };
> +static const char *x2000_pwm7_groups[] = { "pwm7-c", "pwm7-e", };
> +static const char *x2000_pwm8_groups[] = { "pwm8", };
> +static const char *x2000_pwm9_groups[] = { "pwm9", };
> +static const char *x2000_pwm10_groups[] = { "pwm10", };
> +static const char *x2000_pwm11_groups[] = { "pwm11", };
> +static const char *x2000_pwm12_groups[] = { "pwm12", };
> +static const char *x2000_pwm13_groups[] = { "pwm13", };
> +static const char *x2000_pwm14_groups[] = { "pwm14", };
> +static const char *x2000_pwm15_groups[] = { "pwm15", };
> +static const char *x2000_mac0_groups[] = { "mac0-rmii", 
> "mac0-rgmii", };
> +static const char *x2000_mac1_groups[] = { "mac1-rmii", 
> "mac1-rgmii", };
> +static const char *x2000_otg_groups[] = { "otg-vbus", };
> +
> +static const struct function_desc x2000_functions[] = {
> +	{ "uart0", x2000_uart0_groups, ARRAY_SIZE(x2000_uart0_groups), },
> +	{ "uart1", x2000_uart1_groups, ARRAY_SIZE(x2000_uart1_groups), },
> +	{ "uart2", x2000_uart2_groups, ARRAY_SIZE(x2000_uart2_groups), },
> +	{ "uart3", x2000_uart3_groups, ARRAY_SIZE(x2000_uart3_groups), },
> +	{ "uart4", x2000_uart4_groups, ARRAY_SIZE(x2000_uart4_groups), },
> +	{ "uart5", x2000_uart5_groups, ARRAY_SIZE(x2000_uart5_groups), },
> +	{ "uart6", x2000_uart6_groups, ARRAY_SIZE(x2000_uart6_groups), },
> +	{ "uart7", x2000_uart7_groups, ARRAY_SIZE(x2000_uart7_groups), },
> +	{ "uart8", x2000_uart8_groups, ARRAY_SIZE(x2000_uart8_groups), },
> +	{ "uart9", x2000_uart9_groups, ARRAY_SIZE(x2000_uart9_groups), },
> +	{ "sfc", x2000_sfc_groups, ARRAY_SIZE(x2000_sfc_groups), },
> +	{ "ssi0", x2000_ssi0_groups, ARRAY_SIZE(x2000_ssi0_groups), },
> +	{ "ssi1", x2000_ssi1_groups, ARRAY_SIZE(x2000_ssi1_groups), },
> +	{ "mmc0", x2000_mmc0_groups, ARRAY_SIZE(x2000_mmc0_groups), },
> +	{ "mmc1", x2000_mmc1_groups, ARRAY_SIZE(x2000_mmc1_groups), },
> +	{ "mmc2", x2000_mmc2_groups, ARRAY_SIZE(x2000_mmc2_groups), },
> +	{ "emc", x2000_emc_groups, ARRAY_SIZE(x2000_emc_groups), },
> +	{ "emc-cs1", x2000_cs1_groups, ARRAY_SIZE(x2000_cs1_groups), },
> +	{ "emc-cs2", x2000_cs2_groups, ARRAY_SIZE(x2000_cs2_groups), },
> +	{ "i2c0", x2000_i2c0_groups, ARRAY_SIZE(x2000_i2c0_groups), },
> +	{ "i2c1", x2000_i2c1_groups, ARRAY_SIZE(x2000_i2c1_groups), },
> +	{ "i2c2", x2000_i2c2_groups, ARRAY_SIZE(x2000_i2c2_groups), },
> +	{ "i2c3", x2000_i2c3_groups, ARRAY_SIZE(x2000_i2c3_groups), },
> +	{ "i2c4", x2000_i2c4_groups, ARRAY_SIZE(x2000_i2c4_groups), },
> +	{ "i2c5", x2000_i2c5_groups, ARRAY_SIZE(x2000_i2c5_groups), },
> +	{ "i2s1", x2000_i2s1_groups, ARRAY_SIZE(x2000_i2s1_groups), },
> +	{ "i2s2", x2000_i2s2_groups, ARRAY_SIZE(x2000_i2s2_groups), },
> +	{ "i2s3", x2000_i2s3_groups, ARRAY_SIZE(x2000_i2s3_groups), },
> +	{ "cim", x2000_cim_groups, ARRAY_SIZE(x2000_cim_groups), },
> +	{ "lcd", x2000_lcd_groups, ARRAY_SIZE(x2000_lcd_groups), },
> +	{ "pwm0", x2000_pwm0_groups, ARRAY_SIZE(x2000_pwm0_groups), },
> +	{ "pwm1", x2000_pwm1_groups, ARRAY_SIZE(x2000_pwm1_groups), },
> +	{ "pwm2", x2000_pwm2_groups, ARRAY_SIZE(x2000_pwm2_groups), },
> +	{ "pwm3", x2000_pwm3_groups, ARRAY_SIZE(x2000_pwm3_groups), },
> +	{ "pwm4", x2000_pwm4_groups, ARRAY_SIZE(x2000_pwm4_groups), },
> +	{ "pwm5", x2000_pwm5_groups, ARRAY_SIZE(x2000_pwm5_groups), },
> +	{ "pwm6", x2000_pwm6_groups, ARRAY_SIZE(x2000_pwm6_groups), },
> +	{ "pwm7", x2000_pwm7_groups, ARRAY_SIZE(x2000_pwm7_groups), },
> +	{ "pwm8", x2000_pwm8_groups, ARRAY_SIZE(x2000_pwm8_groups), },
> +	{ "pwm9", x2000_pwm9_groups, ARRAY_SIZE(x2000_pwm9_groups), },
> +	{ "pwm10", x2000_pwm10_groups, ARRAY_SIZE(x2000_pwm10_groups), },
> +	{ "pwm11", x2000_pwm11_groups, ARRAY_SIZE(x2000_pwm11_groups), },
> +	{ "pwm12", x2000_pwm12_groups, ARRAY_SIZE(x2000_pwm12_groups), },
> +	{ "pwm13", x2000_pwm13_groups, ARRAY_SIZE(x2000_pwm13_groups), },
> +	{ "pwm14", x2000_pwm14_groups, ARRAY_SIZE(x2000_pwm14_groups), },
> +	{ "pwm15", x2000_pwm15_groups, ARRAY_SIZE(x2000_pwm15_groups), },
> +	{ "mac0", x2000_mac0_groups, ARRAY_SIZE(x2000_mac0_groups), },
> +	{ "mac1", x2000_mac1_groups, ARRAY_SIZE(x2000_mac1_groups), },
> +	{ "otg", x2000_otg_groups, ARRAY_SIZE(x2000_otg_groups), },
> +};
> +
> +static const struct ingenic_chip_info x2000_chip_info = {
> +	.num_chips = 5,
> +	.reg_offset = 0x100,
> +	.version = ID_X2000,
> +	.groups = x2000_groups,
> +	.num_groups = ARRAY_SIZE(x2000_groups),
> +	.functions = x2000_functions,
> +	.num_functions = ARRAY_SIZE(x2000_functions),
> +	.pull_ups = x2000_pull_ups,
> +	.pull_downs = x2000_pull_downs,
> +};
> +
>  static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 
> reg)
>  {
>  	unsigned int val;
> @@ -1669,6 +2713,12 @@ static u32 ingenic_gpio_read_reg(struct 
> ingenic_gpio_chip *jzgc, u8 reg)
>  static void ingenic_gpio_set_bit(struct ingenic_gpio_chip *jzgc,
>  		u8 reg, u8 offset, bool set)
>  {
> +	if (jzgc->jzpc->info->version == ID_JZ4730) {
> +		regmap_update_bits(jzgc->jzpc->map, jzgc->reg_base + reg,
> +					BIT(offset), set ? BIT(offset) : 0);
> +		return;
> +	}
> +
>  	if (set)
>  		reg = REG_SET(reg);
>  	else
> @@ -1677,6 +2727,20 @@ static void ingenic_gpio_set_bit(struct 
> ingenic_gpio_chip *jzgc,
>  	regmap_write(jzgc->jzpc->map, jzgc->reg_base + reg, BIT(offset));
>  }
> 
> +static void ingenic_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
> +		u8 reg_upper, u8 reg_lower, u8 offset, u8 value)
> +{
> +	/* JZ4730 function and IRQ registers support two-bits-per-pin
> +	 * definitions, split into two groups of 16.
> +	 */
> +
> +	u8 reg = offset < JZ4730_PINS_PER_PAIRED_REG ? reg_lower : 
> reg_upper;
> +	unsigned int idx = offset % JZ4730_PINS_PER_PAIRED_REG;
> +
> +	regmap_update_bits(jzgc->jzpc->map, jzgc->reg_base + reg,
> +				3 << (idx * 2), value << (idx * 2));
> +}
> +
>  static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip 
> *jzgc,
>  		u8 reg, u8 offset, bool set)
>  {
> @@ -1709,43 +2773,61 @@ static void ingenic_gpio_set_value(struct 
> ingenic_gpio_chip *jzgc,
>  {
>  	if (jzgc->jzpc->info->version >= ID_JZ4770)
>  		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
> -	else
> +	else if (jzgc->jzpc->info->version >= ID_JZ4740)
>  		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_DATA, offset, !!value);
>  }
> 
>  static void irq_set_type(struct ingenic_gpio_chip *jzgc,
>  		u8 offset, unsigned int type)
>  {
>  	u8 reg1, reg2;
> -	bool val1, val2;
> +	bool val1, val2, val3;
> 
>  	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		val1 = val2 = false;
> +		val3 = true;
> +		break;
>  	case IRQ_TYPE_EDGE_RISING:
>  		val1 = val2 = true;
> +		val3 = false;
>  		break;
>  	case IRQ_TYPE_EDGE_FALLING:
> -		val1 = false;
> +		val1 = val3 = false;
>  		val2 = true;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
>  		val1 = true;
> -		val2 = false;
> +		val2 = val3 = false;
>  		break;
>  	case IRQ_TYPE_LEVEL_LOW:
>  	default:
> -		val1 = val2 = false;
> +		val1 = val2 = val3 = false;
>  		break;
>  	}
> 
>  	if (jzgc->jzpc->info->version >= ID_JZ4770) {
>  		reg1 = JZ4770_GPIO_PAT1;
>  		reg2 = JZ4770_GPIO_PAT0;
> -	} else {
> +	} else if (jzgc->jzpc->info->version >= ID_JZ4740) {
>  		reg1 = JZ4740_GPIO_TRIG;
>  		reg2 = JZ4740_GPIO_DIR;
> +	} else {
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPDIR, offset, false);
> +		ingenic_gpio_set_bits(jzgc, JZ4730_GPIO_GPIDUR,
> +					JZ4730_GPIO_GPIDLR, offset,
> +					(val2 ? 2 : 0) | (val1 ? 1 : 0));
> +		return;
>  	}
> 
> -	if (jzgc->jzpc->info->version >= ID_X1000) {
> +	if (jzgc->jzpc->info->version >= ID_X2000) {
> +		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
> +		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
> +		ingenic_gpio_shadow_set_bit_load(jzgc);
> +		ingenic_gpio_set_bit(jzgc, X2000_GPIO_EDG, offset, val3);
> +	} else if (jzgc->jzpc->info->version >= ID_X1000) {
>  		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
>  		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
>  		ingenic_gpio_shadow_set_bit_load(jzgc);
> @@ -1759,16 +2841,24 @@ static void ingenic_gpio_irq_mask(struct 
> irq_data *irqd)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
>  	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
> +	int irq = irqd->hwirq;
> 
> -	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, true);
> +	if (jzgc->jzpc->info->version >= ID_JZ4740)
> +		ingenic_gpio_set_bit(jzgc, GPIO_MSK, irq, true);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIMR, irq, true);
>  }
> 
>  static void ingenic_gpio_irq_unmask(struct irq_data *irqd)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
>  	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
> +	int irq = irqd->hwirq;
> 
> -	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, false);
> +	if (jzgc->jzpc->info->version >= ID_JZ4740)
> +		ingenic_gpio_set_bit(jzgc, GPIO_MSK, irq, false);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIMR, irq, false);
>  }
> 
>  static void ingenic_gpio_irq_enable(struct irq_data *irqd)
> @@ -1779,8 +2869,10 @@ static void ingenic_gpio_irq_enable(struct 
> irq_data *irqd)
> 
>  	if (jzgc->jzpc->info->version >= ID_JZ4770)
>  		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
> -	else
> +	else if (jzgc->jzpc->info->version >= ID_JZ4740)
>  		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIER, irq, true);
> 
>  	ingenic_gpio_irq_unmask(irqd);
>  }
> @@ -1795,8 +2887,10 @@ static void ingenic_gpio_irq_disable(struct 
> irq_data *irqd)
> 
>  	if (jzgc->jzpc->info->version >= ID_JZ4770)
>  		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
> -	else
> +	else if (jzgc->jzpc->info->version >= ID_JZ4740)
>  		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIER, irq, false);
>  }
> 
>  static void ingenic_gpio_irq_ack(struct irq_data *irqd)
> @@ -1806,7 +2900,8 @@ static void ingenic_gpio_irq_ack(struct 
> irq_data *irqd)
>  	int irq = irqd->hwirq;
>  	bool high;
> 
> -	if (irqd_get_trigger_type(irqd) == IRQ_TYPE_EDGE_BOTH) {
> +	if ((irqd_get_trigger_type(irqd) == IRQ_TYPE_EDGE_BOTH) &&
> +		(jzgc->jzpc->info->version < ID_X2000)) {
>  		/*
>  		 * Switch to an interrupt for the opposite edge to the one that
>  		 * triggered the interrupt being ACKed.
> @@ -1820,8 +2915,10 @@ static void ingenic_gpio_irq_ack(struct 
> irq_data *irqd)
> 
>  	if (jzgc->jzpc->info->version >= ID_JZ4770)
>  		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
> -	else
> +	else if (jzgc->jzpc->info->version >= ID_JZ4740)
>  		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
> +	else
> +		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPFR, irq, false);
>  }
> 
>  static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned 
> int type)
> @@ -1843,7 +2940,7 @@ static int ingenic_gpio_irq_set_type(struct 
> irq_data *irqd, unsigned int type)
>  		irq_set_handler_locked(irqd, handle_bad_irq);
>  	}
> 
> -	if (type == IRQ_TYPE_EDGE_BOTH) {
> +	if ((type == IRQ_TYPE_EDGE_BOTH) && (jzgc->jzpc->info->version < 
> ID_X2000)) {
>  		/*
>  		 * The hardware does not support interrupts on both edges. The
>  		 * best we can do is to set up a single-edge interrupt and then
> @@ -1877,8 +2974,10 @@ static void ingenic_gpio_irq_handler(struct 
> irq_desc *desc)
> 
>  	if (jzgc->jzpc->info->version >= ID_JZ4770)
>  		flag = ingenic_gpio_read_reg(jzgc, JZ4770_GPIO_FLAG);
> -	else
> +	else if (jzgc->jzpc->info->version >= ID_JZ4740)
>  		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
> +	else
> +		flag = ingenic_gpio_read_reg(jzgc, JZ4730_GPIO_GPFR);
> 
>  	for_each_set_bit(i, &flag, 32)
>  		generic_handle_irq(irq_linear_revmap(gc->irq.domain, i));
> @@ -1919,8 +3018,27 @@ static inline void ingenic_config_pin(struct 
> ingenic_pinctrl *jzpc,
>  	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>  	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
> 
> -	regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
> -			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	if (jzpc->info->version >= ID_JZ4740)
> +		regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
> +				(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
> +	else
> +		regmap_update_bits(jzpc->map, offt * jzpc->info->reg_offset + reg,
> +					BIT(idx), set ? BIT(idx) : 0);
> +}
> +
> +static inline void ingenic_config_pin_function(struct 
> ingenic_pinctrl *jzpc,
> +		unsigned int pin, u8 reg_upper, u8 reg_lower, u8 value)
> +{
> +	/* JZ4730 function and IRQ registers support two-bits-per-pin
> +	 * definitions, split into two groups of 16.
> +	 */
> +
> +	unsigned int idx = pin % JZ4730_PINS_PER_PAIRED_REG;
> +	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
> +	u8 reg = (pin % PINS_PER_GPIO_CHIP) < JZ4730_PINS_PER_PAIRED_REG ? 
> reg_lower : reg_upper;
> +
> +	regmap_update_bits(jzpc->map, offt * jzpc->info->reg_offset + reg,
> +				3 << (idx * 2), value << (idx * 2));
>  }
> 
>  static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl 
> *jzpc,
> @@ -1962,6 +3080,10 @@ static int ingenic_gpio_get_direction(struct 
> gpio_chip *gc, unsigned int offset)
>  		    ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1))
>  			return GPIO_LINE_DIRECTION_IN;
>  		return GPIO_LINE_DIRECTION_OUT;
> +	} else if (jzpc->info->version == ID_JZ4730) {
> +		if (!ingenic_get_pin_config(jzpc, pin, JZ4730_GPIO_GPDIR))
> +			return GPIO_LINE_DIRECTION_IN;
> +		return GPIO_LINE_DIRECTION_OUT;
>  	}
> 
>  	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
> @@ -2020,10 +3142,14 @@ static int ingenic_pinmux_set_pin_fn(struct 
> ingenic_pinctrl *jzpc,
>  		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, func & 0x2);
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, func & 0x1);
> -	} else {
> +	} else if (jzpc->info->version >= ID_JZ4740) {
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, true);
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_TRIG, func & 0x2);
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, func & 0x1);
> +	} else {
> +		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPIER, false);
> +		ingenic_config_pin_function(jzpc, pin, JZ4730_GPIO_GPAUR,
> +						JZ4730_GPIO_GPALR, func & 0x3);
>  	}
> 
>  	return 0;
> @@ -2084,10 +3210,15 @@ static int 
> ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
>  		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
> -	} else {
> +	} else if (jzpc->info->version >= ID_JZ4740) {
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, false);
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, !input);
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, false);
> +	} else {
> +		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPIER, false);
> +		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPDIR, !input);
> +		ingenic_config_pin_function(jzpc, pin, JZ4730_GPIO_GPAUR,
> +						JZ4730_GPIO_GPALR, 0);
>  	}
> 
>  	return 0;
> @@ -2111,7 +3242,33 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  	unsigned int bias;
>  	bool pull;
> 
> -	if (jzpc->info->version >= ID_X1830) {
> +	if (jzpc->info->version >= ID_X2000) {
> +		bool pull_up, pull_down;
> +
> +		pull_up = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU);
> +		pull_down = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			if (pull_up || pull_down)
> +				return -EINVAL;
> +			break;
> +
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			if (!pull_up || pull_down || !(jzpc->info->pull_ups[offt] & 
> BIT(idx)))
> +				return -EINVAL;
> +			break;
> +
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			if (pull_up || !pull_down || !(jzpc->info->pull_downs[offt] & 
> BIT(idx)))
> +				return -EINVAL;
> +			break;
> +
> +		default:
> +			return -ENOTSUPP;
> +		}
> +
> +	} else if (jzpc->info->version >= ID_X1830) {
>  		unsigned int half = PINS_PER_GPIO_CHIP / 2;
>  		unsigned int idxh = pin % half * 2;
> 
> @@ -2149,8 +3306,10 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  	} else {
>  		if (jzpc->info->version >= ID_JZ4770)
>  			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
> -		else
> +		else if (jzpc->info->version >= ID_JZ4740)
>  			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
> +		else
> +			pull = ingenic_get_pin_config(jzpc, pin, JZ4730_GPIO_GPPUR);
> 
>  		switch (param) {
>  		case PIN_CONFIG_BIAS_DISABLE:
> @@ -2180,7 +3339,25 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
>  		unsigned int pin, unsigned int bias)
>  {
> -	if (jzpc->info->version >= ID_X1830) {
> +	if (jzpc->info->version >= ID_X2000) {
> +		switch (bias) {
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, false);
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, true);
> +			break;
> +
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, false);
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, true);
> +			break;
> +
> +		case PIN_CONFIG_BIAS_DISABLE:
> +		default:
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPU, false);
> +			ingenic_config_pin(jzpc, pin, X2000_GPIO_PEPD, false);
> +		}
> +
> +	} else if (jzpc->info->version >= ID_X1830) {
>  		unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>  		unsigned int half = PINS_PER_GPIO_CHIP / 2;
>  		unsigned int idxh = pin % half * 2;
> @@ -2200,8 +3377,10 @@ static void ingenic_set_bias(struct 
> ingenic_pinctrl *jzpc,
> 
>  	} else if (jzpc->info->version >= ID_JZ4770) {
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !bias);
> -	} else {
> +	} else if (jzpc->info->version >= ID_JZ4740) {
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
> +	} else {
> +		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPPUR, bias);
>  	}
>  }
> 
> @@ -2210,8 +3389,10 @@ static void ingenic_set_output_level(struct 
> ingenic_pinctrl *jzpc,
>  {
>  	if (jzpc->info->version >= ID_JZ4770)
>  		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, high);
> -	else
> +	else if (jzpc->info->version >= ID_JZ4740)
>  		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
> +	else
> +		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_DATA, high);
>  }
> 
>  static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned 
> int pin,
> @@ -2340,13 +3521,18 @@ static const struct regmap_config 
> ingenic_pinctrl_regmap_config = {
>  };
> 
>  static const struct of_device_id ingenic_gpio_of_match[] __initconst 
> = {
> +	{ .compatible = "ingenic,jz4730-gpio", },
>  	{ .compatible = "ingenic,jz4740-gpio", },
>  	{ .compatible = "ingenic,jz4725b-gpio", },
> +	{ .compatible = "ingenic,jz4750-gpio", },
> +	{ .compatible = "ingenic,jz4755-gpio", },
>  	{ .compatible = "ingenic,jz4760-gpio", },
>  	{ .compatible = "ingenic,jz4770-gpio", },
> +	{ .compatible = "ingenic,jz4775-gpio", },
>  	{ .compatible = "ingenic,jz4780-gpio", },
>  	{ .compatible = "ingenic,x1000-gpio", },
>  	{ .compatible = "ingenic,x1830-gpio", },
> +	{ .compatible = "ingenic,x2000-gpio", },
>  	{},
>  };
> 
> @@ -2534,6 +3720,10 @@ static int __init ingenic_pinctrl_probe(struct 
> platform_device *pdev)
> 
>  static const struct of_device_id ingenic_pinctrl_of_match[] = {
>  	{
> +		.compatible = "ingenic,jz4730-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_JZ4730, &jz4730_chip_info)
> +	},
> +	{
>  		.compatible = "ingenic,jz4740-pinctrl",
>  		.data = IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_info)
>  	},
> @@ -2542,6 +3732,14 @@ static const struct of_device_id 
> ingenic_pinctrl_of_match[] = {
>  		.data = IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_info)
>  	},
>  	{
> +		.compatible = "ingenic,jz4750-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_JZ4750, &jz4750_chip_info)
> +	},
> +	{
> +		.compatible = "ingenic,jz4755-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)
> +	},
> +	{
>  		.compatible = "ingenic,jz4760-pinctrl",
>  		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
>  	},
> @@ -2554,6 +3752,10 @@ static const struct of_device_id 
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
> @@ -2573,6 +3775,10 @@ static const struct of_device_id 
> ingenic_pinctrl_of_match[] = {
>  		.compatible = "ingenic,x1830-pinctrl",
>  		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
>  	},
> +	{
> +		.compatible = "ingenic,x2000-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_X2000, &x2000_chip_info)
> +	},
>  	{ /* sentinel */ },
>  };
> 
> --
> 2.7.4
> 


