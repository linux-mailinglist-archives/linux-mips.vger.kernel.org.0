Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9025C26DC96
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 15:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIQNOm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 09:14:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:12865 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgIQNOl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 09:14:41 -0400
X-Greylist: delayed 542 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 09:14:40 EDT
IronPort-SDR: KlxdyiqaKuYPChhx2hNeuMJmkCuWufyyxFKLCgKNu0F9UHN6d42HinL98E6EcptlqqdxtNoIeZ
 yyxQFgUhQzvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="147437332"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="147437332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 06:05:31 -0700
IronPort-SDR: EYFvTNo2NH3yfO4zyr/tVVhYq3VMufkGzPYoelI/DIlCq3Yufk1BgOtUWKD2P9IMupk8rEdCLe
 ObCTRim+6d8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="336413914"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 06:05:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kItbH-00HKOZ-1S; Thu, 17 Sep 2020 16:05:23 +0300
Date:   Thu, 17 Sep 2020 16:05:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
        boris.brezillon@collabora.com, christophe.kerello@st.com,
        piotrs@cadence.com, robert.jarzmik@free.fr,
        brendanhiggins@google.com, devicetree@vger.kernel.org,
        tglx@linutronix.de, hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200917130523.GM3956970@smile.fi.intel.com>
References: <20200917003308.57038-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 17, 2020 at 08:33:08AM +0800, Ramuthevar,Vadivel MuruganX wrote:
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

> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/init.h>

> +#include <linux/io.h>
> +#include <linux/iopoll.h>

io.h is guaranteed to be included by iopoll.h.

> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>

> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/mtd/nand.h>

Since mtd is a hosting framework for this driver, I would move this group of headers after more generic ones with a blank line in between.


> +#include <linux/resource.h>

And this I think is guaranteed to be included by io.h.

> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

> +#include <linux/platform_device.h>

Dup? It's exactly the reason how alphabetical order can help.

...

> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)

I think 0x20 is an offset here, and better to have it as 0x020 to be consistent
with all other offsets.

...

> +#define EBU_BUSCON(n)		(0x60 + (n) * 4)

Ditto.

...

> +static void ebu_nand_setup_timing(struct ebu_nand_controller *ctrl,
> +				  const struct nand_sdr_timings *timings)
> +{
> +	unsigned int rate = clk_get_rate(ctrl->clk) / 1000000;

HZ_PER_MHZ?

> +	unsigned int period = DIV_ROUND_UP(1000000, rate);

USEC_PER_SEC?

> +	u32 trecov, thold, twrwait, trdwait;
> +	u32 reg = 0;
> +
> +	trecov = DIV_ROUND_UP(max(timings->tREA_max, timings->tREH_min),
> +			      period);
> +	reg |= EBU_BUSCON_RECOVC(trecov);
> +
> +	thold = DIV_ROUND_UP(max(timings->tDH_min, timings->tDS_min), period);
> +	reg |= EBU_BUSCON_HOLDC(thold);
> +
> +	trdwait = DIV_ROUND_UP(max(timings->tRC_min, timings->tREH_min),
> +			       period);
> +	reg |= EBU_BUSCON_WAITRDC(trdwait);
> +
> +	twrwait = DIV_ROUND_UP(max(timings->tWC_min, timings->tWH_min), period);
> +	reg |= EBU_BUSCON_WAITWRC(twrwait);
> +
> +	reg |= EBU_BUSCON_CMULT_V4 | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
> +		EBU_BUSCON_SETUP_EN;
> +
> +	writel(reg, ctrl->ebu + EBU_BUSCON(ctrl->cs_num));
> +}

...

> +	if (oob_required) {
> +		reg = (chip->oob_poi[3] << 24) | (chip->oob_poi[2] << 16) |
> +			(chip->oob_poi[1] << 8) | chip->oob_poi[0];

get_unligned_le32()?

...

> +		reg = (chip->oob_poi[7] << 24) | (chip->oob_poi[6] << 16) |
> +			(chip->oob_poi[5] << 8) | chip->oob_poi[4];

Ditto.

...

> +	ret = readl_poll_timeout_atomic(int_sta, val,
> +					!(val & HSNAND_INT_STA_WR_C), 10, 1000);

Slightly better (logically split between lines):

	ret = readl_poll_timeout_atomic(int_sta, val, !(val & HSNAND_INT_STA_WR_C),
					10, 1000);


> +	if (ret)
> +		return ret;

...

> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);

Why not to use

	ebu_host->ebu = devm_platform_ioremap_resource_byname(&pdev->dev, "ebunand");

?

> +	if (IS_ERR(ebu_host->ebu))
> +		return PTR_ERR(ebu_host->ebu);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);

Ditto.

> +	if (IS_ERR(ebu_host->hsnand))
> +		return PTR_ERR(ebu_host->hsnand);

...


> +	for (i = 0; i < MAX_CS; i++) {
> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   resname);

> +		if (!res)
> +			return -EINVAL;

Redundant check.

> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);

Ditto (see above).

> +		ebu_host->cs[i].nand_pa = res->start;
> +		if (IS_ERR(ebu_host->cs[i].chipaddr))
> +			return PTR_ERR(ebu_host->cs[i].chipaddr);
> +	}

...

> +	ebu_host->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ebu_host->clk)) {

> +		ret = PTR_ERR(ebu_host->clk);
> +		dev_err(dev, "failed to get clock: %d\n", ret);
> +		return ret;

	return dev_err_probe() ?

> +	}

...

> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(ebu_host->dma_tx)) {

> +		ret = PTR_ERR(ebu_host->dma_tx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto err_cleanup_dma;

Ditto. On top why !. ???

> +	}
> +
> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(ebu_host->dma_rx)) {

> +		ret = PTR_ERR(ebu_host->dma_rx);
> +		dev_err(dev, "DMA rx channel request fail!.\n");
> +		goto err_cleanup_dma;

Ditto.

> +	}

-- 
With Best Regards,
Andy Shevchenko


