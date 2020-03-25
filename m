Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB8519273E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 12:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgCYLfi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 07:35:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:50462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgCYLfh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 07:35:37 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA7AF20722;
        Wed, 25 Mar 2020 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585136136;
        bh=hDdH6NzW082kdtiNJh6NcBX/8zpFKDBtBCPyNFL3akc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q7GoJqppdtvNHQJdM0XE9y8P+ki1AutLvirfSEQTn6FrAdVzJZHPIwqIDKhFlg2Q0
         Tkrvk1QDhThLTbgftm+MddcYEzlZs3PpQ+Y2cnZ+0BK9mRoxAcy45dF3s/9fBv6nq4
         7736pvMud3vI8wyuEoiF/EqEkM+W6ffESuahi3Lw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jH4Jq-00FYG3-87; Wed, 25 Mar 2020 11:35:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 25 Mar 2020 11:35:34 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Allison Randal <allison@lohutok.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Paul Burton <paulburton@kernel.org>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
Subject: Re: [PATCH v7 01/12] irqchip: Add driver for Loongson I/O Local
 Interrupt Controller
In-Reply-To: <AFYQ7Q.2LEJN3L8ZS5J3@crapouillou.net>
References: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
 <20200325022916.106641-2-jiaxun.yang@flygoat.com>
 <AFYQ7Q.2LEJN3L8ZS5J3@crapouillou.net>
Message-ID: <30bbde289a0cc4c1bfc0d3f6475f8f3e@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: paul@crapouillou.net, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, tsbogend@alpha.franken.de, corbet@lwn.net, john@phrozen.org, matthias.bgg@gmail.com, jdelvare@suse.com, davem@davemloft.net, mchehab+samsung@kernel.org, Jonathan.Cameron@huawei.com, gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, krzk@kernel.org, miquel.raynal@bootlin.com, ak@linux.intel.com, hns@goldelico.com, ebiederm@xmission.com, yangtiezhu@loongson.cn, yangyinglu@loongson.cn, allison@lohutok.net, b.zolnierkie@samsung.com, paulburton@kernel.org, manuel.lauss@gmail.com, fancer.lancer@gmail.com, matt.redfearn@mips.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-03-25 11:25, Paul Cercueil wrote:
> Hi Jiaxun,
> 
> 
> Le mer. 25 mars 2020 à 10:28, Jiaxun Yang <jiaxun.yang@flygoat.com> a 
> écrit :
>> This controller appeared on Loongson family of chips as the primary
>> package interrupt source.
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Co-developed-by: Huacai Chen <chenhc@lemote.com>
>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>> ---
>> v4-v5:
>> 	Resolve suggestions from maz:
>> 		- Remove DT validation
>> 		- Simplify unnucessary functions & variables
>> ---
>>  drivers/irqchip/Kconfig                |   9 +
>>  drivers/irqchip/Makefile               |   1 +
>>  drivers/irqchip/irq-loongson-liointc.c | 261 
>> +++++++++++++++++++++++++
>>  3 files changed, 271 insertions(+)
>>  create mode 100644 drivers/irqchip/irq-loongson-liointc.c
>> 
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 6d397732138d..c609eaa319d2 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -513,4 +513,13 @@ config EXYNOS_IRQ_COMBINER
>>  	  Say yes here to add support for the IRQ combiner devices embedded
>>  	  in Samsung Exynos chips.
>> 
>> +config LOONGSON_LIOINTC
>> +	bool "Loongson Local I/O Interrupt Controller"
>> +	depends on MACH_LOONGSON64
>> +	default y
>> +	select IRQ_DOMAIN
>> +	select GENERIC_IRQ_CHIP
>> +	help
>> +	  Support for the Loongson Local I/O Interrupt Controller.
>> +
>>  endmenu
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index eae0d78cbf22..5e7678efdfe6 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -105,3 +105,4 @@ obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
>>  obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
>>  obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>>  obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>> +obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>> diff --git a/drivers/irqchip/irq-loongson-liointc.c 
>> b/drivers/irqchip/irq-loongson-liointc.c
>> new file mode 100644
>> index 000000000000..18de2c09ece4
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-loongson-liointc.c
>> @@ -0,0 +1,261 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
>> + *  Loongson Local IO Interrupt Controller support
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/types.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/ioport.h>
>> +#include <linux/irqchip.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/io.h>
>> +#include <linux/smp.h>
>> +#include <linux/irqchip/chained_irq.h>
>> +
>> +#include <boot_param.h>
>> +
>> +#define LIOINTC_CHIP_IRQ	32
>> +#define LIOINTC_NUM_PARENT 4
>> +
>> +#define LIOINTC_INTC_CHIP_START	0x20
>> +
>> +#define LIOINTC_REG_INTC_STATUS	(LIOINTC_INTC_CHIP_START + 0x20)
>> +#define LIOINTC_REG_INTC_EN_STATUS	(LIOINTC_INTC_CHIP_START + 0x04)
>> +#define LIOINTC_REG_INTC_ENABLE	(LIOINTC_INTC_CHIP_START + 0x08)
>> +#define LIOINTC_REG_INTC_DISABLE	(LIOINTC_INTC_CHIP_START + 0x0c)
>> +#define LIOINTC_REG_INTC_POL	(LIOINTC_INTC_CHIP_START + 0x10)
>> +#define LIOINTC_REG_INTC_EDGE	(LIOINTC_INTC_CHIP_START + 0x14)
>> +
>> +#define LIOINTC_SHIFT_INTx	4
>> +
>> +struct liointc_handler_data {
>> +	struct liointc_priv	*priv;
>> +	u32			parent_int_map;
>> +};
>> +
>> +struct liointc_priv {
>> +	struct irq_chip_generic		*gc;
>> +	struct liointc_handler_data	handler[LIOINTC_NUM_PARENT];
>> +	u8				map_cache[LIOINTC_CHIP_IRQ];
>> +};
>> +
>> +static void liointc_chained_handle_irq(struct irq_desc *desc)
>> +{
>> +	struct liointc_handler_data *handler = 
>> irq_desc_get_handler_data(desc);
>> +	struct irq_chip *chip = irq_desc_get_chip(desc);
>> +	struct irq_chip_generic *gc = handler->priv->gc;
>> +	u32 pending;
>> +
>> +	chained_irq_enter(chip, desc);
>> +
>> +	pending = readl(gc->reg_base + LIOINTC_REG_INTC_STATUS);
>> +
>> +	if (!pending)
>> +		spurious_interrupt();
>> +
>> +	while (pending) {
>> +		int bit = __ffs(pending);
>> +
>> +		generic_handle_irq(irq_find_mapping(gc->domain, bit));
>> +		pending &= ~BIT(bit);
>> +	}
> 
> Consider using the for_each_set_bit() macro from <linux/bitops.h>.
> See drivers/irqchip/irq-ingenic-tcu.c for instance.

which would require changing the pending type to be unsigned long.
Open-coding these if fine if it helps keeping the type system 
consistent.

         M.
-- 
Jazz is not dead. It just smells funny...
