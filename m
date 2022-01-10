Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C5D4894BE
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jan 2022 10:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242269AbiAJJJ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jan 2022 04:09:59 -0500
Received: from verein.lst.de ([213.95.11.211]:37684 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238722AbiAJJJ6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Jan 2022 04:09:58 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8A00968AA6; Mon, 10 Jan 2022 10:09:55 +0100 (CET)
Date:   Mon, 10 Jan 2022 10:09:55 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Christoph Hellwig <hch@lst.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] bcma: get SoC device struct & assign dma_mask
Message-ID: <20220110090955.GA7422@lst.de>
References: <20220107041744.2388470-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107041744.2388470-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 06, 2022 at 08:17:44PM -0800, Florian Fainelli wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> For bus devices to be fully usable it's required to set their DMA
> parameters.
> 
> For years it has been missing and remained unnoticed because of
> mips_dma_alloc_coherent() silently handling the empty coherent_dma_mask.
> Kernel 4.19 came with a lot of DMA changes and caused a regression on
> the bcm47xx. Starting with the commit f8c55dc6e828 ("MIPS: use generic
> dma noncoherent ops for simple noncoherent platforms") DMA coherent
> allocations just fail. Example:
> [    1.114914] bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
> [    1.121215] bgmac_bcma bcma0:2: Unable to alloc memory for DMA
> [    1.127626] bgmac_bcma: probe of bcma0:2 failed with error -12
> [    1.133838] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
> 
> This change fixes above regression in addition to the MIPS bcm47xx
> commit 321c46b91550 ("MIPS: BCM47XX: Setup struct device for the SoC").

How did it take so long to notice this?

> I don't know if this is what you had in mind. I am also not sure if we
> should have the bcma_bus_type implement .dma_configure and set it to
> platform_dma_configure?

Unless you have an OF tree that declares DMA limitations there is no
need to call platform_dma_configure.

> --- a/drivers/bcma/host_soc.c
> +++ b/drivers/bcma/host_soc.c
> @@ -191,6 +191,8 @@ int __init bcma_host_soc_init(struct bcma_soc *soc)
>  	struct bcma_bus *bus = &soc->bus;
>  	int err;
>  
> +	bus->dev = soc->dev;
> +
>  	/* Scan bus and initialize it */
>  	err = bcma_bus_early_register(bus);
>  	if (err)
> diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
> index 8e7ca3e4c8c4..6793c2ff60fd 100644
> --- a/drivers/bcma/main.c
> +++ b/drivers/bcma/main.c
> @@ -253,6 +253,8 @@ void bcma_prepare_core(struct bcma_bus *bus, struct bcma_device *core)
>  		if (IS_ENABLED(CONFIG_OF) && bus->dev) {
>  			core->dma_dev = bus->dev;
>  		} else {
> +			if (!core->dev.coherent_dma_mask)
> +				core->dev.coherent_dma_mask = DMA_BIT_MASK(32);

Is there any way coherent_dma_mask could already be set here?

>  			core->dev.dma_mask = &core->dev.coherent_dma_mask;
>  			core->dma_dev = &core->dev;

Not really needed for the quick fix, but pointing the dma_mask to the
coherent_dma_mask is a bad idea as it removes the often used feature
to use a different mask for the cohernent allocations vs the streaming
mappings.
