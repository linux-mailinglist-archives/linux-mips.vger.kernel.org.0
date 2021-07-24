Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D463D4566
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhGXGD1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 02:03:27 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:53017 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhGXGD1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 02:03:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1077663|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00401955-0.000870033-0.99511;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.KpjZ-cN_1627109037;
Received: from 192.168.88.130(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpjZ-cN_1627109037)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 14:43:58 +0800
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add .max_register in regmap_config
To:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210717174836.14776-1-paul@crapouillou.net>
 <20210717174836.14776-3-paul@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <ebae8ead-d7c4-071b-7415-d83f2db9f9cc@wanyeetech.com>
Date:   Sat, 24 Jul 2021 14:43:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210717174836.14776-3-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2021/7/18 上午1:48, Paul Cercueil wrote:
> Compute the max register from the GPIO chip offset and number of GPIO
> chips.
>
> This permits to read all registers from debugfs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/pinctrl/pinctrl-ingenic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)


Tested-by: 周琰杰 (Zhou Yanjie)<zhouyanjie@wanyeetech.com>


> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
> index 263498be8e31..2bbcb8063a16 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3759,6 +3759,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
>   	void __iomem *base;
>   	const struct ingenic_chip_info *chip_info;
>   	struct device_node *node;
> +	struct regmap_config regmap_config;
>   	unsigned int i;
>   	int err;
>   
> @@ -3776,8 +3777,10 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	jzpc->map = devm_regmap_init_mmio(dev, base,
> -			&ingenic_pinctrl_regmap_config);
> +	regmap_config = ingenic_pinctrl_regmap_config;
> +	regmap_config.max_register = chip_info->num_chips * chip_info->reg_offset;
> +
> +	jzpc->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>   	if (IS_ERR(jzpc->map)) {
>   		dev_err(dev, "Failed to create regmap\n");
>   		return PTR_ERR(jzpc->map);
