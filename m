Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F7C6E3BB1
	for <lists+linux-mips@lfdr.de>; Sun, 16 Apr 2023 21:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjDPTtQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Apr 2023 15:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjDPTtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Apr 2023 15:49:14 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A61CA;
        Sun, 16 Apr 2023 12:49:05 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0395E1C0005;
        Sun, 16 Apr 2023 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681674544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pJSVX4FqBPkZHfMQslcs3d9TSCmKl1slngcq7yAZSxk=;
        b=ohKSv1EumySw2b6jWDSIC3R51I1Q8mDLDSpeaKLqwG3zs98E92NvFqxcKWRRLn9i9azmC4
        7Jo/p1aavLCT36icqrG4Hfkcu/mWmnZWCR66QISK9mU+2R/78V1qAzZKvwKfHjw6DM5+4A
        6KvcJEWRwRouq8taerzoYiWL48UOT5irOfKC5EZVmX9ThAEVEJfvYHdkk5LPlUVj0aI79W
        rLa0f3uZUFo+kTLXR2NzIH20VcWCmPVZkf41M5ajwktgjmuueRvygrigarQDI0Jh0DGeCM
        74pm3fB2vPEJLk2MnUDL3OxHgZjN6/o0voQsmFUsI7A+CWt4czvzyMPoTx5NCQ==
Date:   Sun, 16 Apr 2023 21:49:01 +0200
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
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH V3 2/7] rtc: Add support for the Loongson-2K/LS7A RTC
Message-ID: <20230416194901b538cb7c@mail.local>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
 <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09f381f445cfbcf857845f61d10238452037b2e8.1681370153.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2023 15:57:34+0800, Binbin Zhou wrote:
> This RTC module is integrated into the Loongson-2K SoC and the LS7A
> bridge chip. This version is almost entirely rewritten to make use of
> current kernel API, and it supports both ACPI and DT.
> 
> This driver is shared by MIPS-based Loongson-3A4000 system (use FDT) and
> LoongArch-based Loongson-3A5000 system (use ACPI).
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  drivers/rtc/Kconfig    |  11 ++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-ls2x.c | 345 +++++++++++++++++++++++++++++++++++++++++

This is v3 and this is still not merged in rtc-ls1x.c.

>  3 files changed, 357 insertions(+)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 753872408615..e1b9d64d2678 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1706,6 +1706,17 @@ config RTC_DRV_LPC32XX
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-lpc32xx.
>  
> +config RTC_DRV_LS2X
> +	tristate "Loongson LS2X RTC"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  If you say yes here you get support for the RTC on the Loongson-2K
> +	  SoC and LS7A bridge, which first appeared on the Loongson-2H.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-ls2x.
> +
>  config RTC_DRV_PM8XXX
>  	tristate "Qualcomm PMIC8XXX RTC"
>  	depends on MFD_PM8XXX || MFD_SPMI_PMIC || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index ea445d1ebb17..cff5df09fc60 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -82,6 +82,7 @@ obj-$(CONFIG_RTC_DRV_LOONGSON1)	+= rtc-ls1x.o
>  obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)	+= rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)	+= rtc-lpc32xx.o
> +obj-$(CONFIG_RTC_DRV_LS2X)	+= rtc-ls2x.o
>  obj-$(CONFIG_RTC_DRV_M41T80)	+= rtc-m41t80.o
>  obj-$(CONFIG_RTC_DRV_M41T93)	+= rtc-m41t93.o
>  obj-$(CONFIG_RTC_DRV_M41T94)	+= rtc-m41t94.o
> diff --git a/drivers/rtc/rtc-ls2x.c b/drivers/rtc/rtc-ls2x.c
> new file mode 100644
> index 000000000000..c74dd88ae11b
> --- /dev/null
> +++ b/drivers/rtc/rtc-ls2x.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson-2K/LS7A RTC driver
> + *
> + * Based on the original out-of-tree Loongson-2H RTC driver for Linux 2.6.32,
> + * by Shaozong Liu <liushaozong@loongson.cn>.
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
> +#define TOY_TRIM_REG		0x20 /* Must be initialized to 0 */
> +#define TOY_WRITE0_REG		0x24 /* TOY low 32-bits value (write-only) */
> +#define TOY_WRITE1_REG		0x28 /* TOY high 32-bits value (write-only) */
> +#define TOY_READ0_REG		0x2c /* TOY low 32-bits value (read-only) */
> +#define TOY_READ1_REG		0x30 /* TOY high 32-bits value (read-only) */
> +#define TOY_MATCH0_REG		0x34 /* TOY timing interrupt 0 */
> +#define TOY_MATCH1_REG		0x38 /* TOY timing interrupt 1 */
> +#define TOY_MATCH2_REG		0x3c /* TOY timing interrupt 2 */
> +
> +/* RTC counters registers */
> +#define RTC_CTRL_REG		0x40 /* TOY and RTC control register */
> +#define RTC_TRIM_REG		0x60 /* Must be initialized to 0 */
> +#define RTC_WRITE0_REG		0x64 /* RTC counters value (write-only) */
> +#define RTC_READ0_REG		0x68 /* RTC counters value (read-only) */
> +#define RTC_MATCH0_REG		0x6c /* RTC timing interrupt 0 */
> +#define RTC_MATCH1_REG		0x70 /* RTC timing interrupt 1 */
> +#define RTC_MATCH2_REG		0x74 /* RTC timing interrupt 2 */
> +
> +/* bitmask of TOY_WRITE0_REG */
> +#define TOY_MON			GENMASK(31, 26)
> +#define TOY_DAY			GENMASK(25, 21)
> +#define TOY_HOUR		GENMASK(20, 16)
> +#define TOY_MIN			GENMASK(15, 10)
> +#define TOY_SEC			GENMASK(9, 4)
> +#define TOY_MSEC		GENMASK(3, 0)
> +
> +/* bitmask of TOY_MATCH0/1/2_REG */
> +#define TOY_MATCH_YEAR		GENMASK(31, 26)
> +#define TOY_MATCH_MON		GENMASK(25, 22)
> +#define TOY_MATCH_DAY		GENMASK(21, 17)
> +#define TOY_MATCH_HOUR		GENMASK(16, 12)
> +#define TOY_MATCH_MIN		GENMASK(11, 6)
> +#define TOY_MATCH_SEC		GENMASK(5, 0)
> +
> +/* bitmask of RTC_CTRL_REG */
> +#define RTC_ENABLE		BIT(13) /* 1: RTC counters enable */
> +#define TOY_ENABLE		BIT(11) /* 1: TOY counters enable */
> +#define OSC_ENABLE		BIT(8) /* 1: 32.768k crystal enable */
> +#define TOY_ENABLE_MASK		(TOY_ENABLE | OSC_ENABLE)
> +
> +/* PM domain registers */
> +#define PM1_STS_REG		0x0c /* Power management 1 status register */
> +#define RTC_STS			BIT(10) /* RTC status */
> +#define PM1_EN_REG		0x10 /* Power management 1 enable register */
> +#define RTC_EN			BIT(10) /* RTC event enable */
> +
> +/* Offset of PM domain from RTC domain, for rtc alarm */
> +enum ls2x_pm_offset {
> +	GENERIC_OFFSET = 0x100,
> +	LS2K1000_OFFSET = 0x800,
> +};
> +
> +struct ls2x_rtc_priv {
> +	spinlock_t lock; /* protects PM registers access */
> +	int irq;
> +	struct rtc_device *rtcdev;
> +	struct regmap *regmap;
> +	void __iomem *pm_base; /* PM domain base, for rtc alarm */
> +};
> +
> +static const struct regmap_config ls2x_rtc_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +/* IRQ Handlers */
> +static irqreturn_t ls2x_rtc_isr(int irq, void *id)
> +{
> +	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
> +
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	return IRQ_HANDLED;
> +}
> +
> +static u32 ls2x_rtc_handler(void *id)
> +{
> +	u32 ret;
> +	struct ls2x_rtc_priv *priv = (struct ls2x_rtc_priv *)id;
> +
> +	spin_lock(&priv->lock);
> +	/* Disable rtc event */
> +	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> +	       priv->pm_base + PM1_EN_REG);
> +
> +	/* Clear rtc interrupt status */
> +	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
> +	spin_unlock(&priv->lock);
> +
> +	/*
> +	 * The TOY_MATCH0_REG should be cleared 0 here,
> +	 * otherwise the interrupt cannot be cleared.
> +	 */
> +	ret = regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	return 0;
> +}
> +
> +static int ls2x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	int ret;
> +	u32 ctrl_data, rtc_data[2];
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!(ctrl_data & TOY_ENABLE_MASK))
> +		return -EINVAL;
> +
> +	ret = regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> +			       ARRAY_SIZE(rtc_data));

There is still no answer on whether the TOY_READ0_REG and TOY_READ1_REG
are latched.

> +	if (ret < 0)
> +		return ret;
> +
> +	tm->tm_sec = FIELD_GET(TOY_SEC, rtc_data[0]);
> +	tm->tm_min = FIELD_GET(TOY_MIN, rtc_data[0]);
> +	tm->tm_hour = FIELD_GET(TOY_HOUR, rtc_data[0]);
> +	tm->tm_mday = FIELD_GET(TOY_DAY, rtc_data[0]);
> +	tm->tm_mon = FIELD_GET(TOY_MON, rtc_data[0]) - 1;
> +	tm->tm_year = rtc_data[1];
> +
> +	return 0;
> +}
> +
> +static int ls2x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	int ret;
> +	u32 rtc_data[2];
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	rtc_data[0] = FIELD_PREP(TOY_SEC, tm->tm_sec)
> +		    | FIELD_PREP(TOY_MIN, tm->tm_min)
> +		    | FIELD_PREP(TOY_HOUR, tm->tm_hour)
> +		    | FIELD_PREP(TOY_DAY, tm->tm_mday)
> +		    | FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> +	rtc_data[1] = tm->tm_year;
> +
> +	ret = regmap_bulk_write(priv->regmap, TOY_WRITE0_REG, rtc_data,
> +				ARRAY_SIZE(rtc_data));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Enable RTC TOY counters and crystal */
> +	return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_MASK,
> +				  TOY_ENABLE_MASK);
> +}
> +
> +static int ls2x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	int ret;
> +	u32 alarm_data;
> +	struct ls2x_rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	ret = regmap_read(priv->regmap, TOY_MATCH0_REG, &alarm_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	alrm->time.tm_sec = FIELD_GET(TOY_MATCH_SEC, alarm_data);
> +	alrm->time.tm_min = FIELD_GET(TOY_MATCH_MIN, alarm_data);
> +	alrm->time.tm_hour = FIELD_GET(TOY_MATCH_HOUR, alarm_data);
> +	alrm->time.tm_mday = FIELD_GET(TOY_MATCH_DAY, alarm_data);
> +	alrm->time.tm_mon = FIELD_GET(TOY_MATCH_MON, alarm_data) - 1;
> +	/*
> +	 * This is a hardware bug.
> +	 * The year field in the SYS_TOYMATCH has only 6 bits(bits[31:26]),
> +	 * so it can only be set from 1900 to 1963.
> +	 * In order to avoid an invalid alarm value during booting, we manually
> +	 * add 64 after reading the year field (equivalent to filling in the
> +	 * high bits).
> +	 */
> +	alrm->time.tm_year = FIELD_GET(TOY_MATCH_YEAR, alarm_data) + 64;

This is restricting to the 1964 to 2027 range whereas you claim the RTC
has a 2000 to 2099 range. Why don't you simply do 2000 to 2063 which
would at least match most of it.

I am very very disappointed. I had all these comments on v1 and v2, you
are sending v3 with the exact same issues. How can I trust this is ever
going to progress in the right direction?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
