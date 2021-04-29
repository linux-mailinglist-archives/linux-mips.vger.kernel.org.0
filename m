Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DB836EF48
	for <lists+linux-mips@lfdr.de>; Thu, 29 Apr 2021 20:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241058AbhD2SFV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Apr 2021 14:05:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:52028 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232572AbhD2SFS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Apr 2021 14:05:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lcB1W-00022Q-00; Thu, 29 Apr 2021 20:04:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5E3DCC0D1B; Thu, 29 Apr 2021 20:04:17 +0200 (CEST)
Date:   Thu, 29 Apr 2021 20:04:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, ira.weiny@intel.com,
        yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
Message-ID: <20210429180417.GA10482@alpha.franken.de>
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
 <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
 <20210423145131.GA11112@alpha.franken.de>
 <6d307cf6-0ed5-e9f9-ae1e-8f2e28b23311@wanyeetech.com>
 <20210426131146.bj2r4ha7yy5norxa@ambrosehua-HP-xw6600-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426131146.bj2r4ha7yy5norxa@ambrosehua-HP-xw6600-Workstation>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 26, 2021 at 09:11:47PM +0800, Huang Pei wrote:
> [   40.873779] Cause : 4080800c (ExcCode 03)
> [   40.877775] BadVA : 77e23000
> [   40.880645] PrId  : 00d00100 (Ingenic XBurst)
> [   40.884989] Modules linked in:
> [   40.888034] Process Xsession (pid: 1370, threadinfo=ca5ce8d6,
> task=61c8f3ad, tls=77e28690)
> 
> !!! This is my first time debug MIPS32 kernel, I think both threadinfo
> and task should be at KSEG0, instead of KSEG2 or USEG

don't print pointers with %p they will be garbled for security reasons.

see Documentation/core-api/printk-formats.rst

"A raw pointer value may be printed with %p which will hash the address
before printing."

> [   41.233877] Index: 27 pgmask=4kb va=77e22000 asid=5c
> [   41.233877]  [pa=06a17000 c=3 d=0 v=0 g=0] [pa=2017a000 c=0 d=0 v=0
> g=0]
> 
> !!! TLB entry is loading a SWAP entry(C=0, pa=swap) at BADV, the pte_buddy point to a valid
> PFN(C=3, pa seem ok), but it is impossible, since line 116 must flush the tlb and
> replaced swap entry with new page 
> 
> Am I missing something?

not sure, if I'm on the right track, but with the _PAGE_VALID bit set in
the new pte local_r4k_flush_cache_page() will do

        if ((mm == current->active_mm) && (pte_val(*ptep) & _PAGE_VALID))
                vaddr = NULL;


and then

	vaddr ? r4k_blast_dcache_page(addr) :
                r4k_blast_dcache_user_page(addr);

flush the address directly instead with r4k_blast_dcache_user_page().
But the TLB will be updated after the cache flush (which is correct IMHO). 
So setting the VALID bit too early destroys the logic of flushing
cache aliases. Do you agree ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
