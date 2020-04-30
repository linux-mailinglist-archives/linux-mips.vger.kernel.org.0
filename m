Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC3A1BED6D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 03:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgD3BHj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 21:07:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:22543 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726357AbgD3BHi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 21:07:38 -0400
IronPort-SDR: N6aGNfBSFSFKe129VMQf37hhDS7jZ9hBOYnBF4AqPYo1u2e1QDbSNNrT0g45q7dTxIz3FLoPn5
 La63eicm1NAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 18:07:38 -0700
IronPort-SDR: 8Q4gkOhp1ZUnE+RQpm1R4hBRrAC7b/3Ppd8uLI++yOdz/XX8f7mTAIc0o5U6zNpv7sk6HtOVAe
 6Lvw49YJsJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="432763015"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 29 Apr 2020 18:07:38 -0700
Received: from [10.215.170.136] (vramuthx-mobl1.gar.corp.intel.com [10.215.170.136])
        by linux.intel.com (Postfix) with ESMTP id E824D5805EB;
        Wed, 29 Apr 2020 18:07:33 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429173446.6682dfb8@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <04423b9c-f70c-d461-05ac-9a4815af105c@linux.intel.com>
Date:   Thu, 30 Apr 2020 09:07:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429173446.6682dfb8@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

  Thank you very much for the review comments and your time...

On 29/4/2020 11:34 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 18:42:04 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..6dd899d367b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,61 @@
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
>> +...
> 
> Can you provide an example? I'd like to make sure the binding looks
> good.

Noted, will update with example. Thanks!

Regards
Vadivel

> 
