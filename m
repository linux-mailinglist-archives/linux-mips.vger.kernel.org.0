Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DB2172308
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 17:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbgB0QS5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 11:18:57 -0500
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:42635 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729670AbgB0QS5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 11:18:57 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.399816-0.00950124-0.590683;DS=CONTINUE|ham_alarm|0.0105513-0.00542129-0.984027;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GtIn0Dr_1582820317;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GtIn0Dr_1582820317)
          by smtp.aliyun-inc.com(10.147.41.187);
          Fri, 28 Feb 2020 00:18:38 +0800
Subject: Re: [PATCH v6 4/7] clocksource: Ingenic: Add high resolution timer
 support for SMP.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1582215889-113034-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582215889-113034-6-git-send-email-zhouyanjie@wanyeetech.com>
 <1582223584.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, sboyd@kernel.org,
        mturquette@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, geert+renesas@glider.be,
        krzk@kernel.org, ebiederm@xmission.com, miquel.raynal@bootlin.com,
        keescook@chromium.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, dongsheng.qiu@ingenic.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E57EBDC.4020206@wanyeetech.com>
Date:   Fri, 28 Feb 2020 00:18:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1582223584.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2020年02月21日 02:33, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le ven., févr. 21, 2020 at 00:24, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Enable clock event handling on per CPU core basis.
>> Make sure that interrupts raised on the first core execute
>> event handlers on the correct CPU core.
>>
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Tested-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     1.Adjust function naming to make it more reasonable.
>>     2.Replace function smp_call_function_single() with
>>       smp_call_function_single_async() in order to resolve
>>       the warning below:
>>
>>     [    0.350942] smp: Brought up 1 node, 2 CPUs
>>     [    0.365497] ------------[ cut here ]------------
>>     [    0.365522] WARNING: CPU: 0 PID: 1 at kernel/smp.c:300 
>> smp_call_function_single+0x110/0x200
>>     [    0.365533] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
>> 5.5.0-rc1+ #5
>>     [    0.365537] Stack : 00000000 59c73bcd 00000037 80074e80 
>> 80000000 80670000 805a0000 80620590
>>     [    0.365557]         8065ce38 8fc0dc8c 806d0000 00000000 
>> 80670000 00000001 8fc0dc20 59c73bcd
>>     [    0.365574]         00000000 00000000 806f0000 80670000 
>> 00000000 806dab00 00000000 2d302e35
>>     [    0.365591]         203a6d6d 806e0000 806e0000 70617773 
>> 80670000 00000000 00000000 00000009
>>     [    0.365610]         00000000 8fc94e20 8fc0de30 80690000 
>> 00000018 803592dc 00000000 806d0000
>>     [    0.365627]         ...
>>     [    0.365634] Call Trace:
>>     [    0.365647] [<8001b9a0>] show_stack+0x6c/0x12c
>>     [    0.365663] [<804aed20>] dump_stack+0x98/0xc8
>>     [    0.365673] [<8003044c>] __warn+0xc4/0xe8
>>     [    0.365682] [<800304f4>] warn_slowpath_fmt+0x84/0xb8
>>     [    0.365690] [<800a886c>] smp_call_function_single+0x110/0x200
>>     [    0.365703] ---[ end trace 5785856ca39c79d5 ]---
>>     [    0.365557]         8065ce38 8fc0dc8c 806d0000 00000000 
>> 80670000 00000001 8fc0dc20 59c73bcd
>>     [    0.365574]         00000000 00000000 806f0000 80670000 
>> 00000000 806dab00 00000000 2d302e35
>>     [    0.365591]         203a6d6d 806e0000 806e0000 70617773 
>> 80670000 00000000 00000000 00000009
>>     [    0.365610]         00000000 8fc94e20 8fc0de30 80690000 
>> 00000018 803592dc 00000000 806d0000
>>     [    0.365627]         ...
>>     [    0.365634] Call Trace:
>>     [    0.365647] [<8001b9a0>] show_stack+0x6c/0x12c
>>     [    0.365663] [<804aed20>] dump_stack+0x98/0xc8
>>     [    0.365673] [<8003044c>] __warn+0xc4/0xe8
>>     [    0.365682] [<800304f4>] warn_slowpath_fmt+0x84/0xb8
>>     [    0.365690] [<800a886c>] smp_call_function_single+0x110/0x200
>>     [    0.365703] ---[ end trace 5785856ca39c79d5 ]---
>>
>>     v2->v3:
>>     No Change.
>>
>>     v3->v4:
>>     Rebase on top of kernel 5.6-rc1.
>>
>>     v4->v5:
>>     Move the check for (evt->event_handler) from 
>> "ingenic_per_cpu_event_handler"
>>     to "ingenic_tcu_cevt_cb".
>>
>>     v5->v6:
>>     No change.
>>
>>  drivers/clocksource/ingenic-timer.c | 113 
>> +++++++++++++++++++++++++++++-------
>>  1 file changed, 91 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/clocksource/ingenic-timer.c 
>> b/drivers/clocksource/ingenic-timer.c
>> index 4bbdb3d..e396326 100644
>> --- a/drivers/clocksource/ingenic-timer.c
>> +++ b/drivers/clocksource/ingenic-timer.c
>> @@ -1,7 +1,8 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> - * JZ47xx SoCs TCU IRQ driver
>> + * XBurst SoCs TCU IRQ driver
>>   * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
>> + * Copyright (C) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>   */
>>
>>  #include <linux/bitops.h>
>> @@ -21,18 +22,23 @@
>>
>>  #include <dt-bindings/clock/ingenic,tcu.h>
>>
>> +static DEFINE_PER_CPU(call_single_data_t, ingenic_cevt_csd);
>> +
>>  struct ingenic_soc_info {
>>      unsigned int num_channels;
>>  };
>>
>>  struct ingenic_tcu {
>>      struct regmap *map;
>> +    struct device_node *np;
>>      struct clk *timer_clk, *cs_clk;
>> +    unsigned int timer_local[NR_CPUS];
>>      unsigned int timer_channel, cs_channel;
>>      struct clock_event_device cevt;
>>      struct clocksource cs;
>> -    char name[4];
>> +    char name[8];
>>      unsigned long pwm_channels_mask;
>> +    int cpu;
>>  };
>>
>>  static struct ingenic_tcu *ingenic_tcu;
>> @@ -81,6 +87,24 @@ static int ingenic_tcu_cevt_set_next(unsigned long 
>> next,
>>      return 0;
>>  }
>>
>> +static void ingenic_per_cpu_event_handler(void *info)
>> +{
>> +    struct clock_event_device *cevt = (struct clock_event_device *) 
>> info;
>> +
>> +    cevt->event_handler(cevt);
>> +}
>> +
>> +static void ingenic_tcu_per_cpu_cb(struct clock_event_device *evt)
>> +{
>> +    struct ingenic_tcu *tcu = to_ingenic_tcu(evt);
>> +    call_single_data_t *csd;
>> +
>> +    csd = &per_cpu(ingenic_cevt_csd, tcu->cpu);
>> +    csd->info = (void *) evt;
>> +    csd->func = ingenic_per_cpu_event_handler;
>> +    smp_call_function_single_async(tcu->cpu, csd);
>> +}
>> +
>>  static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
>>  {
>>      struct clock_event_device *evt = dev_id;
>> @@ -89,7 +113,7 @@ static irqreturn_t ingenic_tcu_cevt_cb(int irq, 
>> void *dev_id)
>>      regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
>>
>>      if (evt->event_handler)
>> -        evt->event_handler(evt);
>> +        ingenic_tcu_per_cpu_cb(evt);
>>
>>      return IRQ_HANDLED;
>>  }
>> @@ -105,14 +129,21 @@ static struct clk * __init 
>> ingenic_tcu_get_clock(struct device_node *np, int id)
>>      return of_clk_get_from_provider(&args);
>>  }
>>
>> -static int __init ingenic_tcu_timer_init(struct device_node *np,
>> -                     struct ingenic_tcu *tcu)
>> +static int ingenic_tcu_setup_per_cpu_cevt(struct device_node *np,
>> +                     unsigned int channel)
>>  {
>> -    unsigned int timer_virq, channel = tcu->timer_channel;
>> +    unsigned int timer_virq;
>>      struct irq_domain *domain;
>> +    struct ingenic_tcu *tcu;
>>      unsigned long rate;
>>      int err;
>>
>> +    tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
>> +    if (!tcu)
>> +        return -ENOMEM;
>> +
>> +    tcu->map = ingenic_tcu->map;
>> +
>>      tcu->timer_clk = ingenic_tcu_get_clock(np, channel);
>>      if (IS_ERR(tcu->timer_clk))
>>          return PTR_ERR(tcu->timer_clk);
>> @@ -139,13 +170,15 @@ static int __init ingenic_tcu_timer_init(struct 
>> device_node *np,
>>          goto err_clk_disable;
>>      }
>>
>> -    snprintf(tcu->name, sizeof(tcu->name), "TCU");
>> +    snprintf(tcu->name, sizeof(tcu->name), "TCU%u", channel);
>>
>>      err = request_irq(timer_virq, ingenic_tcu_cevt_cb, IRQF_TIMER,
>>                tcu->name, &tcu->cevt);
>>      if (err)
>>          goto err_irq_dispose_mapping;
>>
>> +    tcu->cpu = smp_processor_id();
>> +    tcu->timer_channel = channel;
>>      tcu->cevt.cpumask = cpumask_of(smp_processor_id());
>>      tcu->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
>>      tcu->cevt.name = tcu->name;
>> @@ -166,6 +199,25 @@ static int __init ingenic_tcu_timer_init(struct 
>> device_node *np,
>>      return err;
>>  }
>>
>> +static int ingenic_tcu_setup_cevt(unsigned int cpu)
>> +{
>> +    int ret;
>> +
>> +    ret = ingenic_tcu_setup_per_cpu_cevt(ingenic_tcu->np,
>> +                        ingenic_tcu->timer_local[cpu]);
>> +    if (ret)
>> +        goto err_tcu_clocksource_cleanup;
>> +
>> +    return 0;
>> +
>> +err_tcu_clocksource_cleanup:
>> +    clocksource_unregister(&ingenic_tcu->cs);
>> +    clk_disable_unprepare(ingenic_tcu->cs_clk);
>> +    clk_put(ingenic_tcu->cs_clk);
>> +    kfree(ingenic_tcu);
>> +    return ret;
>> +}
>> +
>>  static int __init ingenic_tcu_clocksource_init(struct device_node *np,
>>                             struct ingenic_tcu *tcu)
>>  {
>> @@ -239,6 +291,7 @@ static int __init ingenic_tcu_init(struct 
>> device_node *np)
>>      const struct ingenic_soc_info *soc_info = id->data;
>>      struct ingenic_tcu *tcu;
>>      struct regmap *map;
>> +    unsigned cpu = 0;
>>      long rate;
>>      int ret;
>>
>> @@ -252,13 +305,18 @@ static int __init ingenic_tcu_init(struct 
>> device_node *np)
>>      if (!tcu)
>>          return -ENOMEM;
>>
>> -    /* Enable all TCU channels for PWM use by default except 
>> channels 0/1 */
>> -    tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1, 2);
>> +    /*
>> +     * Enable all TCU channels for PWM use by default except 
>> channels 0/1,
>> +     * and channel 2 if target CPU is JZ4780 and SMP is selected.
>> +     */
>> +    tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1,
>> +                                NR_CPUS + 1);
>>      of_property_read_u32(np, "ingenic,pwm-channels-mask",
>>                   (u32 *)&tcu->pwm_channels_mask);
>>
>> -    /* Verify that we have at least two free channels */
>> -    if (hweight8(tcu->pwm_channels_mask) > soc_info->num_channels - 
>> 2) {
>> +    /* Verify that we have at least NR_CPUS + 1 free channels */
>> +    if (hweight8(tcu->pwm_channels_mask) >
>> +            soc_info->num_channels - NR_CPUS + 1) {
>
> NR_CPUS can be up to 256. You want to use num_online_cpus() here, I 
> believe.

Sure, will change in next version.

>
>>          pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
>>              tcu->pwm_channels_mask);
>>          ret = -EINVAL;
>> @@ -266,13 +324,27 @@ static int __init ingenic_tcu_init(struct 
>> device_node *np)
>>      }
>>
>>      tcu->map = map;
>> +    tcu->np = np;
>>      ingenic_tcu = tcu;
>>
>> -    tcu->timer_channel = find_first_zero_bit(&tcu->pwm_channels_mask,
>> +    tcu->timer_local[cpu] = 
>> find_first_zero_bit(&tcu->pwm_channels_mask,
>>                           soc_info->num_channels);
>> -    tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
>> -                         soc_info->num_channels,
>> -                         tcu->timer_channel + 1);
>> +
>> +    if (NR_CPUS > 1) {
>> +        for (cpu = 1; cpu < NR_CPUS; cpu++)
>> +            tcu->timer_local[cpu] = find_next_zero_bit(
>> +                        &tcu->pwm_channels_mask,
>> +                        soc_info->num_channels,
>> +                        tcu->timer_local[cpu - 1] + 1);
>> +
>> +        tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
>> +                    soc_info->num_channels,
>> +                    tcu->timer_local[cpu-1] + 1);
>> +    } else {
>> +        tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
>> +                    soc_info->num_channels,
>> +                    tcu->timer_local[cpu] + 1);
>> +    }
>
> I believe you can factorize the code a bit here - don't check for 
> NR_CPUS > 1, and have a for (cpu = 0; cpu < num_online_cpus(); cpu++) 
> loop. You could use a temporary variable to store the 'next bit' value.

Sure.

>
> -Paul
>
>>
>>      ret = ingenic_tcu_clocksource_init(np, tcu);
>>      if (ret) {
>> @@ -280,9 +352,10 @@ static int __init ingenic_tcu_init(struct 
>> device_node *np)
>>          goto err_free_ingenic_tcu;
>>      }
>>
>> -    ret = ingenic_tcu_timer_init(np, tcu);
>> -    if (ret)
>> -        goto err_tcu_clocksource_cleanup;
>> +    /* Setup clock events on each CPU core */
>> +    ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst: 
>> online",
>> +                ingenic_tcu_setup_cevt, NULL);
>> +    WARN_ON(ret < 0);
>>
>>      /* Register the sched_clock at the end as there's no way to undo 
>> it */
>>      rate = clk_get_rate(tcu->cs_clk);
>> @@ -290,10 +363,6 @@ static int __init ingenic_tcu_init(struct 
>> device_node *np)
>>
>>      return 0;
>>
>> -err_tcu_clocksource_cleanup:
>> -    clocksource_unregister(&tcu->cs);
>> -    clk_disable_unprepare(tcu->cs_clk);
>> -    clk_put(tcu->cs_clk);
>>  err_free_ingenic_tcu:
>>      kfree(tcu);
>>      return ret;
>> -- 
>> 2.7.4
>>
>

