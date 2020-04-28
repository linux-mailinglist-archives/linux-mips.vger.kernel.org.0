Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A357A1BB684
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 08:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgD1G2F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 02:28:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45482 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgD1G2F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Apr 2020 02:28:05 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35D7B2A122C;
        Tue, 28 Apr 2020 07:28:03 +0100 (BST)
Date:   Tue, 28 Apr 2020 08:27:59 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200428082759.25065146@collabora.com>
In-Reply-To: <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200424183612.4cfdbb6a@collabora.com>
        <20200427175127.0518c193@xps13>
        <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 28 Apr 2020 14:17:30 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Miquel,
> 
>     Thank you very much for the review comments and your time...
> 
> On 27/4/2020 11:51 pm, Miquel Raynal wrote:
> > Hi Ramuthevar,
> >   
> >>> +static int ebu_nand_probe(struct platform_device *pdev)
> >>> +{
> >>> +	struct device *dev = &pdev->dev;
> >>> +	struct ebu_nand_controller *ebu_host;
> >>> +	struct nand_chip *nand;
> >>> +	phys_addr_t nandaddr_pa;
> >>> +	struct mtd_info *mtd;
> >>> +	struct resource *res;
> >>> +	int ret;
> >>> +	u32 cs;
> >>> +
> >>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> >>> +	if (!ebu_host)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	ebu_host->dev = dev;
> >>> +	nand_controller_init(&ebu_host->controller);
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> >>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> >>> +	if (IS_ERR(ebu_host->ebu_addr))
> >>> +		return PTR_ERR(ebu_host->ebu_addr);
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> >>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> >>> +	if (IS_ERR(ebu_host->nand_addr))
> >>> +		return PTR_ERR(ebu_host->nand_addr);
> >>> +
> >>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);  
> >>
> >> CS ids should be encoded in the reg property (see [1]).  
> > 
> > Is it your choice to only support a single CS or is it actually a
> > controller limitation?  
> 
> Yes , its controller limitation to support only one CS

I'm pretty sure that's not true, otherwise you wouldn't have to select
the CS you want to use :P.
