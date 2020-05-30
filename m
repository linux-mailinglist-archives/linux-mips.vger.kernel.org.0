Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68921E8C80
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 02:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgE3ASc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 20:18:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:4083 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgE3ASc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 20:18:32 -0400
IronPort-SDR: dQcedYSOY22V80oDU314oQd62gTv8L7au9gu50hsJfHuVie/MII7BJRTX8oMu/q9SuSTJrmBtF
 /YyCL/nQ31Ww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 17:18:31 -0700
IronPort-SDR: X06jFciNNis2gnsfgRCH16IqBHQKwsoDO/hW5okSNFgxMFtIMPQxjcwlNQODsfzxoeUUC+YicW
 LT9XQZXsmz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,450,1583222400"; 
   d="scan'208";a="311408533"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2020 17:18:30 -0700
Received: from [10.213.39.142] (vramuthx-MOBL1.gar.corp.intel.com [10.213.39.142])
        by linux.intel.com (Postfix) with ESMTP id 2855F580100;
        Fri, 29 May 2020 17:18:25 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: Add Nand Flash Controller
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
References: <20200528153929.46859-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528153929.46859-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200529193130.GA2805164@bogus>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <a89a4a5e-5aff-61cc-0d3f-bd22dcc4786d@linux.intel.com>
Date:   Sat, 30 May 2020 08:18:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529193130.GA2805164@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 30/5/2020 3:31 am, Rob Herring wrote:
> On Thu, May 28, 2020 at 11:39:28PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> new file mode 100644
>> index 000000000000..afecc9920e04
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel LGM SoC NAND Controller Device Tree Bindings
>> +
>> +allOf:
>> +  - $ref: "nand-controller.yaml"
>> +
>> +maintainers:
>> +  - Ramuthevar Vadivel Murugan<vadivel.muruganx.ramuthevar@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-nand-controller
> Doesn't match the example.
Thank you for the review comments...

if we add the compatible = intel,lgm-nand-controller it throws an error 
like below..

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: 
nand-controller@e0f00000: '#address-cells', '#size-cells' do not match 
any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: 
nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 
'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'

referred from this file 
:Documentation/devicetree/bindings/mtd/nand-controller.yaml

fixed the compatible and example doesn't match issue.

Regards
Vadivel

> 
