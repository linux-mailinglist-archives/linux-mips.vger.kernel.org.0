Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984D51F40F3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgFIQcQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 9 Jun 2020 12:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730797AbgFIQcK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:32:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA626C05BD1E
        for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2020 09:32:09 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jihAS-0004bR-Sg; Tue, 09 Jun 2020 18:32:04 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jihAS-0005wb-3c; Tue, 09 Jun 2020 18:32:04 +0200
Message-ID: <2a621f170574a616bcf047f6725c74552f7abbb1.camel@pengutronix.de>
Subject: Re: [PATCH 3/7] reset: add BCM6345 reset controller driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     robh+dt@kernel.org, tsbogend@alpha.franken.de,
        Florian Fainelli <f.fainelli@gmail.com>,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Date:   Tue, 09 Jun 2020 18:32:03 +0200
In-Reply-To: <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
         <20200609134232.4084718-4-noltari@gmail.com>
         <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
         <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
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

On Tue, 2020-06-09 at 17:14 +0200, Álvaro Fernández Rojas wrote:
> Hi Philipp,
> 
> > El 9 jun 2020, a las 17:06, Philipp Zabel <p.zabel@pengutronix.de> escribió:
> > 
> > Hi Álvaro,
> > 
> > On Tue, 2020-06-09 at 15:42 +0200, Álvaro Fernández Rojas wrote:
> > > Add support for resetting blocks through the Linux reset controller
> > > subsystem for BCM63xx SoCs.
> > > 
> > > Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> > > ---
> > > drivers/reset/Kconfig         |   7 ++
> > > drivers/reset/Makefile        |   1 +
> > > drivers/reset/reset-bcm6345.c | 149 ++++++++++++++++++++++++++++++++++
> > > 3 files changed, 157 insertions(+)
> > > create mode 100644 drivers/reset/reset-bcm6345.c
> > > 
> > > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > > index d9efbfd29646..9f1da978cef6 100644
> > > --- a/drivers/reset/Kconfig
> > > +++ b/drivers/reset/Kconfig
> > > @@ -41,6 +41,13 @@ config RESET_BERLIN
> > > 	help
> > > 	  This enables the reset controller driver for Marvell Berlin SoCs.
> > > 
> > > +config RESET_BCM6345
> > > +	bool "BCM6345 Reset Controller"
> > > +	depends on BMIPS_GENERIC || COMPILE_TEST
> > > +	default BMIPS_GENERIC
> > > +	help
> > > +	  This enables the reset controller driver for BCM6345 SoCs.
> > > +
> > > config RESET_BRCMSTB
> > > 	tristate "Broadcom STB reset controller"
> > > 	depends on ARCH_BRCMSTB || COMPILE_TEST
> > > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > > index 249ed357c997..e642aae42f0f 100644
> > > --- a/drivers/reset/Makefile
> > > +++ b/drivers/reset/Makefile
> > > @@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_TEGRA) += tegra/
> > > obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
> > > obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
> > > obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
> > > +obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
> > > obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
> > > obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
> > > obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> > > diff --git a/drivers/reset/reset-bcm6345.c b/drivers/reset/reset-bcm6345.c
> > > new file mode 100644
> > > index 000000000000..088b7fdb896b
> > > --- /dev/null
> > > +++ b/drivers/reset/reset-bcm6345.c
> > > @@ -0,0 +1,149 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * BCM6345 Reset Controller Driver
> > > + *
> > > + * Copyright (C) 2020 Álvaro Fernández Rojas <noltari@gmail.com>
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/init.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset-controller.h>
> > > +
> > > +#define BCM6345_RESET_NUM		32
> > > +#define BCM6345_RESET_SLEEP_MIN_US	10000
> > > +#define BCM6345_RESET_SLEEP_MAX_US	20000
> > > +
> > > +struct bcm6345_reset {
> > > +	struct reset_controller_dev rcdev;
> > > +	void __iomem *base;
> > > +	spinlock_t lock;
> > > +};
> > > +
> > > +static int bcm6345_reset_update(struct bcm6345_reset *bcm6345_reset,
> > > +				unsigned long id, bool assert)
> > > +{
> > > +	uint32_t val;
> > > +
> > > +	val = __raw_readl(bcm6345_reset->base);
> > > +	if (assert)
> > > +		val &= ~BIT(id);
> > > +	else
> > > +		val |= BIT(id);
> > > +	__raw_writel(val, bcm6345_reset->base);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
> > > +				unsigned long id)
> > > +{
> > > +	struct bcm6345_reset *bcm6345_reset =
> > > +		container_of(rcdev, struct bcm6345_reset, rcdev);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
> > > +	bcm6345_reset_update(bcm6345_reset, id, true);
> > > +	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm6345_reset_deassert(struct reset_controller_dev *rcdev,
> > > +				  unsigned long id)
> > > +{
> > > +	struct bcm6345_reset *bcm6345_reset =
> > > +		container_of(rcdev, struct bcm6345_reset, rcdev);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
> > > +	bcm6345_reset_update(bcm6345_reset, id, false);
> > > +	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
> > > +			       unsigned long id)
> > > +{
> > > +	struct bcm6345_reset *bcm6345_reset =
> > > +		container_of(rcdev, struct bcm6345_reset, rcdev);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&bcm6345_reset->lock, flags);
> > > +	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
> > > +		     BCM6345_RESET_SLEEP_MAX_US);
> > 
> > What is the purpose of sleeping before reset assertion?
> 
> None, I must have introduced that for testing something and then I forgot to remove it. Sorry for that...
> 
> > If you can do without this, with I think this driver could be made to
> > use reset-simple.
> 
> Yes, but only if I can add reset support with a configurable sleep range to reset-simple. Is this possible?

I should have mentioned, support for this is on the reset/next branch:

  git://git.pengutronix.de/pza/linux.git reset/next

regards
Philipp
