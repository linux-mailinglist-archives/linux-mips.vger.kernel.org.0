Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938561E5449
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 04:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgE1C6l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 22:58:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:12640 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgE1C6l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 22:58:41 -0400
IronPort-SDR: rgEgWN27q7Ce3AOwPq8lG45jS6clas3DfmE9mxp4vG0TFuNrCRpUukPZbazpRR4N+nGdJJNXiH
 tbhMd6lCp9SA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 19:58:40 -0700
IronPort-SDR: NV1fIEi7SBqqpWFSyetil7BqpMQvRWv0Sli9g92468c8uiX8Se0i5A3wyNFWKSVJ9zyHmQnumZ
 zGuYmBc3PSyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
   d="scan'208";a="468974457"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 27 May 2020 19:58:40 -0700
Received: from [10.214.164.131] (vramuthx-MOBL1.gar.corp.intel.com [10.214.164.131])
        by linux.intel.com (Postfix) with ESMTP id 9E6925803C1;
        Wed, 27 May 2020 19:58:35 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [RESENDPATCH v8 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200520000621.49152-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520000621.49152-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200526204306.GA224630@bogus>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <b04a6779-233d-ff7f-6eb6-b6393100189e@linux.intel.com>
Date:   Thu, 28 May 2020 10:58:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526204306.GA224630@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

Thank you very much for the review comments...

On 27/5/2020 4:43 am, Rob Herring wrote:
> On Wed, May 20, 2020 at 08:06:20AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 91 ++++++++++++++++++++++
>>   1 file changed, 91 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..cd4e983a449e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Still not dual licensed.
oh sorry, will update.
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel LGM SoC NAND Controller Device Tree Bindings
>> +
>> +allOf:
>> +  - $ref: "nand-controller.yaml"
>> +
>> +maintainers:
>> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-nand-controller
> 
> Still doesn't match the example. And the example will fail when it does.
Noted, will change it.
> 
>> +
>> +  reg:
>> +    items:
>> +       - description: ebunand registers
>> +       - description: hsnand registers
>> +       - description: nand_cs0 external flash access
>> +       - description: nand_cs1 external flash access
>> +       - description: addr_sel0 memory region enable and access
>> +       - description: addr_sel1 memory region enable and access
> 
> reg-names?
   should be -const: ebunand instead added description with register 
name , will keep "-const: ebunand ..etc"
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +patternProperties:
>> +  "^nand@[a-f0-9]+$":
>> +    type: object
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 7
>> +
>> +      nand-ecc-mode: true
>> +
>> +      nand-ecc-algo:
>> +        const: hw
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> 
> Not documented or should be dropped.
Yes, will drop it.
> 
>> +  - dmas
>> +  - dma-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    nand-controller@e0f00000 {
>> +      compatible = "intel,lgm-nand";
>> +      reg = <0xe0f00000 0x100>,
>> +            <0xe1000000 0x300>,
>> +            <0xe1400000 0x8000>,
>> +            <0xe1c00000 0x1000>,
>> +            <0x17400000 0x4>,
>> +            <0x17c00000 0x4>;
>> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
>> +        "addr_sel0","addr_sel1";
> 
> Not documented. And needs a space after the ','.
Good catch, Thanks
> 
>> +      clocks = <&cgu0 125>;
>> +      dmas = <&dma0 8>, <&dma0 9>;
>> +      dma-names = "tx", "rx";
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      #clock-cells = <1>;
> 
> Should be removed?
sure, will remove it

Regards
Vadivel
> 
>> +
>> +      nand@0 {
>> +        reg = <0>;
>> +        nand-on-flash-bbt;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +      };
>> +    };
>> +
>> +...
>> -- 
>> 2.11.0
>>
