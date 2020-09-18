Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD24F26F65D
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 08:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgIRG5Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 02:57:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:16007 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgIRG5Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 02:57:24 -0400
IronPort-SDR: +H/DtMPrJAQ23wNxqypfZ2HHwfvozuAUjA/O8194IWcdofJZy9bOoxt7sw5/8Q3Frm3Fk/NZdj
 ibx9YE9pT3kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160794754"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160794754"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 23:57:23 -0700
IronPort-SDR: apw7X2tvrgEQ7JKnAgRMaAoUZeIxL1xJNnaI32NwBvFJSn0GcYXTmUdp3i9V/rNOnOk5/eMijP
 QVwGYzN+AxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="410196068"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2020 23:57:22 -0700
Received: from [10.249.68.124] (vramuthx-MOBL1.gar.corp.intel.com [10.249.68.124])
        by linux.intel.com (Postfix) with ESMTP id 94A7958053A;
        Thu, 17 Sep 2020 23:57:17 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
        boris.brezillon@collabora.com, christophe.kerello@st.com,
        piotrs@cadence.com, robert.jarzmik@free.fr,
        brendanhiggins@google.com, devicetree@vger.kernel.org,
        tglx@linutronix.de, hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        cheol.yong.kim@intel.com, qi-ming.wu@intel.com
References: <20200917003308.57038-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917003308.57038-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200917130523.GM3956970@smile.fi.intel.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <bb8606e9-e102-916d-359c-5ce7a94cc4e4@linux.intel.com>
Date:   Fri, 18 Sep 2020 14:57:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917130523.GM3956970@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andy,

  Thank you for the review comments...

On 17/9/2020 9:05 pm, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 08:33:08AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> This patch adds the new IP of Nand Flash Controller(NFC) support
>> on Intel's Lightning Mountain(LGM) SoC.
>>
>> DMA is used for burst data transfer operation, also DMA HW supports
>> aligned 32bit memory address and aligned data access by default.
>> DMA burst of 8 supported. Data register used to support the read/write
>> operation from/to device.
>>
>> NAND controller driver implements ->exec_op() to replace legacy hooks,
>> these specific call-back method to execute NAND operations.
> 
> ...
> 
>> +#include <linux/clk.h>
>> +#include <linux/completion.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
> 
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
> 
> io.h is guaranteed to be included by iopoll.h.
Noted
> 
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
> 
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/rawnand.h>
>> +#include <linux/mtd/nand_ecc.h>
>> +#include <linux/mtd/nand.h>
> 
> Since mtd is a hosting framework for this driver, I would move this group of headers after more generic ones with a blank line in between.
okay, noted
> 
> 
>> +#include <linux/resource.h>
> 
> And this I think is guaranteed to be included by io.h.
Sure, will check and update.
> 
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
> 
>> +#include <linux/platform_device.h>
> 
> Dup? It's exactly the reason how alphabetical order can help.
Good catch
> 
> ...
> 
>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
> 
> I think 0x20 is an offset here, and better to have it as 0x020 to be consistent
> with all other offsets.
> 
> ...
> 
>> +#define EBU_BUSCON(n)		(0x60 + (n) * 4)
> 
> Ditto.
Noted, will update
> 
> ...
> 
>> +static void ebu_nand_setup_timing(struct ebu_nand_controller *ctrl,
>> +				  const struct nand_sdr_timings *timings)
>> +{
>> +	unsigned int rate = clk_get_rate(ctrl->clk) / 1000000;
> 
> HZ_PER_MHZ?
yes, you're right we can use it.
> 
>> +	unsigned int period = DIV_ROUND_UP(1000000, rate);
> 
> USEC_PER_SEC?
yes, you're right we can use it.
> 
>> +	u32 trecov, thold, twrwait, trdwait;
>> +	u32 reg = 0;
>> +
>> +	trecov = DIV_ROUND_UP(max(timings->tREA_max, timings->tREH_min),
>> +			      period);
>> +	reg |= EBU_BUSCON_RECOVC(trecov);
>> +
>> +	thold = DIV_ROUND_UP(max(timings->tDH_min, timings->tDS_min), period);
>> +	reg |= EBU_BUSCON_HOLDC(thold);
>> +
>> +	trdwait = DIV_ROUND_UP(max(timings->tRC_min, timings->tREH_min),
>> +			       period);
>> +	reg |= EBU_BUSCON_WAITRDC(trdwait);
>> +
>> +	twrwait = DIV_ROUND_UP(max(timings->tWC_min, timings->tWH_min), period);
>> +	reg |= EBU_BUSCON_WAITWRC(twrwait);
>> +
>> +	reg |= EBU_BUSCON_CMULT_V4 | EBU_BUSCON_BCGEN_CS | EBU_BUSCON_ALEC |
>> +		EBU_BUSCON_SETUP_EN;
>> +
>> +	writel(reg, ctrl->ebu + EBU_BUSCON(ctrl->cs_num));
>> +}
> 
> ...
> 
>> +	if (oob_required) {
>> +		reg = (chip->oob_poi[3] << 24) | (chip->oob_poi[2] << 16) |
>> +			(chip->oob_poi[1] << 8) | chip->oob_poi[0];
> 
> get_unligned_le32()?
last time seen system crash ,so I left it.
> 
> ...
> 
>> +		reg = (chip->oob_poi[7] << 24) | (chip->oob_poi[6] << 16) |
>> +			(chip->oob_poi[5] << 8) | chip->oob_poi[4];
> 
> Ditto.
Let me double check will add it, keep the same if not
> 
> ...
> 
>> +	ret = readl_poll_timeout_atomic(int_sta, val,
>> +					!(val & HSNAND_INT_STA_WR_C), 10, 1000);
> 
> Slightly better (logically split between lines):
> 
> 	ret = readl_poll_timeout_atomic(int_sta, val, !(val & HSNAND_INT_STA_WR_C),
> 					10, 1000);
Thanks!, will update
> 
> 
>> +	if (ret)
>> +		return ret;
> 
> ...
> 
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>> +	ebu_host->ebu = devm_ioremap_resource(&pdev->dev, res);
> 
> Why not to use
> 
> 	ebu_host->ebu = devm_platform_ioremap_resource_byname(&pdev->dev, "ebunand");
As Boris mtd-maintainer suggested me to split into 2 API's, thanks!.
> 
> ?
> 
>> +	if (IS_ERR(ebu_host->ebu))
>> +		return PTR_ERR(ebu_host->ebu);
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>> +	ebu_host->hsnand = devm_ioremap_resource(&pdev->dev, res);
> 
> Ditto.
> 
>> +	if (IS_ERR(ebu_host->hsnand))
>> +		return PTR_ERR(ebu_host->hsnand);
> 
> ...
> 
> 
>> +	for (i = 0; i < MAX_CS; i++) {
>> +		resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", i);
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   resname);
> 
>> +		if (!res)
>> +			return -EINVAL;
> 
> Redundant check.
> 
>> +		ebu_host->cs[i].chipaddr = devm_ioremap_resource(dev, res);
> 
> Ditto (see above).
Noted
> 
>> +		ebu_host->cs[i].nand_pa = res->start;
>> +		if (IS_ERR(ebu_host->cs[i].chipaddr))
>> +			return PTR_ERR(ebu_host->cs[i].chipaddr);
>> +	}
> 
> ...
> 
>> +	ebu_host->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(ebu_host->clk)) {
> 
>> +		ret = PTR_ERR(ebu_host->clk);
>> +		dev_err(dev, "failed to get clock: %d\n", ret);
>> +		return ret;
> 
> 	return dev_err_probe() ?
Noted, will add it.
> 
>> +	}
> 
> ...
> 
>> +	ebu_host->dma_tx = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(ebu_host->dma_tx)) {
> 
>> +		ret = PTR_ERR(ebu_host->dma_tx);
>> +		dev_err(dev, "DMA tx channel request fail!.\n");
>> +		goto err_cleanup_dma;
> 
> Ditto. On top why !. ???
sorry missed it,Noted
> 
>> +	}
>> +
>> +	ebu_host->dma_rx = dma_request_chan(dev, "rx");
>> +	if (IS_ERR(ebu_host->dma_rx)) {
> 
>> +		ret = PTR_ERR(ebu_host->dma_rx);
>> +		dev_err(dev, "DMA rx channel request fail!.\n");
>> +		goto err_cleanup_dma;
> 
> Ditto.
Noted

Regards
Vadivel
> 
>> +	}
> 
