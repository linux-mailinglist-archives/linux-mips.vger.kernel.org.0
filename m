Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C781BB832
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 09:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgD1HzJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Apr 2020 03:55:09 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36119 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgD1HzJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Apr 2020 03:55:09 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4806A100017;
        Tue, 28 Apr 2020 07:55:00 +0000 (UTC)
Date:   Tue, 28 Apr 2020 09:54:59 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com, vigneshr@ti.com,
        arnd@arndb.de, richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200428095459.6727fab0@xps13>
In-Reply-To: <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200424183612.4cfdbb6a@collabora.com>
        <20200427175127.0518c193@xps13>
        <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
        <20200428082759.25065146@collabora.com>
        <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
        <20200428084704.5e04232a@collabora.com>
        <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
        <20200428094049.3c0d4730@xps13>
        <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Tue, 28 Apr 2020
15:50:06 +0800:

> Hi Miquel,
> 
> On 28/4/2020 3:40 pm, Miquel Raynal wrote:
> > Hi Vadivel MuruganX,
> > 
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Tue, 28 Apr 2020
> > 14:50:35 +0800:
> >   
> >> Hi Boris,
> >>
> >> On 28/4/2020 2:47 pm, Boris Brezillon wrote:  
> >>> On Tue, 28 Apr 2020 14:40:58 +0800
> >>> "Ramuthevar, Vadivel MuruganX"
> >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:  
> >>>    >>>> Hi Boris,  
> >>>>
> >>>> On 28/4/2020 2:27 pm, Boris Brezillon wrote:  
> >>>>> On Tue, 28 Apr 2020 14:17:30 +0800
> >>>>> "Ramuthevar, Vadivel MuruganX"
> >>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:  
> >>>>>     >>>> Hi Miquel,  
> >>>>>>
> >>>>>>        Thank you very much for the review comments and your time...
> >>>>>>
> >>>>>> On 27/4/2020 11:51 pm, Miquel Raynal wrote:  
> >>>>>>> Hi Ramuthevar,  
> >>>>>>>        >>>>>>> +static int ebu_nand_probe(struct platform_device *pdev)  
> >>>>>>>>> +{
> >>>>>>>>> +	struct device *dev = &pdev->dev;
> >>>>>>>>> +	struct ebu_nand_controller *ebu_host;
> >>>>>>>>> +	struct nand_chip *nand;
> >>>>>>>>> +	phys_addr_t nandaddr_pa;
> >>>>>>>>> +	struct mtd_info *mtd;
> >>>>>>>>> +	struct resource *res;
> >>>>>>>>> +	int ret;
> >>>>>>>>> +	u32 cs;
> >>>>>>>>> +
> >>>>>>>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> >>>>>>>>> +	if (!ebu_host)
> >>>>>>>>> +		return -ENOMEM;
> >>>>>>>>> +
> >>>>>>>>> +	ebu_host->dev = dev;
> >>>>>>>>> +	nand_controller_init(&ebu_host->controller);
> >>>>>>>>> +
> >>>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> >>>>>>>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
> >>>>>>>>> +	if (IS_ERR(ebu_host->ebu_addr))
> >>>>>>>>> +		return PTR_ERR(ebu_host->ebu_addr);
> >>>>>>>>> +
> >>>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> >>>>>>>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
> >>>>>>>>> +	if (IS_ERR(ebu_host->nand_addr))
> >>>>>>>>> +		return PTR_ERR(ebu_host->nand_addr);
> >>>>>>>>> +
> >>>>>>>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);  
> >>>>>>>>
> >>>>>>>> CS ids should be encoded in the reg property (see [1]).  
> >>>>>>>
> >>>>>>> Is it your choice to only support a single CS or is it actually a
> >>>>>>> controller limitation?  
> >>>>>>
> >>>>>> Yes , its controller limitation to support only one CS  
> >>>>>
> >>>>> I'm pretty sure that's not true, otherwise you wouldn't have to select
> >>>>> the CS you want to use :P.  
> >>>>
> >>>> At a time it supports only one chip select.  
> >>>
> >>> Yes, like 99% of the NAND controllers, but that doesn't mean you can't
> >>> support multi-CS chips. All you have to do is attach an array of
> >>> ebu_nand_cs to your ebu_nand_chip (as done in the atmel driver I
> >>> pointed to). nand_operation.cs tells you which CS (index in your
> >>> ebu_nand_cs array) a specific operation is targeting, and you can pick
> >>> the right MMIO range/reg value based on that.  
> >>
> >> Agreed, sure I will add that and update next series of patches .  
> > 
> > There are also many other places where you assume blindly that there
> > is only one CS. You can check the Atmel NAND controller driver as Boris
> > said and we will probably propose more little changes to be more
> > generic.  
> since LGM EBU_NAND controller supports only one chip select at a time, so assumed like that, will change as generic way if consider like more chip select supports, Thanks!

What do you mean "at a time"?

Do we have access to the spec or a register map? We could tell you very
quickly if it is worth the trouble. But I am pretty sure as well that
the controller supports more than 1 CS.

> Sure , I will do the changes as per your review comments.
> > 
> > Thanks,
> > Miquèl
> >   

Thanks,
Miquèl
