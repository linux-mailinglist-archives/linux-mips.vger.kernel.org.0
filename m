Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16C21B055A
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTJPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:15:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:12508 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgDTJPY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:15:24 -0400
IronPort-SDR: ERLGhk0r8U8rMQUG/GRuYVRN2yb7z9Z6KkP/dvk124RNgDkAGRKEWkTHahHmRJLCyjMevRrxng
 YNMq2Q4eUulQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 02:15:23 -0700
IronPort-SDR: isaKgCpWgOqEpkT9mN/xaHP6Fa/X+Nj6YLMccDHBdtzjyTO8/Hx3QWzI7ibS+5geRDhK3kscXa
 Q0+sNtjD0C5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="258285784"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 20 Apr 2020 02:15:23 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com [10.249.68.96])
        by linux.intel.com (Postfix) with ESMTP id 3106C580479;
        Mon, 20 Apr 2020 02:15:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        piotrs@cadence.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200420102959.2659774d@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <85f510a8-59a8-0ac4-23bf-86c5c2b85a96@linux.intel.com>
Date:   Mon, 20 Apr 2020 17:15:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420102959.2659774d@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,
     Thank you very much for the review comments and your time...

On 20/4/2020 4:29 pm, Boris Brezillon wrote:
> On Fri, 17 Apr 2020 16:21:47 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
>> +
>> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
>> +	lgm_host->nandaddr_va = res;
>> +	nandaddr_pa = res->start;
>> +	if (IS_ERR(lgm_host->nandaddr_va))
>> +		return PTR_ERR(lgm_host->nandaddr_va);
> Hm, I didn't realize you needed the physical address for DMA transfers.
> Just use platform_get_resource_by_name()+devm_ioremap_resource() in
> that case.
>
Yes, you are right, needed the physical address for DMA transfers.
>> +
>> +	writel(LGM_BUSCON_CMULT_V4 | LGM_BUSCON_RECOVC(1) |
>> +	       LGM_BUSCON_HOLDC(1) | LGM_BUSCON_WAITRDC(2) |
>> +	       LGM_BUSCON_WAITWRC(2) | LGM_BUSCON_BCGEN_CS | LGM_BUSCON_ALEC |
>> +	       LGM_BUSCON_SETUP_EN, lgm_host->lgm_va + LGM_BUSCON(cs));
> I'm sure some the timings you hardcode here can be extracted from the
> NAND timings. Can you see if you can implement ->setup_data_interface()
> instead.

Yes, I have seen few of the drivers implemented 
->setup_data_interface(), Noted.

Regards
Vadivel
