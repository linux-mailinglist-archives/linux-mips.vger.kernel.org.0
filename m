Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF521C313B
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 03:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDB6Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 21:58:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:11877 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgEDB6Q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 3 May 2020 21:58:16 -0400
IronPort-SDR: 6LfdbkYPd+JfdkcUiLH+o+VXQefuNJyMHg0jir3nv6GRFZpk8HqMS2Be3DI1S+ZGcuuh0PlgYm
 w98kerXG/Q4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2020 18:58:16 -0700
IronPort-SDR: Ff3Y4xZ2QEk7wxYUQl6+j0WiEaUTuZZrEcn2LGSUgpJZeG8g0PG+BE1CCGK1w7xYYrWgwaxpSR
 qjMzawbxhmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; 
   d="scan'208";a="262680308"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2020 18:58:15 -0700
Received: from [10.214.154.10] (vramuthx-mobl1.gar.corp.intel.com [10.214.154.10])
        by linux.intel.com (Postfix) with ESMTP id 773DE580609;
        Sun,  3 May 2020 18:58:09 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
        masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
        arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
        brendanhiggins@google.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
        tglx@linutronix.de, qi-ming.wu@intel.com,
        andriy.shevchenko@intel.com
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
 <20200430150124.7856d112@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <5bf637de-0ac1-1a24-0e91-aeb18bb563b4@linux.intel.com>
Date:   Mon, 4 May 2020 09:58:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430150124.7856d112@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

   Thank you very much for the review comments and your time...

On 30/4/2020 9:01 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 14:36:00 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Thu, 30 Apr 2020 17:07:03 +0800
>> "Ramuthevar, Vadivel MuruganX"
>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>
>>>>>> The question is, is it the same value we have in nand_pa or it is
>>>>>> different?
>>>>>>         
>>>>> Different address which is 0xE1400000 NAND_BASE_PHY address.
>>>>
>>>> Then why didn't you tell me they didn't match when I suggested to pass
>>>
>>> sorry, because you keep asking nand_pa after that only I realized that.
>>>    
>>>> nand_pa? So now the question is, what does this address represent?
>>>
>>>                  EBU-MODULE
>>>    _________     _______________________
>>> |         |   |            |NAND CTRL  |
>>> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
>>> |_________|   |_CS1(0x17C)_|__________ |
>>>
>>> EBU_CONRTROLLER_BASE : 0xE0F0_0000
>>> HSNAND_BASE: 0xE100_0000
>>> NAND_CS0: 0xE140_0000
>>> NAND_CS1: 0xE1C0_0000
>>>
>>> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
>>> MEM_REGION_BASE_CS1: 0x17C00
>>>    
>>
>> Hm, I wonder if we shouldn't use a 'ranges' property to describe this
>> address translation. Something like
>>
>> 	ebu@xxx {
>> 		ranges = <0x17400000 0xe1400000 0x1000>,
>> 			 <0x17c00000 0xe1c00000 0x1000>;
>> 		reg = <0x17400000>, <0x17c00000>;
>> 		reg-names = "cs-0", "cs-1";
>> 	}
>>
>> The translated address (0xE1X00000) will be available in res->start,
>> and the non-translated one (0x17X00000) can be retrieved with
>> of_get_address(). All you'd have to do then would be calculate the
>> mask:
>>
>> 	mask = (translated_address & original_address) >> 22;
>> 	num_comp_bits = fls(mask);
>> 	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));
>>
>> Which allows you to properly set the ADDR_SEL() register without
>> relying on some hardcoded values:
>>
>> 	writel(original_address | EBU_ADDR_SEL_REGEN |
>> 	       EBU_ADDR_COMP_BITS(num_comp_bits),
>> 	       ebu_host->ebu + EBU_ADDR_SEL(csid));
>>
>> That's quite important if we want to merge the xway NAND driver with
>> this one.
> 
> Looks like the translation is done at the FPI bus declaration level (see
> [1]). We really need to see the big picture to take a wise decision
> about the bindings. Would you mind pasting your dsti/dts files
> somewhere? It feels like the NAND controller is a sub-part of a more
> generic 'memory' controller, in which case the NAND controller should be
> declared as a child of this generic memory bus (called localbus in [1],
> but maybe EBU is more accurate).
> 
> [1]https://github.com/xieyaxiongfly/Atheros_CSI_tool_OpenWRT_src/blob/master/target/linux/lantiq/files-4.14/arch/mips/boot/dts/vr9.dtsi#L162

for the ebu-nand node in the dts file.

       ebu_nand: ebu_nand@e0f00000 {
                  compatible = "intel,lgm-ebu-nand";
                  reg = <0xe0f00000 0x100 //EBU_NAND controller
                   0xe1000000 0x300       //NAND ECC Extension access
                  0xe1400000 0x80000
                  0xe1c00000 0x10000>;
                  reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1";
                  dmas = <&dma0 8>, <&dma0 9>;
                  dma-names = "ebu_rx", "ebu_tx";
                  clocks =  <&cgu0 LGM_GCLK_EBU>;
          };


	 &ebu_nand {
	         status = "disabled";
	        nand,cs = <1>;
	        nand-ecc-mode = "hw";
	        pinctrl-names = "default";
	        pinctrl-0 = <&ebu_nand_base &ebu_cs1>;
	};

This is not comes under fpi in our devicetree.

Regards
Vadivel
> 
