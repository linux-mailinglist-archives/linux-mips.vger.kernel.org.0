Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6DEE678C0F
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jan 2023 00:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjAWXeI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Jan 2023 18:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjAWXeH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Jan 2023 18:34:07 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC333A91;
        Mon, 23 Jan 2023 15:34:05 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0884D1BF203;
        Mon, 23 Jan 2023 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674516843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QiBvzWJ4h7GTZASo+BoK0bhH2f2VIgwoNcpsiUcFzG4=;
        b=Q9Qn2HPlYgnFvR+h1n8QbIrH2NQpqg/flUOx+fx0N02cpUM3q+hyl2R55VfkzMXPuObVQj
        8z5YDyJcZjf+H9CReBAMerSWVc44EnIqe+nwTQD7h+NK37wDe5+Y34wB9cvv9nj9UDFSoo
        GjuhzrwUjtmmKRb1MKuQwIuzla6v2cOeqgMM/HrP2UvnjbhoY5zEsok9/1N/fNrqFciIL8
        b24JdLrQLgCiki7eCHc5GTYSHbyDrRGnte3is1ryYLQ3prHg4MyBHVGmKXu1evhJMs/gDZ
        tXnrSl7urvwMasBovvhExoWMKEc7ncl1DJ3DwJU7GYl0rhWOJquKA7SE4vaOrw==
Date:   Tue, 24 Jan 2023 00:34:01 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
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
Subject: Re: [PATCH V2 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Message-ID: <Y88ZaWnh9ERRocPv@mail.local>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
 <8cd5e1b763951d4ce69188cdff95d8adaf12755f.1673227292.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd5e1b763951d4ce69188cdff95d8adaf12755f.1673227292.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,


On 09/01/2023 09:35:12+0800, Binbin Zhou wrote:
> This RTC module is integrated into the Loongson-2K SoC and the LS7A
> bridge chip. This version is almost entirely rewritten to make use of
> current kernel API, and it supports both ACPI and DT.
> 
> This driver is shared by MIPS-based Loongson-3A4000 system (use FDT) and
> LoongArch-based Loongson-3A5000 system (use ACPI).
> 

checkpatch.pl --strict complains, please fix the warnings and checks


> +#ifdef CONFIG_ACPI
> +static u32 ls2x_acpi_fix_handler(void *id)
> +{
> +	int ret;
> +	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
> +
> +	spin_lock(&priv->rtc_reglock);
> +
> +	/* Disable acpi rtc enabled */
> +	ret = readl(priv->acpi_base + PM1_EN_REG) & ~RTC_EN;
> +	writel(ret, priv->acpi_base + PM1_EN_REG);
> +
> +	/* Clear acpi rtc interrupt Status */
> +	writel(RTC_STS, priv->acpi_base + PM1_STS_REG);
> +
> +	spin_unlock(&priv->rtc_reglock);
> +
> +	/*
> +	 * The TOY_MATCH0_REG should be cleared 0 here,
> +	 * otherwise the interrupt cannot be cleared.
> +	 * Because the match condition is still satisfied
> +	 */
> +	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +	if (ret < 0)
> +		return ret;

How is this an ACPI related issue? I guess the same would happen on
!ACPI.

> +
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);

This is not useful, at that time, userspace has had no chance to open
the RTC device file as it is not created yet.

> +	return 0;
> +}
> +#endif
> +
> +static inline void ls2x_rtc_regs_to_time(struct ls2x_rtc_regs *regs,

Those static inline functions seem to be used only once, you should just
put the code in the proper location.

> +					 struct rtc_time *tm)
> +{
> +	tm->tm_year = regs->reg1;
> +	tm->tm_sec = FIELD_GET(TOY_SEC, regs->reg0);
> +	tm->tm_min = FIELD_GET(TOY_MIN, regs->reg0);
> +	tm->tm_hour = FIELD_GET(TOY_HOUR, regs->reg0);
> +	tm->tm_mday = FIELD_GET(TOY_DAY, regs->reg0);
> +	tm->tm_mon = FIELD_GET(TOY_MON, regs->reg0) - 1;
> +}
> +
> +static inline void ls2x_rtc_time_to_regs(struct rtc_time *tm,
> +					 struct ls2x_rtc_regs *regs)
> +{
> +	regs->reg0 = FIELD_PREP(TOY_SEC, tm->tm_sec);
> +	regs->reg0 |= FIELD_PREP(TOY_MIN, tm->tm_min);
> +	regs->reg0 |= FIELD_PREP(TOY_HOUR, tm->tm_hour);
> +	regs->reg0 |= FIELD_PREP(TOY_DAY, tm->tm_mday);
> +	regs->reg0 |= FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> +	regs->reg1 = tm->tm_year;
> +}
> +
> +static inline void ls2x_rtc_alarm_regs_to_time(struct ls2x_rtc_regs *regs,
> +					 struct rtc_time *tm)
> +{
> +	tm->tm_sec = FIELD_GET(TOY_MATCH_SEC, regs->reg0);
> +	tm->tm_min = FIELD_GET(TOY_MATCH_MIN, regs->reg0);
> +	tm->tm_hour = FIELD_GET(TOY_MATCH_HOUR, regs->reg0);
> +	tm->tm_mday = FIELD_GET(TOY_MATCH_DAY, regs->reg0);
> +	tm->tm_mon = FIELD_GET(TOY_MATCH_MON, regs->reg0) - 1;
> +	/*
> +	 * The rtc SYS_TOYMATCH0/YEAR bit field is only 6 bits, so it means 63
> +	 * years at most. Therefore, The RTC alarm years can be set from 1900
> +	 * to 1963. This causes the initialization of alarm fail during call
> +	 * __rtc_read_alarm.
> +	 * We add 64 years offset to ls2x_rtc_read_alarm. After adding the
> +	 * offset, the RTC alarm clock can be set from 1964 to 2027.
> +	 */
> +	tm->tm_year = FIELD_GET(TOY_MATCH_YEAR, regs->reg0) + 64;

This is not symmetric with ls2x_rtc_time_to_alarm_regs, how can it work?

> +}
> +
> +static inline void ls2x_rtc_time_to_alarm_regs(struct rtc_time *tm,
> +					 struct ls2x_rtc_regs *regs)
> +{
> +	regs->reg0 = FIELD_PREP(TOY_MATCH_SEC, tm->tm_sec);
> +	regs->reg0 |= FIELD_PREP(TOY_MATCH_MIN, tm->tm_min);
> +	regs->reg0 |= FIELD_PREP(TOY_MATCH_HOUR, tm->tm_hour);
> +	regs->reg0 |= FIELD_PREP(TOY_MATCH_DAY, tm->tm_mday);
> +	regs->reg0 |= FIELD_PREP(TOY_MATCH_MON, tm->tm_mon + 1);
> +	regs->reg0 |= FIELD_PREP(TOY_MATCH_YEAR, tm->tm_year);
> +}
> +
> +static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	int ret;
> +	struct ls2x_rtc_regs regs;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ret = regmap_read(priv->regmap, TOY_READ1_REG, &regs.reg1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(priv->regmap, TOY_READ0_REG, &regs.reg0);
> +	if (ret < 0)
> +		return ret;
> +

I never got a reply to my question:

"
I'm actually wondering why you read first TOY_READ1_REG then
TOY_READ0_REG. ls1x does the opposite and the ls1c datasheet I found
doesn't mention any latching happening. So unless latching is done on
TOY_READ1_REG, you could use regmap_bulk_read and simply avoid struct
ls2x_rtc_regs.
If there is no latching, you may need to read TOY_READ0_REG at least
twice. Because TOY_READ1_REG only contains the year, it is an issue only
on 31 of December and it will not be easy to reproduce.
"


> +	ls2x_rtc_regs_to_time(&regs, tm);
> +	return 0;
> +}
> +
> +static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	int ret;
> +	struct ls2x_rtc_regs regs;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ls2x_rtc_time_to_regs(tm, &regs);
> +
> +	ret = regmap_write(priv->regmap, TOY_WRITE0_REG, regs.reg0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, TOY_WRITE1_REG, regs.reg1);
> +}
> +
> +static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	int ret;
> +	struct ls2x_rtc_regs regs;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ret = regmap_read(priv->regmap, TOY_MATCH0_REG, &regs.reg0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ls2x_rtc_alarm_regs_to_time(&regs, &alrm->time);
> +	alrm->enabled = !!(readl(priv->acpi_base + PM1_EN_REG) & RTC_EN);
> +
> +	return 0;
> +}
> +
> +static int ls2x_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	u32 val;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	spin_lock(&priv->rtc_reglock);
> +	val = readl(priv->acpi_base + PM1_EN_REG);
> +
> +	/* Enalbe RTC alarm */
Typo

> +	writel((enabled ? val | RTC_EN : val & ~RTC_EN),
> +	       priv->acpi_base + PM1_EN_REG);
> +	spin_unlock(&priv->rtc_reglock);
> +
> +	return 0;
> +}
> +
> +static int ls2x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	int ret;
> +	struct ls2x_rtc_regs regs;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ls2x_rtc_time_to_alarm_regs(&alrm->time, &regs);
> +
> +	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, regs.reg0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ls2x_rtc_alarm_irq_enable(dev, alrm->enabled);
> +}
> +
> +static const struct rtc_class_ops ls2x_rtc_ops = {
> +	.read_time = ls2x_rtc_read_time,
> +	.set_time = ls2x_rtc_set_time,
> +	.read_alarm = ls2x_rtc_read_alarm,
> +	.set_alarm = ls2x_rtc_set_alarm,
> +	.alarm_irq_enable = ls2x_rtc_alarm_irq_enable,
> +};
> +
> +static int ls2x_enable_rtc(struct ls2x_rtc_priv *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, RTC_CTRL_REG,
> +			    val | TOY_ENABLE | OSC_ENABLE);
> +}
> +
> +static int ls2x_rtc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	void __iomem *regs;
> +	struct ls2x_rtc_priv *priv;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		return dev_err_probe(dev, priv->irq, "platform_get_irq failed\n");
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return dev_err_probe(dev, PTR_ERR(regs),
> +				     "devm_platform_ioremap_resource failed\n");
> +
> +	priv->regmap = devm_regmap_init_mmio(dev, regs,
> +					     &ls2x_rtc_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "devm_regmap_init_mmio failed\n");
> +
> +	priv->rtcdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rtcdev))
> +		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> +				     "devm_rtc_allocate_device failed\n");
> +
> +	/* Due to hardware erratum, all years multiple of 4 are considered
> +	 * leap year, so only years 2000 through 2099 are usable.
> +	 *
> +	 * Previous out-of-tree versions of this driver wrote tm_year directly
> +	 * into the year register, so epoch 2000 must be used to preserve
> +	 * semantics on shipped systems.
> +	 */
> +	priv->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	priv->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
> +	priv->rtcdev->ops = &ls2x_rtc_ops;
> +	priv->acpi_base = regs - PM_RTC_OFFSET;
> +	spin_lock_init(&priv->rtc_reglock);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);

Why?

> +
> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)
> +		acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> +						 ls2x_acpi_fix_handler, priv);
> +#endif
> +
> +	ret = ls2x_enable_rtc(priv);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "ls2x_enable_rtc failed\n");

This should not be done in probe but on the first set_time. This then
allows you to know whether the time has been set and is valid in
read_time. Please add the check.

> +
> +	ret = devm_request_threaded_irq(dev, priv->irq, NULL, ls2x_rtc_isr,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"ls2x-alarm", priv);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n",
> +				     priv->irq);
> +
> +	if (!device_can_wakeup(&pdev->dev))
> +		device_init_wakeup(dev, 1);
> +
> +	return devm_rtc_register_device(priv->rtcdev);
> +}
> +
> +static const struct of_device_id ls2x_rtc_of_match[] = {
> +	{ .compatible = "loongson,ls2x-rtc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ls2x_rtc_of_match);
> +
> +static const struct acpi_device_id ls2x_rtc_acpi_match[] = {
> +	{ "LOON0001" }, /* Loongson LS7A */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, ls2x_rtc_acpi_match);
> +
> +static struct platform_driver ls2x_rtc_driver = {
> +	.probe		= ls2x_rtc_probe,
> +	.driver		= {
> +		.name	= "ls2x-rtc",
> +		.of_match_table = ls2x_rtc_of_match,
> +		.acpi_match_table = ls2x_rtc_acpi_match,
> +	},
> +};
> +
> +module_platform_driver(ls2x_rtc_driver);
> +
> +MODULE_DESCRIPTION("Loongson LS2X RTC driver");
> +MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
> +MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
> +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.31.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
