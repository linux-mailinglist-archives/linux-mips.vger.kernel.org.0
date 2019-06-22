Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B664F686
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2019 17:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfFVP2X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Jun 2019 11:28:23 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34006 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfFVP2X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Jun 2019 11:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561217298; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ACGGnzlsApw7HxowwujP0MYj1mucATMy5y2Qaqlcwk=;
        b=DhWj6W1j278TimWOuQNVWeEvPyR8/gXCI/8EZhJwTZikXLbqwVyEVtyyS3UfHc5wZ7r958
        9zgHHAnThzJAhLUbaWrdU/0J7vN0T+1pMednh/Gk4YRLUuQU/aUXFl0J+cHjXjM8ysSlyJ
        5tAHciCQce0R91TZKJXWKzg3xkClXJE=
Date:   Sat, 22 Jun 2019 14:23:17 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 07/13] clocksource: Add a new timer-ingenic driver
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
Message-Id: <1561206197.1777.4@crapouillou.net>
In-Reply-To: <20190521145141.9813-8-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-8-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I'll make a V13 of this patchset on top of -rc6, any feedback
for this clocksource driver? It's been already one month.

Thanks,
-Paul



Le mar. 21 mai 2019 =E0 16:51, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> This driver handles the TCU (Timer Counter Unit) present on the=20
> Ingenic
> JZ47xx SoCs, and provides the kernel with a system timer, a=20
> clocksource
> and a sched_clock.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     v2: Use SPDX identifier for the license
>=20
>     v3: - Move documentation to its own patch
>     	- Search the devicetree for PWM clients, and use all the TCU
>     	  channels that won't be used for PWM
>=20
>     v4: - Add documentation about why we search for PWM clients
>     	- Verify that the PWM clients are for the TCU PWM driver
>=20
>     v5: Major overhaul. Too many changes to list. Consider it's a new
>     	patch.
>=20
>     v6: - Add two API functions ingenic_tcu_request_channel and
>     	  ingenic_tcu_release_channel. To be used by the PWM driver to
>     	  request the use of a TCU channel. The driver will now=20
> dynamically
>     	  move away the system timer or clocksource to a new TCU channel.
>     	- The system timer now defaults to channel 0, the clocksource now
>     	  defaults to channel 1 and is no more optional. The
>     	  ingenic,timer-channel and ingenic,clocksource-channel=20
> devicetree
>     	  properties are now gone.
>     	- Fix round_rate / set_rate not calculating the prescale divider
>     	  the same way. This caused problems when (parent_rate / div)=20
> would
>     	  give a non-integer result. The behaviour is correct now.
>     	- The clocksource clock is turned off on suspend now.
>=20
>     v7: Fix section mismatch by using builtin_platform_driver_probe()
>=20
>     v8: - Removed ingenic_tcu_[request,release]_channel, and the=20
> mechanism
>     	  to dynamically change the TCU channel of the system timer or
>     	  the clocksource.
>     	- The driver's devicetree node can now have two more children
>     	  nodes, that correspond to the system timer and clocksource.
>     	  For these two, the driver will use the TCU timer that
>     	  correspond to the memory resource supplied in their
>     	  respective node.
>=20
>     v9: - Removed support for clocksource / timer children devicetree
>     	  nodes. Now, we use a property "ingenic,pwm-channels-mask" to
>     	  know which PWM channels are reserved for PWM use and should
>     	  not be used as OS timers.
>=20
>     v10: - Use CLK_SET_RATE_UNGATE instead of CLK_SET_RATE_GATE +=20
> manually
>     	   un-gating the clock before changing rate. Same for=20
> re-parenting.
>     	 - Unconditionally create the clocksource and sched_clock even if
>     	   the SoC possesses a OS Timer. That gives the choice back to=20
> the
>     	   user which clocksource should be selected.
>     	 - Use subsys_initcall() instead of=20
> builtin_platform_driver_probe().
>     	   The OS Timer driver calls builtin_platform_driver_probe, which
>     	   requires the device to be created before that.
>     	 - Cosmetic cleanups
>=20
>     v11: - Change prototype of exported function
>     	   ingenic_tcu_pwm_can_use_chn(), use a struct device * as first
>     	   argument.
>     	 - Read clocksource using the regmap instead of bypassing it.
>     	   Bypassing the regmap makes sense only for the sched_clock=20
> where
>     	   the read operation must be as fast as possible.
>     	 - Fix incorrect format in pr_crit() macro
>=20
>     v12: - Clock handling and IRQ handling are gone, and are now=20
> handled
>     	   in their own driver.
>     	 - Obtain regmap from the ingenic-tcu MFD driver. As a result, we
>     	   cannot bypass the regmap anymore for the sched_clock.
>=20
>  drivers/clocksource/Kconfig         |  11 +
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/ingenic-timer.c | 357=20
> ++++++++++++++++++++++++++++
>  3 files changed, 369 insertions(+)
>  create mode 100644 drivers/clocksource/ingenic-timer.c
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 6bcaa4e2e72c..bb5d5c044341 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -672,4 +672,15 @@ config MILBEAUT_TIMER
>  	help
>  	  Enables the support for Milbeaut timer driver.
>=20
> +config INGENIC_TIMER
> +	bool "Clocksource/timer using the TCU in Ingenic JZ SoCs"
> +	default MACH_INGENIC
> +	depends on MIPS || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select INGENIC_TCU
> +	select TIMER_OF
> +	select IRQ_DOMAIN
> +	help
> +	  Support for the timer/counter unit of the Ingenic JZ SoCs.
> +
>  endmenu
> diff --git a/drivers/clocksource/Makefile=20
> b/drivers/clocksource/Makefile
> index 236858fa7fbf..553f3c61717a 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_ASM9260_TIMER)		+=3D asm9260_timer.o
>  obj-$(CONFIG_H8300_TMR8)		+=3D h8300_timer8.o
>  obj-$(CONFIG_H8300_TMR16)		+=3D h8300_timer16.o
>  obj-$(CONFIG_H8300_TPU)			+=3D h8300_tpu.o
> +obj-$(CONFIG_INGENIC_TIMER)		+=3D ingenic-timer.o
>  obj-$(CONFIG_CLKSRC_ST_LPC)		+=3D clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)		+=3D numachip.o
>  obj-$(CONFIG_ATCPIT100_TIMER)		+=3D timer-atcpit100.o
> diff --git a/drivers/clocksource/ingenic-timer.c=20
> b/drivers/clocksource/ingenic-timer.c
> new file mode 100644
> index 000000000000..9f4df64390f4
> --- /dev/null
> +++ b/drivers/clocksource/ingenic-timer.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU IRQ driver
> + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/ingenic-tcu.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sched_clock.h>
> +
> +#include <dt-bindings/clock/ingenic,tcu.h>
> +
> +struct ingenic_soc_info {
> +	unsigned int num_channels;
> +};
> +
> +struct ingenic_tcu {
> +	struct regmap *map;
> +	struct clk *timer_clk, *cs_clk;
> +
> +	unsigned int timer_channel, cs_channel;
> +	struct clock_event_device cevt;
> +	struct clocksource cs;
> +	char name[4];
> +
> +	unsigned long pwm_channels_mask;
> +};
> +
> +static struct ingenic_tcu *ingenic_tcu;
> +
> +static u64 notrace ingenic_tcu_timer_read(void)
> +{
> +	struct ingenic_tcu *tcu =3D ingenic_tcu;
> +	unsigned int count;
> +
> +	regmap_read(tcu->map, TCU_REG_TCNTc(tcu->cs_channel), &count);
> +
> +	return count;
> +}
> +
> +static u64 notrace ingenic_tcu_timer_cs_read(struct clocksource *cs)
> +{
> +	return ingenic_tcu_timer_read();
> +}
> +
> +static inline struct ingenic_tcu *to_ingenic_tcu(struct=20
> clock_event_device *evt)
> +{
> +	return container_of(evt, struct ingenic_tcu, cevt);
> +}
> +
> +static int ingenic_tcu_cevt_set_state_shutdown(struct=20
> clock_event_device *evt)
> +{
> +	struct ingenic_tcu *tcu =3D to_ingenic_tcu(evt);
> +
> +	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
> +
> +	return 0;
> +}
> +
> +static int ingenic_tcu_cevt_set_next(unsigned long next,
> +				     struct clock_event_device *evt)
> +{
> +	struct ingenic_tcu *tcu =3D to_ingenic_tcu(evt);
> +
> +	if (next > 0xffff)
> +		return -EINVAL;
> +
> +	regmap_write(tcu->map, TCU_REG_TDFRc(tcu->timer_channel), next);
> +	regmap_write(tcu->map, TCU_REG_TCNTc(tcu->timer_channel), 0);
> +	regmap_write(tcu->map, TCU_REG_TESR, BIT(tcu->timer_channel));
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt =3D dev_id;
> +	struct ingenic_tcu *tcu =3D to_ingenic_tcu(evt);
> +
> +	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
> +
> +	if (evt->event_handler)
> +		evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct clk * __init ingenic_tcu_get_clock(struct device_node=20
> *np, int id)
> +{
> +	struct of_phandle_args args;
> +
> +	args.np =3D np;
> +	args.args_count =3D 1;
> +	args.args[0] =3D id;
> +
> +	return of_clk_get_from_provider(&args);
> +}
> +
> +static int __init ingenic_tcu_timer_init(struct device_node *np,
> +					 struct ingenic_tcu *tcu)
> +{
> +	unsigned int timer_virq, channel =3D tcu->timer_channel;
> +	struct irq_domain *domain;
> +	unsigned long rate;
> +	int err;
> +
> +	tcu->timer_clk =3D ingenic_tcu_get_clock(np, channel);
> +	if (IS_ERR(tcu->timer_clk))
> +		return PTR_ERR(tcu->timer_clk);
> +
> +	err =3D clk_prepare_enable(tcu->timer_clk);
> +	if (err)
> +		goto err_clk_put;
> +
> +	rate =3D clk_get_rate(tcu->timer_clk);
> +	if (!rate) {
> +		err =3D -EINVAL;
> +		goto err_clk_disable;
> +	}
> +
> +	domain =3D irq_find_host(np);
> +	if (!domain) {
> +		err =3D -ENODEV;
> +		goto err_clk_disable;
> +	}
> +
> +	timer_virq =3D irq_create_mapping(domain, channel);
> +	if (!timer_virq) {
> +		err =3D -EINVAL;
> +		goto err_clk_disable;
> +	}
> +
> +	snprintf(tcu->name, sizeof(tcu->name), "TCU");
> +
> +	err =3D request_irq(timer_virq, ingenic_tcu_cevt_cb, IRQF_TIMER,
> +			  tcu->name, &tcu->cevt);
> +	if (err)
> +		goto err_irq_dispose_mapping;
> +
> +	tcu->cevt.cpumask =3D cpumask_of(smp_processor_id());
> +	tcu->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
> +	tcu->cevt.name =3D tcu->name;
> +	tcu->cevt.rating =3D 200;
> +	tcu->cevt.set_state_shutdown =3D ingenic_tcu_cevt_set_state_shutdown;
> +	tcu->cevt.set_next_event =3D ingenic_tcu_cevt_set_next;
> +
> +	clockevents_config_and_register(&tcu->cevt, rate, 10, 0xffff);
> +
> +	return 0;
> +
> +err_irq_dispose_mapping:
> +	irq_dispose_mapping(timer_virq);
> +err_clk_disable:
> +	clk_disable_unprepare(tcu->timer_clk);
> +err_clk_put:
> +	clk_put(tcu->timer_clk);
> +	return err;
> +}
> +
> +static int __init ingenic_tcu_clocksource_init(struct device_node=20
> *np,
> +					       struct ingenic_tcu *tcu)
> +{
> +	unsigned int channel =3D tcu->cs_channel;
> +	struct clocksource *cs =3D &tcu->cs;
> +	unsigned long rate;
> +	int err;
> +
> +	tcu->cs_clk =3D ingenic_tcu_get_clock(np, channel);
> +	if (IS_ERR(tcu->cs_clk))
> +		return PTR_ERR(tcu->cs_clk);
> +
> +	err =3D clk_prepare_enable(tcu->cs_clk);
> +	if (err)
> +		goto err_clk_put;
> +
> +	rate =3D clk_get_rate(tcu->cs_clk);
> +	if (!rate) {
> +		err =3D -EINVAL;
> +		goto err_clk_disable;
> +	}
> +
> +	/* Reset channel */
> +	regmap_update_bits(tcu->map, TCU_REG_TCSRc(channel),
> +			   0xffff & ~TCU_TCSR_RESERVED_BITS, 0);
> +
> +	/* Reset counter */
> +	regmap_write(tcu->map, TCU_REG_TDFRc(channel), 0xffff);
> +	regmap_write(tcu->map, TCU_REG_TCNTc(channel), 0);
> +
> +	/* Enable channel */
> +	regmap_write(tcu->map, TCU_REG_TESR, BIT(channel));
> +
> +	cs->name =3D "ingenic-timer";
> +	cs->rating =3D 200;
> +	cs->flags =3D CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->mask =3D CLOCKSOURCE_MASK(16);
> +	cs->read =3D ingenic_tcu_timer_cs_read;
> +
> +	err =3D clocksource_register_hz(cs, rate);
> +	if (err)
> +		goto err_clk_disable;
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(tcu->cs_clk);
> +err_clk_put:
> +	clk_put(tcu->cs_clk);
> +	return err;
> +}
> +
> +static const struct ingenic_soc_info jz4740_soc_info =3D {
> +	.num_channels =3D 8,
> +};
> +
> +static const struct ingenic_soc_info jz4725b_soc_info =3D {
> +	.num_channels =3D 6,
> +};
> +
> +static const struct of_device_id ingenic_tcu_of_match[] =3D {
> +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, },
> +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info, }=
,
> +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, },
> +	{ }
> +};
> +
> +static int __init ingenic_tcu_init(struct device_node *np)
> +{
> +	const struct of_device_id *id =3D of_match_node(ingenic_tcu_of_match,=20
> np);
> +	const struct ingenic_soc_info *soc_info =3D id->data;
> +	struct ingenic_tcu *tcu;
> +	struct regmap *map;
> +	long rate;
> +	int ret;
> +
> +	of_node_clear_flag(np, OF_POPULATED);
> +
> +	map =3D ingenic_tcu_get_regmap(np);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	tcu =3D kzalloc(sizeof(*tcu), GFP_KERNEL);
> +	if (!tcu)
> +		return -ENOMEM;
> +
> +	/* Enable all TCU channels for PWM use by default except channels=20
> 0/1 */
> +	tcu->pwm_channels_mask =3D GENMASK(soc_info->num_channels - 1, 2);
> +	of_property_read_u32(np, "ingenic,pwm-channels-mask",
> +			     (u32 *)&tcu->pwm_channels_mask);
> +
> +	/* Verify that we have at least two free channels */
> +	if (hweight8(tcu->pwm_channels_mask) > soc_info->num_channels - 2) {
> +		pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
> +			tcu->pwm_channels_mask);
> +		ret =3D -EINVAL;
> +		goto err_free_ingenic_tcu;
> +	}
> +
> +	tcu->map =3D map;
> +	ingenic_tcu =3D tcu;
> +
> +	tcu->timer_channel =3D find_first_zero_bit(&tcu->pwm_channels_mask,
> +						 soc_info->num_channels);
> +	tcu->cs_channel =3D find_next_zero_bit(&tcu->pwm_channels_mask,
> +					     soc_info->num_channels,
> +					     tcu->timer_channel + 1);
> +
> +	ret =3D ingenic_tcu_clocksource_init(np, tcu);
> +	if (ret) {
> +		pr_crit("%s: Unable to init clocksource: %i\n", __func__, ret);
> +		goto err_free_ingenic_tcu;
> +	}
> +
> +	ret =3D ingenic_tcu_timer_init(np, tcu);
> +	if (ret)
> +		goto err_tcu_clocksource_cleanup;
> +
> +	/* Register the sched_clock at the end as there's no way to undo it=20
> */
> +	rate =3D clk_get_rate(tcu->cs_clk);
> +	sched_clock_register(ingenic_tcu_timer_read, 16, rate);
> +
> +	return 0;
> +
> +err_tcu_clocksource_cleanup:
> +	clocksource_unregister(&tcu->cs);
> +	clk_disable_unprepare(tcu->cs_clk);
> +	clk_put(tcu->cs_clk);
> +err_free_ingenic_tcu:
> +	kfree(tcu);
> +	return ret;
> +}
> +
> +TIMER_OF_DECLARE(jz4740_tcu_intc,  "ingenic,jz4740-tcu", =20
> ingenic_tcu_init);
> +TIMER_OF_DECLARE(jz4725b_tcu_intc, "ingenic,jz4725b-tcu",=20
> ingenic_tcu_init);
> +TIMER_OF_DECLARE(jz4770_tcu_intc,  "ingenic,jz4770-tcu", =20
> ingenic_tcu_init);
> +
> +
> +static int __init ingenic_tcu_probe(struct platform_device *pdev)
> +{
> +	platform_set_drvdata(pdev, ingenic_tcu);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ingenic_tcu_suspend(struct device *dev)
> +{
> +	struct ingenic_tcu *tcu =3D dev_get_drvdata(dev);
> +
> +	clk_disable(tcu->cs_clk);
> +	clk_disable(tcu->timer_clk);
> +	return 0;
> +}
> +
> +static int __maybe_unused ingenic_tcu_resume(struct device *dev)
> +{
> +	struct ingenic_tcu *tcu =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_enable(tcu->timer_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_enable(tcu->cs_clk);
> +	if (ret) {
> +		clk_disable(tcu->timer_clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops __maybe_unused ingenic_tcu_pm_ops =3D {
> +	/* _noirq: We want the TCU clocks to be gated last / ungated first=20
> */
> +	.suspend_noirq =3D ingenic_tcu_suspend,
> +	.resume_noirq  =3D ingenic_tcu_resume,
> +};
> +
> +static struct platform_driver ingenic_tcu_driver =3D {
> +	.driver =3D {
> +		.name	=3D "ingenic-tcu-timer",
> +#ifdef CONFIG_PM_SLEEP
> +		.pm	=3D &ingenic_tcu_pm_ops,
> +#endif
> +		.of_match_table =3D ingenic_tcu_of_match,
> +	},
> +};
> +builtin_platform_driver_probe(ingenic_tcu_driver, ingenic_tcu_probe);
> --
> 2.21.0.593.g511ec345e18
>=20

=

