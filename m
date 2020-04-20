Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952061B04D7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 10:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDTIwG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 04:52:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:12626 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgDTIwG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 04:52:06 -0400
IronPort-SDR: dIEl2FRVd1/leTQGJBJP5s6qp9kwjf7gWA6O+Cziqdv6oH4prSN0zZOvc5qBgb+rkT3/8Ez1Fe
 YWKuAqAbRfmg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:52:05 -0700
IronPort-SDR: a4Eg2d6xmIyLQNhuk3IUdkIwFTZ6KS18J6L0i5/tGdasi0tIKLFxqKcrFcXxezFSbjfA2ZkxZR
 FrL2tcDJJcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="254875643"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 20 Apr 2020 01:52:05 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com [10.249.68.96])
        by linux.intel.com (Postfix) with ESMTP id 2D39B5802C9;
        Mon, 20 Apr 2020 01:51:59 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        piotrs@cadence.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <79e186a8-68fb-0e75-910b-9f1b40679ca2@linux.intel.com>
 <20200420094018.6fdbda68@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <65120cb5-9d8d-27a1-a7c1-1e88e18e00b6@linux.intel.com>
Date:   Mon, 20 Apr 2020 16:51:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420094018.6fdbda68@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

   On 20/4/2020 3:40 pm, Boris Brezillon wrote:

> On Mon, 20 Apr 2020 12:18:34 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
>
>>>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>>>> index a80a46bb5b8b..9efc4bbaf4a3 100644
>>>> --- a/drivers/mtd/nand/raw/Kconfig
>>>> +++ b/drivers/mtd/nand/raw/Kconfig
>>>> @@ -457,6 +457,13 @@ config MTD_NAND_CADENCE
>>>>    	  Enable the driver for NAND flash on platforms using a Cadence NAND
>>>>    	  controller.
>>>>    
>>>> +config MTD_NAND_INTEL_LGM
>>>> +	tristate "Support for NAND controller on Intel LGM SoC"
>>>> +	depends on X86
>>> Do we have a hard dependency on x86 here? Maybe 'depends on HAS_MMIO'
>>> would be enough.
>> yes Boris, we have hard dependency on x86.
> Given that the driver will also be used on a MIPS platform I would say
> no :P. Just to be clear, I was suggesting to replace the soon to emerge
>
> 	depends on X86 || MIPS || COMPILE_TEST
> 	depends HAS_IOMEM
>
> rule by
>
> 	depends on OF || COMPILE_TEST
> 	depends HAS_IOMEM

Thank you for the suggestion !

Yes, you are right since MIPS based SoCs also using the same driver, so 
we can add the above rule.

Regards
Vadivel
