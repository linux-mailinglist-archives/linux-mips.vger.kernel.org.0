Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6BC55B5B
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 00:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFYWhT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 18:37:19 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:55902 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYWhT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 18:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561502235; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5RQu5sOu/4boSwsHqXD21FoMi+cSCsrzN2G5XV33mY4=;
        b=fitadeGmNfgxAAtFibCL4gy+rPEuUwKuXJT/pY9UIg/Uj5c3SxxOEs527Dd2t+R9nUOszE
        ygdENMiB3i7guYlHuRFEmnNTncEpaYEJzQjgcF14bgSFmeQcWRIQn0bV99cmKbFqLFSZYK
        2nDyBDbfoMl1gPQ4pA9xOa3V/Beq9gg=
Date:   Wed, 26 Jun 2019 00:37:07 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 05/13] clk: ingenic: Add driver for the TCU clocks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
Message-Id: <1561502227.10069.1@crapouillou.net>
In-Reply-To: <20190625220931.2F69B2086D@mail.kernel.org>
References: <20190624225759.18299-1-paul@crapouillou.net>
        <20190624225759.18299-6-paul@crapouillou.net>
        <20190625220931.2F69B2086D@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 26 juin 2019 =E0 0:09, Stephen Boyd <sboyd@kernel.org> a =E9crit :
> Quoting Paul Cercueil (2019-06-24 15:57:51)
>>  diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
>>  new file mode 100644
>>  index 000000000000..6d667c4a2bd5
>>  --- /dev/null
>>  +++ b/drivers/clk/ingenic/tcu.c
>>  @@ -0,0 +1,473 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * JZ47xx SoCs TCU clocks driver
>>  + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
>>  + */
>>  +
>>  +#include <linux/clk.h>
>>  +#include <linux/clk-provider.h>
>>  +#include <linux/clockchips.h>
>>  +#include <linux/mfd/ingenic-tcu.h>
>>  +#include <linux/regmap.h>
>>  +#include <linux/slab.h>
>>  +#include <linux/syscore_ops.h>
>>  +
>>  +#include <dt-bindings/clock/ingenic,tcu.h>
>>  +
> [...]
>>  +
>>  +static const struct ingenic_soc_info jz4740_soc_info =3D {
>>  +       .num_channels =3D 8,
>>  +       .has_ost =3D false,
>>  +       .has_tcu_clk =3D true,
>>  +};
>>  +
>>  +static const struct ingenic_soc_info jz4725b_soc_info =3D {
>>  +       .num_channels =3D 6,
>>  +       .has_ost =3D true,
>>  +       .has_tcu_clk =3D true,
>>  +};
>>  +
>>  +static const struct ingenic_soc_info jz4770_soc_info =3D {
>>  +       .num_channels =3D 8,
>>  +       .has_ost =3D true,
>>  +       .has_tcu_clk =3D false,
>>  +};
>>  +
>>  +static const struct of_device_id ingenic_tcu_of_match[]=20
>> __initconst =3D {
>>  +       { .compatible =3D "ingenic,jz4740-tcu", .data =3D=20
>> &jz4740_soc_info, },
>>  +       { .compatible =3D "ingenic,jz4725b-tcu", .data =3D=20
>> &jz4725b_soc_info, },
>>  +       { .compatible =3D "ingenic,jz4770-tcu", .data =3D=20
>> &jz4770_soc_info, },
>>  +       { }
>>  +};
>>  +
>>  +static int __init ingenic_tcu_probe(struct device_node *np)
>>  +{
>>  +       const struct of_device_id *id =3D=20
>> of_match_node(ingenic_tcu_of_match, np);
>>  +       struct ingenic_tcu *tcu;
>>  +       struct regmap *map;
>>  +       unsigned int i;
>>  +       int ret;
>>  +
>>  +       map =3D ingenic_tcu_get_regmap(np);
>>  +       if (IS_ERR(map))
>>  +               return PTR_ERR(map);
>>  +
>>  +       tcu =3D kzalloc(sizeof(*tcu), GFP_KERNEL);
>>  +       if (!tcu)
>>  +               return -ENOMEM;
>>  +
>>  +       tcu->map =3D map;
>>  +       tcu->soc_info =3D id->data;
>>  +
>>  +       if (tcu->soc_info->has_tcu_clk) {
>>  +               tcu->clk =3D of_clk_get_by_name(np, "tcu");
>=20
> Do you need to get the clk by name? Or can that clk be "known" to the
> TCU somehow so we can already have a direct clk pointer?

This clock is provided by a separate driver, so I have to obtain the
clock pointer from devicetree.

>=20
>>  +               if (IS_ERR(tcu->clk)) {
>>  +                       ret =3D PTR_ERR(tcu->clk);
>>  +                       pr_crit("Cannot get TCU clock\n");
>>  +                       goto err_free_tcu;
>>  +               }
>>  +
>>  +               ret =3D clk_prepare_enable(tcu->clk);
>>  +               if (ret) {
>>  +                       pr_crit("Unable to enable TCU clock\n");
>>  +                       goto err_put_clk;
>>  +               }
>>  +       }
>>  +
>>  +       tcu->clocks =3D kzalloc(sizeof(*tcu->clocks) +
>>  +                             sizeof(*tcu->clocks->hws) *=20
>> TCU_CLK_COUNT,
>>  +                             GFP_KERNEL);
>>  +       if (!tcu->clocks) {
>>  +               ret =3D -ENOMEM;
>>  +               goto err_clk_disable;
>>  +       }
>>  +
>>  +       tcu->clocks->num =3D TCU_CLK_COUNT;
>>  +
>>  +       for (i =3D 0; i < tcu->soc_info->num_channels; i++) {
>>  +               ret =3D ingenic_tcu_register_clock(tcu, i,=20
>> TCU_PARENT_EXT,
>>  +                                               =20
>> &ingenic_tcu_clk_info[i],
>>  +                                                tcu->clocks);
>>  +               if (ret) {
>>  +                       pr_crit("cannot register clock %i\n", i);
>>  +                       goto err_unregister_timer_clocks;
>>  +               }
>>  +       }
>>  +
>>  +       /*
>>  +        * We set EXT as the default parent clock for all the TCU=20
>> clocks
>>  +        * except for the watchdog one, where we set the RTC clock=20
>> as the
>>  +        * parent. Since the EXT and PCLK are much faster than the=20
>> RTC clock,
>>  +        * the watchdog would kick after a maximum time of 5s, and=20
>> we might
>>  +        * want a slower kicking time.
>>  +        */
>>  +       ret =3D ingenic_tcu_register_clock(tcu, TCU_CLK_WDT,=20
>> TCU_PARENT_RTC,
>>  +                                       =20
>> &ingenic_tcu_watchdog_clk_info,
>>  +                                        tcu->clocks);
>>  +       if (ret) {
>>  +               pr_crit("cannot register watchdog clock\n");
>>  +               goto err_unregister_timer_clocks;
>>  +       }
>>  +
>>  +       if (tcu->soc_info->has_ost) {
>>  +               ret =3D ingenic_tcu_register_clock(tcu, TCU_CLK_OST,
>>  +                                                TCU_PARENT_EXT,
>>  +                                               =20
>> &ingenic_tcu_ost_clk_info,
>>  +                                                tcu->clocks);
>>  +               if (ret) {
>>  +                       pr_crit("cannot register ost clock\n");
>>  +                       goto err_unregister_watchdog_clock;
>>  +               }
>>  +       }
>>  +
>>  +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get,=20
>> tcu->clocks);
>>  +       if (ret) {
>>  +               pr_crit("cannot add OF clock provider\n");
>>  +               goto err_unregister_ost_clock;
>>  +       }
>>  +
>>  +       ingenic_tcu =3D tcu;
>>  +
>>  +       return 0;
>>  +
>>  +err_unregister_ost_clock:
>>  +       if (tcu->soc_info->has_ost)
>>  +               clk_hw_unregister(tcu->clocks->hws[i + 1]);
>>  +err_unregister_watchdog_clock:
>>  +       clk_hw_unregister(tcu->clocks->hws[i]);
>>  +err_unregister_timer_clocks:
>>  +       for (i =3D 0; i < tcu->clocks->num; i++)
>>  +               if (tcu->clocks->hws[i])
>>  +                       clk_hw_unregister(tcu->clocks->hws[i]);
>>  +       kfree(tcu->clocks);
>>  +err_clk_disable:
>>  +       if (tcu->soc_info->has_tcu_clk)
>>  +               clk_disable_unprepare(tcu->clk);
>>  +err_put_clk:
>>  +       if (tcu->soc_info->has_tcu_clk)
>>  +               clk_put(tcu->clk);
>>  +err_free_tcu:
>>  +       kfree(tcu);
>>  +       return ret;
>=20
> Too bad this isn't a device with devm!
>=20
>>  +}
>>  +
>>  +static int __maybe_unused tcu_pm_suspend(void)
>>  +{
>>  +       struct ingenic_tcu *tcu =3D ingenic_tcu;
>>  +
>>  +       if (tcu->clk)
>>  +               clk_disable(tcu->clk);
>=20
> Do you need to unprepare? Or it just isn't possible because this is
> called from syscore and thus we can't sleep?

I thought that clk_disable() was enough. We don't actually need to
unprepare, do we? And yes, as you pointed out, this call cannot sleep.

>>  +
>>  +       return 0;
>>  +}
>>  +
>>  +static void __maybe_unused tcu_pm_resume(void)
>>  +{
>>  +       struct ingenic_tcu *tcu =3D ingenic_tcu;
>>  +
>>  +       if (tcu->clk)
>>  +               clk_enable(tcu->clk);
>>  +}
>>  +
>>  +static struct syscore_ops __maybe_unused tcu_pm_ops =3D {
>>  +       .suspend =3D tcu_pm_suspend,
>>  +       .resume =3D tcu_pm_resume,
>>  +};
>>  +
>>  +static void __init ingenic_tcu_init(struct device_node *np)
>>  +{
>>  +       int ret =3D ingenic_tcu_probe(np);
>>  +
>>  +       if (ret)
>>  +               pr_crit("Failed to initialize TCU clocks: %i\n",=20
>> ret);
>=20
> Should be %d instead of %i? Applies to all this file.

OK.

Thanks,
-Paul

>>  +
>>  +       if (IS_ENABLED(CONFIG_PM_SLEEP))
>>  +               register_syscore_ops(&tcu_pm_ops);
>>  +}

=

