Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB086367904
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 06:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhDVE53 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 00:57:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:39194 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229568AbhDVE53 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Apr 2021 00:57:29 -0400
IronPort-SDR: u5pVqcOY5k1ZcnA2CcAHWzBUI1A1FJt5EYjUknh7CgrmC2r4mvCWEmLswqy4FgwJmgQo5demIU
 i+AGNNqNuKGw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="193706731"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="193706731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 21:56:54 -0700
IronPort-SDR: pbzoieAdQorR3gyLkt0RwccDrXShMAFuMDtTcHEEX0c9RmKCxx5vGt+2HZxzLX1rooPqy9MJ+i
 qpcJWG249neg==
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="427779549"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 21:56:51 -0700
Subject: Re: [kbuild-all] Re: [mips-linux:mips-next 98/101]
 arch/mips/include/asm/div64.h:74:3: error: inconsistent operand constraints
 in an 'asm'
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        "Huang, Ying" <ying.huang@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-mips@vger.kernel.org
References: <202104220420.qh7kOCR1-lkp@intel.com>
 <alpine.DEB.2.21.2104220029430.44318@angie.orcam.me.uk>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <7cea940f-4d9d-2c5e-e2a6-ff3dfba220f5@intel.com>
Date:   Thu, 22 Apr 2021 12:55:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104220029430.44318@angie.orcam.me.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/22/21 7:26 AM, Maciej W. Rozycki wrote:
> On Thu, 22 Apr 2021, kernel test robot wrote:
>
>>     fs/xfs/libxfs/xfs_alloc_btree.c: In function 'xfs_allocbt_free_block':
>>>> arch/mips/include/asm/div64.h:74:3: error: inconsistent operand constraints in an 'asm'
>>        74 |   __asm__("divu $0, %z1, %z2"    \
>>           |   ^~~~~~~
>   Umm, I forgot we do support MIPSr6, unlike microMIPSr6.
>
>   I think this asm can go and GCC will do equally well with plain C code.
> Or actually marginally better, as preliminary benchmarking shows, owing to
> a slightly better instruction scheduling.  Code produced for test_div64 is
> also slightly smaller for some reason.  That's at least for the ISAs up to
> R5, which do have DIVU.  Well, I can't complain.
>
>   For R6 compiled code will work, but separate DIVU and MODU instructions
> will be produced, which are also interlocked, so scalar implementations
> will likely not perform as well as older ISAs with their asynchronous MD
> unit.  Likely still faster then the generic algorithm though.
>
>   Thomas: I'll collect new figures and respin the series.  Please do drop
> the original series then; I think there's no point to fix it up and we'll
> be better by starting afresh.
>
>   Ying: I take it you'll know what to do to get the bot updated.  As it
> happens it uses the old <linux-mips@linux-mips.org> MIPS/Linux mailing
> list address, which has been long deprecated and then stopped working
> altogether mid Jan this year.  I have updated the cc appropriately with
> this reply, but would you please amend whatever the bot requires for
> further notices to be sent to <linux-mips@vger.kernel.org> instead?
>
>    Maciej

Hi Maciej,

Thanks for the advice, we have updated the mailing list.

Best Regards,
Rong Chen

