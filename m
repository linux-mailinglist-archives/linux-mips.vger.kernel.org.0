Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3E81CA0F2
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 04:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgEHCbZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 22:31:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:11749 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgEHCbZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 22:31:25 -0400
IronPort-SDR: vGdYQ5yvVTiflf5X5JhROzCv9cquerCUsLWM6E8l17O7CEP3zUivQnj3iW+5LEuJMn75eZDR4C
 q5/qSly2TmxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 19:31:25 -0700
IronPort-SDR: CjOhS/m/S5QJz2g+WvbIMHXFxFQoeuzgIpCgt6bhRN43uycCy6cj+bYZcbgbqLgcXnSzSXFqZG
 u343lCOsI7Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="296724654"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 07 May 2020 19:31:24 -0700
Received: from [10.213.154.115] (vramuthx-MOBL1.gar.corp.intel.com [10.213.154.115])
        by linux.intel.com (Postfix) with ESMTP id 642A1580378;
        Thu,  7 May 2020 19:31:20 -0700 (PDT)
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
 <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
 <20200507082730.6425cd96@collabora.com>
 <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
 <20200507084831.1483b19a@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <547af0d0-a304-8fd8-12a3-263a900da6af@linux.intel.com>
Date:   Fri, 8 May 2020 10:31:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507084831.1483b19a@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

   Thank you very much for the review comments and your time...
On 7/5/2020 2:48 pm, Boris Brezillon wrote:
 > On Thu, 7 May 2020 14:38:52 +0800
 > "Ramuthevar, Vadivel MuruganX"
 > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >
 >> Hi Boris,
 >>
 >>    Thank you very much for the review comments and your time...
 >>
 >> On 7/5/2020 2:27 pm, Boris Brezillon wrote:
 >>> On Thu, 7 May 2020 14:13:42 +0800
 >>> "Ramuthevar, Vadivel MuruganX"
 >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >>>
 >>>> Hi Boris,
 >>>>
 >>>>      Thank you very much for the review comments and your time...
 >>>>
 >>>> On 7/5/2020 1:28 pm, Boris Brezillon wrote:
 >>>>> On Thu,  7 May 2020 08:15:37 +0800
 >>>>> "Ramuthevar,Vadivel MuruganX"
 >>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >>>>>
 >>>>>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
 >>>>>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
 >>>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
 >>>>> Seriously, did you really think I would not notice what you're doing
 >>>>> here?
 >>>> Yes , I know that you have very good understanding about this.
 >>>>    You're reading the previous value which either contains a default
 >>>>> mapping or has the mapping set by the bootloader, and write it 
back to
 >>>>> the register along with a new mask and the REGEN bit set (which
 >>>>> BTW is wrong since you don't mask out other fields before updating
 >>>>> them).
 >>>> There is no other field get overwritten
 >>>>    This confirms that this Core -> FPI address translation exists
 >>>>> and has to be set properly, so please stop lying about that.
 >>>> Sorry, there is no SW translation, as I have mentioned that it's
 >>>> optional only, for safer side , reading and writing the default 
values.
 >>> Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
 >>> won't.
 >> You mean, without reading just writing EBU_ADDR_SEL_REGEN bit alone in
 >> EBU_ADDR_SELx , as you said it won't work because it overwrites 0x174
 >> with 0x0 values so BASE is lost.
 > Which confirms that this mapping has to be defined.
Sure, Noted.
 >> either we can leave it or read & write with ORed | EBU_ADDR_SEL_REGEN
 > None of this is acceptable IMO. You have to build the value based on the
 > address translation described in the DT. Why are you so reluctant to
 > this approach?
Agreed!, will derive the values(0x174/0x17C) to be written into these 
registers based on the chip select (CS0/CS1)
Address_sel0_register: 0xE0F0_0020
Address_sel1_register: 0xE0F0_0024
Bits : 31...12|11...8| 7..4 |3..2|  1   |  0
flags:  BASE  |------| MASK | -- | MRME | REGEN

BASE : 0x17400 /0x17C00 to be written into 31:12 based on the chip selection
MASK: 5: bits 26:22 to included address comparison
MRME: Memory Region Memory Enable
REGEN: Memory Region Access Enable

As you have suggested to get the above base values from DT and update in 
driver, will do that.

Thanks!
Regards
Vadivel
 >> Please correct me if anything is wrong, Thanks!
 >>>
 >>>> The memory region to enabled that's my concern so written the same
 >>>> register values.
 >>> I don't buy that, sorry.
 >>>
 >>>> This will not be impact other fields, so please see below for 
reference
 >>>>
 >>>> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 
establish
 >>>> and control memory regions for external accesses.
 >>>>
 >>>> Reset Value: 17400001H
 >>> See, as suspected the reset value is exactly what you expect.
 >> Yes , that's the reason said being optional.
 > Then it's not optional. It just works because you use the default
 > va
