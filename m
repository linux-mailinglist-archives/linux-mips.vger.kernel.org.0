Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A61E3A6C40
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 18:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhFNQpJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 12:45:09 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:58263 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbhFNQoo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 12:44:44 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4579B10000C;
        Mon, 14 Jun 2021 16:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1623688959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5vPWnx3AtBB2O79/3dkIH/rybSAk8lunhx/o9VfC8tQ=;
        b=OFFwqGoiyq6XJEvpJwSqSj4vuVWWYk3DHNHxj+k2/NNSvsD7O+n6Y0S/jFxu15ilXJo+B7
        e64YIxF7Qia79KJHbgtSFeD7ospaFupR4m5tJu59+DRGVkwLPosjECHKzUT7g/8udXI46U
        DMtOsuUJSI0Husvih6m6NLJWInxQhodLhWyJ1xwpMXh9s4esejoC8F3N/nL4/gDGwg5Co+
        q0/MPsCAqVbxZ3jiaHKztdRjXfgmj3+sy/DTcrnIDHi+fPHB2Vl/jcwNID8xLuC85qn82Q
        OQQt7z19eF8ZtIv1phGvRfjoqa2d9z65DDHKvrZaPfF4XICMQ1NrNcVMtVcRwA==
Date:   Mon, 14 Jun 2021 17:42:26 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH v2 2/2] clocksource: Ingenic: Add SMP/SMT support for
 sysost driver.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, daniel.lezcano@linaro.org,
        tglx@linutronix.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <QEAPUQ.HGLUYKP0W4ZH@opendingux.net>
In-Reply-To: <20210612234243.69b68d7e@zhouyanjie-virtual-machine>
References: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1622824306-30987-3-git-send-email-zhouyanjie@wanyeetech.com>
        <8ESHUQ.VB8PTX94HN193@crapouillou.net>
        <28c290db-d382-ac96-62c9-cf38fd367714@wanyeetech.com>
        <GPNJUQ.ZA1NJ09Y47YY2@opendingux.net>
        <20210612234243.69b68d7e@zhouyanjie-virtual-machine>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le sam., juin 12 2021 at 23:48:38 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Hi Paul,
>=20
> =E4=BA=8E Fri, 11 Jun 2021 16:44:04 +0100
> Paul Cercueil <paul@opendingux.net> =E5=86=99=E9=81=93:
>=20
>>  Hi Zhou,
>>=20
>>  Le ven., juin 11 2021 at 23:31:57 +0800, Zhou Yanjie
>>  <zhouyu@wanyeetech.com> a =C3=A9crit :
>>  > Hi Paul,
>>  >
>>  > On 2021/6/10 =E4=B8=8B=E5=8D=8811:30, Paul Cercueil wrote:
>>  >> Hi Zhou,
>>  >>
>>  >> Le sam., juin 5 2021 at 00:31:46 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 =
(Zhou Yanjie)
>>  >> =7F<zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>  >>> The OST in Ingenic XBurst=C2=AE2 SoCs such as X2000 and X2100, has =
a
>>  >>> global
>>  >>> timer and two or four percpu timers, add support for the percpu
>>  >>> timers.
>>  >>>
>>  >>> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
>> <zhouyanjie@wanyeetech.com>
>>  >>> ---
>>  >>>
>>  >>> Notes:
>>  >>>     v1->v2:
>>  >>>     1.Fix bug in ingenic_ost_global_timer_recalc_rate().
>>  >>>     2.Add a backpointer to the ingenic_ost structure.
>>  >>>     3.Remove unnecessary spinlock.
>>  >>>     4.Use "ret =3D ost->irq" instead "ret =3D -EINVAL".
>>  >>>     5.Use "%d" instead "%x" in pr_crit().
>>  >>
>>  >> I can't shake the feeling that you are doing way too many things
>>  >> in =7Fone single commit.
>>  >>
>>  >> From what I can see, this commit can be split in 4 patches:
>>  >>
>>  >> - Fix the "%x" in pr_crit(),
>>  >> - Add the global timer support to the X1000,
>>  >> - Add "ingenic_ost_timer" and update the code to use it,
>>  >> - Finally add X2000 support.
>>  >>
>>  >>
>>  >
>>  > Sure.
>>  >
>>  >
>>  >>
>>  >>>  drivers/clocksource/ingenic-sysost.c | 315
>>  >>> =7F=7F++++++++++++++++++++++++++---------
>>  >>>  1 file changed, 236 insertions(+), 79 deletions(-)
>>  >>>
>>  >>> diff --git a/drivers/clocksource/ingenic-sysost.c
>>  >>> =7F=7Fb/drivers/clocksource/ingenic-sysost.c
>>  >>> index a129840..6f080e4 100644
>>  >>> --- a/drivers/clocksource/ingenic-sysost.c
>>  >>> +++ b/drivers/clocksource/ingenic-sysost.c
>>  >>> @@ -4,6 +4,7 @@
>>  >>>   * Copyright (c) 2020 =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
>>  >>> <zhouyanjie@wanyeetech.com>
>>  >>>   */
>>  >>>
>>  >>> +#include <linux/bitfield.h>
>>  >>>  #include <linux/bitops.h>
>>  >>>  #include <linux/clk.h>
>>  >>>  #include <linux/clk-provider.h>
>>  >>> @@ -13,6 +14,8 @@
>>  >>>  #include <linux/mfd/syscon.h>
>>  >>>  #include <linux/of_address.h>
>>  >>>  #include <linux/of_irq.h>
>>  >>> +#include <linux/of_platform.h>
>>  >>> +#include <linux/overflow.h>
>>  >>>  #include <linux/sched_clock.h>
>>  >>>  #include <linux/slab.h>
>>  >>>  #include <linux/syscore_ops.h>
>>  >>> @@ -21,10 +24,14 @@
>>  >>>
>>  >>>  /* OST register offsets */
>>  >>>  #define OST_REG_OSTCCR            0x00
>>  >>> +#define OST_REG_OSTER            0x04
>>  >>>  #define OST_REG_OSTCR            0x08
>>  >>>  #define OST_REG_OSTFR            0x0c
>>  >>> +#define OST_REG_OSTCNTH            0x0c
>>  >>>  #define OST_REG_OSTMR            0x10
>>  >>> +#define OST_REG_OSTCNTL            0x10
>>  >>>  #define OST_REG_OST1DFR            0x14
>>  >>> +#define OST_REG_OSTCNTB            0x14
>>  >>>  #define OST_REG_OST1CNT            0x18
>>  >>>  #define OST_REG_OST2CNTL        0x20
>>  >>>  #define OST_REG_OSTCNT2HBUF        0x24
>>  >>> @@ -55,13 +62,23 @@
>>  >>>  #define OSTECR_OST1ENC            BIT(0)
>>  >>>  #define OSTECR_OST2ENC            BIT(1)
>>  >>>
>>  >>> +enum ingenic_ost_version {
>>  >>> +    ID_X1000,
>>  >>> +    ID_X2000,
>>  >>> +};
>>  >>> +
>>  >>>  struct ingenic_soc_info {
>>  >>> +    enum ingenic_ost_version version;
>>  >>> +    const struct ingenic_ost_clk_info *clk_info;
>>  >>> +
>>  >>>      unsigned int num_channels;
>>  >>> +    unsigned int base_offset;
>>  >>>  };
>>  >>>
>>  >>>  struct ingenic_ost_clk_info {
>>  >>>      struct clk_init_data init_data;
>>  >>> -    u8 ostccr_reg;
>>  >>> +    unsigned int idx;
>>  >>> +    u32 ostcntl_reg;
>>  >>>  };
>>  >>>
>>  >>>  struct ingenic_ost_clk {
>>  >>> @@ -71,15 +88,27 @@ struct ingenic_ost_clk {
>>  >>>      const struct ingenic_ost_clk_info *info;
>>  >>>  };
>>  >>>
>>  >>> +struct ingenic_ost_timer {
>>  >>> +    void __iomem *base;
>>  >>> +    unsigned int cpu;
>>  >>> +    unsigned int channel;
>>  >>> +    struct clock_event_device cevt;
>>  >>> +    struct ingenic_ost *ost;
>>  >>> +    struct clk *clk;
>>  >>> +    char name[20];
>>  >>> +};
>>  >>> +
>>  >>>  struct ingenic_ost {
>>  >>>      void __iomem *base;
>>  >>>      const struct ingenic_soc_info *soc_info;
>>  >>> -    struct clk *clk, *percpu_timer_clk, *global_timer_clk;
>>  >>> -    struct clock_event_device cevt;
>>  >>> +    struct clk *clk, *global_timer_clk;
>>  >>> +    struct device_node *np;
>>  >>>      struct clocksource cs;
>>  >>> -    char name[20];
>>  >>>
>>  >>>      struct clk_hw_onecell_data *clocks;
>>  >>> +    struct ingenic_ost_timer __percpu *timers;
>>  >>> +
>>  >>> +    int irq;
>>  >>>  };
>>  >>>
>>  >>>  static struct ingenic_ost *ingenic_ost;
>>  >>> @@ -94,11 +123,12 @@ static unsigned long
>>  >>> =7F=7Fingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
>>  >>>  {
>>  >>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>  >>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>  >>> +    struct ingenic_ost_timer *timer =3D
>>  >>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>  >>>      unsigned int prescale;
>>  >>>
>>  >>> -    prescale =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>  >>> +    prescale =3D readl(timer->base + OST_REG_OSTCCR);
>>  >>>
>>  >>> -    prescale =3D (prescale & OSTCCR_PRESCALE1_MASK) >>
>>  >>> =7F=7FOSTCCR_PRESCALE1_LSB;
>>  >>> +    prescale =3D FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
>>  >>>
>>  >>>      return parent_rate >> (prescale * 2);
>>  >>>  }
>>  >>> @@ -108,11 +138,15 @@ static unsigned long
>>  >>> =7F=7Fingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
>>  >>>  {
>>  >>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>  >>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>  >>> +    struct ingenic_ost_timer *timer =3D
>>  >>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>  >>>      unsigned int prescale;
>>  >>>
>>  >>> -    prescale =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>  >>> +    prescale =3D readl(timer->base + OST_REG_OSTCCR);
>>  >>>
>>  >>> -    prescale =3D (prescale & OSTCCR_PRESCALE2_MASK) >>
>>  >>> =7F=7FOSTCCR_PRESCALE2_LSB;
>>  >>> +    if (ost_clk->ost->soc_info->version >=3D ID_X2000)
>>  >>> +        prescale =3D FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
>>  >>> +    else
>>  >>> +        prescale =3D FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
>>  >>>
>>  >>>      return parent_rate >> (prescale * 2);
>>  >>>  }
>>  >>> @@ -147,12 +181,13 @@ static int
>>  >>> =7F=7Fingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned
>>  >>> long re
>>  >>>  {
>>  >>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>  >>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>  >>> +    struct ingenic_ost_timer *timer =3D
>>  >>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>  >>>      u8 prescale =3D ingenic_ost_get_prescale(parent_rate,
>>  >>> req_rate); int val;
>>  >>>
>>  >>> -    val =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>  >>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>  >>>      val =3D (val & ~OSTCCR_PRESCALE1_MASK) | (prescale <<
>>  >>> =7F=7FOSTCCR_PRESCALE1_LSB);
>>  >>> -    writel(val, ost_clk->ost->base + info->ostccr_reg);
>>  >>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>  >>>
>>  >>>      return 0;
>>  >>>  }
>>  >>> @@ -162,12 +197,18 @@ static int
>>  >>> =7F=7Fingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned
>>  >>> long re
>>  >>>  {
>>  >>>      struct ingenic_ost_clk *ost_clk =3D to_ost_clk(hw);
>>  >>>      const struct ingenic_ost_clk_info *info =3D ost_clk->info;
>>  >>> +    struct ingenic_ost_timer *timer =3D
>>  >>> =7F=7Fper_cpu_ptr(ost_clk->ost->timers, info->idx);
>>  >>>      u8 prescale =3D ingenic_ost_get_prescale(parent_rate,
>>  >>> req_rate); int val;
>>  >>>
>>  >>> -    val =3D readl(ost_clk->ost->base + info->ostccr_reg);
>>  >>> -    val =3D (val & ~OSTCCR_PRESCALE2_MASK) | (prescale <<
>>  >>> =7F=7FOSTCCR_PRESCALE2_LSB);
>>  >>> -    writel(val, ost_clk->ost->base + info->ostccr_reg);
>>  >>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>  >>> +
>>  >>> +    if (ost_clk->ost->soc_info->version >=3D ID_X2000)
>>  >>> +        val =3D (val & ~OSTCCR_PRESCALE1_MASK) | (prescale <<
>>  >>> =7F=7FOSTCCR_PRESCALE1_LSB);
>>  >>> +    else
>>  >>> +        val =3D (val & ~OSTCCR_PRESCALE2_MASK) | (prescale <<
>>  >>> =7F=7FOSTCCR_PRESCALE2_LSB);
>>  >>> +
>>  >>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>  >>>
>>  >>>      return 0;
>>  >>>  }
>>  >>> @@ -195,7 +236,42 @@ static const struct ingenic_ost_clk_info
>>  >>> =7F=7Fx1000_ost_clk_info[] =3D {
>>  >>>              .ops =3D &ingenic_ost_percpu_timer_ops,
>>  >>>              .flags =3D CLK_SET_RATE_UNGATE,
>>  >>>          },
>>  >>> -        .ostccr_reg =3D OST_REG_OSTCCR,
>>  >>> +        .idx =3D 0,
>>  >>> +    },
>>  >>> +
>>  >>> +    [OST_CLK_GLOBAL_TIMER] =3D {
>>  >>> +        .init_data =3D {
>>  >>> +            .name =3D "global timer",
>>  >>> +            .parent_names =3D ingenic_ost_clk_parents,
>>  >>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>  >>> +            .ops =3D &ingenic_ost_global_timer_ops,
>>  >>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>  >>> +        },
>>  >>> +        .ostcntl_reg =3D OST_REG_OST2CNTL,
>>  >>> +    },
>>  >>> +};
>>  >>> +
>>  >>> +static const struct ingenic_ost_clk_info x2000_ost_clk_info[]=20
>> =3D {
>>  >>> +    [OST_CLK_PERCPU_TIMER0] =3D {
>>  >>> +        .init_data =3D {
>>  >>> +            .name =3D "percpu timer0",
>>  >>> +            .parent_names =3D ingenic_ost_clk_parents,
>>  >>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>  >>> +            .ops =3D &ingenic_ost_percpu_timer_ops,
>>  >>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>  >>> +        },
>>  >>> +        .idx =3D 0,
>>  >>> +    },
>>  >>> +
>>  >>> +    [OST_CLK_PERCPU_TIMER1] =3D {
>>  >>> +        .init_data =3D {
>>  >>> +            .name =3D "percpu timer1",
>>  >>> +            .parent_names =3D ingenic_ost_clk_parents,
>>  >>> +            .num_parents =3D ARRAY_SIZE(ingenic_ost_clk_parents),
>>  >>> +            .ops =3D &ingenic_ost_percpu_timer_ops,
>>  >>> +            .flags =3D CLK_SET_RATE_UNGATE,
>>  >>> +        },
>>  >>> +        .idx =3D 1,
>>  >>>      },
>>  >>>
>>  >>>      [OST_CLK_GLOBAL_TIMER] =3D {
>>  >>> @@ -206,7 +282,7 @@ static const struct ingenic_ost_clk_info
>>  >>> =7F=7Fx1000_ost_clk_info[] =3D {
>>  >>>              .ops =3D &ingenic_ost_global_timer_ops,
>>  >>>              .flags =3D CLK_SET_RATE_UNGATE,
>>  >>>          },
>>  >>> -        .ostccr_reg =3D OST_REG_OSTCCR,
>>  >>> +        .ostcntl_reg =3D OST_REG_OSTCNTL,
>>  >>>      },
>>  >>>  };
>>  >>>
>>  >>> @@ -215,7 +291,7 @@ static u64 notrace
>>  >>> =7F=7Fingenic_ost_global_timer_read_cntl(void)
>>  >>>      struct ingenic_ost *ost =3D ingenic_ost;
>>  >>>      unsigned int count;
>>  >>>
>>  >>> -    count =3D readl(ost->base + OST_REG_OST2CNTL);
>>  >>> +    count =3D readl(ost->base +
>>  >>> ost->soc_info->clk_info->ostcntl_reg);
>>  >>>
>>  >>>      return count;
>>  >>>  }
>>  >>> @@ -225,16 +301,21 @@ static u64 notrace
>>  >>> =7F=7Fingenic_ost_clocksource_read(struct clocksource *cs)
>>  >>>      return ingenic_ost_global_timer_read_cntl();
>>  >>>  }
>>  >>>
>>  >>> -static inline struct ingenic_ost *to_ingenic_ost(struct
>>  >>> =7F=7Fclock_event_device *evt)
>>  >>> +static inline struct ingenic_ost_timer *
>>  >>> +to_ingenic_ost_timer(struct clock_event_device *evt)
>>  >>>  {
>>  >>> -    return container_of(evt, struct ingenic_ost, cevt);
>>  >>> +    return container_of(evt, struct ingenic_ost_timer, cevt);
>>  >>>  }
>>  >>>
>>  >>>  static int ingenic_ost_cevt_set_state_shutdown(struct
>>  >>> =7F=7Fclock_event_device *evt)
>>  >>>  {
>>  >>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>  >>> +    struct ingenic_ost_timer *timer =3D=20
>> to_ingenic_ost_timer(evt);
>>  >>> +    struct ingenic_ost *ost =3D timer->ost;
>>  >>>
>>  >>> -    writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000)
>>  >>> +        writel(0, timer->base + OST_REG_OSTER);
>>  >>> +    else
>>  >>> +        writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
>>  >>>
>>  >>>      return 0;
>>  >>>  }
>>  >>> @@ -242,26 +323,34 @@ static int
>>  >>> =7F=7Fingenic_ost_cevt_set_state_shutdown(struct clock_event_device
>>  >>> *evt)
>>  >>>  static int ingenic_ost_cevt_set_next(unsigned long next,
>>  >>>                       struct clock_event_device *evt)
>>  >>>  {
>>  >>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>  >>> -
>>  >>> -    writel((u32)~OSTFR_FFLAG, ost->base + OST_REG_OSTFR);
>>  >>> -    writel(next, ost->base + OST_REG_OST1DFR);
>>  >>> -    writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
>>  >>> -    writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTESR);
>>  >>> -    writel((u32)~OSTMR_FMASK, ost->base + OST_REG_OSTMR);
>>  >>> +    struct ingenic_ost_timer *timer =3D=20
>> to_ingenic_ost_timer(evt);
>>  >>> +    struct ingenic_ost *ost =3D timer->ost;
>>  >>> +
>>  >>> +    writel((u32)~OSTFR_FFLAG, timer->base + OST_REG_OSTFR);
>>  >>> +    writel(next, timer->base + OST_REG_OST1DFR);
>>  >>> +    writel(OSTCR_OST1CLR, timer->base + OST_REG_OSTCR);
>>  >>> +
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>  >>> +        writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTER);
>>  >>> +    } else {
>>  >>> +        writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTESR);
>>  >>> +        writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
>>  >>> +    }
>>  >>>
>>  >>>      return 0;
>>  >>>  }
>>  >>>
>>  >>>  static irqreturn_t ingenic_ost_cevt_cb(int irq, void *dev_id)
>>  >>>  {
>>  >>> -    struct clock_event_device *evt =3D dev_id;
>>  >>> -    struct ingenic_ost *ost =3D to_ingenic_ost(evt);
>>  >>> +    struct ingenic_ost_timer *timer =3D dev_id;
>>  >>> +    struct ingenic_ost *ost =3D timer->ost;
>>  >>>
>>  >>> -    writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000)
>>  >>> +        writel(0, timer->base + OST_REG_OSTER);
>>  >>> +    else
>>  >>> +        writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
>>  >>>
>>  >>> -    if (evt->event_handler)
>>  >>> -        evt->event_handler(evt);
>>  >>> +    timer->cevt.event_handler(&timer->cevt);
>>  >>>
>>  >>>      return IRQ_HANDLED;
>>  >>>  }
>>  >>> @@ -271,6 +360,7 @@ static int __init
>>  >>> =7F=7Fingenic_ost_register_clock(struct ingenic_ost *ost,
>>  >>>              struct clk_hw_onecell_data *clocks)
>>  >>>  {
>>  >>>      struct ingenic_ost_clk *ost_clk;
>>  >>> +    struct ingenic_ost_timer *timer =3D per_cpu_ptr(ost->timers,
>>  >>> =7F=7Finfo->idx);
>>  >>>      int val, err;
>>  >>>
>>  >>>      ost_clk =3D kzalloc(sizeof(*ost_clk), GFP_KERNEL);
>>  >>> @@ -283,9 +373,9 @@ static int __init
>>  >>> =7F=7Fingenic_ost_register_clock(struct ingenic_ost *ost,
>>  >>>      ost_clk->ost =3D ost;
>>  >>>
>>  >>>      /* Reset clock divider */
>>  >>> -    val =3D readl(ost->base + info->ostccr_reg);
>>  >>> -    val &=3D ~(OSTCCR_PRESCALE1_MASK | OSTCCR_PRESCALE2_MASK);
>>  >>> -    writel(val, ost->base + info->ostccr_reg);
>>  >>> +    val =3D readl(timer->base + OST_REG_OSTCCR);
>>  >>> +    val &=3D ~(OSTCCR_PRESCALE1_MASK);
>>  >>> +    writel(val, timer->base + OST_REG_OSTCCR);
>>  >>>
>>  >>>      err =3D clk_hw_register(NULL, &ost_clk->hw);
>>  >>>      if (err) {
>>  >>> @@ -309,57 +399,51 @@ static struct clk * __init
>>  >>> =7F=7Fingenic_ost_get_clock(struct device_node *np, int id)
>>  >>>      return of_clk_get_from_provider(&args);
>>  >>>  }
>>  >>>
>>  >>> -static int __init ingenic_ost_percpu_timer_init(struct
>>  >>> device_node *np,
>>  >>> -                     struct ingenic_ost *ost)
>>  >>> +static int __init ingenic_ost_setup_cevt(unsigned int cpu)
>>  >>>  {
>>  >>> -    unsigned int timer_virq, channel =3D OST_CLK_PERCPU_TIMER;
>>  >>> +    struct ingenic_ost *ost =3D ingenic_ost;
>>  >>> +    struct ingenic_ost_timer *timer =3D=20
>> this_cpu_ptr(ost->timers);
>>  >>>      unsigned long rate;
>>  >>>      int err;
>>  >>>
>>  >>> -    ost->percpu_timer_clk =3D ingenic_ost_get_clock(np, channel);
>>  >>> -    if (IS_ERR(ost->percpu_timer_clk))
>>  >>> -        return PTR_ERR(ost->percpu_timer_clk);
>>  >>> +    timer->clk =3D ingenic_ost_get_clock(ost->np,=20
>> timer->channel);
>>  >>> +    if (IS_ERR(timer->clk))
>>  >>> +        return PTR_ERR(timer->clk);
>>  >>>
>>  >>> -    err =3D clk_prepare_enable(ost->percpu_timer_clk);
>>  >>> +    err =3D clk_prepare_enable(timer->clk);
>>  >>>      if (err)
>>  >>>          goto err_clk_put;
>>  >>>
>>  >>> -    rate =3D clk_get_rate(ost->percpu_timer_clk);
>>  >>> +    rate =3D clk_get_rate(timer->clk);
>>  >>>      if (!rate) {
>>  >>>          err =3D -EINVAL;
>>  >>>          goto err_clk_disable;
>>  >>>      }
>>  >>>
>>  >>> -    timer_virq =3D of_irq_get(np, 0);
>>  >>> -    if (!timer_virq) {
>>  >>> -        err =3D -EINVAL;
>>  >>> -        goto err_clk_disable;
>>  >>> -    }
>>  >>> +    snprintf(timer->name, sizeof(timer->name), "OST percpu
>>  >>> timer%u", =7F=7Fcpu);
>>  >>>
>>  >>> -    snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
>>  >>> +    /* Unmask full comparison match interrupt */
>>  >>> +    writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
>>  >>>
>>  >>> -    err =3D request_irq(timer_virq, ingenic_ost_cevt_cb,
>>  >>> IRQF_TIMER,
>>  >>> -              ost->name, &ost->cevt);
>>  >>> -    if (err)
>>  >>> -        goto err_irq_dispose_mapping;
>>  >>> +    timer->cpu =3D smp_processor_id();
>>  >>> +    timer->cevt.cpumask =3D cpumask_of(smp_processor_id());
>>  >>> +    timer->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
>>  >>> +    timer->cevt.name =3D timer->name;
>>  >>> +    timer->cevt.rating =3D 400;
>>  >>> +    timer->cevt.set_state_shutdown =3D
>>  >>> =7F=7Fingenic_ost_cevt_set_state_shutdown;
>>  >>> +    timer->cevt.set_next_event =3D ingenic_ost_cevt_set_next;
>>  >>>
>>  >>> -    ost->cevt.cpumask =3D cpumask_of(smp_processor_id());
>>  >>> -    ost->cevt.features =3D CLOCK_EVT_FEAT_ONESHOT;
>>  >>> -    ost->cevt.name =3D ost->name;
>>  >>> -    ost->cevt.rating =3D 400;
>>  >>> -    ost->cevt.set_state_shutdown =3D
>>  >>> ingenic_ost_cevt_set_state_shutdown;
>>  >>> -    ost->cevt.set_next_event =3D ingenic_ost_cevt_set_next;
>>  >>> +    clockevents_config_and_register(&timer->cevt, rate, 4,
>>  >>> 0xffffffff);
>>  >>>
>>  >>> -    clockevents_config_and_register(&ost->cevt, rate, 4,
>>  >>> 0xffffffff);
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000)
>>  >>> +        enable_percpu_irq(ost->irq, IRQ_TYPE_NONE);
>>  >>>
>>  >>>      return 0;
>>  >>>
>>  >>> -err_irq_dispose_mapping:
>>  >>> -    irq_dispose_mapping(timer_virq);
>>  >>>  err_clk_disable:
>>  >>> -    clk_disable_unprepare(ost->percpu_timer_clk);
>>  >>> +    clk_disable_unprepare(timer->clk);
>>  >>>  err_clk_put:
>>  >>> -    clk_put(ost->percpu_timer_clk);
>>  >>> +    clk_put(timer->clk);
>>  >>>      return err;
>>  >>>  }
>>  >>>
>>  >>> @@ -385,11 +469,14 @@ static int __init
>>  >>> =7F=7Fingenic_ost_global_timer_init(struct device_node *np,
>>  >>>          goto err_clk_disable;
>>  >>>      }
>>  >>>
>>  >>> -    /* Clear counter CNT registers */
>>  >>> -    writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
>>  >>> -
>>  >>> -    /* Enable OST channel */
>>  >>> -    writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
>>  >>> +    /* Clear counter CNT registers and enable OST channel */
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>  >>> +        writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
>>  >>> +        writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTER);
>>  >>> +    } else {
>>  >>> +        writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
>>  >>> +        writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
>>  >>> +    }
>>  >>>
>>  >>>      cs->name =3D "ingenic-ost";
>>  >>>      cs->rating =3D 400;
>>  >>> @@ -411,18 +498,33 @@ static int __init
>>  >>> =7F=7Fingenic_ost_global_timer_init(struct device_node *np,
>>  >>>  }
>>  >>>
>>  >>>  static const struct ingenic_soc_info x1000_soc_info =3D {
>>  >>> +    .version =3D ID_X1000,
>>  >>> +    .clk_info =3D x1000_ost_clk_info,
>>  >>> +
>>  >>>      .num_channels =3D 2,
>>  >>>  };
>>  >>>
>>  >>> +static const struct ingenic_soc_info x2000_soc_info =3D {
>>  >>> +    .version =3D ID_X2000,
>>  >>> +    .clk_info =3D x2000_ost_clk_info,
>>  >>> +
>>  >>> +    .num_channels =3D 3,
>>  >>> +    .base_offset =3D 0x100,
>>  >>> +};
>>  >>> +
>>  >>>  static const struct of_device_id __maybe_unused
>>  >>> =7F=7Fingenic_ost_of_matches[] __initconst =3D {
>>  >>>      { .compatible =3D "ingenic,x1000-ost", .data =3D
>>  >>> &x1000_soc_info },
>>  >>> +    { .compatible =3D "ingenic,x2000-ost", .data =3D
>>  >>> &x2000_soc_info }, { /* sentinel */ }
>>  >>>  };
>>  >>>
>>  >>>  static int __init ingenic_ost_probe(struct device_node *np)
>>  >>>  {
>>  >>>      const struct of_device_id *id =3D
>>  >>> =7F=7Fof_match_node(ingenic_ost_of_matches, np);
>>  >>> +    struct ingenic_ost_timer *timer;
>>  >>>      struct ingenic_ost *ost;
>>  >>> +    void __iomem *base;
>>  >>> +    unsigned int cpu;
>>  >>>      unsigned int i;
>>  >>>      int ret;
>>  >>>
>>  >>> @@ -430,18 +532,43 @@ static int __init ingenic_ost_probe(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>      if (!ost)
>>  >>>          return -ENOMEM;
>>  >>>
>>  >>> +    ost->timers =3D alloc_percpu(struct ingenic_ost_timer);
>>  >>> +    if (!ost->timers) {
>>  >>> +        ret =3D -ENOMEM;
>>  >>> +        goto err_free_ost;
>>  >>> +    }
>>  >>> +
>>  >>> +    ost->np =3D np;
>>  >>> +    ost->soc_info =3D id->data;
>>  >>> +
>>  >>>      ost->base =3D of_io_request_and_map(np, 0,
>>  >>> of_node_full_name(np));
>>  >>>      if (IS_ERR(ost->base)) {
>>  >>>          pr_err("%s: Failed to map OST registers\n", __func__);
>>  >>>          ret =3D PTR_ERR(ost->base);
>>  >>> -        goto err_free_ost;
>>  >>> +        goto err_free_timers;
>>  >>> +    }
>>  >>> +
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000) {
>>  >>> +        base =3D of_io_request_and_map(np, 1,
>>  >>> of_node_full_name(np));
>>  >>> +        if (IS_ERR(base)) {
>>  >>> +            pr_err("%s: Failed to map OST registers\n",
>>  >>> __func__);
>>  >>> +            ret =3D PTR_ERR(base);
>>  >>> +            goto err_free_timers;
>>  >>> +        }
>>  >>> +    }
>>  >>
>>  >> The DT documentation only mentions one memory resource. Here, you
>>  >> map =7Fa second one, which is not used anywhere. I'm really=20
>> confused
>>  >> about =7Fwhat you're trying to do here.
>>  >>
>>  >
>>  > X2000 and X2100 divide the OST into two parts. The global timer is
>>  > the first part, which is still located at the address of=20
>> 0x12000000,
>>  > and the percpu timers are the second part, the starting address is
>>  > 0x12100000, and each timer is offset by 0x100 (percpu timer0 is at
>>  > 0x12100000, percpu timer1 is at 0x12100100, percpu timer2 is at
>>  > 0x12100200, percpu timer3 is at 0x12100300). This one is used in
>>  > line 593 of the code.
>>=20
>>  Then you need two different DT nodes, one at each start address.
>>  Either use different drivers (since the register sets are=20
>> different),
>>  or *if* it can be implemented cleanly in ingenic-sysost.c, different
>>  compatible strings - one for the global timer and one for the percpu
>>  timers.
>=20
> Sorry, I did not describe it clearly. Although the global timer and
> percpu timers are divided into two parts, they still belong to the=20
> same
> hardware module. The base address of the entire module is 0x12000000,
> but the control register of the global timer is not shifted. The=20
> percpu
> timers are shifted by 0x100000 as a whole (the situation here is
> similar to PDMA, which is also divided into two parts: the
> channel-related registers are not shifted, while the system
> control-related registers are shifted by 0x1000 as a whole). I think
> maybe we can follow PDMA's approach and add corresponding instructions
> in the DT documentation. This can avoid confusion caused by splitting
> different parts of the same hardware module into two nodes, and at the
> same time keep the code of the devicetree as simple and clear as
> possible.
>=20
> What do you think about that?

Looking at the programming manual, these are not the same hardware=20
module. They are on different addresses, are functionally independent,=20
and are even described in different chapters of the PM; so I stick to=20
what I said earlier.

Cheers,
-Paul

> Thanks and best regards!
>=20
>>=20
>>  -Paul
>>=20
>>  >>> +
>>  >>> +    ost->irq =3D irq_of_parse_and_map(np, 0);
>>  >>> +    if (ost->irq < 0) {
>>  >>> +        pr_crit("%s: Cannot to get OST IRQ\n", __func__);
>>  >>> +        ret =3D ost->irq;
>>  >>> +        goto err_free_timers;
>>  >>>      }
>>  >>>
>>  >>>      ost->clk =3D of_clk_get_by_name(np, "ost");
>>  >>>      if (IS_ERR(ost->clk)) {
>>  >>> -        ret =3D PTR_ERR(ost->clk);
>>  >>>          pr_crit("%s: Cannot get OST clock\n", __func__);
>>  >>> -        goto err_free_ost;
>>  >>> +        ret =3D PTR_ERR(ost->clk);
>>  >>> +        goto err_free_timers;
>>  >>>      }
>>  >>>
>>  >>>      ret =3D clk_prepare_enable(ost->clk);
>>  >>> @@ -450,8 +577,6 @@ static int __init ingenic_ost_probe(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>          goto err_put_clk;
>>  >>>      }
>>  >>>
>>  >>> -    ost->soc_info =3D id->data;
>>  >>> -
>>  >>>      ost->clocks =3D kzalloc(struct_size(ost->clocks, hws,
>>  >>> =7F=7Fost->soc_info->num_channels),
>>  >>>                    GFP_KERNEL);
>>  >>>      if (!ost->clocks) {
>>  >>> @@ -461,8 +586,21 @@ static int __init ingenic_ost_probe(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>
>>  >>>      ost->clocks->num =3D ost->soc_info->num_channels;
>>  >>>
>>  >>> -    for (i =3D 0; i < ost->clocks->num; i++) {
>>  >>> -        ret =3D ingenic_ost_register_clock(ost, i,
>>  >>> =7F=7F&x1000_ost_clk_info[i], ost->clocks);
>>  >>> +    for (cpu =3D 0; cpu < num_possible_cpus(); cpu++) {
>>  >>> +        timer =3D per_cpu_ptr(ost->timers, cpu);
>>  >>> +
>>  >>> +        if (ost->soc_info->version >=3D ID_X2000)
>>  >>> +            timer->base =3D base + ost->soc_info->base_offset *
>>  >>> cpu;
>>  >>> +        else
>>  >>> +            timer->base =3D ost->base;
>>  >>> +
>>  >>> +        timer->ost =3D ost;
>>  >>> +        timer->cpu =3D cpu;
>>  >>> +        timer->channel =3D OST_CLK_PERCPU_TIMER + cpu;
>>  >>> +    }
>>  >>> +
>>  >>> +    for (i =3D 0; i < num_possible_cpus() + 1; i++) {
>>  >>> +        ret =3D ingenic_ost_register_clock(ost, i,
>>  >>> =7F=7F&ost->soc_info->clk_info[i], ost->clocks);
>>  >>>          if (ret) {
>>  >>>              pr_crit("%s: Cannot register clock %d\n", __func__,
>>  >>> i); goto err_unregister_ost_clocks;
>>  >>> @@ -488,6 +626,8 @@ static int __init ingenic_ost_probe(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>      clk_disable_unprepare(ost->clk);
>>  >>>  err_put_clk:
>>  >>>      clk_put(ost->clk);
>>  >>> +err_free_timers:
>>  >>> +    free_percpu(ost->timers);
>>  >>>  err_free_ost:
>>  >>>      kfree(ost);
>>  >>>      return ret;
>>  >>> @@ -513,13 +653,29 @@ static int __init ingenic_ost_init(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>
>>  >>>      ret =3D ingenic_ost_global_timer_init(np, ost);
>>  >>>      if (ret) {
>>  >>> -        pr_crit("%s: Unable to init global timer: %x\n",
>>  >>> __func__, =7F=7Fret);
>>  >>> +        pr_crit("%s: Unable to init global timer: %d\n",
>>  >>> __func__, =7F=7Fret);
>>  >>
>>  >> This is a fix, so it needs to be a separate commit with a Fixes:
>>  >> tag.
>>  >
>>  >
>>  > Sure.
>>  >
>>  >
>>  > Thanks and best regards!
>>  >
>>  >
>>  >>
>>  >> Cheers,
>>  >> -Paul
>>  >>
>>  >>>          goto err_free_ingenic_ost;
>>  >>>      }
>>  >>>
>>  >>> -    ret =3D ingenic_ost_percpu_timer_init(np, ost);
>>  >>> -    if (ret)
>>  >>> +    if (ost->soc_info->version >=3D ID_X2000)
>>  >>> +        ret =3D request_percpu_irq(ost->irq, ingenic_ost_cevt_cb,
>>  >>> +                  "OST percpu timer", ost->timers);
>>  >>> +    else
>>  >>> +        ret =3D request_irq(ost->irq, ingenic_ost_cevt_cb,
>>  >>> IRQF_TIMER,
>>  >>> +                  "OST percpu timer", ost->timers);
>>  >>> +
>>  >>> +    if (ret) {
>>  >>> +        pr_crit("%s: Unable to request percpu IRQ: %d\n",
>>  >>> __func__, =7F=7Fret);
>>  >>> +        goto err_ost_global_timer_cleanup;
>>  >>> +    }
>>  >>> +
>>  >>> +    /* Setup clock events on each CPU core */
>>  >>> +    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic
>>  >>> XBurst: =7F=7Fonline",
>>  >>> +                ingenic_ost_setup_cevt, NULL);
>>  >>> +    if (ret < 0) {
>>  >>> +        pr_crit("%s: Unable to init percpu timers: %d\n",
>>  >>> __func__, =7F=7Fret);
>>  >>>          goto err_ost_global_timer_cleanup;
>>  >>> +    }
>>  >>>
>>  >>>      /* Register the sched_clock at the end as there's no way to
>>  >>> undo =7F=7Fit */
>>  >>>      rate =3D clk_get_rate(ost->global_timer_clk);
>>  >>> @@ -537,3 +693,4 @@ static int __init ingenic_ost_init(struct
>>  >>> =7F=7Fdevice_node *np)
>>  >>>  }
>>  >>>
>>  >>>  TIMER_OF_DECLARE(x1000_ost,  "ingenic,x1000-ost",
>>  >>> ingenic_ost_init);
>>  >>> +TIMER_OF_DECLARE(x2000_ost,  "ingenic,x2000-ost",
>>  >>> ingenic_ost_init);
>>  >>> --
>>  >>> 2.7.4
>>  >>>
>>  >>
>>=20
>=20


