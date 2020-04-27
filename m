Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DCB1BA94C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 17:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgD0Pvg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 27 Apr 2020 11:51:36 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:35021 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgD0Pvf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 11:51:35 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 43A08200005;
        Mon, 27 Apr 2020 15:51:29 +0000 (UTC)
Date:   Mon, 27 Apr 2020 17:51:27 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200427175127.0518c193@xps13>
In-Reply-To: <20200424183612.4cfdbb6a@collabora.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200424183612.4cfdbb6a@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ramuthevar,

> > +static int ebu_nand_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct ebu_nand_controller *ebu_host;
> > +	struct nand_chip *nand;
> > +	phys_addr_t nandaddr_pa;
> > +	struct mtd_info *mtd;
> > +	struct resource *res;
> > +	int ret;
> > +	u32 cs;
> > +
> > +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> > +	if (!ebu_host)
> > +		return -ENOMEM;
> > +
> > +	ebu_host->dev = dev;
> > +	nand_controller_init(&ebu_host->controller);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> > +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(ebu_host->ebu_addr))
> > +		return PTR_ERR(ebu_host->ebu_addr);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> > +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(ebu_host->nand_addr))
> > +		return PTR_ERR(ebu_host->nand_addr);
> > +
> > +	ret = device_property_read_u32(dev, "nand,cs", &cs);  
> 
> CS ids should be encoded in the reg property (see [1]).

Is it your choice to only support a single CS or is it actually a
controller limitation? If the latter, it would be much better I think
to anticipate the addition of the support for another CS. And in
this case there are many places in this driver that should be
more generic.

> > +	if (ret) {
> > +		dev_err(dev, "failed to get chip select: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ebu_host->cs = cs;
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cs0");  

Thanks,
Miquèl
