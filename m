Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3411B0031
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 05:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDTD2V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 23:28:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:38261 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgDTD2V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 Apr 2020 23:28:21 -0400
IronPort-SDR: HxJ2i4q39Vzlq9hk71piAICkRbLiE2pmH84WUcEaBnStIN0ltZ/W2OeJRiK4/xuQOQdBCSwOZj
 b3GqoFoXcZUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 20:28:20 -0700
IronPort-SDR: HAo3SnHSgS33uHmI/1WIj+u8MQgHZlw7cOFUr8mBDve0Oo8JvF0iK+RXOd39QJm38wIK6S1q0o
 bGN5MbOYUoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; 
   d="scan'208";a="333784767"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 20:28:20 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com [10.249.68.96])
        by linux.intel.com (Postfix) with ESMTP id 90C52580479;
        Sun, 19 Apr 2020 20:28:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, piotrs@cadence.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200419222817.GK185537@smile.fi.intel.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <cee6075c-a801-a0a9-f0b7-83c0a8c4fe80@linux.intel.com>
Date:   Mon, 20 Apr 2020 11:28:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419222817.GK185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andy,

   Thank you very much for the review comments and your time...

On 20/4/2020 6:28 am, Andy Shevchenko wrote:
> On Fri, Apr 17, 2020 at 04:21:47PM +0800, Ramuthevar,Vadivel MuruganX wrote:
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
> I guess untested version slipped into mailing list...
> See below why.

Sorry, This is original patch only , header files are mis-aligned so 
looks like un-tested patch.

> ...
>
>> +#include <linux/clk.h>
>> +#include <linux/completion.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dma-direction.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/module.h>
>> +#include <linux/resource.h>
>> +#include <linux/sched.h>
>> +#include <linux/types.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/rawnand.h>
>> +#include <linux/mtd/nand_ecc.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of.h>
> Do you need this?
Noted, will check and drop if it is notnecessary.
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/io.h>
>> +#include <linux/slab.h>
>> +#include <mtd/mtd-abi.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mtd/nand.h>
> Basically, do you need all of them?
>
> And maybe keep them in order?
Sure, will update.
> ...
>
>> +static int lgm_dma_init(struct device *dev, struct lgm_nand_host *lgm_host)
>> +{
>> +	int ret;
>> +
>> +	/* Prepare for TX DMA: */
>> +	lgm_host->dma_tx = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(lgm_host->dma_tx)) {
>> +		ret = PTR_ERR(lgm_host->dma_tx);
>> +		dev_err(dev, "can't get the TX DMA channel, error %d!\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	/* Prepare for RX: */
>> +	lgm_host->dma_rx = dma_request_chan(dev, "rx");
>> +	if (IS_ERR(lgm_host->dma_rx)) {
>> +		ret = PTR_ERR(lgm_host->dma_rx);
>> +		dev_err(dev, "can't get the RX DMA channel, error %d\n", ret);
> I suspect this error path hasn't been tested. I don't see where tx channel
> freeing is happening.
Good catch, Thanks!, will update
>> +		goto err;
>> +	}
>> +
>> +	return 0;
>> +err:
>> +	return ret;
> Redundant label.
Noted.
>> +}
> ...
>
>> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
>> +	lgm_host->nandaddr_va = res;
>> +	nandaddr_pa = res->start;
>> +	if (IS_ERR(lgm_host->nandaddr_va))
>> +		return PTR_ERR(lgm_host->nandaddr_va);
> I'm wonderig what is this.  How is it even compile?

Agreed!, need a correction, but it's compiled.

Regards
Vadivel
>
