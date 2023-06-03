Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE076720E6D
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jun 2023 09:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbjFCHHn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Jun 2023 03:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbjFCHHX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Jun 2023 03:07:23 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C77110DE;
        Sat,  3 Jun 2023 00:06:02 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D7D125C0184;
        Sat,  3 Jun 2023 03:04:53 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Sat, 03 Jun 2023 03:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1685775893; x=1685862293; bh=lNGhPmFc2QnROARGrjsHczGXZjVuecyubn0
        WdIMCxlM=; b=KZqz/U161dhdhc50B3ztQ1AmJoTx5eCByl5sjINFYmZkpgz9ouA
        To79XvcvUVuhl/rEMw8Bai94mya3BGphjS8xRvFHBY42rvNg0a+027AxNQrr6qR4
        2EwKEQvjOxBLTfh1Vt3S8TShnM8CkV4VNir2MknYUQohI/tMaxVuvNg4pXQhpCn3
        S3zsekR0IGRD+JjQ+qiTXhtKqpmVRaJDdissJvNjeSjDfjjYK4WSI0dzgNxnv7DA
        a8RTUp90wsSRXaq7jHtM42iWFG8B2h77ocIeUwSdiL6DIcEmgelY/HMUAkAoe+h6
        goBgLY95aosBYDYNZEUMvM+Mzb6cnpoASAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1685775893; x=1685862293; bh=lNGhPmFc2QnROARGrjsHczGXZjVuecyubn0
        WdIMCxlM=; b=Lfi7CduJgjhpaSJDRMH2HzNMx+5ocTmYO0t691pNo4HG3GQJ6kl
        yLqljK1jQKRENFFC0j9buLJ7befG7jJ5ppWLdSHudjaty0aVj4V+bOe9RiazXdrZ
        A8j3xpaSHCSvTxx67ixCZ11wx13tnU+vlwOs9el+NQ0nEPbG7MwGmyYC54anniAO
        E7JkW4cP2G0fSouTGbwwZO1rr/AhSHbaQAWmk6MumbElIs/nbiRc3ZQClCbaqVvN
        Qhml8wCEAOaIaKZkG9EffMXhLe7kBp4qNfvSgQIC+raMb49g+8HpcuxzOIIT82Sk
        V6QZblYUjVP+1D0t8ExJch66G/mxjwNaPfA==
X-ME-Sender: <xms:E-Z6ZI4N1JZRHQS7nRqSNvSUFXLTz1f51kwJiJTP73ljY6DI70lZlA>
    <xme:E-Z6ZJ51VaflhAEwP9-PFezzbRMiH3UUe4e3SpUYgmWN3vv9KirMMWm1l9DXfULOe
    2dLGuIbKmTw8k0o_ZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelgedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:E-Z6ZHdgF3BVdtDiztIsa9Gk6HNcxIgkWTdtCWPQeFfvAuflfXIhsA>
    <xmx:E-Z6ZNJoNh8vaztf_2wKU5RvPhrfpQmjKkyPGb8qk803WWszfWNkiw>
    <xmx:E-Z6ZMIRMyavbGV0j9YDlcBC6pBFcBtHoF6OWY2s6Z9YppD-JSWNgg>
    <xmx:FeZ6ZFcL0oMGI25u3RPQTcB9mLDQqJJRsJLUZ5KVSfNKdu93uNoFiQ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 97C8D36A0073; Sat,  3 Jun 2023 03:04:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <3ad508a0-f880-4b30-bada-211582155356@app.fastmail.com>
In-Reply-To: <0c5171156390f614d72f36ceb04a20f432ca639e.1685693501.git.zhoubinbin@loongson.cn>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
 <0c5171156390f614d72f36ceb04a20f432ca639e.1685693501.git.zhoubinbin@loongson.cn>
Date:   Sat, 03 Jun 2023 15:04:31 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Binbin Zhou" <zhoubinbin@loongson.cn>,
        "Binbin Zhou" <zhoubb.aaron@gmail.com>,
        "Huacai Chen" <chenhuacai@loongson.cn>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     "Huacai Chen" <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn,
        "Xuerui Wang" <kernel@xen0n.name>, loongarch@lists.linux.dev,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Kelvin Cheung" <keguang.zhang@gmail.com>,
        "zhao zhang" <zhzhl555@gmail.com>,
        "Yang Ling" <gnaygnil@gmail.com>, "WANG Xuerui" <git@xen0n.name>
Subject: Re: [PATCH V5 3/5] rtc: Add rtc driver for the Loongson family chips
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E5=9C=A82023=E5=B9=B46=E6=9C=882=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=885:50=EF=BC=8CBinbin Zhou=E5=86=99=E9=81=93=EF=BC=9A
> The Loongson family chips use an on-chip counter 0 (Time Of Year
> counter) as the RTC. We will refer to them as rtc-loongson.
>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Yang Ling <gnaygnil@gmail.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Reviewed-by:  Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # LS7A

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
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-jz4740.
>=20
> +config RTC_DRV_LOONGSON
> +	tristate "Loongson On-chip RTC"
> +	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  This is a driver for the Loongson on-chip Counter0 (Time-Of-Year
> +	  counter) to be used as a RTC.
> +	  It can be found on Loongson-1 series cpu, Loongson-2K series cpu
> +	  and Loongson LS7A bridge chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-loongson.
> +
>  config RTC_DRV_LPC24XX
>  	tristate "NXP RTC for LPC178x/18xx/408x/43xx"
>  	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index c50afd8fb9f4..fd209883ee2e 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_RTC_DRV_ISL12022)	+=3D rtc-isl12022.o
>  obj-$(CONFIG_RTC_DRV_ISL12026)	+=3D rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)	+=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_JZ4740)	+=3D rtc-jz4740.o
> +obj-$(CONFIG_RTC_DRV_LOONGSON)	+=3D rtc-loongson.o
>  obj-$(CONFIG_RTC_DRV_LP8788)	+=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC24XX)	+=3D rtc-lpc24xx.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)	+=3D rtc-lpc32xx.o
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
> +#define PM1_STS_REG		0x0c	/* Power management 1 status register */
> +#define RTC_STS			BIT(10)	/* RTC status */
> +#define PM1_EN_REG		0x10	/* Power management 1 enable register */
> +#define RTC_EN			BIT(10)	/* RTC event enable */
> +
> +/*
> + * According to the LS1C manual, RTC_CTRL and alarm-related registers=20
> are not defined.
> + * Accessing the relevant registers will cause the system to hang.
> + */
> +#define LS1C_RTC_CTRL_WORKAROUND	BIT(0)
> +
> +struct loongson_rtc_config {
> +	u32 pm_offset;	/* Offset of PM domain, for RTC alarm wakeup */
> +	u32 flags;	/* Workaround bits */
> +};
> +
> +struct loongson_rtc_priv {
> +	spinlock_t lock;	/* protects PM registers access */
> +	u32 fix_year;		/* RTC alarm year compensation value */
> +	struct rtc_device *rtcdev;
> +	struct regmap *regmap;
> +	void __iomem *pm_base;	/* PM domain base, for RTC alarm wakeup */
> +	const struct loongson_rtc_config *config;
> +};
> +
> +static const struct loongson_rtc_config ls1b_rtc_config =3D {
> +	.pm_offset =3D 0,
> +	.flags =3D 0,
> +};
> +
> +static const struct loongson_rtc_config ls1c_rtc_config =3D {
> +	.pm_offset =3D 0,
> +	.flags =3D LS1C_RTC_CTRL_WORKAROUND,
> +};
> +
> +static const struct loongson_rtc_config generic_rtc_config =3D {
> +	.pm_offset =3D 0x100,
> +	.flags =3D 0,
> +};
> +
> +static const struct loongson_rtc_config ls2k1000_rtc_config =3D {
> +	.pm_offset =3D 0x800,
> +	.flags =3D 0,
> +};
> +
> +static const struct regmap_config loongson_rtc_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +/* RTC alarm irq handler */
> +static irqreturn_t loongson_rtc_isr(int irq, void *id)
> +{
> +	struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id;
> +
> +	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> +	return IRQ_HANDLED;
> +}
> +
> +/* For ACPI fixed event handler */
> +static u32 loongson_rtc_handler(void *id)
> +{
> +	struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id;
> +
> +	spin_lock(&priv->lock);
> +	/* Disable RTC alarm wakeup and interrupt */
> +	writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> +	       priv->pm_base + PM1_EN_REG);
> +
> +	/* Clear RTC interrupt status */
> +	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
> +	spin_unlock(&priv->lock);
> +
> +	/*
> +	 * The TOY_MATCH0_REG should be cleared 0 here,
> +	 * otherwise the interrupt cannot be cleared.
> +	 */
> +	return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> +}
> +
> +static int loongson_rtc_set_enabled(struct device *dev)
> +{
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
> +		return 0;
> +
> +	/* Enable RTC TOY counters and crystal */
> +	return regmap_update_bits(priv->regmap, RTC_CTRL_REG, TOY_ENABLE_MAS=
K,
> +				  TOY_ENABLE_MASK);
> +}
> +
> +static bool loongson_rtc_get_enabled(struct device *dev)
> +{
> +	int ret;
> +	u32 ctrl_data;
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
> +		return true;
> +
> +	ret =3D regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
> +	if (ret < 0)
> +		return false;
> +
> +	return ctrl_data & TOY_ENABLE_MASK;
> +}
> +
> +static int loongson_rtc_read_time(struct device *dev, struct rtc_time=20
> *tm)
> +{
> +	int ret;
> +	u32 rtc_data[2];
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	if (!loongson_rtc_get_enabled(dev))
> +		return -EINVAL;
> +
> +	ret =3D regmap_bulk_read(priv->regmap, TOY_READ0_REG, rtc_data,
> +			       ARRAY_SIZE(rtc_data));
> +	if (ret < 0)
> +		return ret;
> +
> +	tm->tm_sec =3D FIELD_GET(TOY_SEC, rtc_data[0]);
> +	tm->tm_min =3D FIELD_GET(TOY_MIN, rtc_data[0]);
> +	tm->tm_hour =3D FIELD_GET(TOY_HOUR, rtc_data[0]);
> +	tm->tm_mday =3D FIELD_GET(TOY_DAY, rtc_data[0]);
> +	tm->tm_mon =3D FIELD_GET(TOY_MON, rtc_data[0]) - 1;
> +	tm->tm_year =3D rtc_data[1];
> +
> +	/* Prepare for RTC alarm year compensation value. */
> +	priv->fix_year =3D tm->tm_year / 64 * 64;
> +	return 0;
> +}
> +
> +static int loongson_rtc_set_time(struct device *dev, struct rtc_time=20
> *tm)
> +{
> +	int ret;
> +	u32 rtc_data[2];
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	rtc_data[0] =3D FIELD_PREP(TOY_SEC, tm->tm_sec)
> +		    | FIELD_PREP(TOY_MIN, tm->tm_min)
> +		    | FIELD_PREP(TOY_HOUR, tm->tm_hour)
> +		    | FIELD_PREP(TOY_DAY, tm->tm_mday)
> +		    | FIELD_PREP(TOY_MON, tm->tm_mon + 1);
> +	rtc_data[1] =3D tm->tm_year;
> +
> +	ret =3D regmap_bulk_write(priv->regmap, TOY_WRITE0_REG, rtc_data,
> +				ARRAY_SIZE(rtc_data));
> +	if (ret < 0)
> +		return ret;
> +
> +	return loongson_rtc_set_enabled(dev);
> +}
> +
> +static int loongson_rtc_read_alarm(struct device *dev, struct=20
> rtc_wkalrm *alrm)
> +{
> +	int ret;
> +	u32 alarm_data;
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	ret =3D regmap_read(priv->regmap, TOY_MATCH0_REG, &alarm_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	alrm->time.tm_sec =3D FIELD_GET(TOY_MATCH_SEC, alarm_data);
> +	alrm->time.tm_min =3D FIELD_GET(TOY_MATCH_MIN, alarm_data);
> +	alrm->time.tm_hour =3D FIELD_GET(TOY_MATCH_HOUR, alarm_data);
> +	alrm->time.tm_mday =3D FIELD_GET(TOY_MATCH_DAY, alarm_data);
> +	alrm->time.tm_mon =3D FIELD_GET(TOY_MATCH_MON, alarm_data) - 1;
> +	/*
> +	 * This is a hardware bug: the year field of SYS_TOYMATCH is only 6=20
> bits,
> +	 * making it impossible to save year values larger than 64.
> +	 *
> +	 * SYS_TOYMATCH is used to match the alarm time value and determine =
if
> +	 * an alarm is triggered, so we must keep the lower 6 bits of the ye=
ar
> +	 * value constant during the value conversion.
> +	 *
> +	 * In summary, we need to manually add 64(or a multiple of 64) to the
> +	 * year value to avoid the invalid alarm prompt at startup.
> +	 */
> +	alrm->time.tm_year =3D FIELD_GET(TOY_MATCH_YEAR, alarm_data) +=20
> priv->fix_year;
> +
> +	alrm->enabled =3D !!(readl(priv->pm_base + PM1_EN_REG) & RTC_EN);
> +	return 0;
> +}
> +
> +static int loongson_rtc_alarm_irq_enable(struct device *dev, unsigned=20
> int enabled)
> +{
> +	u32 val;
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	spin_lock(&priv->lock);
> +	val =3D readl(priv->pm_base + PM1_EN_REG);
> +	/* Enable RTC alarm wakeup */
> +	writel(enabled ? val | RTC_EN : val & ~RTC_EN,
> +	       priv->pm_base + PM1_EN_REG);
> +	spin_unlock(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static int loongson_rtc_set_alarm(struct device *dev, struct=20
> rtc_wkalrm *alrm)
> +{
> +	int ret;
> +	u32 alarm_data;
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	alarm_data =3D FIELD_PREP(TOY_MATCH_SEC, alrm->time.tm_sec)
> +		   | FIELD_PREP(TOY_MATCH_MIN, alrm->time.tm_min)
> +		   | FIELD_PREP(TOY_MATCH_HOUR, alrm->time.tm_hour)
> +		   | FIELD_PREP(TOY_MATCH_DAY, alrm->time.tm_mday)
> +		   | FIELD_PREP(TOY_MATCH_MON, alrm->time.tm_mon + 1)
> +		   | FIELD_PREP(TOY_MATCH_YEAR, alrm->time.tm_year - priv->fix_year=
);
> +
> +	ret =3D regmap_write(priv->regmap, TOY_MATCH0_REG, alarm_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return loongson_rtc_alarm_irq_enable(dev, alrm->enabled);
> +}
> +
> +static const struct rtc_class_ops loongson_rtc_ops =3D {
> +	.read_time =3D loongson_rtc_read_time,
> +	.set_time =3D loongson_rtc_set_time,
> +	.read_alarm =3D loongson_rtc_read_alarm,
> +	.set_alarm =3D loongson_rtc_set_alarm,
> +	.alarm_irq_enable =3D loongson_rtc_alarm_irq_enable,
> +};
> +
> +static int loongson_rtc_probe(struct platform_device *pdev)
> +{
> +	int ret, alarm_irq;
> +	void __iomem *regs;
> +	struct loongson_rtc_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return dev_err_probe(dev, PTR_ERR(regs),
> +				     "devm_platform_ioremap_resource failed\n");
> +
> +	priv->regmap =3D devm_regmap_init_mmio(dev, regs,
> +					     &loongson_rtc_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "devm_regmap_init_mmio failed\n");
> +
> +	priv->config =3D device_get_match_data(dev);
> +	spin_lock_init(&priv->lock);
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->rtcdev =3D devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rtcdev))
> +		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> +				     "devm_rtc_allocate_device failed\n");
> +
> +	/* Get RTC alarm irq */
> +	alarm_irq =3D platform_get_irq(pdev, 0);
> +	if (alarm_irq > 0) {
> +		ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr,
> +				       0, "loongson-alarm", priv);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Unable to request irq %d\n",
> +					     alarm_irq);
> +
> +		priv->pm_base =3D regs - priv->config->pm_offset;
> +		device_init_wakeup(dev, 1);
> +
> +		if (has_acpi_companion(dev))
> +			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> +							 loongson_rtc_handler, priv);
> +	} else {
> +		/* Loongson-1C RTC does not support alarm */
> +		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> +	}
> +
> +	/* Loongson RTC does not support UIE */
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
> +	priv->rtcdev->ops =3D &loongson_rtc_ops;
> +	priv->rtcdev->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> +	priv->rtcdev->range_max =3D RTC_TIMESTAMP_END_2099;
> +
> +	return devm_rtc_register_device(priv->rtcdev);
> +}
> +
> +static void loongson_rtc_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +	if (!test_bit(RTC_FEATURE_ALARM, priv->rtcdev->features))
> +		return;
> +
> +	if (has_acpi_companion(dev))
> +		acpi_remove_fixed_event_handler(ACPI_EVENT_RTC,
> +						loongson_rtc_handler);
> +
> +	device_init_wakeup(dev, 0);
> +	loongson_rtc_alarm_irq_enable(dev, 0);
> +}
> +
> +static const struct of_device_id loongson_rtc_of_match[] =3D {
> +	{ .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1b_rtc_config },
> +	{ .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1c_rtc_config },
> +	{ .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_config=
 },
> +	{ .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc_c=
onfig=20
> },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson_rtc_of_match);
> +
> +static const struct acpi_device_id loongson_rtc_acpi_match[] =3D {
> +	{ "LOON0001", .driver_data =3D (kernel_ulong_t)&generic_rtc_config },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, loongson_rtc_acpi_match);
> +
> +static struct platform_driver loongson_rtc_driver =3D {
> +	.probe		=3D loongson_rtc_probe,
> +	.remove_new	=3D loongson_rtc_remove,
> +	.driver		=3D {
> +		.name	=3D "loongson-rtc",
> +		.of_match_table =3D loongson_rtc_of_match,
> +		.acpi_match_table =3D loongson_rtc_acpi_match,
> +	},
> +};
> +module_platform_driver(loongson_rtc_driver);
> +
> +MODULE_DESCRIPTION("Loongson RTC driver");
> +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> +MODULE_AUTHOR("WANG Xuerui <git@xen0n.name>");
> +MODULE_AUTHOR("Huacai Chen <chenhuacai@kernel.org>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.39.1

--=20
- Jiaxun
