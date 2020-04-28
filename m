Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7131BB8D7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 10:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgD1I2k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 04:28:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:30425 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgD1I2j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 04:28:39 -0400
IronPort-SDR: HFVVfJdjKbZHDojKBLS98VT4iWmuwy+YSvtdt2zns8Bjc9JyLted7c84ES6ItGHSvfU5vp1uLo
 Rq9m2iMz5Wrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 01:28:38 -0700
IronPort-SDR: cXF0nyAj5HPxlSisvPTOTOweP9i/MFPapWw0UV9p1jNLtkuxqInvF0mnwzyPpwM0AyPx+4SQo2
 cUiwjg1mD0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="282070540"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 01:28:36 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com [10.214.149.60])
        by linux.intel.com (Postfix) with ESMTP id 87A465804B6;
        Tue, 28 Apr 2020 01:28:28 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com, vigneshr@ti.com,
        arnd@arndb.de, richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
 <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
 <20200428094049.3c0d4730@xps13>
 <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
 <20200428095459.6727fab0@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <5c086349-d17f-2ebd-1a70-005fa64e050f@linux.intel.com>
Date:   Tue, 28 Apr 2020 16:28:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428095459.6727fab0@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

On 28/4/2020 3:54 pm, Miquel Raynal wrote:
> Hello,
> 
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Tue, 28 Apr 2020
> 15:50:06 +0800:
> 
>> Hi Miquel,
>>
>> On 28/4/2020 3:40 pm, Miquel Raynal wrote:
>>> Hi Vadivel MuruganX,
>>>
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Tue, 28 Apr 2020
>>> 14:50:35 +0800:
>>>    
>>>> Hi Boris,
>>>>
>>>> On 28/4/2020 2:47 pm, Boris Brezillon wrote:
>>>>> On Tue, 28 Apr 2020 14:40:58 +0800
>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>     >>>> Hi Boris,
>>>>>>
>>>>>> On 28/4/2020 2:27 pm, Boris Brezillon wrote:
>>>>>>> On Tue, 28 Apr 2020 14:17:30 +0800
>>>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>>>      >>>> Hi Miquel,
>>>>>>>>
>>>>>>>>         Thank you very much for the review comments and your time...
>>>>>>>>
>>>>>>>> On 27/4/2020 11:51 pm, Miquel Raynal wrote:
>>>>>>>>> Hi Ramuthevar,
>>>>>>>>>         >>>>>>> +static int ebu_nand_probe(struct platform_device *pdev)
>>>>>>>>>>> +{
>>>>>>>>>>> +	struct device *dev = &pdev->dev;
>>>>>>>>>>> +	struct ebu_nand_controller *ebu_host;
>>>>>>>>>>> +	struct nand_chip *nand;
>>>>>>>>>>> +	phys_addr_t nandaddr_pa;
>>>>>>>>>>> +	struct mtd_info *mtd;
>>>>>>>>>>> +	struct resource *res;
>>>>>>>>>>> +	int ret;
>>>>>>>>>>> +	u32 cs;
>>>>>>>>>>> +
>>>>>>>>>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>>>>>>>>>>> +	if (!ebu_host)
>>>>>>>>>>> +		return -ENOMEM;
>>>>>>>>>>> +
>>>>>>>>>>> +	ebu_host->dev = dev;
>>>>>>>>>>> +	nand_controller_init(&ebu_host->controller);
>>>>>>>>>>> +
>>>>>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>>>>>>>>>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>>>>>>>> +	if (IS_ERR(ebu_host->ebu_addr))
>>>>>>>>>>> +		return PTR_ERR(ebu_host->ebu_addr);
>>>>>>>>>>> +
>>>>>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>>>>>>>>>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
>>>>>>>>>>> +	if (IS_ERR(ebu_host->nand_addr))
>>>>>>>>>>> +		return PTR_ERR(ebu_host->nand_addr);
>>>>>>>>>>> +
>>>>>>>>>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);
>>>>>>>>>>
>>>>>>>>>> CS ids should be encoded in the reg property (see [1]).
>>>>>>>>>
>>>>>>>>> Is it your choice to only support a single CS or is it actually a
>>>>>>>>> controller limitation?
>>>>>>>>
>>>>>>>> Yes , its controller limitation to support only one CS
>>>>>>>
>>>>>>> I'm pretty sure that's not true, otherwise you wouldn't have to select
>>>>>>> the CS you want to use :P.
>>>>>>
>>>>>> At a time it supports only one chip select.
>>>>>
>>>>> Yes, like 99% of the NAND controllers, but that doesn't mean you can't
>>>>> support multi-CS chips. All you have to do is attach an array of
>>>>> ebu_nand_cs to your ebu_nand_chip (as done in the atmel driver I
>>>>> pointed to). nand_operation.cs tells you which CS (index in your
>>>>> ebu_nand_cs array) a specific operation is targeting, and you can pick
>>>>> the right MMIO range/reg value based on that.
>>>>
>>>> Agreed, sure I will add that and update next series of patches .
>>>
>>> There are also many other places where you assume blindly that there
>>> is only one CS. You can check the Atmel NAND controller driver as Boris
>>> said and we will probably propose more little changes to be more
>>> generic.
>> since LGM EBU_NAND controller supports only one chip select at a time, so assumed like that, will change as generic way if consider like more chip select supports, Thanks!
> 
> What do you mean "at a time"?

I mean it supports multi-CS, during the run time it selects one.
Thanks!

Regards
Vadivel
> 
> Do we have access to the spec or a register map? We could tell you very
> quickly if it is worth the trouble. But I am pretty sure as well that
> the controller supports more than 1 CS.
> 
>> Sure , I will do the changes as per your review comments.
>>>
>>> Thanks,
>>> Miquèl
>>>    
> 
> Thanks,
> Miquèl
> 
