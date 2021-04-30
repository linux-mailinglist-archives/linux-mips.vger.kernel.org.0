Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9866E36F3EE
	for <lists+linux-mips@lfdr.de>; Fri, 30 Apr 2021 04:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhD3CIt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Apr 2021 22:08:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50618 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229577AbhD3CIs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Apr 2021 22:08:48 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [222.209.11.9])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8tlZotgqtgPAA--.11939S2;
        Fri, 30 Apr 2021 10:07:36 +0800 (CST)
Date:   Fri, 30 Apr 2021 10:07:33 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, ira.weiny@intel.com,
        yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
Message-ID: <20210430020733.zc3re4dwni24xxsn@ambrosehua-HP-xw6600-Workstation>
References: <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
 <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
 <20210423145131.GA11112@alpha.franken.de>
 <6d307cf6-0ed5-e9f9-ae1e-8f2e28b23311@wanyeetech.com>
 <20210426131146.bj2r4ha7yy5norxa@ambrosehua-HP-xw6600-Workstation>
 <20210429180417.GA10482@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429180417.GA10482@alpha.franken.de>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9Dxj8tlZotgqtgPAA--.11939S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZryxXr1Dtw1rtw1UurykZrb_yoW5Cw17pF
        W3KanrAws7Xr109rnrAr1DJr1rG3s8ZF4xCr90qw1S9345Zr1YvFy3KF18Xryqk3y5Za1a
        9FWjkrn8ZF98C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUO_MaUUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 29, 2021 at 08:04:17PM +0200, Thomas Bogendoerfer wrote:
> On Mon, Apr 26, 2021 at 09:11:47PM +0800, Huang Pei wrote:
> > [   40.873779] Cause : 4080800c (ExcCode 03)
> > [   40.877775] BadVA : 77e23000
> > [   40.880645] PrId  : 00d00100 (Ingenic XBurst)
> > [   40.884989] Modules linked in:
> > [   40.888034] Process Xsession (pid: 1370, threadinfo=ca5ce8d6,
> > task=61c8f3ad, tls=77e28690)
> > 
> > !!! This is my first time debug MIPS32 kernel, I think both threadinfo
> > and task should be at KSEG0, instead of KSEG2 or USEG
> 
> don't print pointers with %p they will be garbled for security reasons.
> 
> see Documentation/core-api/printk-formats.rst
> 
> "A raw pointer value may be printed with %p which will hash the address
> before printing."
> 
> > [   41.233877] Index: 27 pgmask=4kb va=77e22000 asid=5c
> > [   41.233877]  [pa=06a17000 c=3 d=0 v=0 g=0] [pa=2017a000 c=0 d=0 v=0
> > g=0]
> > 
> > !!! TLB entry is loading a SWAP entry(C=0, pa=swap) at BADV, the pte_buddy point to a valid
> > PFN(C=3, pa seem ok), but it is impossible, since line 116 must flush the tlb and
> > replaced swap entry with new page 
> > 
My mistake, line 116(aka set_pte_at) flush ONLY cache (__update_cache)
instead of tlb, so it is ok that the we saw it since this is how page
swap in began with.

the CP0 EPC indicate a "cache 0x15 0x77e23000" trigger it, with my patch
applyed, the PTE is set young,

> > Am I missing something?
> 
> not sure, if I'm on the right track, but with the _PAGE_VALID bit set in
> the new pte local_r4k_flush_cache_page() will do
> 
>         if ((mm == current->active_mm) && (pte_val(*ptep) & _PAGE_VALID))
>                 vaddr = NULL;
> 

without my patch, go through the "else" branch with kmap*

-------------
	else {
		/*
		 * Use kmap_coherent or kmap_atomic to do flushes for
		 * another ASID than the current one.
		 */
		map_coherent = (cpu_has_dc_aliases &&
				page_mapcount(page) &&
				!Page_dcache_dirty(page));
		if (map_coherent)
			vaddr = kmap_coherent(page, addr);
		else
			vaddr = kmap_atomic(page);
		addr = (unsigned long)vaddr;
	}
--------------
Obviously, flush_cache_page with kmaped address would not cause TLB Invalid
Exception, while fulsh_cache_page with original address would cause TLB
invalid exception since the new PTE with V|Y set does not take effect in TLB


In short, the TLB is stale with SWAP entry and _PAGE_VALID clear. 

+. with my patch, then flush_cache_page believe the _PAGE_VALID set in TLB
because it  detect the PTE is young, so trigger the TLB Store Invalid exception.

+. without my patch, the flush_cache_page knew the PTE is old, so use
the kmapped address to flush cache, which is in accord with the page
copy before.

my fix to this is flush tlb, any idea?
> 
> and then
> 
> 	vaddr ? r4k_blast_dcache_page(addr) :
>                 r4k_blast_dcache_user_page(addr);
> 
> flush the address directly instead with r4k_blast_dcache_user_page().
> But the TLB will be updated after the cache flush (which is correct IMHO). 
> So setting the VALID bit too early destroys the logic of flushing
> cache aliases. Do you agree ?
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

