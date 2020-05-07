Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEE61C81F1
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 07:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgEGF6A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 01:58:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:39294 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgEGF6A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 01:58:00 -0400
IronPort-SDR: nTzTknIBBE32ruSyvusQZ6G2cQuhuL2EOBl5cvqiOxGstVAyIoel5CoLE7oczetCA9rIiGjiRu
 4TEJ7kidm2Cg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 22:57:59 -0700
IronPort-SDR: +dQnhUyCtoAS7P9tJ4kRMIintnMG83RYJknm6ccVykoDNKn6QhOzw9gQqKVoh5FN/wQSzfvv3t
 43ny4/J9n+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; 
   d="scan'208";a="370016534"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 06 May 2020 22:57:59 -0700
Received: from [10.213.151.174] (unknown [10.213.151.174])
        by linux.intel.com (Postfix) with ESMTP id 7A0B6580378;
        Wed,  6 May 2020 22:57:54 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <35cf7227-0045-9916-7994-a5763367aab3@infradead.org>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <68b1f45b-4d44-83a1-ddd9-710ff8e03016@linux.intel.com>
Date:   Thu, 7 May 2020 13:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <35cf7227-0045-9916-7994-a5763367aab3@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 7/5/2020 8:22 am, Randy Dunlap wrote:
> On 5/6/20 5:15 PM, Ramuthevar,Vadivel MuruganX wrote:
>> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
>> index a80a46bb5b8b..a026bec28f39 100644
>> --- a/drivers/mtd/nand/raw/Kconfig
>> +++ b/drivers/mtd/nand/raw/Kconfig
>> @@ -457,6 +457,14 @@ config MTD_NAND_CADENCE
>>   	  Enable the driver for NAND flash on platforms using a Cadence NAND
>>   	  controller.
>>   
>> +config MTD_NAND_INTEL_LGM
>> +	tristate "Support for NAND controller on Intel LGM SoC"
>> +	depends on OF || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	help
>> +	  Enables support for NAND Flash chips on Intel's LGM SoC.
>> +          NAND flash interfaced through the External Bus Unit.
> 
> Please use one tab + 2 spaces for indentation in the line above.

Thank you for the review comments, will update in the next patch-set.

Regards
Vadivel
> 
>> +
>>   comment "Misc"
>>   
>>   config MTD_SM_COMMON
> 
> 
