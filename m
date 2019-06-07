Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB05397BB
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2019 23:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729899AbfFGV2V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 17:28:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729125AbfFGV2U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Jun 2019 17:28:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5FAE208C3;
        Fri,  7 Jun 2019 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559942899;
        bh=jip5QGGHndv4oXMyz6SmOTMXUdzgvg7wHZcAsNnYwsk=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=NLRns9hhYpyFiwuWPVPT8RsL1h1oLxqUOZ9kl5DQXDdIJl+aQ3gRQ+7ZELX9aXwgx
         GlvXOZskVmq59HnFbF3IDcSL/tymNE67jQtbNXWrgvwphEZ127r1mX/shW3p9nN4O8
         9RCM8WHFjdq61jIrtbBd6lwnyBXKVy0ab0fNgab8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190521145141.9813-6-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net> <20190521145141.9813-6-paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Burton <paul.burton@mips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 05/13] clk: ingenic: Add driver for the TCU clocks
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 14:28:18 -0700
Message-Id: <20190607212819.A5FAE208C3@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2019-05-21 07:51:33)
> diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
> index 34dc0da79c39..434893133eb4 100644
> --- a/drivers/clk/ingenic/Kconfig
> +++ b/drivers/clk/ingenic/Kconfig
> @@ -1,4 +1,4 @@
> -menu "Ingenic JZ47xx CGU drivers"
> +menu "Ingenic JZ47xx drivers"
>         depends on MIPS
> =20
>  config INGENIC_CGU_COMMON
> @@ -44,4 +44,13 @@ config INGENIC_CGU_JZ4780
> =20
>           If building for a JZ4780 SoC, you want to say Y here.
> =20
> +config INGENIC_TCU_CLK
> +       bool "Ingenic JZ47xx TCU clocks driver"
> +       default MACH_INGENIC
> +       depends on COMMON_CLK

Does the INGENIC_TCU_CLK config even exist if COMMON_CLK is disabled? I
suspect it's all part of the menuconfig so this depends is not useful?

> +       select INGENIC_TCU
> +       help
> +         Support the clocks of the Timer/Counter Unit (TCU) of the Ingen=
ic
> +         JZ47xx SoCs.
> +
>  endmenu
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> new file mode 100644
> index 000000000000..7249225a6994
> --- /dev/null
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -0,0 +1,458 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU clocks driver
> + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/clockchips.h>
> +#include <linux/mfd/ingenic-tcu.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/ingenic,tcu.h>
> +
> +/* 8 channels max + watchdog + OST */
> +#define TCU_CLK_COUNT  10
> +
> +#define TCU_ERR(...) pr_crit("ingenic-tcu-clk: " __VA_ARGS__)

Why is it pr_crit instead of pr_err()?

> +
> +enum tcu_clk_parent {
> +       TCU_PARENT_PCLK,
> +       TCU_PARENT_RTC,
> +       TCU_PARENT_EXT,
> +};
> +
[...]
> +
> +static int __init ingenic_tcu_register_clock(struct ingenic_tcu *tcu,
> +                       unsigned int idx, enum tcu_clk_parent parent,
> +                       const struct ingenic_tcu_clk_info *info,
> +                       struct clk_hw_onecell_data *clocks)
> +{
> +       struct ingenic_tcu_clk *tcu_clk;
> +       int err;
> +
> +       tcu_clk =3D kzalloc(sizeof(*tcu_clk), GFP_KERNEL);
> +       if (!tcu_clk)
> +               return -ENOMEM;
> +
> +       tcu_clk->hw.init =3D &info->init_data;
> +       tcu_clk->idx =3D idx;
> +       tcu_clk->info =3D info;
> +       tcu_clk->tcu =3D tcu;
> +
> +       /* Reset channel and clock divider, set default parent */
> +       ingenic_tcu_enable_regs(&tcu_clk->hw);
> +       regmap_update_bits(tcu->map, info->tcsr_reg, 0xffff, BIT(parent));
> +       ingenic_tcu_disable_regs(&tcu_clk->hw);
> +
> +       err =3D clk_hw_register(NULL, &tcu_clk->hw);
> +       if (err)
> +               goto err_free_tcu_clk;
> +
> +       err =3D clk_hw_register_clkdev(&tcu_clk->hw, info->init_data.name=
, NULL);

Do you have a use for clkdev? If DT lookups work just as well it would
be better to skip clkdev registration.

> +       if (err)
> +               goto err_clk_unregister;
> +
> +       clocks->hws[idx] =3D &tcu_clk->hw;
> +
> +       return 0;
> +
> +err_clk_unregister:
> +       clk_hw_unregister(&tcu_clk->hw);
> +err_free_tcu_clk:
> +       kfree(tcu_clk);
> +       return err;
> +}
> +
> +static const struct ingenic_soc_info jz4740_soc_info =3D {
> +       .num_channels =3D 8,
> +       .has_ost =3D false,
> +       .has_tcu_clk =3D true,
> +};
> +
> +static const struct ingenic_soc_info jz4725b_soc_info =3D {
> +       .num_channels =3D 6,
> +       .has_ost =3D true,
> +       .has_tcu_clk =3D true,
> +};
> +
> +static const struct ingenic_soc_info jz4770_soc_info =3D {
> +       .num_channels =3D 8,
> +       .has_ost =3D true,
> +       .has_tcu_clk =3D false,
> +};
> +
> +static const struct of_device_id ingenic_tcu_of_match[] __initconst =3D {
> +       { .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_inf=
o, },
> +       { .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_i=
nfo, },
> +       { .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4770_soc_inf=
o, },
> +       { }
> +};
> +
> +static int __init ingenic_tcu_probe(struct device_node *np)
> +{
> +       const struct of_device_id *id =3D of_match_node(ingenic_tcu_of_ma=
tch, np);
> +       struct ingenic_tcu *tcu;
> +       struct regmap *map;
> +       unsigned int i;
> +       int ret;
> +
> +       map =3D ingenic_tcu_get_regmap(np);
> +       if (IS_ERR(map))
> +               return PTR_ERR(map);
> +
> +       tcu =3D kzalloc(sizeof(*tcu), GFP_KERNEL);
> +       if (!tcu)
> +               return -ENOMEM;
> +
> +       tcu->map =3D map;
> +       tcu->soc_info =3D id->data;
> +
> +       if (tcu->soc_info->has_tcu_clk) {
> +               tcu->clk =3D of_clk_get_by_name(np, "tcu");

Is this clk necessary to read/write registers in this clk driver? And
this clk isn't the parent of the clks? Why is it managed by Linux at
all? Will there be a time when it's turned off?

I'm asking because it looks like we're calling clk APIs from within clk
provider implementation. That works right now because of our locking
scheme, but this will put up another roadblock to making the prepare and
enable locks not recursive. I've seen some drivers take an approach of
enabling the clk when the provider is PM runtime active, and disable the
clk when the provider is runtime PM inactive. This gets it out of the
provider path and into the runtime PM path. If you take that approach
then when we move the runtime PM code in clk core outside of the prepare
lock we should be able to avoid any recursive locking scenarios.

> +               if (IS_ERR(tcu->clk)) {
> +                       ret =3D PTR_ERR(tcu->clk);
> +                       TCU_ERR("Cannot get TCU clock\n");
> +                       goto err_free_tcu;
> +               }
> +
