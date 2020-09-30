Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF1627E539
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 11:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI3JfP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 05:35:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:47235 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728851AbgI3JfP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 05:35:15 -0400
IronPort-SDR: 3+dSW7IYqLKquug13H+VE6B+T3BD1blrLuyOV8LmrPG7mqLzxG9h8hbCvPGxRDlKs8cIbPDn6x
 ZqAAM+1O41Vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="226553016"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="226553016"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 02:35:14 -0700
IronPort-SDR: CvxftynzD8Grt40D+c09NMwSaYEOd8YaU4fAMki1iGRHXJSju2rfvoKJ/WBc9oHv3mDgTOH5lM
 5GX1cFQhsJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="515010272"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2020 02:35:13 -0700
Received: from [10.226.38.24] (unknown [10.226.38.24])
        by linux.intel.com (Postfix) with ESMTP id 87E115807A3;
        Wed, 30 Sep 2020 02:35:09 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v14 0/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
        christophe.kerello@st.com, piotrs@cadence.com,
        robert.jarzmik@free.fr, brendanhiggins@google.com,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com
References: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200928162550.30bbce71@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <ef7ba9ba-b6c1-7a94-8320-b8023f721be2@linux.intel.com>
Date:   Wed, 30 Sep 2020 17:35:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928162550.30bbce71@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

On 28/9/2020 10:25 pm, Miquel Raynal wrote:
> Hello,
> 
> "Ramuthevar,Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Thu, 24 Sep 2020
> 16:48:40 +0800:
> 
>> This patch adds the new IP of Nand Flash Controller(NFC) support
>> on Intel's Lightning Mountain(LGM) SoC.
>>
>> DMA is used for burst data transfer operation, also DMA HW supports
>> aligned 32bit memory address and aligned data access by default.
>> DMA burst of 8 supported. Data register used to support the read/write
>> operation from/to device.
>>
>> NAND controller also supports in-built HW ECC engine.
>>
>> NAND controller driver implements ->exec_op() to replace legacy hooks,
>> these specific call-back method to execute NAND operations.
>>
>> Thanks Miquel, Boris, Andy, Arnd and Rob for the review comments and suggestions.
>> ---
>> v14:
>>    - Address Andy's review comments
>>    - align the headers and revome Duplicates
>>    - replcace numerical const values by HZ_PER_MHZ and USEC_PER_SEC
>>      defined macros
>>    - add dev_err_probe() api instead of legacy err check
>>    - add get_unaligned_le32() api instead of manual endiness
>>    - remove redudent check
>>    - split the lines logically in between and add require spaces
>> v13:
>>    - Address Miquel Raynal review comments
>>    - update the return type with variable 'ret'
>>    - handle err check statement properly
>>    - change the naming convention aligned with recently changed the naming
>>      around the data interface
>>      data structure and function names
>>    - replace by div 8 instead of <<4 in ecc calculation better code readability
>>    - handle check_only properly like existing drivers
> 
> I am sorry but there are two to three comments which you did not
> address or addressed partially while not so impacting on the logic,
> can you please review and address them all? (please note that I checked
> the patch adding the driver before telling you that).

Thank you for your comments...!

Sure, I will review once again all your comments in the previous patch 
sent if anything is missed then will add it and send the updated patch.

Regards
Vadivel
> 
> Thanks,
> Miquèl
> 
