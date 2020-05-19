Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFD1D8EE1
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 06:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgESEva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 00:51:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:37406 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgESEva (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 00:51:30 -0400
IronPort-SDR: T3vl6pmU4SsMxwHPCtYuo7UlzeHJlnX0avAIwBBjFHUbG6erKfMh9Sv7duxT9TUCR0+ZE8L/+x
 xBxsxVjcpj6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 21:51:30 -0700
IronPort-SDR: sDHDPLv0Zq2i/WryGB8ccV16p9q6KiAsv59U/AzhorfKCPdIZhdApcc3OowqzcDABrgj7mbV8E
 MD2I0g/K96kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; 
   d="scan'208";a="282205960"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 18 May 2020 21:51:28 -0700
Received: from [10.213.130.44] (vramuthx-mobl1.gar.corp.intel.com [10.213.130.44])
        by linux.intel.com (Postfix) with ESMTP id C523E580613;
        Mon, 18 May 2020 21:51:23 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
To:     Rob Herring <robh@kernel.org>
Cc:     Mason Yang <masonccyang@mxic.com.tw>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Richard Weinberger <richard@nod.at>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
        Vignesh R <vigneshr@ti.com>,
        "hauke.mehrtens" <hauke.mehrtens@intel.com>,
        devicetree@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        cheol.yong.kim@intel.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        qi-ming.wu@intel.com
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200514125709.GA8436@bogus>
 <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
 <CAL_JsqJxqdi2MmyHZteMOpx5yy_o+ZxaqGHMUV7aCknWWQ0ptg@mail.gmail.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <bed51658-68a7-605b-ebdb-f471690e226f@linux.intel.com>
Date:   Tue, 19 May 2020 12:51:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJxqdi2MmyHZteMOpx5yy_o+ZxaqGHMUV7aCknWWQ0ptg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 19/5/2020 2:27 am, Rob Herring wrote:
> On Thu, May 14, 2020 at 8:08 PM Ramuthevar, Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>
>> Hi Rob,
>>
>> On 14/5/2020 8:57 pm, Rob Herring wrote:
>>> On Wed, 13 May 2020 18:46:14 +0800, Ramuthevar,Vadivel MuruganX wrote:
>>>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>>>
>>>> Add YAML file for dt-bindings to support NAND Flash Controller
>>>> on Intel's Lightning Mountain SoC.
>>>>
>>>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>>> ---
>>>>    .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
>>>>    1 file changed, 83 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
>>>>
>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: 'dmas' is a dependency of 'dma-names'
>>>
>>> See https://patchwork.ozlabs.org/patch/1289160
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure dt-schema is up to date:
>>>
>>> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>>>
>>> Please check and re-submit.
>> Thank you very much for review comments...
>> I didn't find build errors, successfully built.
> 
> You need to build without DT_SCHEMA_FILES set or be on 5.7-rc (you
> should be on a current -rcX at least for any patch submission). This
> comes from the core schema.
Yes, reproduced the issue as above mentioned and fixed it. Thanks!

Regards
Vadivel
> 
> Rob
> 
