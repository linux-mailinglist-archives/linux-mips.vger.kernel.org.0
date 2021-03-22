Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439AC344DEE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbhCVR7U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 22 Mar 2021 13:59:20 -0400
Received: from aposti.net ([89.234.176.197]:55844 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231249AbhCVR7C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 13:59:02 -0400
Date:   Mon, 22 Mar 2021 17:58:46 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 02/10] pinctrl: Ingenic: Add support for read the pin
 configuration of X1830.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <YXTDQQ.OYIQVLSUOAPB3@crapouillou.net>
In-Reply-To: <1615975084-68203-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615975084-68203-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 17 mars 2021 à 17:57, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add X1830 support in "ingenic_pinconf_get()", so that it can read the
> configuration of X1830 SoC correctly.
> 
> Fixes: d7da2a1e4e08 ("pinctrl: Ingenic: Add pinctrl driver for 
> X1830.")
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v2:
>     New patch.
> 
>     v2->v3:
>     1.Add fixes tag.
>     2.Adjust the code, simplify the ingenic_pinconf_get() function.
> 
>  drivers/pinctrl/pinctrl-ingenic.c | 38 
> ++++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 05dfa0a..1d43b98 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2109,26 +2109,48 @@ static int ingenic_pinconf_get(struct 
> pinctrl_dev *pctldev,
>  	enum pin_config_param param = pinconf_to_config_param(*config);
>  	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
>  	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
> -	bool pull;
> +	unsigned int bias;
> +	bool pull, pullup, pulldown;
> 
> -	if (jzpc->info->version >= ID_JZ4770)
> -		pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
> -	else
> -		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
> +	if (jzpc->info->version >= ID_X1830) {
> +		unsigned int half = PINS_PER_GPIO_CHIP / 2;
> +		unsigned int idxh = pin % half * 2;

I had to look up operator precedence in C, '*' and '%' have the same 
priority so this reads left-to-right.

I'd suggest adding parentheses around the '%' to make it more obvious.

With that:

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> +
> +		if (idx < half)
> +			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
> +					X1830_GPIO_PEL, &bias);
> +		else
> +			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
> +					X1830_GPIO_PEH, &bias);
> +
> +		bias = (bias >> idxh) & (GPIO_PULL_UP | GPIO_PULL_DOWN);
> +
> +		pullup = (bias == GPIO_PULL_UP) && (jzpc->info->pull_ups[offt] & 
> BIT(idx));
> +		pulldown = (bias == GPIO_PULL_DOWN) && 
> (jzpc->info->pull_downs[offt] & BIT(idx));
> +
> +	} else {
> +		if (jzpc->info->version >= ID_JZ4770)
> +			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
> +		else
> +			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
> +
> +		pullup = pull && (jzpc->info->pull_ups[offt] & BIT(idx));
> +		pulldown = pull && (jzpc->info->pull_downs[offt] & BIT(idx));
> +	}
> 
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> -		if (pull)
> +		if (pullup || pulldown)
>  			return -EINVAL;
>  		break;
> 
>  	case PIN_CONFIG_BIAS_PULL_UP:
> -		if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
> +		if (!pullup)
>  			return -EINVAL;
>  		break;
> 
>  	case PIN_CONFIG_BIAS_PULL_DOWN:
> -		if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
> +		if (!pulldown)
>  			return -EINVAL;
>  		break;
> 
> --
> 2.7.4
> 


