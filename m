Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCCE16A388B
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 03:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjB0CaT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Feb 2023 21:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjB0CaD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 21:30:03 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033801D910;
        Sun, 26 Feb 2023 18:27:37 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ck15so20148002edb.0;
        Sun, 26 Feb 2023 18:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49AMJ04GXo7IzHM3tZ1TuRLyl5rjjrS/3TTjqzt72AY=;
        b=SQbDjiU8nnQnujwl39FCqcN7cLdoyixMlekTbGcGk7wNlaVN83KqEn8x/C3o46WBZE
         QH4OUF9i7G8aetNIm+oSSYYi7y+vsD/WQ6Cb0R40oendLqqxbCjWkAT/YwlZnPeI/twN
         Y27KWtNjx0vf91a9kS55WhUwx0RexJW+mTEu6/Ffn3AMnGmJwAi/MWO9zyFfyqaxkCXl
         CGw9RzaTeYZN6ge9l20l2mubZuheRtFal+s5Z0JPd2axoXLeU3yj1LVnXu3+iTe0zaVN
         58KFtJD+dqcck/4xVPXP56ccJ4auCw55XN/m22pS4muIFSMQcYdf6M82aJmkfnNhwDyq
         GV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49AMJ04GXo7IzHM3tZ1TuRLyl5rjjrS/3TTjqzt72AY=;
        b=1AwOW+nlwcZRnlxF6Y9/Jz+kymnMeHRfVTGFC0T1wM0V0ok51BznCEwwzf0qt1v8MF
         ZA6V0e82UX+9NAKuqX+m6JcthX5iRh3IHK6bwOTY8RMmjUgxNUcufE1TiB5DgcJk78+E
         TUYQh9vEUkc9X6NYXw5kyaEJLfblF026ORoJborWrfhEC6paPaMrxa43HAmrigpY65e6
         SSndtsnaKAC6Z+vOHFwuXvHgkDTDD1B9KIxrC6pz9r3N599nv0McLF/FD2ha/Dkt1WUS
         cqvRRZ3Zy2ju9AbbZr07780oY5hUPadfWgnxykuaYwx1bpqeVL3HTnCI78dt0iqb60YH
         0sFw==
X-Gm-Message-State: AO0yUKUOj48TiAdm+hlYMT6V2cEp1XxE5TXIfZZtLCGK7vRjPYIrox6F
        d2+lcna/hmUI6bjmwpFrETQ6o7IJdGjo2ZcO2Eo=
X-Google-Smtp-Source: AK7set+zve93WR8U3azG/Z9QA5ukarf2YYTtZfhg//vGXFQtFdeTWKOVa9VdiuNetmxmjE3kS4fUYYAee7km1o1nAQY=
X-Received: by 2002:a17:906:eb18:b0:8b1:7aec:c8e6 with SMTP id
 mb24-20020a170906eb1800b008b17aecc8e6mr16235131ejb.2.1677464782125; Sun, 26
 Feb 2023 18:26:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673227292.git.zhoubinbin@loongson.cn> <8cd5e1b763951d4ce69188cdff95d8adaf12755f.1673227292.git.zhoubinbin@loongson.cn>
 <Y88ZaWnh9ERRocPv@mail.local> <CAMpQs4+pWpw9bmCvKor+V41aMcLc-90aYz0QH-WS2KqkkFqMFA@mail.gmail.com>
 <Y+wVkl7r6HbriqA7@mail.local>
In-Reply-To: <Y+wVkl7r6HbriqA7@mail.local>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Mon, 27 Feb 2023 10:26:09 +0800
Message-ID: <CAMpQs4Kx3E+MdE0naf-TM2_JMjwWr2f4+b0vP+adZNFOF1fLhA@mail.gmail.com>
Subject: Re: [PATCH V2 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
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
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 15, 2023 at 7:13 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 01/02/2023 17:16:12+0800, Binbin Zhou wrote:
> > Hi Alexandre:
> >
> > Sorry for the late reply.
> >
> > On Tue, Jan 24, 2023 at 7:37 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > >
> > > On 09/01/2023 09:35:12+0800, Binbin Zhou wrote:
> > > > This RTC module is integrated into the Loongson-2K SoC and the LS7A
> > > > bridge chip. This version is almost entirely rewritten to make use of
> > > > current kernel API, and it supports both ACPI and DT.
> > > >
> > > > This driver is shared by MIPS-based Loongson-3A4000 system (use FDT) and
> > > > LoongArch-based Loongson-3A5000 system (use ACPI).
> > > >
> > >
> > > checkpatch.pl --strict complains, please fix the warnings and checks
> >
> > Got.
> > >
> > >
> > > > +#ifdef CONFIG_ACPI
> > > > +static u32 ls2x_acpi_fix_handler(void *id)
> > > > +{
> > > > +     int ret;
> > > > +     struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
> > > > +
> > > > +     spin_lock(&priv->rtc_reglock);
> > > > +
> > > > +     /* Disable acpi rtc enabled */
> > > > +     ret = readl(priv->acpi_base + PM1_EN_REG) & ~RTC_EN;
> > > > +     writel(ret, priv->acpi_base + PM1_EN_REG);
> > > > +
> > > > +     /* Clear acpi rtc interrupt Status */
> > > > +     writel(RTC_STS, priv->acpi_base + PM1_STS_REG);
> > > > +
> > > > +     spin_unlock(&priv->rtc_reglock);
> > > > +
> > > > +     /*
> > > > +      * The TOY_MATCH0_REG should be cleared 0 here,
> > > > +      * otherwise the interrupt cannot be cleared.
> > > > +      * Because the match condition is still satisfied
> > > > +      */
> > > > +     ret = regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > >
> > > How is this an ACPI related issue? I guess the same would happen on
> > > !ACPI.
> >
> > I just assumed that the function would only be called under CONFIG_ACPI.
> > >
> > > > +
> > > > +     rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> > >
> > > This is not useful, at that time, userspace has had no chance to open
> > > the RTC device file as it is not created yet.
> > >
> > > > +     return 0;
> > > > +}
> > > > +#endif
> > > > +
> > > > +static inline void ls2x_rtc_regs_to_time(struct ls2x_rtc_regs *regs,
> > >
> > > Those static inline functions seem to be used only once, you should just
> > > put the code in the proper location.
> >
> > I will do it in the next version.
> > >
> > > > +                                      struct rtc_time *tm)
> > > > +{
> > > > +     tm->tm_year = regs->reg1;
> > > > +     tm->tm_sec = FIELD_GET(TOY_SEC, regs->reg0);
> > > > +     tm->tm_min = FIELD_GET(TOY_MIN, regs->reg0);
> > > > +     tm->tm_hour = FIELD_GET(TOY_HOUR, regs->reg0);
> > > > +     tm->tm_mday = FIELD_GET(TOY_DAY, regs->reg0);
> > > > +     tm->tm_mon = FIELD_GET(TOY_MON, regs->reg0) - 1;
> > > > +}
> > > > +
> > > > +static inline void ls2x_rtc_time_to_regs(struct rtc_time *tm,
> > > > +                                      struct ls2x_rtc_regs *regs)
> > > > +{
> > > > +     regs->reg0 = FIELD_PREP(TOY_SEC, tm->tm_sec);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MIN, tm->tm_min);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_HOUR, tm->tm_hour);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_DAY, tm->tm_mday);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> > > > +     regs->reg1 = tm->tm_year;
> > > > +}
> > > > +
> > > > +static inline void ls2x_rtc_alarm_regs_to_time(struct ls2x_rtc_regs *regs,
> > > > +                                      struct rtc_time *tm)
> > > > +{
> > > > +     tm->tm_sec = FIELD_GET(TOY_MATCH_SEC, regs->reg0);
> > > > +     tm->tm_min = FIELD_GET(TOY_MATCH_MIN, regs->reg0);
> > > > +     tm->tm_hour = FIELD_GET(TOY_MATCH_HOUR, regs->reg0);
> > > > +     tm->tm_mday = FIELD_GET(TOY_MATCH_DAY, regs->reg0);
> > > > +     tm->tm_mon = FIELD_GET(TOY_MATCH_MON, regs->reg0) - 1;
> > > > +     /*
> > > > +      * The rtc SYS_TOYMATCH0/YEAR bit field is only 6 bits, so it means 63
> > > > +      * years at most. Therefore, The RTC alarm years can be set from 1900
> > > > +      * to 1963. This causes the initialization of alarm fail during call
> > > > +      * __rtc_read_alarm.
> > > > +      * We add 64 years offset to ls2x_rtc_read_alarm. After adding the
> > > > +      * offset, the RTC alarm clock can be set from 1964 to 2027.
> > > > +      */
> > > > +     tm->tm_year = FIELD_GET(TOY_MATCH_YEAR, regs->reg0) + 64;
> > >
> > > This is not symmetric with ls2x_rtc_time_to_alarm_regs, how can it work?
> >
> > This is to avoid an "invalid alarm value" at boot time, which of
> > course should not be a good solution.
> > When the alarm value is read at boot time, "year" is not yet set to
> > the proper value so the year is always set to 1900.
>
> Why isn't it set at boot time? Isn't the register persisting after a
> reboot?
> Setting a bogus alarm is not a solution.
>

Hi, Alexandre:

Sorry, I seem to have misled the issue.
This is a hardware bug, as we know from the datasheet, the year field
in the TOY_MATCH register has only 6 bits (bit[31:26]), so the maximum
value is 63. For example, 2023 can only be read here as 1959,
resulting in an invalid alarm.
The current workaround: after reading the year field in
ls2x_rtc_read_alarm(), manually add 64 or a multiple of 64 (equivalent
to completing the high bits), which also ensures that the reading and
writing is consistent.

> >
> > How about just  "tm->tm_year = -1", as the alarm is now only read when booting?
> >
> > >
> > > > +}
> > > > +
> > > > +static inline void ls2x_rtc_time_to_alarm_regs(struct rtc_time *tm,
> > > > +                                      struct ls2x_rtc_regs *regs)
> > > > +{
> > > > +     regs->reg0 = FIELD_PREP(TOY_MATCH_SEC, tm->tm_sec);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MATCH_MIN, tm->tm_min);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MATCH_HOUR, tm->tm_hour);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MATCH_DAY, tm->tm_mday);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MATCH_MON, tm->tm_mon + 1);
> > > > +     regs->reg0 |= FIELD_PREP(TOY_MATCH_YEAR, tm->tm_year);
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > > > +{
> > > > +     int ret;
> > > > +     struct ls2x_rtc_regs regs;
> > > > +     struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > > > +
> > > > +     ret = regmap_read(priv->regmap, TOY_READ1_REG, &regs.reg1);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ret = regmap_read(priv->regmap, TOY_READ0_REG, &regs.reg0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > >
> > > I never got a reply to my question:
> > >
> > > "
> > > I'm actually wondering why you read first TOY_READ1_REG then
> > > TOY_READ0_REG. ls1x does the opposite and the ls1c datasheet I found
> > > doesn't mention any latching happening. So unless latching is done on
> > > TOY_READ1_REG, you could use regmap_bulk_read and simply avoid struct
> > > ls2x_rtc_regs.
> > > If there is no latching, you may need to read TOY_READ0_REG at least
> > > twice. Because TOY_READ1_REG only contains the year, it is an issue only
> > > on 31 of December and it will not be easy to reproduce.
> > > "
> > >
> >
> > The LS7A and Loongson-2K datasheets also do not mention any latching
> > happening. Reading TOY_READ1_REG first is probably just a matter of
> > habit.
> > I tried using regmap_bulk_xxx() and it also reads and writes time
> > properly. In the next version I will rewrite this part of the code.
> >
> > Example:
> >
> > #define LS2X_NUM_TIME_REGS      2
> >
> > u32 rtc_data[LS2X_NUM_TIME_REGS];
> > struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> >
> > ret = regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> > LS2X_NUM_TIME_REGS);
> >
>
> Doing a bulk read doesn't guarantee the atomicity of the operation. You
> really must check whether a register changed while reading the other
> one.
>

How about protecting with mutex?

> >
> > >
> > > > +     ls2x_rtc_regs_to_time(&regs, tm);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> > > > +{
> > > > +     int ret;
> > > > +     struct ls2x_rtc_regs regs;
> > > > +     struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > > > +
> > > > +     ls2x_rtc_time_to_regs(tm, &regs);
> > > > +
> > > > +     ret = regmap_write(priv->regmap, TOY_WRITE0_REG, regs.reg0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > > > +{
> > > > +     int ret;
> > > > +     struct ls2x_rtc_regs regs;
> > > > +     struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > > > +
> > > > +     ret = regmap_read(priv->regmap, TOY_MATCH0_REG, &regs.reg0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     ls2x_rtc_alarm_regs_to_time(&regs, &alrm->time);
> > > > +     alrm->enabled = !!(readl(priv->acpi_base + PM1_EN_REG) & RTC_EN);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> > > > +{
> > > > +     u32 val;
> > > > +     struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > > > +
> > > > +     spin_lock(&priv->rtc_reglock);
> > > > +     val = readl(priv->acpi_base + PM1_EN_REG);
> > > > +
> > > > +     /* Enalbe RTC alarm */
> > > Typo
> > >
> > > > +     writel((enabled ? val | RTC_EN : val & ~RTC_EN),
> > > > +            priv->acpi_base + PM1_EN_REG);
> > > > +     spin_unlock(&priv->rtc_reglock);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > > > +{
> > > > +     int ret;
> > > > +     struct ls2x_rtc_regs regs;
> > > > +     struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> > > > +
> > > > +     ls2x_rtc_time_to_alarm_regs(&alrm->time, &regs);
> > > > +
> > > > +     ret = regmap_write(priv->regmap, TOY_MATCH0_REG, regs.reg0);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return ls2x_rtc_alarm_irq_enable(dev, alrm->enabled);
> > > > +}
> > > > +
> > > > +static const struct rtc_class_ops ls2x_rtc_ops = {
> > > > +     .read_time = ls2x_rtc_read_time,
> > > > +     .set_time = ls2x_rtc_set_time,
> > > > +     .read_alarm = ls2x_rtc_read_alarm,
> > > > +     .set_alarm = ls2x_rtc_set_alarm,
> > > > +     .alarm_irq_enable = ls2x_rtc_alarm_irq_enable,
> > > > +};
> > > > +
> > > > +static int ls2x_enable_rtc(struct ls2x_rtc_priv *priv)
> > > > +{
> > > > +     u32 val;
> > > > +     int ret;
> > > > +
> > > > +     ret = regmap_read(priv->regmap, RTC_CTRL_REG, &val);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return regmap_write(priv->regmap, RTC_CTRL_REG,
> > > > +                         val | TOY_ENABLE | OSC_ENABLE);
> > > > +}
> > > > +
> > > > +static int ls2x_rtc_probe(struct platform_device *pdev)
> > > > +{
> > > > +     int ret;
> > > > +     void __iomem *regs;
> > > > +     struct ls2x_rtc_priv *priv;
> > > > +     struct device *dev = &pdev->dev;
> > > > +
> > > > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     priv->irq = platform_get_irq(pdev, 0);
> > > > +     if (priv->irq < 0)
> > > > +             return dev_err_probe(dev, priv->irq, "platform_get_irq failed\n");
> > > > +
> > > > +     platform_set_drvdata(pdev, priv);
> > > > +
> > > > +     regs = devm_platform_ioremap_resource(pdev, 0);
> > > > +     if (IS_ERR(regs))
> > > > +             return dev_err_probe(dev, PTR_ERR(regs),
> > > > +                                  "devm_platform_ioremap_resource failed\n");
> > > > +
> > > > +     priv->regmap = devm_regmap_init_mmio(dev, regs,
> > > > +                                          &ls2x_rtc_regmap_config);
> > > > +     if (IS_ERR(priv->regmap))
> > > > +             return dev_err_probe(dev, PTR_ERR(priv->regmap),
> > > > +                                  "devm_regmap_init_mmio failed\n");
> > > > +
> > > > +     priv->rtcdev = devm_rtc_allocate_device(dev);
> > > > +     if (IS_ERR(priv->rtcdev))
> > > > +             return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> > > > +                                  "devm_rtc_allocate_device failed\n");
> > > > +
> > > > +     /* Due to hardware erratum, all years multiple of 4 are considered
> > > > +      * leap year, so only years 2000 through 2099 are usable.
> > > > +      *
> > > > +      * Previous out-of-tree versions of this driver wrote tm_year directly
> > > > +      * into the year register, so epoch 2000 must be used to preserve
> > > > +      * semantics on shipped systems.
> > > > +      */
> > > > +     priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
> > > > +     priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
> > > > +     priv->rtcdev->ops = &ls2x_rtc_ops;
> > > > +     priv->acpi_base = regs - PM_RTC_OFFSET;
> > > > +     spin_lock_init(&priv->rtc_reglock);
> > > > +     clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
> > >
> > > Why?
> >
> > If you don't clear UIE, on the Loongson-2k, the shutdown will turn
> > into a reboot after setting up the wakealarm.
> >
>
> Why? I don't get how UIE can have this effect.
>

In fact, we need to clear the RTC wakeup interrupt manually.
I will fix this in the next release and remove clear_bit().

> > >
> > > > +
> > > > +#ifdef CONFIG_ACPI
> > > > +     if (!acpi_disabled)
> > > > +             acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> > > > +                                              ls2x_acpi_fix_handler, priv);
> > > > +#endif
> > > > +
> > > > +     ret = ls2x_enable_rtc(priv);
> > > > +     if (ret < 0)
> > > > +             return dev_err_probe(dev, ret, "ls2x_enable_rtc failed\n");
> > >
> > > This should not be done in probe but on the first set_time. This then
> > > allows you to know whether the time has been set and is valid in
> > > read_time. Please add the check.
> >
> > Actually I don't quite understand the point you are making, the
> > function just enables the TOY counter, would there be any particular
> > problem with calling it in the probe function?
> >
>
> Yes, you are losing an important bit of information which is that if
> TOY_ENABLE is not set, then you know the time has not been set. Else,
> you allow reading an known invalid time.
>

I will enable the RTC in set_time() and check in read_time() that it
has been enabled

Thanks.


Binbin

>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
