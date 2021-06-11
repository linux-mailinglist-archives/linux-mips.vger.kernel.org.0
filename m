Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1623A45AF
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 17:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhFKPqQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 11:46:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52305 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhFKPqP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 11:46:15 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 004BB6000A;
        Fri, 11 Jun 2021 15:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1623426256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kejwiRe7Gps0ajEYq7wbDg5OYv+c2HJEmZUkvSQzyKA=;
        b=YU3V9Rl0++ZmPjaff/tz0pGrJC5eg6lZtY+rtXLPI9/ZQ29zFkwolPU3u2d8GUz80VYYBh
        zmoOP+uVYFhag/Vg/g6ATijvnpF9dtiuO2mBAbOiJG22HCSF/mDdkFxgnrIdW9m8M2eCzN
        cNLiU1WwYCdVV0ELfBlPvn5HFvNnsl8nXhgg2pBTG2J/e8KHVVZepTmxIkKNhTD2WOzbFe
        FtlBfo4gM634UmuZ1xI5kmCjmDVqmN+OR9tz+MXHLxEqChrVbFiEylHNK1Iizjz90h7QZS
        wAbQWIiV/WdDy+xCmon2OlaTHx0nZ6HSY/B+cb1+63Iaug7gZxE8tfCNRuZ8YA==
Date:   Fri, 11 Jun 2021 16:44:04 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH v2 2/2] clocksource: Ingenic: Add SMP/SMT support for
 sysost driver.
To:     Zhou Yanjie <zhouyu@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <GPNJUQ.ZA1NJ09Y47YY2@opendingux.net>
In-Reply-To: <28c290db-d382-ac96-62c9-cf38fd367714@wanyeetech.com>
References: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1622824306-30987-3-git-send-email-zhouyanjie@wanyeetech.com>
        <8ESHUQ.VB8PTX94HN193@crapouillou.net>
        <28c290db-d382-ac96-62c9-cf38fd367714@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le ven., juin 11 2021 at 23:31:57 +0800, Zhou Yanjie=20
<zhouyu@wanyeetech.com> a =C3=A9crit :
> Hi Paul,
>=20
> On 2021/6/10 =E4=B8=8B=E5=8D=8811:30, Paul Cercueil wrote:
>> Hi Zhou,
>>=20
>> Le sam., juin 5 2021 at 00:31:46 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zho=
u Yanjie)=20
>> =7F<zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>> The OST in Ingenic XBurst=C2=AE2 SoCs such as X2000 and X2100, has a=20
>>> global
>>> timer and two or four percpu timers, add support for the percpu=20
>>> timers.
>>>=20
>>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wa=
nyeetech.com>
>>> ---
>>>=20
>>> Notes:
>>>     v1->v2:
>>>     1.Fix bug in ingenic_ost_global_timer_recalc_rate().
>>>     2.Add a backpointer to the ingenic_ost structure.
>>>     3.Remove unnecessary spinlock.
>>>     4.Use "ret =3D ost->irq" instead "ret =3D -EINVAL".
>>>     5.Use "%d" instead "%x" in pr_crit().
>>=20
>> I can't shake the feeling that you are doing way too many things in=20
>> =7Fone single commit.
>>=20
>> From what I can see, this commit can be split in 4 patches:
>>=20
>> - Fix the "%x" in pr_crit(),
>> - Add the global timer support to the X1000,
>> - Add "ingenic_ost_timer" and update the code to use it,
>> - Finally add X2000 support.
>>=20
>>=20
>=20
> Sure.
>=20
>=20
>>=20
>>>  drivers/clocksource/ingenic-sysost.c | 315=20
>>> =7F=7F++++++++++++++++++++++++++---------
>>>  1 file changed, 236 insertions(+), 79 deletions(-)
>>>=20
>>> diff --git a/drivers/clocksource/ingenic-sysost.c=20
>>> =7F=7Fb/drivers/clocksource/ingenic-sysost.c
>>> index a129840..6f080e4 100644
>>> --- a/drivers/clocksource/ingenic-sysost.c
>>> +++ b/drivers/clocksource/ingenic-sysost.c
>>> @@ -4,6 +4,7 @@
>>>   * Copyright (c) 2020 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
>>> <zhouyanjie@wanyeetech.com>
>>>   */
>>>=20
>>> +#include <linux/bitfield.h>
>>>  #include <linux/bitops.h>
>>>  #include <linux/clk.h>
>>>  #include <linux/clk-provider.h>
>>> @@ -13,6 +14,8 @@
>>>  #include <linux/mfd/syscon.h>
>>>  #include <linux/of_address.h>
>>>  #include <linux/of_irq.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/overflow.h>
>>>  #include <linux/sched_clock.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/syscore_ops.h>
>>> @@ -21,10 +24,14 @@
>>>=20
>>>  /* OST register offsets */
>>>  #define OST_REG_OSTCCR            0x00
>>> +#define OST_REG_OSTER            0x04
>>>  #define OST_REG_OSTCR            0x08
>>>  #define OST_REG_OSTFR            0x0c
>>> +#define OST_REG_OSTCNTH            0x0c
>>>  #define OST_REG_OSTMR            0x10
>>> +#define OST_REG_OSTCNTL            0x10
>>>  #define OST_REG_OST1DFR            0x14
>>> +#define OST_REG_OSTCNTB            0x14
>>>  #define OST_REG_OST1CNT            0x18
>>>  #define OST_REG_OST2CNTL        0x20
>>>  #define OST_REG_OSTCNT2HBUF        0x24
>>> @@ -55,13 +62,23 @@
>>>  #define OSTECR_OST1ENC            BIT(0)
>>>  #define OSTECR_OST2ENC            BIT(1)
>>>=20
>>> +enum ingenic_ost_version {
>>> +    ID_X1000,
>>> +    ID_X2000,
>>> +};
>>> +
>>>  struct ingenic_soc_info {
>>> +    enum ingenic_ost_version version;
>>> +    const struct ingenic_ost_clk_info *clk_info;
>>> +
>>>      unsigned int num_channels;
>>> +    unsigned int base_offset;
>>>  };
>>>=20
>>>  struct ingenic_ost_clk_info {
>>>      struct clk_init_data init_data;
>>> -    u8 ostccr_reg;
>>> +    unsigned int idx;
>>> +    u32 ostcntl_reg;
>>>  };
>>>=20
>>>  struct ingenic_ost_clk {
>>> @@ -71,15 +88,27 @@ struct ingenic_ost_clk {
>>>      const struct ingenic_ost_clk_info *info;
>>>  };
>>>=20
>>> +struct ingenic_ost_timer {
>>> +    void __iomem *base;
>>> +    unsigned int cpu;
>>> +    unsigned int channel;
>>> +    struct clock_event_device cevt;
>>> +    struct ingenic_ost *ost;
>>> +    struct clk *clk;
>>> +    char name[20];
>>> +};
>>> +
>>>  struct ingenic_ost {
>>>      void __iomem *base;
>>>      const struct ingenic_soc_info *soc_info;
>>> -    struct clk *clk, *percpu_timer_clk, *global_timer_clk;
>>> -    struct clock_event_device cevt;
>>> +    struct clk *clk, *global_timer_clk;
>>> +    struct device_node *np;
>>>      struct clocksource cs;
>>> -    char name[20];
>>>=20
>>>      struct clk_hw_onecell_data *clocks;
>>> +    struct ingenic_ost_timer __percpu *timers;
>>> +
>>> +    int irq;
>>>  };
>>>=20
>>>  static struct ingenic_ost *ingenic_ost;
>>> @@ -94,11 +123,12 @@ static unsigned long=20
>>> =7F=7Fingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
>>>  {
>>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>> +    struct ingenic_ost_timer *timer =3D=20
>>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>>      unsigned int prescale;
>>>=20
>>> -    prescale =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>> +    prescale =3D readl(timer->base + OST_REG_OSTCCR);
>>>=20
>>> -    prescale =3D (prescale & OSTCCR_PRESCALE1_MASK) >>=20
>>> =7F=7FOSTCCR_PRESCALE1_LSB;
>>> +    prescale =3D FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
>>>=20
>>>      return parent_rate >> (prescale * 2);
>>>  }
>>> @@ -108,11 +138,15 @@ static unsigned long=20
>>> =7F=7Fingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
>>>  {
>>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>> +    struct ingenic_ost_timer *timer =3D=20
>>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>>      unsigned int prescale;
>>>=20
>>> -    prescale =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>> +    prescale =3D readl(timer->base + OST_REG_OSTCCR);
>>>=20
>>> -    prescale =3D (prescale & OSTCCR_PRESCALE2_MASK) >>=20
>>> =7F=7FOSTCCR_PRESCALE2_LSB;
>>> +    if (ost_clk->ost->soc_info->version >=3D ID_X2000)
>>> +        prescale =3D FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
>>> +    else
>>> +        prescale =3D FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
>>>=20
>>>      return parent_rate >> (prescale * 2);
>>>  }
>>> @@ -147,12 +181,13 @@ static int=20
>>> =7F=7Fingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned=20
>>> long re
>>>  {
>>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>> +    struct ingenic_ost_timer *timer =3D=20
>>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>>      u8 prescale =3D ingenic_ost_get_prescale(parent_rate, req_rate);
>>>      int val;
>>>=20
>>> -    val =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>>      val =3D (val & ~OSTCCR_PRESCALE1_MASK) | (prescale <<=20
>>> =7F=7FOSTCCR_PRESCALE1_LSB);
>>> -    writel(val, ost_clk->ost->base + info->ostccr_reg);
>>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>>=20
>>>      return 0;
>>>  }
>>> @@ -162,12 +197,18 @@ static int=20
>>> =7F=7Fingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned=20
>>> long re
>>>  {
>>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>> +    struct ingenic_ost_timer *timer =3D=20
>>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>>      u8 prescale =3D ingenic_ost_get_prescale(parent_rate, req_rate);
>>>      int val;
>>>=20
>>> -    val =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>> -    val =3D (val & ~OSTCCR_PRESCALE2_MASK) | (prescale <<=20
>>> =7F=7FOSTCCR_PRESCALE2_LSB);
>>> -    writel(val, ost_clk->ost->base + info->ostccr_reg);
>>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>> +
>>> +    if (ost_clk->ost->soc_info->version >=3D ID_X2000)
>>> +        val =3D (val & ~OSTCCR_PRESCALE1_MASK) | (prescale <<=20
>>> =7F=7FOSTCCR_PRESCALE1_LSB);
>>> +    else
>>> +        val =3D (val & ~OSTCCR_PRESCALE2_MASK) | (prescale <<=20
>>> =7F=7FOSTCCR_PRESCALE2_LSB);
>>> +
>>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>>=20
>>>      return 0;
>>>  }
>>> @@ -195,7 +236,42 @@ static const struct ingenic_ost_clk_info=20
>>> =7F=7Fx1000_ost_clk_info[] =3D {
>>>              .ops =3D &ingenic_ost_percpu_timer_ops,
>>>              .flags =3D CLK_SET_RATE_UNGATE,
>>>          },
>>> -        .ostccr_reg =3D OST_REG_OSTCCR,
>>> +        .idx =3D 0,
>>> +    },
>>> +
>>> +    [OST_CLK_GLOBAL_TIMER] =3D {
>>> +        .init_data =3D {
>>> +            .name =3D "global timer",
>>> +            .parent_names =3D ingenic_ost_clk_parents,
>>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>> +            .ops =3D &ingenic_ost_global_timer_ops,
>>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>> +        },
>>> +        .ostcntl_reg =3D OST_REG_OST2CNTL,
>>> +    },
>>> +};
>>> +
>>> +static const struct ingenic_ost_clk_info x2000_ost_clk_info[] =3D {
>>> +    [OST_CLK_PERCPU_TIMER0] =3D {
>>> +        .init_data =3D {
>>> +            .name =3D "percpu timer0",
>>> +            .parent_names =3D ingenic_ost_clk_parents,
>>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>> +            .ops =3D &ingenic_ost_percpu_timer_ops,
>>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>> +        },
>>> +        .idx =3D 0,
>>> +    },
>>> +
>>> +    [OST_CLK_PERCPU_TIMER1] =3D {
>>> +        .init_data =3D {
>>> +            .name =3D "percpu timer1",
>>> +            .parent_names =3D ingenic_ost_clk_parents,
>>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>> +            .ops =3D &ingenic_ost_percpu_timer_ops,
>>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>> +        },
>>> +        .idx =3D 1,
>>>      },
>>>=20
>>>      [OST_CLK_GLOBAL_TIMER] =3D {
>>> @@ -206,7 +282,7 @@ static const struct ingenic_ost_clk_info=20
>>> =7F=7Fx1000_ost_clk_info[] =3D {
>>>              .ops =3D &ingenic_ost_global_timer_ops,
>>>              .flags =3D CLK_SET_RATE_UNGATE,
>>>          },
>>> -        .ostccr_reg =3D OST_REG_OSTCCR,
>>> +        .ostcntl_reg =3D OST_REG_OSTCNTL,
>>>      },
>>>  };
>>>=20
>>> @@ -215,7 +291,7 @@ static u64 notrace=20
>>> =7F=7Fingenic_ost_global_timer_read_cntl(void)
>>>      struct ingenic_ost *ost =3D ingenic_ost;
>>>      unsigned int count;
>>>=20
>>> -    count =3D readl(ost->base + OST_REG_OST2CNTL);
>>> +    count =3D readl(ost->base +=20
>>> ost->soc_info->clk_info->ostcntl_reg);
>>>=20
>>>      return count;
>>>  }
>>> @@ -225,16 +301,21 @@ static u64 notrace=20
>>> =7F=7Fingenic_ost_clocksource_read(struct clocksource *cs)
>>>      return ingenic_ost_global_timer_read_cntl();
>>>  }
>>>=20
>>> -static inline struct ingenic_ost *to_ingenic_ost(struct=20
>>> =7F=7Fclock_event_device *evt)
>>> +static inline struct ingenic_ost_timer *
>>> +to_ingenic_ost_timer(struct clock_event_device *evt)
>>>  {
>>> -    return container_of(evt, struct ingenic_ost, cevt);
>>> +    return container_of(evt, struct ingenic_ost_timer, cevt);
>>>  }
>>>=20
>>>  static int ingenic_ost_cevt_set_state_shutdown(struct=20
>>> =7F=7Fclock_event_device *evt)
>>>  {
>>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>> +    struct ingenic_ost_timer *timer =3D to_ingenic_ost_timer(evt);
>>> +    struct ingenic_ost *ost =3D timer->ost;
>>>=20
>>> -    writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
>>> +    if (ost->soc_info->version >=3D ID_X2000)
>>> +        writel(0, timer->base + OST_REG_OSTER);
>>> +    else
>>> +        writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
>>>=20
>>>      return 0;
>>>  }
>>> @@ -242,26 +323,34 @@ static int=20
>>> =7F=7Fingenic_ost_cevt_set_state_shutdown(struct clock_event_device=20
>>> *evt)
>>>  static int ingenic_ost_cevt_set_next(unsigned long next,
>>>                       struct clock_event_device *evt)
>>>  {
>>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>> -
>>> -    writel((u32)~OSTFR_FFLAG, ost->base + OST_REG_OSTFR);
>>> -    writel(next, ost->base + OST_REG_OST1DFR);
>>> -    writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
>>> -    writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTESR);
>>> -    writel((u32)~OSTMR_FMASK, ost->base + OST_REG_OSTMR);
>>> +    struct ingenic_ost_timer *timer =3D to_ingenic_ost_timer(evt);
>>> +    struct ingenic_ost *ost =3D timer->ost;
>>> +
>>> +    writel((u32)~OSTFR_FFLAG, timer->base + OST_REG_OSTFR);
>>> +    writel(next, timer->base + OST_REG_OST1DFR);
>>> +    writel(OSTCR_OST1CLR, timer->base + OST_REG_OSTCR);
>>> +
>>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>> +        writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTER);
>>> +    } else {
>>> +        writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTESR);
>>> +        writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
>>> +    }
>>>=20
>>>      return 0;
>>>  }
>>>=20
>>>  static irqreturn_t ingenic_ost_cevt_cb(int irq, void *dev_id)
>>>  {
>>> -    struct clock_event_device *evt =3D dev_id;
>>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>> +    struct ingenic_ost_timer *timer =3D dev_id;
>>> +    struct ingenic_ost *ost =3D timer->ost;
>>>=20
>>> -    writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
>>> +    if (ost->soc_info->version >=3D ID_X2000)
>>> +        writel(0, timer->base + OST_REG_OSTER);
>>> +    else
>>> +        writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
>>>=20
>>> -    if (evt->event_handler)
>>> -        evt->event_handler(evt);
>>> +    timer->cevt.event_handler(&timer->cevt);
>>>=20
>>>      return IRQ_HANDLED;
>>>  }
>>> @@ -271,6 +360,7 @@ static int __init=20
>>> =7F=7Fingenic_ost_register_clock(struct ingenic_ost *ost,
>>>              struct clk_hw_onecell_data *clocks)
>>>  {
>>>      struct ingenic_ost_clk *ost_clk;
>>> +    struct ingenic_ost_timer *timer =3D per_cpu_ptr(ost->timers,=20
>>> =7F=7Finfo->idx);
>>>      int val, err;
>>>=20
>>>      ost_clk =3D kzalloc(sizeof(*ost_clk), GFP_KERNEL);
>>> @@ -283,9 +373,9 @@ static int __init=20
>>> =7F=7Fingenic_ost_register_clock(struct ingenic_ost *ost,
>>>      ost_clk->ost =3D ost;
>>>=20
>>>      /* Reset clock divider */
>>> -    val =3D readl(ost->base + info->ostccr_reg);
>>> -    val &=3D ~(OSTCCR_PRESCALE1_MASK | OSTCCR_PRESCALE2_MASK);
>>> -    writel(val, ost->base + info->ostccr_reg);
>>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>> +    val &=3D ~(OSTCCR_PRESCALE1_MASK);
>>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>>=20
>>>      err =3D clk_hw_register(NULL, &ost_clk->hw);
>>>      if (err) {
>>> @@ -309,57 +399,51 @@ static struct clk * __init=20
>>> =7F=7Fingenic_ost_get_clock(struct device_node *np, int id)
>>>      return of_clk_get_from_provider(&args);
>>>  }
>>>=20
>>> -static int __init ingenic_ost_percpu_timer_init(struct device_node=20
>>> *np,
>>> -                     struct ingenic_ost *ost)
>>> +static int __init ingenic_ost_setup_cevt(unsigned int cpu)
>>>  {
>>> -    unsigned int timer_virq, channel =3D OST_CLK_PERCPU_TIMER;
>>> +    struct ingenic_ost *ost =3D ingenic_ost;
>>> +    struct ingenic_ost_timer *timer =3D this_cpu_ptr(ost->timers);
>>>      unsigned long rate;
>>>      int err;
>>>=20
>>> -    ost->percpu_timer_clk =3D ingenic_ost_get_clock(np, channel);
>>> -    if (IS_ERR(ost->percpu_timer_clk))
>>> -        return PTR_ERR(ost->percpu_timer_clk);
>>> +    timer->clk =3D ingenic_ost_get_clock(ost->np, timer->channel);
>>> +    if (IS_ERR(timer->clk))
>>> +        return PTR_ERR(timer->clk);
>>>=20
>>> -    err =3D clk_prepare_enable(ost->percpu_timer_clk);
>>> +    err =3D clk_prepare_enable(timer->clk);
>>>      if (err)
>>>          goto err_clk_put;
>>>=20
>>> -    rate =3D clk_get_rate(ost->percpu_timer_clk);
>>> +    rate =3D clk_get_rate(timer->clk);
>>>      if (!rate) {
>>>          err =3D -EINVAL;
>>>          goto err_clk_disable;
>>>      }
>>>=20
>>> -    timer_virq =3D of_irq_get(np, 0);
>>> -    if (!timer_virq) {
>>> -        err =3D -EINVAL;
>>> -        goto err_clk_disable;
>>> -    }
>>> +    snprintf(timer->name, sizeof(timer->name), "OST percpu=20
>>> timer%u", =7F=7Fcpu);
>>>=20
>>> -    snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
>>> +    /* Unmask full comparison match interrupt */
>>> +    writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
>>>=20
>>> -    err =3D request_irq(timer_virq, ingenic_ost_cevt_cb, IRQF_TIMER,
>>> -              ost->name, &ost->cevt);
>>> -    if (err)
>>> -        goto err_irq_dispose_mapping;
>>> +    timer->cpu =3D smp_processor_id();
>>> +    timer->cevt.cpumask =3D cpumask_of(smp_processor_id());
>>> +    timer->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
>>> +    timer->cevt.name =3D timer->name;
>>> +    timer->cevt.rating =3D 400;
>>> +    timer->cevt.set_state_shutdown =3D=20
>>> =7F=7Fingenic_ost_cevt_set_state_shutdown;
>>> +    timer->cevt.set_next_event =3D ingenic_ost_cevt_set_next;
>>>=20
>>> -    ost->cevt.cpumask =3D cpumask_of(smp_processor_id());
>>> -    ost->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
>>> -    ost->cevt.name =3D ost->name;
>>> -    ost->cevt.rating =3D 400;
>>> -    ost->cevt.set_state_shutdown =3D=20
>>> ingenic_ost_cevt_set_state_shutdown;
>>> -    ost->cevt.set_next_event =3D ingenic_ost_cevt_set_next;
>>> +    clockevents_config_and_register(&timer->cevt, rate, 4,=20
>>> 0xffffffff);
>>>=20
>>> -    clockevents_config_and_register(&ost->cevt, rate, 4,=20
>>> 0xffffffff);
>>> +    if (ost->soc_info->version >=3D ID_X2000)
>>> +        enable_percpu_irq(ost->irq, IRQ_TYPE_NONE);
>>>=20
>>>      return 0;
>>>=20
>>> -err_irq_dispose_mapping:
>>> -    irq_dispose_mapping(timer_virq);
>>>  err_clk_disable:
>>> -    clk_disable_unprepare(ost->percpu_timer_clk);
>>> +    clk_disable_unprepare(timer->clk);
>>>  err_clk_put:
>>> -    clk_put(ost->percpu_timer_clk);
>>> +    clk_put(timer->clk);
>>>      return err;
>>>  }
>>>=20
>>> @@ -385,11 +469,14 @@ static int __init=20
>>> =7F=7Fingenic_ost_global_timer_init(struct device_node *np,
>>>          goto err_clk_disable;
>>>      }
>>>=20
>>> -    /* Clear counter CNT registers */
>>> -    writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
>>> -
>>> -    /* Enable OST channel */
>>> -    writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
>>> +    /* Clear counter CNT registers and enable OST channel */
>>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>> +        writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
>>> +        writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTER);
>>> +    } else {
>>> +        writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
>>> +        writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
>>> +    }
>>>=20
>>>      cs->name =3D "ingenic-ost";
>>>      cs->rating =3D 400;
>>> @@ -411,18 +498,33 @@ static int __init=20
>>> =7F=7Fingenic_ost_global_timer_init(struct device_node *np,
>>>  }
>>>=20
>>>  static const struct ingenic_soc_info x1000_soc_info =3D {
>>> +    .version =3D ID_X1000,
>>> +    .clk_info =3D x1000_ost_clk_info,
>>> +
>>>      .num_channels =3D 2,
>>>  };
>>>=20
>>> +static const struct ingenic_soc_info x2000_soc_info =3D {
>>> +    .version =3D ID_X2000,
>>> +    .clk_info =3D x2000_ost_clk_info,
>>> +
>>> +    .num_channels =3D 3,
>>> +    .base_offset =3D 0x100,
>>> +};
>>> +
>>>  static const struct of_device_id __maybe_unused=20
>>> =7F=7Fingenic_ost_of_matches[] __initconst =3D {
>>>      { .compatible =3D "ingenic,x1000-ost", .data =3D &x1000_soc_info }=
,
>>> +    { .compatible =3D "ingenic,x2000-ost", .data =3D &x2000_soc_info }=
,
>>>      { /* sentinel */ }
>>>  };
>>>=20
>>>  static int __init ingenic_ost_probe(struct device_node *np)
>>>  {
>>>      const struct of_device_id *id =3D=20
>>> =7F=7Fof_match_node(ingenic_ost_of_matches, np);
>>> +    struct ingenic_ost_timer *timer;
>>>      struct ingenic_ost *ost;
>>> +    void __iomem *base;
>>> +    unsigned int cpu;
>>>      unsigned int i;
>>>      int ret;
>>>=20
>>> @@ -430,18 +532,43 @@ static int __init ingenic_ost_probe(struct=20
>>> =7F=7Fdevice_node *np)
>>>      if (!ost)
>>>          return -ENOMEM;
>>>=20
>>> +    ost->timers =3D alloc_percpu(struct ingenic_ost_timer);
>>> +    if (!ost->timers) {
>>> +        ret =3D -ENOMEM;
>>> +        goto err_free_ost;
>>> +    }
>>> +
>>> +    ost->np =3D np;
>>> +    ost->soc_info =3D id->data;
>>> +
>>>      ost->base =3D of_io_request_and_map(np, 0,=20
>>> of_node_full_name(np));
>>>      if (IS_ERR(ost->base)) {
>>>          pr_err("%s: Failed to map OST registers\n", __func__);
>>>          ret =3D PTR_ERR(ost->base);
>>> -        goto err_free_ost;
>>> +        goto err_free_timers;
>>> +    }
>>> +
>>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>> +        base =3D of_io_request_and_map(np, 1, of_node_full_name(np));
>>> +        if (IS_ERR(base)) {
>>> +            pr_err("%s: Failed to map OST registers\n", __func__);
>>> +            ret =3D PTR_ERR(base);
>>> +            goto err_free_timers;
>>> +        }
>>> +    }
>>=20
>> The DT documentation only mentions one memory resource. Here, you=20
>> map =7Fa second one, which is not used anywhere. I'm really confused=20
>> about =7Fwhat you're trying to do here.
>>=20
>=20
> X2000 and X2100 divide the OST into two parts. The global timer is
> the first part, which is still located at the address of 0x12000000,
> and the percpu timers are the second part, the starting address is
> 0x12100000, and each timer is offset by 0x100 (percpu timer0 is at
> 0x12100000, percpu timer1 is at 0x12100100, percpu timer2 is at
> 0x12100200, percpu timer3 is at 0x12100300). This one is used in
> line 593 of the code.

Then you need two different DT nodes, one at each start address. Either=20
use different drivers (since the register sets are different), or *if*=20
it can be implemented cleanly in ingenic-sysost.c, different compatible=20
strings - one for the global timer and one for the percpu timers.

-Paul

>>> +
>>> +    ost->irq =3D irq_of_parse_and_map(np, 0);
>>> +    if (ost->irq < 0) {
>>> +        pr_crit("%s: Cannot to get OST IRQ\n", __func__);
>>> +        ret =3D ost->irq;
>>> +        goto err_free_timers;
>>>      }
>>>=20
>>>      ost->clk =3D of_clk_get_by_name(np, "ost");
>>>      if (IS_ERR(ost->clk)) {
>>> -        ret =3D PTR_ERR(ost->clk);
>>>          pr_crit("%s: Cannot get OST clock\n", __func__);
>>> -        goto err_free_ost;
>>> +        ret =3D PTR_ERR(ost->clk);
>>> +        goto err_free_timers;
>>>      }
>>>=20
>>>      ret =3D clk_prepare_enable(ost->clk);
>>> @@ -450,8 +577,6 @@ static int __init ingenic_ost_probe(struct=20
>>> =7F=7Fdevice_node *np)
>>>          goto err_put_clk;
>>>      }
>>>=20
>>> -    ost->soc_info =3D id->data;
>>> -
>>>      ost->clocks =3D kzalloc(struct_size(ost->clocks, hws,=20
>>> =7F=7Fost->soc_info->num_channels),
>>>                    GFP_KERNEL);
>>>      if (!ost->clocks) {
>>> @@ -461,8 +586,21 @@ static int __init ingenic_ost_probe(struct=20
>>> =7F=7Fdevice_node *np)
>>>=20
>>>      ost->clocks->num =3D ost->soc_info->num_channels;
>>>=20
>>> -    for (i =3D 0; i < ost->clocks->num; i++) {
>>> -        ret =3D ingenic_ost_register_clock(ost, i,=20
>>> =7F=7F&x1000_ost_clk_info[i], ost->clocks);
>>> +    for (cpu =3D 0; cpu < num_possible_cpus(); cpu++) {
>>> +        timer =3D per_cpu_ptr(ost->timers, cpu);
>>> +
>>> +        if (ost->soc_info->version >=3D ID_X2000)
>>> +            timer->base =3D base + ost->soc_info->base_offset * cpu;
>>> +        else
>>> +            timer->base =3D ost->base;
>>> +
>>> +        timer->ost =3D ost;
>>> +        timer->cpu =3D cpu;
>>> +        timer->channel =3D OST_CLK_PERCPU_TIMER + cpu;
>>> +    }
>>> +
>>> +    for (i =3D 0; i < num_possible_cpus() + 1; i++) {
>>> +        ret =3D ingenic_ost_register_clock(ost, i,=20
>>> =7F=7F&ost->soc_info->clk_info[i], ost->clocks);
>>>          if (ret) {
>>>              pr_crit("%s: Cannot register clock %d\n", __func__, i);
>>>              goto err_unregister_ost_clocks;
>>> @@ -488,6 +626,8 @@ static int __init ingenic_ost_probe(struct=20
>>> =7F=7Fdevice_node *np)
>>>      clk_disable_unprepare(ost->clk);
>>>  err_put_clk:
>>>      clk_put(ost->clk);
>>> +err_free_timers:
>>> +    free_percpu(ost->timers);
>>>  err_free_ost:
>>>      kfree(ost);
>>>      return ret;
>>> @@ -513,13 +653,29 @@ static int __init ingenic_ost_init(struct=20
>>> =7F=7Fdevice_node *np)
>>>=20
>>>      ret =3D ingenic_ost_global_timer_init(np, ost);
>>>      if (ret) {
>>> -        pr_crit("%s: Unable to init global timer: %x\n", __func__,=20
>>> =7F=7Fret);
>>> +        pr_crit("%s: Unable to init global timer: %d\n", __func__,=20
>>> =7F=7Fret);
>>=20
>> This is a fix, so it needs to be a separate commit with a Fixes: tag.
>=20
>=20
> Sure.
>=20
>=20
> Thanks and best regards!
>=20
>=20
>>=20
>> Cheers,
>> -Paul
>>=20
>>>          goto err_free_ingenic_ost;
>>>      }
>>>=20
>>> -    ret =3D ingenic_ost_percpu_timer_init(np, ost);
>>> -    if (ret)
>>> +    if (ost->soc_info->version >=3D ID_X2000)
>>> +        ret =3D request_percpu_irq(ost->irq, ingenic_ost_cevt_cb,
>>> +                  "OST percpu timer", ost->timers);
>>> +    else
>>> +        ret =3D request_irq(ost->irq, ingenic_ost_cevt_cb,=20
>>> IRQF_TIMER,
>>> +                  "OST percpu timer", ost->timers);
>>> +
>>> +    if (ret) {
>>> +        pr_crit("%s: Unable to request percpu IRQ: %d\n",=20
>>> __func__, =7F=7Fret);
>>> +        goto err_ost_global_timer_cleanup;
>>> +    }
>>> +
>>> +    /* Setup clock events on each CPU core */
>>> +    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst:=20
>>> =7F=7Fonline",
>>> +                ingenic_ost_setup_cevt, NULL);
>>> +    if (ret < 0) {
>>> +        pr_crit("%s: Unable to init percpu timers: %d\n",=20
>>> __func__, =7F=7Fret);
>>>          goto err_ost_global_timer_cleanup;
>>> +    }
>>>=20
>>>      /* Register the sched_clock at the end as there's no way to=20
>>> undo =7F=7Fit */
>>>      rate =3D clk_get_rate(ost->global_timer_clk);
>>> @@ -537,3 +693,4 @@ static int __init ingenic_ost_init(struct=20
>>> =7F=7Fdevice_node *np)
>>>  }
>>>=20
>>>  TIMER_OF_DECLARE(x1000_ost,  "ingenic,x1000-ost",=20
>>> ingenic_ost_init);
>>> +TIMER_OF_DECLARE(x2000_ost,  "ingenic,x2000-ost",=20
>>> ingenic_ost_init);
>>> --
>>> 2.7.4
>>>=20
>>=20


