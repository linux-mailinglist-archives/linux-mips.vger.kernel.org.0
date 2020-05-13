Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51A81D197B
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 17:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388493AbgEMPeI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 11:34:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:38735 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728678AbgEMPeH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 11:34:07 -0400
IronPort-SDR: qun4NCiBK7eySdGFVFU83FEH9k+uXrw8JzGCpwbKP0zQw50iqD+EPzeBNnUItaq2dcf2NH8Ibh
 5zCuwOSQX6KA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 08:34:07 -0700
IronPort-SDR: vy2lgmYe9rC6VKwtymuZYskMIG1nHjtOprrt8bbbkB+37IzrVJhAjSdT4L/bg8ZbBCzNykt+4f
 Eb3d8mkGjR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="463977187"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2020 08:34:02 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jYtOX-006Rw5-7D; Wed, 13 May 2020 18:34:05 +0300
Date:   Wed, 13 May 2020 18:34:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v6 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200513153405.GS185537@smile.fi.intel.com>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 06:46:15PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
> 
> NAND controller driver implements ->exec_op() to replace legacy hooks,
> these specific call-back method to execute NAND operations.

...

> +static int ebu_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ebu_nand_controller *ebu_host;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	char *resname;
> +	int ret, i;
> +	u32 reg;
> +
> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
> +	if (!ebu_host)
> +		return -ENOMEM;
> +
> +	ebu_host->dev = dev;
> +	nand_controller_init(&ebu_host->controller);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource_byname

> +	if (IS_ERR(ebu_host->ebu))
> +		return PTR_ERR(ebu_host->ebu);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource_byname

> +	if (IS_ERR(ebu_host->hsnand))
> +		return PTR_ERR(ebu_host->hsnand);
> +
> +	ret = device_property_read_u32(dev, "nand,cs", &reg);
> +	if (ret) {
> +		dev_err(dev, "failed to get chip select: %d\n", ret);
> +		return ret;
> +	}
> +	ebu_host->cs_num = reg;
> +
> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

if res is NULL?

> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
> +		ebu_host->cs[i].nand_pa = res->start;
> +			if (IS_ERR(ebu_host->cs[i].chipaddr))
> +				return PTR_ERR(ebu_host->cs[i].chipaddr);

Something happened with ordering / indentation along these lines...

> +	}
> +

> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

if res is NULL?

> +		ebu_host->cs[i].addr_sel = res->start;
> +		writel(ebu_host->cs[i].addr_sel | EBU_ADDR_MASK(5) |
> +		       EBU_ADDR_SEL_REGEN, ebu_host->ebu + EBU_ADDR_SEL(i));
> +	}

> +	return ret;
> +}

...

> +static int ebu_nand_remove(struct platform_device *pdev)
> +{
> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> +

> +	if (ebu_host) {

How it can be NULL here?

> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> +		nand_cleanup(&ebu_host->chip);
> +		ebu_nand_disable(&ebu_host->chip);
> +
> +		if (ebu_host->dma_rx || ebu_host->dma_tx)
> +			ebu_dma_cleanup(ebu_host);
> +
> +		clk_disable_unprepare(ebu_host->clk);
> +	}
> +
> +	return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko


