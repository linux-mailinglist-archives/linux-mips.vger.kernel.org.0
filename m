Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C716F7AE2
	for <lists+linux-mips@lfdr.de>; Fri,  5 May 2023 04:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjEEC2d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 May 2023 22:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjEEC2c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 May 2023 22:28:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C9CAD37;
        Thu,  4 May 2023 19:28:30 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-b9a7c1b86e8so1595998276.2;
        Thu, 04 May 2023 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683253709; x=1685845709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQTwCtOioJF8t/OiNx/dPasS+fdTMROa/SSWtKZQgKs=;
        b=JIWVovMpQ3sB1Y2LItd2ey9cLqND5SVtLG/8J4+W6kJJosibN1+m8+ousRJlYRLjms
         pFD42ttOvGyeO0vBmCLohiRM/cmdb3MEslUpdzxtDeEqb0XLI+Nv88W8baeZka2pUK83
         UTCAQNM/6duTyT8/c5ngSJaFw6ocRwUNOd8mydPI84GdzFbgSAKdJbqJWJl6Nl/W66tN
         UmAVwigIsyaIH5OWjFSQe6cYlBKFaE87zB7VL/4zOcbCDjMOiP0Ccha1IjsgDeyh3uuZ
         LnBOZEHjyUntMlacBaSUb5kDv5FC8cFQXH8xoReYqYbVlcDa0rK8idPo2sG0u2pCrByo
         Rlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683253709; x=1685845709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQTwCtOioJF8t/OiNx/dPasS+fdTMROa/SSWtKZQgKs=;
        b=U0y3VKZRMnV3mV4rdWJyJ+whKM/BWkvjYVCyD1tdCw8PwB7F5whLsIv9zc/4UUG1+S
         pQBWDhaGgRoiIE9Z4bGpJ8FGOhluxnaS7LsMGVzr1j1YvPOjKwfV3QqtUPj0UKH2FYeU
         Y5XFPe7EwkFZ1rzzbYM7JxGeen+ZtzncWA7+M7NZtNFdXGMtxOHt8YXS5iGhyh9Jw6x8
         mbXmerphyBTd8QUyPztZHtmInvmMChgaXo/+29vLqyUsjbUy5m1YCX8NqoxFnQ3BHPJM
         dQGx1SaRVNFNP/aWgyP8F/eq2blgh2cJMcj/fCw/rwwRHdEZZnO5x2Bujj/tnEVxdRFK
         5xKg==
X-Gm-Message-State: AC+VfDy2cyC+aU9ifwWSf0gIJfKPLqqIePhoEOkAFbCMDc1VfUIDnrhS
        Xa2ATkOe/1AydjNlbINis7cXwAvD0gGzcQo88vY=
X-Google-Smtp-Source: ACHHUZ6s8kmM5Dp5ih24Bs2hjigFmkgmEJakDis6EgSGdU/4H1aET/JyFpi3QqfwTFH10DYcjaA8FESVKsOzzJ1oQFQ=
X-Received: by 2002:a25:c78f:0:b0:b9a:8298:d873 with SMTP id
 w137-20020a25c78f000000b00b9a8298d873mr30812ybe.49.1683253709325; Thu, 04 May
 2023 19:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681370153.git.zhoubinbin@loongson.cn> <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
 <20230416194901b538cb7c@mail.local>
In-Reply-To: <20230416194901b538cb7c@mail.local>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Fri, 5 May 2023 10:28:16 +0800
Message-ID: <CAMpQs4LhkupxQExQCqg9qJ0eWCzLZEaeKDrJThTVyezz=ne53A@mail.gmail.com>
Subject: Re: [PATCH V3 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, keguang.zhang@gmail.com,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>, zhangbaoqi@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 17, 2023 at 3:49=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 13/04/2023 15:57:34+0800, Binbin Zhou wrote:
> > This RTC module is integrated into the Loongson-2K SoC and the LS7A
> > bridge chip. This version is almost entirely rewritten to make use of
> > current kernel API, and it supports both ACPI and DT.
> >
> > This driver is shared by MIPS-based Loongson-3A4000 system (use FDT) an=
d
> > LoongArch-based Loongson-3A5000 system (use ACPI).
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> > Signed-off-by: WANG Xuerui <git@xen0n.name>
> > ---
> >  drivers/rtc/Kconfig    |  11 ++
> >  drivers/rtc/Makefile   |   1 +
> >  drivers/rtc/rtc-ls2x.c | 345 +++++++++++++++++++++++++++++++++++++++++
>
> This is v3 and this is still not merged in rtc-ls1x.c.

Hi Alexandre:

The ls1x rtc has been merged in at my local repository and Keguang has
helped test it through, so it will be ready for release in the next
version.
In the meantime rtc-ls2x will be renamed to rtc-loongson.

>
> >  3 files changed, 357 insertions(+)
> >  create mode 100644 drivers/rtc/rtc-ls2x.c
> >
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 753872408615..e1b9d64d2678 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1706,6 +1706,17 @@ config RTC_DRV_LPC32XX
> >         This driver can also be built as a module. If so, the module
> >         will be called rtc-lpc32xx.
> >
> > +config RTC_DRV_LS2X
> > +     tristate "Loongson LS2X RTC"
> > +     depends on MACH_LOONGSON64 || COMPILE_TEST
> > +     select REGMAP_MMIO
> > +     help
> > +       If you say yes here you get support for the RTC on the Loongson=
-2K
> > +       SoC and LS7A bridge, which first appeared on the Loongson-2H.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called rtc-ls2x.
> > +
> >  config RTC_DRV_PM8XXX
> >       tristate "Qualcomm PMIC8XXX RTC"
> >       depends on MFD_PM8XXX || MFD_SPMI_PMIC || COMPILE_TEST
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > index ea445d1ebb17..cff5df09fc60 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -82,6 +82,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)     +=3D rtc-ls1x.o
> >  obj-$(CONFIG_RTC_DRV_LP8788) +=3D rtc-lp8788.o
> >  obj-$(CONFIG_RTC_DRV_LPC24XX)        +=3D rtc-lpc24xx.o
> >  obj-$(CONFIG_RTC_DRV_LPC32XX)        +=3D rtc-lpc32xx.o
> > +obj-$(CONFIG_RTC_DRV_LS2X)   +=3D rtc-ls2x.o
> >  obj-$(CONFIG_RTC_DRV_M41T80) +=3D rtc-m41t80.o
> >  obj-$(CONFIG_RTC_DRV_M41T93) +=3D rtc-m41t93.o
> >  obj-$(CONFIG_RTC_DRV_M41T94) +=3D rtc-m41t94.o
> > diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
> > new file mode 100644
> > index 000000000000..c74dd88ae11b
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-ls2x.c
> > @@ -0,0 +1,345 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Loongson-2K/LS7A RTC driver
> > + *
> > + * Based on the original out-of-tree Loongson-2H RTC driver for Linux =
2.6.32,
> > + * by Shaozong Liu <liushaozong@loongson.cn>.
> > + *
> > + * Maintained out-of-tree by Huacai Chen <chenhuacai@kernel.org>.
> > + * Rewritten for mainline by WANG Xuerui <git@xen0n.name>.
> > + *                           Binbin Zhou <zhoubinbin@loongson.cn>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/rtc.h>
> > +#include <linux/acpi.h>
> > +
> > +/* Time Of Year(TOY) counters registers */
> > +#define TOY_TRIM_REG         0x20 /* Must be initialized to 0 */
> > +#define TOY_WRITE0_REG               0x24 /* TOY low 32-bits value (wr=
ite-only) */
> > +#define TOY_WRITE1_REG               0x28 /* TOY high 32-bits value (w=
rite-only) */
> > +#define TOY_READ0_REG                0x2c /* TOY low 32-bits value (re=
ad-only) */
> > +#define TOY_READ1_REG                0x30 /* TOY high 32-bits value (r=
ead-only) */
> > +#define TOY_MATCH0_REG               0x34 /* TOY timing interrupt 0 */
> > +#define TOY_MATCH1_REG               0x38 /* TOY timing interrupt 1 */
> > +#define TOY_MATCH2_REG               0x3c /* TOY timing interrupt 2 */
> > +
> > +/* RTC counters registers */
> > +#define RTC_CTRL_REG         0x40 /* TOY and RTC control register */
> > +#define RTC_TRIM_REG         0x60 /* Must be initialized to 0 */
> > +#define RTC_WRITE0_REG               0x64 /* RTC counters value (write=
-only) */
> > +#define RTC_READ0_REG                0x68 /* RTC counters value (read-=
only) */
> > +#define RTC_MATCH0_REG               0x6c /* RTC timing interrupt 0 */
> > +#define RTC_MATCH1_REG               0x70 /* RTC timing interrupt 1 */
> > +#define RTC_MATCH2_REG               0x74 /* RTC timing interrupt 2 */
> > +
> > +/* bitmask of TOY_WRITE0_REG */
> > +#define TOY_MON                      GENMASK(31, 26)
> > +#define TOY_DAY                      GENMASK(25, 21)
> > +#define TOY_HOUR             GENMASK(20, 16)
> > +#define TOY_MIN                      GENMASK(15, 10)
> > +#define TOY_SEC                      GENMASK(9, 4)
> > +#define TOY_MSEC             GENMASK(3, 0)
> > +
> > +/* bitmask of TOY_MATCH0/1/2_REG */
> > +#define TOY_MATCH_YEAR               GENMASK(31, 26)
> > +#define TOY_MATCH_MON                GENMASK(25, 22)
> > +#define TOY_MATCH_DAY                GENMASK(21, 17)
> > +#define TOY_MATCH_HOUR               GENMASK(16, 12)
> > +#define TOY_MATCH_MIN                GENMASK(11, 6)
> > +#define TOY_MATCH_SEC                GENMASK(5, 0)
> > +
> > +/* bitmask of RTC_CTRL_REG */
> > +#define RTC_ENABLE           BIT(13) /* 1: RTC counters enable */
> > +#define TOY_ENABLE           BIT(11) /* 1: TOY counters enable */
> > +#define OSC_ENABLE           BIT(8) /* 1: 32.768k crystal enable */
> > +#define TOY_ENABLE_MASK              (TOY_ENABLE | OSC_ENABLE)
> > +
> > +/* PM domain registers */
> > +#define PM1_STS_REG          0x0c /* Power management 1 status registe=
r */
> > +#define RTC_STS                      BIT(10) /* RTC status */
> > +#define PM1_EN_REG           0x10 /* Power management 1 enable registe=
r */
> > +#define RTC_EN                       BIT(10) /* RTC event enable */
> > +
> > +/* Offset of PM domain from RTC domain, for rtc alarm */
> > +enum ls2x_pm_offset {
> > +     GENERIC_OFFSET =3D 0x100,
> > +     LS2K1000_OFFSET =3D 0x800,
> > +};
> > +
> > +struct ls2x_rtc_priv {
> > +     spinlock_t lock; /* protects PM registers access */
> > +     int irq;
> > +     struct rtc_device *rtcdev;
> > +     struct regmap *regmap;
> > +     void __iomem *pm_base; /* PM domain base, for rtc alarm */
> > +};
> > +
> > +static const struct regmap_config ls2x_rtc_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +};
> > +
> > +/* IRQ Handlers */
> > +static irqreturn_t ls2x_rtc_isr(int irq, void *id)
> > +{
> > +     struct ls2x_rtc_priv *priv =3D (struct ls2x_rtc_priv *)id;
> > +
> > +     rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static u32 ls2x_rtc_handler(void *id)
> > +{
> > +     u32 ret;
> > +     struct ls2x_rtc_priv *priv =3D (struct ls2x_rtc_priv *)id;
> > +
> > +     spin_lock(&priv->lock);
> > +     /* Disable rtc event */
> > +     writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> > +            priv->pm_base + PM1_EN_REG);
> > +
> > +     /* Clear rtc interrupt status */
> > +     writel(RTC_STS, priv->pm_base + PM1_STS_REG);
> > +     spin_unlock(&priv->lock);
> > +
> > +     /*
> > +      * The TOY_MATCH0_REG should be cleared 0 here,
> > +      * otherwise the interrupt cannot be cleared.
> > +      */
> > +     ret =3D regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> > +     return 0;
> > +}
> > +
> > +static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +     int ret;
> > +     u32 ctrl_data, rtc_data[2];
> > +     struct ls2x_rtc_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +     ret =3D regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (!(ctrl_data & TOY_ENABLE_MASK))
> > +             return -EINVAL;
> > +
> > +     ret =3D regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> > +                            ARRAY_SIZE(rtc_data));
>
> There is still no answer on whether the TOY_READ0_REG and TOY_READ1_REG
> are latched.
>

After talking to colleagues offline, the RTC hardware itself can
guarantee atomicity for bulk reads.

> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     tm->tm_sec =3D FIELD_GET(TOY_SEC, rtc_data[0]);
> > +     tm->tm_min =3D FIELD_GET(TOY_MIN, rtc_data[0]);
> > +     tm->tm_hour =3D FIELD_GET(TOY_HOUR, rtc_data[0]);
> > +     tm->tm_mday =3D FIELD_GET(TOY_DAY, rtc_data[0]);
> > +     tm->tm_mon =3D FIELD_GET(TOY_MON, rtc_data[0]) - 1;
> > +     tm->tm_year =3D rtc_data[1];
> > +
> > +     return 0;
> > +}
> > +
> > +static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +     int ret;
> > +     u32 rtc_data[2];
> > +     struct ls2x_rtc_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +     rtc_data[0] =3D FIELD_PREP(TOY_SEC, tm->tm_sec)
> > +                 | FIELD_PREP(TOY_MIN, tm->tm_min)
> > +                 | FIELD_PREP(TOY_HOUR, tm->tm_hour)
> > +                 | FIELD_PREP(TOY_DAY, tm->tm_mday)
> > +                 | FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> > +     rtc_data[1] =3D tm->tm_year;
> > +
> > +     ret =3D regmap_bulk_write(priv->regmap, TOY_WRITE0_REG, rtc_data,
> > +                             ARRAY_SIZE(rtc_data));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Enable RTC TOY counters and crystal */
> > +     return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_=
MASK,
> > +                               TOY_ENABLE_MASK);
> > +}
> > +
> > +static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *=
alrm)
> > +{
> > +     int ret;
> > +     u32 alarm_data;
> > +     struct ls2x_rtc_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +     ret =3D regmap_read(priv->regmap, TOY_MATCH0_REG, &alarm_data);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     alrm->time.tm_sec =3D FIELD_GET(TOY_MATCH_SEC, alarm_data);
> > +     alrm->time.tm_min =3D FIELD_GET(TOY_MATCH_MIN, alarm_data);
> > +     alrm->time.tm_hour =3D FIELD_GET(TOY_MATCH_HOUR, alarm_data);
> > +     alrm->time.tm_mday =3D FIELD_GET(TOY_MATCH_DAY, alarm_data);
> > +     alrm->time.tm_mon =3D FIELD_GET(TOY_MATCH_MON, alarm_data) - 1;
> > +     /*
> > +      * This is a hardware bug.
> > +      * The year field in the SYS_TOYMATCH has only 6 bits(bits[31:26]=
),
> > +      * so it can only be set from 1900 to 1963.
> > +      * In order to avoid an invalid alarm value during booting, we ma=
nually
> > +      * add 64 after reading the year field (equivalent to filling in =
the
> > +      * high bits).
> > +      */
> > +     alrm->time.tm_year =3D FIELD_GET(TOY_MATCH_YEAR, alarm_data) + 64=
;
>
> This is restricting to the 1964 to 2027 range whereas you claim the RTC
> has a 2000 to 2099 range. Why don't you simply do 2000 to 2063 which
> would at least match most of it.
>

I have compiled a description of this hardware defect:

Firstly, the root cause of the defect is that there are not enough
bits in the MATCH register to indicate the year, only 6 bits.
The rtc hardware uses the MATCH register to compare the alarm time
values and to determine if an alarm is triggered.

Therefore, we have to ensure that the lower 6 bits remain unchanged
during the conversion of the year value . Otherwise the rtc hardware
will definitely not succeed when matching and thus the alarm function
will not work.
In summary, here we can only add or subtract 64 (or a multiple of 64).

To avoid the year being described only up to 2027, how about the
following solution:
1. define the global variable year_offset, which holds the required offset.
2. In ls2x_rtc_read_time(), calculate year_offset =3D tm->tm_year / 64 * 64=
.

> I am very very disappointed. I had all these comments on v1 and v2, you
> are sending v3 with the exact same issues. How can I trust this is ever
> going to progress in the right direction?

I apologise that the time between these two patch sets is a bit long
and I did not double check the relevant change points.
I will double check each point that needs to be changed before sending
out subsequent patches.

Again, I apologise.

Thanks.
Binbin

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
