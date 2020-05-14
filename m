Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9731D246F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 03:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgENBEX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 21:04:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:31154 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbgENBEX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 21:04:23 -0400
IronPort-SDR: xEAf9AC1SXzK7+QNw5Vjw2VJBT/2JRidro/8MNPkTi0qoNhymqzkRZEQajijTJcNJOgfnYwofD
 dq6qhGX6lJFQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 18:04:23 -0700
IronPort-SDR: 7bbX+hPA/cSQi2+URin7m/oJ0Xx1k4B/wxePUY4vh+nXrzcqZQGlZIAlMmzI28irXsfEwaAHJw
 7Y15zIhRrQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,389,1583222400"; 
   d="scan'208";a="298544452"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 13 May 2020 18:04:22 -0700
Received: from [10.249.66.53] (vramuthx-mobl1.gar.corp.intel.com [10.249.66.53])
        by linux.intel.com (Postfix) with ESMTP id D48F5580646;
        Wed, 13 May 2020 18:04:17 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v6 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513153405.GS185537@smile.fi.intel.com>
 <20200513153532.GT185537@smile.fi.intel.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <364cb1f3-1a66-20d3-f256-739ee9c915f0@linux.intel.com>
Date:   Thu, 14 May 2020 09:04:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513153532.GT185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andy,

On 13/5/2020 11:35 pm, Andy Shevchenko wrote:
> On Wed, May 13, 2020 at 06:34:05PM +0300, Andy Shevchenko wrote:
>> On Wed, May 13, 2020 at 06:46:15PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> 
> ...
> 
>>> +static int ebu_nand_remove(struct platform_device *pdev)
>>> +{
>>> +	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
>>> +
>>
>>> +	if (ebu_host) {
>>
>> How it can be NULL here?
>>
>>> +		mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
>>> +		nand_cleanup(&ebu_host->chip);
>>> +		ebu_nand_disable(&ebu_host->chip);
>>> +
> 
>>> +		if (ebu_host->dma_rx || ebu_host->dma_tx)
> 
> This is duplicate and thus redundant.
Let me check and update, Thanks!

Regards
Vadivel
> 
>>> +			ebu_dma_cleanup(ebu_host);
>>> +
>>> +		clk_disable_unprepare(ebu_host->clk);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
> 
