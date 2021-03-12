Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771DC338EEA
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 14:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhCLNeZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 12 Mar 2021 08:34:25 -0500
Received: from aposti.net ([89.234.176.197]:43602 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231252AbhCLNeC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 08:34:02 -0500
Date:   Fri, 12 Mar 2021 13:33:49 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/6] pinctrl: Ingenic: Reformat the code.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <D0ZUPQ.4DV5ZD2DP7S2@crapouillou.net>
In-Reply-To: <1615476112-113101-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615476112-113101-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 11 mars 2021 à 23:21, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> 1.Move the "INGENIC_PIN_GROUP_FUNCS" to the macro definition section.
> 2.Add tabs before values to align the code in the macro definition 
> section.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 71 
> +++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 607ba0b..ac5ad8a 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -26,37 +26,48 @@
>  #include "pinconf.h"
>  #include "pinmux.h"
> 
> -#define GPIO_PIN	0x00
> -#define GPIO_MSK	0x20
> +#define GPIO_PIN					0x00
> +#define GPIO_MSK					0x20
> 
> -#define JZ4740_GPIO_DATA	0x10
> -#define JZ4740_GPIO_PULL_DIS	0x30
> -#define JZ4740_GPIO_FUNC	0x40
> -#define JZ4740_GPIO_SELECT	0x50
> -#define JZ4740_GPIO_DIR		0x60
> -#define JZ4740_GPIO_TRIG	0x70
> -#define JZ4740_GPIO_FLAG	0x80
> +#define JZ4740_GPIO_DATA			0x10
> +#define JZ4740_GPIO_PULL_DIS		0x30
> +#define JZ4740_GPIO_FUNC			0x40
> +#define JZ4740_GPIO_SELECT			0x50
> +#define JZ4740_GPIO_DIR				0x60
> +#define JZ4740_GPIO_TRIG			0x70
> +#define JZ4740_GPIO_FLAG			0x80
> 
> -#define JZ4770_GPIO_INT		0x10
> -#define JZ4770_GPIO_PAT1	0x30
> -#define JZ4770_GPIO_PAT0	0x40
> -#define JZ4770_GPIO_FLAG	0x50
> -#define JZ4770_GPIO_PEN		0x70
> +#define JZ4770_GPIO_INT				0x10
> +#define JZ4770_GPIO_PAT1			0x30
> +#define JZ4770_GPIO_PAT0			0x40
> +#define JZ4770_GPIO_FLAG			0x50
> +#define JZ4770_GPIO_PEN				0x70
> 
> -#define X1830_GPIO_PEL			0x110
> -#define X1830_GPIO_PEH			0x120
> +#define X1830_GPIO_PEL				0x110
> +#define X1830_GPIO_PEH				0x120
> 
> -#define REG_SET(x) ((x) + 0x4)
> -#define REG_CLEAR(x) ((x) + 0x8)
> +#define REG_SET(x)					((x) + 0x4)
> +#define REG_CLEAR(x)				((x) + 0x8)
> 
> -#define REG_PZ_BASE(x) ((x) * 7)
> -#define REG_PZ_GID2LD(x) ((x) * 7 + 0xf0)
> +#define REG_PZ_BASE(x)				((x) * 7)
> +#define REG_PZ_GID2LD(x)			((x) * 7 + 0xf0)
> 
> -#define GPIO_PULL_DIS	0
> -#define GPIO_PULL_UP	1
> -#define GPIO_PULL_DOWN	2
> +#define GPIO_PULL_DIS				0
> +#define GPIO_PULL_UP				1
> +#define GPIO_PULL_DOWN				2
> 
> -#define PINS_PER_GPIO_CHIP 32
> +#define PINS_PER_GPIO_CHIP			32
> +
> +#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
> +	{						\
> +		name,					\
> +		id##_pins,				\
> +		ARRAY_SIZE(id##_pins),			\
> +		funcs,					\
> +	}
> +
> +#define INGENIC_PIN_GROUP(name, id, func)		\
> +	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> 
>  enum jz_version {
>  	ID_JZ4740,
> @@ -134,18 +145,6 @@ static int jz4740_pwm_pwm5_pins[] = { 0x7c, };
>  static int jz4740_pwm_pwm6_pins[] = { 0x7e, };
>  static int jz4740_pwm_pwm7_pins[] = { 0x7f, };
> 
> -
> -#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
> -	{						\
> -		name,					\
> -		id##_pins,				\
> -		ARRAY_SIZE(id##_pins),			\
> -		funcs,					\
> -	}
> -
> -#define INGENIC_PIN_GROUP(name, id, func)		\
> -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> -
>  static const struct group_desc jz4740_groups[] = {
>  	INGENIC_PIN_GROUP("mmc-1bit", jz4740_mmc_1bit, 0),
>  	INGENIC_PIN_GROUP("mmc-4bit", jz4740_mmc_4bit, 0),
> --
> 2.7.4
> 


