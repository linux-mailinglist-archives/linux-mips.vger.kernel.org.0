Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF20720062
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 13:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbjFBL2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 07:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjFBL2u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 07:28:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FE51B0;
        Fri,  2 Jun 2023 04:28:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1a4250b07so23048491fa.3;
        Fri, 02 Jun 2023 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685705323; x=1688297323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzFID9w457ATIgySz0VNZOvhIIUavK4gPDC9+kmtPXQ=;
        b=erGYnnMVFJG9lhQ7dmOXV/gXhII9hPtD6ArCu/OXTnOsdBSsNG1WbAvX1PwEYCfpEl
         txh9oTnyhgi4VXpLQ8yr32TOnlUpukTtmrxxNnb/GQ8yH0uRtAUO2U3WR/d3S96GGZ+W
         9h6rMtnbnjU8cy9lqlgw6rYtQ2bZu34oJ1pXYRHQywz3ZT5rLilxGw4mGRJhcQCf1ubH
         pKCj+PFsZ3CinHgea50OQJmbUr03oXVAsJrn0O0C8HR8r6nULKMSXnlVvGyLI9rocOd9
         FzATs/RhpMyzwJ/74gh6Bt4y0V4kFXmE8totaiHViPKDF9JwL1ALNGjO78khcOSPVveg
         oDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685705323; x=1688297323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzFID9w457ATIgySz0VNZOvhIIUavK4gPDC9+kmtPXQ=;
        b=CqTdV3KZKXwmdRdnK8yUZrLuJ5LDYXaYuhQoXdXXb7lMRbJeHLcWI2KSs0YVCbuDCU
         GIqRqsD8yhyrWfzXphYDdquhTcLgBVCCoYE55x+ULbmMUrsWPZ/G2W7QA8WcQ+0w1ld+
         jTO8D0xI298P4UtjQP5p1l40LAmmsncd8GE16PMJOQX6N7jtuYGWm/bpm9VQJ8ZnriUg
         gpmJuigHojGEghfg4Ab09a6hAF9l2pOtcFkHPor/7bp58jpFUhqjHDV94sUFYtpwdCEx
         GkJcEENhQ2EtknGFAHQ4BiptZZlyZkVRiId7dusvhBzdlUFRUaStSAy6sHW43x4BmbIn
         hbNw==
X-Gm-Message-State: AC+VfDxx5ZP7ZU+zpVB1TSDq2Z6occBLMntq7FmsOx3Qa6+deVpx6XXD
        zx0zdwVbBEWf13VaG2CDg4Up6VKwMQE9HszU9zQ=
X-Google-Smtp-Source: ACHHUZ6dPGzGRPMOttn5GYAeSyl8EQywC6OeTD8do36FIEE36h2K1/U9/wIGBqkNDzWUC54Lm2W0mqEKjsmBV0St1AM=
X-Received: by 2002:a2e:9d51:0:b0:2ab:145e:c04a with SMTP id
 y17-20020a2e9d51000000b002ab145ec04amr1301290ljj.17.1685705322490; Fri, 02
 Jun 2023 04:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685693501.git.zhoubinbin@loongson.cn> <0c5171156390f614d72f36ceb04a20f432ca639e.1685693501.git.zhoubinbin@loongson.cn>
In-Reply-To: <0c5171156390f614d72f36ceb04a20f432ca639e.1685693501.git.zhoubinbin@loongson.cn>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Fri, 2 Jun 2023 19:28:25 +0800
Message-ID: <CAJhJPsXAKQtAyatb=uQ8W9f+9TxqUJ_RG+1pSVu5sYvZuzVJ+Q@mail.gmail.com>
Subject: Re: [PATCH V5 3/5] rtc: Add rtc driver for the Loongson family chips
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>, WANG Xuerui <git@xen0n.name>
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

On Fri, Jun 2, 2023 at 5:51=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> The Loongson family chips use an on-chip counter 0 (Time Of Year
> counter) as the RTC. We will refer to them as rtc-loongson.
>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Yang Ling <gnaygnil@gmail.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com>

> ---
>  drivers/rtc/Kconfig        |  13 ++
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-loongson.c | 397 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 411 insertions(+)
>  create mode 100644 drivers/rtc/rtc-loongson.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 599f5110a251..9f5b0afdbad0 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1685,6 +1685,19 @@ config RTC_DRV_JZ4740
>           This driver can also be built as a module. If so, the module
>           will be called rtc-jz4740.
>
> +config RTC_DRV_LOONGSON
> +       tristate "Loongson On-chip RTC"
> +       depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> +       select REGMAP_MMIO
> +       help
> +         This is a driver for the Loongson on-chip Counter0 (Time-Of-Yea=
r
> +         counter) to be used as a RTC.
> +         It can be found on Loongson-1 series cpu, Loongson-2K series cp=
u
> +         and Loongson LS7A bridge chips.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called rtc-loongson.
> +
>  config RTC_DRV_LPC24XX
>         tristate "NXP RTC for LPC178x/18xx/408x/43xx"
>         depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index c50afd8fb9f4..fd209883ee2e 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_RTC_DRV_ISL12022)        +=3D rtc-isl12022=
.o
>  obj-$(CONFIG_RTC_DRV_ISL12026) +=3D rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_JZ4740)   +=3D rtc-jz4740.o
> +obj-$(CONFIG_RTC_DRV_LOONGSON) +=3D rtc-loongson.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)  +=3D rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> new file mode 100644
> index 000000000000..e8ffc1ab90b0
> --- /dev/null
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson RTC driver
> + *
> + * Maintained out-of-tree by Huacai Chen <chenhuacai@kernel.org>.
> + * Rewritten for mainline by WANG Xuerui <git@xen0n.name>.
> + *                           Binbin Zhou <zhoubinbin@loongson.cn>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +#include <linux/acpi.h>
> +
> +/* Time Of Year(TOY) counters registers */
> +#define TOY_TRIM_REG           0x20 /* Must be initialized to 0 */
> +#define TOY_WRITE0_REG         0x24 /* TOY low 32-bits value (write-only=
) */
> +#define TOY_WRITE1_REG         0x28 /* TOY high 32-bits value (write-onl=
y) */
> +#define TOY_READ0_REG          0x2c /* TOY low 32-bits value (read-only)=
 */
> +#define TOY_READ1_REG          0x30 /* TOY high 32-bits value (read-only=
) */
> +#define TOY_MATCH0_REG         0x34 /* TOY timing interrupt 0 */
> +#define TOY_MATCH1_REG         0x38 /* TOY timing interrupt 1 */
> +#define TOY_MATCH2_REG         0x3c /* TOY timing interrupt 2 */
> +
> +/* RTC counters registers */
> +#define RTC_CTRL_REG           0x40 /* TOY and RTC control register */
> +#define RTC_TRIM_REG           0x60 /* Must be initialized to 0 */
> +#define RTC_WRITE0_REG         0x64 /* RTC counters value (write-only) *=
/
> +#define RTC_READ0_REG          0x68 /* RTC counters value (read-only) */
> +#define RTC_MATCH0_REG         0x6c /* RTC timing interrupt 0 */
> +#define RTC_MATCH1_REG         0x70 /* RTC timing interrupt 1 */
> +#define RTC_MATCH2_REG         0x74 /* RTC timing interrupt 2 */
> +
> +/* bitmask of TOY_WRITE0_REG */
> +#define TOY_MON                        GENMASK(31, 26)
> +#define TOY_DAY                        GENMASK(25, 21)
> +#define TOY_HOUR               GENMASK(20, 16)
> +#define TOY_MIN                        GENMASK(15, 10)
> +#define TOY_SEC                        GENMASK(9, 4)
> +#define TOY_MSEC               GENMASK(3, 0)
> +
> +/* bitmask of TOY_MATCH0/1/2_REG */
> +#define TOY_MATCH_YEAR         GENMASK(31, 26)
> +#define TOY_MATCH_MON          GENMASK(25, 22)
> +#define TOY_MATCH_DAY          GENMASK(21, 17)
> +#define TOY_MATCH_HOUR         GENMASK(16, 12)
> +#define TOY_MATCH_MIN          GENMASK(11, 6)
> +#define TOY_MATCH_SEC          GENMASK(5, 0)
> +
> +/* bitmask of RTC_CTRL_REG */
> +#define RTC_ENABLE             BIT(13) /* 1: RTC counters enable */
> +#define TOY_ENABLE             BIT(11) /* 1: TOY counters enable */
> +#define OSC_ENABLE             BIT(8) /* 1: 32.768k crystal enable */
> +#define TOY_ENABLE_MASK                (TOY_ENABLE | OSC_ENABLE)
> +
> +/* PM domain registers */
> +#define PM1_STS_REG            0x0c    /* Power management 1 status regi=
ster */
> +#define RTC_STS                        BIT(10) /* RTC status */
> +#define PM1_EN_REG             0x10    /* Power management 1 enable regi=
ster */
> +#define RTC_EN                 BIT(10) /* RTC event enable */
> +
> +/*
> + * According to the LS1C manual, RTC_CTRL and alarm-related registers ar=
e not defined.
> + * Accessing the relevant registers will cause the system to hang.
> + */
> +#define LS1C_RTC_CTRL_WORKAROUND       BIT(0)
> +
> +struct loongson_rtc_config {
> +       u32 pm_offset;  /* Offset of PM domain, for RTC alarm wakeup */
> +       u32 flags;      /* Workaround bits */
> +};
> +
> +struct loongson_rtc_priv {
> +       spinlock_t lock;        /* protects PM registers access */
> +       u32 fix_year;           /* RTC alarm year compensation value */
> +       struct rtc_device *rtcdev;
> +       struct regmap *regmap;
> +       void __iomem *pm_base;  /* PM domain base, for RTC alarm wakeup *=
/
> +       const struct loongson_rtc_config *config;
> +};
> +
> +static const struct loongson_rtc_config ls1b_rtc_config =3D {
> +       .pm_offset =3D 0,
> +       .flags =3D 0,
> +};
> +
> +static const struct loongson_rtc_config ls1c_rtc_config =3D {
> +       .pm_offset =3D 0,
> +       .flags =3D LS1C_RTC_CTRL_WORKAROUND,
> +};
> +
> +static const struct loongson_rtc_config generic_rtc_config =3D {
> +       .pm_offset =3D 0x100,
> +       .flags =3D 0,
> +};
> +
> +static const struct loongson_rtc_config ls2k1000_rtc_config =3D {
> +       .pm_offset =3D 0x800,
> +       .flags =3D 0,
> +};
> +
> +static const struct regmap_config loongson_rtc_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +};
> +
> +/* RTC alarm irq handler */
> +static irqreturn_t loongson_rtc_isr(int irq, void *id)
> +{
> +       struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id=
;
> +
> +       rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +       return IRQ_HANDLED;
> +}
> +
> +/* For ACPI fixed event handler */
> +static u32 loongson_rtc_handler(void *id)
> +{
> +       struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id=
;
> +
> +       spin_lock(&priv->lock);
> +       /* Disable RTC alarm wakeup and interrupt */
> +       writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> +              priv->pm_base + PM1_EN_REG);
> +
> +       /* Clear RTC interrupt status */
> +       writel(RTC_STS, priv->pm_base + PM1_STS_REG);
> +       spin_unlock(&priv->lock);
> +
> +       /*
> +        * The TOY_MATCH0_REG should be cleared 0 here,
> +        * otherwise the interrupt cannot be cleared.
> +        */
> +       return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +}
> +
> +static int loongson_rtc_set_enabled(struct device *dev)
> +{
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
> +               return 0;
> +
> +       /* Enable RTC TOY counters and crystal */
> +       return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_=
MASK,
> +                                 TOY_ENABLE_MASK);
> +}
> +
> +static bool loongson_rtc_get_enabled(struct device *dev)
> +{
> +       int ret;
> +       u32 ctrl_data;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
> +               return true;
> +
> +       ret =3D regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
> +       if (ret < 0)
> +               return false;
> +
> +       return ctrl_data & TOY_ENABLE_MASK;
> +}
> +
> +static int loongson_rtc_read_time(struct device *dev, struct rtc_time *t=
m)
> +{
> +       int ret;
> +       u32 rtc_data[2];
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (!loongson_rtc_get_enabled(dev))
> +               return -EINVAL;
> +
> +       ret =3D regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> +                              ARRAY_SIZE(rtc_data));
> +       if (ret < 0)
> +               return ret;
> +
> +       tm->tm_sec =3D FIELD_GET(TOY_SEC, rtc_data[0]);
> +       tm->tm_min =3D FIELD_GET(TOY_MIN, rtc_data[0]);
> +       tm->tm_hour =3D FIELD_GET(TOY_HOUR, rtc_data[0]);
> +       tm->tm_mday =3D FIELD_GET(TOY_DAY, rtc_data[0]);
> +       tm->tm_mon =3D FIELD_GET(TOY_MON, rtc_data[0]) - 1;
> +       tm->tm_year =3D rtc_data[1];
> +
> +       /* Prepare for RTC alarm year compensation value. */
> +       priv->fix_year =3D tm->tm_year / 64 * 64;
> +       return 0;
> +}
> +
> +static int loongson_rtc_set_time(struct device *dev, struct rtc_time *tm=
)
> +{
> +       int ret;
> +       u32 rtc_data[2];
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       rtc_data[0] =3D FIELD_PREP(TOY_SEC, tm->tm_sec)
> +                   | FIELD_PREP(TOY_MIN, tm->tm_min)
> +                   | FIELD_PREP(TOY_HOUR, tm->tm_hour)
> +                   | FIELD_PREP(TOY_DAY, tm->tm_mday)
> +                   | FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> +       rtc_data[1] =3D tm->tm_year;
> +
> +       ret =3D regmap_bulk_write(priv->regmap, TOY_WRITE0_REG, rtc_data,
> +                               ARRAY_SIZE(rtc_data));
> +       if (ret < 0)
> +               return ret;
> +
> +       return loongson_rtc_set_enabled(dev);
> +}
> +
> +static int loongson_rtc_read_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> +{
> +       int ret;
> +       u32 alarm_data;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       ret =3D regmap_read(priv->regmap, TOY_MATCH0_REG, &alarm_data);
> +       if (ret < 0)
> +               return ret;
> +
> +       alrm->time.tm_sec =3D FIELD_GET(TOY_MATCH_SEC, alarm_data);
> +       alrm->time.tm_min =3D FIELD_GET(TOY_MATCH_MIN, alarm_data);
> +       alrm->time.tm_hour =3D FIELD_GET(TOY_MATCH_HOUR, alarm_data);
> +       alrm->time.tm_mday =3D FIELD_GET(TOY_MATCH_DAY, alarm_data);
> +       alrm->time.tm_mon =3D FIELD_GET(TOY_MATCH_MON, alarm_data) - 1;
> +       /*
> +        * This is a hardware bug: the year field of SYS_TOYMATCH is only=
 6 bits,
> +        * making it impossible to save year values larger than 64.
> +        *
> +        * SYS_TOYMATCH is used to match the alarm time value and determi=
ne if
> +        * an alarm is triggered, so we must keep the lower 6 bits of the=
 year
> +        * value constant during the value conversion.
> +        *
> +        * In summary, we need to manually add 64(or a multiple of 64) to=
 the
> +        * year value to avoid the invalid alarm prompt at startup.
> +        */
> +       alrm->time.tm_year =3D FIELD_GET(TOY_MATCH_YEAR, alarm_data) + pr=
iv->fix_year;
> +
> +       alrm->enabled =3D !!(readl(priv->pm_base + PM1_EN_REG) & RTC_EN);
> +       return 0;
> +}
> +
> +static int loongson_rtc_alarm_irq_enable(struct device *dev, unsigned in=
t enabled)
> +{
> +       u32 val;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       spin_lock(&priv->lock);
> +       val =3D readl(priv->pm_base + PM1_EN_REG);
> +       /* Enable RTC alarm wakeup */
> +       writel(enabled ? val | RTC_EN : val & ~RTC_EN,
> +              priv->pm_base + PM1_EN_REG);
> +       spin_unlock(&priv->lock);
> +
> +       return 0;
> +}
> +
> +static int loongson_rtc_set_alarm(struct device *dev, struct rtc_wkalrm =
*alrm)
> +{
> +       int ret;
> +       u32 alarm_data;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       alarm_data =3D FIELD_PREP(TOY_MATCH_SEC, alrm->time.tm_sec)
> +                  | FIELD_PREP(TOY_MATCH_MIN, alrm->time.tm_min)
> +                  | FIELD_PREP(TOY_MATCH_HOUR, alrm->time.tm_hour)
> +                  | FIELD_PREP(TOY_MATCH_DAY, alrm->time.tm_mday)
> +                  | FIELD_PREP(TOY_MATCH_MON, alrm->time.tm_mon + 1)
> +                  | FIELD_PREP(TOY_MATCH_YEAR, alrm->time.tm_year - priv=
->fix_year);
> +
> +       ret =3D regmap_write(priv->regmap, TOY_MATCH0_REG, alarm_data);
> +       if (ret < 0)
> +               return ret;
> +
> +       return loongson_rtc_alarm_irq_enable(dev, alrm->enabled);
> +}
> +
> +static const struct rtc_class_ops loongson_rtc_ops =3D {
> +       .read_time =3D loongson_rtc_read_time,
> +       .set_time =3D loongson_rtc_set_time,
> +       .read_alarm =3D loongson_rtc_read_alarm,
> +       .set_alarm =3D loongson_rtc_set_alarm,
> +       .alarm_irq_enable =3D loongson_rtc_alarm_irq_enable,
> +};
> +
> +static int loongson_rtc_probe(struct platform_device *pdev)
> +{
> +       int ret, alarm_irq;
> +       void __iomem *regs;
> +       struct loongson_rtc_priv *priv;
> +       struct device *dev =3D &pdev->dev;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return dev_err_probe(dev, PTR_ERR(regs),
> +                                    "devm_platform_ioremap_resource fail=
ed\n");
> +
> +       priv->regmap =3D devm_regmap_init_mmio(dev, regs,
> +                                            &loongson_rtc_regmap_config)=
;
> +       if (IS_ERR(priv->regmap))
> +               return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +                                    "devm_regmap_init_mmio failed\n");
> +
> +       priv->config =3D device_get_match_data(dev);
> +       spin_lock_init(&priv->lock);
> +       platform_set_drvdata(pdev, priv);
> +
> +       priv->rtcdev =3D devm_rtc_allocate_device(dev);
> +       if (IS_ERR(priv->rtcdev))
> +               return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> +                                    "devm_rtc_allocate_device failed\n")=
;
> +
> +       /* Get RTC alarm irq */
> +       alarm_irq =3D platform_get_irq(pdev, 0);
> +       if (alarm_irq > 0) {
> +               ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr=
,
> +                                      0, "loongson-alarm", priv);
> +               if (ret < 0)
> +                       return dev_err_probe(dev, ret, "Unable to request=
 irq %d\n",
> +                                            alarm_irq);
> +
> +               priv->pm_base =3D regs - priv->config->pm_offset;
> +               device_init_wakeup(dev, 1);
> +
> +               if (has_acpi_companion(dev))
> +                       acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> +                                                        loongson_rtc_han=
dler, priv);
> +       } else {
> +               /* Loongson-1C RTC does not support alarm */
> +               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> +       }
> +
> +       /* Loongson RTC does not support UIE */
> +       clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
> +       priv->rtcdev->ops =3D &loongson_rtc_ops;
> +       priv->rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> +       priv->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
> +
> +       return devm_rtc_register_device(priv->rtcdev);
> +}
> +
> +static void loongson_rtc_remove(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (!test_bit(RTC_FEATURE_ALARM, priv->rtcdev->features))
> +               return;
> +
> +       if (has_acpi_companion(dev))
> +               acpi_remove_fixed_event_handler(ACPI_EVENT_RTC,
> +                                               loongson_rtc_handler);
> +
> +       device_init_wakeup(dev, 0);
> +       loongson_rtc_alarm_irq_enable(dev, 0);
> +}
> +
> +static const struct of_device_id loongson_rtc_of_match[] =3D {
> +       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1b_rtc_config=
 },
> +       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1c_rtc_config=
 },
> +       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_con=
fig },
> +       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rt=
c_config },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson_rtc_of_match);
> +
> +static const struct acpi_device_id loongson_rtc_acpi_match[] =3D {
> +       { "LOON0001", .driver_data =3D (kernel_ulong_t)&generic_rtc_confi=
g },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, loongson_rtc_acpi_match);
> +
> +static struct platform_driver loongson_rtc_driver =3D {
> +       .probe          =3D loongson_rtc_probe,
> +       .remove_new     =3D loongson_rtc_remove,
> +       .driver         =3D {
> +               .name   =3D "loongson-rtc",
> +               .of_match_table =3D loongson_rtc_of_match,
> +               .acpi_match_table =3D loongson_rtc_acpi_match,
> +       },
> +};
> +module_platform_driver(loongson_rtc_driver);
> +
> +MODULE_DESCRIPTION("Loongson RTC driver");
> +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> +MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
> +MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
> +MODULE_LICENSE("GPL");
> --
> 2.39.1
>


--
Best regards,

Keguang Zhang
