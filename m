Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72C51AFEA6
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 00:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgDSW2V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 18:28:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:59485 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgDSW2U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 Apr 2020 18:28:20 -0400
IronPort-SDR: YdqpwMrfgpoC84ppwJ97RGM0CqlkCXFCH76UccdgMLk/WnQv3PDyaJZXetlzZFYyxzYvbWbHKr
 UNtpFWpYt30w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 15:28:20 -0700
IronPort-SDR: Nh+Dex8K9ftQjDSvavCHtA2y3a9nVX58784fZWSVhNqHos1DyHm21UfAcqen4FhIVAQ9CFSSxP
 PEoGt9ZMnosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,404,1580803200"; 
   d="scan'208";a="289824346"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2020 15:28:15 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jQIQD-001v9r-Qw; Mon, 20 Apr 2020 01:28:17 +0300
Date:   Mon, 20 Apr 2020 01:28:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, piotrs@cadence.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200419222817.GK185537@smile.fi.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 17, 2020 at 04:21:47PM +0800, Ramuthevar,Vadivel MuruganX wrote:
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

I guess untested version slipped into mailing list...
See below why.

...

> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/resource.h>
> +#include <linux/sched.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/platform_device.h>

> +#include <linux/of.h>

Do you need this?

> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <mtd/mtd-abi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mtd/nand.h>

Basically, do you need all of them?

And maybe keep them in order?

...

> +static int lgm_dma_init(struct device *dev, struct lgm_nand_host *lgm_host)
> +{
> +	int ret;
> +
> +	/* Prepare for TX DMA: */
> +	lgm_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(lgm_host->dma_tx)) {
> +		ret = PTR_ERR(lgm_host->dma_tx);
> +		dev_err(dev, "can't get the TX DMA channel, error %d!\n", ret);
> +		goto err;
> +	}
> +
> +	/* Prepare for RX: */
> +	lgm_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(lgm_host->dma_rx)) {
> +		ret = PTR_ERR(lgm_host->dma_rx);
> +		dev_err(dev, "can't get the RX DMA channel, error %d\n", ret);

I suspect this error path hasn't been tested. I don't see where tx channel
freeing is happening.

> +		goto err;
> +	}
> +
> +	return 0;

> +err:
> +	return ret;

Redundant label.

> +}

...

> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
> +	lgm_host->nandaddr_va = res;
> +	nandaddr_pa = res->start;
> +	if (IS_ERR(lgm_host->nandaddr_va))
> +		return PTR_ERR(lgm_host->nandaddr_va);

I'm wondering what is this.  How is it even compile?

-- 
With Best Regards,
Andy Shevchenko


