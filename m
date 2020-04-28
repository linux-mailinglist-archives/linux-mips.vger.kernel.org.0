Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8F81BB65B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 08:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgD1GRi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 02:17:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:14174 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbgD1GRi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 02:17:38 -0400
IronPort-SDR: 6aXIsBinpEfVIAM1O58JEgJbGel1RqKVIfoovdBmQu8xS6ZiXCbJotkyIsOUwAg1CQp1Mqttdm
 2SNC+UcUcTFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 23:17:37 -0700
IronPort-SDR: mRAV00zSt3LyjUtwUnQBgVJYxZssHaTeZYd55g7dy7apgmpnumrhAXhHjflr8IZvS/GcJEj/DG
 fJ/ZM+6gzOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="257519578"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 27 Apr 2020 23:17:37 -0700
Received: from [10.214.149.60] (vramuthx-mobl1.gar.corp.intel.com [10.214.149.60])
        by linux.intel.com (Postfix) with ESMTP id 39A80580B9C;
        Mon, 27 Apr 2020 23:17:32 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
Date:   Tue, 28 Apr 2020 14:17:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427175127.0518c193@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

    Thank you very much for the review comments and your time...

On 27/4/2020 11:51 pm, Miquel Raynal wrote:
> Hi Ramuthevar,
> 
>>> +static int ebu_nand_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct ebu_nand_controller *ebu_host;
>>> +	struct nand_chip *nand;
>>> +	phys_addr_t nandaddr_pa;
>>> +	struct mtd_info *mtd;
>>> +	struct resource *res;
>>> +	int ret;
>>> +	u32 cs;
>>> +
>>> +	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
>>> +	if (!ebu_host)
>>> +		return -ENOMEM;
>>> +
>>> +	ebu_host->dev = dev;
>>> +	nand_controller_init(&ebu_host->controller);
>>> +
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ebunand");
>>> +	ebu_host->ebu_addr = devm_ioremap_resource(&pdev->dev, res);
>>> +	if (IS_ERR(ebu_host->ebu_addr))
>>> +		return PTR_ERR(ebu_host->ebu_addr);
>>> +
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hsnand");
>>> +	ebu_host->nand_addr = devm_ioremap_resource(&pdev->dev, res);
>>> +	if (IS_ERR(ebu_host->nand_addr))
>>> +		return PTR_ERR(ebu_host->nand_addr);
>>> +
>>> +	ret = device_property_read_u32(dev, "nand,cs", &cs);
>>
>> CS ids should be encoded in the reg property (see [1]).
> 
> Is it your choice to only support a single CS or is it actually a
> controller limitation?

Yes , its controller limitation to support only one CS

Regards
Vadivel
  If the latter, it would be much better I think
> to anticipate the addition of the support for another CS. And in
> this case there are many places in this driver that should be
> more generic.
> 
>>> +	if (ret) {
>>> +		dev_err(dev, "failed to get chip select: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ebu_host->cs = cs;
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_cs0");
> 
> Thanks,
> Miquèl
> 
