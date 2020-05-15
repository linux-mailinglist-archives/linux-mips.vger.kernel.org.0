Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4061D47BD
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgEOIG6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:06:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:40032 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbgEOIG6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:06:58 -0400
IronPort-SDR: jg8xj5GKq8r+WPuJadTCF2v6dza/EK7l2oDuBRqQAD+EhwpAHlyFOs1BVLluCioTepXWeraKha
 ZRUC42ouC2fQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 01:06:58 -0700
IronPort-SDR: y1UJqPzbkrsTCq4XzGUKwEyG7DqyQY5ttccd+stBOvqgSOZtIqrtZgGAdio0BI/x+gY5HlMblj
 MYOuE+kpJedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; 
   d="scan'208";a="464826884"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 01:06:56 -0700
Received: from [10.213.147.163] (vramuthx-mobl1.gar.corp.intel.com [10.213.147.163])
        by linux.intel.com (Postfix) with ESMTP id 361965804E0;
        Fri, 15 May 2020 01:06:43 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
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
 <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
Message-ID: <0ca30041-b2eb-5cff-9a90-f3021bc82622@linux.intel.com>
Date:   Fri, 15 May 2020 16:06:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 15/5/2020 10:08 am, Ramuthevar, Vadivel MuruganX wrote:
> Hi Rob,
> 
> On 14/5/2020 8:57 pm, Rob Herring wrote:
>> On Wed, 13 May 2020 18:46:14 +0800, Ramuthevar,Vadivel MuruganX wrote:
>>> From: Ramuthevar Vadivel Murugan 
>>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>>>
>>> Add YAML file for dt-bindings to support NAND Flash Controller
>>> on Intel's Lightning Mountain SoC.
>>>
>>> Signed-off-by: Ramuthevar Vadivel Murugan 
>>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>>> ---
>>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 
>>> ++++++++++++++++++++++
>>>   1 file changed, 83 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>>
>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: 
>> nand-controller@e0f00000: 'dmas' is a dependency of 'dma-names'
>>
>> See https://patchwork.ozlabs.org/patch/1289160
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure dt-schema is up to date:
>>
>> pip3 install 
>> git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>>
>> Please check and re-submit.Sure, will check and re-submit, Thanks!

Regards
Vadivel
