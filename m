Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971AE1D9E16
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 19:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgESRnR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 13:43:17 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49024 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESRnR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 13:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589910193; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VJFxo1CdCVMqZU/7ZWRivkYE1YaOfXwFzW9qm2gUT1I=;
        b=OsJWfHLKrPQIoalRg1GVK4c1p4hsO5EoqVYwUwf+CdkD3VbRn/ZeVz5uJK8eSium7iRpfN
        PuH2pUGVtWhImdZY7ihniegWQKuMBK2b1mJN4tKYIRCfjgwyXgoAuWtbGcPNOGBM6FwV/4
        5MOClxhIg0OThq+caDR77ieauZP/ezo=
Date:   Tue, 19 May 2020 19:42:59 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 3/6] clocksource: Ingenic: Add high resolution timer
 support for SMP.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        tglx@linutronix.de, robh+dt@kernel.org, daniel.lezcano@linaro.org,
        keescook@chromium.org, krzk@kernel.org, hns@goldelico.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <NJALAQ.6WQ9ZK8PVMI43@crapouillou.net>
In-Reply-To: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589898923-60048-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar. 19 mai 2020 =C3=A0 22:35, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=
=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Enable clock event handling on per CPU core basis.
> Make sure that interrupts raised on the first core execute
> event handlers on the correct CPU core.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     1.Adjust function naming to make it more reasonable.
>     2.Replace function smp_call_function_single() with
>       smp_call_function_single_async() in order to resolve
>       the warning below:
>=20
>     [    0.350942] smp: Brought up 1 node, 2 CPUs
>     [    0.365497] ------------[ cut here ]------------
>     [    0.365522] WARNING: CPU: 0 PID: 1 at kernel/smp.c:300=20
> smp_call_function_single+0x110/0x200
>     [    0.365533] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=20
> 5.5.0-rc1+ #5
>     [    0.365537] Stack : 00000000 59c73bcd 00000037 80074e80=20
> 80000000 80670000 805a0000 80620590
>     [    0.365557]         8065ce38 8fc0dc8c 806d0000 00000000=20
> 80670000 00000001 8fc0dc20 59c73bcd
>     [    0.365574]         00000000 00000000 806f0000 80670000=20
> 00000000 806dab00 00000000 2d302e35
>     [    0.365591]         203a6d6d 806e0000 806e0000 70617773=20
> 80670000 00000000 00000000 00000009
>     [    0.365610]         00000000 8fc94e20 8fc0de30 80690000=20
> 00000018 803592dc 00000000 806d0000
>     [    0.365627]         ...
>     [    0.365634] Call Trace:
>     [    0.365647] [<8001b9a0>] show_stack+0x6c/0x12c
>     [    0.365663] [<804aed20>] dump_stack+0x98/0xc8
>     [    0.365673] [<8003044c>] __warn+0xc4/0xe8
>     [    0.365682] [<800304f4>] warn_slowpath_fmt+0x84/0xb8
>     [    0.365690] [<800a886c>] smp_call_function_single+0x110/0x200
>     [    0.365703] ---[ end trace 5785856ca39c79d5 ]---
>     [    0.365557]         8065ce38 8fc0dc8c 806d0000 00000000=20
> 80670000 00000001 8fc0dc20 59c73bcd
>     [    0.365574]         00000000 00000000 806f0000 80670000=20
> 00000000 806dab00 00000000 2d302e35
>     [    0.365591]         203a6d6d 806e0000 806e0000 70617773=20
> 80670000 00000000 00000000 00000009
>     [    0.365610]         00000000 8fc94e20 8fc0de30 80690000=20
> 00000018 803592dc 00000000 806d0000
>     [    0.365627]         ...
>     [    0.365634] Call Trace:
>     [    0.365647] [<8001b9a0>] show_stack+0x6c/0x12c
>     [    0.365663] [<804aed20>] dump_stack+0x98/0xc8
>     [    0.365673] [<8003044c>] __warn+0xc4/0xe8
>     [    0.365682] [<800304f4>] warn_slowpath_fmt+0x84/0xb8
>     [    0.365690] [<800a886c>] smp_call_function_single+0x110/0x200
>     [    0.365703] ---[ end trace 5785856ca39c79d5 ]---
>=20
>     v2->v3:
>     No Change.
>=20
>     v3->v4:
>     Rebase on top of kernel 5.6-rc1.
>=20
>     v4->v5:
>     Move the check for (evt->event_handler) from=20
> "ingenic_per_cpu_event_handler"
>     to "ingenic_tcu_cevt_cb".
>=20
>     v5->v6:
>     No change.
>=20
>     v6->v7:
>     Remove unnecessary check for "NR_CPUS > 1".
>=20
>     v7->v8:
>     Use "num_possible_cpus()" instead "NR_CPUS".
>     Reported-by: kbuild test robot <lkp@intel.com>
>=20
>  drivers/clocksource/ingenic-timer.c | 103=20
> ++++++++++++++++++++++++++++--------
>  1 file changed, 82 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/clocksource/ingenic-timer.c=20
> b/drivers/clocksource/ingenic-timer.c
> index 4963336..230e996 100644
> --- a/drivers/clocksource/ingenic-timer.c
> +++ b/drivers/clocksource/ingenic-timer.c
> @@ -1,7 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * JZ47xx SoCs TCU IRQ driver
> + * XBurst SoCs TCU IRQ driver

If you want to get rid of the JZ47xx, then just write 'Ingenic SoCs TCU=20
IRQ driver', since XBurst is only the name of the CPU. Also, this=20
belongs to a separate patch.

>   * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + * Copyright (C) 2020 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
> <zhouyanjie@wanyeetech.com>
>   */
>=20
>  #include <linux/bitops.h>
> @@ -21,18 +22,23 @@
>=20
>  #include <dt-bindings/clock/ingenic,tcu.h>
>=20
> +static DEFINE_PER_CPU(call_single_data_t, ingenic_cevt_csd);
> +
>  struct ingenic_soc_info {
>  	unsigned int num_channels;
>  };
>=20
>  struct ingenic_tcu {
>  	struct regmap *map;
> +	struct device_node *np;
>  	struct clk *timer_clk, *cs_clk;
> +	unsigned int timer_local[NR_CPUS];

NR_CPUS can be very big, so this would make the struct ingenic_tcu very=20
large. What you could do, is have a variable array at the end of the=20
struct:

unsigned int timer_local[];

Then you can create the ingenic_tcu struct using struct_size() from=20
<linux/overflow.h>:

tcu =3D kzalloc(struct_size(tcu, timer_local, num_possible_cpus()),=20
GFP_KERNEL);

-Paul

>  	unsigned int timer_channel, cs_channel;
>  	struct clock_event_device cevt;
>  	struct clocksource cs;
> -	char name[4];
> +	char name[8];
>  	unsigned long pwm_channels_mask;
> +	int cpu;
>  };
>=20
>  static struct ingenic_tcu *ingenic_tcu;
> @@ -81,6 +87,24 @@ static int ingenic_tcu_cevt_set_next(unsigned long=20
> next,
>  	return 0;
>  }
>=20
> +static void ingenic_per_cpu_event_handler(void *info)
> +{
> +	struct clock_event_device *cevt =3D (struct clock_event_device *)=20
> info;
> +
> +	cevt->event_handler(cevt);
> +}
> +
> +static void ingenic_tcu_per_cpu_cb(struct clock_event_device *evt)
> +{
> +	struct ingenic_tcu *tcu =3D to_ingenic_tcu(evt);
> +	call_single_data_t *csd;
> +
> +	csd =3D &per_cpu(ingenic_cevt_csd, tcu->cpu);
> +	csd->info =3D (void *) evt;
> +	csd->func =3D ingenic_per_cpu_event_handler;
> +	smp_call_function_single_async(tcu->cpu, csd);
> +}
> +
>  static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
>  {
>  	struct clock_event_device *evt =3D dev_id;
> @@ -89,7 +113,7 @@ static irqreturn_t ingenic_tcu_cevt_cb(int irq,=20
> void *dev_id)
>  	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
>=20
>  	if (evt->event_handler)
> -		evt->event_handler(evt);
> +		ingenic_tcu_per_cpu_cb(evt);
>=20
>  	return IRQ_HANDLED;
>  }
> @@ -105,14 +129,21 @@ static struct clk * __init=20
> ingenic_tcu_get_clock(struct device_node *np, int id)
>  	return of_clk_get_from_provider(&args);
>  }
>=20
> -static int __init ingenic_tcu_timer_init(struct device_node *np,
> -					 struct ingenic_tcu *tcu)
> +static int ingenic_tcu_setup_per_cpu_cevt(struct device_node *np,
> +				     unsigned int channel)
>  {
> -	unsigned int timer_virq, channel =3D tcu->timer_channel;
> +	unsigned int timer_virq;
>  	struct irq_domain *domain;
> +	struct ingenic_tcu *tcu;
>  	unsigned long rate;
>  	int err;
>=20
> +	tcu =3D kzalloc(sizeof(*tcu), GFP_KERNEL);
> +	if (!tcu)
> +		return -ENOMEM;

I have no idea why you're doing that, but this is really wrong and=20
highly confusing. The ingenic_tcu instance is already created in the=20
probe. If you need per-timer data, then create another structure.

-Paul

> +
> +	tcu->map =3D ingenic_tcu->map;
> +
>  	tcu->timer_clk =3D ingenic_tcu_get_clock(np, channel);
>  	if (IS_ERR(tcu->timer_clk))
>  		return PTR_ERR(tcu->timer_clk);
> @@ -139,13 +170,15 @@ static int __init ingenic_tcu_timer_init(struct=20
> device_node *np,
>  		goto err_clk_disable;
>  	}
>=20
> -	snprintf(tcu->name, sizeof(tcu->name), "TCU");
> +	snprintf(tcu->name, sizeof(tcu->name), "TCU%u", channel);
>=20
>  	err =3D request_irq(timer_virq, ingenic_tcu_cevt_cb, IRQF_TIMER,
>  			  tcu->name, &tcu->cevt);
>  	if (err)
>  		goto err_irq_dispose_mapping;
>=20
> +	tcu->cpu =3D smp_processor_id();
> +	tcu->timer_channel =3D channel;
>  	tcu->cevt.cpumask =3D cpumask_of(smp_processor_id());
>  	tcu->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
>  	tcu->cevt.name =3D tcu->name;
> @@ -166,6 +199,25 @@ static int __init ingenic_tcu_timer_init(struct=20
> device_node *np,
>  	return err;
>  }
>=20
> +static int ingenic_tcu_setup_cevt(unsigned int cpu)
> +{
> +	int ret;
> +
> +	ret =3D ingenic_tcu_setup_per_cpu_cevt(ingenic_tcu->np,
> +						ingenic_tcu->timer_local[cpu]);
> +	if (ret)
> +		goto err_tcu_clocksource_cleanup;
> +
> +	return 0;
> +
> +err_tcu_clocksource_cleanup:
> +	clocksource_unregister(&ingenic_tcu->cs);
> +	clk_disable_unprepare(ingenic_tcu->cs_clk);
> +	clk_put(ingenic_tcu->cs_clk);
> +	kfree(ingenic_tcu);
> +	return ret;
> +}
> +
>  static int __init ingenic_tcu_clocksource_init(struct device_node=20
> *np,
>  					       struct ingenic_tcu *tcu)
>  {
> @@ -240,6 +292,7 @@ static int __init ingenic_tcu_init(struct=20
> device_node *np)
>  	const struct ingenic_soc_info *soc_info =3D id->data;
>  	struct ingenic_tcu *tcu;
>  	struct regmap *map;
> +	unsigned cpu =3D 0;
>  	long rate;
>  	int ret;
>=20
> @@ -253,13 +306,18 @@ static int __init ingenic_tcu_init(struct=20
> device_node *np)
>  	if (!tcu)
>  		return -ENOMEM;
>=20
> -	/* Enable all TCU channels for PWM use by default except channels=20
> 0/1 */
> -	tcu->pwm_channels_mask =3D GENMASK(soc_info->num_channels - 1, 2);
> +	/*
> +	 * Enable all TCU channels for PWM use by default except channels=20
> 0/1,
> +	 * and channel 2 if target CPU is JZ4780 and SMP is selected.
> +	 */
> +	tcu->pwm_channels_mask =3D GENMASK(soc_info->num_channels - 1,
> +								num_possible_cpus() + 1);
>  	of_property_read_u32(np, "ingenic,pwm-channels-mask",
>  			     (u32 *)&tcu->pwm_channels_mask);
>=20
> -	/* Verify that we have at least two free channels */
> -	if (hweight8(tcu->pwm_channels_mask) > soc_info->num_channels - 2) {
> +	/* Verify that we have at least num_possible_cpus() + 1 free=20
> channels */
> +	if (hweight8(tcu->pwm_channels_mask) >
> +			soc_info->num_channels - num_possible_cpus() + 1) {
>  		pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
>  			tcu->pwm_channels_mask);
>  		ret =3D -EINVAL;
> @@ -267,13 +325,19 @@ static int __init ingenic_tcu_init(struct=20
> device_node *np)
>  	}
>=20
>  	tcu->map =3D map;
> +	tcu->np =3D np;
>  	ingenic_tcu =3D tcu;
>=20
> -	tcu->timer_channel =3D find_first_zero_bit(&tcu->pwm_channels_mask,
> +	tcu->timer_local[cpu] =3D find_first_zero_bit(&tcu->pwm_channels_mask,
>  						 soc_info->num_channels);
> +
> +	for (cpu =3D 1; cpu < num_possible_cpus(); cpu++)
> +		tcu->timer_local[cpu] =3D find_next_zero_bit(
> +				&tcu->pwm_channels_mask, soc_info->num_channels,
> +				tcu->timer_local[cpu - 1] + 1);
> +
>  	tcu->cs_channel =3D find_next_zero_bit(&tcu->pwm_channels_mask,
> -					     soc_info->num_channels,
> -					     tcu->timer_channel + 1);
> +			soc_info->num_channels, tcu->timer_local[cpu - 1] + 1);
>=20
>  	ret =3D ingenic_tcu_clocksource_init(np, tcu);
>  	if (ret) {
> @@ -281,9 +345,10 @@ static int __init ingenic_tcu_init(struct=20
> device_node *np)
>  		goto err_free_ingenic_tcu;
>  	}
>=20
> -	ret =3D ingenic_tcu_timer_init(np, tcu);
> -	if (ret)
> -		goto err_tcu_clocksource_cleanup;
> +	/* Setup clock events on each CPU core */
> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst:=20
> online",
> +				ingenic_tcu_setup_cevt, NULL);
> +	WARN_ON(ret < 0);
>=20
>  	/* Register the sched_clock at the end as there's no way to undo it=20
> */
>  	rate =3D clk_get_rate(tcu->cs_clk);
> @@ -291,10 +356,6 @@ static int __init ingenic_tcu_init(struct=20
> device_node *np)
>=20
>  	return 0;
>=20
> -err_tcu_clocksource_cleanup:
> -	clocksource_unregister(&tcu->cs);
> -	clk_disable_unprepare(tcu->cs_clk);
> -	clk_put(tcu->cs_clk);
>  err_free_ingenic_tcu:
>  	kfree(tcu);
>  	return ret;
> --
> 2.7.4
>=20


