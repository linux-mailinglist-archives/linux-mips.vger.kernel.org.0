Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F101BF3BE
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgD3JHL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:07:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:59128 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgD3JHK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 05:07:10 -0400
IronPort-SDR: I5MeHe0KctUeZGiaghQxBPp1cUIVu/4ufhePQ5MpMV093Gk68HmUB2MqCZigWD26/xJle0QzIm
 Y4tCY2jgDFgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 02:07:09 -0700
IronPort-SDR: sbpOouhGDHR+YMNe2Z9b1DhyJjDbwCgL2R37kKPafy2HpM2FaMg02FkpDjtspk0u1CVIcdPNTO
 FiAGmXZuWgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; 
   d="scan'208";a="248224274"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2020 02:07:09 -0700
Received: from [10.215.169.74] (vramuthx-MOBL1.gar.corp.intel.com [10.215.169.74])
        by linux.intel.com (Postfix) with ESMTP id 103315805EB;
        Thu, 30 Apr 2020 02:07:04 -0700 (PDT)
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
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
Date:   Thu, 30 Apr 2020 17:07:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430103658.4b0b979e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

On 30/4/2020 4:36 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 16:30:15 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>>>>>
>>>>> And now I'd like you to explain why 5 is the right value for that field
>>>>> (I guess that has to do with the position of the CS/ALE/CLE pins).
>>>>
>>>> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the
>>>
>>> That's 6 bits to me, not 5.
>>
>> No , 5 bits only the above case.
> 
> Oops, right, sorry for the brain fart.
> 
>>>
>>> The question is, is it the same value we have in nand_pa or it is
>>> different?
>>>    
>> Different address which is 0xE1400000 NAND_BASE_PHY address.
> 
> Then why didn't you tell me they didn't match when I suggested to pass

sorry, because you keep asking nand_pa after that only I realized that.

> nand_pa? So now the question is, what does this address represent?

                EBU-MODULE
  _________     _______________________
|         |   |            |NAND CTRL  |
| FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
|_________|   |_CS1(0x17C)_|__________ |

EBU_CONRTROLLER_BASE : 0xE0F0_0000
HSNAND_BASE: 0xE100_0000
NAND_CS0: 0xE140_0000
NAND_CS1: 0xE1C0_0000

MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
MEM_REGION_BASE_CS1: 0x17C00

>Do you have a reference manual I can look at to understand what this is?

We dont have reference manual since it is new SoC, we keep get 
information from HW team and we have only register map

Thanks a lot !!!

Regards
Vadivel
> 
