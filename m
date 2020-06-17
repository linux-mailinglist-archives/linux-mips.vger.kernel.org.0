Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AC11FC9F4
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 11:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgFQJfl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 17 Jun 2020 05:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgFQJfl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 05:35:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A53BC061573
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2020 02:35:41 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jlUTp-0006br-6s; Wed, 17 Jun 2020 11:35:37 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jlUTo-0002Xx-9t; Wed, 17 Jun 2020 11:35:36 +0200
Message-ID: <409257e69ca434f5d5e90d2453fbdf8ae5d12b0f.camel@pengutronix.de>
Subject: Re: [PATCH v6 3/9] reset: add BCM6345 reset controller driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        f.fainelli@gmail.com, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date:   Wed, 17 Jun 2020 11:35:36 +0200
In-Reply-To: <20200617083231.3699090-4-noltari@gmail.com>
References: <20200617083231.3699090-1-noltari@gmail.com>
         <20200617083231.3699090-4-noltari@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Álvaro,

thank you for the patch. A few comments below:

On Wed, 2020-06-17 at 10:32 +0200, Álvaro Fernández Rojas wrote:
> Add support for resetting blocks through the Linux reset controller
> subsystem for BCM63xx SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
> ---
>  v6: driver improvements:
>      - use devm_platform_ioremap_resource.
>      - simplify bcm6345_reset_probe return.
>      - introduce and use to_bcm6345_reset function.
>  v5: fix kbuild robot error (drop __init).
>  v4: no changes.
>  v3: using reset-simple isn't possible since sleeping after performing the
>      reset is also needed.
>  v2: add compatibility to reset-simple instead of adding a new driver.
> 
>  drivers/reset/Kconfig         |   7 ++
>  drivers/reset/Makefile        |   1 +
>  drivers/reset/reset-bcm6345.c | 132 ++++++++++++++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/reset/reset-bcm6345.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d9efbfd29646..9f1da978cef6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -41,6 +41,13 @@ config RESET_BERLIN
>  	help
>  	  This enables the reset controller driver for Marvell Berlin SoCs.
>  
> +config RESET_BCM6345
> +	bool "BCM6345 Reset Controller"
> +	depends on BMIPS_GENERIC || COMPILE_TEST
> +	default BMIPS_GENERIC
> +	help
> +	  This enables the reset controller driver for BCM6345 SoCs.
> +

Please sort these alphabetically.

>  config RESET_BRCMSTB
>  	tristate "Broadcom STB reset controller"
>  	depends on ARCH_BRCMSTB || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 249ed357c997..e642aae42f0f 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_TEGRA) += tegra/
>  obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
>  obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
>  obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
> +obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o

This is the right place.

>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> diff --git a/drivers/reset/reset-bcm6345.c b/drivers/reset/reset-bcm6345.c
> new file mode 100644
> index 000000000000..3eedea226028
> --- /dev/null
> +++ b/drivers/reset/reset-bcm6345.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * BCM6345 Reset Controller Driver
> + *
> + * Copyright (C) 2020 Álvaro Fernández Rojas <noltari@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +
> +#define BCM6345_RESET_NUM		32
> +#define BCM6345_RESET_SLEEP_MIN_US	10000
> +#define BCM6345_RESET_SLEEP_MAX_US	20000
> +
> +struct bcm6345_reset {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t lock;
> +};
> +
> +static inline struct bcm6345_reset *
> +to_bcm6345_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct bcm6345_reset, rcdev);
> +}
> +
> +static void bcm6345_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct bcm6345_reset *bcm6345_reset = to_bcm6345_reset(rcdev);
> +	unsigned long flags;
> +	uint32_t val;
> +
> +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
> +	val = __raw_readl(bcm6345_reset->base);
> +	if (assert)
> +		val &= ~BIT(id);
> +	else
> +		val |= BIT(id);
> +	__raw_writel(val, bcm6345_reset->base);
> +	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
> +}
> +
> +static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	bcm6345_reset_update(rcdev, id, true);
> +
> +	return 0;
> +}
> +
> +static int bcm6345_reset_deassert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	bcm6345_reset_update(rcdev, id, false);
> +
> +	return 0;

These two could be shortened if you let bcm6345_reset_update() return 0:

	return bcm6345_reset_update(rcdev, id, false);

> +}

> +
> +static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	bcm6345_reset_update(rcdev, id, true);
> +	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
> +		     BCM6345_RESET_SLEEP_MAX_US);
> +
> +	bcm6345_reset_update(rcdev, id, false);

This second sleep is unusual:

> +	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
> +		     BCM6345_RESET_SLEEP_MAX_US);

Could you add a comment describing why it is needed?

Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
