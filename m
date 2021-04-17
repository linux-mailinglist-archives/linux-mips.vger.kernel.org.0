Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A99362EEA
	for <lists+linux-mips@lfdr.de>; Sat, 17 Apr 2021 11:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDQJis convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 17 Apr 2021 05:38:48 -0400
Received: from aposti.net ([89.234.176.197]:39742 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhDQJir (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Apr 2021 05:38:47 -0400
Date:   Sat, 17 Apr 2021 10:38:03 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 04/11] pinctrl: Ingenic: Improve LCD pins related code.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        siyanteng@loongson.cn
Message-Id: <F3CPRQ.3JROPDM9B51L3@crapouillou.net>
In-Reply-To: <1618589645-96504-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1618589645-96504-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam. 17 avril 2021 à 0:13, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> 1.In the JZ4740 part, remove pointless "lcd-no-pins", use 
> "lcd-special"
>   and "lcd-generic" instead "lcd-18bit-tft". Currently, in the 
> mainline,
>   no other devicetree out there is using the "lcd-18bit-tft" ABI, so 
> we
>   should be able to replace it safely.
> 2.In the JZ4725B part, adjust the location of the LCD pins related 
> code
>   to keep them consistent with the style of other parts.
> 3.In the JZ4760 part, add the missing comma and adjust element order 
> in
>   "jz4760_lcd_special_pins[]", keep them in the order of 
> CLS/SPL/PS/REV
>   like other "lcd_special_pins" arrays. And adjust the location of the
>   "jz4760_lcd_generic" related code to keep them consistent with the
>   style of other parts.
> 4.In the JZ4770 part, remove pointless "lcd-no-pins", add the missing
>   "lcd-16bit", "lcd-18bit", "lcd-special", "lcd-generic".
> 5.In the X1000 part and the X1500 part, remove pointless 
> "lcd-no-pins".
> 6.In the X1830 part, replace "lcd-rgb-18bit" with "lcd-tft-8bit" and
>   "lcd-tft-24bit", because of the description of the TRANS_CONFIG.MODE
>   register bits in the PM manual of the X1830, shows that the X1830 
> only
>   supppots 24bit mode and 8bit mode for tft interface, only 18 pins in
>   the GPIO table are because of the data[17:16], the data[9:8], and 
> the
>   data[1:0] has not been connected. And according to the description,
>   the two interfaces supported by X1830 are respectively referred to 
> as
>   "TFT interface" and "SLCD interface", so the "lcd-rgb-xxx" is 
> replaced
>   with "lcd-tft-xxx" to avoid confusion.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v4:
>     New patch.
> 
>     v4->v5:
>     No change.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 110 
> +++++++++++++++++++++-----------------
>  1 file changed, 61 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 72d9daa..8ed62a4 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -113,13 +113,15 @@ static int jz4740_uart0_data_pins[] = { 0x7a, 
> 0x79, };
>  static int jz4740_uart0_hwflow_pins[] = { 0x7e, 0x7f, };
>  static int jz4740_uart1_data_pins[] = { 0x7e, 0x7f, };
>  static int jz4740_lcd_8bit_pins[] = {
> -	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x52, 0x53, 0x54,
> +	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
> +	0x52, 0x53, 0x54,
>  };
>  static int jz4740_lcd_16bit_pins[] = {
> -	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x55,
> +	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
>  };
>  static int jz4740_lcd_18bit_pins[] = { 0x50, 0x51, };
> -static int jz4740_lcd_18bit_tft_pins[] = { 0x56, 0x57, 0x31, 0x32, };
> +static int jz4740_lcd_special_pins[] = { 0x31, 0x32, 0x56, 0x57, };
> +static int jz4740_lcd_generic_pins[] = { 0x55, };
>  static int jz4740_nand_cs1_pins[] = { 0x39, };
>  static int jz4740_nand_cs2_pins[] = { 0x3a, };
>  static int jz4740_nand_cs3_pins[] = { 0x3b, };
> @@ -155,8 +157,8 @@ static const struct group_desc jz4740_groups[] = {
>  	INGENIC_PIN_GROUP("lcd-8bit", jz4740_lcd_8bit, 0),
>  	INGENIC_PIN_GROUP("lcd-16bit", jz4740_lcd_16bit, 0),
>  	INGENIC_PIN_GROUP("lcd-18bit", jz4740_lcd_18bit, 0),
> -	INGENIC_PIN_GROUP("lcd-18bit-tft", jz4740_lcd_18bit_tft, 0),
> -	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("lcd-special", jz4740_lcd_special, 0),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4740_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("nand-cs1", jz4740_nand_cs1, 0),
>  	INGENIC_PIN_GROUP("nand-cs2", jz4740_nand_cs2, 0),
>  	INGENIC_PIN_GROUP("nand-cs3", jz4740_nand_cs3, 0),
> @@ -176,7 +178,7 @@ static const char *jz4740_mmc_groups[] = { 
> "mmc-1bit", "mmc-4bit", };
>  static const char *jz4740_uart0_groups[] = { "uart0-data", 
> "uart0-hwflow", };
>  static const char *jz4740_uart1_groups[] = { "uart1-data", };
>  static const char *jz4740_lcd_groups[] = {
> -	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-18bit-tft", 
> "lcd-no-pins",
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-special", "lcd-generic",
>  };
>  static const char *jz4740_nand_groups[] = {
>  	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
> @@ -223,6 +225,17 @@ static int jz4725b_mmc0_4bit_pins[] = { 0x5d, 
> 0x5b, 0x56, };
>  static int jz4725b_mmc1_1bit_pins[] = { 0x7a, 0x7b, 0x7c, };
>  static int jz4725b_mmc1_4bit_pins[] = { 0x7d, 0x7e, 0x7f, };
>  static int jz4725b_uart_data_pins[] = { 0x4c, 0x4d, };
> +static int jz4725b_lcd_8bit_pins[] = {
> +	0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
> +	0x72, 0x73, 0x74,
> +};
> +static int jz4725b_lcd_16bit_pins[] = {
> +	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
> +};
> +static int jz4725b_lcd_18bit_pins[] = { 0x70, 0x71, };
> +static int jz4725b_lcd_24bit_pins[] = { 0x76, 0x77, 0x78, 0x79, };
> +static int jz4725b_lcd_special_pins[] = { 0x76, 0x77, 0x78, 0x79, };
> +static int jz4725b_lcd_generic_pins[] = { 0x75, };
>  static int jz4725b_nand_cs1_pins[] = { 0x55, };
>  static int jz4725b_nand_cs2_pins[] = { 0x56, };
>  static int jz4725b_nand_cs3_pins[] = { 0x57, };
> @@ -235,19 +248,6 @@ static int jz4725b_pwm_pwm2_pins[] = { 0x4c, };
>  static int jz4725b_pwm_pwm3_pins[] = { 0x4d, };
>  static int jz4725b_pwm_pwm4_pins[] = { 0x4e, };
>  static int jz4725b_pwm_pwm5_pins[] = { 0x4f, };
> -static int jz4725b_lcd_8bit_pins[] = {
> -	0x72, 0x73, 0x74,
> -	0x60, 0x61, 0x62, 0x63,
> -	0x64, 0x65, 0x66, 0x67,
> -};
> -static int jz4725b_lcd_16bit_pins[] = {
> -	0x68, 0x69, 0x6a, 0x6b,
> -	0x6c, 0x6d, 0x6e, 0x6f,
> -};
> -static int jz4725b_lcd_18bit_pins[] = { 0x70, 0x71, };
> -static int jz4725b_lcd_24bit_pins[] = { 0x76, 0x77, 0x78, 0x79, };
> -static int jz4725b_lcd_special_pins[] = { 0x76, 0x77, 0x78, 0x79, };
> -static int jz4725b_lcd_generic_pins[] = { 0x75, };
> 
>  static u8 jz4725b_mmc0_4bit_funcs[] = { 1, 0, 1, };
> 
> @@ -258,6 +258,12 @@ static const struct group_desc jz4725b_groups[] 
> = {
>  	INGENIC_PIN_GROUP("mmc1-1bit", jz4725b_mmc1_1bit, 0),
>  	INGENIC_PIN_GROUP("mmc1-4bit", jz4725b_mmc1_4bit, 0),
>  	INGENIC_PIN_GROUP("uart-data", jz4725b_uart_data, 1),
> +	INGENIC_PIN_GROUP("lcd-8bit", jz4725b_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4725b_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4725b_lcd_18bit, 0),
> +	INGENIC_PIN_GROUP("lcd-24bit", jz4725b_lcd_24bit, 1),
> +	INGENIC_PIN_GROUP("lcd-special", jz4725b_lcd_special, 0),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4725b_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("nand-cs1", jz4725b_nand_cs1, 0),
>  	INGENIC_PIN_GROUP("nand-cs2", jz4725b_nand_cs2, 0),
>  	INGENIC_PIN_GROUP("nand-cs3", jz4725b_nand_cs3, 0),
> @@ -270,17 +276,15 @@ static const struct group_desc jz4725b_groups[] 
> = {
>  	INGENIC_PIN_GROUP("pwm3", jz4725b_pwm_pwm3, 0),
>  	INGENIC_PIN_GROUP("pwm4", jz4725b_pwm_pwm4, 0),
>  	INGENIC_PIN_GROUP("pwm5", jz4725b_pwm_pwm5, 0),
> -	INGENIC_PIN_GROUP("lcd-8bit", jz4725b_lcd_8bit, 0),
> -	INGENIC_PIN_GROUP("lcd-16bit", jz4725b_lcd_16bit, 0),
> -	INGENIC_PIN_GROUP("lcd-18bit", jz4725b_lcd_18bit, 0),
> -	INGENIC_PIN_GROUP("lcd-24bit", jz4725b_lcd_24bit, 1),
> -	INGENIC_PIN_GROUP("lcd-special", jz4725b_lcd_special, 0),
> -	INGENIC_PIN_GROUP("lcd-generic", jz4725b_lcd_generic, 0),
>  };
> 
>  static const char *jz4725b_mmc0_groups[] = { "mmc0-1bit", 
> "mmc0-4bit", };
>  static const char *jz4725b_mmc1_groups[] = { "mmc1-1bit", 
> "mmc1-4bit", };
>  static const char *jz4725b_uart_groups[] = { "uart-data", };
> +static const char *jz4725b_lcd_groups[] = {
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
> +	"lcd-special", "lcd-generic",
> +};
>  static const char *jz4725b_nand_groups[] = {
>  	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4",
>  	"nand-cle-ale", "nand-fre-fwe",
> @@ -291,10 +295,6 @@ static const char *jz4725b_pwm2_groups[] = { 
> "pwm2", };
>  static const char *jz4725b_pwm3_groups[] = { "pwm3", };
>  static const char *jz4725b_pwm4_groups[] = { "pwm4", };
>  static const char *jz4725b_pwm5_groups[] = { "pwm5", };
> -static const char *jz4725b_lcd_groups[] = {
> -	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
> -	"lcd-special", "lcd-generic",
> -};
> 
>  static const struct function_desc jz4725b_functions[] = {
>  	{ "mmc0", jz4725b_mmc0_groups, ARRAY_SIZE(jz4725b_mmc0_groups), },
> @@ -389,7 +389,7 @@ static int jz4760_lcd_18bit_pins[] = {
>  static int jz4760_lcd_24bit_pins[] = {
>  	0x40, 0x41, 0x4a, 0x4b, 0x54, 0x55,
>  };
> -static int jz4760_lcd_special_pins[] = { 0x40, 0x41, 0x4a, 0x54 };
> +static int jz4760_lcd_special_pins[] = { 0x54, 0x4a, 0x41, 0x40, };
>  static int jz4760_lcd_generic_pins[] = { 0x49, };
>  static int jz4760_pwm_pwm0_pins[] = { 0x80, };
>  static int jz4760_pwm_pwm1_pins[] = { 0x81, };
> @@ -450,8 +450,8 @@ static const struct group_desc jz4760_groups[] = {
>  	INGENIC_PIN_GROUP("lcd-16bit", jz4760_lcd_16bit, 0),
>  	INGENIC_PIN_GROUP("lcd-18bit", jz4760_lcd_18bit, 0),
>  	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit, 0),
> -	INGENIC_PIN_GROUP("lcd-generic", jz4760_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("lcd-special", jz4760_lcd_special, 1),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4760_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0, 0),
>  	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1, 0),
>  	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2, 0),
> @@ -648,7 +648,13 @@ static int jz4770_cim_12bit_pins[] = {
>  };
>  static int jz4770_lcd_8bit_pins[] = {
>  	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x4c, 0x4d,
> -	0x48, 0x49, 0x52, 0x53,
> +	0x48, 0x52, 0x53,
> +};
> +static int jz4770_lcd_16bit_pins[] = {
> +	0x4e, 0x4f, 0x50, 0x51, 0x56, 0x57, 0x58, 0x59,
> +};
> +static int jz4770_lcd_18bit_pins[] = {
> +	0x5a, 0x5b,
>  };
>  static int jz4770_lcd_24bit_pins[] = {
>  	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
> @@ -656,6 +662,8 @@ static int jz4770_lcd_24bit_pins[] = {
>  	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
>  	0x58, 0x59, 0x5a, 0x5b,
>  };
> +static int jz4770_lcd_special_pins[] = { 0x54, 0x4a, 0x41, 0x40, };
> +static int jz4770_lcd_generic_pins[] = { 0x49, };
>  static int jz4770_pwm_pwm0_pins[] = { 0x80, };
>  static int jz4770_pwm_pwm1_pins[] = { 0x81, };
>  static int jz4770_pwm_pwm2_pins[] = { 0x82, };
> @@ -756,8 +764,11 @@ static const struct group_desc jz4770_groups[] = 
> {
>  	INGENIC_PIN_GROUP("cim-data-8bit", jz4770_cim_8bit, 0),
>  	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
>  	INGENIC_PIN_GROUP("lcd-8bit", jz4770_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4770_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4770_lcd_18bit, 0),
>  	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit, 0),
> -	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("lcd-special", jz4770_lcd_special, 1),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4770_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0, 0),
>  	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1, 0),
>  	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2, 0),
> @@ -818,7 +829,8 @@ static const char *jz4770_i2c1_groups[] = { 
> "i2c1-data", };
>  static const char *jz4770_i2c2_groups[] = { "i2c2-data", };
>  static const char *jz4770_cim_groups[] = { "cim-data-8bit", 
> "cim-data-12bit", };
>  static const char *jz4770_lcd_groups[] = {
> -	"lcd-8bit", "lcd-24bit", "lcd-no-pins",
> +	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit",
> +	"lcd-special", "lcd-generic",
>  };
>  static const char *jz4770_pwm0_groups[] = { "pwm0", };
>  static const char *jz4770_pwm1_groups[] = { "pwm1", };
> @@ -1030,8 +1042,12 @@ static const struct group_desc jz4780_groups[] 
> = {
>  	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc, 0),
>  	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit, 0),
>  	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
> +	INGENIC_PIN_GROUP("lcd-8bit", jz4770_lcd_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-16bit", jz4770_lcd_16bit, 0),
> +	INGENIC_PIN_GROUP("lcd-18bit", jz4770_lcd_18bit, 0),
>  	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit, 0),
> -	{ "lcd-no-pins", },
> +	INGENIC_PIN_GROUP("lcd-special", jz4770_lcd_special, 1),
> +	INGENIC_PIN_GROUP("lcd-generic", jz4770_lcd_generic, 0),
>  	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0, 0),
>  	INGENIC_PIN_GROUP("pwm1", jz4770_pwm_pwm1, 0),
>  	INGENIC_PIN_GROUP("pwm2", jz4770_pwm_pwm2, 0),
> @@ -1259,7 +1275,6 @@ static const struct group_desc x1000_groups[] = 
> {
>  	INGENIC_PIN_GROUP("cim-data", x1000_cim, 2),
>  	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit, 1),
>  	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit, 1),
> -	{ "lcd-no-pins", },
>  	INGENIC_PIN_GROUP("pwm0", x1000_pwm_pwm0, 0),
>  	INGENIC_PIN_GROUP("pwm1", x1000_pwm_pwm1, 1),
>  	INGENIC_PIN_GROUP("pwm2", x1000_pwm_pwm2, 1),
> @@ -1301,9 +1316,7 @@ static const char *x1000_i2s_groups[] = {
>  	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
>  };
>  static const char *x1000_cim_groups[] = { "cim-data", };
> -static const char *x1000_lcd_groups[] = {
> -	"lcd-8bit", "lcd-16bit", "lcd-no-pins",
> -};
> +static const char *x1000_lcd_groups[] = { "lcd-8bit", "lcd-16bit", };
>  static const char *x1000_pwm0_groups[] = { "pwm0", };
>  static const char *x1000_pwm1_groups[] = { "pwm1", };
>  static const char *x1000_pwm2_groups[] = { "pwm2", };
> @@ -1395,7 +1408,6 @@ static const struct group_desc x1500_groups[] = 
> {
>  	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx, 1),
>  	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk, 1),
>  	INGENIC_PIN_GROUP("cim-data", x1500_cim, 2),
> -	{ "lcd-no-pins", },
>  	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0, 0),
>  	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1, 1),
>  	INGENIC_PIN_GROUP("pwm2", x1500_pwm_pwm2, 1),
> @@ -1416,7 +1428,6 @@ static const char *x1500_i2s_groups[] = {
>  	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
>  };
>  static const char *x1500_cim_groups[] = { "cim-data", };
> -static const char *x1500_lcd_groups[] = { "lcd-no-pins", };
>  static const char *x1500_pwm0_groups[] = { "pwm0", };
>  static const char *x1500_pwm1_groups[] = { "pwm1", };
>  static const char *x1500_pwm2_groups[] = { "pwm2", };
> @@ -1434,7 +1445,6 @@ static const struct function_desc 
> x1500_functions[] = {
>  	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
>  	{ "i2s", x1500_i2s_groups, ARRAY_SIZE(x1500_i2s_groups), },
>  	{ "cim", x1500_cim_groups, ARRAY_SIZE(x1500_cim_groups), },
> -	{ "lcd", x1500_lcd_groups, ARRAY_SIZE(x1500_lcd_groups), },
>  	{ "pwm0", x1500_pwm0_groups, ARRAY_SIZE(x1500_pwm0_groups), },
>  	{ "pwm1", x1500_pwm1_groups, ARRAY_SIZE(x1500_pwm1_groups), },
>  	{ "pwm2", x1500_pwm2_groups, ARRAY_SIZE(x1500_pwm2_groups), },
> @@ -1496,11 +1506,13 @@ static int x1830_i2s_data_rx_pins[] = { 0x54, 
> };
>  static int x1830_i2s_clk_txrx_pins[] = { 0x58, 0x52, };
>  static int x1830_i2s_clk_rx_pins[] = { 0x56, 0x55, };
>  static int x1830_i2s_sysclk_pins[] = { 0x57, };
> -static int x1830_lcd_rgb_18bit_pins[] = {
> +static int x1830_lcd_tft_8bit_pins[] = {
>  	0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
> -	0x68, 0x69, 0x6c, 0x6d, 0x6e, 0x6f,
> -	0x70, 0x71, 0x72, 0x73, 0x76, 0x77,
> -	0x78, 0x79, 0x7a, 0x7b,
> +	0x68, 0x73, 0x72, 0x69,
> +};
> +static int x1830_lcd_tft_24bit_pins[] = {
> +	0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71,
> +	0x76, 0x77, 0x78, 0x79, 0x7a, 0x7b,
>  };
>  static int x1830_lcd_slcd_8bit_pins[] = {
>  	0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x6c, 0x6d,
> @@ -1564,10 +1576,10 @@ static const struct group_desc x1830_groups[] 
> = {
>  	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx, 0),
>  	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx, 0),
>  	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk, 0),
> -	INGENIC_PIN_GROUP("lcd-rgb-18bit", x1830_lcd_rgb_18bit, 0),
> +	INGENIC_PIN_GROUP("lcd-tft-8bit", x1830_lcd_tft_8bit, 0),
> +	INGENIC_PIN_GROUP("lcd-tft-24bit", x1830_lcd_tft_24bit, 0),
>  	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit, 1),
>  	INGENIC_PIN_GROUP("lcd-slcd-16bit", x1830_lcd_slcd_16bit, 1),
> -	{ "lcd-no-pins", },
>  	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b, 0),
>  	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c, 1),
>  	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b, 0),
> @@ -1610,7 +1622,7 @@ static const char *x1830_i2s_groups[] = {
>  	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", 
> "i2s-sysclk",
>  };
>  static const char *x1830_lcd_groups[] = {
> -	"lcd-rgb-18bit", "lcd-slcd-8bit", "lcd-slcd-16bit", "lcd-no-pins",
> +	"lcd-tft-8bit", "lcd-tft-24bit", "lcd-slcd-8bit", "lcd-slcd-16bit",
>  };
>  static const char *x1830_pwm0_groups[] = { "pwm0-b", "pwm0-c", };
>  static const char *x1830_pwm1_groups[] = { "pwm1-b", "pwm1-c", };
> --
> 2.7.4
> 


