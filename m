Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BC344EAF
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 19:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhCVSkO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 22 Mar 2021 14:40:14 -0400
Received: from aposti.net ([89.234.176.197]:34306 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhCVSj7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 14:39:59 -0400
Date:   Mon, 22 Mar 2021 18:39:42 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 10/10] pinctrl: Ingenic: Add pinctrl driver for X2000.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <6UVDQQ.U3HDKVEJU8JA3@crapouillou.net>
In-Reply-To: <1615975084-68203-11-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615975084-68203-11-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 17 mars 2021 à 17:58, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add support for probing the pinctrl-ingenic driver on the
> X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v3:
>     New patch.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 502 
> +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 493 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index eb4912d..538d1b5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -57,6 +57,10 @@
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
> @@ -94,6 +98,7 @@ enum jz_version {
>  	ID_X1000,
>  	ID_X1500,
>  	ID_X1830,
> +	ID_X2000,
>  };
> 
>  struct ingenic_chip_info {
> @@ -2273,6 +2278,439 @@ static const struct ingenic_chip_info 
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

Your LCD groups shouldn't overlap. See how it's done for the JZ4725B.

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

You should have these groups: lcd-8bit, lcd-16bit, lcd-18bit, 
lcd-24bit, lcd-generic, lcd-special.

Your lcd-slcd-16bit would then be lcd-8bit + lcd-16bit. (non-SLCD 
panels would need lcd-generic as well).

> +	{ "lcd-no-pins", },

Like on the other patches, please drop this.

Cheers,
-Paul

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
> @@ -2355,23 +2793,28 @@ static void irq_set_type(struct 
> ingenic_gpio_chip *jzgc,
>  		u8 offset, unsigned int type)
>  {
>  	u8 reg1, reg2;
> -	bool val1, val2;
> +	bool val1, val2, val3;

val3 = type == IRQ_TYPE_EDGE_BOTH;

then you don't need to initialize val3 on each case of the switch.

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
> @@ -2389,7 +2832,12 @@ static void irq_set_type(struct 
> ingenic_gpio_chip *jzgc,
>  		return;
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
> @@ -2462,7 +2910,8 @@ static void ingenic_gpio_irq_ack(struct 
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
> @@ -2501,7 +2950,7 @@ static int ingenic_gpio_irq_set_type(struct 
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
> @@ -2803,7 +3252,15 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  	unsigned int bias;
>  	bool pull, pullup, pulldown;
> 
> -	if (jzpc->info->version >= ID_X1830) {
> +	if (jzpc->info->version >= ID_X2000) {
> +		pullup = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU) &&
> +				!ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD) &&
> +				(jzpc->info->pull_ups[offt] & BIT(idx));
> +		pulldown = ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPD) &&
> +				!ingenic_get_pin_config(jzpc, pin, X2000_GPIO_PEPU) &&
> +				(jzpc->info->pull_downs[offt] & BIT(idx));
> +
> +	} else if (jzpc->info->version >= ID_X1830) {
>  		unsigned int half = PINS_PER_GPIO_CHIP / 2;
>  		unsigned int idxh = pin % half * 2;
> 
> @@ -2858,7 +3315,25 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
>  		unsigned int pin, unsigned int bias)
>  {
> -	if (jzpc->info->version >= ID_X1830) {
> +	if (jzpc->info->version >= ID_X2000) {
> +		switch (bias) {
> +		case PIN_CONFIG_BIAS_PULL_UP:

Was that even tested? Your "bias" value is one of GPIO_PULL_DIS, 
GPIO_PULL_UP or GPIO_PULL_DOWN, you can't match it against values of 
the pin_config_param enum and expect it to work.

Cheers,
-Paul

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
> @@ -3033,6 +3508,7 @@ static const struct of_device_id 
> ingenic_gpio_of_match[] __initconst = {
>  	{ .compatible = "ingenic,jz4780-gpio", },
>  	{ .compatible = "ingenic,x1000-gpio", },
>  	{ .compatible = "ingenic,x1830-gpio", },
> +	{ .compatible = "ingenic,x2000-gpio", },
>  	{},
>  };
> 
> @@ -3275,6 +3751,14 @@ static const struct of_device_id 
> ingenic_pinctrl_of_match[] = {
>  		.compatible = "ingenic,x1830-pinctrl",
>  		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
>  	},
> +	{
> +		.compatible = "ingenic,x2000-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_X2000, &x2000_chip_info)
> +	},
> +	{
> +		.compatible = "ingenic,x2000e-pinctrl",
> +		.data = IF_ENABLED(CONFIG_MACH_X2000, &x2000_chip_info)
> +	},
>  	{ /* sentinel */ },
>  };
> 
> --
> 2.7.4
> 


