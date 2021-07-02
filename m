Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C39C3B9C11
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 07:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhGBFzx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 01:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhGBFzx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 01:55:53 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A52DC061762
        for <linux-mips@vger.kernel.org>; Thu,  1 Jul 2021 22:53:21 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id h5so3437718vsg.12
        for <linux-mips@vger.kernel.org>; Thu, 01 Jul 2021 22:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3R0W2yq98jy/+is1ihrSvzYoYw6IR5zJrkrcP/O1xes=;
        b=XbnfbngVkINt3Ju3srRmDRcmZHhEMaOZJdJkF/yQZmtxjPr3QFXaF+SvW0POL5qtkU
         oyDlPH6GJpD82fJ2BHqaIlbmxUt4749/DhgdbR5NHFrOna0ZlcsHIT5lARmRXW1/UgtY
         jpSgNyAz4/yjq3IJmr+iS6m3r3iK1whSIV65r6OjyCjbIsM6ylH4r/dLChiWhFxeUx3V
         1Ph/iMqMRTsOCUDcqyn8eJmjm7LyRxuKK2NDOx4cSn8eKMvKuzpGgONMaBMclYuFLZom
         vjH+GPUPOkS0qhtGLTD0meKzB0GIGRH6nY3rn9rclAxpb8siS0AZBuJD3M9ZL6K9XoHa
         C6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3R0W2yq98jy/+is1ihrSvzYoYw6IR5zJrkrcP/O1xes=;
        b=tBta4vyeZ8I9JjX1sVISr7FaDik/cU9Dq1GSL6GL0Wxb/12BDDN5/We3gNpANw7hQ2
         gWdTnk5cbOswqXxozoA8GiSm6+OonBjVsxl9j4Kdr5p89JHEfM6lvgpGVCt5N8E0puqT
         EejyIq9sCNHFfTN0pxMaJlm3/B4Njd/q42vTUJZxZ2IXxHX7JhHZIWbNuHfl7Ir93UPd
         UNJ/I0HwOlGOtWaoN+kEUFdJyK4WY6kuBYqvZfdt5kdAMj2bQkPbHZlLE4TrYT2VbKjw
         4O74YXeJEjTkYiGS74ci8k1apRVcAOulzUnS61BlXpFDhhhK2Tb1d42X5kQn1sUEYInf
         BDYA==
X-Gm-Message-State: AOAM532r7Zfwg/5bLdTdGG9a3kvydaWVhYNtVfYKtygmkqESO9buVGdS
        QW4vnYsSROxQEN3mN27ruuI64yP8qNqtDdEIrUBV
X-Google-Smtp-Source: ABdhPJxtPPw8vY9z1KdoHzJoBB6mKTnyLmW2GQH98OZhqaPPJBQ96DZs46T2K5nDFpB9naJQO3N7/W1quOvbi88Z9rE=
X-Received: by 2002:a67:ee54:: with SMTP id g20mr4518850vsp.55.1625205199881;
 Thu, 01 Jul 2021 22:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210628164552.1006079-1-git@xen0n.name> <20210628164552.1006079-2-git@xen0n.name>
In-Reply-To: <20210628164552.1006079-2-git@xen0n.name>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Fri, 2 Jul 2021 14:52:53 +0900
Message-ID: <CABMQnVJwQjOWnYL6bm79V_iq1sJiRABQkvisHK-wGawAfDb5cQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

2021=E5=B9=B46=E6=9C=8829=E6=97=A5(=E7=81=AB) 1:52 WANG Xuerui <git@xen0n.n=
ame>:
>
> This RTC module is integrated into the Loongson-2K SoC and the LS7A
> bridge chip. This version is almost entirely rewritten to make use of
> current kernel API.
>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/rtc/Kconfig    |  11 +++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-ls2x.c | 184 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 196 insertions(+)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 12153d5801ce..253b9f22a162 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1304,6 +1304,17 @@ config RTC_DRV_NTXEC
>           embedded controller found in certain e-book readers designed by=
 the
>           original design manufacturer Netronix.
>
> +config RTC_DRV_LS2X
> +       tristate "Loongson LS2X RTC"
> +       depends on MACH_LOONGSON64 || COMPILE_TEST
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
> index 2dd0dd956b0e..6042ff1e73b7 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)       +=3D rtc-ls1x.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)  +=3D rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o
> +obj-$(CONFIG_RTC_DRV_LS2X)     +=3D rtc-ls2x.o
>  obj-$(CONFIG_RTC_DRV_M41T80)   +=3D rtc-m41t80.o
>  obj-$(CONFIG_RTC_DRV_M41T93)   +=3D rtc-m41t93.o
>  obj-$(CONFIG_RTC_DRV_M41T94)   +=3D rtc-m41t94.o
> diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
> new file mode 100644
> index 000000000000..1147a6e1591f
> --- /dev/null
> +++ b/drivers/rtc/rtc-ls2x.c
> @@ -0,0 +1,184 @@
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
> +       ret =3D regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
> +       if (unlikely(ret))
> +               return ret;

I think this can be returned directly.

> +
> +       return 0;
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
> +               .of_match_table =3D of_match_ptr(ls2x_rtc_of_match),

If my understanding is correct, this architecture is a DT-only platform.
Therefore, of_match_ptr() macro is unnecessary.

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
> 2.30.1
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
