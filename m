Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB381E655D
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403974AbgE1PDu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 11:03:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:26365 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403901AbgE1PDt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 11:03:49 -0400
IronPort-SDR: T0Gx3S+1NnyGgLRJKpvK8ZqMaC/usWv+kn5tDWPRuBLdyDMoPJf0EI4LNQy8XBy68xZy20hSf8
 JzdV5+YreAmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 08:03:48 -0700
IronPort-SDR: VCP24WwpwTZQMISVT31BpFmDM2ZKPpBO2QU5tNkPxtdm/saoNw2Q2QS82qfDVk1hdz1UxhZQdu
 4XiBex7pwm4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; 
   d="scan'208";a="469143502"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2020 08:03:47 -0700
Received: from [10.214.148.6] (vramuthx-mobl1.gar.corp.intel.com [10.214.148.6])
        by linux.intel.com (Postfix) with ESMTP id 8928D5803E3;
        Thu, 28 May 2020 08:03:41 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To:     Rob Herring <robh@kernel.org>
Cc:     vigneshr@ti.com, linux-kernel@vger.kernel.org, arnd@arndb.de,
        hauke.mehrtens@intel.com, linux-mips@vger.kernel.org,
        richard@nod.at, qi-ming.wu@intel.com, tglx@linutronix.de,
        brendanhiggins@google.com, linux-mtd@lists.infradead.org,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
        miquel.raynal@bootlin.com, andriy.shevchenko@intel.com,
        robh+dt@kernel.org, masonccyang@mxic.com.tw
References: <20200528051211.3063-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528140606.GA4173978@bogus>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9ef6560e-9981-57a8-8d6d-88ba40b2be88@linux.intel.com>
Date:   Thu, 28 May 2020 23:03:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528140606.GA4173978@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 28/5/2020 10:06 pm, Rob Herring wrote:
> On Thu, 28 May 2020 13:12:10 +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add YAML file for dt-bindings to support NAND Flash Controller
>> on Intel's Lightning Mountain SoC.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: '#address-cells', '#size-cells' do not match any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> See https://patchwork.ozlabs.org/patch/1299399
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
Thank you!!!

Oh my bad, used old dtc compiler path and didn't see the error, will fix.

Regards
Vadivel

> 
