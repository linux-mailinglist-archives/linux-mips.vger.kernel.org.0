Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85D51BE263
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 17:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD2PSj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 11:18:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:6299 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgD2PSj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 11:18:39 -0400
IronPort-SDR: TN7PIAHWCZpbHBwhWHi3nY9KKZBclXWO488PNkqFZ6IE3VB+OnnVmA+Pad84RyVhh1HVeWGc7l
 b7lTVmPzX+tQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 08:18:38 -0700
IronPort-SDR: L8Im9C8854t13HQozVXYhDTvYu1vq8EQ0is7FixfPmD9cMUV10VOlhf4Iqj0lH7qW6Kra/x3QW
 PYr9HkbTeUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="303019043"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2020 08:18:38 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com [10.255.166.42])
        by linux.intel.com (Postfix) with ESMTP id 75FBF5802C8;
        Wed, 29 Apr 2020 08:18:33 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        qi-ming.wu@intel.com
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, anders.roxell@linaro.org,
        vigneshr@ti.com, arnd@arndb.de, richard@nod.at,
        brendanhiggins@google.com, linux-mips@vger.kernel.org,
        robh+dt@kernel.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
Date:   Wed, 29 Apr 2020 23:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429164832.6800fc70@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

On 29/4/2020 10:48 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 22:33:37 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>> On 29/4/2020 10:22 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> +
>>>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
>>>> +#define EBU_ADDR_MASK		(5 << 4)
>>>
>>> It's still unclear what ADDR_MASK is for. Can you add a comment
>>> explaining what it does?
>>
>> Thank you Boris, keep review and giving inputs, will update.
> 
> Can you please explain it here before sending a new version?

Memory Region Address Mask:
Specifies the number of right-most bits in the base address that should 
be included in the address comparison. bits positions(7:4).

>>>    
>>>> +#define EBU_ADDR_SEL_REGEN	0x1
>>>
>>>    
>>>> +
>>>> +	writel(lower_32_bits(ebu_host->cs[ebu_host->cs_num].nand_pa) |
>>>> +	       EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
>>>> +
>>>> +	writel(EBU_MEM_BASE_CS_0 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(0));
>>>> +	writel(EBU_MEM_BASE_CS_1 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
>>>
>>> That's super weird. You seem to set EBU_ADDR_SEL(reg) twice. Are you
>>> sure that's needed, and are we setting EBU_ADDR_SEL(0) here?
>>
>> You are right, its weird only, but we need it, since different chip
>> select has different memory region access address.
> 
> Well, that doesn't make any sense, the second write to
> EBU_ADDR_SEL(reg) overrides the first one, meaning that nand_pa is
> actually never written to ADDR_SEL(reg).

it will not overwrite the first one, since two different registers
EBU_ADDR_SEL_0 EBU_ADDR_SEL  20H
EBU_ADDR_SEL_1 EBU_ADDR_SEL  24H

it is an internal address selection w.r.t chip select for nand physical 
address update.


> 
>>
>> Yes , we are setting both CS0 and CS1 memory access region, if you have
>> any concern to optimize, please suggest me, Thanks!
> 
> If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
> is really related to the nand_pa address, then retrieve resources for
> all CS ranges. 
If it's not related, please explain what those
> EBU_MEM_BASE_CS_X values encode.

Memory Region Base Address
FPI Bus addresses are compared to this base address in conjunction with 
the mask control(EBU_ADDR_MASK). Driver need to program this field!

Regards
Vadivel

> 
