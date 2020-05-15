Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FBD1D4366
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 04:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgEOCIe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 22:08:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:40597 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgEOCId (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 22:08:33 -0400
IronPort-SDR: NSe8a9Ar2yFdTGl/tekr316MO463lWcIAbepfZf11aMdOYx1JyF44NXK0jbQwHvlB0TPCjc0/o
 Ddk+iY7mQMHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 19:08:33 -0700
IronPort-SDR: 1f4FaMHXUF1m1FclHsU2xHyV/zNOmhnfioLdKMvGi71FDnnmOBvxoYvqz4KRZlMBiL3zA3kx/H
 C7GEUVJbqF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,393,1583222400"; 
   d="scan'208";a="298902877"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP; 14 May 2020 19:08:33 -0700
Received: from [10.213.147.163] (vramuthx-mobl1.gar.corp.intel.com [10.213.147.163])
        by linux.intel.com (Postfix) with ESMTP id 000995804B6;
        Thu, 14 May 2020 19:08:19 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To:     Rob Herring <robh@kernel.org>
Cc:     masonccyang@mxic.com.tw, linux-mtd@lists.infradead.org,
        richard@nod.at, boris.brezillon@collabora.com,
        brendanhiggins@google.com, tglx@linutronix.de,
        miquel.raynal@bootlin.com, vigneshr@ti.com,
        hauke.mehrtens@intel.com, devicetree@vger.kernel.org,
        anders.roxell@linaro.org, arnd@arndb.de, robh+dt@kernel.org,
        andriy.shevchenko@intel.com, linux-mips@vger.kernel.org,
        cheol.yong.kim@intel.com, linux-kernel@vger.kernel.org,
        qi-ming.wu@intel.com
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200514125709.GA8436@bogus>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
Date:   Fri, 15 May 2020 10:08:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514125709.GA8436@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 14/5/2020 8:57 pm, Rob Herring wrote:
> On Wed, 13 May 2020 18:46:14 +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: 'dmas' is a dependency of 'dma-names'
> 
> See https://patchwork.ozlabs.org/patch/1289160
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
Thank you very much for review comments...
I didn't find build errors, successfully built.

Regards
Vadivel

> 
