Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8191CEB03
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 05:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgELDCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 23:02:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:53041 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgELDCk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 May 2020 23:02:40 -0400
IronPort-SDR: 4MUYzYtIuZ6g9ldfiyH23CIMEPJsbbShNv8XvxJp/GZTUxlGQLnu6++8lt5yIcN+/aN2RCt+r4
 aTbR5nzmbROA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 20:02:38 -0700
IronPort-SDR: i7GYBvH7NWY5BhrLrDKVlLB4CtNS91qsG4blQFRYPkdRiwakAQyVDqsrzKVqLZVZMgcS7fpRbr
 aK0y2FXO+ZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
   d="scan'208";a="409140692"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2020 20:02:38 -0700
Received: from [10.214.160.177] (vramuthx-MOBL1.gar.corp.intel.com [10.214.160.177])
        by linux.intel.com (Postfix) with ESMTP id 88D37580646;
        Mon, 11 May 2020 20:02:33 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200511153712.GA25497@bogus>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <b500fb0b-7793-7f08-890c-c2424299af34@linux.intel.com>
Date:   Tue, 12 May 2020 11:02:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511153712.GA25497@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

   Thank you for the review comments and your time...

On 11/5/2020 11:37 pm, Rob Herring wrote:
> On Thu, May 07, 2020 at 08:15:36AM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
> 
> The $subject should some how reflect this is for this SoC.
Noted, will update.
> 
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 85 ++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..69b592ae62f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,85 @@
>> +# SPDX-License-Identifier: GPL-2.0
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
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    enum:
>> +      - rx
>> +      - tx
>> +
>> +  pinctrl-names: true
>> +
>> +patternProperties:
>> +  "^pinctrl-[0-9]+$": true
> 
> Don't need the pinctrl properties. The tooling adds them.
ok, will drop.
> 
>> +
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
>> +  - dmas
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/intel,lgm-clk.h>
> 
> Is this applied somewhere? It's missing in my check and will break the
> build.
You have already reviewed the below patch which has the file
https://lkml.org/lkml/2020/4/17/31

Regards
Vadivel

> 
>> +    nand-controller@e0f00000 {
>> +      compatible = "intel,nand-controller";
>> +      reg = <0xe0f00000 0x100>,
>> +            <0xe1000000 0x300>,
>> +            <0xe1400000 0x8000>,
>> +            <0xe1c00000 0x1000>;
>> +      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1";
>> +      clocks = <&cgu0 LGM_GCLK_EBU>;
>> +      dma-names = "tx", "rx";
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      #clock-cells = <1>;
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
