Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CDC1C3136
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 03:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgEDByn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 21:54:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:62186 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgEDByn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 May 2020 21:54:43 -0400
IronPort-SDR: LKRWbktZm4LjLrc3HahdnRh2AOVK2a4OTDAOfTqubr0Kkk201CocLxBZvcgPJx6CYf243sd0r3
 ZwBadxpRvxxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2020 18:54:41 -0700
IronPort-SDR: +K6sCkShmZESFUbbo2klA7BEdPF5P/FaeDoasO6Y2gHWSiiVI3NSo2It6Y6D5VPKZ2L0R5xHi+
 ImAPHKkfLjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; 
   d="scan'208";a="277393423"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2020 18:54:41 -0700
Received: from [10.214.154.10] (vramuthx-mobl1.gar.corp.intel.com [10.214.154.10])
        by linux.intel.com (Postfix) with ESMTP id DBD83580646;
        Sun,  3 May 2020 18:54:36 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
 <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
 <20200429173107.5c6d2f55@collabora.com>
 <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
 <20200430102114.29b6552f@collabora.com>
 <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
 <20200430103658.4b0b979e@collabora.com>
 <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
 <20200430143600.27031639@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <eed59a7a-b91d-84cd-add0-31e108d87e6f@linux.intel.com>
Date:   Mon, 4 May 2020 09:54:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430143600.27031639@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

   Thank you very much for the review comments and giving inputs...

On 30/4/2020 8:36 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 17:07:03 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>>>>> The question is, is it the same value we have in nand_pa or it is
>>>>> different?
>>>>>       
>>>> Different address which is 0xE1400000 NAND_BASE_PHY address.
>>>
>>> Then why didn't you tell me they didn't match when I suggested to pass
>>
>> sorry, because you keep asking nand_pa after that only I realized that.
>>
>>> nand_pa? So now the question is, what does this address represent?
>>
>>                  EBU-MODULE
>>    _________     _______________________
>> |         |   |            |NAND CTRL  |
>> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
>> |_________|   |_CS1(0x17C)_|__________ |
>>
>> EBU_CONRTROLLER_BASE : 0xE0F0_0000
>> HSNAND_BASE: 0xE100_0000
>> NAND_CS0: 0xE140_0000
>> NAND_CS1: 0xE1C0_0000
>>
>> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
>> MEM_REGION_BASE_CS1: 0x17C00
>>
> 
> Hm, I wonder if we shouldn't use a 'ranges' property to describe this
> address translation. Something like
> 
> 	ebu@xxx {
> 		ranges = <0x17400000 0xe1400000 0x1000>,
> 			 <0x17c00000 0xe1c00000 0x1000>;
> 		reg = <0x17400000>, <0x17c00000>;
> 		reg-names = "cs-0", "cs-1";
> 	}
> 
> The translated address (0xE1X00000) will be available in res->start,
> and the non-translated one (0x17X00000) can be retrieved with
> of_get_address(). All you'd have to do then would be calculate the
> mask:
> 
> 	mask = (translated_address & original_address) >> 22;
> 	num_comp_bits = fls(mask);
> 	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));
> 
> Which allows you to properly set the ADDR_SEL() register without
> relying on some hardcoded values:
> 
> 	writel(original_address | EBU_ADDR_SEL_REGEN |
> 	       EBU_ADDR_COMP_BITS(num_comp_bits),
> 	       ebu_host->ebu + EBU_ADDR_SEL(csid));
> 
> That's quite important if we want to merge the xway NAND driver with
> this one.

Thanks! , for the optimized and made it generic way, will update in the 
next patch-set.

Regards
Vadivel
> 
