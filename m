Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E161D4CF7
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 13:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgEOLse (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 07:48:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:64661 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgEOLse (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 07:48:34 -0400
IronPort-SDR: SPpr6ie+egOqdFn2h6LFiO4gP85FgcEf2B+jTJwVtblWT4gX2x+4GJkyhZfM7JhSkG4K1GkSMY
 6O7PPW4Zr1lA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 04:48:33 -0700
IronPort-SDR: IW+r6LhI9V6GV4u5qgTex4k0wHcQ/NC4Cn1wV9e8y2IAlgwdG4DUc2DWRUPKBm+L7vd4FJM5Sy
 JMKiMpG4ciWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; 
   d="scan'208";a="298415980"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 15 May 2020 04:48:29 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jZYpL-006qm5-Iq; Fri, 15 May 2020 14:48:31 +0300
Date:   Fri, 15 May 2020 14:48:31 +0300
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
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200515114831.GS185537@smile.fi.intel.com>
References: <20200515105537.4876-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 15, 2020 at 06:55:37PM +0800, Ramuthevar,Vadivel MuruganX wrote:
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

> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
> +	if (IS_ERR(ebu_host->dma_tx)) {
> +		ret = PTR_ERR(ebu_host->dma_tx);
> +		dev_err(dev, "DMA tx channel request fail!.\n");
> +		goto err_cleanup_dma;
> +	}
> +
> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
> +	if (IS_ERR(ebu_host->dma_rx)) {
> +		ret = PTR_ERR(ebu_host->dma_rx);

> +		dev_err(dev, "DMA tx channel request fail!.\n");

rx ?

> +		goto err_cleanup_dma;
> +	}

...

> +static int ebu_nand_remove(struct platform_device *pdev)
> +{
> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
> +

> +	if (ebu_host) {

I dunno why you need this check? Maybe I forgot your answer to my comment?

> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
> +		nand_cleanup(&ebu_host->chip);
> +		ebu_nand_disable(&ebu_host->chip);
> +		ebu_dma_cleanup(ebu_host);
> +		clk_disable_unprepare(ebu_host->clk);
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


