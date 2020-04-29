Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558F71BE0D5
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 16:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgD2O0c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 10:26:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:54130 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbgD2O0c (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 10:26:32 -0400
IronPort-SDR: 3NyGrNPqwWL+pR9wjTFmMlH9YZL2nyc7LKubZkK/OzBDTGi+FHrfHlj3F5tOuDFpbEpxM9wnv6
 uYkpWeaapaBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:26:32 -0700
IronPort-SDR: nHOb7/rn16dZLOGoxN/XQ9MazwIUxFRwGeiva5XLcWsEixjxco2xTE/14H6sL6yhYGSjRJXH0s
 ylx8I0GDw0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="248001618"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2020 07:26:31 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com [10.255.166.42])
        by linux.intel.com (Postfix) with ESMTP id BD2D9580613;
        Wed, 29 Apr 2020 07:26:26 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
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
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429133308.4f91c35c@collabora.com>
 <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
 <20200429153205.09c498cd@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <6b3ad9f3-2a3c-b44c-3c3f-24f2178dd3fa@linux.intel.com>
Date:   Wed, 29 Apr 2020 22:26:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429153205.09c498cd@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

   Thank you very much for the review comments and your time...

On 29/4/2020 9:32 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 21:29:40 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>>      Thank you very much for the review comments and your time..
>>
>> On 29/4/2020 7:33 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>> "Ramuthevar,Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> +#define NAND_WRITE_CMD		(EBU_CON_CS_P_LOW | HSNAND_CLE_OFFS)
>>>> +#define NAND_WRITE_ADDR		(EBU_CON_CS_P_LOW | HSNAND_ALE_OFFS)
>>>> +
>>>
>>> I thought we agreed on dropping those definitions.
>>
>> Yes , we agreed upon it, due to assertion/de-assertion of CS kept it.
> 
> And I keep thinking we don't need that, just pass
> 'HSNAND_CLE_OFFS | HSNAND_CS_OFFS' directly.

Agreed!, will update in the next-patch version, Thanks!

Regards
Vadivel

> 
