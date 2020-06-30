Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3471A20F2E1
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 12:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732510AbgF3Kmq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 06:42:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35916 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732238AbgF3Kmp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Jun 2020 06:42:45 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH94BF_tegABNAA--.756S3;
        Tue, 30 Jun 2020 18:42:09 +0800 (CST)
Subject: Re: [PATCH 1/3] mm: set page fault address for update_mmu_cache_pmd
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
 <20200630100940.wo5l5fcs44xhrqo7@box>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
From:   maobibo <maobibo@loongson.cn>
Message-ID: <c24d3857-a80d-b39f-c936-e8ac25693b86@loongson.cn>
Date:   Tue, 30 Jun 2020 18:42:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200630100940.wo5l5fcs44xhrqo7@box>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH94BF_tegABNAA--.756S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyfJw1fJr47Xr4DJF4xZwb_yoW7JF4kpF
        97Can8JFsFqrnru3yxXrs0vr1Sv34vqayUKry3KFyFv3Zxtr1F9w1DAw1rAr95Ar18G3WS
        kF4jgFWDuanxZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWr
        Zr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
        1UYxBIdaVFxhVjvjDU0xZFpf9x07beAp5UUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/30/2020 06:09 PM, Kirill A. Shutemov wrote:
> On Wed, Jun 24, 2020 at 05:26:30PM +0800, Bibo Mao wrote:
>> update_mmu_cache_pmd is used to update tlb for the pmd entry by
>> software. On MIPS system, the tlb entry indexed by page fault
>> address maybe exists already, only that tlb entry may be small
>> page, also it may be huge page. Before updating pmd entry with
>> huge page size, older tlb entry need to be invalidated.
>>
>> Here page fault address is passed to function update_mmu_cache_pmd,
>> rather than pmd huge page start address. The page fault address
>> can be used for invalidating older tlb entry.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  arch/mips/include/asm/pgtable.h | 9 +++++++++
>>  mm/huge_memory.c                | 7 ++++---
>>  mm/memory.c                     | 2 +-
>>  3 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
>> index dd7a0f5..bd81661 100644
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -554,11 +554,20 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>>  #define	__HAVE_ARCH_UPDATE_MMU_TLB
>>  #define update_mmu_tlb	update_mmu_cache
>>  
>> +extern void local_flush_tlb_page(struct vm_area_struct *vma,
>> +				unsigned long page);
>>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>>  	unsigned long address, pmd_t *pmdp)
>>  {
>>  	pte_t pte = *(pte_t *)pmdp;
>>  
>> +	/*
>> +	 * If pmd_none is true, older tlb entry will be normal page.
>> +	 * here to invalidate older tlb entry indexed by address
>> +	 * parameter address must be page fault address rather than
>> +	 * start address of pmd huge page
>> +	 */
>> +	local_flush_tlb_page(vma, address);
> 
> Can't say I follow what is going on.
> 
> Why local? What happens on SMP?
> 
> And don't you want to flush PMD_SIZE range around the address?
There exists two conditions:
1. The address is accessed for the first time, there will be one tlb entry with normal page
   size, and privilege for the tlb entry is none. If new tlb entry wants to be added with
   huge page size, the older tlb entry needs to be removed.  Local flushing is enough, if there
   are smp threads running, there will be page fault handing since privilege level is none. During
   page fault handling, the other threads will do the same work, flush local entry, update new entry
   with huge page size.

2. It is not accessed by the first time, there exists old tlb entry with huge page such as COW scenery.
   local_flush_tlb_page is not necessary here, old tlb with huge page will be replace with new tlb
   in function __update_tlb.

For PMD_SIZE range around the address, there exists one tlb entry with huge page size, or one tlb entry
with normal page size and zero privilege. It is impossible that there exists two or more tlb entries
with normal page within PMD_SIZE range, so we do not need flush pmd range size, just flush one tlb entry
is ok.

regards
bibo,mao

> 
>>  	__update_tlb(vma, address, pte);
>>  }
>>  
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 78c84be..0f9187b 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -780,6 +780,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>>  		pgtable_t pgtable)
>>  {
>>  	struct mm_struct *mm = vma->vm_mm;
>> +	unsigned long start = addr & PMD_MASK;
>>  	pmd_t entry;
>>  	spinlock_t *ptl;
>>  
>> @@ -792,7 +793,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>>  			}
>>  			entry = pmd_mkyoung(*pmd);
>>  			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
>> -			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
>> +			if (pmdp_set_access_flags(vma, start, pmd, entry, 1))
>>  				update_mmu_cache_pmd(vma, addr, pmd);
>>  		}
>>  
>> @@ -813,7 +814,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>>  		pgtable = NULL;
>>  	}
>>  
>> -	set_pmd_at(mm, addr, pmd, entry);
>> +	set_pmd_at(mm, start, pmd, entry);
>>  	update_mmu_cache_pmd(vma, addr, pmd);
>>  
>>  out_unlock:
>> @@ -864,7 +865,7 @@ vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
>>  
>>  	track_pfn_insert(vma, &pgprot, pfn);
>>  
>> -	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
>> +	insert_pfn_pmd(vma, vmf->address, vmf->pmd, pfn, pgprot, write, pgtable);
>>  	return VM_FAULT_NOPAGE;
>>  }
>>  EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd_prot);
>> diff --git a/mm/memory.c b/mm/memory.c
>> index dc7f354..c703458 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3592,7 +3592,7 @@ static vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>>  
>>  	set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
>>  
>> -	update_mmu_cache_pmd(vma, haddr, vmf->pmd);
>> +	update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
>>  
>>  	/* fault is handled */
>>  	ret = 0;
>> -- 
>> 1.8.3.1
>>
>>
> 

