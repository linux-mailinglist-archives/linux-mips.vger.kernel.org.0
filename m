Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC7E720058
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 13:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbjFBL0f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 07:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbjFBL0a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 07:26:30 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821ED19B;
        Fri,  2 Jun 2023 04:26:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso2756265a12.0;
        Fri, 02 Jun 2023 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685705185; x=1688297185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOPB28jxPP1M23tfsnHLbkbDEHXgo1+K8VOhyFsqi6U=;
        b=IrIbn7LfJhd+mpGB11x7u5HSdSoCZ47pmC/BObxhhvfSW2C6vsB5Yy6rD2L57YxKjC
         Xw+sUY3LrGS8itBzi0y8fC20ig3M2p7r7aGBuJbyhQ3W36s5ffY5DlIyvAwSZUazFZgG
         3B+munNLaO8sPejoYBQ1kw1VRzLwqWu6JtCbvVbPh11+5Z79nTn7na/tJB7r4TVi89zd
         uSp3NTeZieYcIN2r1FrJjLWpP73qfL/aipt93HfYS65RjgZi/6Dp2+jvE8Ym3pg6YjPr
         DJWXdTBLcbBzn0e3fS3BXBSe0piaSWMvFHzGB0TlzSeQMhJWTRD+O5kPqpu98t5DSZ4i
         ZHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685705185; x=1688297185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOPB28jxPP1M23tfsnHLbkbDEHXgo1+K8VOhyFsqi6U=;
        b=C7SS8EmoKVed/4lDwJjpvjgib1Ymjjoc24sQWuNYGmYBHnF78li0Rooqd1yx8+Okiu
         ZH0/JFRaGaXtxbX7L1ZioIsk3ERp4o88ZZypDIqB2nxUueHcmsdpH9Lk+WQeS8fZzDsQ
         I8+u0G7fMIcpkC9daqKluVf9O4PqDpmGObvm76ZgfZdjCeuGwOVsRWG+wyvN4tQSSyy+
         igqOh9WvrQOOoTbWzU1Uf1F35VTHZOEPfuPSt84Dh9KOdyhOYX3LP4AIPS4bEnOcKv1J
         IrAH8gKgSTxJhjCUFvqlU6u/ln0ifotoKeu66t3434xDCzhtZwtj282RQevxgGdXkb8H
         5sQg==
X-Gm-Message-State: AC+VfDyTWCbUIfIbRHEI+w0gwjKpJD/HtnfN1vMLlAMQl05OVrBDuoxD
        GIkZSZPCHj2UeCm+ZVN0ut8qD3704yWW9sxCOM8=
X-Google-Smtp-Source: ACHHUZ6p5AgQF78RB2S6WIQmya7KwCHPkKWT06OvgYvF8dTYFhrSqbDeEszMYkYgF9F5YUQyDT2R6Hs+20SG2Iiqmp8=
X-Received: by 2002:a05:6402:14d9:b0:514:9aae:4528 with SMTP id
 f25-20020a05640214d900b005149aae4528mr1910061edx.14.1685705184768; Fri, 02
 Jun 2023 04:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685693501.git.zhoubinbin@loongson.cn> <c38c666015a162d7031b20a48209ce577bab62cd.1685693501.git.zhoubinbin@loongson.cn>
In-Reply-To: <c38c666015a162d7031b20a48209ce577bab62cd.1685693501.git.zhoubinbin@loongson.cn>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Fri, 2 Jun 2023 19:26:08 +0800
Message-ID: <CAJhJPsXz=en8aPsmwTovk+uggi0VvUwtYuhymsdxMA6=su2vNg@mail.gmail.com>
Subject: Re: [PATCH V5 2/5] rtc: Remove the Loongson-1 RTC driver
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
        Yang Ling <gnaygnil@gmail.com>
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
> Remove the ls1x-rtc driver as it is obsolete. We will continue to
> support the ls1x RTC in the upcoming Loongson unified RTC driver
> rtc-loongson.
>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: zhao zhang <zhzhl555@gmail.com>
> Cc: Yang Ling <gnaygnil@gmail.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Acked-by: Keguang Zhang <keguang.zhang@gmail.com>

> ---
>  drivers/rtc/Kconfig    |  10 ---
>  drivers/rtc/Makefile   |   1 -
>  drivers/rtc/rtc-ls1x.c | 192 -----------------------------------------
>  3 files changed, 203 deletions(-)
>  delete mode 100644 drivers/rtc/rtc-ls1x.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 753872408615..599f5110a251 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1726,16 +1726,6 @@ config RTC_DRV_TEGRA
>           This drive can also be built as a module. If so, the module
>           will be called rtc-tegra.
>
> -config RTC_DRV_LOONGSON1
> -       tristate "loongson1 RTC support"
> -       depends on MACH_LOONGSON32
> -       help
> -         This is a driver for the loongson1 on-chip Counter0 (Time-Of-Ye=
ar
> -         counter) to be used as a RTC.
> -
> -         This driver can also be built as a module. If so, the module
> -         will be called rtc-ls1x.
> -
>  config RTC_DRV_MXC
>         tristate "Freescale MXC Real Time Clock"
>         depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index ea445d1ebb17..c50afd8fb9f4 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -78,7 +78,6 @@ obj-$(CONFIG_RTC_DRV_ISL12022)        +=3D rtc-isl12022=
.o
>  obj-$(CONFIG_RTC_DRV_ISL12026) +=3D rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_JZ4740)   +=3D rtc-jz4740.o
> -obj-$(CONFIG_RTC_DRV_LOONGSON1)        +=3D rtc-ls1x.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)  +=3D rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o
> diff --git a/drivers/rtc/rtc-ls1x.c b/drivers/rtc/rtc-ls1x.c
> deleted file mode 100644
> index 5af26dc5c2a3..000000000000
> --- a/drivers/rtc/rtc-ls1x.c
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * Copyright (c) 2011 Zhao Zhang <zhzhl555@gmail.com>
> - *
> - * Derived from driver/rtc/rtc-au1xxx.c
> - */
> -
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> -#include <linux/rtc.h>
> -#include <linux/init.h>
> -#include <linux/platform_device.h>
> -#include <linux/delay.h>
> -#include <linux/types.h>
> -#include <linux/io.h>
> -#include <loongson1.h>
> -
> -#define LS1X_RTC_REG_OFFSET    (LS1X_RTC_BASE + 0x20)
> -#define LS1X_RTC_REGS(x) \
> -               ((void __iomem *)KSEG1ADDR(LS1X_RTC_REG_OFFSET + (x)))
> -
> -/*RTC programmable counters 0 and 1*/
> -#define SYS_COUNTER_CNTRL              (LS1X_RTC_REGS(0x20))
> -#define SYS_CNTRL_ERS                  (1 << 23)
> -#define SYS_CNTRL_RTS                  (1 << 20)
> -#define SYS_CNTRL_RM2                  (1 << 19)
> -#define SYS_CNTRL_RM1                  (1 << 18)
> -#define SYS_CNTRL_RM0                  (1 << 17)
> -#define SYS_CNTRL_RS                   (1 << 16)
> -#define SYS_CNTRL_BP                   (1 << 14)
> -#define SYS_CNTRL_REN                  (1 << 13)
> -#define SYS_CNTRL_BRT                  (1 << 12)
> -#define SYS_CNTRL_TEN                  (1 << 11)
> -#define SYS_CNTRL_BTT                  (1 << 10)
> -#define SYS_CNTRL_E0                   (1 << 8)
> -#define SYS_CNTRL_ETS                  (1 << 7)
> -#define SYS_CNTRL_32S                  (1 << 5)
> -#define SYS_CNTRL_TTS                  (1 << 4)
> -#define SYS_CNTRL_TM2                  (1 << 3)
> -#define SYS_CNTRL_TM1                  (1 << 2)
> -#define SYS_CNTRL_TM0                  (1 << 1)
> -#define SYS_CNTRL_TS                   (1 << 0)
> -
> -/* Programmable Counter 0 Registers */
> -#define SYS_TOYTRIM            (LS1X_RTC_REGS(0))
> -#define SYS_TOYWRITE0          (LS1X_RTC_REGS(4))
> -#define SYS_TOYWRITE1          (LS1X_RTC_REGS(8))
> -#define SYS_TOYREAD0           (LS1X_RTC_REGS(0xC))
> -#define SYS_TOYREAD1           (LS1X_RTC_REGS(0x10))
> -#define SYS_TOYMATCH0          (LS1X_RTC_REGS(0x14))
> -#define SYS_TOYMATCH1          (LS1X_RTC_REGS(0x18))
> -#define SYS_TOYMATCH2          (LS1X_RTC_REGS(0x1C))
> -
> -/* Programmable Counter 1 Registers */
> -#define SYS_RTCTRIM            (LS1X_RTC_REGS(0x40))
> -#define SYS_RTCWRITE0          (LS1X_RTC_REGS(0x44))
> -#define SYS_RTCREAD0           (LS1X_RTC_REGS(0x48))
> -#define SYS_RTCMATCH0          (LS1X_RTC_REGS(0x4C))
> -#define SYS_RTCMATCH1          (LS1X_RTC_REGS(0x50))
> -#define SYS_RTCMATCH2          (LS1X_RTC_REGS(0x54))
> -
> -#define LS1X_SEC_OFFSET                (4)
> -#define LS1X_MIN_OFFSET                (10)
> -#define LS1X_HOUR_OFFSET       (16)
> -#define LS1X_DAY_OFFSET                (21)
> -#define LS1X_MONTH_OFFSET      (26)
> -
> -
> -#define LS1X_SEC_MASK          (0x3f)
> -#define LS1X_MIN_MASK          (0x3f)
> -#define LS1X_HOUR_MASK         (0x1f)
> -#define LS1X_DAY_MASK          (0x1f)
> -#define LS1X_MONTH_MASK                (0x3f)
> -#define LS1X_YEAR_MASK         (0xffffffff)
> -
> -#define ls1x_get_sec(t)                (((t) >> LS1X_SEC_OFFSET) & LS1X_=
SEC_MASK)
> -#define ls1x_get_min(t)                (((t) >> LS1X_MIN_OFFSET) & LS1X_=
MIN_MASK)
> -#define ls1x_get_hour(t)       (((t) >> LS1X_HOUR_OFFSET) & LS1X_HOUR_MA=
SK)
> -#define ls1x_get_day(t)                (((t) >> LS1X_DAY_OFFSET) & LS1X_=
DAY_MASK)
> -#define ls1x_get_month(t)      (((t) >> LS1X_MONTH_OFFSET) & LS1X_MONTH_=
MASK)
> -
> -#define RTC_CNTR_OK (SYS_CNTRL_E0 | SYS_CNTRL_32S)
> -
> -static int ls1x_rtc_read_time(struct device *dev, struct rtc_time *rtm)
> -{
> -       unsigned long v;
> -       time64_t t;
> -
> -       v =3D readl(SYS_TOYREAD0);
> -       t =3D readl(SYS_TOYREAD1);
> -
> -       memset(rtm, 0, sizeof(struct rtc_time));
> -       t  =3D mktime64((t & LS1X_YEAR_MASK), ls1x_get_month(v),
> -                       ls1x_get_day(v), ls1x_get_hour(v),
> -                       ls1x_get_min(v), ls1x_get_sec(v));
> -       rtc_time64_to_tm(t, rtm);
> -
> -       return 0;
> -}
> -
> -static int ls1x_rtc_set_time(struct device *dev, struct  rtc_time *rtm)
> -{
> -       unsigned long v, t, c;
> -       int ret =3D -ETIMEDOUT;
> -
> -       v =3D ((rtm->tm_mon + 1)  << LS1X_MONTH_OFFSET)
> -               | (rtm->tm_mday << LS1X_DAY_OFFSET)
> -               | (rtm->tm_hour << LS1X_HOUR_OFFSET)
> -               | (rtm->tm_min  << LS1X_MIN_OFFSET)
> -               | (rtm->tm_sec  << LS1X_SEC_OFFSET);
> -
> -       writel(v, SYS_TOYWRITE0);
> -       c =3D 0x10000;
> -       /* add timeout check counter, for more safe */
> -       while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TS) && --c)
> -               usleep_range(1000, 3000);
> -
> -       if (!c) {
> -               dev_err(dev, "set time timeout!\n");
> -               goto err;
> -       }
> -
> -       t =3D rtm->tm_year + 1900;
> -       writel(t, SYS_TOYWRITE1);
> -       c =3D 0x10000;
> -       while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TS) && --c)
> -               usleep_range(1000, 3000);
> -
> -       if (!c) {
> -               dev_err(dev, "set time timeout!\n");
> -               goto err;
> -       }
> -       return 0;
> -err:
> -       return ret;
> -}
> -
> -static const struct rtc_class_ops  ls1x_rtc_ops =3D {
> -       .read_time      =3D ls1x_rtc_read_time,
> -       .set_time       =3D ls1x_rtc_set_time,
> -};
> -
> -static int ls1x_rtc_probe(struct platform_device *pdev)
> -{
> -       struct rtc_device *rtcdev;
> -       unsigned long v;
> -
> -       v =3D readl(SYS_COUNTER_CNTRL);
> -       if (!(v & RTC_CNTR_OK)) {
> -               dev_err(&pdev->dev, "rtc counters not working\n");
> -               return -ENODEV;
> -       }
> -
> -       /* set to 1 HZ if needed */
> -       if (readl(SYS_TOYTRIM) !=3D 32767) {
> -               v =3D 0x100000;
> -               while ((readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TTS) && --v)
> -                       usleep_range(1000, 3000);
> -
> -               if (!v) {
> -                       dev_err(&pdev->dev, "time out\n");
> -                       return -ETIMEDOUT;
> -               }
> -               writel(32767, SYS_TOYTRIM);
> -       }
> -       /* this loop coundn't be endless */
> -       while (readl(SYS_COUNTER_CNTRL) & SYS_CNTRL_TTS)
> -               usleep_range(1000, 3000);
> -
> -       rtcdev =3D devm_rtc_allocate_device(&pdev->dev);
> -       if (IS_ERR(rtcdev))
> -               return PTR_ERR(rtcdev);
> -
> -       platform_set_drvdata(pdev, rtcdev);
> -       rtcdev->ops =3D &ls1x_rtc_ops;
> -       rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_1900;
> -       rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
> -
> -       return devm_rtc_register_device(rtcdev);
> -}
> -
> -static struct platform_driver  ls1x_rtc_driver =3D {
> -       .driver         =3D {
> -               .name   =3D "ls1x-rtc",
> -       },
> -       .probe          =3D ls1x_rtc_probe,
> -};
> -
> -module_platform_driver(ls1x_rtc_driver);
> -
> -MODULE_AUTHOR("zhao zhang <zhzhl555@gmail.com>");
> -MODULE_LICENSE("GPL");
> --
> 2.39.1
>


--=20
Best regards,

Keguang Zhang
