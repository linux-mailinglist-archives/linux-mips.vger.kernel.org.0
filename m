Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BD31BE120
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 16:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgD2Odn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 10:33:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:1910 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgD2Odn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 10:33:43 -0400
IronPort-SDR: a6P1m7px73NOyQK3UrTu7TEa1FwN+j9vdeKMQN5gpdMgtBfhy2S22qPLt1Sd2RJSz3j4Ds5cY6
 wAUFvLnKJN5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:33:42 -0700
IronPort-SDR: GgDxLw7T5eFCu4vUB9yydCrksnAKVNlira8kc0/Yy/F1rwk2KwAWiigEPmqzDOKtRVtUrdmN2Q
 0tx2QchLc9Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="257977442"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 29 Apr 2020 07:33:42 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com [10.255.166.42])
        by linux.intel.com (Postfix) with ESMTP id 8B1DE5802C8;
        Wed, 29 Apr 2020 07:33:38 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
Date:   Wed, 29 Apr 2020 22:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429162249.55d38ee8@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

On 29/4/2020 10:22 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 18:42:05 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> +
>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
>> +#define EBU_ADDR_MASK		(5 << 4)
> 
> It's still unclear what ADDR_MASK is for. Can you add a comment
> explaining what it does?

Thank you Boris, keep review and giving inputs, will update.
> 
>> +#define EBU_ADDR_SEL_REGEN	0x1
> 
> 
>> +
>> +	writel(lower_32_bits(ebu_host->cs[ebu_host->cs_num].nand_pa) |
>> +	       EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
>> +
>> +	writel(EBU_MEM_BASE_CS_0 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>> +	       ebu_host->ebu + EBU_ADDR_SEL(0));
>> +	writel(EBU_MEM_BASE_CS_1 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
> 
> That's super weird. You seem to set EBU_ADDR_SEL(reg) twice. Are you
> sure that's needed, and are we setting EBU_ADDR_SEL(0) here?

You are right, its weird only, but we need it, since different chip 
select has different memory region access address.

Yes , we are setting both CS0 and CS1 memory access region, if you have 
any concern to optimize, please suggest me, Thanks!

Regards
Vadivel
> 
