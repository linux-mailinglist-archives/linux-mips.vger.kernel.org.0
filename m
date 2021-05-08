Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADEC3770BA
	for <lists+linux-mips@lfdr.de>; Sat,  8 May 2021 10:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhEHIta (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 May 2021 04:49:30 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:54163 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEHIt3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 May 2021 04:49:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08013953|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.188552-0.00134615-0.810102;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.KA9gS6I_1620463704;
Received: from 192.168.88.129(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KA9gS6I_1620463704)
          by smtp.aliyun-inc.com(10.147.40.26);
          Sat, 08 May 2021 16:48:26 +0800
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huang Pei <huangpei@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, ira.weiny@intel.com,
        yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
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
 <20210429180417.GA10482@alpha.franken.de>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <852b2950-fa4e-40cb-c18a-be8c3f8aa6e0@wanyeetech.com>
Date:   Sat, 8 May 2021 16:48:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210429180417.GA10482@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2021/4/30 上午2:04, Thomas Bogendoerfer wrote:
> On Mon, Apr 26, 2021 at 09:11:47PM +0800, Huang Pei wrote:
>> [   40.873779] Cause : 4080800c (ExcCode 03)
>> [   40.877775] BadVA : 77e23000
>> [   40.880645] PrId  : 00d00100 (Ingenic XBurst)
>> [   40.884989] Modules linked in:
>> [   40.888034] Process Xsession (pid: 1370, threadinfo=ca5ce8d6,
>> task=61c8f3ad, tls=77e28690)
>>
>> !!! This is my first time debug MIPS32 kernel, I think both threadinfo
>> and task should be at KSEG0, instead of KSEG2 or USEG
> don't print pointers with %p they will be garbled for security reasons.
>
> see Documentation/core-api/printk-formats.rst
>
> "A raw pointer value may be printed with %p which will hash the address
> before printing."
>
>> [   41.233877] Index: 27 pgmask=4kb va=77e22000 asid=5c
>> [   41.233877]  [pa=06a17000 c=3 d=0 v=0 g=0] [pa=2017a000 c=0 d=0 v=0
>> g=0]
>>
>> !!! TLB entry is loading a SWAP entry(C=0, pa=swap) at BADV, the pte_buddy point to a valid
>> PFN(C=3, pa seem ok), but it is impossible, since line 116 must flush the tlb and
>> replaced swap entry with new page
>>
>> Am I missing something?
> not sure, if I'm on the right track, but with the _PAGE_VALID bit set in
> the new pte local_r4k_flush_cache_page() will do
>
>          if ((mm == current->active_mm) && (pte_val(*ptep) & _PAGE_VALID))
>                  vaddr = NULL;
>
>
> and then
>
> 	vaddr ? r4k_blast_dcache_page(addr) :
>                  r4k_blast_dcache_user_page(addr);
>
> flush the address directly instead with r4k_blast_dcache_user_page().
> But the TLB will be updated after the cache flush (which is correct IMHO).
> So setting the VALID bit too early destroys the logic of flushing
> cache aliases. Do you agree ?


I think it is indeed the problem here.

After I tried to drop the _PAGE_VALID mark in the PVA (change it to 
"#define PVA(p) PM(_PAGE_ACCESSED | (p))"), the kernel no longer panic.


Thanks and best regards!


>
> Thomas.
>
