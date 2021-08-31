Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E443FC008
	for <lists+linux-mips@lfdr.de>; Tue, 31 Aug 2021 02:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239212AbhHaAfT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Aug 2021 20:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239206AbhHaAfS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Aug 2021 20:35:18 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55948C0613D9
        for <linux-mips@vger.kernel.org>; Mon, 30 Aug 2021 17:34:24 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a4so8796540uae.6
        for <linux-mips@vger.kernel.org>; Mon, 30 Aug 2021 17:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4No7OmDhYH71cDuM902ztr+gz1Pkd+7iA3xvuwmnN+Y=;
        b=1iGcw3M9CCLKuF0wYys5bFa+kaQyoBIC6R/gdNyavhjaZaQKlAH1omUEaWACVCI95y
         Q9anlWOSnXFbA2YUXjgnMHUPIyHXdBj4lQCqrJBKWNSf1azsAhsb7Yw3pc0ZgQBWmHh2
         3y2roihnBNEqawQ7PH9s+h8TDJBuWkRQdd3eRb1QDHr6/o5xbHUCPPm8fK8QFQ3+olve
         oLdEhCT6cMIXe43P4UXvBRoKSd0dSwPViZ2t+MXruj7tt847I/GOSgWU+VD+yMqFUVtd
         D5a3ElnHlIC7/yRymjdHI5m9rplsTUY/3pWYeELuICg65sk3Iiqy5p48SfM7y+a8ddhM
         /M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4No7OmDhYH71cDuM902ztr+gz1Pkd+7iA3xvuwmnN+Y=;
        b=XZw/R5qM/KHPrxbRCnZkbpb3uGDxc7anD+eDaMoYHOarBAWDv1fKBJ2eIAKu6OI3CV
         KDHC2QknEyO9D8Pd8KhIZ8zt4iWD/iPTraNtMoU8Fj6ED7/TxqPxbCpaf54Ukd0JO2Px
         IsUQyzCfkmjZjrKFUzxibqMnL1Mqa0z56gvxH48H66q1jLoqYzUqk+Fa93SvU5vQzUTo
         6urGynMqH929nrsFRbp883IMXpVRIN0Qe5+ETxjZ9AyENpSCIFvUhy78RWJ0T/g5+FNX
         TpLWevi/4kSHEevH6ZVf8FmD7jzD2U3cMz0dS8aYRQq6Q5pMeNX7lF/NvkHXHsYrXuJt
         hUXw==
X-Gm-Message-State: AOAM531ZOOk5mi0ZY5WLeYDH3/nQQbFs93TubXuhI+R6GK0RArxszNFN
        fVjmkYEJYWP0T2o8AOyGnuFpIJypD0qCPU6sMBzV
X-Google-Smtp-Source: ABdhPJxVULiDngx88UAs0Vp+/wbdw5tXbWzMy8qHMcLiXrR/fI5LPC2TYdniJP/19YuB3Na0oMTJAjsVTHKNXpISlOg=
X-Received: by 2002:ab0:7304:: with SMTP id v4mr17236231uao.30.1630370063254;
 Mon, 30 Aug 2021 17:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210823163142.586529-1-git@xen0n.name> <20210823163142.586529-2-git@xen0n.name>
In-Reply-To: <20210823163142.586529-2-git@xen0n.name>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Tue, 31 Aug 2021 09:33:56 +0900
Message-ID: <CABMQnV+1Zd3emmET5+2cC-kGR6y15W8QD2vgykMQOUzMn2E_Yw@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 1/6] rtc: ls2x: Add support for the
 Loongson-2K/LS7A RTC
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

2021=E5=B9=B48=E6=9C=8824=E6=97=A5(=E7=81=AB) 1:39 WANG Xuerui <git@xen0n.n=
ame>:
>
> This RTC module is integrated into the Loongson-2K SoC and the LS7A
> bridge chip. This version is almost entirely rewritten to make use of
> current kernel API.
>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/rtc/Kconfig    |  11 +++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-ls2x.c | 180 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 192 insertions(+)
>  create mode 100644 drivers/rtc/rtc-ls2x.c

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro

>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index daff06707455..819f366b4d91 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1313,6 +1313,17 @@ config RTC_DRV_NTXEC
>           embedded controller found in certain e-book readers designed by=
 the
>           original design manufacturer Netronix.
>
> +config RTC_DRV_LS2X
> +       tristate "Loongson LS2X RTC"
> +       depends on OF && MACH_LOONGSON64 || COMPILE_TEST
> +       select REGMAP_MMIO
> +       help
> +         If you say yes here you get support for the RTC on the Loongson=
-2K
> +         SoC and LS7A bridge, which first appeared on the Loongson-2H.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called rtc-ls2x.
> +
>  comment "on-CPU RTC drivers"
>
>  config RTC_DRV_ASM9260
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 5ceeafe4d5b2..98e68484f519 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)       +=3D rtc-ls1x.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)  +=3D rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o
> +obj-$(CONFIG_RTC_DRV_LS2X)     +=3D rtc-ls2x.o
>  obj-$(CONFIG_RTC_DRV_M41T80)   +=3D rtc-m41t80.o
>  obj-$(CONFIG_RTC_DRV_M41T93)   +=3D rtc-m41t93.o
>  obj-$(CONFIG_RTC_DRV_M41T94)   +=3D rtc-m41t94.o
> diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
> new file mode 100644
> index 000000000000..58901323b219
> --- /dev/null
> +++ b/drivers/rtc/rtc-ls2x.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Loongson-2K/7A RTC driver
> + *
> + * Based on the original out-of-tree Loongson-2H RTC driver for Linux 2.=
6.32,
> + * by Shaozong Liu <liushaozong@loongson.cn>.
> + *
> + * Maintained out-of-tree by Huacai Chen <chenhuacai@kernel.org>.
> + *
> + * Rewritten for mainline by WANG Xuerui <git@xen0n.name>.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +
> +#define TOY_TRIM_REG   0x20
> +#define TOY_WRITE0_REG 0x24
> +#define TOY_WRITE1_REG 0x28
> +#define TOY_READ0_REG  0x2c
> +#define TOY_READ1_REG  0x30
> +#define TOY_MATCH0_REG 0x34
> +#define TOY_MATCH1_REG 0x38
> +#define TOY_MATCH2_REG 0x3c
> +#define RTC_CTRL_REG   0x40
> +#define RTC_TRIM_REG   0x60
> +#define RTC_WRITE0_REG 0x64
> +#define RTC_READ0_REG  0x68
> +#define RTC_MATCH0_REG 0x6c
> +#define RTC_MATCH1_REG 0x70
> +#define RTC_MATCH2_REG 0x74
> +
> +#define TOY_MON        GENMASK(31, 26)
> +#define TOY_DAY        GENMASK(25, 21)
> +#define TOY_HOUR       GENMASK(20, 16)
> +#define TOY_MIN        GENMASK(15, 10)
> +#define TOY_SEC        GENMASK(9, 4)
> +#define TOY_MSEC       GENMASK(3, 0)
> +
> +struct ls2x_rtc_priv {
> +       struct regmap *regmap;
> +};
> +
> +static const struct regmap_config ls2x_rtc_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +};
> +
> +struct ls2x_rtc_regs {
> +       u32 reg0;
> +       u32 reg1;
> +};
> +
> +static inline void ls2x_rtc_regs_to_time(struct ls2x_rtc_regs *regs,
> +                                        struct rtc_time *tm)
> +{
> +       tm->tm_year =3D regs->reg1;
> +       tm->tm_sec =3D FIELD_GET(TOY_SEC, regs->reg0);
> +       tm->tm_min =3D FIELD_GET(TOY_MIN, regs->reg0);
> +       tm->tm_hour =3D FIELD_GET(TOY_HOUR, regs->reg0);
> +       tm->tm_mday =3D FIELD_GET(TOY_DAY, regs->reg0);
> +       tm->tm_mon =3D FIELD_GET(TOY_MON, regs->reg0) - 1;
> +}
> +
> +static inline void ls2x_rtc_time_to_regs(struct rtc_time *tm,
> +                                        struct ls2x_rtc_regs *regs)
> +{
> +       regs->reg0 =3D FIELD_PREP(TOY_SEC, tm->tm_sec);
> +       regs->reg0 |=3D FIELD_PREP(TOY_MIN, tm->tm_min);
> +       regs->reg0 |=3D FIELD_PREP(TOY_HOUR, tm->tm_hour);
> +       regs->reg0 |=3D FIELD_PREP(TOY_DAY, tm->tm_mday);
> +       regs->reg0 |=3D FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> +       regs->reg1 =3D tm->tm_year;
> +}
> +
> +static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct ls2x_rtc_priv *priv =3D dev_get_drvdata(dev);
> +       struct ls2x_rtc_regs regs;
> +       int ret;
> +
> +       ret =3D regmap_read(priv->regmap, TOY_READ1_REG, &regs.reg1);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       ret =3D regmap_read(priv->regmap, TOY_READ0_REG, &regs.reg0);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       ls2x_rtc_regs_to_time(&regs, tm);
> +
> +       return 0;
> +}
> +
> +static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +       struct ls2x_rtc_priv *priv =3D dev_get_drvdata(dev);
> +       struct ls2x_rtc_regs regs;
> +       int ret;
> +
> +       ls2x_rtc_time_to_regs(tm, &regs);
> +
> +       ret =3D regmap_write(priv->regmap, TOY_WRITE0_REG, regs.reg0);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       return regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
> +}
> +
> +static struct rtc_class_ops ls2x_rtc_ops =3D {
> +       .read_time =3D ls2x_rtc_read_time,
> +       .set_time =3D ls2x_rtc_set_time,
> +};
> +
> +static int ls2x_rtc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rtc_device *rtc;
> +       struct ls2x_rtc_priv *priv;
> +       void __iomem *regs;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (unlikely(!priv))
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       priv->regmap =3D devm_regmap_init_mmio(dev, regs,
> +                                            &ls2x_rtc_regmap_config);
> +       if (IS_ERR(priv->regmap))
> +               return PTR_ERR(priv->regmap);
> +
> +       rtc =3D devm_rtc_allocate_device(dev);
> +       if (IS_ERR(rtc))
> +               return PTR_ERR(rtc);
> +
> +       rtc->ops =3D &ls2x_rtc_ops;
> +
> +       /* Due to hardware erratum, all years multiple of 4 are considere=
d
> +        * leap year, so only years 2000 through 2099 are usable.
> +        *
> +        * Previous out-of-tree versions of this driver wrote tm_year dir=
ectly
> +        * into the year register, so epoch 2000 must be used to preserve
> +        * semantics on shipped systems.
> +        */
> +       rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> +       rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> +
> +       return devm_rtc_register_device(rtc);
> +}
> +
> +static const struct of_device_id ls2x_rtc_of_match[] =3D {
> +       { .compatible =3D "loongson,ls2x-rtc" },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ls2x_rtc_of_match);
> +
> +static struct platform_driver ls2x_rtc_driver =3D {
> +       .probe          =3D ls2x_rtc_probe,
> +       .driver         =3D {
> +               .name   =3D "ls2x-rtc",
> +               .of_match_table =3D ls2x_rtc_of_match,
> +       },
> +};
> +
> +module_platform_driver(ls2x_rtc_driver);
> +
> +MODULE_DESCRIPTION("LS2X RTC driver");
> +MODULE_AUTHOR("WANG Xuerui");
> +MODULE_AUTHOR("Huacai Chen");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ls2x-rtc");
> --
> 2.33.0
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
