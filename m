Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9B955AA4
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 00:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfFYWJd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 18:09:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfFYWJc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 18:09:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F69B2086D;
        Tue, 25 Jun 2019 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561500571;
        bh=DjE8SaTP77AgEkZGHFhK5X8LouLq12BsaqfzP9ngz/I=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=xGpJopyMf3q67Rl7YXuEaWzZ0N1Egt0JY9+n2cyHwy+U2eF3Vxnv6uxT0Hba3lrml
         j+OIEf0nqYsERNABoWjnruFVTQPaCMBqHLS0rPChGqXgFzfGS7rO5a1WyJqVXSBUAZ
         aCdggekC26v1sq9FyWM7Sj3u5NBlurepRH6FZlk8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190624225759.18299-6-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net> <20190624225759.18299-6-paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Burton <paul.burton@mips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 05/13] clk: ingenic: Add driver for the TCU clocks
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 15:09:30 -0700
Message-Id: <20190625220931.2F69B2086D@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2019-06-24 15:57:51)
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> new file mode 100644
> index 000000000000..6d667c4a2bd5
> --- /dev/null
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU clocks driver
> + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clockchips.h>
> +#include <linux/mfd/ingenic-tcu.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/syscore_ops.h>
> +
> +#include <dt-bindings/clock/ingenic,tcu.h>
> +
[...]
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

Do you need to get the clk by name? Or can that clk be "known" to the
TCU somehow so we can already have a direct clk pointer?

> +               if (IS_ERR(tcu->clk)) {
> +                       ret =3D PTR_ERR(tcu->clk);
> +                       pr_crit("Cannot get TCU clock\n");
> +                       goto err_free_tcu;
> +               }
> +
> +               ret =3D clk_prepare_enable(tcu->clk);
> +               if (ret) {
> +                       pr_crit("Unable to enable TCU clock\n");
> +                       goto err_put_clk;
> +               }
> +       }
> +
> +       tcu->clocks =3D kzalloc(sizeof(*tcu->clocks) +
> +                             sizeof(*tcu->clocks->hws) * TCU_CLK_COUNT,
> +                             GFP_KERNEL);
> +       if (!tcu->clocks) {
> +               ret =3D -ENOMEM;
> +               goto err_clk_disable;
> +       }
> +
> +       tcu->clocks->num =3D TCU_CLK_COUNT;
> +
> +       for (i =3D 0; i < tcu->soc_info->num_channels; i++) {
> +               ret =3D ingenic_tcu_register_clock(tcu, i, TCU_PARENT_EXT,
> +                                                &ingenic_tcu_clk_info[i],
> +                                                tcu->clocks);
> +               if (ret) {
> +                       pr_crit("cannot register clock %i\n", i);
> +                       goto err_unregister_timer_clocks;
> +               }
> +       }
> +
> +       /*
> +        * We set EXT as the default parent clock for all the TCU clocks
> +        * except for the watchdog one, where we set the RTC clock as the
> +        * parent. Since the EXT and PCLK are much faster than the RTC cl=
ock,
> +        * the watchdog would kick after a maximum time of 5s, and we mig=
ht
> +        * want a slower kicking time.
> +        */
> +       ret =3D ingenic_tcu_register_clock(tcu, TCU_CLK_WDT, TCU_PARENT_R=
TC,
> +                                        &ingenic_tcu_watchdog_clk_info,
> +                                        tcu->clocks);
> +       if (ret) {
> +               pr_crit("cannot register watchdog clock\n");
> +               goto err_unregister_timer_clocks;
> +       }
> +
> +       if (tcu->soc_info->has_ost) {
> +               ret =3D ingenic_tcu_register_clock(tcu, TCU_CLK_OST,
> +                                                TCU_PARENT_EXT,
> +                                                &ingenic_tcu_ost_clk_inf=
o,
> +                                                tcu->clocks);
> +               if (ret) {
> +                       pr_crit("cannot register ost clock\n");
> +                       goto err_unregister_watchdog_clock;
> +               }
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, tcu->cl=
ocks);
> +       if (ret) {
> +               pr_crit("cannot add OF clock provider\n");
> +               goto err_unregister_ost_clock;
> +       }
> +
> +       ingenic_tcu =3D tcu;
> +
> +       return 0;
> +
> +err_unregister_ost_clock:
> +       if (tcu->soc_info->has_ost)
> +               clk_hw_unregister(tcu->clocks->hws[i + 1]);
> +err_unregister_watchdog_clock:
> +       clk_hw_unregister(tcu->clocks->hws[i]);
> +err_unregister_timer_clocks:
> +       for (i =3D 0; i < tcu->clocks->num; i++)
> +               if (tcu->clocks->hws[i])
> +                       clk_hw_unregister(tcu->clocks->hws[i]);
> +       kfree(tcu->clocks);
> +err_clk_disable:
> +       if (tcu->soc_info->has_tcu_clk)
> +               clk_disable_unprepare(tcu->clk);
> +err_put_clk:
> +       if (tcu->soc_info->has_tcu_clk)
> +               clk_put(tcu->clk);
> +err_free_tcu:
> +       kfree(tcu);
> +       return ret;

Too bad this isn't a device with devm!

> +}
> +
> +static int __maybe_unused tcu_pm_suspend(void)
> +{
> +       struct ingenic_tcu *tcu =3D ingenic_tcu;
> +
> +       if (tcu->clk)
> +               clk_disable(tcu->clk);

Do you need to unprepare? Or it just isn't possible because this is
called from syscore and thus we can't sleep?

> +
> +       return 0;
> +}
> +
> +static void __maybe_unused tcu_pm_resume(void)
> +{
> +       struct ingenic_tcu *tcu =3D ingenic_tcu;
> +
> +       if (tcu->clk)
> +               clk_enable(tcu->clk);
> +}
> +
> +static struct syscore_ops __maybe_unused tcu_pm_ops =3D {
> +       .suspend =3D tcu_pm_suspend,
> +       .resume =3D tcu_pm_resume,
> +};
> +
> +static void __init ingenic_tcu_init(struct device_node *np)
> +{
> +       int ret =3D ingenic_tcu_probe(np);
> +
> +       if (ret)
> +               pr_crit("Failed to initialize TCU clocks: %i\n", ret);

Should be %d instead of %i? Applies to all this file.

> +
> +       if (IS_ENABLED(CONFIG_PM_SLEEP))
> +               register_syscore_ops(&tcu_pm_ops);
> +}
