Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7493675B0
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 01:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhDUX1C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 19:27:02 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:39410 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbhDUX1C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 21 Apr 2021 19:27:02 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 86D5692009C; Thu, 22 Apr 2021 01:26:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7822B92009B;
        Thu, 22 Apr 2021 01:26:26 +0200 (CEST)
Date:   Thu, 22 Apr 2021 01:26:26 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     "Huang, Ying" <ying.huang@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kernel test robot <lkp@intel.com>
cc:     kbuild-all@lists.01.org, linux-mips@vger.kernel.org
Subject: Re: [mips-linux:mips-next 98/101] arch/mips/include/asm/div64.h:74:3:
 error: inconsistent operand constraints in an 'asm'
In-Reply-To: <202104220420.qh7kOCR1-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2104220029430.44318@angie.orcam.me.uk>
References: <202104220420.qh7kOCR1-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 22 Apr 2021, kernel test robot wrote:

>    fs/xfs/libxfs/xfs_alloc_btree.c: In function 'xfs_allocbt_free_block':
> >> arch/mips/include/asm/div64.h:74:3: error: inconsistent operand constraints in an 'asm'
>       74 |   __asm__("divu $0, %z1, %z2"    \
>          |   ^~~~~~~

 Umm, I forgot we do support MIPSr6, unlike microMIPSr6.

 I think this asm can go and GCC will do equally well with plain C code.
Or actually marginally better, as preliminary benchmarking shows, owing to 
a slightly better instruction scheduling.  Code produced for test_div64 is 
also slightly smaller for some reason.  That's at least for the ISAs up to 
R5, which do have DIVU.  Well, I can't complain.

 For R6 compiled code will work, but separate DIVU and MODU instructions 
will be produced, which are also interlocked, so scalar implementations 
will likely not perform as well as older ISAs with their asynchronous MD 
unit.  Likely still faster then the generic algorithm though.

 Thomas: I'll collect new figures and respin the series.  Please do drop 
the original series then; I think there's no point to fix it up and we'll 
be better by starting afresh.

 Ying: I take it you'll know what to do to get the bot updated.  As it 
happens it uses the old <linux-mips@linux-mips.org> MIPS/Linux mailing 
list address, which has been long deprecated and then stopped working 
altogether mid Jan this year.  I have updated the cc appropriately with 
this reply, but would you please amend whatever the bot requires for 
further notices to be sent to <linux-mips@vger.kernel.org> instead?

  Maciej
