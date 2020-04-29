Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7C01BDD9A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 15:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgD2N3s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 09:29:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:9778 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726780AbgD2N3s (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 09:29:48 -0400
IronPort-SDR: nRnPjKdccinKaK5dtMa1T2G7WbESAmpuEBIWL66+ObbJajICyORygj6LIBNMFCyU57jmx2ZF0P
 3rZLryi3/ptg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 06:29:47 -0700
IronPort-SDR: WdiZ3VTqUAC9PwDAok0fNz7oAnmVxNVdLqjv1Gij+Nsbo0DVhNxRuGMqYOBoeta3hm+gxGDjM+
 BFPlQFRaLb6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="247989062"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2020 06:29:46 -0700
Received: from [10.255.166.42] (weehongg-mobl.gar.corp.intel.com [10.255.166.42])
        by linux.intel.com (Postfix) with ESMTP id 4E3C15802C8;
        Wed, 29 Apr 2020 06:29:42 -0700 (PDT)
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
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
Date:   Wed, 29 Apr 2020 21:29:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429133308.4f91c35c@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

    Thank you very much for the review comments and your time..

On 29/4/2020 7:33 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 18:42:05 +0800
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> +#define NAND_WRITE_CMD		(EBU_CON_CS_P_LOW | HSNAND_CLE_OFFS)
>> +#define NAND_WRITE_ADDR		(EBU_CON_CS_P_LOW | HSNAND_ALE_OFFS)
>> +
> 
> I thought we agreed on dropping those definitions.

Yes , we agreed upon it, due to assertion/de-assertion of CS kept it.
Thanks!

Regards
Vadivel
> 
