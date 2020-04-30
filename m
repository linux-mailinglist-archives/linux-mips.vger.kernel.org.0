Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2471BF2D4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 10:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgD3IaW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 04:30:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:47319 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgD3IaW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 04:30:22 -0400
IronPort-SDR: /Bbe3+zKb5OoL2/z1DYDPIyL/41C+z0jlpfhANBpwpPz7gHJ2xcmPkrRd4lV7qcFoNDkYfSkmQ
 ubKFVCGFVbHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 01:30:22 -0700
IronPort-SDR: aSClzRUyQ6VZ04777ze9vUtggfxRFFi19ImTIhkFOA+juZG9kfSlG8+WFiRp9GwkZlSn0SNT47
 nTYUg1doFG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; 
   d="scan'208";a="261701929"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 30 Apr 2020 01:30:21 -0700
Received: from [10.215.169.74] (vramuthx-MOBL1.gar.corp.intel.com [10.215.169.74])
        by linux.intel.com (Postfix) with ESMTP id 0CD3C5805EB;
        Thu, 30 Apr 2020 01:30:16 -0700 (PDT)
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
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
Date:   Thu, 30 Apr 2020 16:30:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430102114.29b6552f@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

H Boris,

On 30/4/2020 4:21 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 15:50:30 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>>     Thank you very much for keep reviewing the patches and more queries...
>>
>> On 29/4/2020 11:31 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 23:18:31 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> Hi Boris,
>>>>
>>>> On 29/4/2020 10:48 pm, Boris Brezillon wrote:
>>>>> On Wed, 29 Apr 2020 22:33:37 +0800
>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>       
>>>>>> Hi Boris,
>>>>>>
>>>>>> On 29/4/2020 10:22 pm, Boris Brezillon wrote:
>>>>>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>>>          
>>>>>>>> +
>>>>>>>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
>>>>>>>> +#define EBU_ADDR_MASK		(5 << 4)
>>>>>>>
>>>>>>> It's still unclear what ADDR_MASK is for. Can you add a comment
>>>>>>> explaining what it does?
>>>>>>
>>>>>> Thank you Boris, keep review and giving inputs, will update.
>>>>>
>>>>> Can you please explain it here before sending a new version?
>>>>
>>>> Memory Region Address Mask:
>>>> Specifies the number of right-most bits in the base address that should
>>>> be included in the address comparison. bits positions(7:4).
>>>
>>> Okay, then the macro should be
>>>
>>> #define EBU_ADDR_MASK(x)	((x) << 4)
>>>
>>> And now I'd like you to explain why 5 is the right value for that field
>>> (I guess that has to do with the position of the CS/ALE/CLE pins).
>>
>> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the
> 
> That's 6 bits to me, not 5.

No , 5 bits only the above case.
> 
>> ADDR_SELx , it compares only 5 bits.
> 
> Definitely not what I would qualify as right-most bits. So, you say the
> comparison always starts at bit 22, and ends at 22+<num-addr-bits>?

Correct

> 
>>>>>> Yes , we are setting both CS0 and CS1 memory access region, if you have
>>>>>> any concern to optimize, please suggest me, Thanks!
>>>>>
>>>>> If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
>>>>> is really related to the nand_pa address, then retrieve resources for
>>>>> all CS ranges.
>>>> If it's not related, please explain what those
>>>>> EBU_MEM_BASE_CS_X values encode.
>>>>
>>>> Memory Region Base Address
>>>> FPI Bus addresses are compared to this base address in conjunction with
>>>> the mask control(EBU_ADDR_MASK). Driver need to program this field!
>>>
>>> That's not explaining what the base address should be. Is 'nand_pa' the
>>> value we should have there?
>>
>> The one prorgrammed in the addr_sel register is used by the HW
>> controller, it remaps to  0x174XX-> CS0 and 0x17CXX->CS1.
>> The hardware itself, decodes only for 1740xx/17c0xx, other random values
>> cannot be programmed
> 
> The question is, is it the same value we have in nand_pa or it is
> different?
> 
Different address which is 0xE1400000 NAND_BASE_PHY address.

Thanks!

Regards
Vadivel
