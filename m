Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3260E1DE266
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 10:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgEVItS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 04:49:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47412 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728152AbgEVItS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 04:49:18 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2nskcdex8U3AA--.97S3;
        Fri, 22 May 2020 16:48:45 +0800 (CST)
Subject: Re: [PATCH v5 2/4] mm/memory.c: Update local TLB if PTE entry exists
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1590031837-9582-1-git-send-email-maobibo@loongson.cn>
 <1590031837-9582-2-git-send-email-maobibo@loongson.cn>
 <20200521122211.7450025a41865a67df6a7303@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <a04b7a67-6e1c-9568-a23e-f033191b5d32@loongson.cn>
Date:   Fri, 22 May 2020 16:48:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200521122211.7450025a41865a67df6a7303@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxf2nskcdex8U3AA--.97S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWryfKr1rGrWUGF4kCF13twb_yoW5GrWDpF
        W2ka1fJF4vgryxCF4xXw1jvF4fZ34rKF4DJryFkr90k390gw4SyryUJ3y8Zry5Cwn3ta12
        vF4jgFZ5WayDZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
        Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x07b5sjbUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/22/2020 03:22 AM, Andrew Morton wrote:
> On Thu, 21 May 2020 11:30:35 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> If two threads concurrently fault at the same address, the thread that
>> won the race updates the PTE and its local TLB. For now, the other
>> thread gives up, simply does nothing, and continues.
>>
>> It could happen that this second thread triggers another fault, whereby
>> it only updates its local TLB while handling the fault. Instead of
>> triggering another fault, let's directly update the local TLB of the
>> second thread.
>>
>> It is only useful to architectures where software can update TLB, it may
>> bring out some negative effect if update_mmu_cache is used for other
>> purpose also. It seldom happens where multiple threads access the same
>> page at the same time, so the negative effect is limited on other arches.
>>
>> With specjvm2008 workload, smp-race pgfault counts is about 3% to 4%
>> of the total pgfault counts by watching /proc/vmstats information
>>
> 
> I'm sorry to keep thrashing this for so long, but I'd really prefer not
> to add any overhead to architectures which don't need it.  However,
> we're getting somewhere!
> 
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2436,10 +2436,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
>>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>>  			/*
>>  			 * Other thread has already handled the fault
>> -			 * and we don't need to do anything. If it's
>> -			 * not the case, the fault will be triggered
>> -			 * again on the same address.
>> +			 * and update local tlb only
>>  			 */
>> +			update_mmu_cache(vma, addr, vmf->pte);
> 
> Now, all the patch does is to add new calls to update_mmu_cache().
> 
> So can we replace all these with a call to a new
> update_mmu_cache_sw_tlb() (or whatever) which is a no-op on
> architectures which don't need the additional call?
> 
> Also, I wonder about the long-term maintainability.  People who
> regularly work on this code won't be thinking of this MIPS peculiarity
> and it's likely that any new calls to update_mmu_cache_sw_tlb() won't
> be added where they should have been.  Hopefully copy-and-paste from
> the existing code will serve us well.  Please do ensure that the
> update_mmu_cache_sw_tlb() implementation is carefully commented so
> that people can understand where they should (and shouldn't) include
> this call.
Well, I will do that. MIPS is actually somewhat different with generic
architectures, and old MIPS system does not support hardware page walk,
it requires software to update TLB entry.

regards
bibo, mao

 

