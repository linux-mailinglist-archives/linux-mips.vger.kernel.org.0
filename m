Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DA84DBBA5
	for <lists+linux-mips@lfdr.de>; Thu, 17 Mar 2022 01:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238765AbiCQA0v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 20:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiCQA0u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 20:26:50 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB684F50;
        Wed, 16 Mar 2022 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647476733; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hjvU2QGpLUfPUtCM8m4TQ07BgX4mPI0C2UUUAlz37Vw=;
        b=ssSLsW7bE6EaS3KkT1zyYnGKSKnsVqcqj4B4+LynPLP7cy2+kIyyR5zRoJVPJHm/gFECYs
        k6NvPOFKpGPySOkR1jsDWYyApExgqJlaQvDuRyxBJympL73+iEWHICdNUD6hlDVJlCV9nZ
        o2upXpHbcUpJ06PjnSiyWjlCGwnN5YE=
Date:   Thu, 17 Mar 2022 00:25:24 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4] pinctrl: ingenic: Fix regmap on X series SoCs
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <C65V8R.D82E1A2ACHCW@crapouillou.net>
In-Reply-To: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
References: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le jeu., mars 17 2022 at 00:07:40 +0000, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> The X series Ingenic SoCs have a shadow GPIO group which is at a=20
> higher
> offset than the other groups, and is used for all GPIO configuration.
> The regmap did not take this offset into account and set max_register
> too low, so the regmap API blocked writes to the shadow group, which
> made the pinctrl driver unable to configure any pins.
>=20
> Fix this by adding regmap access tables to the chip info. The way that
> max_register was computed was also off by one, since max_register is=20
> an
> inclusive bound, not an exclusive bound; this has been fixed.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Fixes: 6626a76ef857 ("pinctrl: ingenic: Add .max_register in=20
regmap_config")
Cc: stable@vger.kernel.org
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> v1 -> v2: use regmap_access_table
> v2 -> v3: compute max_register instead of putting it in chip_info
> v3 -> v4: explain the fix to the max_register calculation
>=20
>  drivers/pinctrl/pinctrl-ingenic.c | 46=20
> ++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 2712f51eb238..fa6becca1788 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -119,6 +119,8 @@ struct ingenic_chip_info {
>  	unsigned int num_functions;
>=20
>  	const u32 *pull_ups, *pull_downs;
> +
> +	const struct regmap_access_table *access_table;
>  };
>=20
>  struct ingenic_pinctrl {
> @@ -2179,6 +2181,17 @@ static const struct function_desc=20
> x1000_functions[] =3D {
>  	{ "mac", x1000_mac_groups, ARRAY_SIZE(x1000_mac_groups), },
>  };
>=20
> +static const struct regmap_range x1000_access_ranges[] =3D {
> +	regmap_reg_range(0x000, 0x400 - 4),
> +	regmap_reg_range(0x700, 0x800 - 4),
> +};
> +
> +/* shared with X1500 */
> +static const struct regmap_access_table x1000_access_table =3D {
> +	.yes_ranges =3D x1000_access_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(x1000_access_ranges),
> +};
> +
>  static const struct ingenic_chip_info x1000_chip_info =3D {
>  	.num_chips =3D 4,
>  	.reg_offset =3D 0x100,
> @@ -2189,6 +2202,7 @@ static const struct ingenic_chip_info=20
> x1000_chip_info =3D {
>  	.num_functions =3D ARRAY_SIZE(x1000_functions),
>  	.pull_ups =3D x1000_pull_ups,
>  	.pull_downs =3D x1000_pull_downs,
> +	.access_table =3D &x1000_access_table,
>  };
>=20
>  static int x1500_uart0_data_pins[] =3D { 0x4a, 0x4b, };
> @@ -2300,6 +2314,7 @@ static const struct ingenic_chip_info=20
> x1500_chip_info =3D {
>  	.num_functions =3D ARRAY_SIZE(x1500_functions),
>  	.pull_ups =3D x1000_pull_ups,
>  	.pull_downs =3D x1000_pull_downs,
> +	.access_table =3D &x1000_access_table,
>  };
>=20
>  static const u32 x1830_pull_ups[4] =3D {
> @@ -2506,6 +2521,16 @@ static const struct function_desc=20
> x1830_functions[] =3D {
>  	{ "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
>  };
>=20
> +static const struct regmap_range x1830_access_ranges[] =3D {
> +	regmap_reg_range(0x0000, 0x4000 - 4),
> +	regmap_reg_range(0x7000, 0x8000 - 4),
> +};
> +
> +static const struct regmap_access_table x1830_access_table =3D {
> +	.yes_ranges =3D x1830_access_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(x1830_access_ranges),
> +};
> +
>  static const struct ingenic_chip_info x1830_chip_info =3D {
>  	.num_chips =3D 4,
>  	.reg_offset =3D 0x1000,
> @@ -2516,6 +2541,7 @@ static const struct ingenic_chip_info=20
> x1830_chip_info =3D {
>  	.num_functions =3D ARRAY_SIZE(x1830_functions),
>  	.pull_ups =3D x1830_pull_ups,
>  	.pull_downs =3D x1830_pull_downs,
> +	.access_table =3D &x1830_access_table,
>  };
>=20
>  static const u32 x2000_pull_ups[5] =3D {
> @@ -2969,6 +2995,17 @@ static const struct function_desc=20
> x2000_functions[] =3D {
>  	{ "otg", x2000_otg_groups, ARRAY_SIZE(x2000_otg_groups), },
>  };
>=20
> +static const struct regmap_range x2000_access_ranges[] =3D {
> +	regmap_reg_range(0x000, 0x500 - 4),
> +	regmap_reg_range(0x700, 0x800 - 4),
> +};
> +
> +/* shared with X2100 */
> +static const struct regmap_access_table x2000_access_table =3D {
> +	.yes_ranges =3D x2000_access_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(x2000_access_ranges),
> +};
> +
>  static const struct ingenic_chip_info x2000_chip_info =3D {
>  	.num_chips =3D 5,
>  	.reg_offset =3D 0x100,
> @@ -2979,6 +3016,7 @@ static const struct ingenic_chip_info=20
> x2000_chip_info =3D {
>  	.num_functions =3D ARRAY_SIZE(x2000_functions),
>  	.pull_ups =3D x2000_pull_ups,
>  	.pull_downs =3D x2000_pull_downs,
> +	.access_table =3D &x2000_access_table,
>  };
>=20
>  static const u32 x2100_pull_ups[5] =3D {
> @@ -3189,6 +3227,7 @@ static const struct ingenic_chip_info=20
> x2100_chip_info =3D {
>  	.num_functions =3D ARRAY_SIZE(x2100_functions),
>  	.pull_ups =3D x2100_pull_ups,
>  	.pull_downs =3D x2100_pull_downs,
> +	.access_table =3D &x2000_access_table,
>  };
>=20
>  static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8=20
> reg)
> @@ -4168,7 +4207,12 @@ static int __init ingenic_pinctrl_probe(struct=20
> platform_device *pdev)
>  		return PTR_ERR(base);
>=20
>  	regmap_config =3D ingenic_pinctrl_regmap_config;
> -	regmap_config.max_register =3D chip_info->num_chips *=20
> chip_info->reg_offset;
> +	if (chip_info->access_table) {
> +		regmap_config.rd_table =3D chip_info->access_table;
> +		regmap_config.wr_table =3D chip_info->access_table;
> +	} else {
> +		regmap_config.max_register =3D chip_info->num_chips *=20
> chip_info->reg_offset - 4;
> +	}
>=20
>  	jzpc->map =3D devm_regmap_init_mmio(dev, base, &regmap_config);
>  	if (IS_ERR(jzpc->map)) {
> --
> 2.34.1
>=20


