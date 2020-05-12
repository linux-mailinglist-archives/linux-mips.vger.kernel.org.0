Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465211D2266
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731690AbgEMWzH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:55:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28323 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731276AbgEMWzH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:55:07 -0400
IronPort-SDR: dxK+kVruO6R7RzTbFz8FhMQNlLMG2DNSQgr8xk1vrYGHuVKOEKizgwgiJqA24gE5stI2LTAShZ
 eSEWPRNOVz8yB1gPWBDFZOVi2/7OA0dBALodQihKS7AIBg1MDDIofLF7bMHVd2IITtc/NvbvK2
 /5ocJFjyIa9l/cT0b7ISkanckDjbaZqRCt+jYONcxchfibChof1J/T/XPIcJonDFLKpkE9dmbw
 x4SDHuyIQG9WwIoT2poXHvO8N0jKJ13391BX3gKmoXdt2kbNv8EE+53FzaBje/osIlDZuyKPFo
 ZaQ=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137958561"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:55:07 +0800
IronPort-SDR: v2It7tWcty9NvlnDZ9sfk6nVZyG0FhiNPnqP/OTWNfjIXjOe+2VuUBhsWj8pRrCQBRZpv1fTSs
 M6jci1+TnwofBT9enP5f+Z7hqT/Llwbsk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:44:46 -0700
IronPort-SDR: jlZ5A1kriLxb8dNClmXUI2YsaQQqlTCvZUVo3fj6doq0sXhvX/zkMW6mx2hGkv+0/zw8FAXdDl
 sLnzsUP/Taeg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:55:06 -0700
Date:   Wed, 13 May 2020 00:52:50 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various
 build failures
In-Reply-To: <20200509152501.GA9125@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2005130036060.677301@eddie.linux-mips.org>
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com> <20200508130149.GA14297@alpha.franken.de> <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com> <20200509152501.GA9125@alpha.franken.de>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:45:46 +0100 (BST)
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid
 various build failures
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132345460.1120869@eddie.linux-mips.org>
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 9 May 2020, Thomas Bogendoerfer wrote:

> > > > Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
> > > > inst.h") causes a lot of build failures because macros in asm.h conflict
> > > > with various subsystems. Some of these conflictions has been fixed (such
> > > > as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
> > > > impossible to fix (such as PTR and END). The only reason of including
> > > > asm.h in inst.h is that we need the PTR macro which is used by unaligned
> > > > load/store helpers. So in this patch we define a new PTR_STR macro and
> > > > use it to replace STR(PTR), then we can stop including asm.h to avoid
> > > > various build failures.
> > > >
> > > > Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > > ---
> > > >  arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------
> > >
> > > applied to mips-next. /me hopes this is the last fix... thanks
> > I think this is the last fix... and, does "MIPS: asm: Rename some
> > macros to avoid build errors" need to be reverted?
> 
> let's keep it as it is now.

 Sigh, this just shows how the original change was wrong in the first 
place.  Why was <asm/inst.h> specifically chosen, whose purpose has been 
machine code generators/interpreters that has nothing to do with unaligned 
access helpers, over a more suitable location, such as (maybe obviously?) 
<asm/unaligned.h>?

 I suggest that we roll back to before the destruction, move the necessary 
bits away from <asm/inst.h>, and then perhaps none of the follow-up hacks 
will be required.

  Maciej


