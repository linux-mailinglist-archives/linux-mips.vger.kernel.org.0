Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116B81C8249
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 08:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGGNu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 02:13:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:63528 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgEGGNu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 02:13:50 -0400
IronPort-SDR: LydA99ryZxQLh0RMUfB4y4FrgAGl18jo1hGWMEnBd8YMi4EGYgKKHWJrf5puCD38spAAjZUegY
 n4NUhvr9SDmA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 23:13:49 -0700
IronPort-SDR: 3pDNn0r5IGGk0SnSXaAW1JDk8AxJKKpW3Zm5csAz/Jifn4GP0vN9jsiLVbHHZTvsyxe4CTgvya
 EI8JlTgeEQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; 
   d="scan'208";a="260423999"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2020 23:13:47 -0700
Received: from [10.213.151.174] (vramuthx-MOBL1.gar.corp.intel.com [10.213.151.174])
        by linux.intel.com (Postfix) with ESMTP id 695D9580378;
        Wed,  6 May 2020 23:13:43 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507072831.1bf7f784@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
Date:   Thu, 7 May 2020 14:13:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507072831.1bf7f784@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

    Thank you very much for the review comments and your time...

On 7/5/2020 1:28 pm, Boris Brezillon wrote:
> On Thu,  7 May 2020 08:15:37 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
> 
> Seriously, did you really think I would not notice what you're doing
> here?
Yes , I know that you have very good understanding about this.
  You're reading the previous value which either contains a default
> mapping or has the mapping set by the bootloader, and write it back to
> the register along with a new mask and the REGEN bit set (which
> BTW is wrong since you don't mask out other fields before updating
> them).
There is no other field get overwritten
  This confirms that this Core -> FPI address translation exists
> and has to be set properly, so please stop lying about that.

Sorry, there is no SW translation, as I have mentioned that it's 
optional only, for safer side , reading and writing the default values.
The memory region to enabled that's my concern so written the same 
register values.

This will not be impact other fields, so please see below for reference

The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 establish 
and control memory regions for external accesses.

Reset Value: 17400001H


Regards
Vadivel

> 
